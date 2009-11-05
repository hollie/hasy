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
char xpl_rx_buffer_shadow[RX_BUFSIZE];

// Used by xpl_handler to keep track of the current state
enum XPL_STATE_TYPE { WAITING = 0, PROCESS_INCOMMING_MESSAGE_PART};
enum XPL_STATE_TYPE xpl_state;
char configured = 0;

enum XPL_PARSE_TYPE { WAITING_CMND = 0, CMND_RECEIVED, WAITING_HEADER_END,WAITING_CMND_TYPE,WAITING_CMND_SENSOR_REQUEST, WAITING_CMND_CONFIG_LIST,WAITING_CMND_CONFIG_RESPONSE,WAITING_CMND_HBEAT_REQUEST};
enum XPL_PARSE_TYPE xpl_msg_state;

// Used by the print_header function.
enum XPL_MSG_TYPE {STAT, TRIG};

enum XPL_CMD_MSG_TYPE {HEARTBEAT_MSG_TYPE = 0,STATUS_MSG_TYPE,CONFIGURATION_CAPABILITIES_MSG_TYPE};

enum XPL_CMD_MSG_TYPE xpl_handle_message_part(void);

/*

xpl-cmnd
{
hop=1
source=xpl-xplhal.myhouse
target=*
}
hbeat.request
{
command=request
}


xpl-cmnd
{
hop=1
source=xpl-xplhal.myhouse
target=acme-tempsens.garage
}
sensor.request
{
command=status
}


xpl-cmnd
{
hop=1
source=xpl-xplhal.myhouse
target=acme-lamp.default
}
config.list
{
command=request
}

xpl-cmnd
{
hop=1
source=xpl-xplhal.myhouse
target=acme-lamp.default
}
config.response
{
newconf=lounge
interval=30
} 
*/

// Following variable has to be declared in the main function and should be incremented every second.
extern volatile int time_ticks;

//////////////////////////////////////////////////////////
// xpl_update_nodename
//  Update the vendor-device_id.instance_id string 
//  to the current values
//void xpl_update_nodename(void){
	//sprintf(xpl_target, "target=hollie-%s.%s", XPL_DEVICE_ID, xpl_instance_id);
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

//////////////////////////////////////////////////////////
// xpl_send_status
//  Request status by the config manager
//  send the current status of the node to the config manager
void xpl_send_status(void) {
    xpl_print_header(STAT);
    printf("config.current\n{\ninterval=1\n}\n");
}    

//////////////////////////////////////////////////////////
// xpl_send_stat_config
//  Request config by the config manager
//  send the current configuration possibilities of the node to the config manager
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
    // reset all states
    xpl_state      = WAITING; 
	xpl_msg_state  = WAITING_CMND;
	
	// initialize the rx buffer
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
		xpl_instance_id[count] = eeprom_read(count+XPL_EEPROM_INSTANCE_ID_OFFSET);

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
    enum XPL_CMD_MSG_TYPE xpl_cmd_msg_type;

	switch (xpl_state) {
		case PROCESS_INCOMMING_MESSAGE_PART:		    
		    xpl_cmd_msg_type = xpl_handle_message_part();
		    
		    // depending on the message part we send out 3 type of messages
		    switch (xpl_cmd_msg_type) {
    		    case HEARTBEAT_MSG_TYPE:
    		        xpl_send_hbeat();
    		        break;
    		    case STATUS_MSG_TYPE:
    		        xpl_send_status();
    		        break;
    		    case CONFIGURATION_CAPABILITIES_MSG_TYPE:
                    xpl_send_stat_config();
    		        break;
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

enum XPL_CMD_MSG_TYPE xpl_handle_message_part(void) {
 
    switch (xpl_msg_state) {
       	case WAITING_CMND:
       	    // If it is a command header -> set buffer state to CMD_RECEIVED
			if (strcmpram2pgm("xpl-cmnd", xpl_rx_buffer_shadow)==0) {
			    xpl_msg_state = CMND_RECEIVED;
			}
			break;
		case CMND_RECEIVED:  
    		// check if we have the target in the buffer
    		if (strcmpram2pgm("target=*", xpl_rx_buffer_shadow) == 0){
				// Yes, message is wildcard and hence destined to us
			    xpl_msg_state = WAITING_CMND_TYPE;
			} else if (memcmpram2pgm("target=hollie-utilmon.", xpl_rx_buffer_shadow, XPL_TARGET_VENDOR_DEVICEID_INSTANCE_ID_OFFSET)==0){
				if (strcmp(xpl_instance_id, xpl_rx_buffer_shadow + XPL_TARGET_VENDOR_DEVICEID_INSTANCE_ID_OFFSET) == 0){
					// bingo message if for us
				    xpl_msg_state = WAITING_HEADER_END;
				} else {
					// Too bad, message is not for us. Wait for the next one
					xpl_msg_state = WAITING_CMND;
				}
			}                            	  
		    break;
	    case WAITING_HEADER_END:
			if (xpl_rx_buffer_shadow[0] == '}') {
			   xpl_msg_state = WAITING_CMND_TYPE;    			    
			}
			break;    		 
		case WAITING_CMND_TYPE:    		    
    		if (strcmpram2pgm("config.list", xpl_rx_buffer_shadow) == 0) {
        	    xpl_msg_state = WAITING_CMND_CONFIG_LIST; 
        	} else if (strcmpram2pgm("config.response", xpl_rx_buffer_shadow) == 0) {
        	    xpl_msg_state = WAITING_CMND_CONFIG_RESPONSE;
        	} else if (strcmpram2pgm("sensor.request", xpl_rx_buffer_shadow) == 0) {
        	    xpl_msg_state = WAITING_CMND_SENSOR_REQUEST;
        	} else if (strcmpram2pgm("hbeat.request", xpl_rx_buffer_shadow) == 0) {
        	    xpl_msg_state = WAITING_CMND_HBEAT_REQUEST;
            } else {
        	    xpl_msg_state = WAITING_CMND;
        	}
		    break;
		case WAITING_CMND_HBEAT_REQUEST:
		    if (strcmpram2pgm("command=request", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
    		    return HEARTBEAT_MSG_TYPE;
    		}    
		    break;   
		case WAITING_CMND_SENSOR_REQUEST:
		    if (strcmpram2pgm("command=status", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
    		    return STATUS_MSG_TYPE;
    		}    
		    break;
		
		case WAITING_CMND_CONFIG_LIST:
		    if (strcmpram2pgm("command=request", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
    		    return CONFIGURATION_CAPABILITIES_MSG_TYPE;
    		}    
		    break;	
		case WAITING_CMND_CONFIG_RESPONSE:
		    // what we write here depends off the node type, this is not yet generic code :(
		    // maybe we need to implement here a function from the xpl_impl.c file
		    if (strcmpram2pgm("newconf=", xpl_rx_buffer_shadow) == 0, 9) {
    		    // we need to strip off the new xpl_instance_id
    		    strcpy(xpl_instance_id,xpl_rx_buffer_shadow + 9);
    		    xpl_msg_state = WAITING_CMND;
    		}    
		    break;	    
    }   
    return -1;
}    

//////////////////////////////////////////////////////////
// xpl_addbyte
// Add a new byte from the USART to the receive buffer
void xpl_addbyte(char data){	
	// Flow control: send 0x13 to XPORT to stop the reception of serial data
	// We use direct _usart function here for speed reasons.
	if (data == '\n') {
		_usart_putc(XOFF);
	}
	
	// keep the processing short to not loose any data
	if (data != '\n') {
    	if (xpl_rx_pointer >= RX_BUFSIZE) {
	        // reset all - msg is to long
	        xpl_init_state();
	    }    
    	
	    xpl_rx_buffer[xpl_rx_pointer++] = data;
	    
	    if (xpl_rx_pointer >= RX_BUFSIZE) {
	        xpl_rx_buffer[xpl_rx_pointer] = '\0';
	    }    
	} else {
	    // copy to shadow buffer, like this we free up the rx buffer for other events from the uart port
	    strcpy(xpl_rx_buffer_shadow,xpl_rx_buffer);
	    
	    // This will enable the handling in the handler function of the received string
	    xpl_state = PROCESS_INCOMMING_MESSAGE_PART;    
	    
        xpl_reset_rx_buffer();			    
    }        	
}
