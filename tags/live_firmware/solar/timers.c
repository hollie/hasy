/*************************************************************
* Timer helper functions for the PIC16F87X series 
*
* Allows for easy setup of the timers with interrupts
*
* (c) Lieven Hollevoet
* most recent version on http://boostc.lika.be
*************************************************************/
#include "timers.h"

void tmr1_setup(tmr_irq_t irq_mode){
	// Timer setup
	t1con = (1 << RD16) | TMR_PRESCALE_1 | TMR_OFF; 
	
	// Clear the TMR registers
	tmr1_set(0x0000);

	// Clear possible remaining interrupt flag
	tmr1if = 0;
	
	// Interrupt enable
	pie1.TMR1IE = irq_mode;
	intcon.PEIE = irq_mode;
	if (irq_mode){
		intcon.GIE = 1;
	}
	
	return;
}

void tmr1_set(short value){
	// Program timer 1 registers
	HIBYTE(tmr1h, value);
	LOBYTE(tmr1l, value);
	
	return;
}

short tmr1_value(){
	short value;
	MAKESHORT(value, tmr1l, tmr1h);
	return value;
}

