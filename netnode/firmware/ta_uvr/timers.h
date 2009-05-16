/*************************************************************
* Timer helper functions for the PIC16F87X series 
*
* Allows for easy setup of the timers with interrupts
*
* (c) Lieven Hollevoet
* most recent version on http://boostc.lika.be
*************************************************************/

#ifndef _TIMERS_H_
#define _TIMERS_H_

#include <system.h>

typedef enum {
	TMR_IRQ_ON = 1,
	TMR_IRQ_OFF = 0
} tmr_irq_t;

typedef enum {
	TMR_ON         = 0x01,
	TMR_OFF        = 0x00,
	TMR_PRESCALE_1 = 0x00,
	TMR_PRESCALE_2 = 0x10,
	TMR_PRESCALE_4 = 0x20,
	TMR_PRESCALE_8 = 0x30
} tmr_t1con_t;

// Timer 1 controlling functions
void  tmr1_setup(tmr_irq_t irq_mode);

void  tmr1_set(short value);
short tmr1_value();
#define tmr1_start() set_bit(t1con, TMR1ON)
#define tmr1_stop()  clear_bit(t1con, TMR1ON)
#define tmr1_clrif() clear_bit(pir1, TMR1IF)

volatile bit tmr1if @ PIR1 . TMR1IF;
 

// Timer 3 controlling functions
void tmr3_setup(tmr_irq_t irq_mode);

void tmr3_set(short value);
#define tmr3_start() set_bit(t3con, TMR3ON);
#define tmr3_stop()  clear_bit(t3con, TMR3ON);
#define tmr3_clrif() clear_bit(pir2, TMR3IF);

volatile bit tmr3if @ PIR2 . TMR3IF;

#endif // _TIMERS_H_
