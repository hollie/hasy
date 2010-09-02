/*************************************************************
* Network attached node to connect various sensors to
* Currently supports One Wire temperature sensors
*
* (c) 2006-2010, Lieven Hollevoet.
**************************************************************
* boostc compiler : v 6.35
* target device   : PIC18F2520
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : netnode
* UART speed      : 38400 bps
*************************************************************/
#ifndef _NET_TEMP_H_
#define _NET_TEMP_H_

#include <system.h>

// Define oscillator frequency
#pragma CLOCK_FREQ 8000000

// Define the device ID and firmware version
#define DEVICE_ID		0x01
#define FIRMWARE_MAJOR  0x00
#define FIRMWARE_MINOR  0x06

// Define port directions
#define PortAConfig  	11110111b  //  1=input
#define PortBConfig  	11000001b  //  1=input 
#define PortCConfig  	11010000b	

// Configuration location in EEPROM
#define DEVICE_AUTOMODE	0x01

// Define bit variables attached to pins
volatile bit stat0 @ PORTA . 3;

// Function declarations
void init(void);
void identify(void);

char data[12];

#endif //_NET_TEMP_H_
