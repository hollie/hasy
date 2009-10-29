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
#include "string.h"

char xpl_instance_id[17];
char xpl_rx_buffer[40];
char xpl_rx_buffer_shadow[40];
char xpl_rx_pointer;
//char xpl_nodename[34];

// Used by xpl_handler to keep track of the current state
enum XPL_STATE_TYPE { WAITING = 0, PROCESS_BUFFER};
enum XPL_STATE_TYPE xpl_state;
char configured = 0;

enum XPL_PARSE_TYPE { WAITING = 0, CMND_RECEIVED, WAITING_CMND_TYPE };
enum XPL_PARSE_TYPE xpl_msg_state;

// Used by the print_header function.
enum XPL_MSG_TYPE {STAT, TRIG};

// Following variable has to be declared in the main function and should be incremented every second.
extern volatile int time_ticks;

//////////////////////////////////////////////////////////
// xpl_update_nodename
//  Update the vendor-device_id.instance_id string 
//  to the current values
//void xpl_update_nodename(void){
//	sprintf(xpl_nodename, "%s.%s", XPL_DEVICE_ID, xpl_instance_id);
//	return;
//}

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
	printf(".%s", xpl_instance_id);
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

void xpl_send_stat_config(void){
	xpl_print_header(STAT);
	printf("config.list\n{\nreconf=newconf\n}\n");
}
//////////////////////////////////////////////////////////
// xpl_init
// Initialisation of the xPL library. Tries to restore the
// INSTANCE_ID from EEPROM
void xpl_init(void){

	char count;

	xpl_state      = WAITING; 
	xpl_msg_state  = WAITING;
	xpl_rx_pointer = 0;
	configured     = 0;

	// Get the instance ID from EEPROM
	// Maximum size = 16 chars + 1 null char
	for (count = 0; count < 16; count++){
		xpl_instance_id[count] = eeprom_read(count+XPL_INSTANCE_ID_OFFSET);

		// When we encounter the null, stop reading
		if (xpl_instance_id[count] == '\0') { 
			configured = 1;
			return;
		} 

		// When the first char is 0xFF, flash is uninitialised
		if (count == 0 && xpl_instance_id[0] == 0xFF) {
			sprintf(xpl_instance_id, "default");
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
		case PROCESS_BUFFER:
			// Check what we have in the buffer
			// If we're awaiting message reception, check if we receive a command
			if (xpl_msg_state == WAITING) {
				// If it is a command header -> set buffer state to CMD_RECEIVED
				if (strcmpram2pgm("xpl-cmnd", xpl_rx_buffer_shadow)==0){
					xpl_msg_state = CMND_RECEIVED;
					xpl_state     = WAITING;
					return;
				}
			} 
			if (xpl_msg_state == CMND_RECEIVED){
				// Check if we are the target destination
				if (memcmpram2pgm("target=hollie-utilmon.", xpl_rx_buffer_shadow, 22)==0){
					// Todo: compare type, instance_id
					if (strcmp(xpl_instance_id, xpl_rx_buffer_shadow+22) == 0){
						// We have a match on our ID, go get the command
						xpl_msg_state = WAITING_CMND_TYPE;
						xpl_state     = WAITING;
						//return;
					} else {
						// Too bad, message is not for us. Wait for the next one
						xpl_msg_state = WAITING;
						xpl_state     = WAITING;
						return;
					}
 				} else if (strcmpram2pgm("target=*", xpl_rx_buffer_shadow)==0){
					// Yes, message is wildcard and hence destined to us
					xpl_msg_state = WAITING_CMND_TYPE;
				} 
			}
			
			if (xpl_msg_state == WAITING_CMND_TYPE){
				if (strcmpram2pgm("config.list", xpl_rx_buffer_shadow) == 0){
					xpl_send_stat_config();
				}

			}
			xpl_state = WAITING;
			break;
		case WAITING:
			// Send hbeat every 5 minutes when configured
			if (time_ticks > 300 && configured) {
				xpl_send_hbeat();
				time_ticks = 0;
				return;
 			}
			if (time_ticks > 60 && !configured) {
				xpl_send_config_hbeat();
				time_ticks = 0;
				return;
			}
			break;
	}

	return;
}

//////////////////////////////////////////////////////////
// xpl_addbyte
// Add a new byte from the USART to the receive buffer
void xpl_addbyte(char data){

	char res;

	if (data == '\n'){
		// If we receive end of line, terminate the string in memory and copy it 
        // to the 'buffer-to-be-processed'

		// Drop curly braces messages
		if (xpl_rx_buffer[0] == '{' || xpl_rx_buffer[0] == '}') {
			// Drop this
			xpl_rx_pointer = 0; 
			return;
		}

		xpl_rx_buffer[xpl_rx_pointer] = '\0';
		strcpy(xpl_rx_buffer_shadow, xpl_rx_buffer);
		xpl_rx_pointer = 0;

		// Notify the xpl_handler there is something to process
		xpl_state = PROCESS_BUFFER;

	} else {
		xpl_rx_buffer[xpl_rx_pointer++] = data;
	}
}
