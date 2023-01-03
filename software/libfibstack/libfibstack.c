/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <ctype.h>
#include "fibstack.h"
#include "i2clib.h"

static int FBSWP01_devices_descriptor_indexes[] = {0, 0, 0, 0, 1, 1, 1, 1};

struct fibstack_board_description
{
    int hardware_int_version;
    char *hardware_string_version;
    int devices;
    int *devices_descriptor_indexes;
    char *description;
};

static struct fibstack_board_description BOARD_DESCRIPTIONS[] = {
    {0, "FBSWP01", 8, FBSWP01_devices_descriptor_indexes, "FibStack PiSwitcher Plus. Four relay switches and four 12-bit ADC converters."}
    };

struct fibstack_device_description
{
    int index;
    bool is_read_only;
    enum fibstack_value_type value_type;
    char *description;
};

static struct fibstack_device_description DEVICE_DESCRIPTIONS[] = {
    {0, false, BOOLEAN_TYPE, "Relay Switch"},
    {1, true, INTEGER_TYPE, "12-bit ADC Converter"}
    };

struct fibstack_context
{
    int board_number;
    struct fibstack_board *boards;
};

struct fibstack_board
{
    int address;
    int device_number;
    int hardware_version;
    struct fibstack_device *devices;
};

struct fibstack_device
{
    int id;
    int description_index;
    bool is_read_only;
    enum fibstack_value_type value_type;
    bool boolean_value;
    int int_value;
};

bool starts_with(const char *string, const char *prefix);

int str2int(char *string);

void free_context_boards(struct fibstack_context *context);

struct fibstack_context *fibstack_context_new()
{
    struct fibstack_context *context = (struct fibstack_context *)calloc(1, sizeof(struct fibstack_context));
    context->board_number = 0;
    context->boards = NULL;
    fibstack_context_update(context);
    return context;
}

void fibstack_context_free(struct fibstack_context *context)
{
    if (context)
    {
        free_context_boards(context);
        free(context);
        context = NULL;
    }
}

int fibstack_context_update(struct fibstack_context *context)
{
    int addresses[128]; // Supporting only 7 bits i2c addresses for now
    int devices_found = 0;
    int scan_address;

    // Look for available addresses
    for (scan_address = I2C_ADDRESS_MIN; scan_address <= I2C_ADDRESS_MAX; scan_address++)
    {
        char *result = send_get_data(scan_address, "version", false);
        // Here check all supported FibStack boards.
        if (starts_with(result, "FBSWP01"))
        {
            addresses[devices_found] = scan_address;
            devices_found++;
        }
    }

    free_context_boards(context);
    context->board_number = devices_found;
    context->boards = (struct fibstack_board *)calloc(devices_found, sizeof(struct fibstack_board));
    for (int i = 0; i < devices_found; i++)
    {
        context->boards[i].address = addresses[i];
        fibstack_board_update(&context->boards[i]);
    }
    
    return 0;
}

int fibstack_context_get_board_number(struct fibstack_context *context)
{
    int result = -1;
    if (context)
    {
        result = context->board_number;
    }
    return result;
}

struct fibstack_board *fibstack_context_get_board_by_index(struct fibstack_context *context, int board_index)
{
    struct fibstack_board *board = NULL;

    if (context && board_index >= 0 && board_index < context->board_number)
    {
        board = &context->boards[board_index];
    }

    return board;
}

struct fibstack_board *fibstack_context_get_board_by_address(struct fibstack_context *context, int board_address)
{
    struct fibstack_board *board = NULL;

    if (context && board_address >= I2C_ADDRESS_MIN && board_address < I2C_ADDRESS_MAX)
    {
        for(int i = 0; i < context->board_number; i++)
        {
            if (board_address == context->boards[i].address) 
            {
                board = &context->boards[i];
                break;
            }
        }
    }

    return board;
}

int fibstack_board_update(struct fibstack_board *board)
{
    int result = -1;
    if (board)
    {
        char *board_version = send_get_data(board->address, "version", false);
        char *board_status = send_get_data(board->address, "status", false);
        
        if (starts_with(board_version, "FBSWP01"))
        {
            board->hardware_version = 0;
            struct fibstack_board_description board_descriptor = BOARD_DESCRIPTIONS[board->hardware_version];
            // FibStack PiSwitcher Plus board with ADC - has 8 devices.
            if (!board->devices)
            {
                board->device_number = board_descriptor.devices;
                board->devices = (struct fibstack_device *)calloc(board_descriptor.devices, sizeof(struct fibstack_device));
            }

            // Process values
            int values[8] = {0};
            int value_index = 0;
            char *token = strtok(board_status, ":");
            do
            {
                values[value_index] = str2int(token);
                token = strtok(NULL, ":");
                value_index++;
            } while (value_index < 8 && token != NULL);
            
            for (int device_id = 0; device_id < board->device_number; device_id++)
            {
                int descriptor_index = board_descriptor.devices_descriptor_indexes[device_id];
                struct fibstack_device_description device_descriptor = DEVICE_DESCRIPTIONS[descriptor_index];
                
                board->devices[device_id].id = device_id;
                board->devices[device_id].description_index = descriptor_index;
                board->devices[device_id].is_read_only = device_descriptor.is_read_only;
                board->devices[device_id].value_type = device_descriptor.value_type;
                
                if(device_descriptor.value_type == BOOLEAN_TYPE)
                {
                    if (values[device_id] == 1)
                    {
                        board->devices[device_id].boolean_value = true;
                    }
                    else
                    {
                        board->devices[device_id].boolean_value = false;
                    }
                }
                else
                {
                    board->devices[device_id].int_value = values[device_id];
                }
            }

            result = 1;
        }
    }
    return result;
}

char *fibstack_board_get_description(struct fibstack_board *board)
{
    char *result = "Unknown device";
    if(board && board->hardware_version > -1)
    {
        result = BOARD_DESCRIPTIONS[board->hardware_version].description;
    }
    return result;
}

int fibstack_board_get_address(struct fibstack_board *board)
{
    int address = -1;
    if (board)
    {
        address = board->address;
    }
    return address;
}

int fibstack_board_set_address(struct fibstack_board *board, int new_address)
{
    int result = -1;
    if (board && new_address > I2C_ADDRESS_MIN && new_address < I2C_ADDRESS_MAX)
    {
        // Only if board and new address are valid values
        char *response;
        char *message = (char *)malloc(16 * sizeof(char));
        sprintf(message, "setaddr:%d", new_address);
        response = send_get_data(board->address, message, false);
        if (strcmp(response, RESPONSE_INVALID) != 0)
        {
            // address got changed
            board->address = new_address;
            result = new_address;
        }
    }
    return result;
}

int fibstack_board_get_device_number(struct fibstack_board *board)
{
    int device_number = -1;
    if (board)
    {
        device_number = board->device_number;
    }
    return device_number;
}

char *fibstack_board_get_device_description(struct fibstack_board *board, int device_id)
{
    char *result = "Unknown device";
    if(board 
        && device_id >= 0 
        && device_id < board->device_number) 
    {
        result = DEVICE_DESCRIPTIONS[board->devices[device_id].description_index].description;
    }
    return result;
}

bool fibstack_board_is_device_read_only(struct fibstack_board *board, int device_id)
{
    bool result = false;
    if(board 
        && device_id >= 0 
        && device_id < board->device_number) 
    {
        result = board->devices[device_id].is_read_only;
    }
    return result;
}

enum fibstack_value_type fibstack_board_get_device_value_type(struct fibstack_board *board, int device_id)
{
    enum fibstack_value_type result = UNKNOWN_TYPE;
    if(board 
        && device_id >= 0 
        && device_id < board->device_number)
    {
        result = board->devices[device_id].value_type;
    }
    return result;
}

bool fibstack_board_get_boolean(struct fibstack_board *board, int device_index)
{
    bool result = false;
    if(board 
        && device_index >= 0 
        && device_index < board->device_number 
        && board->devices[device_index].value_type == BOOLEAN_TYPE) 
    {
        result = board->devices[device_index].boolean_value;
    }
    return result;
}

int fibstack_board_set_boolean(struct fibstack_board *board, int device_index, bool new_value)
{
    int result = -1;
    if(board 
        && device_index >= 0 
        && device_index < board->device_number 
        && !board->devices[device_index].is_read_only
        && board->devices[device_index].value_type == BOOLEAN_TYPE) 
    {
        char *response;
        int numeric_value = new_value ? 1 : 0;
        char *message = (char *)malloc(16 * sizeof(char));
        sprintf(message, "set:%d:%d", board->devices[device_index].id, numeric_value);
        response = send_get_data(board->address, message, false);
        if (strcmp(response, RESPONSE_INVALID) != 0)
        {
            board->devices[device_index].boolean_value = new_value;
            result = 1;
        }
        free(message);
    }
    return result;
}

int fibstack_board_get_integer(struct fibstack_board *board, int device_id)
{
    int result = -1;
    if(board 
        && device_id >= 0 
        && device_id < board->device_number 
        && board->devices[device_id].value_type == INTEGER_TYPE) 
    {
        result = board->devices[device_id].int_value;
    }
    return result;
}

bool starts_with(const char *string, const char *prefix)
{
    size_t prefix_lenght = strlen(prefix);
    size_t string_length = strlen(string);
    return string_length < prefix_lenght ? false : memcmp(prefix, string, prefix_lenght) == 0;
}

int str2int(char *string)
{
    int result = -1;

    if (string != NULL)
    {
        long int long_int;
        char *ch;
        for (ch = string; *ch; ch++)
        {
            if (!isdigit(*ch))
            {
                return result;
            }
        }

        long_int = strtol(string, NULL, 0);
        if (long_int < __SHRT_MAX__)
        {
            result = long_int;
        }
    }
    return result;
}

void free_context_boards(struct fibstack_context *context)
{
    if(context)
    {
        for(int i = 0; i < context->board_number; i++)
        {
            free(context->boards[i].devices);
            context->boards[i].devices = NULL;
        }
        context->board_number = 0;
        free(context->boards);
        context->boards = NULL;
    }
}