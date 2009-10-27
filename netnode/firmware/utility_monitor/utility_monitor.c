/*************************************************************
* Utility meter monitor
*
* Monitors the inputs TBD and counts pulses on them.
* Performs debouncing before the count is incremented
*
* (c) 2009, Lieven Hollevoet.
**************************************************************
* target device   : PIC18F2320
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
* UART speed      : 38400 bps
* mpasmwin.exe    : v5.34
* mplink.exe      : v4.34
* mcc18.exe       : v3.34*************************************************************/

#include <p18f2320.h>
#include <usart.h>
#include <delays.h>
#include <timers.h>
#include <stdio.h>

#include "fuses.h"
#include "utility_monitor.h"
#include "xpl.h"
#include "eeprom.h"

// Global variables used for message passing between ISR and main code
volatile int time_ticks = 0;

//////////////////////////////////////////////////////////////////
// Main loop
// Program strategy:
// * handle incoming xpl messages (respond on requests)
// * send heartbeat
// * monitor port pins for falling edges, debounce them and increment counter if required
void main()
{

	// fake a little bit, set an initial ID in the EEPROM
	eeprom_write(0x00, '0');
	eeprom_write(0x01, 'F');
	eeprom_write(0x02, '\0');

	// Hardware initialisation
	init();

	// Init the xPL library
	xpl_init();
	
	while (1){

		// Send a heartbeat every 5 minutes
		if (time_ticks > 300){
			xpl_send_hbeat();
			time_ticks = 0;
		}
	
	}
	
}

//////////////////////////////////////////////////////////////////
// Hardware initialisation routine
void init(void) 
{
	
	char blink_count = 0;

	// Oscillator selection
	OSCCONbits.IRCF0 = 1;
	OSCCONbits.IRCF1 = 1;
	OSCCONbits.IRCF2 = 1;

	// All digital IO's on ports
	ADCON1 = 0x0F;
	
	// Set port direction bits
	TRISA = PortAConfig;    
	TRISB = PortBConfig;
	TRISC = PortCConfig;
		
	// Serial interface init (38400 @ 8 MHz, BRGH = 1 => 0x0C)
	OpenUSART(USART_ASYNCH_MODE & 
			USART_TX_INT_OFF &
			USART_RX_INT_OFF &
			USART_EIGHT_BIT & 
			USART_CONT_RX & 
			USART_BRGH_HIGH, 
			0x0C);

	// Do the status LED flicker
	while (blink_count++ < 5){
		Delay10KTCYx(50);
		stat0 = 0;
		Delay10KTCYx(50);
		stat0 = 1;
	}
	
	// Enable the main 1-sec timer that will interrupt every second
	OpenTimer0(TIMER_INT_ON & 
			T0_16BIT & 
			T0_SOURCE_INT & 
			T0_PS_1_128);	

	WriteTimer0(TMR0_VALUE);		// Load initial timer value

	// Enable interrupt on falling edge of RB0
	//intcon2.RBPU    = 0; // Enable weak pull ups
	//intcon2.INTEDG0 = 0; // Falling edge
	//intcon.INT0IF   = 0; // Reset interrupt
	//intcon.INT0IE   = 1; // Clear mask bit
	INTCONbits.GIE      = 1; // Global interrupt enable

	// Setup the timer that will be used by the edge detection interrupt 
	// for counting those interrupts. When an edge is detected, the interrupt is 
	// disabled for ~ 525 ms to avoid false triggers.
	// The timer used for this purpose is timer3
	//tmr3_setup(TMR_IRQ_ON);
		
}



//////////////////////////////////////////////////////////////////
// Interrupt service routines
// 
// This is some ugly stuff, required by the C18 compiler to ensure 
// that the both interrupt vectors contain valid goto instructions

// Generate the high-priority interrupt vector, and put a goto high_isr there
#pragma code high_vector=0x08
void high_interrupt(void){
	_asm GOTO high_isr _endasm
}

#pragma code

#pragma interrupt high_isr
void high_isr(void){

	/* TIMER 0 INTERRUPT HANDLING */
	if (INTCONbits.TMR0IF==1){
		WriteTimer0(TMR0_VALUE);		// Reprogram timer
   		INTCONbits.TMR0IF=0;         	// Clear interrupt flag
		time_ticks++;
 	}

}

// Generate low-priority interrupt vector, and put a goto low_isr there
#pragma code low_vector=0x18
void low_interrupt(void){
	_asm GOTO low_isr _endasm
}

#pragma code
#pragma interruptlow low_isr
void low_isr(void){

}
