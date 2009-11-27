#include <stdio.h>
#include <USART.h>

#include "switchpoint.h"
#include "eeprom.h"
#include "clock.h"

switch_point current_switchpoint;
extern char output;

void switchpoint_init(void){

	char data;

	current_switchpoint.position = -1;

	// Safety check on EEPROM contents of newly programmed devices
	data = eeprom_read(POINT_COUNT_ADDRESS);
	if (data == 0xFF){
		// If the count == 0xFF (uninitialized) then 
		// make it zero.
		eeprom_write(0x00, 0x00);
	}

}


char serial_get_decimal(void){
	
}
///////////////////////////////////////////////////////////////////////
// Print a list of all the switch point in memory.
///////////////////////////////////////////////////////////////////////
void print_switch_list(){

	switch_point a;

	// Get the number of point in memory
	char nr_of_points;
	char count = 0;

	printf("Switch point overview:\n\n");
	printf("Index Time   SMTWTFSx  Activity\n");
	printf("-------------------------------\n");

	nr_of_points = eeprom_read(POINT_COUNT_ADDRESS);	

	// Loop them all and print them
	while (count < nr_of_points){
		a = get_switch_point(count);
		
		print_switch_point(a);
		count++;
	}
	
	printf("\n");
	
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
	
	printf("%03d   %02d:%02d   %08b  %d\n", index, a.hour, a.minute, a.mask, a.action);
	
}

/*
void add_switch_point(){
	switch_point point;
	point.position = eeprom_read(POINT_COUNT_ADDRESS);
	
	printf("Adding switchpoint @ %03d\n", point.position);

	printf("-> H? ");
	point.hour   = serial_get_decimal();
	//printf("-> Enter minute: ");
	point.minute = serial_get_decimal();
	//printf("-> Enter mask  : ");
	point.mask   = serial_get_decimal();
	//printf("-> Enter action: ");
	point.action = serial_get_decimal();
	
	
	// Write switchpoint to memory
	put_switch_point(point);
	
	// Update the switchpoint counter
	eeprom_write(POINT_COUNT_ADDRESS, point.position+1);

	//printf("Switch point added to switch table!\r\n\r\n");
	
	return;
	
}

void delete_switch_point(){

	char i, nr_of_points, nr;
	
	//printf("-> Remove point @ location? ");
	nr = serial_get_decimal();
	//printf("Removing switchpoint @ %03d\n", nr);
	//printf("Sure (y/n)? ");
	if (getcUSART() != 'y'){
		//printf("\nAborted...\n");
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

void print_event_entry(void){
	//printf("[");
	clock_print();
	//printf("] Action: ");
	return;
}
*/
// This function returns '1' if the switch state was updated
char update_switch_state(char d_now, char h_now, char m_now){
		
	char  day_match;

	char nr_of_points;
	char count = 0;
		
	char update_last_switch;
	
    char retval = 0;

	// Go through the table with timer entries
	char address = DATA_START_ADDRESS;
	switch_point a, last_switch;

	last_switch.hour   = 0;
	last_switch.minute = 0;
	last_switch.position = -1;
	
	nr_of_points = eeprom_read(POINT_COUNT_ADDRESS);
	
	while (count < nr_of_points){
		update_last_switch = 0;
		
		a = get_switch_point(count);
			
		// Calculate if we have a match on the day
		if ((0x80>>d_now) & a.mask){
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
	
	// Perform the required action
	if ((last_switch.position != current_switchpoint.position) && (last_switch.position != -1)){
		
		retval = 1;
		//print_event_entry();
		
		output = last_switch.action;
			
		//if (last_switch.action){
			//printf("on");
		//} else {
			//printf("off");
		//}
		//printf(" @ rule %03d", last_switch.position);
		//printf("\n");
		
		current_switchpoint = last_switch;
	}

	return retval;
}