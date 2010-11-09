/*************************************************************
* One wire interface lib for the Dallas DS1820 and alike
*
* (c) 2005-2010, Lieven Hollevoet, mcc18 compiler.
*************************************************************/
#ifndef _OO_H_
#define _OO_H_

// Comment the following define if CRC checking does not need to be performed.
// Can be useful on devices with limited program memory available
#define OO_CRC_CHECKING

#define OO_BUS      PORTAbits.RA0
#define OO_BUS_TRIS TRISAbits.TRISA0

// Structure for data exchange
typedef struct s_oo_data {
                 unsigned char  id[8];
                 unsigned char  t_msb;
                 unsigned char  t_lsb;
                 unsigned char  valid;
              } oo_tdata;

// ====================================================================
// Commands for the DS1820
//    1. ROM function commands
#define        OO_READROM        	0x33    
#define        OO_MATCHROM       	0x55
#define        OO_SKIPROM        	0xCC
#define        OO_SEARCHROM      	0xF0
#define        OO_ALARMSEARCH    	0xEC

//    2. Memory Command Functions
#define        OO_WRITEPAD       	0x4E
#define        OO_READPAD        	0xBE
#define        OO_COPYPAD        	0x48
#define        OO_CONVERTT       	0x44
#define        OO_RECALLE2			0xB8
#define        OO_READSUPPLY		0xB4

#define        SUPPORTED_DEVICE_COUNT 5

#define oo_readmode  OO_BUS_TRIS = 1
#define oo_writemode OO_BUS_TRIS = 0

char  	 oo_busreset();
short 	 oo_get_temp();
char  	 oo_get_pad_byte(char index);
char  	 oo_read_scratchpad();
char  	 oo_conversion_busy();
void  	 oo_start_conversion();
char  	 oo_wait_for_completion();
char  	 oo_device_search();
char  	 oo_scanbus();
char     oo_get_next_id();
char     oo_get_devicecount();
oo_tdata oo_read_device(char count);
void     oo_report();

#endif // _OO_H_
