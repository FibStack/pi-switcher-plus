/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/

#include <xc.h>
#include <stddef.h>
#include "output.h"

uint8_t output_devices[OUTPUT_DEVICES][2] = {
	{'B', PIN3_bm},
	{'A', PIN3_bm},
	{'A', PIN2_bm},
	{'A', PIN1_bm}};

	void output_init()
	{
		// Pull-up unconnected pin
		PORTB.PIN2CTRL = PORT_PULLUPEN_bm;
		
		// Set up the direction
		PORTA.DIR |= PIN1_bm;
		PORTA.DIR |= PIN2_bm;
		PORTA.DIR |= PIN3_bm;
		PORTB.DIR |= PIN3_bm;
	}

	uint8_t output_set(uint8_t device_id, uint8_t value)
	{
		uint8_t result = 0xFF;
		if(device_id < OUTPUT_DEVICES)
		{
			PORT_t* port = NULL;
			if(output_devices[device_id][0] == 'A')
			{
				port = &PORTA;
			}
			else if(output_devices[device_id][0] == 'B')
			{
				port = &PORTB;
			}
			
			if(port)
			{
				if(value == 0)
				{
					// Turn OFF
					port->OUT &= ~output_devices[device_id][1];
					result = 0;
				}
				else if (value == 1)
				{
					// Turn ON
					port->OUT |= output_devices[device_id][1];
					result = 0;
				}
			}
			
		}
		return result;
	}

	uint8_t output_get(uint8_t device_id)
	{
		uint8_t result = 0xFF;
		if(device_id < OUTPUT_DEVICES)
		{
			if(output_devices[device_id][0] == 'A')
			{
				result = PORTA.OUT & output_devices[device_id][1];
			}
			else if(output_devices[device_id][0] == 'B')
			{
				result = PORTB.OUT & output_devices[device_id][1];
			}
		}
		return result;
	}
