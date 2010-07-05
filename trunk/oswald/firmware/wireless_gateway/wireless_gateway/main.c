//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include <stdio.h>
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#define FIRMWARE_VERSION "1.1"

unsigned char node1[4];

#pragma interrupt_handler Ticker_ISR

// We always need a blinking LED
void Ticker_ISR(void)
{
	LED1_Invert();
	// Increment counter on the nodes
	if (node1[3]<255){
		node1[3]++;
	}
	
	return;
}

// Print the most recent data received by the wireless interface
void print_data(void)
{
	cprintf("EASYRADIO wireless gateway v");
	cprintf(FIRMWARE_VERSION);
	cprintf("\n"); 
	cprintf("Node 1: %02X %02X %02X %02X\nEOT\n", node1[0], node1[1], node1[2], node1[3]);
	return;
}
void main(void)
{

	char * strPtr; // Parameter pointer

	// Init the hardware blocks
	Counter8_Start();
	Counter8_ltrx_Start();
	LED1_Start();
	
	Ticker_EnableInt();
	
	UART_IN_CmdReset(); // Initialize receiver/cmd buffer
	UART_IN_EnableInt(); // Enable RX interrupts
	
	UART_IN_Start(UART_PARITY_NONE); // Enable UART
	
	LTRX_CmdReset(); // Initialize receiver/cmd buffer
	LTRX_EnableInt(); // Enable RX interrupts
	
	LTRX_Start(UART_PARITY_NONE); // Enable UART
	
	M8C_EnableGInt ; // Turn on interrupts

	Ticker_Start();

	cprintf("EASYRADIO wireless gateway listening\n");
	
	// Ensure packet validity counter is set to 'very old'	
	node1[3] = 255; // reset timer
	
	// Main loop: wait for sensor data, wait for command
	while(1) {
		// Check if data came in from the radio module
		if(UART_IN_bCmdCheck()) { // Wait for command
			if(strPtr = UART_IN_szGetParam()) { // More than delimiter?
				if (*strPtr == 0x01){
					node1[0] = (*(strPtr+1)); // Get solar value
					node1[1] = (*(strPtr+2)); // Get supply value
					node1[3] = 0;             // Restart the heartbeat counter
					LTRX_PutChar('A');
				}
				if (*strPtr == 0x02){
				    node1[0] = (*(strPtr+1)); // Get solar value
					node1[2] = (*(strPtr+2)); // Get temperature value
					node1[3] = 0;             // Restart the heartbeat counter
					LTRX_PutChar('B');
				}
			}
			UART_IN_CmdReset(); // Reset command buffer
		}
		
		// Check if data came in from the Lantronix and reply if required
		if (LTRX_bCmdCheck()) { // Wait for command
			if(strPtr = LTRX_szGetParam()) { // More than delimiter?
				if (*strPtr == '?'){
					print_data();
				}
			}
			LTRX_CmdReset(); // Reset command buffer
		}
		
	}
	
}

// Helper function for the printf function
int putchar(char c) {
  // Send characters to the Lantronix interface
  LTRX_PutChar(c);
  return 1;
}

