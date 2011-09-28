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

#include "input.h"

unsigned char input_count = 0;   // number inputs on the extension board - value initialised by eeprom value

    
// send xpl message if input changes state, from high to low or low to high

void input_handler_timer(void) {
    if (input_count > 0) {
        
    }    
}    