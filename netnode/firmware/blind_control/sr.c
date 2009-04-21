#include "sr.h"

void sr_load_byte(char data){

	char i = 0;

	for (i = 0; i < 8; i++){
		if (data & 0x80){
			sr_dta = 1;
		} else {
			sr_dta = 0;
		}
		data = data << 1;
		sr_sck = 0;
		sr_sck = 1;
	}
}

void sr_latch_outputs(){
	// clock the data to the output register
	sr_lck = 0;
	sr_lck = 1;
}

void sr_init(){

	// Set I/O direction bits
	sr_rst_tris = 0;
    sr_dta_tris = 0;
    sr_lck_tris = 0;
    sr_sck_tris = 0;
    
	// Reset the shift register logic
	// and init the IO's
	sr_rst = 0;
	sr_dta = 0;
	sr_sck = 0;
	sr_lck = 0;
	sr_rst = 1;
}