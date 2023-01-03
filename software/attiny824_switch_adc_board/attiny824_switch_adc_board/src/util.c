/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/
#include <xc.h>
#include <stdlib.h>
#include <string.h>
#include "util.h"

/************************************************************************/
/* string to positive number                                            */
/************************************************************************/
short str2pos_num(char *str)
{
	short result = -1;
	
	if(str != NULL) {
		short len = strlen(str);
		short i;
		result = 0;
		for(i = 0; i < len; i++){
			
			if(str[i] >= '0' && str[i] <= '9') {
				result = result * 10 + (str[i] - '0');
			}
			else
			{
				result = -1;
				break;
			}
		}
	}

	return result;
}

/************************************************************************/
/* number to string                                                     */
/************************************************************************/
char* num2str(uint16_t value)
{
	// the max value of uint16_t has 5 digits, last character is null termination
	char *str_value = malloc(sizeof(char)*MAX_STR_NUM_SIZE);
	memset(str_value, '\0', MAX_STR_NUM_SIZE);
	str_value[0] = '0'; // Initialize with zero to now show empty data
	uint8_t length = 0;
	
	while(value > 0)
	{
		uint8_t digit = value % 10;
		value = value / 10;
		uint8_t i;
		// shift existing characters to the right
		if(length > 0) {
			for(i = length; i > 0; i--)
			{
				str_value[i] = str_value[i-1];
			}
		}
		str_value[0] = '0' + digit;
		length++;
	}
		
	return str_value;
}
