/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/


#ifndef ADC_H_
#define ADC_H_


#define ADC_CHANNELS 4

extern uint16_t adc_result[];
extern uint8_t adc_muxpos[];
extern uint8_t adc_channel;

extern void ADC0_init();
extern void ADC0_start();
extern void ADC0_clear_interrupt_flag();
extern void ADC0_process();


#endif /* ADC_H_ */