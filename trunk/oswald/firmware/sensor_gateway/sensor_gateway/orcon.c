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

int orcon_count;

void orcon_Start(void){
	ORCON_RELEASE;
	orcon_count = 0;
}

// This function increments the ticker that is used for timing the 
// output pin assertion in the orcon_control function.
void orcon_ticker(void)
{
	if (orcon_count < 100) {
		orcon_count++;
	}
}

// Drive the output pins requested by the function parameter for two timer ticks.
void orcon_control(enum ORCON_MODE_TYPE mode){
	cprintf("Switching Orcon to mode");
	orcon_count = 0;
	
	switch (mode) {
	case LOW:
		cprintf("LOW\r\n");
		ORCON_PRT_LOW;
		break;
	case MEDIUM:
		cprintf("MEDIUM\r\n");
		ORCON_PRT_MED;
		break;
	case HIGH:
		cprintf("HIGH\r\n");
		ORCON_PRT_HIGH;
		break;
	default:
		cprintf("not possible, unknown mode requested");
		break;
	}
	
	while (orcon_count < 2){asm("nop");};

	ORCON_RELEASE;
	
}