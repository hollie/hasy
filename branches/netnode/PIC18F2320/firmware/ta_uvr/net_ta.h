/*************************************************************
* Technische Alternative UVR61 ethernet data logger
*
* (c) 2008, Lieven Hollevoet.
**************************************************************
* boostc compiler : v 6.40
* target device   : PIC18F2320
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
* UART speed      : 38400 bps
*************************************************************/
#ifndef _NET_TA_H_
#define _NET_TA_H_

#include <system.h>

// Define oscillator frequency
#pragma CLOCK_FREQ 8000000

// Define the device ID and firmware version
#define DEVICE_ID		0x04
#define FIRMWARE_MAJOR  0x00
#define FIRMWARE_MINOR  0x01

// Define port directions
#define PortAConfig  	11101111b  //  1=input
#define PortBConfig  	00000001b  //  1=input 
#define PortCConfig  	11011110b	

// Define bit variables attached to pins
volatile bit stat0    @ PORTA . 4;

// Function declarations
void init(void);
void identify(void);
void send_data_out();
void report_and_reset_int_count();

#endif //_NET_TA_H_
