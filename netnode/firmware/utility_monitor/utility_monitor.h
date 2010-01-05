/*************************************************************
* Utility meter monitor
*
* (c) 2009, Lieven Hollevoet.
**************************************************************
* boostc compiler : v 6.81
* target device   : PIC18F2320
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
* UART speed      : 38400 bps
*************************************************************/
#ifndef _UTILMONI_H_
#define _UTILMONI_H_

//#include <system.h>

// Define oscillator frequency
//#pragma CLOCK_FREQ 8000000

// Define the device ID and firmware version
#define DEVICE_ID		0x00
#define FIRMWARE_MAJOR  0x00
#define FIRMWARE_MINOR  0x00

// Define port directions
#define PortAConfig  	0xEF  //  1=input
#define PortBConfig  	0x07  //  1=input 
#define PortCConfig  	0xDE 	

// Define bit variables attached to pins
#define stat0    (PORTAbits.RA4)

// Timer values
#define TMR0_VALUE 0xC2F8 // For a second interrupt.

// Function declarations
void init(void);
void high_isr(void);
void low_isr(void);


#endif //_UTILMONI_H_
