/*************************************************************
* Output interface
*
* (c) 2011, Dirk Buekenhoudt , mcc18 compiler.
*************************************************************/
#ifndef _OUTPUT_H_
#define _OUTPUT_H_

void output_init(void);    
void output_state_enable(unsigned char id);    
void output_state_disable(unsigned char id);
void output_state_pulse(unsigned char id, unsigned short duration);
void output_state_toggle(unsigned char id);
void output_handler_timer(void);
const  char* output_get_state(unsigned char id);


#define OUTPUT_MAX_PARALLEL_IDS 10

#define output_data PORTCbits.RC1
#define output_clk  PORTCbits.RC3
#define output_str  PORTCbits.RC5

// move to input
#define input_data PORTCbits.RC0
#define input_clk  PORTCbits.RC3
#define input_ps   PORTCbits.RC4



#endif // _OUTPUT_H_