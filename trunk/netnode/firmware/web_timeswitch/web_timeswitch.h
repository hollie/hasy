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
#define PortAConfig  0xEB  //  1=input
#define PortBConfig  0xFF  //  1=input 
#define PortCConfig  0xDE	

// Inputs and outputs
#define output_led PORTAbits.RA4

// Enumerations
// Used to keep track of the current state
enum UART_STATE_TYPE { IDLE = 0, WAIT_CONNECT, CONNECTED, INCOMING, WAITING_INFO, STORE_STRING, STRING_RECEIVED, WAIT_FOR_DISCONNECT};
// Used for the php interface
enum PHP_IF_TYPE { REQUEST_TIME = 0, REPORT_CLOCK_SET, REPORT_SWITCH_STATE, REQUEST_SETTINGS, SETTINGS_RETRIEVED};

// Function declarations
/// Global
// Function declarations
void init(void);
void high_isr(void);
void low_isr(void);
char get_bufval(char);
void web_connect(void);
void web_php_interface(enum PHP_IF_TYPE);

// Global variables
char  check_timer_table 	= 0;

// Constants
#define TMR0_VAL 3044
#define RX_BUFSIZE 40

#endif //_TIMESWITCH_H_
