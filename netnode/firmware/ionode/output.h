/*************************************************************
* Output interface
*
* (c) 2011, Dirk Buekenhoudt , mcc18 compiler.
*************************************************************/
#ifndef _OUTPUT_H_
#define _OUTPUT_H_


void output_state_enable(unsigned char id);    
void output_state_disable(unsigned char id);
void output_state_pulse(unsigned char id, unsigned short duration);
void output_state_toggle(unsigned char id);
const rom far char* output_get_state(unsigned char id);

#endif // _OUTPUT_H_