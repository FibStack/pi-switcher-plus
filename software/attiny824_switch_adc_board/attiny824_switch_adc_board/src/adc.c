/*
* Copyright (c) 2021, FibStack
* All rights reserved.
* 
* This source code is licensed under the MIT license found in the
* LICENSE file in the root directory of this source tree. 
*/

#include <xc.h>
#include "adc.h"

uint16_t adc_result[ADC_CHANNELS] = { 0, 0, 0, 0};
uint8_t adc_muxpos[ADC_CHANNELS] = {ADC_MUXPOS_AIN4_gc, ADC_MUXPOS_AIN5_gc, ADC_MUXPOS_AIN6_gc, ADC_MUXPOS_AIN7_gc};
uint8_t adc_channel = 0;

void ADC0_init()
{
	// Disable digital input buffer PA4 (pin 2), ADC channel 1
	PORTA.PIN4CTRL &= ~PORT_ISC_gm;
	PORTA.PIN4CTRL |= PORT_ISC_INPUT_DISABLE_gc;

	// Disable digital input buffer PA5 (pin 3), ADC channel 2
	PORTA.PIN5CTRL &= ~PORT_ISC_gm;
	PORTA.PIN5CTRL |= PORT_ISC_INPUT_DISABLE_gc;
	
	// Disable digital input buffer PA6 (pin 4), ADC channel 3
	PORTA.PIN6CTRL &= ~PORT_ISC_gm;
	PORTA.PIN6CTRL |= PORT_ISC_INPUT_DISABLE_gc;

	// Disable digital input buffer PA7 (pin 5), ADC channel 4
	PORTA.PIN7CTRL &= ~PORT_ISC_gm;
	PORTA.PIN7CTRL |= PORT_ISC_INPUT_DISABLE_gc;

	// Disable pull-up resistor
	PORTA.PIN4CTRL &= ~PORT_PULLUPEN_bm; // ADC channel 1
	PORTA.PIN5CTRL &= ~PORT_PULLUPEN_bm; // ADC channel 2
	PORTA.PIN6CTRL &= ~PORT_PULLUPEN_bm; // ADC channel 3
	PORTA.PIN7CTRL &= ~PORT_PULLUPEN_bm; // ADC channel 4
	
	ADC0.COMMAND = ADC_MODE_SINGLE_12BIT_gc;


	ADC0.CTRLC = ADC_PRESC_DIV4_gc		// CKL_PER divided by 4
	| ADC_REFSEL_VDD_gc; // VDD reference

	ADC0.CTRLA |= ADC_ENABLE_bm; // Enable ADC
	ADC0.MUXPOS = adc_muxpos[adc_channel]; // Select first channel

	ADC0.INTCTRL |= ADC_RESRDY_bm; // Enable Result Ready interrupt
	
}

void ADC0_start()
{
	ADC0.COMMAND |= ADC_START_IMMEDIATE_gc; // Start conversion
}

void ADC0_clear_interrupt_flag()
{
	ADC0.INTFLAGS = ADC_RESRDY_bm; // Clear the ADC Result Ready interrupt flag by writing 1
}

void ADC0_process()
{
	ADC0_clear_interrupt_flag();
	
	adc_result[adc_channel] = ADC0.SAMPLE;
	adc_channel++;
	
	// reset the current channel
	if(adc_channel >= ADC_CHANNELS)
	{
		adc_channel = 0;
	}
	
	ADC0.MUXPOS = adc_muxpos[adc_channel];
	
	ADC0_start();
}