/*************************************************************
* Input interface
*
* (c) 2011, Dirk Buekenhoudt , mcc18 compiler.
*************************************************************/
#ifndef _INPUT_H_
#define _INPUT_H_

void input_handler_timer(void);    

#define MAX_BOARD_INPUTS 5

// move to input
#define input_data PORTBbits.RB4
#define input_clk  PORTBbits.RB3
#define input_ps   PORTBbits.RB5

#endif // _INPUT_H_