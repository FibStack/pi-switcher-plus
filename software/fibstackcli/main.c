/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <argp.h>
#include "fibstack.h"
#include "i2clib.h"


#define CURRENT_VERSION "0.9.1"

static char doc[] = "Command line utility to interact with FibStack boards.";
static char args_doc[] = "{--list-boards | -l} {--board=BOARD_INDEX | -b BOARD_INDEX |--address=ADDRESS | -a ADDRESS [--device=DEVICE_ID | -d DEVICE_ID [--set=NEW_VALUE | -s NEW_VALUE]] [--set=NEW_VALUE | -s NEW_VALUE]}";

static struct argp_option options[] = {
    {"list-boards", 'l', 0, 0, "List all the devices connected to this computer board."},
    {"board", 'b', "BOARD_INDEX", 0, "Specifies the board index. If only this parameter is specified, then it will show the status of the board."},
    {"address", 'a', "ADDRESS", 0, "Specifies the board address. If only this parameter is specified, then it will show the status of the board."},
    {"device", 'd', "DEVICE_ID", 0, "Specifies the device ID. If the set option is not specified, this will show the status of the device."},
    {"set", 's', "NEW_VALUE", 0, "Specify the new value to be assigned to the device."},
    {"version", 'v', 0, 0, "Shows the current version of the FibStack CLI tool."},
    {0}
    };

struct arguments
{
    bool list_boards;
    int board_index;
    int address;
    int device_id;
    char* value;
    bool show_version;
};

static error_t parse_arguments(int key, char *arg, struct argp_state *state)
{
    struct arguments *arguments = state->input;
    switch(key)
    {
        case 'l': arguments->list_boards = true; break;
        case 'b': arguments->board_index = arg ? atoi(arg) : -1; break;
        case 'a': arguments->address = arg ? (int) strtol(arg, NULL, 0) : -1; break;
        case 'd': arguments->device_id = arg ? atoi(arg) : -1; break;
        case 's': arguments->value = arg; break;
        case 'v': arguments->show_version = true; break;
        default:
        return ARGP_ERR_UNKNOWN;
    }
    return 0;
}

static struct argp argp = { options, parse_arguments, args_doc, doc, 0, 0, 0 };

void list_all_boards(struct fibstack_context *context);
void modify_board_address(struct fibstack_board *board, int new_address);
void get_device_info(struct fibstack_board *board, int device_id);
void set_device_value(struct fibstack_board *board, int device_id, char *value);
void show_board_info(struct fibstack_board *board);
struct fibstack_board* get_board(struct fibstack_context *context, struct arguments *arguments);

int main(int argc, char **argv)
{
    struct fibstack_context *context = fibstack_context_new();
    struct arguments arguments;
    arguments.list_boards = false;
    arguments.board_index = -1;
    arguments.address = -1;
    arguments.device_id = -1;
    arguments.value = NULL;
    arguments.show_version = false;
    
    argp_parse(&argp, argc, argv, 0, 0, &arguments);
    
    int total_boards = fibstack_context_get_board_number(context);
    bool is_board_index_valid = arguments.board_index > -1 && arguments.board_index < total_boards;
    bool is_board_address_valid = arguments.address >= I2C_ADDRESS_MIN && arguments.address < I2C_ADDRESS_MAX;
    bool invalid_board_indentifier = !(is_board_index_valid || is_board_address_valid);
    
    if(arguments.list_boards)
    {
        // LIST ALL BOARDS
        list_all_boards(context);
        invalid_board_indentifier = false;
    } 
    else if (arguments.show_version)
    {
        // SHOW CURRENT VERSION
        printf("%s\n", CURRENT_VERSION);
        invalid_board_indentifier = false;
    }
    else if(!invalid_board_indentifier)
    {
        struct fibstack_board *board = get_board(context, &arguments);

        if(!board)
        {
            invalid_board_indentifier = true;
        }
        else if(arguments.device_id > -1 && arguments.value != NULL)
        {
            // SET DEVICE VALUE
            set_device_value(board, arguments.device_id, arguments.value);
        }
        else if (arguments.device_id > -1 && arguments.value == NULL)
        {
            // GET DEVICE INFO
            get_device_info(board, arguments.device_id);
        }
        else if(arguments.device_id <= -1 && arguments.value != NULL)
        {
            // SET BOARD ADDRESS
            int new_address = (int) strtol(arguments.value, NULL, 0);
            modify_board_address(board, new_address);
        }
        else
        {
            // SHOW BOARD STATUS
            show_board_info(board);
        }
    }
    
    if(invalid_board_indentifier)
    {
        printf("ERROR: Invalid value for the [--board, -b, --address, -a] options.\n");
    }
    
    fibstack_context_free(context);
    
    return EXIT_SUCCESS;
}

/**
* Returns the pointer of the fibstack_board structure, it find the board by specified index or address.
*/
struct fibstack_board* get_board(struct fibstack_context *context, struct arguments *arguments)
{
    struct fibstack_board *board = NULL;
    if(arguments)
    {
        if(arguments->board_index > -1)
        {
            board = fibstack_context_get_board_by_index(context, arguments->board_index);
        }
        else if (arguments->address > -1)
        {
            board = fibstack_context_get_board_by_address(context, arguments->address);
        }
    }

    return board;
}

/**
 * List all the boards from the provided context
 */
void list_all_boards(struct fibstack_context *context)
{
    int total_boards = fibstack_context_get_board_number(context);
    printf("Total boards found: %d\n", total_boards);
    if(total_boards > 0)
    {
        printf(" Id   Address    Devices    Descriptions\n");
        printf("-----------------------------------------------------------\n");
    }
    for(int i = 0; i < total_boards; i++)
    {
        struct fibstack_board *board = fibstack_context_get_board_by_index(context, i);
        int i2c_address = fibstack_board_get_address(board);
        int total_devices = fibstack_board_get_device_number(board);
        char* description = fibstack_board_get_description(board);
        printf("%3d  %2d(0X%2X)    %7d    %30s\n", i, i2c_address, i2c_address, total_devices, description);
    }
}

/**
 * Modifies the I2C address of the specified board.
 * The address will not change if the provided value for the new address is invalid
 */
void modify_board_address(struct fibstack_board *board, int new_address)
{
    bool is_new_address_valid = board 
        && new_address > I2C_ADDRESS_MIN 
        && new_address < I2C_ADDRESS_MAX;
    bool is_address_available = true;
    
    // Check if the address is not taken by another board
    if(is_new_address_valid)
    {
        char *test_message = send_get_data(new_address, "version", false);
        if(strcmp(test_message, LIB_ERROR_MSG) != 0)
        {
            is_new_address_valid = false;
            is_address_available = false;
        }
    }
    
    if(is_new_address_valid)
    {
        int set_address_result = fibstack_board_set_address(board, new_address);
        if(set_address_result != new_address)
        {
            printf("ERROR: Could not set the new address\n");
        }
        else 
        {
            printf("SUCCESS: The new address was set succesfully\n");
        }
    }
    else if(!is_address_available)
    {
        printf("ERROR: Address %d is not available.\n", new_address);
    }
    else
    {
        printf("ERROR: Invalid value for the [--address, -a] option.\n");
    }
}

/**
 * Shows the information for the specified device
 */
void get_device_info(struct fibstack_board *board, int device_id)
{
    int total_devices = fibstack_board_get_device_number(board);
    bool is_device_id_valid = device_id > -1 && device_id < total_devices;
    
    if( is_device_id_valid)
    {
        enum fibstack_value_type value_type = fibstack_board_get_device_value_type(board, device_id);
        bool is_device_read_only = fibstack_board_is_device_read_only(board, device_id);
        char *device_description = fibstack_board_get_device_description(board, device_id);
        char* read_only_str = "";
        if(is_device_read_only)
        {
            read_only_str = ", Read Only";
        }
        if(value_type == BOOLEAN_TYPE)
        {
            int bool_value = fibstack_board_get_boolean(board, device_id);
            printf("%s. ID: %d, Value = %s%s\n", device_description, device_id, bool_value ? "true" : "false", read_only_str);
        }
        else if (value_type == INTEGER_TYPE)
        {
            int int_value = fibstack_board_get_integer(board, device_id);
            printf("%s. ID: %d, Value = %d%s\n", device_description, device_id, int_value, read_only_str);
        }
        else
        {
            printf("INFO: Unknown device type.\n");
        }
    }
    else
    {
        printf("ERROR: Invalid value for the [--device, -d] option.\n");
    }
    
}

/**
 * Sets the specified device with specified value if not Read Only
 */
void set_device_value(struct fibstack_board *board, int device_id, char *value)
{
    int total_devices = fibstack_board_get_device_number(board);
    bool is_device_id_valid = device_id > -1 && device_id < total_devices;
    
    if( is_device_id_valid)
    {
        bool is_device_read_only = fibstack_board_is_device_read_only(board, device_id);
        if(is_device_read_only)
        {
            printf("ERROR: Device is Read Only, cannot set.\n");
        }
        else
        {
            enum fibstack_value_type value_type = fibstack_board_get_device_value_type(board, device_id);
            if(value_type == BOOLEAN_TYPE)
            {
                // Set the value to lower case
                for(int i = 0; i < strlen(value); i++)
                {
                    value[i] = tolower(value[i]);
                }
                if(strcmp("true", value)==0 || strcmp("1", value)==0)
                {
                    // Set boolean value to TRUE
                    fibstack_board_set_boolean(board, device_id, true);
                } 
                else if(strcmp("false", value)==0 || strcmp("0", value)==0)
                {
                    // Set boolean value to FALSE
                    fibstack_board_set_boolean(board, device_id, false);
                }
                else
                {
                    printf("ERROR: Unsupported value %s\n", value);
                }
            }
            else
            {
                printf("INFO: Device type not supported.\n");
            }
        }
    }
    else
    {
        printf("ERROR: Invalid value for the [--device, -d] option.\n");
    }
}

/**
 * Shows all the infow about specified board.
 */
void show_board_info(struct fibstack_board *board)
{
    int i2c_address = fibstack_board_get_address(board);
    int total_devices = fibstack_board_get_device_number(board);
    char *description = fibstack_board_get_description(board);
    printf("I2C address %d(0X%2X)\n", i2c_address, i2c_address);
    printf("Description: %s\n", description);
    printf("Total devices: %d\n", total_devices);
    if(total_devices > 0)
    {
        printf(" ID  Value Type  Value  Read Only  Description\n");
        printf("------------------------------------------------\n");

        for(int i = 0; i < total_devices; i++)
        {
            enum fibstack_value_type value_type = fibstack_board_get_device_value_type(board, i);
            int int_value = fibstack_board_get_integer(board, i);
            int bool_value = fibstack_board_get_boolean(board, i);
            bool is_read_only = fibstack_board_is_device_read_only(board, i);
            char *device_description = fibstack_board_get_device_description(board, i);
            char *str_type;
            switch(value_type)
            {
                case BOOLEAN_TYPE: str_type = "BOOLEAN"; break;
                case INTEGER_TYPE: str_type = "INTEGER"; break;
                default: str_type = "UNKNOWN";
            }
            printf("%3d%12s%7d%11s  %s\n", i, str_type, value_type == BOOLEAN_TYPE ? bool_value : int_value, is_read_only ? "Yes" : "No", device_description);
        }
    }
}
