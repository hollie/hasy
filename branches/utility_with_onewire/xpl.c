/*************************************************************
* xPL library
*
* (c) 2009
* Authors: Lieven Hollevoet
*          Dirk Buekenhoudt
**************************************************************
* target device   : PIC18F2520
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
*************************************************************/

#include <stdio.h>
#include <delays.h>

#include "xpl.h"
#include "oo.h"
#include "eeprom.h"
#include "string.h"

signed char xpl_rx_fifo_write_pointer;
signed char xpl_rx_fifo_read_pointer;
signed char xpl_rx_fifo_data_count;

char xpl_rx_fifo[XPL_RXFIFO_SIZE];

char xpl_instance_id[17];

char xpl_rx_pointer;
char xpl_rx_buffer_shadow[XPL_RX_BUFSIZE];

// Used by xpl_handler to keep track of the current state
enum XPL_STATE_TYPE { WAITING = 0, PROCESS_INCOMMING_MESSAGE_PART};
enum XPL_STATE_TYPE xpl_state;
char configured = 0;
char onewires_present = 0;


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
                           ELEC_DEVICE_CURRENT_MSG_TYPE,        \\
                           };



enum XPL_CMD_MSG_TYPE_RSP xpl_handle_message_part(void);

enum XPL_FLOW_TYPE {FLOW_OFF = 0, FLOW_ON = 1};
enum XPL_FLOW_TYPE xpl_flow;

char xpl_trig_register = 0;   /* bit 0 = GAS                              
                                 bit 1 = WATER
                                 bit 2 = ELEC */

// Following variable has to be declared in the main function and should be incremented every second.
extern volatile int time_ticks;
extern volatile unsigned char time_ticks_oo;

unsigned short xpl_count_gas;
unsigned short xpl_count_water;
unsigned short xpl_count_elec;
unsigned char  xpl_temp_index;

// We need to keep track of the temperatures in case an externel request is received,
// and to know if we need to send an xpl-trig
signed short   oo_temp_table[OO_SUPPORTED_DEVICE_COUNT];

// We need a FIFO to cover for the latency between sending a XOFF and the XPORT to react on this
void xpl_fifo_push_byte(char data){
    xpl_rx_fifo[xpl_rx_fifo_write_pointer++] = data;
    xpl_rx_fifo_data_count++;
    	
    if (xpl_rx_fifo_write_pointer == XPL_RXFIFO_SIZE) {
       	xpl_rx_fifo_write_pointer = 0;
    }
    
    // the value that we add here may not be lower than 10 otherwise its not working
    if (xpl_rx_fifo_data_count > XPL_RXFIFO_SIZE_THESHOLD && xpl_flow == FLOW_ON) {
        xpl_flow = FLOW_OFF; 
        putc(XOFF, _H_USART);
    }
}

char xpl_fifo_pop_byte(void){
	char popbyte;

	// Pop byte from fifo
	popbyte = xpl_rx_fifo[xpl_rx_fifo_read_pointer++];
	xpl_rx_fifo_data_count--;
	
	if (xpl_rx_fifo_read_pointer == XPL_RXFIFO_SIZE) {
    	xpl_rx_fifo_read_pointer = 0;
    }
	
	// Enable the software flow control if FIFO is almost empty and if the flow control is OFF
	if ((xpl_rx_fifo_data_count < 20) && (xpl_flow == FLOW_OFF)) {
		xpl_flow = FLOW_ON;
        putc(XON, _H_USART);
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
		printf("stat",xpl_instance_id);
	} else {
		printf("trig",xpl_instance_id);
	}

	printf("\n{\nhop=1\nsource=hollie-");
    printf(XPL_DEVICE_ID);	
	printf(".%s\ntarget=*\n}\n",xpl_instance_id);
}

//////////////////////////////////////////////////////////
// xpl_send_hbeat
//  Send out a normal heartbeat
void xpl_send_hbeat(void){
	xpl_print_header(STAT);
	printf("hbeat.basic\n{\ninterval=5\nversion=%i\n",XPL_VERSION);
	if (onewires_present){
		printf("tempsensors=%i\n", oo_get_devicecount());
	}
	printf("}\n");
	return;
}

//////////////////////////////////////////////////////////
// xpl_send_hbeat
//  Request configuration by the config manager
//  This function is called by xpl_handler when no valid 
//  INSTANCE_ID is found in EEPROM by the xpl_init function.
void xpl_send_config_hbeat(void){
	xpl_print_header(STAT);
	printf("config.basic\n{\ninterval=1\nversion=%i\n}\n",XPL_VERSION);
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

void xpl_send_sensor_basic(enum XPL_MSG_TYPE msg_type,const rom far char* device, unsigned short count) {
    xpl_print_header(msg_type);
    printf("sensor.basic\n{\ndevice=");
    printf(device);
    printf("\ntype=count\ncurrent=%u\n}\n",count);

	return;
}    

void xpl_send_sensor_temperature(enum XPL_MSG_TYPE msg_type, unsigned char index) {

	oo_tdata tsens;
	char loper;
	float temp_hr = -10;
	char temp_whole;
	unsigned char temp_part;

	tsens = oo_get_device_info(index);

	// If CRC is not valid, return here
	if (tsens.valid == 0){
		return;
	}

	// Convert temperature to float
	// This depends on the family of sensor used
	switch(tsens.id[0])	{
		case 0x28: // DS18B20
			temp_hr = (float)tsens.temperature / 16;
			break;
		default:
			break;
	}

	// Convert float to two chars, as the printf does not support printing floats
	temp_whole = (signed char)temp_hr;
	temp_part  = (unsigned char)(temp_hr*100 - (float)temp_whole*100);
	xpl_print_header(msg_type);

    printf("sensor.basic\n{\ndevice=");
	for (loper=0; loper<8; loper++){
		printf("%02X", tsens.id[loper]);
	}
    printf("\ntype=temp\ncurrent=%i.%i\n}\n",temp_whole, temp_part);

	return;
}

void xpl_send_device_current(enum XPL_MSG_TYPE msg_type,enum XPL_DEVICE_TYPE type) {
    unsigned short count = 1; 
   
    
    switch (type) {
        case GAS:
            if (msg_type == STAT) {
                count = xpl_count_gas;      
                xpl_count_gas = xpl_count_gas - count; 
            }   
            xpl_send_sensor_basic(msg_type,"gas",count);
            break;   
        case WATER:
            if (msg_type == STAT) {
                count = xpl_count_water;  
                xpl_count_water = xpl_count_water - count; 
            }    
            xpl_send_sensor_basic(msg_type,"water",count);              
            break;
        case ELEC:
            if (msg_type == STAT) {
                count = xpl_count_elec;
                xpl_count_elec = xpl_count_elec - count; 
            }    
            xpl_send_sensor_basic(msg_type,"elec",count);
            break;
		case TEMP:
			xpl_send_sensor_temperature(msg_type,xpl_temp_index);
			break;
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

	// Init the helper libraries do that we know if need to 
	// library specific code
	if (!oo_init()){
		onewires_present = 1;
	}

    xpl_init_instance_id();
    
    xpl_count_gas = 0;
    xpl_count_water = 0;
    xpl_count_elec = 0;
    
    // Only apply this function after we have read the EEPROM, as we enable serial reception
	// in this function and when we do that we need to know our ID.
	xpl_init_state();
	
	xpl_rx_fifo_write_pointer = 0;
	xpl_rx_fifo_read_pointer = 0;
	xpl_rx_fifo_data_count = 0;
	
	xpl_flow = FLOW_ON;
	putc(XON, _H_USART);
}

//////////////////////////////////////////////////////////
// xpl_addbyte
// Add a new byte from the USART to the receive buffer
void xpl_addbyte(char data){
	if (data != '\n') {
    	if (xpl_rx_pointer >= XPL_RX_BUFSIZE) {
            printf("RX OVERFLOW: [%s]",xpl_rx_buffer_shadow);
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

	unsigned char index;

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
    		    case WATER_DEVICE_CURRENT_MSG_TYPE:
    		        xpl_send_device_current(STAT,WATER);
    		        break;
    		     case ELEC_DEVICE_CURRENT_MSG_TYPE:
    		        xpl_send_device_current(STAT,ELEC);
    		        break;
    		}    
			// Once the message is processed, reset the buffer and return to waiting state.
		    xpl_state = WAITING;
			xpl_reset_rx_buffer();
			break;
		case WAITING:
			// If there is data in the rx fifo, add it to the RX buffer
			if (xpl_rx_fifo_write_pointer != xpl_rx_fifo_read_pointer){
				xpl_addbyte(xpl_fifo_pop_byte());
			} 
			
			// send trig message out once we receice the interrupt
			if (xpl_trig_register != 0 /*&&  == 1 /* last && is for test only */) {
    			if (xpl_trig_register & GAS) {
        		    xpl_send_device_current(TRIG,GAS);
        		    xpl_trig_register &= 0xFE; // Need to hardcode this, compiler does not like the !GAS
                } else if (xpl_trig_register & WATER) {
        		    xpl_send_device_current(TRIG,WATER);
        		    xpl_trig_register &= 0xFD;
        		} else if (xpl_trig_register & ELEC) {
        		    xpl_send_device_current(TRIG,ELEC);	
        		    xpl_trig_register &= 0xFB; 
        		} else {
					xpl_trig_register = 0;
     	        }
			}

			// Send hbeat every 5 minutes when configured
			if (time_ticks > 300 && configured) {
				xpl_send_hbeat();
				time_ticks = 0;
				return;
 			}
			
			// When not configured, send out config hbeat every minute
    		if (time_ticks > 60 && !configured) {
				xpl_send_config_hbeat();
				time_ticks = 0;
				return;
			}

			// Poll the temperature sensors every minute
			if (time_ticks_oo > 60 && onewires_present && configured) {
				time_ticks_oo = 0;
				oo_read_temperatures();				
			}

			// And check if temp trig messages need to be sent out
			if (onewires_present && configured) {
				for (index=0; index < oo_get_devicecount(); index++) {
					if (oo_temp_table[index] != oo_get_device_temp(index)){
						oo_temp_table[index] = oo_get_device_temp(index);
						xpl_temp_index = index;
						xpl_send_device_current(TRIG,TEMP);
					}
				}
			}


			break;
		default:
		    printf("xpl_handler:default - state %d - WE SHOULD NEVER BE HERE ",xpl_state);
		    break;
	}
	return;
}

enum XPL_CMD_MSG_TYPE_RSP xpl_handle_message_part(void) { 
	char lpcount;
	char strlength;
    
    //printf("\nmp@st%d@flc%d@fd%d@fwp%d@fwr%d@%s",xpl_msg_state,xpl_flow,xpl_rx_fifo_data_count,xpl_rx_fifo_write_pointer,xpl_rx_fifo_read_pointer,xpl_rx_buffer_shadow);
        
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
    		} else if (strcmpram2pgm("device=water", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
		        return WATER_DEVICE_CURRENT_MSG_TYPE;
    		} else if (strcmpram2pgm("device=elec", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
		        return ELEC_DEVICE_CURRENT_MSG_TYPE;
    		} else {
    		    xpl_msg_state = WAITING_CMND;		  
    		}   
		    break;
		
		case WAITING_CMND_CONFIG_RESPONSE:
		    // what we write here depends on the node type, this is not yet generic code :(
		    // maybe we need to implement here a function from the xpl_impl.c file
			// For now we just parse the instance_id and put it in EEPROM
		    if (strncmpram2pgm("newconf=", xpl_rx_buffer_shadow, 8) == 0) {
    		    // Make sure we're not receiving data right now, as interrupts will be disabled during EEPROM write later in this function
				if (xpl_flow == FLOW_ON) { 
    				xpl_flow = FLOW_OFF;
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
    		    xpl_flow = FLOW_ON;
				putc(XON, _H_USART);
    		       		  
				return HEARTBEAT_MSG_TYPE;
    		}    
		    break;	    
    }   
    return -1;
}

// Increment the counter for the sensor and ensure a trig message is sent out.
// This function should be called from the sensor pin interrupt handler
void xpl_trig(enum XPL_DEVICE_TYPE sensor){
	switch (sensor){
	case WATER:
		xpl_count_water++;
		xpl_trig_register |= WATER;
		break;
	case GAS:
		xpl_count_gas++;
		xpl_trig_register |= GAS;
		break;
	case ELEC:
		xpl_count_elec++;
		xpl_trig_register |= ELEC;
		break;
	default:
		printf("Error: invalid sensor");
		break;
	}
}