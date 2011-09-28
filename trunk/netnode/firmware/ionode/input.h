/*************************************************************
* Input interface
*
* (c) 2011, Dirk Buekenhoudt , mcc18 compiler.
*************************************************************/
#ifndef _INPUT_H_
#define _INPUT_H_

void input_handler_timer(void);    


// move to input
#define input_data PORTCbits.RC0
#define input_clk  PORTCbits.RC3
#define input_ps   PORTCbits.RC4

#endif // _INPUT_H_