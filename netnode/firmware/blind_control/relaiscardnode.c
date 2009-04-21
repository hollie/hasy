/*************************************************************
* Blinds steering node firmware
*
* (c) 2007, Lieven Hollevoet
*     http://electronics.lika.be
*
* License  : http://license.lika.be
*
* This is the firmware of the blind controller. The blind
* controller is basically a set of relais that are 
* controllable over Ethernet.
**************************************************************
* boostc compiler : v 6.60
* target device   : PIC18F2320
* clockfreq       : 2 MHz
* target hardware : netnode
* UART speed      : 9600 bps
*************************************************************/
#include <system.h>
#include "relaiscardnode.h"
#include "serial.h"
#include "eeprom.h"
#include "sr.h"
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

// Global variables
char blind_move_delay = 10;
char actuation_count;
bit  tmr1_expiredflag = 0;

char blind1_status = 'x';
char blind2_status = 'x';
char blind3_status = 'x';
char blind4_status = 'x';
char blind5_status = 'x';


// Variables at fixed locations
char card_1_status @ CARD_STATUS1;
char card_2_status @ CARD_STATUS2;
char card_3_status @ CARD_STATUS3;

// Bit mapping for current blind status
// These bits are used to determine if a blind is activated in the
// opposite direction when a command is given.
// If it is, the blind is disabled instead of being driven in
// the opposite direction. 
// This allows for 2-button control of the blinds.
bit  blind1_up		@ CARD_STATUS1.0;
bit  blind2_up 		@ CARD_STATUS1.4;
bit  blind3_up 		@ CARD_STATUS2.0;
bit  blind4_up 		@ CARD_STATUS2.4;
bit  blind5_up 		@ CARD_STATUS3.0;
bit  blind1_down 	@ CARD_STATUS1.2;
bit  blind2_down 	@ CARD_STATUS1.6;
bit  blind3_down 	@ CARD_STATUS2.2;
bit  blind4_down 	@ CARD_STATUS2.6;
bit  blind5_down 	@ CARD_STATUS3.2;



///////////////////////////////////////////////////////////////////////
// Main function, polls the serial receive buffer to see if a command 
// was received
///////////////////////////////////////////////////////////////////////
void main()
{
	// Controller hardware initialisation
	init();

	// Go to idle mode after reboot
	delay_s(2);
	disable_blinds();
	
	// Disable boot LED
	led = 1;
	
	// Main loop
	while (1){
	
		// Check if the actuation timer has expired
		if (tmr1_expiredflag){
			disable_blinds();
			tmr1_expiredflag = 0;
			tmr1_stop();
		}

		// Check if a command was received
		if (serial_peek()){
			char in = serial_getch();
			
			switch (in) {
			case 'u':
				all_blinds_up();
				serial_print_lf();
				break;
			case 'd':
				all_blinds_down();
				serial_print_lf();
				break;
			case 's':
				tmr1_stop();
				disable_blinds();
				serial_print_lf();
				break;
			case 'p':
				program_blind_delay();
				serial_print_lf();
				break;
			case 'b':
				command_blind();
				serial_print_lf();
				break;
			case '?':
				print_status();
				break;
			default:
				print_menu();
			}
		}
		
	}
	
	
}

///////////////////////////////////////////////////////////////////////
// ISR, handles the timer interrupt
///////////////////////////////////////////////////////////////////////
void interrupt( void )
{
	// Handle TMR1 interrupt
	if (pir1.TMR1IF) {
	
		// Set tmr1 to expire within 1 second
		tmr1_set(TMR1_VAL);

		actuation_count--;
		
		// Toggle LED
		led = !led;
		
		if (actuation_count == 0){
			// Set the expiredflag
			tmr1_expiredflag = 1;
			// Stop the timer
			tmr1_stop();
			// Disable LED
			led = 1;
		}

		// Clear IF
		pir1.TMR1IF = 0;
		
	}
}

///////////////////////////////////////////////////////////////////////
// program_cards()
//  Sends the current configuration words to the relaiscards
///////////////////////////////////////////////////////////////////////
void program_cards(){

	// TX config
	sr_load_byte(card_3_status);
	sr_load_byte(card_2_status);
	sr_load_byte(card_1_status);
	
	// And latch it to the output of the shift register
	sr_latch_outputs();
	
	// Also update the portb register map as workaround for the problem with the shift registers
	portb.0 = blind3_up;
	portb.1 = blind3_down;
	portb.2 = blind4_up;
	portb.3 = blind4_down;
	portb.4 = blind5_up;
	portb.5 = blind5_down;
	
	// We wait here 1 second by default, remember we're steering inductive loads
	delay_s(1);
	
	return;
}

///////////////////////////////////////////////////////////////////////
// disable_blinds()
//  Disable all blinds at once
///////////////////////////////////////////////////////////////////////
void disable_blinds(){

	// Update the blind status.
	// If the tmr_expired flag is set, it means a blind is fully up
	// or fully down, if it is not set, the blind is somewhere inbetween
	if (tmr1_expiredflag){
		if (blind1_up)   {blind1_status = 'u';}
		if (blind2_up)   {blind2_status = 'u';}
		if (blind3_up)   {blind3_status = 'u';}
		if (blind4_up)   {blind4_status = 'u';}
		if (blind5_up)   {blind5_status = 'u';}
		if (blind1_down) {blind1_status = 'd';}
		if (blind2_down) {blind2_status = 'd';}
		if (blind3_down) {blind3_status = 'd';}
		if (blind4_down) {blind4_status = 'd';}
		if (blind5_down) {blind5_status = 'd';}	
	} else {
		if (blind1_up || blind1_down) {blind1_status = 'm';}
		if (blind2_up || blind2_down) {blind2_status = 'm';}
		if (blind3_up || blind3_down) {blind3_status = 'm';}
		if (blind4_up || blind4_down) {blind4_status = 'm';}
		if (blind5_up || blind5_down) {blind5_status = 'm';}
	}
	
	// Set cards status to 'all off'
	card_1_status = 0x00;
	card_2_status = 0x00;
	card_3_status = 0x00;
	
	// And send it to the cards
	program_cards();
	
	return;

}

///////////////////////////////////////////////////////////////////////
// init()
//  Controller hardware initialisation
///////////////////////////////////////////////////////////////////////
void init(void) 
{

	// Oscillator selection, internal 2 MHz
	osccon.IRCF0 = 1;
	osccon.IRCF1 = 0;
	osccon.IRCF2 = 1;

	// All digital pins on porta
	adcon1 = 0x0F;
	
	// Set initial port state
	porta = 0;
	portb = 0;
	portc = 0;

	// and initial port direction
	trisa = PortAConfig;    
	trisb = PortBConfig;
	trisc = PortCConfig;
	
	// Enable LED (active low)
	led = 0;
	
	// PortB pullups enable
	intcon2.NOT_RBPU = 0;
	// INT on rising edge
	intcon2.INTEDG0 = 1;
	
	// Init the shift register
	sr_init();
	
	// Init the serial port, 9600 bps
	serial_init(12);

	// Read the actuation time from EEPROM
	blind_move_delay = eeprom_read(DELAY_ADDR);
	// Make sure to init it to a sane value when the EEPROM is not initialised
	if (blind_move_delay == 0xFF){
		eeprom_write(DELAY_ADDR, 10);
		blind_move_delay = 10;
	}
	
	// Init the timer 1 (used to measure the actuation time)
	tmr1_setup();
	
	// Init the global vars
	card_1_status = 0x00;
	card_2_status = 0x00;
	card_3_status = 0x00;
	
	// Enable global interrupts
	intcon.GIE 	= 1;
	
}

///////////////////////////////////////////////////////////////////////
// set_disable_timer(char delay)
//  Make sure to disable the blind engines after the blinds have been 
//  moved fully up or down
///////////////////////////////////////////////////////////////////////
void set_disable_timer(char delay){

	// Stop the timer 1
	tmr1_stop();
	
	// Load tmr1 with the initial value
	// Need to init a local variable, else the HIBYTE/LOBYTE macros fail
	short tmr_val = TMR1_VAL;
	HIBYTE(tmr1h, tmr_val);
	LOBYTE(tmr1l, tmr_val);

	// Load the time in seconds it will take to close/open the blinds
	actuation_count = delay;
	
	// And fire timer 1
	tmr1_start();
}

///////////////////////////////////////////////////////////////////////
// all_blinds_up()
//  Move all blinds up, but first check if one of the blinds is going
//  down. If there is one, then just disable all blinds.
//  Reason: this allows controlling the blinds with 2 buttons (up/down)
//          You can then stop the blinds halfway by pressing the 
//          button of the opposite direction. 
///////////////////////////////////////////////////////////////////////
void all_blinds_up(){

	// Check if we're not going down for the moment
	// If we are, then stop the blinds
	if (blind1_down || blind2_down || blind3_down || blind4_down || blind5_down){
		disable_blinds();
		return;
	}
	
	// Gently switch all blind up motors on (one at a time)
	single_blind_control(1, 'u');
	single_blind_control(2, 'u');
	single_blind_control(3, 'u');
	single_blind_control(4, 'u');
	single_blind_control(5, 'u');

	return;
}

///////////////////////////////////////////////////////////////////////
// all_blinds_down()
//  Move all blinds down, but first check if one of the blinds is going
//  up. If there is one, then just disable all blinds.
///////////////////////////////////////////////////////////////////////
void all_blinds_down(){

	// If one or more blinds are moving up, then
	// disable all blinds
	if (blind1_up || blind2_up || blind3_up || blind4_up || blind5_up){
		disable_blinds();
		return;
	}

    // Gently switch all blind down motors on (one at a time, 1 second delay in between)
	single_blind_control(1, 'd');
	single_blind_control(2, 'd');
	single_blind_control(3, 'd');
	single_blind_control(4, 'd');
	single_blind_control(5, 'd');

	return;
}

///////////////////////////////////////////////////////////////////////
// print_menu()
//  Outputs the helper menu
///////////////////////////////////////////////////////////////////////
void print_menu(){
	serial_print_lf();
	serial_printf("Blind controller v");
	serial_print_dec(VERSION_MAJOR);
	serial_printf('.');
	serial_print_dec(VERSION_MINOR);
	serial_print_lf();
	serial_printf("---------------------\r\n\r\n");
	serial_printf("  u = all blinds up\r\n");
	serial_printf("  d = all blinds down\r\n");
	serial_printf("  s = stop all blinds\r\n");
	serial_printf("  p = program blind running time\r\n");
	serial_printf("  b = individual blind control\r\n");
	serial_printf("      e.g. b1u = blind 1 up\r\n");
	serial_printf("           b3d = blind 3 down\r\n");
	serial_printf("           b5s = blind 5 stop\r\n");
	serial_print_lf();
	return;
}

///////////////////////////////////////////////////////////////////////
// print_status()
//  Outputs the node status
///////////////////////////////////////////////////////////////////////
void print_status(){
	serial_printf("Blind controller v");
	serial_print_dec(VERSION_MAJOR);
	serial_printf('.');
	serial_print_dec(VERSION_MINOR);
	serial_print_lf();
	serial_printf("Actuation time: ");
	serial_print_dec(blind_move_delay);
	serial_printf(" seconds\r\n");
	serial_printf("Card  status  : ");
	serial_print_hex(card_3_status);
	serial_print_hex(card_2_status);
	serial_print_hex(card_1_status);
	serial_print_lf();
	serial_printf("Blind status  : ");
	serial_printf(blind5_status);
	serial_printf(blind4_status);
	serial_printf(blind3_status);
	serial_printf(blind2_status);
	serial_printf(blind1_status);
	serial_print_lf();	
	return;	
}

///////////////////////////////////////////////////////////////////////
// program_blind_delay()
//  Allow remote programming of the blins actuation delay
///////////////////////////////////////////////////////////////////////
void program_blind_delay(){
	serial_print_lf();
	serial_printf("The current actuation time for the blinds is ");
	serial_print_dec(blind_move_delay);
	serial_printf(" seconds.\r\n");
	serial_printf("Please enter the new value: ");
	blind_move_delay = serial_get_decimal();
	eeprom_write(DELAY_ADDR, blind_move_delay);
	serial_printf("New time is ");
	serial_print_dec(blind_move_delay);
	serial_printf(" s.\r\nValue is stored in EEPROM.\r\n\r\n");
}

///////////////////////////////////////////////////////////////////////
// command_blind()
//  Helper function for single blind control,
//  Reads user input and passes it to single_blind_control();
///////////////////////////////////////////////////////////////////////
void command_blind(){
	char blind = serial_getch();
	char direction = serial_getch();
	
	// Calculate blind number
	blind = blind-0x30;

	// And pass the parameters to the actual funtion
	single_blind_control(blind, direction);

	return;
}

///////////////////////////////////////////////////////////////////////
// single_blind_control(char blind, char direction)
//  Control a single blind
///////////////////////////////////////////////////////////////////////
void single_blind_control(char blind, char direction){

	// Steer depending on direction
	if (direction == 'd'){
		command_blind_down(blind);
	} else if (direction == 'u'){
		command_blind_up(blind);
	} else if (direction == 's'){
		command_blind_stop(blind);
	} else {
		// Invalid command, disable all blinds
		disable_blinds();
	}
	
	
	return;
	
}

///////////////////////////////////////////////////////////////////////
// command_blind_down(char blind)
//  Move a single blind down
///////////////////////////////////////////////////////////////////////
void command_blind_down(char blind){
	// First check if blind is moving up
	// If it is, then halt it and return to calling function
	switch (blind){
	case 1:
		if (blind1_up){
			blind1_up = 0;
			program_cards();
			return;
		}
		break;
	case 2:
		if (blind2_up){
			blind2_up = 0;
			program_cards();
			return;
		}
		break;
	case 3:
		if (blind3_up){
			blind3_up = 0;
			program_cards();
			return;
		}
		break;
	case 4:
		if (blind4_up){
			blind4_up = 0;
			program_cards();
			return;
		}
		break;
	case 5:
		if (blind5_up){
			blind5_up = 0;
			program_cards();
			return;
		}
		break;	
	}
	
	// If we get here, it means we can safely move the blind down
	switch (blind){
	case 1:
		blind1_down = 1;
		break;
	case 2:
		blind2_down = 1;
		break;
	case 3:
		blind3_down = 1;
		break;
	case 4:
		blind4_down = 1;
		break;
	case 5:
		blind5_down = 1;
		break;
	default:
		disable_blinds();
		return;
	}
	
	program_cards();
	
	set_disable_timer(blind_move_delay);

}

///////////////////////////////////////////////////////////////////////
// command_blind_up(char blind)
//  Move a single blind up
///////////////////////////////////////////////////////////////////////
void command_blind_up(char blind){
	// First check if blind is moving down
	// If it is, then halt it and return to calling function
	switch (blind){
	case 1:
		if (blind1_down){
			blind1_down = 0;
			program_cards();
			return;
		}
		break;
	case 2:
		if (blind2_down){
			blind2_down = 0;
			program_cards();
			return;
		}
		break;
	case 3:
		if (blind3_down){
			blind3_down = 0;
			program_cards();
			return;
		}
		break;
	case 4:
		if (blind4_down){
			blind4_down = 0;
			program_cards();
			return;
		}
		break;
	case 5:
		if (blind5_down){
			blind5_down = 0;
			program_cards();
			return;
		}
		break;		
	}
	
	// If we get here, it means we can safely move the blind down
	switch (blind){
	case 1:
		blind1_up = 1;
		break;
	case 2:
		blind2_up = 1;
		break;
	case 3:
		blind3_up = 1;
		break;
	case 4:
		blind4_up = 1;
		break;
	case 5:
		blind5_up = 1;
		break;
	default:
		disable_blinds();
		return;
		break;
	}
	
	program_cards();
	set_disable_timer(blind_move_delay);

}

///////////////////////////////////////////////////////////////////////
// command_blind_stop(char blind)
//  Stop a single blind
///////////////////////////////////////////////////////////////////////
void command_blind_stop(char blind){
	
	switch (blind){
	case 1:
		blind1_up     = 0;
		blind1_down   = 0;
		blind1_status = 'm';
		break;
	case 2:
		blind2_up     = 0;
		blind2_down   = 0;
		blind2_status = 'm';
		break;
	case 3:
		blind3_up     = 0;
		blind3_down   = 0;
		blind3_status = 'm';
		break;
	case 4:
		blind4_up     = 0;
		blind4_down   = 0;
		blind4_status = 'm';
		break;
	case 5:
		blind5_up     = 0;
		blind5_down   = 0;
		blind5_status = 'm';
		break;
	default:
		disable_blinds();
		return;
		break;
	}
	
	program_cards();

}
