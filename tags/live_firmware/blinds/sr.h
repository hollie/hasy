/*************************************************************
* Shift register interface code 
*
* Currently supports 595-type shift registers
*
* (c) 2006, Lieven Hollevoet, boostc compiler.
*************************************************************/

#ifndef _SR_H_
#define _SR_H_

#include <system.h>

// IO's
//volatile bit sr_noe 	@ PORTA . 0;
volatile bit sr_rst		@ PORTA . 3;
volatile bit sr_dta		@ PORTA . 0;
volatile bit sr_lck		@ PORTA . 2;
volatile bit sr_sck 	@ PORTA . 1;

// Tris bits
volatile bit sr_rst_tris @ TRISA . 3;
volatile bit sr_dta_tris @ TRISA . 0;
volatile bit sr_lck_tris @ TRISA . 2;
volatile bit sr_sck_tris @ TRISA . 1;

void sr_load_byte(char data);
void sr_latch_outputs();
void sr_init();

#endif // _SR_H_
