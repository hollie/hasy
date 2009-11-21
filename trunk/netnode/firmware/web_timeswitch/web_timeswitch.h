/*************************************************************
* Web-enabled time switch receiver
*
* (c) 2009, Lieven Hollevoet
*     http://electronics.lika.be
*
* License  : http://license.lika.be
*************************************************************/
#ifndef _TIMESWITCH_H_
#define _TIMESWITCH_H_

// Define port directions
#define PortAConfig  0x00  //  1=input
#define PortBConfig  0xC1  //  1=input 
#define PortCConfig  0xD0	

// Inputs and outputs
#define output_led PORTBbits.RB2
#define status_led (PORTAbits.RA3)

// Function declarations
/// Global
// Function declarations
void init(void);
void high_isr(void);
void low_isr(void);



// Global variables
char  tmr1_expiredflag  	= 0;
char  tmr2_expiredflag  	= 0;
char  check_timer_table 	= 0;

int  tmr0_count 		= 0;
int  tmr1_count 		= 0;
int  tmr2_count 		= 0; 

char  debug_print_time 	= 0;



// Constants
#define TMR0_VAL 0x0B
#define TMR1_VAL 0x48E5
#define TMR2_VAL 0x00

#endif //_TIMESWITCH_H_
