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

unsigned int input_state[MAX_BOARD_INPUTS];  // max inputs = 80 = 8 shift registers

unsigned char input_count = 0;   // number inputs on the extension board - value initialised by eeprom value

void read(void) {
    unsigned char i = 0; // input_bits
    unsigned char int_count = 0;
    unsigned char array_count = 0;
    
    // shift current values in the shift register
    input_ps = 1;
    Delay10TCYx(1); // delay 312ns
    input_ps = 0;        
 
    for (i=0; i<input_count; i++) {
        if (int_count == 16) {
            array_count++;
            int_count = 0;        
        } 
        
        input_clk = 1;        
        Delay10TCYx(1); // delay 312ns
        
        input_state[array_count] |= (input_data << int_count);
        
        input_clk = 0;
        Delay10TCYx(1); // delay 312ns
                
        int_count++; 
    }
}    

void input_init() { 
    unsigned char i = 0;
    unsigned char int_count = 0;
    unsigned char array_count = 0;
    unsigned char mask = 1;
    unsigned short result;
    char state[4];
    char input[10];
    
    for (i=0;i<MAX_BOARD_INPUTS;i++) {
        input_state[i] = 0;
    }    
    
    input_ps = 0;
    input_clk = 0;
    
    // read current inputs
    read();
            
    //send sensor current states    
    for (i = 0; i<input_count;i++) {
        if (int_count == 16) {
            array_count++;
            int_count = 0;
        }      
        
        result = input_state[array_count] >> int_count;
        
        result &= mask;
                                                   
        xpl_send_sensor_basic_input(STAT,"input",((int_count+1) + (16 * array_count)), result);
                        
        int_count++; 
             
        Delay1KTCYx(32);   // delay 1ms
    }    
}    
    
// send xpl message if input changes state, from high to low or low to high
void input_handler_timer(void) {
    unsigned int input_state_shadow[MAX_BOARD_INPUTS];     
    unsigned char i = 0;
    unsigned char int_count = 0;
    unsigned char array_count = 0;
    unsigned char mask = 1;
    unsigned short result;
    
    if (input_count > 0) {
        for (i=0; i<MAX_BOARD_INPUTS; i++) {
            input_state_shadow[i] = input_state[i];                               
        }                            
        // read current state
        read();
                        
        result = (input_state_shadow[array_count] ^ input_state[array_count] ) >> int_count;
        
        //check delta
        for (i = 0; i<input_count;i++) {
            if (int_count == 16) {
                array_count++;
                int_count = 0;
                mask = 1;
                result = (input_state_shadow[array_count] ^ input_state[array_count]) >> int_count;
            }      
            
            if (result & mask) {
                // detected a difference, need to send message
                xpl_send_sensor_basic_input(STAT,"input",((int_count+1) + (16 * array_count)), (input_state[array_count] & mask) >> int_count);        
                
                Delay1KTCYx(32);   // delay 1ms
            }                                   
            int_count++; 
            mask = mask << int_count;                        
        }                    
    }    
}    