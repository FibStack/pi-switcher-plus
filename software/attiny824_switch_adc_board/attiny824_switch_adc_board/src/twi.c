/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/

#include <xc.h>
#include <string.h>
#include "twi.h"

char read_buffer[TWI_BUFFER_SIZE];
char write_buffer[TWI_BUFFER_SIZE];

uint8_t bytes_read = 0;
uint8_t bytes_written = 0;

void TWI0_init(uint8_t address)
{
	TWI0.SADDR = address << 1; // Set the slave address
	TWI0.SCTRLA = TWI_DIEN_bm // Data Interrupt Enable
	| TWI_APIEN_bm // Address or Stop Interrupt Enable
	| TWI_PIEN_bm // Enable Stop Interrupt
	| TWI_ENABLE_bm; // TWI0 Module Enable
	
	// Initialize buffers with 0
	memset(read_buffer, '\0', TWI_BUFFER_SIZE);
	memset(write_buffer, '\0', TWI_BUFFER_SIZE);
}

void TWI0_set_address(uint8_t address)
{
	TWI0.SADDR = address << 1; // Set the slave address
}

void TWI0_process_interrupt()
{
	if(TWI0.SSTATUS & TWI_APIF_bm) // Address match/stop interrupt
	{
		if(TWI0.SSTATUS & TWI_COLL_bm)
		{
			TWI0.SSTATUS |= TWI_COLL_bm; // Clear Collision flag
			TWI0.SCTRLB = TWI_SCMD_COMPTRANS_gc; // Complete transaction
			return;
		}
		
		if(TWI0.SSTATUS & TWI_AP_bm)
		{
			TWI0.SCTRLB = TWI_SCMD_RESPONSE_gc; // send ACK after address match
		}
		else
		{
			TWI0.SCTRLB = TWI_SCMD_COMPTRANS_gc; // complete transaction after Stop
			bytes_read = 0;
			bytes_written = 0;
		}
	}
	
	if(TWI0.SSTATUS & TWI_DIF_bm) // data interrupt
	{
		if(TWI0.SSTATUS & TWI_DIR_bm)
		{
			// Transmit data to Master
			if(bytes_written < TWI_BUFFER_SIZE)
			{
				uint8_t data = write_buffer[bytes_written];
				TWI0.SDATA = data;
				bytes_written++;
				TWI0.SCTRLB = TWI_SCMD_RESPONSE_gc; // Send ACK, wait for another interrupt
			}
			else
			{
				TWI0.SCTRLB = TWI_SCMD_COMPTRANS_gc;  // Transaction complete
			}
		}
		else
		{
			// Receive data from Master
			if(bytes_read < TWI_BUFFER_SIZE)
			{
				uint8_t data = TWI0.SDATA;
				read_buffer[bytes_read] = data;
				if(data == 0x00) {
					TWI0_process_command();
					bytes_read = 0;
				}
				bytes_read++;
				TWI0.SCTRLB = TWI_SCMD_RESPONSE_gc; // Send ACK, data received, wait for another interrupt
			}
			else
			{
				TWI0.SCTRLB = TWI_SCMD_COMPTRANS_gc;  // Transaction complete
			}
			
		}
	}
}
