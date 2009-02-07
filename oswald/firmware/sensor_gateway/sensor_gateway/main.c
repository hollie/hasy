//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "oo.h"
#include "shtxx.h"
#include <stdio.h>

#define FIRMWARE_VERSION "0.99"

#pragma interrupt_handler Ticker_ISR
void Ticker_ISR()
{
	LED1_Invert();
	
	return;
}

void print_header(){
	LTRX_PutCRLF();
	LTRX_CPutString("Sensor gateway v.");
	LTRX_CPutString(FIRMWARE_VERSION);
	LTRX_PutCRLF();	
	LTRX_CPutString("Lieven Hollevoet, 2009");
	LTRX_PutCRLF();	
	return;
}

void print_help(){
	print_header();
	LTRX_CPutString("Press '?' to acquire sensor values and to generate a report");
	LTRX_PutCRLF();	
}

// Init hardware blocks
void hardware_init(){

	// Start hardware/firmware functions
	Counter8_ltrx_Start();		// Counter for UART baudrate generation
	LED1_Start();				// Status LED
	Ticker_Start();				// Ticker for flashing LED
	OneWire_Start();			// OneWire lib init
	s_Start();					// SHT sensor init
	
	// UART
	LTRX_CmdReset(); 			// Initialize receiver/cmd buffer
	LTRX_EnableInt(); 			// Enable RX interrupts
	LTRX_Start(UART_PARITY_NONE); // Enable UART

	// Interrupts
	Ticker_EnableInt();
	M8C_EnableGInt ; 

}

void main()
{

	char * UART_bfr; // Parameter pointer for UART RX buffer
	
	hardware_init();	
	
	print_help();
	
	while(1) {
	
		// Check if data came in from the Lantronix and reply if required
		if (LTRX_bCmdCheck()) { // Wait for command
			if(UART_bfr = LTRX_szGetParam()) { // More than delimiter?
				if (*UART_bfr == '?'){
					// Report values of all connected sensors
					printf("-> OneWire devices\r\n");
					oo_report();
					printf("-> SHTxx sensors\r\n");
					s_do_measure();
					printf("-> EOT\r\n");
				} else {
					print_help();
				}
				
			}
			LTRX_CmdReset(); // Reset command buffer
		}
	}

	
}

// Helper function for the printf function.
void putch(unsigned char c) {
  // Send characters to the Lantronix interface
  LTRX_PutChar(c);
  return;
}



