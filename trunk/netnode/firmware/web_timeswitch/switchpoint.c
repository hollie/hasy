/*************************************************************
* Helper functions for interfacing with the switchpoints 
* stored in EEPROM
*
* (c) 2009 Lieven Hollevoet
*************************************************************/

#include <stdio.h>
#include <USART.h>

#include "switchpoint.h"
#include "eeprom.h"
#include "clock.h"

switch_point current_switchpoint;

///////////////////////////////////////////////////////////////////////
// Init function to make sure we don't assume 256 switchpoints are
// present in uninitialised EEPROM
///////////////////////////////////////////////////////////////////////
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


///////////////////////////////////////////////////////////////////////
// Print a list of all the switch point in memory.
///////////////////////////////////////////////////////////////////////
void print_switch_list(){

	switch_point a;

	// Get the number of point in memory
	char nr_of_points;
	char count = 0;

	printf("Switch point overview:\n\n");
	printf("Idx Time  SMTWTFSx  State\n");

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

///////////////////////////////////////////////////////////////////////
// Read a switch point from program memory
///////////////////////////////////////////////////////////////////////
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

///////////////////////////////////////////////////////////////////////
// Write a switch point to program memory at the provided index
///////////////////////////////////////////////////////////////////////
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

///////////////////////////////////////////////////////////////////////
// Print a switch point to the serial port
///////////////////////////////////////////////////////////////////////
void print_switch_point(switch_point a){

	char index = a.position;
	
	printf("%03d  %02d:%02d  %08b  %d\n", index, a.hour, a.minute, a.mask, a.action);
	
}


///////////////////////////////////////////////////////////////////////
// Update the switch state based on current time and the switchpoints
// in EEPROM. Call this function onze every minute
// This function returns '1' if the switch state was updated
///////////////////////////////////////////////////////////////////////
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
		
		output = last_switch.action;
			
		current_switchpoint = last_switch;
	}

	return retval;
}