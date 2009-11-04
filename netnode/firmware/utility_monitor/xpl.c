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

char xpl_rx_pointer;
char xpl_rx_buffer[RX_BUFSIZE];

struct xpl_message xpl_received_msg;

// Used by xpl_handler to keep track of the current state
enum XPL_STATE_TYPE { WAITING = 0, PROCESS_INCOMMING_MESSAGE};
enum XPL_STATE_TYPE xpl_state;
char configured = 0;

enum XPL_PARSE_TYPE { WAITING_CMND = 0, CMND_RECEIVED, WAITING_HEADER_END,WAITING_CMND_TYPE };
enum XPL_PARSE_TYPE xpl_msg_state;

// Used by the print_header function.
enum XPL_MSG_TYPE {STAT, TRIG};

// Following variable has to be declared in the main function and should be incremented every second.
extern volatile int time_ticks;

//////////////////////////////////////////////////////////
// xpl_update_nodename
//  Update the vendor-device_id.instance_id string 
//  to the current values
void xpl_update_nodename(void){
	//sprintf(xpl_target, "target=hollie-%s.%s", XPL_DEVICE_ID, xpl_instance_id);
	return;
}

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
	printf(".%s",xpl_instance_id);
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
// xpl_init_state
// Initialisation of the xPL states and message buffer
void xpl_reset_rx_buffer(void) {
    xpl_rx_pointer = 0;
    xpl_rx_buffer[xpl_rx_pointer] = '\0';

	// Every time we reset the buffer, we also need to re-enable the flow control
	_usart_putc(XON);
}    

//////////////////////////////////////////////////////////
// xpl_init_state
// Initialisation of the xPL states and message buffer
void xpl_init_state(void) {
    xpl_state      = WAITING; 
	xpl_msg_state  = WAITING_CMND;
	xpl_reset_rx_buffer();
}	

//////////////////////////////////////////////////////////
// xpl_init
// Initialisation of the xPL library. Tries to restore the
// INSTANCE_ID from EEPROM
void xpl_init(void){

	char count;

	xpl_init_state();
	
	configured = 0;

	// Get the instance ID from EEPROM
	// Maximum size = 16 chars + 1 null char
	for (count = 0; count < 16; count++){
		xpl_instance_id[count] = eeprom_read(count+XPL_INSTANCE_ID_OFFSET);

		// When we encounter the null, stop reading
		if (xpl_instance_id[count] == '\0') { 
			configured = 1;
			break;
		} 

		// When the first char is 0xFF, flash is uninitialised
		if (count == 0 && xpl_instance_id[0] == 0xFF) {
			sprintf(xpl_instance_id, "default");
			break;
		}
	}
    xpl_update_nodename();
	
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
		case PROCESS_INCOMMING_MESSAGE:		    
		    if (strcmpram2pgm("config.list", xpl_received_msg.cmnd) == 0) {
		        xpl_send_stat_config();
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
	
	// Flow control: send 0x13 to XPORT to stop the reception of serial data
	// We use direct _usart function here for speed reasons.
	if (data == '\n') {
		_usart_putc(XOFF);
	}

	if (xpl_rx_pointer >= 40) {
	    // reset all - msg is to long
	    xpl_init_state();
	}    
	if (data != '\n') {
	    xpl_rx_buffer[xpl_rx_pointer++] = data;
	    xpl_rx_buffer[xpl_rx_pointer] = '\0';
	} else {    
        switch (xpl_msg_state) {
        	case WAITING_CMND:
        	    // If it is a command header -> set buffer state to CMD_RECEIVED
    			if (strcmpram2pgm("xpl-cmnd", xpl_rx_buffer)==0) {
    			    xpl_msg_state = CMND_RECEIVED;
    			}
    			break;
    		case CMND_RECEIVED:  
        		// check if we have the target in the buffer
        		if (strcmpram2pgm("target=*", xpl_rx_buffer) == 0){
    				// Yes, message is wildcard and hence destined to us
    			    xpl_msg_state = WAITING_CMND_TYPE;
    			} else if (memcmpram2pgm("target=hollie-utilmon.", xpl_rx_buffer, 22)==0){
					if (strcmp(xpl_instance_id, xpl_rx_buffer + 22) == 0){
						// bingo message if for us
    				    xpl_msg_state = WAITING_HEADER_END;
					} else {
						// Too bad, message is not for us. Wait for the next one
						xpl_msg_state = WAITING_CMND;
					}
    			}                            	  
    		    break;
    	    case WAITING_HEADER_END:
    			if (xpl_rx_buffer[0] == '}') {
    			   xpl_msg_state = WAITING_CMND_TYPE;    			    
    			}
    			break;    		 
    		case WAITING_CMND_TYPE:    		    
        		if (strcmpram2pgm("config.list", xpl_rx_buffer) == 0) {
            	    xpl_state = PROCESS_INCOMMING_MESSAGE;  
            	    xpl_msg_state = WAITING_CMND;
            	    strcpy(xpl_received_msg.cmnd,xpl_rx_buffer); 
            	}   
            	// TODO 3: variables are not stored here but do not know yet how to store them.
            	// assume we receive x=y
            	// I would like to define 2 arrays 1 for storing the x values and one for the y
            	// but how long do we need to take the chars of arrays x and y
            	// and how long will the arrays be
            	// can we dynamicaly allocate?
				// Feedback -> well, remember we're runing this code on a PIC ;-)
				// I would just check for 'command' and put that into the struct. 
 				// The only messages we should support are 'rename your instance ID', 'broadcast your heartbeat'  and 'report your sensor readings' (this is pseudocode of course).
    		    break;   		    
        }
        xpl_reset_rx_buffer();			    
    }        	
}
