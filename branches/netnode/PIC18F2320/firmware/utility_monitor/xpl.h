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

// offset of INSTANCE_ID within target=VENDOR-DEVICEID.
#define XPL_TARGET_VENDOR_DEVICEID_INSTANCE_ID_OFFSET 22

#define XPL_DEVICE_OFFSET 7
#define XPL_DEVICE_GAS_VALUE_OFFSET 3
#define XPL_DEVICE_WATER_VALUE_OFFSET 5
#define XPL_DEVICE_ELEC_DAY_VALUE_OFFSET 8
#define XPL_DEVICE_ELEC_NIGTH_VALUE_OFFSET 10

#define XPL_MSG_PART_DEVICE "sensor.basic\n{\ndevice="


// INSTANCE_ID must be 16 characters or less !!
// The offset in EEPROM where the INSTANCE_ID is stored 
#define XPL_EEPROM_INSTANCE_ID_OFFSET 0x00
#define XPL_RX_BUFSIZE 40
#define XPL_RXFIFO_SIZE 44

void xpl_init(void);
void xpl_handler(void);
void xpl_addbyte(char);
void xpl_fifo_push_byte(char);


// For flow control of the UART
#define XON  0x11
#define XOFF 0x13

#endif // _XPL_H_

