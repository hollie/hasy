/*************************************************************
* CANHABIS HASY node firmware
*
* (c) 2005, Lieven Hollevoet, boostc compiler.
*************************************************************/
#include "hasynode.h"
#include "serial.h"
#include "spi.h"
#include "mcp2515.h"

#pragma DATA 0x2007, _CP_OFF & _DEBUG_OFF & _WRT_OFF & _CPD_OFF & _LVP_OFF & _BODEN_ON & _PWRTE_ON & _WDT_OFF & _HS_OSC


void main()
{
	init();

	while (1){

		char input;
		// Check if something was received from the serial port
		if (serial_peek()){
			// If it was, go get it...
			input = serial_getch();
			
			if (input == 't'){
				serial_printf("TX CAN message...\r\n");
				can_init_buffer();
				can_load_byte(0xBA);
				can_load_byte(0xBE);
				can_tx_buffer();
			}
			if (input == 's'){
				can_read_status();
			}
		}	

		// Check if there is a message waiting in the CAN controller
		while (can_peek_message()){
			serial_print_hex(can_rx_byte());
		}
			
	}
	
}

void interrupt( void )
{
	// Handle the SPI interrupt
	if (spi_interrupt){
		spi_handle_interrupt();
	}
}

void init(void) 
{
	// Port configuration
	
	//adcon1     = 0x06; // all digital pins on PORTA
	 
	porta = 0;
	portb = 0;
	portc = 0x04;

	trisa = PortAConfig;    
	trisb = PortBConfig;
	trisc = PortCConfig;
	
	option_reg = 01000101b;
	
	// Serial interface
	serial_init(0x0C);
	serial_print_lf();
	serial_printf("Booting HASY node...");
	serial_print_lf();

	// Init the MCP2515
	spi_init();
	serial_printf("SPI init done\n");
	serial_print_lf();
	spi_disable_devices();
	
	// Enable global interrupts
	set_bit(intcon, GIE);
	serial_printf("Interrupts enabled");
	serial_print_lf();

	// Init the MCP2515 CAN interface
	can_init(0x1FF);
	serial_printf("CAN init done");
	serial_print_lf();

}

