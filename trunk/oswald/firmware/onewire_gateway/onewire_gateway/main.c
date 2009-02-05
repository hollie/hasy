//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "oo.h"

#define FIRMWARE_VERSION "1.0"

unsigned char id0[8];
unsigned char id1[8];
unsigned short temp0;
unsigned short temp1;

// Function prototypes
void hardware_init();
void print_id(unsigned char *id);
void get_sensors();
void get_temp();

#pragma interrupt_handler Ticker_ISR

void Ticker_ISR()
{
	LED1_Invert();
	
	return;
}

void print_data()
{
	LTRX_PutCRLF();
	LTRX_CPutString("OneWire gateway v.");
	LTRX_CPutString(FIRMWARE_VERSION);
	LTRX_PutCRLF();
	LTRX_CPutString("Node 1 ID: ");
	print_id(id0);
	LTRX_CPutString(" - ");
	LTRX_PutSHexInt(temp0);
	LTRX_PutCRLF();
	LTRX_CPutString("Node 2 ID: ");
	print_id(id1);
	LTRX_CPutString(" - ");
	LTRX_PutSHexInt(temp1);
	LTRX_PutCRLF();
	LTRX_CPutString("EOT");
	LTRX_PutCRLF();
	
	return;
}
void print_header(){
	LTRX_PutCRLF();
	LTRX_CPutString("OneWire gateway v.");
	LTRX_CPutString(FIRMWARE_VERSION);
	LTRX_PutCRLF();	
	
	return;
}


void print_help(){
	print_header();
	LTRX_PutCRLF();	
	LTRX_CPutString("Press 'T' to initiate temperature conversion and to get a report");
	LTRX_PutCRLF();	
}

void main()
{

	char * strPtr; // Parameter pointer for UART RX buffer
	
	
	hardware_init();	
	
	get_sensors();
	get_temp();
	print_data();
	
	while(1) {
	
		// Check if data came in from the Lantronix and reply if required
		if (LTRX_bCmdCheck()) { // Wait for command
			if(strPtr = LTRX_szGetParam()) { // More than delimiter?
				if (*strPtr == '#'){
					get_sensors();
					print_data();
				} else if (*strPtr == 'T'){
					oo_report();
				} else {
					print_help();
				}
				
			}
			LTRX_CmdReset(); // Reset command buffer
		}
	}

	
}

// Init hardware blocks
void hardware_init(){

	// Start hardware/firmware functions
	OneWire_Start();
	Counter8_Start();
	Counter8_ltrx_Start();
	LED1_Start();
	Ticker_Start();
	
	// UART
	LTRX_CmdReset(); 			// Initialize receiver/cmd buffer
	LTRX_EnableInt(); 			// Enable RX interrupts
	LTRX_Start(UART_PARITY_NONE); // Enable UART

	// Interrupts
	Ticker_EnableInt();
	M8C_EnableGInt ; 

}

void get_sensors(){

	char next_found = 0;
	
	if (!OneWire_fReset()){
		LTRX_CPutString("No sensor found on bus");
		LTRX_PutCRLF();	
		return;
	}
	
	if (OneWire_fFindFirst()){
		OneWire_GetROM(id0);
	} else {
		LTRX_CPutString("Problem detecting sensor 1");
		LTRX_PutCRLF();			
	}
	if (OneWire_fFindNext()){
		OneWire_GetROM(id1);
	} else {
		LTRX_CPutString("Problem detecting sensor 2");
		LTRX_PutCRLF();	
	}

	LTRX_CPutString("get_sensors done...");
	LTRX_PutCRLF();	

	
}

void get_temp(){


	// Reset
	if (!OneWire_fReset()){
		LTRX_CPutString("No sensor found on bus");
		LTRX_PutCRLF();	
		return;
	}
	
	// SkipROM
	OneWire_WriteByte(OO_SKIPROM);
	
	// Initiate conversion
	OneWire_WriteByte(OO_CONVERTT);
	
	// Wait until done
	while (!OneWire_bReadByte()){};


	// Select sensor 1 and readout
	OneWire_fReset();
	OneWire_SetROM(id0);
	OneWire_fVerify();
	OneWire_WriteByte(OO_READPAD);
	temp0 = OneWire_bReadByte();
	temp0 += OneWire_bReadByte() << 8;
	
	// Select sensor 2 and readout
	OneWire_fReset();
	OneWire_SetROM(id1);
	OneWire_fVerify();
	OneWire_WriteByte(OO_READPAD);
	temp1 = OneWire_bReadByte();
	temp1 += OneWire_bReadByte() << 8;

	LTRX_CPutString("Conversion/grabbing done...");
	LTRX_PutCRLF();	

}

void print_id(unsigned char *id){

	char cntr = 0;
	for (cntr=0; cntr<8; cntr++){
		LTRX_PutSHexByte(*(id+cntr));	
	}
}
