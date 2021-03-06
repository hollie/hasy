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
#include <limits.h>
#include <timers.h>
#include <pwm.h>
#include <string.h>

#include "xpl.h"
#include "oo.h"
#include "eeprom.h"
#include "output.h"
#include "utility_monitor.h"

signed   char xpl_rx_fifo_write_pointer;
signed   char xpl_rx_fifo_read_pointer;
signed   char xpl_rx_fifo_data_count;
unsigned char xpl_rx_pointer;

char xpl_rx_buffer_shadow[XPL_RX_BUFSIZE];
char xpl_rx_fifo[XPL_RXFIFO_SIZE];
char xpl_instance_id[17];

// Used by xpl_handler to keep track of the current state
enum XPL_STATE_TYPE { WAITING = 0, PROCESS_INCOMMING_MESSAGE_PART};
enum XPL_STATE_TYPE xpl_state;

char xpl_node_configuration = 0;            /* mapped with XPL_DEVICE_CONFIGURATION 
                                            bit 0 = node configured
                                            bit 1 = one wire present
                                            bit 2 = outputs configured
                                            bit 3 = inputs configured */

unsigned char xpl_pwm_value = 0;
unsigned char xpl_hbeat_sent = 0;

unsigned char xpl_trig_register = 0;   // see enum XPL_DEVICE_TYPE

// Following variable has to be declared in the main function and should be incremented every second.
extern volatile unsigned short time_ticks;
extern volatile unsigned char time_ticks_oo;
extern volatile unsigned char time_ticks_output;
extern volatile unsigned char time_ticks_input;
extern unsigned char output_count;
extern unsigned char input_count;

unsigned short xpl_count_gas;
unsigned short xpl_count_water;
unsigned short xpl_count_elec;
unsigned char xpl_temp_index;
unsigned char xpl_output_id;
//unsigned int xpl_rate_limiter;



// We need to keep track of the temperatures in case an external request is received,
// and to know if we need to send an xpl-trig
signed short  oo_temp_table[OO_SUPPORTED_DEVICE_COUNT];

enum XPL_PARSE_TYPE {   WAITING_CMND = 0,                   \\
                        CMND_RECEIVED,                      \\
                        WAITING_CMND_TYPE,                  \\
                        WAITING_CMND_SENSOR_REQUEST,        \\
                        WAITING_CMND_CONFIG_RESPONSE,       \\
                        WAITING_CMND_HBEAT_REQUEST,         \\
                        WAITING_CMND_CONFIG_CURRENT,        \\
                        WAITING_CMND_SENSOR_REQUEST_DEVICE, \\
						WAITING_CMND_CONTROL_BASIC,			\\
						WAITING_CMND_CONTROL_VALUE, 	    \\
						WAITING_CMND_CONTROL_OUPUT,         \\
						WAITING_CMND_CONTROL_OUPUT_CURRENT, \\
						WAITING_CMND_CONTROL_OUPUT_CURRENT_PULSE \\
                        };
                        
enum XPL_PARSE_TYPE xpl_msg_state;

enum XPL_CMD_MSG_TYPE_RSP {HEARTBEAT_MSG_TYPE = 0,              \\
                           CONFIGURATION_CAPABILITIES_MSG_TYPE, \\
                           CONFIG_STATUS_MSG_TYPE,              \\
                           GAS_DEVICE_CURRENT_MSG_TYPE,         \\
                           WATER_DEVICE_CURRENT_MSG_TYPE,       \\
                           ELEC_DEVICE_CURRENT_MSG_TYPE,        \\
						   PWM_CURRENT_MSG_TYPE,                \\
						   FLOOD_NETWORK_MSG_TYPE,              \\
						   OUTPUT_DEVICE_CURRENT_MSG_TYPE      \\						   
                           };

enum XPL_CMD_MSG_TYPE_RSP xpl_handle_message_part(void);

enum XPL_FLOW_TYPE {FLOW_OFF = 0, FLOW_ON = 1};
enum XPL_FLOW_TYPE xpl_flow;


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

	// We should leave 50ms between two messages
	// If xpl_rate_limiter == time_ticks, then we have already sent a message recently
	// so we need to wait a bit.
	//if (xpl_rate_limiter == time_ticks) {
		// 50 ms @ 32 MHz == 40e4 cycles
		Delay10KTCYx(40);
	//}

	// Note: for the time being, we wait here 50 ms every time we send a packet. Start with simple code,
	// improve when required.

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
	printf("hbeat.basic\n{\ninterval=5\nversion=%i.%i\n",XPL_VERSION_MAJOR, XPL_VERSION_MINOR);
	if (xpl_node_configuration & ONE_WIRE_PRESENT){
		printf("tempsensors=%i\n", oo_get_devicecount());
	}
	
	printf("inputs=%i\n",input_count);
	printf("outputs=%i\n",output_count);

#ifdef PWM_ENABLED
	printf("pwmout=%i\n", pwm_value);
#endif
    if (xpl_node_configuration & OUTPUTS_CONFIGURED){
	    printf("output=%i\n", output_count);
	}
	if (xpl_node_configuration & INPUTS_CONFIGURED){
	    printf("input=%i\n", input_count);
	}    
	printf("}\n");

	xpl_hbeat_sent = 1;

	return;
}

//////////////////////////////////////////////////////////
// xpl_send_hbeat
//  Request configuration by the config manager
//  This function is called by xpl_handler when no valid 
//  INSTANCE_ID is found in EEPROM by the xpl_init function.
void xpl_send_config_hbeat(void){
	xpl_print_header(STAT);
	printf("config.basic\n{\ninterval=1\nversion=%i.%i\n}\n",XPL_VERSION_MAJOR, XPL_VERSION_MINOR);
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
	printf("config.list\n{\nreconf=newconf\nreconf=newoutputs\nreconf=newinputs\n}\n");
	return;
}

//////////////////////////////////////////////////////////
// xpl_send_stat_config
//  Request config by the config manager
//  send the current configuration of the node to the config manager
void xpl_send_stat_config(void){
	xpl_print_header(STAT);
	printf("config.current\n{\nnewconf=%s\nnewoutputs=%i\nnewinputs=%i\n}\n",xpl_instance_id,output_count,input_count);
	return;
}

void xpl_send_sensor_basic_input(enum XPL_MSG_TYPE msg_type,unsigned char id, unsigned int count) {
    xpl_print_header(msg_type);
    printf("sensor.basic\n{\ndevice=input%i",id);
    if (count == 0) {
        printf("\ntype=input\ncurrent=DOWN\n}\n");
    } else {
        printf("\ntype=input\ncurrent=UP\n}\n");        
    }    
	return;
}

void xpl_send_sensor_basic(enum XPL_MSG_TYPE msg_type,const rom far char* device, unsigned short count) {
    xpl_print_header(msg_type);
    printf("sensor.basic\n{\ndevice=");
    printf(device);
    printf("\ntype=count\ncurrent=%u\n}\n",count);

	return;
}

void xpl_send_sensor_basic_temperature(enum XPL_MSG_TYPE msg_type, unsigned char index) {

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

	// Convert temperature to float.
	// This is the required output format for xpl, so this conversion is done here
	// This depends on the family of sensor used
	switch(tsens.id[0])	{
		case 0x28: // DS18B20
			temp_hr = (float)tsens.temperature / 16;
			break;
		case 0x10: // DS1820
			temp_hr = (float)tsens.temperature / 2;
			break;
		default:   // unsupported device -> set temperature to fixed 66 degrees
			temp_hr = (float)66;
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
void xpl_send_sensor_basic_pwm(enum XPL_MSG_TYPE msg_type) {
	xpl_print_header(msg_type);
	printf("sensor.basic\n{\ndevice=pwmout\n");
	printf("type=variable\ncurrent=%i\n}\n", xpl_pwm_value);
	return;
}

void xpl_send_sensor_basic_output(enum XPL_MSG_TYPE msg_type) {
    char result[4];
    
	xpl_print_header(msg_type);
	printf("sensor.basic\n{\ndevice=output%i\n",xpl_output_id);       
   
    strcpypgm2ram(result,output_get_state(xpl_output_id));  
    	
	printf("type=output\ncurrent=%s\n}\n",result);	
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
			xpl_send_sensor_basic_temperature(msg_type,xpl_temp_index);
			break;
		case PWM:
			xpl_send_sensor_basic_pwm(msg_type);
			break;
	    case OUTPUT:
	        xpl_send_sensor_basic_output(msg_type);
	        break;
    }    
    return;
}    

//////////////////////////////////////////////////////////
// xpl_reset_rx_buffer
// Initialisation of the xPL rx buffer
void xpl_reset_rx_buffer(void) {    
    xpl_rx_pointer = 0;
    xpl_rx_buffer_shadow[0] = '\0';
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

//////////////////////////////////////////////////////////
// xpl_init_instance_id
// Get the instance id from EEPROM, and set to 'default'
//  if no ID is present in the EEPROM
void xpl_init_instance_id(void) {
    char count;

	xpl_node_configuration = 0;

	// Get the instance ID from EEPROM
	// Maximum size = 16 chars + 1 null char
	for (count = 0; count < 16; count++){
		xpl_instance_id[count] = eeprom_read(count+XPL_EEPROM_INSTANCE_ID_OFFSET);

		// When we encounter the null, stop reading
		if (xpl_instance_id[count] == '\0') { 
			xpl_node_configuration |= NODE_CONFIGURED;
			break;
		} 

		// When the first char is 0xFF, flash is uninitialised
		if (count == 0 && xpl_instance_id[0] == 0xFF) {
			sprintf(xpl_instance_id, "default");
			eeprom_write(XPL_EEPROM_OUPUTS_COUNT,'0');
            eeprom_write(XPL_EEPROM_INPUTS_COUNT,'0');
			break;
		}
	}
	output_count = eeprom_read(XPL_EEPROM_OUPUTS_COUNT);
	input_count = eeprom_read(XPL_EEPROM_INPUTS_COUNT);
}    

//////////////////////////////////////////////////////////
// xpl_init
// Initialisation of the xPL library. Tries to restore the
// INSTANCE_ID from EEPROM
void xpl_init(void){

	// Enable the PWM hardware if required
	// !!!!!!! Warning enabling means that resistor must be dismanteled from print, if not it will be fried !!!!!!!!!!!!!!!
#ifdef PWM_ENABLED
#warning "PWM output enabled on PORTC.2"
	// Enable PORTC.2 output direction 
	TRISC &= 0xFB;

	// Enable the PWM timer
	OpenTimer2(TIMER_INT_OFF &
			T2_PS_1_16 &
			T2_POST_1_1);

	// And enable the PWM
	OpenPWM1(249);
	SetDCPWM1(1000);
#endif

	// Init the helper libraries do that we know if need to 
	// library specific code
	if (!oo_init()){
		xpl_node_configuration |= ONE_WIRE_PRESENT;
		oo_read_temperatures();
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
	
	//xpl_rate_limiter = time_ticks;

	xpl_hbeat_sent = 0;

	xpl_flow = FLOW_ON;
	putc(XON, _H_USART);
}

void xpl_handle_write_eeprom(void) {   
    char strlength;
    char lpcount = 0;
    
    xpl_flow = FLOW_ON;
	putc(XON, _H_USART);
    
	// Put the new instance id name in EEPROM so that it retains value after a power cycle
	strlength = strlen(xpl_instance_id); // We put this in a local variable because else it it re-calculated every loop cycle
				    
    for (lpcount=0; lpcount < strlength; lpcount++){
    	eeprom_write(lpcount+XPL_EEPROM_INSTANCE_ID_OFFSET, xpl_instance_id[lpcount]);
    }
    // End with a '\0' in EEPROM
    eeprom_write(lpcount+XPL_EEPROM_INSTANCE_ID_OFFSET, 0x00);
    				    		       		        		            
    eeprom_write(XPL_EEPROM_INPUTS_COUNT, input_count);    
    eeprom_write(XPL_EEPROM_OUPUTS_COUNT, output_count);			    
        
    // We are about to change our ID here, so send an end message to notify the network
    xpl_send_config_end();
    
    // We don't reset here any more, there are more settings to come!
    // Reset the xpl function to apply the new name
    // Buffer content gets lost here, but we don't mind as we need to start again
    xpl_init_instance_id();
    
    xpl_send_hbeat();
    
    if (xpl_flow == FLOW_ON) { 
    	xpl_flow = FLOW_OFF;
	    putc(XOFF, _H_USART); 	   	
    }
    
    // end of command, blink light
	green_led = LED_ON;  
}

//////////////////////////////////////////////////////////
// xpl_addbyte
// Add a new byte from the USART to the receive buffer
void xpl_addbyte(char data){
	if (data != '\n') {
    	if (xpl_rx_pointer >= XPL_RX_BUFSIZE) {
            printf("RXO");
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
		    
		    // depending on the message part we send out messages
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
				case PWM_CURRENT_MSG_TYPE:
					xpl_send_device_current(STAT, PWM);
					break;
			    case OUTPUT_DEVICE_CURRENT_MSG_TYPE:
					xpl_send_device_current(STAT, OUTPUT);
					break;
				case FLOOD_NETWORK_MSG_TYPE:
					// This is a debug mode and should not be activated during normal operations
					for (index = 0; index < 10; index++) {
						xpl_send_device_current(STAT, PWM);
 					}
					break;			    
				default:
					break;
    		}    
    		
    		if (xpl_cmd_msg_type > 0) {
        		// end of command, blink light
	            green_led = LED_ON; // will be switched of by function output_handler_timer
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
			if (xpl_trig_register != 0) {
    			if (xpl_trig_register & GAS) {        			        			
        		    xpl_send_device_current(TRIG,GAS);
        		    xpl_trig_register ^= GAS;
                } 
                if (xpl_trig_register & WATER) {
        		    xpl_send_device_current(TRIG,WATER);
        		    xpl_trig_register ^= WATER;
        		} 
        		if (xpl_trig_register & ELEC) {
        		    xpl_send_device_current(TRIG,ELEC);	
        		    xpl_trig_register ^= ELEC; 
        		} 
        		if (xpl_trig_register & OUTPUT) {
        		    output_handler_timer();
        		    xpl_trig_register ^= OUTPUT; 
        		} 
        		if (xpl_trig_register & INPUT) {
        		    input_handler_timer();
        		    xpl_trig_register ^= INPUT;        		    
        		} 
        		if (xpl_trig_register & WRITE_EEPROM) {
                    // need to write the eeprom when we are not busy handling the message
                    // interrupts will be disabled just before writing to the eeprom        		
        		    xpl_handle_write_eeprom();
        		    xpl_trig_register ^= WRITE_EEPROM;
        		}     	       
			}

			// Send hbeat every 5 minutes when configured
			if (time_ticks > 300 && (xpl_node_configuration & NODE_CONFIGURED)) {
				xpl_send_hbeat();
				time_ticks = 0;
 			}
			
			// When not configured, send out config hbeat every minute
    		if (time_ticks > 60 && !(xpl_node_configuration & NODE_CONFIGURED)) {
				xpl_send_config_hbeat();
				time_ticks = 0;
			}

			// Poll the temperature sensors every minute
			if (time_ticks_oo > 60 && (xpl_node_configuration & ONE_WIRE_PRESENT) && (xpl_node_configuration & NODE_CONFIGURED)) {
				time_ticks_oo = 0;
				oo_read_temperatures();				
			}			

			// And check if temp trig messages need to be sent out
			if ((xpl_node_configuration & ONE_WIRE_PRESENT) && (xpl_node_configuration & NODE_CONFIGURED) && xpl_hbeat_sent) {
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


unsigned short xpl_convert_2_ushort(char* char_value) {
    unsigned short value = 0;
    char lpcount = 0;
	char strlength;
    char input_value[8];
    
    strcpy(input_value, char_value);
	strlength = strlen(input_value);
	
	while (lpcount < strlength) {
	    value *= 10;
		value += (input_value[lpcount]- 0x30);
		lpcount++;
	}
	return value;
}

enum XPL_CMD_MSG_TYPE_RSP xpl_handle_message_part(void) {       	              
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
			} else if (strcmpram2pgm("control.basic", xpl_rx_buffer_shadow) == 0) {
				xpl_msg_state = WAITING_CMND_CONTROL_BASIC;
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
    		} else if (xpl_rx_buffer_shadow[0] == '{') {
    		    //do nothing
    		} else {
    		    xpl_msg_state = WAITING_CMND;
    		}    		
		    break;
		case WAITING_CMND_HBEAT_REQUEST:
		    if (strcmpram2pgm("command=request", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND;
				// We need a random backoff here to ensure that we don't flood the
				// network with all nodes responding at the same time.
				// We use the time_ticks for that. That variable is never bigger than
				// 300, so we divide by ten and feed that value into the delay function
				Delay10KTCYx(time_ticks/10);
					            
    		    return HEARTBEAT_MSG_TYPE;
    		} else if (xpl_rx_buffer_shadow[0] == '{') {
    		    //do nothing
    		} else {
    		    xpl_msg_state = WAITING_CMND;
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
    		} else if (strncmpram2pgm("device=output", xpl_rx_buffer_shadow,13) == 0) {
    		    xpl_output_id = xpl_convert_2_ushort(xpl_rx_buffer_shadow+13);
    		    xpl_msg_state = WAITING_CMND;
		        return OUTPUT_DEVICE_CURRENT_MSG_TYPE;
    		} else {
    		    xpl_msg_state = WAITING_CMND;		  
    		}   
		    break;

		case WAITING_CMND_CONTROL_BASIC:
			if (strcmpram2pgm("device=pwmout", xpl_rx_buffer_shadow) == 0)	{
				xpl_msg_state = WAITING_CMND_CONTROL_VALUE;
			} else if (strcmpram2pgm("mode=flood", xpl_rx_buffer_shadow) == 0) {
				xpl_msg_state = WAITING_CMND;
				return FLOOD_NETWORK_MSG_TYPE;
    		} else if (strncmpram2pgm("device=output", xpl_rx_buffer_shadow,13) == 0) {    		 
    		    xpl_output_id = xpl_convert_2_ushort(xpl_rx_buffer_shadow+13);
				xpl_msg_state = WAITING_CMND_CONTROL_OUPUT;				
    		} else if (xpl_rx_buffer_shadow[0] == '{') {
    		    //do nothing
			} else {
				xpl_msg_state = WAITING_CMND;
			}
			break;

		case WAITING_CMND_CONTROL_VALUE:
			if (strcmpram2pgm("type=variable", xpl_rx_buffer_shadow) == 0)	{
				// do nothing
			} else if (strncmpram2pgm("value=", xpl_rx_buffer_shadow, 6) == 0)	{
				// Extract the value to set the PWM to				
				xpl_pwm_value = xpl_convert_2_ushort(xpl_rx_buffer_shadow+6);
								
				if (xpl_pwm_value == 255) {
					SetDCPWM1(0x3FF);
				} else {
					SetDCPWM1(((short)xpl_pwm_value)<<2);
				}

				xpl_msg_state = WAITING_CMND;
				return PWM_CURRENT_MSG_TYPE;
			} else {
				xpl_msg_state = WAITING_CMND;
			}
			break;
			
		case WAITING_CMND_CONTROL_OUPUT:
		    if (strcmpram2pgm("type=output", xpl_rx_buffer_shadow) == 0)	{
    		    xpl_msg_state = WAITING_CMND_CONTROL_OUPUT_CURRENT;   
    		} else {
    		    xpl_msg_state = WAITING_CMND;    
    		}    		   
		    break;
		
		case WAITING_CMND_CONTROL_OUPUT_CURRENT:
		    if (strcmpram2pgm("current=enable", xpl_rx_buffer_shadow) == 0 || strcmpram2pgm("current=high", xpl_rx_buffer_shadow) == 0 || strcmpram2pgm("current=on", xpl_rx_buffer_shadow) == 0)	{
    		    output_state_enable(xpl_output_id);
    		    return OUTPUT_DEVICE_CURRENT_MSG_TYPE;
    		} else if (strcmpram2pgm("current=disable", xpl_rx_buffer_shadow) == 0 || strcmpram2pgm("current=low", xpl_rx_buffer_shadow) == 0 || strcmpram2pgm("current=off", xpl_rx_buffer_shadow) == 0)	{
                output_state_disable(xpl_output_id);
                return OUTPUT_DEVICE_CURRENT_MSG_TYPE;
    		} else if (strcmpram2pgm("current=pulse", xpl_rx_buffer_shadow) == 0) {
    		    xpl_msg_state = WAITING_CMND_CONTROL_OUPUT_CURRENT_PULSE;
    		} else if (strcmpram2pgm("current=toggle", xpl_rx_buffer_shadow) == 0) {
                output_state_toggle(xpl_output_id);
                return OUTPUT_DEVICE_CURRENT_MSG_TYPE;
    		} else {
    		    xpl_msg_state = WAITING_CMND;    
    		}    
		    break;
		    
		case WAITING_CMND_CONTROL_OUPUT_CURRENT_PULSE:
		    if (strncmpram2pgm("data1=", xpl_rx_buffer_shadow,6) == 0) {
    		    output_state_pulse(xpl_output_id,xpl_convert_2_ushort(xpl_rx_buffer_shadow+6));    		    
    		    return OUTPUT_DEVICE_CURRENT_MSG_TYPE;    		    
    		} else {
    		    xpl_msg_state = WAITING_CMND;
    		} 
		    break;
		    
		case WAITING_CMND_CONFIG_RESPONSE:
		    		   		  		    	   		    		    
		    // what we write here depends on the node type, this is not yet generic code :(
		    // maybe we need to implement here a function from the xpl_impl.c file
			// For now we just parse the instance_id and put it in EEPROM
		    if (strncmpram2pgm("newconf=", xpl_rx_buffer_shadow, 8) == 0) {      		    								
    		    // Copy the new instance id to the correct variable
    		    strcpy(xpl_instance_id,xpl_rx_buffer_shadow + 8);						       		       		  
    		} else if (strncmpram2pgm("newoutputs=", xpl_rx_buffer_shadow, 11) == 0) {    	    		        		        		    
    		    output_count = xpl_convert_2_ushort(xpl_rx_buffer_shadow+11);    		                                    			
    		} else if (strncmpram2pgm("newinputs=", xpl_rx_buffer_shadow, 10) == 0) {    	    		        		    
    		    input_count = xpl_convert_2_ushort(xpl_rx_buffer_shadow+10);    		        		    		    
            } else if (xpl_rx_buffer_shadow[0] == '}'){
    		    xpl_msg_state = WAITING_CMND;
    		        		       		        		    							    				
				xpl_trig_register |= WRITE_EEPROM;                   							    		    
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
		if (xpl_count_water < UINT_MAX){ 
			xpl_count_water++;
		}
		xpl_trig_register |= WATER;
		break;
	case GAS:
		if (xpl_count_gas < UINT_MAX){ 
			xpl_count_gas++;
		}
		xpl_trig_register |= GAS;
		break;
	case ELEC:
		if (xpl_count_elec < UINT_MAX){ 
			xpl_count_elec++;
		}
		xpl_trig_register |= ELEC;
		break;
	case INPUT:	    
		xpl_trig_register |= INPUT;		
	    break;
	case OUTPUT:
	    xpl_trig_register |= OUTPUT;
	    break;
	default:
		printf("Error: invalid sensor");
		break;
	}
}

		