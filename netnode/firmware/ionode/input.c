/*************************************************************
* Input library
*
* (c) 2011
* Authors: Dirk Buekenhoudt
**************************************************************
* target device   : PIC18F2520
* clockfreq       : 32 MHz (internal oscillator)
* target hardware : NetNode
*************************************************************/

#include <usart.h>
#include <delays.h>
#include <string.h>
#include <stdio.h>

#include "input.h"
#include "xpl.h"

unsigned char input_states[MAX_BOARD_INPUTS];  // max inputs = 80 = 8 shift registers

unsigned char input_count = 0;   // number inputs on the extension board - value initialised by eeprom value

volatile unsigned char run_timer = 1;

unsigned char swap_byte(unsigned char c)
{	
    unsigned char result=0;
    char i;
    for(i=0;i<8;++i)
    {	
        result=result<<1;
        result|=(c&1);
        c=c>>1;
    }
    return result;
}

void read(void) {
    unsigned char i = 0; // input_bits
    unsigned char int_count = 0;
    unsigned char array_count = 0;
    unsigned char mask = 1;
    unsigned char result;
    unsigned char tmp;
    unsigned char input_state;
    
    run_timer = 0;
    
    // shift current values in the shift register
    input_ps = 1;
    Delay10TCYx(2); // delay 312ns
    input_ps = 0;      
     
    input_states[array_count] = 0;
    for (i=0; i<input_count; i++) {
        if (int_count == 8) {            
            array_count++;
            int_count = 0;       
            input_states[array_count] = 0; 
        } 
        input_state = input_data;
                               
        input_clk = 1;        
        Delay10TCYx(2); // delay 312ns
        
        input_clk = 0;
        Delay10TCYx(2); // delay 312ns
        
        if (int_count == 0) {
            result = input_state;
        } else {
            result = input_state << int_count;            
        }    
        input_states[array_count] = input_states[array_count] | result;
                                
        int_count++; 
    }           
    
    if (array_count < MAX_BOARD_INPUTS - 2) {
        array_count++;           
    }       
    for (i=0;i<array_count;i++) {
        input_states[i] = swap_byte(input_states[i]);   
    }    
    
    run_timer = 1;
}    

void input_init() { 
    unsigned char i = 0;
    unsigned char int_count = 0;
    unsigned char array_count = 0;
    unsigned char mask = 1;
    unsigned char result;
    
    
    for (i=0;i<MAX_BOARD_INPUTS;i++) {
        input_states[i] = 0;       
    }    
    
    input_ps = 0;
    input_clk = 0;
    
    // read current inputs
    read();      
            
    //send sensor current states    
    for (i = 0; i<input_count;i++) {
        if (int_count == 8) {
            array_count++;
            int_count = 0;
        }      
        
        result = input_states[array_count] >> int_count;
        
        result &= mask;
                                                   
        xpl_send_sensor_basic_input(STAT,"input",((int_count+1) + (8 * array_count)), result);
                        
        int_count++; 
             
        Delay1KTCYx(32);   // delay 1ms
    }    
}    
    
// send xpl message if input changes state, from high to low or low to high
void input_handler_timer(void) {
    unsigned char input_states_shadow[MAX_BOARD_INPUTS];     
    unsigned char i = 0;
    unsigned char int_count = 0;
    unsigned char array_count = 0;
    unsigned char mask = 1;
    unsigned char result;
    
    if (run_timer == 0) {
        return;   
    }    
    
    if (input_count > 0) {
        for (i=0;i<MAX_BOARD_INPUTS;i++) {
            input_states_shadow[i] = input_states[i];
        } 
                                    
        // read current state
        read();
                  
        result = (input_states_shadow[array_count] ^ input_states[array_count] );

        //check delta
        for (i = 0; i<input_count;i++) {
            if (int_count == 8) {                                
                array_count++;
                int_count = 0;
                mask = 1;
                result = (input_states_shadow[array_count] ^ input_states[array_count]);                                       
            }     
                                                
            if ((result & mask) > 0) {                
                // detected a difference, need to send message
                xpl_send_sensor_basic_input(STAT,"input",((int_count+1) + (8 * array_count)), ((input_states[array_count] & mask) >> int_count));        
                
                Delay1KTCYx(32);   // delay 1ms
            }                                   
            int_count++; 
            mask = mask << 1;                        
        }        
    }    
}    