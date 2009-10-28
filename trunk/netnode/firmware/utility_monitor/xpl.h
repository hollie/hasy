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

void xpl_init(void);
void xpl_handler(void);


#endif // _XPL_H_

