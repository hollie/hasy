/*************************************************************
* Output library
*
* (c) 2009
* Authors: Lieven Hollevoet
*          Dirk Buekenhoudt
**************************************************************
* target device   : PIC18F2520
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
*************************************************************/

#include "output.h"

void output_state_enable(unsigned char id) {
    // TODO implement
}    
void output_state_disable(unsigned char id) {
    // TODO implement
}   
void output_state_pulse(unsigned char id, unsigned short duration) {
    output_state_enable(id);
    // TODO think of a strategy if we delay here that we do not block input checking? maybe with using a timer
    output_state_disable(id);   
}   
void output_state_toggle(unsigned char id) {
    // TODO check current output state and toggle
}   

const rom far char* output_get_state(unsigned char id) {
    
}    