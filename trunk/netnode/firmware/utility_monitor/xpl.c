/*************************************************************
* xPL library
*
* (c) 2009, Lieven Hollevoet.
**************************************************************
* target device   : PIC18F2320
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
*************************************************************/

#include <stdio.h>

#include "xpl.h"
#include "eeprom.h"

char instance_id[17];
char rx_buffer[40];

// Used by xpl_handler to keep track of the current state
enum XPL_STATE_TYPE { NOT_CONFIGURED = 0, CONFIGURED };
enum XPL_STATE_TYPE xpl_state;

// Used by the print_header function.
enum XPL_MSG_TYPE {STAT, TRIG};

// Following variable has to be declared in the main function and should be incremented every second.
extern volatile int time_ticks;

//////////////////////////////////////////////////////////
// xpl_print_header
//  Prints the header of the xpl messages sent out
//  This is a separate function to reduce the 
//  program memory size (reuse this function)
void xpl_print_header(enum XPL_MSG_TYPE type){

	printf("xpl-");
	if (type == STAT) {
		printf("stat");
	} else {
		printf("trig");
	}
	printf("\n{\nhop=1\nsource=hollie-");
	printf(XPL_DEVICE_ID);
	printf(".");
	printf("%s", instance_id); 
	printf("\ntarget=*\n}\n");
}

//////////////////////////////////////////////////////////
// xpl_send_hbeat
//  Send out a normal heartbeat
void xpl_send_hbeat(void){
	xpl_print_header(STAT);
	printf("hbeat.basic\n{\ninterval=5\n}\n");
	return;
}

//////////////////////////////////////////////////////////
// xpl_send_hbeat
//  Request configuration by the config manager
//  This function is called by xpl_handler when no valid 
//  INSTANCE_ID is found in EEPROM by the xpl_init function.
void xpl_send_config_hbeat(void){
	xpl_print_header(STAT);
	printf("config.basic\n{\ninterval=1\n}\n");
	return;
}


//////////////////////////////////////////////////////////
// xpl_init
// Initialisation of the xPL library. Tries to restore the
// INSTANCE_ID from EEPROM
void xpl_init(void){

	// Get the instance ID from EEPROM
	char count, ee_char;

	xpl_state = NOT_CONFIGURED;

	ee_char = '\0';
	// Maximum size = 16 chars + 1 null char
	for (count = 0; count < 16; count++){
		instance_id[count] = eeprom_read(count+XPL_INSTANCE_ID_OFFSET);

		// When we encounter the null, stop reading
		if (instance_id[count] == '\0') { 
			xpl_state = CONFIGURED;
			return;
		} 

		// When the first char is 0xFF, flash is uninitialised
		if (count == 0 && instance_id[0] == 0xFF) {
			sprintf(instance_id, "default");
			return;
		}
	}
	
}

//////////////////////////////////////////////////////////
// xPL handler
// This code is called in the main program loop to process
// xPL events and generate heartbeats.
// It keeps track of the time through the time_ticks 
// variable (volatile int) that is defined in the main c 
// file and that is incremented once per second through 
// a timer interrupt.
void xpl_handler(void) {
	switch (xpl_state) {
		case CONFIGURED:
			// Send hbeat every 5 minutes when configured
			if (time_ticks > 300) {
				xpl_send_hbeat();
				time_ticks = 0;
				return;
 			}
			break;
		case NOT_CONFIGURED:
			// Send configuration request every minute when not configured
			if (time_ticks > 60) {
				xpl_send_config_hbeat();
				time_ticks = 0;
				return;
			}
			break;
	}

	return;
}