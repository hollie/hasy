/*************************************************************
* xPL library
*
* (c) 2009, Lieven Hollevoet.
**************************************************************
* target device   : PIC18F2320
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
*************************************************************/
#ifndef _XPL_H_
#define _XPL_H_

// DEVICE_ID must be 8 characters or less !!
#define XPL_DEVICE_ID "utilmon"

// INSTANCE_ID must be 16 characters or less !!
// The offset in EEPROM where the INSTANCE_ID is stored 
#define XPL_INSTANCE_ID_OFFSET 0x00
#define RX_BUFSIZE 40

struct xpl_message
{
char cmnd[15];
};


void xpl_init(void);
void xpl_handler(void);
void xpl_addbyte(char);

// For flow control of the UART
#define XON  0x11
#define XOFF 0x13

#endif // _XPL_H_

