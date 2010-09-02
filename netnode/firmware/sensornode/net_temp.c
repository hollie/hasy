/*************************************************************
* Ethernet temperature logger
*
* (c) 2006, Lieven Hollevoet, boostc compiler.
*************************************************************/

///////////////////////////////////////////////////////////////////////////////
// Compiler: boostc v6.35
// Target  : PIC18F2320
// Clock   : 8 MHz, internal
// UART    : 8N1 38400 bps
///////////////////////////////////////////////////////////////////////////////

#include "net_temp.h"
#include "serial.h"
#include "oo.h"
#include "eeprom.h"

// Device configuration section
#pragma DATA  _CONFIG1H, _IESO_OFF_1H & _FCMEN_OFF_1H & _OSC_INTIO67_1H
#pragma DATA  _CONFIG2L, _PWRT_ON_2L & _BOREN_ON_2L & _BORV_2_2L
#pragma DATA  _CONFIG2H, _WDT_OFF_2H & _WDTPS_32768_2H
#pragma DATA  _CONFIG3H, _MCLRE_ON_3H & _PBADEN_OFF_3H & _CCP2MX_PORTC_3H
#pragma DATA  _CONFIG4L, _DEBUG_OFF_4L & _LVP_OFF_4L & _STVREN_OFF_4L

#pragma DATA  _CONFIG5L, _CP0_OFF_5L & _CP1_OFF_5L & _CP2_OFF_5L & _CP3_OFF_5L
#pragma DATA  _CONFIG5H, _CPB_OFF_5H & _CPD_OFF_5H
#pragma DATA  _CONFIG6L, _WRT0_OFF_6L & _WRT1_OFF_6L & _WRT2_OFF_6L & _WRT3_OFF_6L
#pragma DATA  _CONFIG6H, _WRTC_OFF_6H & _WRTB_OFF_6H & _WRTD_OFF_6H
#pragma DATA  _CONFIG7L, _EBTR0_OFF_7L & _EBTR1_OFF_7L & _EBTR2_OFF_7L & _EBTR3_OFF_7L
#pragma DATA  _CONFIG7H, _EBTRB_OFF_7H

void main()
{
	char tmp;
	char command_byte;

	
	// Hardware initialisation
	init();

	// Send presence message
	identify();
	
	// Main loop
	while (1){
	
	
		// Allow wakeup
		//delay_ms(100);
		
		/*//stat0 = 0;

*/



		if (serial_peek()){
/*
			tmp = serial_safe_receive();
			
			// SYSTEM COMMANDS
			if (serial_safe_getbyte(0) == 0) {
				// 00: Reset the device
				if (serial_safe_getbyte(1) == 0x00){
					asm 
					{ 
						reset 
					}
				}
				
				// 01: Identify
				if (serial_safe_getbyte(1) == 0x01){
					identify();
				}
				
				
			}

			// DEVICE SPECIFIC COMMANDS
			if (serial_safe_getbyte(0) == 0x01) {
				
				switch (serial_safe_getbyte(1)){
				case 0x00:
					// 00: Scanbus
					serial_safe_init();
					serial_safe_putbyte(oo_scanbus());
					serial_safe_send();
					break;
				case 0x01:
					// 01: Report number of connected One Wire devices
					serial_safe_init();
					serial_safe_putbyte(oo_get_devicecount());
					serial_safe_send();
					break;
				case 0x02:
					// 02: Start temperature conversion
					oo_busreset();			// Reset the one wire bus
					oo_start_conversion();	// Start the temparature conversion (non-blocking function)

					serial_safe_init();

					// Make sure the conversion is complete
					if (oo_wait_for_completion() == 1){
						serial_safe_putbyte(1);
					} else {
						serial_safe_putbyte(0);
					}
					serial_safe_send();
					break;
				case 0x03:
					// 03: Read a specific sensor
					//serial_printf("reading device ");
					//serial_print_dec(serial_safe_getbyte(2));
					oo_tdata data;
					data = oo_read_device(serial_safe_getbyte(2));
					
					char *p;
					p = (char *)&data;
						
					serial_safe_init();
					serial_safe_putbyte(serial_safe_getbyte(2));
					
					for (tmp = 0; tmp < 13; tmp++){
						serial_safe_putbyte(*p++);
					}
					serial_safe_send();
					
				}
			}
			*/
			// If it was, go get it...
			char input = serial_getch();
			serial_printf(input);
			
			if (input == '0'){
				oo_read_device(0);
			}
			if (input == '1'){
				oo_read_device(1);
			}
			
			if (input == 't'){
				serial_safe_init();
				serial_safe_putbyte(0x31);
				serial_safe_putbyte(0x0F);
				serial_safe_send();
			}
			
			if (input == 'r'){
				tmp = serial_safe_receive();
				serial_printf("|");
				while (tmp){
					//serial_print_hex(serial_safe_getbyte());
					tmp--;
				}
				serial_print_lf();
			}
			// Start a temperature conversion on all devices
			if (input == 'c'){
					oo_busreset();			// Reset the one wire bus
					oo_start_conversion();	// Start the temparature conversion (non-blocking function)
	
				// Wait for completion, you could do other stuff here
				// But make sure that this function returns zero before 
				// reading the scratchpad
				if (oo_wait_for_completion() == 1){
					serial_printf("Temperature conversion timed out");
				}
				
			}
			
			if (input == 'i'){
				identify();
			}
			
			if (input == 's'){
				oo_scanbus();
			}
			
			if (input == 'n'){
				serial_printf("Nr of available sensors: ");
				serial_print_dec(oo_get_devicecount());
				serial_print_lf();
			}
		}
		//delay_ms(255);
		
		//}
	}
	
}

void interrupt( void )
{
}

void init(void) 
{
	
	// Oscillator selection
	osccon.IRCF0 = 1;
	osccon.IRCF1 = 1;
	osccon.IRCF2 = 1;

	adcon1 = 0x0F;
	
	trisa = PortAConfig;    
	trisb = PortBConfig;
	trisc = PortCConfig;
	
	
	stat0 = 0;
	
	// Allow for some init time to avoid false input to the serial interface chip (FTDI)
	delay_ms(100);
	
	stat0 = 1;
	
	// Serial interface init (38400)
	serial_init(0x0C);
	
	
	// Serial interface
	//serial_printf("Booting HASY NetNode OneWire firmware v0.1....");
	serial_print_lf();

// TODO: uncomment the check. For dev purposes, the scanbus is run after reset
	// Check if we already found devices on the One Wire bus, if not search the bus
	if (eeprom_read(OO_EEPROM_NR_IDS) == 0xFF){
		//serial_printf("Fresh device, running a scanbus...");
		serial_print_lf();
		oo_scanbus();
	}

	
}
/*
void command_temp_measurement(void){

	char loper;
		
	// Reset the one wire bus
	oo_busreset();
		
	// Start the temparature conversion (non-blocking function)
	oo_start_conversion();
	
	// Wait for completion, you could do other stuff here
	// But make sure that this function returns zero before 
	// reading the scratchpad
	if (oo_wait_for_completion() == 1){
		serial_printf("Temperature conversion timed out");
	}
		
	// Go through the list of available nodes and read their temperature
	for (loper = 0; loper < oo_get_devicecount(); loper++){
		oo_read_device(loper);
	}
	
}
*/
void identify(){
	// Identify the device on the network
	// Send device ID, firmware version and configuration
	serial_safe_init();
	serial_safe_putbyte(0x00);
	serial_safe_putbyte(0x01);
	serial_safe_putbyte(DEVICE_ID);
	serial_safe_putbyte(FIRMWARE_MAJOR);
	serial_safe_putbyte(FIRMWARE_MINOR);
	serial_safe_putbyte(eeprom_read(OO_EEPROM_NR_IDS));
	serial_safe_putbyte(eeprom_read(DEVICE_AUTOMODE));
	serial_safe_send();

}

