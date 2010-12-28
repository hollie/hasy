/*************************************************************
* OneWire interface lib for the Dallas DS1820 and alike
*
* (c) 2009, Lieven Hollevoet
* PSoC Designer v5.0 Imagecraft compiler
*
* Expects that a OneWire firmware unit called 'OneWire'
* is added to the design!
*************************************************************/
#ifndef _OO_H_
#define _OO_H_

#include <m8c.h> 

// Comment the following define if CRC checking does not need to be performed.
// Can be useful on devices with limited program memory available
#define OO_CRC_CHECKING

// Structure for data exchange
typedef struct s_oo_data {
                 char  id[8];
                 char  t_msb;
                 char  t_lsb;
                 char  remain;
                 char  nr_count;
                 char  valid;
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

char  oo_busreset(void);
short oo_get_temp(void);
char  oo_get_pad_byte(char index);
char  oo_read_scratchpad(void);
char  oo_conversion_busy(void);
void  oo_start_conversion(void);
char  oo_wait_for_completion(void);
char  oo_device_search(void);
char  oo_scanbus(void);
char  oo_get_next_id(void);
char  oo_get_devicecount(void);
oo_tdata oo_read_device(void);
void oo_report(void);

#endif // _OO_H_
