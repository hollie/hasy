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
#define PortAConfig  0xEF  //  1=input
#define PortBConfig  0x01  //  1=input 
#define PortCConfig  0xDE	

// Inputs and outputs
#define output_led PORTAbits.RA4
//#define status_led (PORTAbits.RA3)

// Function declarations
/// Global
// Function declarations
void init(void);
void high_isr(void);
void low_isr(void);
void web_connect(void);
void web_report_clock_set(void);
void web_request_time(void);
void web_report_switch_state(char);

// Global variables
char  check_timer_table 	= 0;

// Constants
#define TMR0_VAL 3043

#endif //_TIMESWITCH_H_
