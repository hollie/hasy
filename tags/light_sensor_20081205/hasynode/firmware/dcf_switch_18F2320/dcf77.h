/*************************************************************
* DCF77 receiver
*
* (c) 2006, Lieven Hollevoet
*     http://electronics.lika.be
*
* Toolsuite: Boostc compiler
* 
* License  : http://license.lika.be
*************************************************************/
#ifndef _DCF77_H_
#define _DCF77_H_

#include <system.h>

// Define oscillator frequency
#pragma CLOCK_FREQ 2000000

// Define port directions
#define PortAConfig  00000000b  //  1=input
#define PortBConfig  11000001b  //  1=input 
#define PortCConfig  11010000b	

// Inputs and outputs
volatile bit dcf_signal @ PORTB . 0; 
volatile bit output @ PORTB . 2;
volatile bit output_led @ PORTA . 3;
volatile bit status_led @ PORTA . 0;
volatile bit dcf_power  @ PORTB . 1;

// Datatypes & enums
typedef struct s_switch_point {
                 char hour;
				 char minute;
				 char mask;
				 char action;
				 char position;
              } switch_point;

enum FSM_STATE_TYPE { UNSYNCED, MARKER, SYNCED, WAIT_MARK, SLEEP, UNDEFINED};
enum FSM_STATE_TYPE fsm_state = UNSYNCED;

// Function declarations
/// Global
void         init(void);
void 		 interrupt(void);

/// DCF related
char 		 dcf_decode_data(bit data);
void 		 run_dcf_state_machine();

/// Switching related stuff
void         print_switch_list();
switch_point get_switch_point(char index);
void         print_switch_point(switch_point a);
void         add_switch_point();
void         delete_switch_point();
void         update_switch_state();
void         print_event_entry();

// Global variables
bit  tmr1_expiredflag  	= 0;
bit  tmr2_expiredflag  	= 0;
bit  dcf_bit_received  	= 0;
bit  dcf_bit_value     	= 0;
bit  check_timer_table 	= 0;

int  tmr0_count 		= 0;
int  tmr1_count 		= 0;
int  tmr2_count 		= 0; 

char dcf_bit_count 		= 0;
bit  dcf_lock      		= 1; 
bit  dcf_parity    		= 0;
char dcf_minutes   		= 0;
char dcf_hours     		= 0;
char dcf_day       		= 0;

bit  debug_print_time 	= 0;

switch_point current_switchpoint;

char dcf_code[8] = {1, 2, 4, 8, 10, 20, 40, 80};

// Constants
#define TMR0_VAL 0x0B
#define TMR1_VAL 0x48E5
#define TMR2_VAL 0x00
#define DATA_START_ADDRESS 0x04
#define POINT_COUNT_ADDRESS 0x00

#endif //_DCF77_H_
