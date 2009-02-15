/*************************************************************
* Interface to the Orcon HRC ventilation unit remote control
*
* (c) 2009, Lieven Hollevoet
* PSoC Designer v5.0 HiTide compiler
*
* Expects that the remote control buttons are connected to
* IO pins of the controller. The pins need to be 
* configured as 'open drain low' in the chip
* configuration window
*
*************************************************************/

#include "PSoCAPI.h"
#include "orcon.h"
#include <stdio.h>

#define ORCON_PRT PRT0DR

#define ORCON_PRT_LOW  (ORCON_PRT = ORCON_PRT & 0xFD)
#define ORCON_PRT_MED  (ORCON_PRT = ORCON_PRT & 0xF7)
#define ORCON_PRT_HIGH (ORCON_PRT = ORCON_PRT & 0xDF)
#define ORCON_RELEASE  (ORCON_PRT = ORCON_PRT | 0x2A)

void orcon_Start(){
	ORCON_RELEASE;
};

// Delay of 5 us when main clock == 24 MHz and Sysclk = main / 1
// Actual delay: 5.3 us
void orcon_delay_5us() {

	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");

	return;
}

void orcon_delay(){
	// Get LED state, wait for change and back before falling through 
	// this function.
	int i;
	
	for (i=0;i<20000;i++){
		orcon_delay_5us();
	}
	for (i=0;i<20000;i++){
		orcon_delay_5us();
	}
	for (i=0;i<20000;i++){
		orcon_delay_5us();
	}
	for (i=0;i<20000;i++){
		orcon_delay_5us();
	}
	
	return;
}
void orcon_low(){
	ORCON_PRT_LOW;
	printf("Switching Orcon ");
	orcon_delay();
	printf("to mode LOW\r\n");
	ORCON_RELEASE;
}

void orcon_med(){
	ORCON_PRT_MED;
	printf("Switching Orcon ");
	orcon_delay();
	printf("to mode NORMAL\r\n");
	ORCON_RELEASE;	
}

void orcon_high(){
	ORCON_PRT_HIGH;
	printf("Switching Orcon ");
	orcon_delay();
	printf("to mode HIGH\r\n");
	ORCON_RELEASE;	
}