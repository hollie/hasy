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


#define OUTPUT_MAX_PARALLEL_IDS 65

#define output_data PORTCbits.RC1
#define output_clk  PORTCbits.RC3
#define output_str  PORTCbits.RC5

#define OUTPUT_ON 1
#define OUTPUT_OFF 0

#endif // _OUTPUT_H_