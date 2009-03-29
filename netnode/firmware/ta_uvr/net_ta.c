/*************************************************************
* Technische Alternative UVR61-3 ethernet data logger
*
* Has an additional counter input on RB0. Add a pullup 
* to RB0, counter increments on falling edge on RB0.
*
* (c) 2004-2009, Lieven Hollevoet.
**************************************************************
* boostc compiler : v 6.40
* target device   : PIC18F2320
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
* UART speed      : 38400 bps
*************************************************************/

#include "net_ta.h"
#include "serial.h"
#include "eeprom.h"
#include "ta_uvr.h"
#include "timers.h"

// Device configuration section
#pragma DATA  _CONFIG1H, _IESO_OFF_1H & _FSCM_OFF_1H & _INTIO2_OSC_1H
#pragma DATA  _CONFIG2L, _PWRT_ON_2L & _BOR_ON_2L & _BORV_20_2L
#pragma DATA  _CONFIG2H, _WDT_OFF_2H & _WDTPS_32K_2H
#pragma DATA  _CONFIG3H, _MCLRE_ON_3H & _PBAD_DIG_3H & _CCP2MX_C1_3H
#pragma DATA  _CONFIG4L, _DEBUG_OFF_4L & _LVP_OFF_4L & _STVR_OFF_4L

#pragma DATA  _CONFIG5L, _CP0_OFF_5L & _CP1_OFF_5L & _CP2_OFF_5L & _CP3_OFF_5L
#pragma DATA  _CONFIG5H, _CPB_OFF_5H & _CPD_OFF_5H
#pragma DATA  _CONFIG6L, _WRT0_OFF_6L & _WRT1_OFF_6L & _WRT2_OFF_6L & _WRT3_OFF_6L
#pragma DATA  _CONFIG6H, _WRTC_OFF_6H & _WRTB_OFF_6H & _WRTD_OFF_6H
#pragma DATA  _CONFIG7L, _EBTR0_OFF_7L & _EBTR1_OFF_7L & _EBTR2_OFF_7L & _EBTR3_OFF_7L
#pragma DATA  _CONFIG7H, _EBTRB_OFF_7H

// Program strategy:
//  1. Synchronize with incoming data: sample @ 488 * 32 Hz.
//     Wait for more than one byte '1' bits (sync frame). 
//  2. Detect the next first start bit, wait for 3/4th of a bit time and sample. Set the timer to interrupt every complete bit time
//  3. Process bytes as they arrive, based on the pace of the timer interrupts
//
//  Data rate: 488 Hz
//  Data = valid in second half of the bit time, we sample @ 3/4 of the bit time
//   sample margin = 1/(488*4) = 512 us
//  
//  So, after the first falling edge we wait 
//     1/488 * 1/4 = 0.51 ms (~1024 instructions)
//  From then on, a time fires every
//     1/488       = 2.05 ms (4098 instructions)

extern char mydata[NR_DATA_BYTES];
extern char ta_uvr_tmrl;
extern char ta_uvr_tmrh;
short interrupt_count;

void main()
{
	char tmp = 0;
	char command_byte;
	char valid_data = 0;
	short prev_count = 0;
	
	// Hardware initialisation
	init();
	
	// Main loop
	while (1){

		// Set the counter LED on if we got an interrupt
		if (prev_count != interrupt_count) {
			portb.1 = 0;
			prev_count = interrupt_count;
		}
		
		// If we get valid info from UVR, verify
		if (ta_uvr_getinfo() == 0) {
			if (ta_uvr_verify_checksum() == 0) {
				// Data checksum is OK, clear for TX of UVR status			
				stat0 = 0;
			} else {
				// Retry on next packet
				stat0 = 1;
			}
		}

		// Reset the LED
		portb.1 = 1;

		if (serial_peek()){
			stat0=0;
			command_byte = serial_getch();
			if (command_byte == 'S') {
				report_and_reset_int_count();
				continue;
			} else if (ta_uvr_data_available()) {
				stat0=1;
				// Report UVR status
				ta_uvr_send_data();
			} else {
				serial_printf("No valid packet received from regulator since last read");
				serial_print_lf();
			}	
			serial_printf("Interrupts: ");	
			serial_print_hex(interrupt_count);
			serial_print_lf();
			serial_printf("EOT");
			
		} 
	}
	
}

// Report interupt count and reset the count.
// Note: interrupts are disabled at this stage, to avoid contention of the reset and increment
// We don't miss events, as the interrupt flag is always set
void report_and_reset_int_count(void)
{
	short count_shadow = 0;
	
	serial_printf("Interrupts: ");	
	intcon.GIE = 0;
	count_shadow = interrupt_count;
	interrupt_count = 0;
	intcon.GIE = 1;

	serial_print_hex(count_shadow);
	serial_print_lf();
	serial_printf("EOT");
	
}

void init(void) 
{
	
	char blink_count = 0;
	interrupt_count  = 0;

	// Oscillator selection
	osccon.IRCF0 = 1;
	osccon.IRCF1 = 1;
	osccon.IRCF2 = 1;

	adcon1 = 0x0F;
	
	trisa = PortAConfig;    
	trisb = PortBConfig;
	trisc = PortCConfig;
	
		
	// Serial interface init (38400 @ 8 MHz, BRGH = 1 => 0x0C)
	serial_init(0x0c);
	
	// Do the status LED flicker
	while (blink_count++ < 5){
		delay_ms(50);
		stat0 = 0;
		delay_ms(50);
		stat0 = 1;
	}
	
	// Serial interface
	serial_printf("Booting UVR61-3 LAN logger....");
	serial_print_lf();

	// Enable interrupt on falling edge of RB0
	intcon2.INTEDG0 = 0; // Falling edge
	intcon.INT0IF   = 0; // Reset interrupt
	intcon.INT0IE   = 1; // Clear mask bit
	intcon.GIE      = 1; // Global interrupt enable
	
}


// ISR
void interrupt(){

	// TMR1 interrupt
	if (tmr1if){
		// Reload the timer
		tmr1h = ta_uvr_tmrh;
		tmr1l = ta_uvr_tmrl;
		ta_uvr_gotbit = 1;

		// Clear IF
		tmr1_clrif();
	}
	
	// RB0 interrupt
	if (intcon.INT0IF){
	
		// Increment the Wh counter
		interrupt_count++;
		
		// Clear IF
		intcon.INT0IF = 0;
	}
	
}
