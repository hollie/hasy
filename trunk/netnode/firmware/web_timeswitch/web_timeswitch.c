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
* License  : http://license.lika.be
**************************************************************
* target device   : PIC18F2320
* clockfreq       : 2 MHz (internal oscillator)
* target hardware : NetNode
* UART speed      : 9600 bps
* mpasmwin.exe    : v5.34
* mplink.exe      : v4.34
* mcc18.exe       : v3.34
*************************************************************/

#include <p18cxxx.h>
#include <usart.h>
#include <delays.h>
#include <timers.h>
#include <stdio.h>

#include "fuses.h"

#include "web_timeswitch.h"
#include "switchpoint.h"
#include "clock.h"


// -----------------------------------------------------------------------------------------
// The switchpoints are stored in FLASH memory and use a simple dataformat.
// There is a counter that keeps track of the number of switch points that are valid.
// That counter is located @ 0x0000 in EEPROM.
// In the next code block, the switchpoints are stored. 
// Every point takes 4 memory locations
// and has the following structure:
//  word 1 = hour
//  word 2 = minutes
//  word 3 = day mask (7 LSB's, bit = 1 -> switch point is active on that day, MTWTFSS)
//  word 4 = state the switch should take.
// -----------------------------------------------------------------------------------------
// Default switching points
// Weekdays: on @ 07:00, off @ 22:00
// Weekend : on @ 07:30, off @ 22:00
//#pragma DATA 0x2100, 0x03
//#pragma DATA 0x2104, 0x07, 0x00, 0x7C, 0x01, 0x07, 30, 0x03, 0x01, 22, 0x00, 0x7F, 0x00

// Used by xpl_handler to keep track of the current state
enum UART_STATE_TYPE { IDLE = 0, CONNECTED, INCOMING, WAITING_INFO, STORE_STRING, STRING_RECEIVED, WAIT_FOR_DISCONNECT};
enum UART_STATE_TYPE uart_state;

#define RX_BUFSIZE 11
char rx_buffer[RX_BUFSIZE];
char rx_pointer;

///////////////////////////////////////////////////////////////////////
// Main function
///////////////////////////////////////////////////////////////////////
void main()
{

	char input;
	char uart_hour;
	char uart_min;
	char uart_sec;
	char uart_day;
	
	// Some hardware init first
	init();
		
	// Main loop
	while (1){

		// Set output LED indicator
		output_led = !output;
		

		// Some fancy time output
/*		if (debug_print_time){
			serial_printf("Day: ");
			serial_print_dec(dcf_day);
			serial_printf("  ");

			clock_print();
			serial_printf(" output: ");
			if (output){
				serial_printf("on");
			} else {
				serial_printf("off");
			}
			
			//serial_printf("FSM state: ");
			//serial_print_dec(fsm_state);
			
			
		}
*/		
		// Check if something was received from the serial port
	/*	if (DataRdyUSART()){
			// If it was, go get it...
			input = ReadUSART();
			
			if (input == 'p'){
				//print_switch_list();
			} else if (input == 's'){
				debug_print_time = 1;
			} else if (input == 't'){
				output = !(output);
				debug_print_time = 1;
			} else if (input == 'a'){
				//print_switch_list();
				//add_switch_point();
			} else if (input == 'd'){
				//print_switch_list();
				//delete_switch_point();
			} else if (input == 'u'){
				update_switch_state(clock_get_day(), clock_get_hours(), clock_get_minutes());
			}
			else {
				printf("\r\nCommand overview:\r\n");
				printf("\t[p] print switch point list\r\n");
				printf("\t[s] print current status\r\n");
				printf("\t[t] toggle the output\r\n");
				printf("\t[a] add switchpoint\r\n");
				printf("\t[d] delete switchpoint\r\n");
			}
			
		}

*/	
		if (uart_state == STRING_RECEIVED){
			if (rx_buffer[1] == '-' && rx_buffer[4] == ':') {
				// We have received a valid string, parse it
				uart_state = WAIT_FOR_DISCONNECT;
				uart_day = rx_buffer[0] - 0x30;
				uart_hour = (rx_buffer[2] - 0x30) * 10 + (rx_buffer[3] - 0x30);
				uart_min  = (rx_buffer[5] - 0x30) * 10 + (rx_buffer[6] - 0x30);
				uart_sec  = (rx_buffer[8] - 0x30) * 10 + (rx_buffer[9] - 0x30);
				clock_set(uart_hour, uart_min, uart_sec);
			}
		}

		// Update the switch status if there is need to
		if (check_timer_table){
			check_timer_table = 0;
			update_switch_state(clock_get_day(), clock_get_hours(), clock_get_minutes());
		}

		
	}
	
}


///////////////////////////////////////////////////////////////////////
// Hardware and variable init.
///////////////////////////////////////////////////////////////////////
void init(void) 
{
	char blink_count = 0;
	
	// Oscillator selection
	OSCCONbits.IRCF0 = 1;
	OSCCONbits.IRCF1 = 0;
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

	// Do the status LED flicker
	while (blink_count++ < 5){
		Delay10KTCYx(10);
		output_led = 0;
		Delay10KTCYx(10);
		output_led = 1;
	}
	
	// Enable the main 1-sec timer that will interrupt every second
	OpenTimer0(TIMER_INT_ON & 
			T0_16BIT & 
			T0_SOURCE_INT & 
			T0_PS_1_128);	

	WriteTimer0(TMR0_VAL);		// Load initial timer value

	// Serial interface init (9600 @ 2 MHz, BRGH = 1 => 0x0C)
	OpenUSART(USART_ASYNCH_MODE & 
			USART_TX_INT_OFF &
			USART_RX_INT_ON &
			USART_EIGHT_BIT & 
			USART_CONT_RX & 
			USART_BRGH_HIGH, 
			0x0C);
	
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
	status_led = 1;
	
	
	switchpoint_init();
}


// process_uart
void process_uart(char data){

	switch (data) {
	case 'C':
		if (uart_state == IDLE) {
			uart_state = CONNECTED;
		}
		return;
	case 'I':
		if (uart_state == CONNECTED) {
			uart_state = INCOMING;
		}
		return;
	case '<':
		if (uart_state == WAITING_INFO) {
			uart_state = STORE_STRING;
		}
		return;
	case '>':
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
			}
			return;
		default:
			return;

		}

	}

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
		if (tmr0_count == 0){
			WriteTimer0(TMR0_VAL+7);
		}
		// We need 8 expires before we will execute some code.
		tmr0_count ++;
		if (tmr0_count == 8){
			clock_increment();
			//debug_print_time = 1;
			tmr0_count = 0;
			if (clock_get_seconds()==0){
				check_timer_table = 1;
			}
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


