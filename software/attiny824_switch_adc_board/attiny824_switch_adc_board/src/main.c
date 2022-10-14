/*
* main.c
* Copyright (C) 2021, Fibstack LLC. All rights reserved.
* Unauthorized copying of this file, via any medium is strictly prohibited.
* Proprietary and confidential.
*
* Created: 3/6/2021 5:35:54 PM
* Author: alexandru.botnaru
*/

#include <xc.h>
#include <stdlib.h>
#include <string.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>
#include "util.h"
#include "twi.h"
#include "output.h"
#include "adc.h"

#define RESPONSE_INVALID "INVALID"
#define RESPONSE_OK "OK"
#define RESPONSE_ON "1"
#define RESPONSE_OFF "0"
#define RESPONSE_ERROR "ERROR"
#define TOTAL_DEVICES 8

// The part before the "_" character identifies the hardware design version, the last four characters identifies the software version.
// First two digits for the major version, and second two digits for the minor version. 
// The micro version is not included since it should contain only bug fixes and not break the old functionality.
#define RESPONSE_VERSION "FBSWP01_0101"

uint8_t EEMEM eeprom_twi_address = 0x50;

void set_twi_address(uint8_t new_address);
void process_set_address();
void set_response(char *response);
void process_get_status();
void process_get();
void process_set();

ISR(ADC0_RESRDY_vect)
{
	ADC0_process();
}

ISR(TWI0_TWIS_vect)
{
	TWI0_process_interrupt();
}

int main(void)
{
	uint8_t twi_address = eeprom_read_byte(&eeprom_twi_address);
	TWI0_init(twi_address);
	output_init();
	ADC0_init();
	sei(); // Enable Global Interrupts
	
	ADC0_start(); // Start ADC conversion to have the data ready
	
	while(1)
	{
		// wait for interrupts
	}
}

void TWI0_process_command()
{
	if(bytes_read > 0)
	{
		char *token = strtok(read_buffer, ":");
		
		
		if(strcmp("setaddr", token) == 0)
		{
			// function: setaddr
			// Sets the board I2C address
			// Format: setaddr:<new_address_value>
			process_set_address();
		}
		else if(strcmp("version", token) == 0)
		{
			// function: version
			// Returns the device version
			// Format: version
			set_response(RESPONSE_VERSION);
		}
		else if(strcmp("status", token) == 0)
		{
			// function: status
			// Returns the data from all devices
			// Format: status
			process_get_status();
		}
		else if(strcmp("get", token) == 0)
		{
			// function: get
			// Returns the data value for the specified device
			// Format: get:<device_id>
			process_get();
		}
		else if (strcmp("set", token) == 0)
		{
			// function: set
			// Set the data for the specified device
			// Format: set:<device_id>:<value>
			process_set();
		}
		else
		{
			set_response(RESPONSE_INVALID);
		}
	}
	
}

void process_set_address()
{
	char *param_token = strtok(NULL, ":");
	short param = str2pos_num(param_token);
	if(param > 2 && param < 120) {
		set_twi_address((uint8_t)param);
		// Clear the buffer, address was changed.
		memset(write_buffer, '\0', TWI_BUFFER_SIZE);
	}
	else
	{
		set_response(RESPONSE_INVALID);
	}
}

void set_response(char *response)
{
	memset(write_buffer, '\0', TWI_BUFFER_SIZE); // clear the buffer
	strcpy(write_buffer, response); // set new text
}

void set_twi_address(uint8_t twi_address)
{
	cli();
	eeprom_update_byte(&eeprom_twi_address, twi_address);
	TWI0_set_address(twi_address);
	sei();
	ADC0_start(); // Start the ADC again
}

void process_get_status()
{
	uint8_t i;
	uint8_t length = 0;
	memset(write_buffer, '\0', TWI_BUFFER_SIZE); // clear the buffer
	
	// Get output devices status
	for(i = 0; i < OUTPUT_DEVICES; i++)
	{
		uint8_t result = output_get(i);
		if(result > 0)
		{
			result = 1;
		}
		write_buffer[length] = '0' + result;
		write_buffer[length + 1] = ':';
		length += 2;
	}

	// Get ADC devices status
	for(i = 0; i < ADC_CHANNELS; i++)
	{
		char *adc_value = num2str(adc_result[i]);
		uint8_t adc_value_len = strlen(adc_value);
		uint8_t j;
		for(j = 0; j < adc_value_len; j++)
		{
			write_buffer[length] = adc_value[j];
			length++;
		}
		if(i < ADC_CHANNELS - 1)
		{
			write_buffer[length] = ':';
			length++;
		}
		free(adc_value);
	}
}

void process_get()
{
	char *device_id_token = strtok(NULL, ":");
	short device_id = str2pos_num(device_id_token);
	
	
	if(device_id > -1 && device_id < TOTAL_DEVICES)
	{
		if(device_id < OUTPUT_DEVICES)
		{
			// Get Relay Switch status
			uint8_t result = output_get(device_id);
			if(result == 0)
			{
				set_response(RESPONSE_OFF);
			}
			else if (result == output_devices[device_id][1])
			{
				set_response(RESPONSE_ON);
			}
			else
			{
				set_response(RESPONSE_ERROR);
			}
		}
		else
		{
			// Get ADC value
			char *adc_value = num2str(adc_result[ADC_CHANNELS - device_id]);
			set_response(adc_value);
			// This memory space is not managed, clean it up
			free(adc_value);
		}
	}
	else
	{
		set_response(RESPONSE_INVALID);
	}
}

void process_set()
{
	char *device_id_token = strtok(NULL, ":");
	char *value_token = strtok(NULL, ":");
	short device_id = str2pos_num(device_id_token);
	short value = str2pos_num(value_token);
	
	if(device_id > -1 && device_id < OUTPUT_DEVICES && (value == 0 || value == 1))
	{
		if(output_set(device_id, value) == 0)
		{
			set_response(RESPONSE_OK);
		}
		else
		{
			set_response(RESPONSE_ERROR);
		}
	}
	else
	{
		set_response(RESPONSE_INVALID);
	}
}
