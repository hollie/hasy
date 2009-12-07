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
#include <delays.h>

#include "xpl.h"
#include "eeprom.h"
#include "string.h"

signed char xpl_rx_write_fifo_pointer;
signed char xpl_rx_read_fifo_pointer;
signed char xpl_rx_fifo_data_count;

char xpl_rx_fifo[XPL_RXFIFO_SIZE];

char xpl_instance_id[17];

char xpl_rx_pointer;
char xpl_rx_buffer_shadow[XPL_RX_BUFSIZE];

// Used by xpl_handler to keep track of the current state
enum XPL_STATE_TYPE { WAITING = 0, PROCESS_INCOMMING_MESSAGE_PART};
enum XPL_STATE_TYPE xpl_state;
char configured = 0;

enum XPL_PARSE_TYPE {   WAITING_CMND = 0,                   \\
                        CMND_RECEIVED,                      \\
                        WAITING_CMND_TYPE,                  \\
                        WAITING_CMND_SENSOR_REQUEST,        \\
                        WAITING_CMND_CONFIG_RESPONSE,       \\
                        WAITING_CMND_HBEAT_REQUEST,         \\
                        WAITING_CMND_CONFIG_CURRENT,        \\
                        WAITING_CMND_SENSOR_REQUEST_DEVICE  \\
                        };
                        
enum XPL_PARSE_TYPE xpl_msg_state;

// Used by the print_header function.
enum XPL_MSG_TYPE {STAT, TRIG};

enum XPL_CMD_MSG_TYPE_RSP {HEARTBEAT_MSG_TYPE = 0,              \\
                           CONFIGURATION_CAPABILITIES_MSG_TYPE, \\
                           CONFIG_STATUS_MSG_TYPE,              \\
                           GAS_DEVICE_CURRENT_MSG_TYPE,         \\
                           WATER_DEVICE_CURRENT_MSG_TYPE,       \\
                           ELEC_DAY_DEVICE_CURRENT_MSG_TYPE,    \\
                           ELEC_NIGTH_DEVICE_CURRENT_MSG_TYPE   \\
                           };

enum XPL_DEVICE_TYPE      {GAS = 1,     \\
                           WATER = 2,       \\
                           ELEC_DAY = 4,    \\
                           ELEC_NIGTH = 8   \\
                           };

enum XPL_CMD_MSG_TYPE_RSP xpl_handle_message_part(void);

enum XPL_FLOW_TYPE {FLOW_OFF = 0, FLOW_ON = 1};
enum XPL_FLOW_TYPE xpl_flow;

char xpl_trig_register = 0;   /* bit 0 = GAS                              
                                 bit 1 = WATER
                                 bit 2 = ELEC_DAY
                                 bit 3 = ELEC_NIGTH */

// Following variable has to be declared in the main function and should be incremented every second.
extern volatile int time_ticks;

unsigned short xpl_count_gas;
/*unsigned short xpl_count_water;
unsigned short xpl_count_elec_nigth;
unsigned short xpl_count_elec_day;*/

// We need a FIFO to cover for the latency between sending a XOFF and the XPORT to react on this
void xpl_fifo_push_byte(char data){
    xpl_rx_fifo[xpl_rx_write_fifo_pointer++] = data;
    xpl_rx_fifo_data_count++;
    	
    if (xpl_rx_write_fifo_pointer == XPL_RXFIFO_SIZE) {
       	xpl_rx_write_fifo_pointer = 0;
    }
    // the value that we add here may not be lower than 10 otherwise its not working
    if ((xpl_rx_fifo_data_count + 10) > XPL_RXFIFO_SIZE && xpl_flow == FLOW_ON) {
        putc(XOFF, _H_USART);
		xpl_flow = FLOW_OFF; 
    }    
}

char xpl_fifo_pop_byte(void){
	char popbyte;

	// Pop byte from fifo
	popbyte = xpl_rx_fifo[xpl_rx_read_fifo_pointer++];
	xpl_rx_fifo_data_count--;
	
	if (xpl_rx_read_fifo_pointer == XPL_RXFIFO_SIZE) {
    	xpl_rx_read_fifo_pointer = 0;
    }
	
	// Enable the software flow control if FIFO is almost empty and if the flow control is OFF
	if (xpl_rx_fifo_data_count < 20 && xpl_flow == FLOW_OFF) {
        putc(XON, _H_USART);	
		xpl_flow = FLOW_ON;
    }
	return popbyte;
}

//////////////////////////////////////////////////////////
// xpl_print_header
//  Prints the header of the xpl messages sent out
//  This is a separate function to reduce the 
//  program memory size (reuse this function)
void xpl_print_header(enum XPL_MSG_TYPE type){

	printf("xpl-");
	if (type == STAT) {
		printf("stat\n{\nhop=1\nsource=hollie-utilmon.%s\ntarget=*\n}\n",xpl_instance_id);
	} else {
		printf("trig\n{\nhop=1\nsource=hollie-utilmon.%s\ntarget=*\n}\n",xpl_instance_id);
	}
	// code to reduce memory utilimon is now hard coded!
	// printf("\n{\nhop=1\nsource=hollie-");
    // printf(XPL_DEVICE_ID);	
	// printf(".%s\ntarget=*\n}\n",xpl_instance_id);
}

//////////////////////////////////////////////////////////
// xpl_send_hbeat
//  Send out a normal heartbeat
void xpl_send_hbeat(void){
	xpl_print_header(STAT);
	printf("hbeat.basic\n{\ninterval=5\nversion=1.0d\n}\n");
	return;
}

//////////////////////////////////////////////////////////
// xpl_send_hbeat
//  Request configuration by the config manager
//  This function is called by xpl_handler when no valid 
//  INSTANCE_ID is found in EEPROM by the xpl_init function.
void xpl_send_config_hbeat(void){
	xpl_print_header(STAT);
	printf("config.basic\n{\ninterval=1\nversion=1.0d\n}\n");
	return;
}

//////////////////////////////////////////////////////////
// xpl_send_hbeat
//  Request configuration by the config manager
//  This function is called by xpl_handler when no valid 
//  INSTANCE_ID is found in EEPROM by the xpl_init function.
void xpl_send_config_end(void){
	xpl_print_header(STAT);
	printf("config.end\n{\ninterval=1\n}\n");
	return;
}

//////////////////////////////////////////////////////////
// xpl_send_stat_configuration_capabilities
//  Request config by the config manager
//  send the current configuration possibilities of the node to the config manager
void xpl_send_stat_configuration_capabilities(void){
	xpl_print_header(STAT);
	printf("config.list\n{\nreconf=newconf\n}\n");
	return;
}

//////////////////////////////////////////////////////////
// xpl_send_stat_config
//  Request config by the config manager
//  send the current configuration of the node to the config manager
void xpl_send_stat_config(void){
	xpl_print_header(STAT);
	printf("config.current\n{\nnewconf=%s\n}\n",xpl_instance_id);
	return;
}

void xpl_send_sensor_basic(char *device, unsigned short count) {
    printf("sensor.basic\n{\ndevice=%s\ntype=count\ncurrent=%u\n}\n",*device,count);
}    

void xpl_send_device_current(enum XPL_MSG_TYPE msg_type,enum XPL_DEVICE_TYPE type) {
    unsigned short count;
    
    xpl_print_header(msg_type);
    
    switch (type) {
        case GAS:
            count = xpl_count_gas;      
            xpl_count_gas = xpl_count_gas - count; 
            xpl_send_sensor_basic("gas",count);
            break;   
        /*case WATER:
            count = xpl_count_water;  
            xpl_count_water = xpl_count_water - count; 
            xpl_send_sensor_basic("water",count);              
            break;
        case ELEC_DAY:
            count = xpl_count_elec_day;
            xpl_count_elec_day = xpl_count_elec_day - count; 
            xpl_send_sensor_basic("elec-day",count);
            break;
        case ELEC_NIGTH:
            count = xpl_count_elec_nigth;      
            xpl_count_elec_nigth = xpl_count_elec_nigth - count; 
            xpl_send_sensor_basic("elec-nigth",count);  
            break;      */
    }    
    return;
}    

//////////////////////////////////////////////////////////
// xpl_reset_rx_buffer
// Initialisation of the xPL rx buffer
void xpl_reset_rx_buffer(void) {
    xpl_rx_pointer = 0;
    xpl_rx_buffer_shadow[xpl_rx_pointer] = '\0';
}    

//////////////////////////////////////////////////////////
// xpl_init_state
// Initialisation of the xPL states and message buffer
void xpl_init_state(void) {
    // reset all states
    xpl_state           = WAITING; 
	xpl_msg_state       = WAITING_CMND;
	// initialize the rx buffer
	xpl_reset_rx_buffer();
}	

void xpl_init_instance_id(void) {
    char count;

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
// xpl_init
// Initialisation of the xPL library. Tries to restore the
// INSTANCE_ID from EEPROM
void xpl_init(void){

    xpl_init_instance_id();
    
    xpl_count_gas = 0;
    /*xpl_count_water = 0;
    xpl_count_elec_nigth = 0;
    xpl_count_elec_day = 0;*/
    
    // Only apply this function after we have read the EEPROM, as we enable serial reception
	// in this function and when we do that we need to know our ID.
	xpl_init_state();
	
	xpl_rx_write_fifo_pointer = 0;
	xpl_rx_read_fifo_pointer = 0;
	xpl_rx_fifo_data_count = 0;
	
	putc(XON, _H_USART);	
	xpl_flow = FLOW_ON;
}

//////////////////////////////////////////////////////////
// xpl_addbyte
// Add a new byte from the USART to the receive buffer
void xpl_addbyte(char data){
	if (data != '\n') {
    	if (xpl_rx_pointer >= XPL_RX_BUFSIZE) {
            printf("RX OVERFLOW: %s",xpl_rx_buffer_shadow);
	        xpl_init_state();
			return;
	    }
	    xpl_rx_buffer_shadow[xpl_rx_pointer++] = data;
	} else {
	    xpl_rx_buffer_shadow[xpl_rx_pointer] = '\0';

	    // This will enable the handling in the handler function of the received string
	    xpl_state = PROCESS_INCOMMING_MESSAGE_PART;    
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
    enum XPL_CMD_MSG_TYPE_RSP xpl_cmd_msg_type;

	switch (xpl_state) {
		case PROCESS_INCOMMING_MESSAGE_PART:
		    xpl_cmd_msg_type = xpl_handle_message_part();
		    
		    // depending on the message part we send out 3 type of messages
		    switch (xpl_cmd_msg_type) {
    		    case HEARTBEAT_MSG_TYPE:
    		        xpl_send_hbeat();
    		        break;
    		    case CONFIGURATION_CAPABILITIES_MSG_TYPE:
                    xpl_send_stat_configuration_capabilities();
    		        break;
    		    case CONFIG_STATUS_MSG_TYPE:
    		        xpl_send_stat_config();
    		        break;
    		    case GAS_DEVICE_CURRENT_MSG_TYPE:
    		        xpl_send_device_current(STAT,GAS);
    		        break;
    		    /* NOT ENOUGH STORAGE case WATER_DEVICE_CURRENT_MSG_TYPE:
    		        xpl_send_device_current(STAT,WATER);
    		        break;
    		     case ELEC_DAY_DEVICE_CURRENT_MSG_TYPE:
    		        xpl_send_device_current(STAT,ELEC_DAY);
    		        break;
    		    case ELEC_NIGTH_DEVICE_CURRENT_MSG_TYPE:
    		        xpl_send_device_current(STAT,ELEC_NIGTH);
    		        break;  */  
    		}    
			// Once the message is processed, reset the buffer and return to waiting state.
		    xpl_state = WAITING;
			xpl_reset_rx_buffer();
			break;
		case WAITING:
			// If there is data in the rx fifo, add it to the RX buffer
			if (xpl_rx_write_fifo_pointer != xpl_rx_read_fifo_pointer){
				xpl_addbyte(xpl_fifo_pop_byte());
			}

			// Send hbeat every 5 minutes when configured
			if (time_ticks > 300 && configured) {
				xpl_send_hbeat();
				time_ticks = 0;
				
// TEST CODE BEGIN
				xpl_trig_register |= GAS;
				xpl_count_gas++;				
// TEST CODE END BEGIN				
				return;
 			}
			if (time_ticks > 60 && !configured) {
				xpl_send_config_hbeat();
				time_ticks = 0;
				return;
			}
			
			// send trig message out once we receice the interrupt
			if (xpl_trig_register != 0) {
    			if ((xpl_trig_register & GAS) == 1) {
        		    xpl_send_device_current(TRIG,GAS);
        		    xpl_trig_register &= !GAS;
                } else if ((xpl_trig_register & WATER) == 1) {
        		    xpl_send_device_current(TRIG,WATER);
        		    xpl_trig_register &= !WATER;
        		} else if ((xpl_trig_register & ELEC_DAY) == 1) {
        		    xpl_send_device_current(TRIG,ELEC_DAY);	
        		    xpl_trig_register &= !ELEC_DAY;
        		} else if ((xpl_trig_register & ELEC_NIGTH) == 1) {
        		    xpl_send_device_current(TRIG,ELEC_NIGTH);
        		    xpl_trig_register &= !ELEC_NIGTH;
        		} else {
        		    xpl_trig_register = 0;
        		} 
            }			
			break;
	}

	return;
}

enum XPL_CMD_MSG_TYPE_RSP xpl_handle_message_part(void) { 
	char lpcount;
	char strlength;
    
    //printf("\nmp@st%d@flc%d@fd%d@fwp%d@fwr%d@%s",xpl_msg_state,xpl_flow,xpl_rx_fifo_data_count,xpl_rx_write_fifo_pointer,xpl_rx_read_fifo_pointer,xpl_rx_buffer_shadow);
        
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
			} else if (strncmpram2pgm("target=hollie-utilmon.", xpl_rx_buffer_shadow, XPL_TARGET_VENDOR_DEVICEID_INSTANCE_ID_OFFSET)==0){
				if (strcmp(xpl_instance_id, xpl_rx_buffer_shadow + XPL_TARGET_VENDOR_DEVICEID_INSTANCE_ID_OFFSET) == 0){
					// bingo message if for us
				    xpl_msg_state = WAITING_CMND_TYPE;
				} else {
					// Too bad, message is not for us. Wait for the next one
					xpl_msg_state = WAITING_CMND;
				}
			}                            	  
			break;    		 
		case WAITING_CMND_TYPE:    		    
    		if (strcmpram2pgm("config.list", xpl_rx_buffer_shadow) == 0) {
				// No need to wait for the command here, this is a simple device, we only support one command        	
				xpl_msg_state = WAITING_CMND;
    		    return CONFIGURATION_CAPABILITIES_MSG_TYPE;
        	} else if (strcmpram2pgm("config.response", xpl_rx_buffer_shadow) == 0) {
        	    xpl_msg_state = WAITING_CMND_CONFIG_RESPONSE;
        	} else if (strcmpram2pgm("sensor.request", xpl_rx_buffer_shadow) == 0) {
        	    xpl_msg_state = WAITING_CMND_SENSOR_REQUEST;
        	} else if (strcmpram2pgm("hbeat.request", xpl_rx_buffer_shadow) == 0) {
        	    xpl_msg_state = WAITING_CMND_HBEAT_REQUEST;
        	} else if (strcmpram2pgm("config.current", xpl_rx_buffer_shadow) == 0) {
        	    xpl_msg_state = WAITING_CMND_CONFIG_CURRENT;
            } else if (strcmpram2pgm("}", xpl_rx_buffer_shadow) == 0) {
                // just wait for command
            } else {
        	    xpl_msg_state = WAITING_CMND;
        	}
		    break;
		case WAITING_CMND_CONFIG_CURRENT:
		    if (strcmpram2pgm("command=request", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
    		    return CONFIG_STATUS_MSG_TYPE;
    		} 
		    break;
		case WAITING_CMND_HBEAT_REQUEST:
		    if (strcmpram2pgm("command=request", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
    		    return HEARTBEAT_MSG_TYPE;
    		}    
		    break;   
		case WAITING_CMND_SENSOR_REQUEST:
            if (strcmpram2pgm("command=current", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND_SENSOR_REQUEST_DEVICE;    		
    		} else if (xpl_rx_buffer_shadow[0] == '{') {
    		    //do nothing
    		} else {
    		    xpl_msg_state = WAITING_CMND;
    		}
		    break;
		
		case WAITING_CMND_SENSOR_REQUEST_DEVICE:
		    if (strcmpram2pgm("device=gas", xpl_rx_buffer_shadow) == 0) {
                xpl_msg_state = WAITING_CMND;
    		    return GAS_DEVICE_CURRENT_MSG_TYPE; 
    		} /*else if (strcmpram2pgm("device=water", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
		        return WATER_DEVICE_CURRENT_MSG_TYPE;
    		} else if (strcmpram2pgm("device=elec-day", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
		        return ELEC_DAY_DEVICE_CURRENT_MSG_TYPE;
    		} else if (strcmpram2pgm("device=elec-nigth", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
		        return ELEC_NIGTH_DEVICE_CURRENT_MSG_TYPE;
    		}*/ else {
    		    xpl_msg_state = WAITING_CMND;		  
    		}   
		    break;
		
		case WAITING_CMND_CONFIG_RESPONSE:
		    // what we write here depends off the node type, this is not yet generic code :(
		    // maybe we need to implement here a function from the xpl_impl.c file
			// For now we just parse the instance_id and put it in EEPROM
		    if (strncmpram2pgm("newconf=", xpl_rx_buffer_shadow, 8) == 0) {
    		    // Make sure we're not receiving data right now, as interrupts will be disabled during EEPROM write later in this function
				if (xpl_flow == FLOW_ON) { 
				    putc(XOFF, _H_USART); 
				}
				
				// We are about to change our ID here, so send an end message to notify the network
				xpl_send_config_end();

    		    // Copy the new instance id to the correct variable
    		    strcpy(xpl_instance_id,xpl_rx_buffer_shadow + 8);
				// Put the new instance id name in EEPROM so that it retains value after a power cycle
				strlength = strlen(xpl_instance_id); // We put this in a local variable because else it it re-calculated every loop cycle
				for (lpcount=0; lpcount < strlength; lpcount++){
					eeprom_write(lpcount+XPL_EEPROM_INSTANCE_ID_OFFSET, xpl_instance_id[lpcount]);
				}

				// End with a '\0' in EEPROM
				eeprom_write(lpcount+XPL_EEPROM_INSTANCE_ID_OFFSET, 0x00);

				// Reset the xpl function to apply the new name
				// Buffer content gets lost here, but we don't mind as we need to start again
				xpl_init_instance_id();
				    		       		    
    		    xpl_msg_state = WAITING_CMND;
				putc(XON, _H_USART);
    		       		  
				return HEARTBEAT_MSG_TYPE;
    		}    
		    break;	    
    }   
    return -1;
}

