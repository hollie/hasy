//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

#define FIRMWARE_VERSION "1.0"

unsigned char node1[2];

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
	
	char * strPtr; // Parameter pointer
	UART_IN_CmdReset(); // Initialize receiver/cmd buffer
	UART_IN_EnableInt(); // Enable RX interrupts
	
	UART_IN_Start(UART_PARITY_NONE); // Enable UART
	
	LTRX_CmdReset(); // Initialize receiver/cmd buffer
	LTRX_EnableInt(); // Enable RX interrupts
	
	LTRX_Start(UART_PARITY_NONE); // Enable UART
	
	M8C_EnableGInt ; // Turn on interrupts
	LTRX_CPutString("\r\nOswald EASYRADIO wireless gateway v1.0\r\n");
	
	while(1) {
		if(UART_IN_bCmdCheck()) { // Wait for command
			if(strPtr = UART_IN_szGetParam()) { // More than delimiter?
				if (*strPtr == 0x01){
					node1[0] = (*(strPtr+1)); // Get solar value
					node1[1] = (*(strPtr+2)); // Get supply value
				}
			print_data();
			}
			UART_IN_CmdReset(); // Reset command buffer
		}
		
	}

	
}
