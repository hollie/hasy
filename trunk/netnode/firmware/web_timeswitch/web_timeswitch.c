/*************************************************************
* Web-based time switch
*
* Allow to control a relay based on day-of-week and current time
* The time is synced to a webserver (through a php script) and
* toggling of the relay is reported to the webserver.
*
* (c) 2009, Lieven Hollevoet
*     http://electronics.lika.be
* 
* Note that currently setting the switchpoints is done by 
* reprogramming the EEPROM due to lack of code space in 
* the PIC18F2320.
**************************************************************
* target device   : PIC18F2320
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
* UART speed      : 9600 bps
* mpasmwin.exe    : v5.34
* mplink.exe      : v4.34
* mcc18.exe       : v3.34
*************************************************************/

#include <p18cxxx.h>
#include <usart.h>
//#include <delays.h>
#include <timers.h>
#include <stdio.h>

#include "fuses.h"

#include "web_timeswitch.h"
#include "switchpoint.h"
#include "clock.h"


// -----------------------------------------------------------------------------------------
// The switchpoints are stored in EEPROM memory and use a simple dataformat.
// There is a counter that keeps track of the number of switch points that are valid.
// That counter is located @ 0x0000 in EEPROM.
// In the next code block, the switchpoints are stored. 
// Every point takes 4 memory locations
// and has the following structure:
//  word 1 = hour
//  word 2 = minutes
//  word 3 = day mask (7 LSB's, bit = 1 -> switch point is active on that day, SMTW TFSx)
//  word 4 = state the switch should take.
// -----------------------------------------------------------------------------------------
// Days: char 0=sunday, 6=saturday.

#pragma romdata eedata_scn=0xf00000
// Default switch points:      3 points  , MF on @6.45   , STWTS on @7.45, all off @22.00
rom char eedata_values[16] = {3, 0, 0, 0, 6, 45, 0x44, 1, 7, 30, 0xB6, 1, 22, 0x00, 0xFE, 0};
#pragma romdata

enum UART_STATE_TYPE uart_state;

#define RX_BUFSIZE 11
char rx_buffer[RX_BUFSIZE];
char rx_pointer;
int  connection_string_length;

char output = 0;

///////////////////////////////////////////////////////////////////////
// Main function
//  The code works interrupt based, so the main loop just goes over
//  the state variables to check if action is required.
///////////////////////////////////////////////////////////////////////
void main()
{

	char input;
	char uart_hour;
	char uart_min;
	char uart_sec;
	char uart_day;
	char report_clock_was_set = 0;
	char switch_updated;
	char new_incoming;
    char new_update;

	// Some hardware init first
	init();
		
	// Main loop
	while (1){

		// Set output LED indicator
		output_led = !output;
		
		// Act depending on the UART state
		if (uart_state == STRING_RECEIVED){
			if (rx_buffer[1] == '-' && rx_buffer[4] == ':') {
				// We have received a valid string with time information, parse it
				uart_state = WAIT_FOR_DISCONNECT;
				uart_day = rx_buffer[0] - 0x30;
				uart_hour = (rx_buffer[2] - 0x30) * 10 + (rx_buffer[3] - 0x30);
				uart_min  = (rx_buffer[5] - 0x30) * 10 + (rx_buffer[6] - 0x30);
				uart_sec  = (rx_buffer[8] - 0x30) * 10 + (rx_buffer[9] - 0x30);
				clock_set(uart_day, uart_hour, uart_min, uart_sec);
				report_clock_was_set = 1;
				check_timer_table    = 1;
			} else if (rx_buffer[0] == 'O' && rx_buffer[1] == 'K') {
				// We received an OK response, wait for disconnect
				uart_state = WAIT_FOR_DISCONNECT;
			} 
		}

		// Report status to incoming connection
		// When a user telnets into the XPORT, current internal time and
        // switch points are reported.
		if (uart_state == INCOMING && new_incoming){
			clock_print();
			print_switch_list();
			new_incoming = 0;
		}
		if (uart_state == IDLE) {
			new_incoming = 1;
		}

		// Update the switch status if there is need to, based on the current time
        // and the rules defined in the EEPROM
		if (check_timer_table){
			check_timer_table = 0;
			switch_updated |= update_switch_state(clock_get_day(), clock_get_hours(), clock_get_minutes());
		}

		// Check if we need to sync our internal clock to the web server.
		// This is done one minute after the odd hour mark when the UART is IDLE
		if ( (uart_state == IDLE) && (clock_get_minutes() == 0x01) && /*(clock_get_hours() & 0x01 == 0) &&*/ new_update) {
			web_php_interface(REQUEST_TIME);
			new_update = 0;
		}
		if (clock_get_minutes() == 0x00) {
			new_update = 1;      // Set at minute 0 so that we only request time once after the one minute mark
		}
		
		// Report to the web that the clock was set
		if (uart_state == IDLE && report_clock_was_set) {
			report_clock_was_set = 0;
			web_php_interface(REPORT_CLOCK_SET);
		}

		// Report to the web that the switch state changed
		if (uart_state == IDLE && switch_updated) {
			switch_updated = 0;
			web_php_interface(REPORT_SWITCH_STATE);
		}
	}
	
}


///////////////////////////////////////////////////////////////////////
// Hardware and variable init.
///////////////////////////////////////////////////////////////////////
void init(void) 
{
	
	// Oscillator selection
	OSCCONbits.IRCF0 = 1;
	OSCCONbits.IRCF1 = 1;
	OSCCONbits.IRCF2 = 1;

	// All digital pins on porta
	ADCON1 = 0x0F;
	
	// Set initial port state
	PORTA = 1;
	PORTB = 0;
	PORTC = 0x04;

	TRISA = PortAConfig;    
	TRISB = PortBConfig;
	TRISC = PortCConfig;
	
	// PortB pullups enable
	INTCON2bits.NOT_RBPU = 0;
	
	// Enable the main 1-sec timer that will interrupt every second
	OpenTimer0(TIMER_INT_ON & 
			T0_16BIT & 
			T0_SOURCE_INT & 
			T0_PS_1_32);	

	WriteTimer0(TMR0_VAL);		// Load initial timer value

	// Serial interface init (9600 @ 8 MHz, BRGH = 1 => 51)
	OpenUSART(USART_ASYNCH_MODE & 
			USART_TX_INT_OFF &
			USART_RX_INT_ON &
			USART_EIGHT_BIT & 
			USART_CONT_RX & 
			USART_BRGH_HIGH, 
			51);
	
	uart_state = IDLE;
	rx_pointer = 0;

	// Enable interrupts
	INTCONbits.GIE = 1;
	INTCONbits.PEIE = 1;	
	// Clear the clock
	clock_clear();
	
	// Clear possible existing interrupt flags
	INTCONbits.INT0IF = 0;
	INTCONbits.TMR0IF = 0;
	PIR1bits.TMR1IF = 0;
	
	output = 0;

	switchpoint_init();

}

///////////////////////////////////////////////////////////////////////
// State machine to process that UART input
// This function takes care of the interface towards the XPORT 
// that has been put in 'manual connection' mode.
///////////////////////////////////////////////////////////////////////
void process_uart(char data){

	connection_string_length++;

	switch (data) {
	case 'C':  // When a connection is made, the XPORT sends a 'C'
		if (uart_state == WAIT_CONNECT || uart_state == IDLE) {
			uart_state = CONNECTED;
			connection_string_length = 0;
		}

		return;
	case 'I':  // When the next character is an 'I', it is an active incoming connection. Handle it...
		if (uart_state == CONNECTED && connection_string_length == 1) {
			uart_state = INCOMING;
		}
		return;
	case '<': // When we get the start of a string that needs to be stored
		if (uart_state == WAITING_INFO) {
			uart_state = STORE_STRING;
		}
		return;
	case '>': // End of the string that needs to be stored
		if (uart_state == STORE_STRING){
			uart_state = STRING_RECEIVED;
		}
	default: 
		switch (uart_state){
		case CONNECTED:
			// I we get here, we're connected but not to an incoming connection
			// wait for string marker
			uart_state = WAITING_INFO;
			return;
		case STORE_STRING:
			rx_buffer[rx_pointer++] = data;	
			if (rx_pointer==RX_BUFSIZE){
				uart_state = WAIT_FOR_DISCONNECT;
			}
			return;
		case STRING_RECEIVED:
		case WAIT_FOR_DISCONNECT:
			if (data == 'D') {
				uart_state = IDLE;
				rx_pointer = 0;
			}
			return;
		case WAIT_CONNECT:
			if (data == 'N') {		// If the connection failed, reset the state machine
				uart_state = IDLE;
				rx_pointer = 0;
			}
		case INCOMING:
			if (data == 'u') {
				// TODO add updating of the switchpoint list here.
			}
			if (data == 'D') {
				uart_state = IDLE;
				rx_pointer = 0;
			}
		default:
			return;

		}

	}

}	


// Open a TCP connection through the XPORT
void web_connect(void){

	char timeout_minute = clock_get_minutes();
	timeout_minute++;
	if (timeout_minute >= 60) {
		timeout_minute = 0;
	}

	if (uart_state == IDLE){
		uart_state = WAIT_CONNECT;
		printf("Clika.be/80\n");
		while (uart_state == WAIT_CONNECT){
			// Timeout, just in case we get stuck here.
			if (timeout_minute == clock_get_minutes()){
				uart_state = IDLE;
				return;
			}
		}
	}
}

void web_php_interface(enum PHP_IF_TYPE msgtype){
	web_connect();
	if (uart_state != CONNECTED) { return ;}

	printf("GET /micro/webtmr.php?msg=");

	switch (msgtype) {
	case REQUEST_TIME:
		printf("time");
		break;
	case REPORT_CLOCK_SET:
		printf("clk_set");
		break;
	case REPORT_SWITCH_STATE:
		printf("%01d", output);
		break;
	}
	printf(" HTTP/1.1\nHost: lika.be\n\n");
	
}

//////////////////////////////////////////////////////////////////
// Interrupt service routines
// 
// This is some ugly stuff, required by the C18 compiler to ensure 
// that the both interrupt vectors contain valid goto instructions

// Generate the high-priority interrupt vector, and put a goto high_isr there
#pragma code high_vector=0x08
void high_interrupt(void){
	_asm GOTO high_isr _endasm
}

#pragma code
#pragma interrupt high_isr
void high_isr(void){

	/* TIMER 0 INTERRUPT HANDLING */
	// T0IF generates the interrupt for the internal clock
	// TMR0 expires every 125 ms
	if (INTCONbits.TMR0IF) {
		WriteTimer0(TMR0_VAL);
		clock_increment();
		if (clock_get_seconds()==0){
			check_timer_table = 1;
		}
		
		INTCONbits.TMR0IF = 0;
	}


	/* USART RX INTERRUPT HANDLING */
	if (PIR1bits.RCIF==1){
		process_uart(ReadUSART());
		PIR1bits.RCIF = 0;
	}

	return;
}

// Generate low-priority interrupt vector, and put a goto low_isr there
#pragma code low_vector=0x18
void low_interrupt(void){
	_asm GOTO low_isr _endasm
}

#pragma code
#pragma interruptlow low_isr
void low_isr(void){
	return;
}


