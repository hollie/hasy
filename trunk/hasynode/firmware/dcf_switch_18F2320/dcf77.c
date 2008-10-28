/*************************************************************
* DCF77-based switch
*
* (c) 2006, Lieven Hollevoet
*     http://electronics.lika.be
*
* Toolsuite: Boostc compiler
* 
* License  : http://license.lika.be
**************************************************************
* boostc compiler : v 6.40
* target device   : PIC18F2320
* clockfreq       : 2 MHz
* target hardware : hasy node
* UART speed      : 9600 bps
*************************************************************/

#include "dcf77.h"
#include "serial.h"
#include "clock.h"
#include "timers.h"
#include "eeprom.h"

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

// -----------------------------------------------------------------------------------------
// The switchpoints are stored in EEPROM and use a simple dataformat.
// Firstly, there's a counter that keeps track of the number of switch points that are valid.
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



///////////////////////////////////////////////////////////////////////
// Main function
///////////////////////////////////////////////////////////////////////
void main()
{
	
	// Some hardware init first
	init();
	
	// We start DCF acquisition
	fsm_state = UNDEFINED;
	
	// Main loop
	while (1){

		// Set output LED indicator
		output_led = !output;
		
		// Check if we need to do somthing DCF-related
		run_dcf_state_machine();

		// Some fancy time output
		if (debug_print_time){
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
			serial_print_lf();
			
			debug_print_time = 0;
			
		}
		
		char input;
		// Check if something was received from the serial port
		if (serial_peek()){
			// If it was, go get it...
			input = serial_getch();
			
			if (input == 'p'){
				print_switch_list();
			} else if (input == 's'){
				debug_print_time = 1;
			} else if (input == 't'){
				output = !(output);
				debug_print_time = 1;
			} else if (input == 'a'){
				print_switch_list();
				add_switch_point();
			} else if (input == 'd'){
				print_switch_list();
				delete_switch_point();
			} else if (input == 'u'){
				update_switch_state();
			}
			else {
				serial_printf("\r\nCommand overview:\r\n");
				serial_printf("\t[p] print switch point list\r\n");
				serial_printf("\t[s] print current status\r\n");
				serial_printf("\t[t] toggle the output\r\n");
				serial_printf("\t[a] add switchpoint\r\n");
				serial_printf("\t[d] delete switchpoint\r\n");
			}
			
		}	

		// Update the RTC every 30 minutes
		if ((clock_get_minutes() == 10 || clock_get_minutes() == 40) && (fsm_state == SLEEP)) {
			fsm_state = UNSYNCED;
		}

		// Update the switch status if there is need to
		if (check_timer_table){
			check_timer_table = 0;
			update_switch_state();
		}

		
	}
	
}

///////////////////////////////////////////////////////////////////////
// ISR, quite some timers in there: one to detect the marker bit in
//   the DCF stream, one to time the DCF bit length and one for the
//   internal clock. 
//   RB0 interrupts when there is a rising edge on the DCF input
///////////////////////////////////////////////////////////////////////
void interrupt( void )
{

	// Handle TMR1 interrupt
	// TMR1 will handle the detection of the marker bit and will set
	// the tmr1_expiredflag after 1.5 seconds
	if (pir1.TMR1IF) {
		// Set tmr1 to expire within 1.5/2 seconds
		tmr1_set(TMR1_VAL);
		
		// We need 2 expires before we will execute some code.
		tmr1_count ++;
		if (tmr1_count == 2){
			tmr1_expiredflag = 1;
			tmr1_count = 0;
		}
		
		// Clear IF
		pir1.TMR1IF = 0;
		
	}
	
	// Handle TMR2 interrupt
	// TMR2 will handle the reading of the received bit
	// A 0 bit is 100 ms long, a 1 bit is 200 ms long.
	// TMR2 samples the dcf signal after ~130 ms.
	if (pir1.TMR2IF) {
		// Set tmr2 to expire within 130 ms seconds
		tmr2_set(TMR2_VAL);
		
		// We need 2 expires before we will execute some code.
		tmr2_count ++;
		if (tmr2_count == 2){
			dcf_bit_received = 1;
			dcf_bit_value    = dcf_signal;
			tmr2_count       = 0;
			tmr2_stop();
			status_led = 1;
		}
		pir1.TMR2IF = 0;
		
	}

	// Handle the RB0 interrupt
	// The RB0 interrupt is generated when there is a rising edge on the
	// dcf input pin. 
	if (intcon.INT0IF) {
		// Sync the internal timer to the DCF pulses
		tmr1_set(TMR1_VAL);
		tmr1_start();
		// Reset the pulse timer
		tmr2_set(TMR2_VAL);
		tmr2_start();
		// Make sure we clear possible TMR1 interrupts
		tmr1_count = 0;
		pir1.TMR1IF = 0; // Also clear the TMRIF in case the timer did overflow the last few cycles
		
		// Status led on
		status_led = 0;
		
		// Clear IF
		intcon.INT0IF = 0;
	}
	
	// T0IF generates the interrupt for the internal clock
	// TMR0 expires every 125 ms
	if (intcon.TMR0IF) {
		tmr0_set(TMR0_VAL);
		if (tmr0_count == 0){
			tmr0_set(TMR0_VAL+7);
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
		
		intcon.TMR0IF = 0;
	}
}

///////////////////////////////////////////////////////////////////////
// Hardware and variable init.
///////////////////////////////////////////////////////////////////////
void init(void) 
{
	// Port configuration
	
	// Oscillator selection
	osccon.IRCF0 = 1;
	osccon.IRCF1 = 0;
	osccon.IRCF2 = 1;

	// All digital pins on porta
	adcon1 = 0x0F;
	
	// Set initial port state
	porta = 1;
	portb = 0;
	portc = 0x04;

	trisa = PortAConfig;    
	trisb = PortBConfig;
	trisc = PortCConfig;
	
	// PortB pullups enable
	intcon2.NOT_RBPU = 0;
	// INT on rising edge
	intcon2.INTEDG0 = 1;

	// Serial interface
	serial_init(0x0C);
	serial_print_lf();
	delay_ms(100);
	serial_printf("Booting DCF77 decoder v1.0...");
	serial_print_lf();

	// Safety check on EEPROM contents of newly programmed devices
	char data = eeprom_read(POINT_COUNT_ADDRESS);
	if (data == 0xFF){
		// If the count == 0xFF (uninitialized) then 
		// make it zero.
		eeprom_write(0x00, 0x00);
	}

	// Init the MCP2515
/*	spi_init();
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
*/

	// Program the internal voltage reference
	/*cvrcon = 10100011; // On, no output, Vin/24 step, X, [0101] = ~1V 
	
	// Program the comparator mode
	cmcon.CIS = 0; // RA0 = input to C1
	cmcon.CM2 = 1;
	cmcon.CM1 = 1;
	cmcon.CM0 = 0;
	cmcon.C1INV = 1;
	*/
	// Setup the timers
	tmr0_setup();
	tmr1_setup();
	tmr2_setup();
	
	// Enable interrupts
	intcon.GIE = 1;

	// Enable portb interrupt
	intcon.INT0IE = 1;
	
	// Clear the clock
	clock_clear();
	
	// Start the timers
	tmr0_start();
	tmr1_start();

	// Clear possible existing interrupt flags
	intcon.INT0IF = 0;
	intcon.TMR0IF = 0;
	pir1.TMR1IF = 0;
	tmr1h = 0xFF;
	
	output = 0;
	dcf_power = 1;
	status_led = 1;
	
	current_switchpoint.position = -1;
}

///////////////////////////////////////////////////////////////////////
// Print a list of all the switch point in memory.
///////////////////////////////////////////////////////////////////////
void print_switch_list(){
	serial_printf("Switch point overview:\n\r\n\r");
	serial_printf("Index Time   xMTWTFSS  Activity\n\r");
	serial_printf("-------------------------------\n\r");
	
	switch_point a;
	
	// Get the number of point in memory
	char nr_of_points = eeprom_read(POINT_COUNT_ADDRESS);
	char count = 0;
	
	// Loop them all and print them
	while (count < nr_of_points){
		a = get_switch_point(count);
		
		print_switch_point(a);
		count++;
	}
	
	serial_print_lf();
	
	return;
}

// Read a switch point from program memory
switch_point get_switch_point(char index){
	switch_point point;
	char address = DATA_START_ADDRESS + (index * 4);
	point.hour = eeprom_read(address);
	if (point.hour == 0xAA){
		return point;
	}
	address++;
	point.minute   = eeprom_read(address);
	address++;
	point.mask     = eeprom_read(address);
	address++;
	point.action   = eeprom_read(address);
	address++;
	point.position = index;
	
	return point;
	
}

// Write a switch point to program memory at the provided index
void put_switch_point(switch_point point){
	
	// Write switchpoint to memory
	char address = point.position * 4 + DATA_START_ADDRESS;
	eeprom_write(address, point.hour);
	address++;
	eeprom_write(address, point.minute);
	address++;
	eeprom_write(address, point.mask);
	address++;
	eeprom_write(address, point.action);
	
	return;
}

// Print a switch point to the serial port
void print_switch_point(switch_point a){

	char index = a.position;
	
	serial_print_dec(index, 3);
	serial_printf("   ");
	
	serial_print_dec(a.hour, 2); 
	serial_printf(":");
	
	serial_print_dec(a.minute, 2); 
	serial_printf("  ");

	serial_print_bin(a.mask);
	serial_printf("  ");
		
	if (a.action == 1){
		serial_printf("ON\n\r");
	} else {
		serial_printf("OFF\n\r");
	}
	
}


void add_switch_point(){
	switch_point point;
	point.position = eeprom_read(POINT_COUNT_ADDRESS);
	
	serial_printf("Adding switchpoint @ ");
	serial_print_dec(point.position, 3);
	serial_print_lf();
	serial_printf("-> Enter hour  : ");
	point.hour   = serial_get_decimal();
	serial_printf("-> Enter minute: ");
	point.minute = serial_get_decimal();
	serial_printf("-> Enter mask  : ");
	point.mask   = serial_get_decimal();
	serial_printf("-> Enter action: ");
	point.action = serial_get_decimal();
	
	
	// Write switchpoint to memory
	put_switch_point(point);
	
	// Update the switchpoint counter
	eeprom_write(POINT_COUNT_ADDRESS, point.position+1);

	serial_printf("Switch point added to switch table!\r\n\r\n");
	
	return;
	
}

void delete_switch_point(){

	char i, nr_of_points;
	
	serial_printf("-> Remove point @ location? ");
	char nr = serial_get_decimal();
	serial_printf("Removing switchpoint @ ");
	serial_print_dec(nr, 3);
	serial_print_lf();
	serial_printf("Sure (y/n)? ");
	if (serial_getch() != 'y'){
		serial_print_lf();
		serial_printf("Aborted...\r\n");
		return;
	}
	
	// Removing is done by copying all entries that come after the point
	// one location up and decrementing the point counter
	nr_of_points = eeprom_read(POINT_COUNT_ADDRESS);

	for (i = nr; i < nr_of_points; i++){
		switch_point p = get_switch_point(i+1);
		p.position--;
		put_switch_point(p);
	}
	
	// Decrement the point counter
	eeprom_write(POINT_COUNT_ADDRESS, nr_of_points - 1);

	return;
}

void update_switch_state(){
	char h_now = clock_get_hours();
	char m_now = clock_get_minutes();
		
	bit  day_match;
	
	// Go through the table with timer entries
	short address = DATA_START_ADDRESS;
	switch_point a, last_switch;

	last_switch.hour   = 0;
	last_switch.minute = 0;
	last_switch.position = -1;
	
	char nr_of_points = eeprom_read(POINT_COUNT_ADDRESS);
	char count = 0;
		
	bit update_last_switch;
	
	while (count < nr_of_points){
		update_last_switch = 0;
		
		a = get_switch_point(count);
			
		// Calculate if we have a match on the day
		if ((0x80>>dcf_day) & a.mask){
			day_match = 1;
		} else {
			day_match = 0;
		}
		
		// Find that last switchpoint that has been passed
		if (day_match && (a.hour < h_now)){
			if (a.hour > last_switch.hour){
				update_last_switch = 1;
			}
			if ((a.hour == last_switch.hour) && (a.minute > last_switch.minute)){
				update_last_switch = 1;
			}
		}
		
		if (day_match && (a.hour == h_now) && (a.minute <= m_now)){
			if (a.hour > last_switch.hour){
				update_last_switch = 1;
			}
			if ((a.hour == last_switch.hour) && (a.minute > last_switch.minute)){
				update_last_switch = 1;
			}
		}
		
		// Update if required
		if (update_last_switch){
			last_switch = a;
			//serial_printf("Last switch point passed is now:");
			//print_switch_point(last_switch);
		}
		// Increment count
		count++;
	}
	
	//serial_printf("Last - current: ");
	//serial_print_dec(last_switch.position, 3);
	//serial_print_dec(current_switchpoint.position,3);
	//serial_print_lf();
	// Perform the required action
	if ((last_switch.position != current_switchpoint.position) && (last_switch.position != -1)){
		
		print_event_entry();
		
		output = last_switch.action;
			
		if (last_switch.action){
			serial_printf("on");
		} else {
			serial_printf("off");
		}
		serial_printf(" @ rule ");
		serial_print_dec(last_switch.position, 3);
		serial_print_lf();
		
		current_switchpoint = last_switch;
	}

	return;
}
	
void print_event_entry(){
	serial_printf('[');
	clock_print();
	serial_printf("] Action: ");
	return;
}

//*********************************************************************
// DCF RELATED ROUTINES
//*********************************************************************

///////////////////////////////////////////////////////////////////////
// Decode the DCF data
//  Takes the next received bit as input
///////////////////////////////////////////////////////////////////////
char dcf_decode_data(bit data){
	// Check for start of minute marker
	if (dcf_bit_count == 0 && data != 0){
		return 0;
	}
	
	// Real data starts here
	if (dcf_bit_count == 20){
		// Reset info
		dcf_parity  = 0;
		dcf_minutes = 0;
		dcf_hours   = 0;
		dcf_day     = 0;
		// Check for start of time bit
		if (data != 1){
			return 0;
		}
	}
	
	// Get minutes info
	if (dcf_bit_count > 20 && dcf_bit_count < 28){
		if (data){
			dcf_minutes += dcf_code[dcf_bit_count - 21];
		}
		dcf_parity += data;
	}

	// Check even parity for the minutes
	if (dcf_bit_count == 28){
		if (dcf_parity && !data){
			return 0;
		}
		dcf_parity = 0;
	}
	
	// Det hours info
	if (dcf_bit_count > 28 && dcf_bit_count < 35){
		if (data){
			dcf_hours += dcf_code[dcf_bit_count - 29];
		}
		dcf_parity += data;
	}

	// Check even parity for the hours
	if (dcf_bit_count == 35){
		if (dcf_parity && !data){
			return 0;
		}
	}
	
	// Decode day of week
	// TODO: add parity check on this data also
	if (dcf_bit_count > 41 && dcf_bit_count < 45){
		if (data){
			dcf_day += dcf_code[dcf_bit_count - 42];
		}
	}

	dcf_bit_count++;

	return 1; // No error = 1;
}


///////////////////////////////////////////////////////////////////////
// DCF state machine
//  Keeps track of where we are in the received datastream
///////////////////////////////////////////////////////////////////////
void run_dcf_state_machine(){
	
	// DCF decoder state machine
	switch (fsm_state) {
		case UNSYNCED: // we're waiting for the 59-th second marker
			tmr1_start();
			if (tmr1_expiredflag){
				fsm_state = MARKER;
				tmr1_expiredflag = 0;
				dcf_bit_received = 0;
			}
			break;
		
		case MARKER:  // Possibly got marker, we should receive a bit now
			dcf_bit_count = 0;
			tmr1_stop();
			if (dcf_bit_received){ 
				fsm_state = SYNCED;
			}
			break;
		
		case SYNCED: // OK, wait for other bits
			if (tmr1_expiredflag){
				fsm_state = MARKER;
				tmr1_expiredflag = 0;
				dcf_bit_received = 0;
			}
			if (dcf_bit_received){
				// The add routine verifies some 'known bits'. If they don't match, the function returns 0 and we're back out of sync
				if (!dcf_decode_data(dcf_bit_value)){
					fsm_state = UNSYNCED;
				}
					dcf_bit_received = 0;
				
			}
				if (dcf_bit_count == 59){
				fsm_state = WAIT_MARK;
			}
			break;

		case WAIT_MARK:
			if (dcf_bit_received){
				// Apply dcf time to RTC
				clock_set(dcf_hours, dcf_minutes, 0);
				dcf_bit_received = 0;
				print_event_entry();
				serial_printf("DCF -> RTC");
				check_timer_table = 1;
				serial_print_lf();
				fsm_state = SLEEP;
			}
			break;

		case SLEEP:
			fsm_state = SLEEP;
			break;

		default:
			fsm_state = UNSYNCED;
	}

	return;
}