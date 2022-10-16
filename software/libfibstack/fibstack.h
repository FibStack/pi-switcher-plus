/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/
#ifndef __FIBSTACK_LIBRARY__
#define __FIBSTACK_LIBRARY__

#include <stdbool.h>

/**
 * The literals specify the device value type.
 */

enum fibstack_value_type
{
    UNKNOWN_TYPE,
    BOOLEAN_TYPE,
    INTEGER_TYPE
};

/**
 * This structure contains the information of all connected Fibstack boards.
 */
struct fibstack_context;

/**
 * This structure contains information about the board and its devices.
 */
struct fibstack_board;

/**
 * Context Specific functions
 */

/**
 * Allocates and initializes a fibstack_context structure and returns a pointer to it. 
 */
extern struct fibstack_context *fibstack_context_new();

/**
 * Deallocates the memory of the provided fibstack_context structure.
 */
extern void fibstack_context_free(struct fibstack_context *context);

/**
 * Returns the total number of Fibstack boards connected to the current computer board. 
 * The function returns a negative value if the pointer to the context structure is invalid.
 */
extern int fibstack_context_get_board_number(struct fibstack_context *context);

/**
 * Queries the I2C port for Fibstack boards and populates the context structure with the data.
 */
int fibstack_context_update(struct fibstack_context *context);

/**
 * The function returns a pointer to the fibstack_board structure specified by the board_index parameter. 
 * If the context or board_index is invalid, the function will return NULL.
 */
extern struct fibstack_board *fibstack_context_get_board_by_index(struct fibstack_context *context, int board_index);

/**
 * The function returns a pointer to the fibstack_board structure specified by the board_address parameter. 
 * If the context or board_address is invalid, or no Fibstack board is found on the specified I2C address, the function will return NULL.
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
 * The function returns a short description of the board.
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
 * If one of the input parameters is invalid or could not change the address, the function returns a negative value.
 */
extern int fibstack_board_set_address(struct fibstack_board *board, int new_address);

/**
 * This function returns the total device number on the specified board. 
 * If the board structure pointer is invalid, the function will return a negative number.
 */
extern int fibstack_board_get_device_number(struct fibstack_board *board);

/**
 * The function returns a short device description.
 */
extern char *fibstack_board_get_device_description(struct fibstack_board *board, int device_id);

/**
 * Returns true if the specified device value is read-only. Otherwise, it returns false.
 */
extern bool fibstack_board_is_device_read_only(struct fibstack_board *board, int device_id);

/**
 * Returns the type of value which the device stores.
 */
extern enum fibstack_value_type fibstack_board_get_device_value_type(struct fibstack_board *board, int device_id);

/**
 * Returns the boolean value for the specified device.
 */
extern bool fibstack_board_get_boolean(struct fibstack_board *board, int device_index);

/**
 * The function sets a boolean value for the specified device.
 */
extern int fibstack_board_set_boolean(struct fibstack_board *board, int device_index, bool new_value);

/**
 * Returns the integer value for the specified device.
 */
extern int fibstack_board_get_integer(struct fibstack_board *board, int device_id);

#endif
