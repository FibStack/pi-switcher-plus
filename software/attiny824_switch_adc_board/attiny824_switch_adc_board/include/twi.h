/*
* twi.h
*
* Created: 3/6/2021 5:42:27 PM
*  Author: alexandru.botnaru
*/


#ifndef TWI_H_
#define TWI_H_


#define TWI_BUFFER_SIZE	32

extern char read_buffer[];
extern char write_buffer[];
extern uint8_t bytes_read;
extern uint8_t bytes_written;

extern void TWI0_init(uint8_t address);
extern void TWI0_set_address(uint8_t address);
extern void TWI0_process_interrupt();
extern void TWI0_process_command();


#endif /* TWI_H_ */