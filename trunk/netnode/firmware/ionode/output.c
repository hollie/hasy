/*************************************************************
* Output library
*
* (c) 2011
* Authors: Dirk Buekenhoudt
**************************************************************
* target device   : PIC18F2520
* clockfreq       : 32 MHz (internal oscillator)
* target hardware : NetNode
*************************************************************/

#include "output.h"

#include <usart.h>
#include <delays.h>

#include "utility_monitor.h"

volatile unsigned char request_busy=0;

unsigned char output_count = 0;   // number outputs on the extension board - value initialised by eeprom value

struct output_identification {
    unsigned char id;
    unsigned char counter;
};  

struct output_identification output_up_state[OUTPUT_MAX_PARALLEL_IDS];  
unsigned char output_up_state_count = 0;

void write(unsigned char id, unsigned char enabled) {
    char i = 0; // output_bits
    char o = 0; // number of output up states
    unsigned char cal_output_data=0;
    
    if (id <= output_count && request_busy == 0) { 
        request_busy = 1;       
        output_clk = OUTPUT_OFF;        
                      
        for (i=output_count; i>0; i--) {
            if (i == id) {
                output_data = enabled;
            } else {
                if (output_up_state_count > 0) {
                    cal_output_data = OUTPUT_OFF;
                    for (o=0;o<output_up_state_count;o++) {
                        if (output_up_state[o].id == i && output_up_state[o].counter > 0) {
                            cal_output_data = OUTPUT_ON;   
                            break;
                        }           
                    }
                    output_data = cal_output_data;
                } else {
                    output_data = OUTPUT_OFF;
                }                            
            }                     
            Delay10TCYx(1);   // delay 312ns      
            output_clk = OUTPUT_ON; 
            Delay10TCYx(1);   // delay 312ns
            //Delay1KTCYx(32);   // delay 1ms
            output_clk = OUTPUT_OFF;
            Delay10TCYx(1);   // delay 312ns      
        }    
        output_data = OUTPUT_OFF;                                 
        request_busy = 0;        
    }
    output_str = OUTPUT_ON;      
    Delay10TCYx(1);   // delay 312ns
    //Delay1KTCYx(32);   // delay 1ms
    output_str = OUTPUT_OFF;
}  
void write_all_enabled() {
    char i = 0; // output_bits
    char o = 0; // number of output up states
    
    
        request_busy = 1;       
        output_clk = OUTPUT_OFF;        
                      
        for (i=output_count; i>0; i--) {
            output_data = 1;
            
            Delay10TCYx(1);   // delay 312ns      
            output_clk = OUTPUT_ON; 
            Delay10TCYx(1);   // delay 312ns
            //Delay1KTCYx(32);   // delay 1ms
            output_clk = OUTPUT_OFF;
            Delay10TCYx(1);   // delay 312ns
            //Delay1KTCYx(32);   // delay 
        }    
        output_data = OUTPUT_OFF;                                 
        request_busy = 0;        
    
    output_str = OUTPUT_ON;      
    Delay10TCYx(1);   // delay 312ns
    //Delay1KTCYx(32);   // delay 1ms
    output_str = OUTPUT_OFF;
}  

void output_init(void) {
    char count = 0;
    output_str = OUTPUT_OFF;  
    output_data = OUTPUT_OFF;  
    output_clk = OUTPUT_OFF;  
    
    output_state_disable(0);
    
    while (count++ < output_count/8){		
		green_led = LED_ON;
		Delay10KTCYx(250);
		green_led = LED_OFF;
		Delay10KTCYx(250);
	}    
	
	// DEBUG set all outputs enabled	
	//write_all_enabled();
    

	green_led = LED_ON;
	Delay10KTCYx(250); 		
	Delay10KTCYx(250); 		
	green_led = LED_OFF;
}    

void output_state_enable(unsigned char id) {  
    write(id,1);
}
void output_state_disable(unsigned char id) {
    write(id,0);
}   
void output_state_pulse(unsigned char id, unsigned short duration) {  // duration comes in msec
        
    output_state_enable(id);    
    // Timer will set output back to 0 see output_handler_timer function
 
    if (output_up_state_count < OUTPUT_MAX_PARALLEL_IDS) {
        output_up_state[output_up_state_count].id = id;
        output_up_state[output_up_state_count].counter = duration/20 + 1;  // timer to disable is set to 20ms
        
        output_up_state_count++;
    }
}   
void output_state_toggle(unsigned char id) {
        
    // TODO implementation      
}   

void output_handler_timer(void) {
    char i = 0;
    
    // flash the green led when output is enabled
    green_led = LED_OFF;
    if (output_up_state_count > 0) {
        green_led = LED_ON;
        for (i=output_up_state_count-1; i>=0; i--) {
            if (output_up_state[i].counter == 1) {
                output_state_disable(output_up_state[i].id);              
                output_up_state[i].counter = 0;
                
                // make sure to decrement only if we are treating the latest one
                if (i == output_up_state_count-1) {
                    output_up_state_count--;
                }                
            } else if (output_up_state[i].counter > 0) {
                output_up_state[i].counter--;
            }    
        }                
    }    
}    

// return should be bit type
const char* output_get_state(unsigned char id) {
    unsigned char i=0;
    
    for (i=0;i<output_up_state_count;i++) {         
        if (output_up_state[i].id == id && output_up_state[i].counter > 0) {           
            return "on";
        }           
    }               
    return "off";
}    