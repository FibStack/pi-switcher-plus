/*
 * output.h
 *
 * Created: 3/10/2021 7:30:19 AM
 *  Author: alexandru.botnaru
 */ 


#ifndef OUTPUT_H_
#define OUTPUT_H_

#define OUTPUT_DEVICES 4

extern uint8_t output_devices[][2];

extern void output_init();
extern uint8_t output_set(uint8_t device_id, uint8_t value);
extern uint8_t output_get(uint8_t device_id);


#endif /* OUTPUT_H_ */