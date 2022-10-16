/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/


#ifndef OUTPUT_H_
#define OUTPUT_H_

#define OUTPUT_DEVICES 4

extern uint8_t output_devices[][2];

extern void output_init();
extern uint8_t output_set(uint8_t device_id, uint8_t value);
extern uint8_t output_get(uint8_t device_id);


#endif /* OUTPUT_H_ */