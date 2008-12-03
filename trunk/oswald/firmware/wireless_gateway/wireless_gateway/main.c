//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#define FIRMWARE_VERSION "1.0"

unsigned char node1[4];

#pragma interrupt_handler Ticker_ISR

void Ticker_ISR()
{
	LED1_Invert();
	// Increment counter on the nodes
	if (node1[3]<255){
		node1[3]++;
	}
	
	return;
}

void print_data()
{
	LTRX_PutCRLF();
	LTRX_CPutString("EASYRADIO wireless gateway v");
	LTRX_CPutString(FIRMWARE_VERSION);
	LTRX_PutCRLF();
	LTRX_CPutString("Node 1: ");
	LTRX_PutSHexByte(node1[0]);
	LTRX_PutChar(' ');
	LTRX_PutSHexByte(node1[1]);
	LTRX_PutChar(' ');
	LTRX_PutSHexByte(node1[2]);
	LTRX_PutChar(' ');
	LTRX_PutSHexByte(node1[3]);
	LTRX_PutCRLF();
	LTRX_CPutString("EOT");
	LTRX_PutCRLF();
	
	return;
}
void main()
{
	
    // Insert your main routine code here.
	Counter8_Start();
	Counter8_ltrx_Start();
	LED1_Start();
	
	Ticker_EnableInt();
	
	char * strPtr; // Parameter pointer
	UART_IN_CmdReset(); // Initialize receiver/cmd buffer
	UART_IN_EnableInt(); // Enable RX interrupts
	
	UART_IN_Start(UART_PARITY_NONE); // Enable UART
	
	LTRX_CmdReset(); // Initialize receiver/cmd buffer
	LTRX_EnableInt(); // Enable RX interrupts
	
	LTRX_Start(UART_PARITY_NONE); // Enable UART
	
	M8C_EnableGInt ; // Turn on interrupts
	//LTRX_CPutString("\r\nOswald EASYRADIO wireless gateway v1.0\r\n");
	
	Ticker_Start();
	
	node1[3] = 0; // reset timer
	
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
