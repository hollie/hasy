/*************************************************************
* xPL library
*
* (c) 2009, Lieven Hollevoet.
**************************************************************
* target device   : PIC18F2320
* clockfreq       : 8 MHz (internal oscillator)
* target hardware : NetNode
*************************************************************/

#include <stdio.h>

#include "xpl.h"
#include "eeprom.h"

char instance_id[17];

void xpl_send_hbeat(void){
	printf("xpl-stat\n{\nhop=1\nsource=hollie-");
	printf(XPL_DEVICE_ID);
	printf(".");
	printf("%s", instance_id); //puts(instance_id);
	printf("\ntarget=*\n}\nhbeat.basic\n{\ninterval=5\n}\n");
	return;
}

void xpl_init(void){

	// Get the instance ID from EEPROM
	char count, ee_char;

	ee_char = '\0';

	for (count = 0; count < 16; count++){
		instance_id[count] = eeprom_read(count+XPL_INSTANCE_ID_OFFSET);

		if (instance_id[count] == '\0') { 
			count +=16;
		} 
	}
	
	xpl_send_hbeat();

}