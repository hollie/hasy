//----------------------------------------------------------------------------
// Sensor gateway on OSWALD PSoC ethernet board
//
// Supports OneWire temperature devices, Sensirion SHTxx devices and
// a PWM-based output that is used to generate a 0-10V to control the 
// speed of a Drexel and Weiss home ventilation unit
//
// OneWire bus connects to P25/P23. No pullup is required!!
//
// Connect a Sensirion SHT11 or SHT15 sensor to 
//   DATA on P21 with a 10k pullup to VDD
//   CLK  on P47
//
// PWM output on P27
//
// LTRX UART speed is 19200 bps
//
// Lieven Hollevoet, 2009-2010.
// http://electronics.lika.be
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "oo.h"
#include "shtxx.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#pragma interrupt_handler Ticker_ISR
void Ticker_ISR(void)
{
	LED1_Invert();
	return;
}

void print_header(void){
	cprintf("Sensor gateway v. 2.0\n");
	cprintf("Lieven Hollevoet, 2010\n\n");
	return;
}

void print_help(void){
	print_header();
	cprintf("Press '?' to acquire sensor values and to generate a report\r\n");
	cprintf("Or enter 'venti'\r\n followed by a value 0 - 100 to control the PWM output\r\n");
}

// Init hardware blocks
void hardware_init(void){

	// Start hardware/firmware functions
	Counter8_ltrx_Start();		// Counter for UART baudrate generation
	LED1_Start();				// Status LED
	OneWire_Start();			// OneWire lib init
	s_Start();					// SHT sensor init
	Speed_PWM_Start();			// Init the PWM for the speed control
	
	// UART
	LTRX_CmdReset(); 			// Initialize receiver/cmd buffer
	LTRX_EnableInt(); 			// Enable RX interrupts
	LTRX_Start(UART_PARITY_NONE); // Enable UART

	// Interrupts
	Speed_PWM_DisableInt();
	Ticker_EnableInt();
	M8C_EnableGInt ; 

	Ticker_Start();				// Ticker for flashing LED

}

void main(void)
{

	char * UART_bfr; // Parameter pointer for UART RX buffer
	char pwm_value;
	
	hardware_init();	
	
	Speed_PWM_WritePulseWidth(100);
	
	print_help();
	
	while(1) {
	
		// Check if data came in from the Lantronix and reply if required
		if (LTRX_bCmdCheck()) { // Wait for command
			if(UART_bfr = LTRX_szGetParam()) { // More than delimiter?
				if (*UART_bfr == '?'){
					print_header();
					// Report values of all connected sensors
					cprintf("-> OneWire devices\r\n");
					oo_report();
					cprintf("-> SHTxx sensors\r\n");
					s_do_measure();
					cprintf("-> EOT\r\n");
				} else if (cstrcmp("venti", UART_bfr)== 0){
					// Get the next parameter
					if (UART_bfr = LTRX_szGetParam()){
						pwm_value = atoi(UART_bfr);
						if (pwm_value >= 0 && pwm_value <= 100) {
							cprintf("Setting venti speed to ");
							LTRX_PutSHexByte(pwm_value);
							cprintf(" %\r\n");
							Speed_PWM_WritePulseWidth(100-pwm_value);					
						} else {
							cprintf("Invalid speed setting passed (valid: 0-100)\r\n");
						}
					} else {
						cprintf("Enter 'venti' followed by a value beween 0 and 100\r\n");
						
					}
				} else {
					print_help();
				}
				
			}
			LTRX_CmdReset(); // Reset command buffer
		}
	}

	
}

// Helper function for the printf function.
int putchar(char c) {
  // Send characters to the Lantronix interface
  LTRX_PutChar(c);
  return 1;
}



