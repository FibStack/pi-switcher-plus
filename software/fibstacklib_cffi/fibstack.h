/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/
 
 /**
 * IMPORTANT:
 * This header file is only to compile the Python library wrapper.
 * CFFI Python Library has limitations
 * - It DOESN'T support strings in the #define
 * - It DOESN'T support _Bool type, replace with "unsigned char" 
 */

enum fibstack_value_type
{
    UNKNOWN_TYPE,
    BOOLEAN_TYPE,
    INTEGER_TYPE
};

struct fibstack_context;
struct fibstack_board;

/**
 * Context Specific functions
 */

/**
 * Allocates and returns the pointer to a fibtack_context structure. 
 */
extern struct fibstack_context *fibstack_context_new();

/**
 * Dealocates the memory of the provided fibstack_context structure.
 */
extern void fibstack_context_free(struct fibstack_context *context);

/**
 * Returns the total number of FibStack boards connected to the current computer board. 
 * The function returns a negative value if the pointer to the context structure is invalid.
 */
extern int fibstack_context_get_board_number(struct fibstack_context *context);

/**
 * Query the I2C port for FibStack boards and populates the context structure with the data.
 */
int fibstack_context_update(struct fibstack_context *context);

/**
 * The function returns a pointer to the board specified by the board_index parameter. 
 * If the context or board_index is invalid, the function will return NULL.
 */
extern struct fibstack_board *fibstack_context_get_board_by_index(struct fibstack_context *context, int board_index);

/**
 * The function returns a pointer to the board specified by the board_address parameter. 
 * If the context or board_address is invalid, or no FibStack board found on the specified I2C address, the function will return NULL.
 */
extern struct fibstack_board *fibstack_context_get_board_by_address(struct fibstack_context *context, int board_address);

/**
 * Board Specific functions
 */

/**
 * Queries the board and updates all the device data.
 * Returns a negative number if the pointer to the board is invalid or could not update the data.
 */
extern int fibstack_board_update(struct fibstack_board *board);

/**
 * Returns a string that represents a board short description.
 */
extern char *fibstack_board_get_description(struct fibstack_board *board);

/**
 * The function returns the I2C address of the specified board. 
 * If the pointer to the board structure is invalid, the function returns a negative number.
 */
extern int fibstack_board_get_address(struct fibstack_board *board);

/**
 * The function changes the board's I2C address. 
 * If the I2C address was changed successfully, the function returns the new address. 
 * If the pointer to the board structure or the new address value is invalid, the function returns a negative value.
 */
extern int fibstack_board_set_address(struct fibstack_board *board, int new_address);

/**
 * This function returns the total device number on the specified board. 
 * If the board structure pointer is invalid, the function will return a negative number.
 */
extern int fibstack_board_get_device_number(struct fibstack_board *board);

/**
 * Returns a string that represents the device description.
 */
extern char *fibstack_board_get_device_description(struct fibstack_board *board, int device_id);

/**
 * Returns true if the specified device value is read-only. Otherwise, it returns false.
 */
extern unsigned char fibstack_board_is_device_read_only(struct fibstack_board *board, int device_id);

/**
 * The function returns the type of value stored in the device.
 */
extern enum fibstack_value_type fibstack_board_get_device_value_type(struct fibstack_board *board, int device_id);

/**
 * The function returns the boolean value for the specified device.
 */
extern unsigned char fibstack_board_get_boolean(struct fibstack_board *board, int device_index);

/**
 * The function sets a boolean value for the specified device.
 */
extern int fibstack_board_set_boolean(struct fibstack_board *board, int device_index, unsigned char new_value);

/**
 * The function returns the integer value for the specified device.
 */
extern int fibstack_board_get_integer(struct fibstack_board *board, int device_id);
