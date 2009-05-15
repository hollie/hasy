//----------------------------------------------------------------------------
// Sensor gateway on OSWALD PSoC ethernet board
//
// Supports OneWire temperature devices, Sensirion SHTxx devices and
// the Orcon HRC ventilation system remote control for setting the 
// working mode of the ventilation unit.
//
// Connect a Sensirion SHT11 or SHT15 sensor to 
//   DATA on P21 with a 10k pullup to VDD
//   CLK  on P47
//
// LTRX UART speed is 19200 bps
//
// Lieven Hollevoet, 2009.
// http://electronics.lika.be
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "oo.h"
#include "orcon.h"
#include "shtxx.h"
#include <string.h>
#include <stdio.h>

#define FIRMWARE_VERSION "1.0.2"

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
	LTRX_PutCRLF();	
	return;
}

void print_help(){
	print_header();
	printf("Press '?' to acquire sensor values and to generate a report\r\n");
	printf("Or enter 'venti'\r\n followed by 'low', 'normal' or 'high'\r\n to control the ventilation system speed\r\n");
}

// Init hardware blocks
void hardware_init(){

	// Start hardware/firmware functions
	Counter8_ltrx_Start();		// Counter for UART baudrate generation
	LED1_Start();				// Status LED
	Ticker_Start();				// Ticker for flashing LED
	OneWire_Start();			// OneWire lib init
	s_Start();					// SHT sensor init
	orcon_Start();
	
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
					print_header();
					// Report values of all connected sensors
					printf("-> OneWire devices\r\n");
					oo_report();
					printf("-> SHTxx sensors\r\n");
					s_do_measure();
					printf("-> EOT\r\n");
				} else if (strcmp(UART_bfr, "venti")==0){
					// Get the next parameter
					if (UART_bfr = LTRX_szGetParam()){
						switch (*UART_bfr){
						case 'l':
							orcon_low();
							break;
						case 'n':
							orcon_med();
							break;
						case 'h':
							orcon_high();
							break;
						default:
							printf(" ! Unknown parameter\r\n");
						}	
					} else {
						printf("Enter 'venti' followed by 'low', 'normal' or 'high'\r\n");
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
void putch(unsigned char c) {
  // Send characters to the Lantronix interface
  LTRX_PutChar(c);
  return;
}



