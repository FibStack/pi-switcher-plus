/*
 * i2clib.h
 * Copyright (C) 2021, Fibstack LLC. All rights reserved.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 * Created: 3/6/2021
 *  Author: alexandru.botnaru
 */

#define I2C_ADDRESS_MIN 0x03
#define I2C_ADDRESS_MAX 0x77
#define MAX_BUFFER_SIZE 32

/**
 * function: get_slave_access()
 * 
 * Returns file ID for the i2c device if open successfully. Returns -1 if an error occured.
 * Every get/send function will close the file.
 * @parameter address - i2c device address
 * @parameter verbose - print additional details
 * 
 */
extern int get_slave_access(uint8_t address, unsigned char verbose);

/**
 * function: send_get_data()
 * 
 * Writes the message to the i2c device address file and reads back the response.
 * Returns the string read or "lib error" if the file couldn't be read
 * This function will open and close the i2c access file.
 * @parameter address - i2c device address
 * @parameter message - the message to be sent to the device
 * @parameter verbose - print additional details
 * 
 */
extern char *send_get_data(uint8_t address, char *message, unsigned char verbose);

