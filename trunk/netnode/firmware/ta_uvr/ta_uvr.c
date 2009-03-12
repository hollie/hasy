#include "ta_uvr.h"
#include "serial.h"
#include "net_ta.h"
#include "timers.h"

ta_uvr_data dataframe;
volatile bit ta_uvr_gotbit;

char mydata[NR_DATA_BYTES];
char data_cache[NR_DATA_BYTES];

char ta_uvr_tmrl;
char ta_uvr_tmrh;
char ta_uvr_data_valid = 0;

char ta_uvr_data_available(void) {
	return ta_uvr_data_valid;
}

// Wait for the sync frame (the only part in the code stream that has no start/stop bits). Then wait for the first start bit.
char ta_uvr_waitforsync(short bit_time){

	portb = 0;

	short dataword = 0x00AA;
	bit_time = 0x07E1;

	short timer_wait_1_4 = 0xFFFF - (bit_time >> 1);
	short timer_wait_bit = 0xFFFF - (bit_time << 1);
	short timer_wait_3_4 = timer_wait_bit + (bit_time >> 1);

	// Set variables for main ISR
	// Coding overhead for ISR handling compensation
	timer_wait_bit -= 0x000C;

	LOBYTE(ta_uvr_tmrl, timer_wait_bit);
	HIBYTE(ta_uvr_tmrh, timer_wait_bit); 

	char  input;
	char  sync_bitcount = 0;

	// Sync frame detection is done by waiting for 10 consecutive high bits.
	// This can not occur in the data stream as the start bit is always a low bit.
	// We use timer 1 to sample bits

	// Wait for a low to high transition
	while (uvr_data != TA_UVR_LOW)  { nop();}
	// Wait for a high value
	while (uvr_data != TA_UVR_HIGH) { nop();}

    // Wait 1/4th bit time to start sampling
	tmr1_setup(TMR_IRQ_OFF);
	tmr1_set(timer_wait_1_4);
	tmr1_start();
	tmr1if = 0;
	while (!tmr1if){nop();}

	// Now we can start sampling
	tmr1_setup(TMR_IRQ_ON);
	tmr1_set(timer_wait_bit);
	tmr1_start();

	// Now wait for 10 consecutive identical bits (could be high or low, depending on the bit we initially synced on)
	while ( ((dataword & 0x3FFF) != 0x0000) && ((dataword & 0x3FFF) !=  0x3FFF)) {
		while (!ta_uvr_gotbit){nop();}
		// sample bit
		input = (char)uvr_data;
		portb.0 = 1;
		portb.0 = 0;
		ta_uvr_gotbit = 0;
		
		dataword = dataword << 1;
		dataword.0 = input.0;
		
		sync_bitcount++;
		// Resync if sync is not found
		if (sync_bitcount == 200) {
			return 0;
		}
	}


	// Wait for high/low
	while (uvr_data != TA_UVR_HIGH) { nop(); }
	while (uvr_data != TA_UVR_LOW)  { nop(); }
	// When we get here, we are in the sync frame, now we need to wait for the start bit of the first byte.
	// This is done by waiting for a high period that lasts for a complete bit time.
	// The timer is set to overflow after .75 bit time

	bit start_found = 0;
	tmr1_stop();
	tmr1if = 0;

	tmr1_setup(TMR_IRQ_OFF);
	
	while (!start_found) {
		
		tmr1_set(timer_wait_3_4);
		
		// Wait for high
		while (uvr_data != TA_UVR_HIGH) { nop();}

		tmr1_start();
		nop();
		// Wait for low
		while (uvr_data != TA_UVR_LOW) { nop();}

		if (tmr1if) {	
			start_found = 1;
		} else {
			tmr1_stop();
		}
	}
	return 1;
}


void ta_uvr_getinfo(){

	bit  done = 0;
	bit  firstrun = 0;
	char counter = 0;
	char input = 0;
	char bytecount = 0;
	char databyte = 0;
	short bit_time;
	short timer_wait;

	// Calibrate the timer
	bit_time = ta_uvr_calibrate_timer();
	
	// When no UVR is detected, just return.
	if (bit_time == 0) {
		return;
	}

	// Calculate timer setting to wait for 1/4th bit time,this is the time to wait after we found sync to start sampling
	timer_wait = 0xFFFF - (bit_time >> 1);

/*	serial_printf("calibration: 0x");
	serial_print_hex(bit_time);
	serial_print_lf();
*/

	// Wait for sync
	while (!ta_uvr_waitforsync(bit_time)){
		// Calibrate the timer
		bit_time = ta_uvr_calibrate_timer();
	
		// Calculate timer setting to wait for 1/4th bit time,this is the time to wait after we found sync to start sampling
		timer_wait = 0xFFFF - (bit_time >> 1);

	};

	// Start the 1/4th bit time wait	
	tmr1_set(timer_wait);
	tmr1_start();
	tmr1if = 0;

	while (!tmr1if){nop();}

	// Now we can start sampling
	tmr1_setup(TMR_IRQ_ON);
	tmr1_set(0xFFFF - (bit_time << 1));
	tmr1_start();
	firstrun = 1;
	
	bytecount = 0;

	while (bytecount < 35){
		while (!ta_uvr_gotbit && !firstrun){nop();}
		// sample bit
		input = (char)uvr_data;

		portb.1 = 1;
		portb.1 = 0;

		firstrun = 0;
		ta_uvr_gotbit = 0;
		
		if (counter == 0){
			if (input == TA_UVR_HIGH){
				serial_printf("Start bit not zero for byte ");
				serial_print_dec(bytecount);
				serial_printf("!! Quit...");
				serial_print_lf();
				return;
			}
			databyte = 0;
			counter++;
			continue;
		}
		
		if (counter == 9){
			if (input == TA_UVR_LOW){
				serial_printf("Stop bit not one for byte ");
				serial_print_dec(bytecount);
				serial_printf("!! Quit...");
				serial_print_lf();
				return;
			}
			// Store databyte
			counter = 0;

			// If TA_UVR_HIGH == one then we can write the databyte to mydata immediately, else we need to invert it
			if (TA_UVR_HIGH) {
				mydata[bytecount] = databyte;
			} else {
				mydata[bytecount] = databyte ^ 0xFF;
			}
			bytecount++;

			// Make sure to resync on the next start bit
			tmr1_stop();
			tmr1_set(timer_wait);
			while (uvr_data != TA_UVR_LOW) {};
			tmr1_start();
			
			continue;
		}

		databyte = databyte >> 1;		
		databyte.7 = input.0;
		counter ++;

		
	}

	return;
	
}


char ta_uvr_verify_checksum(){

	// The last byte should match the sum of all previous bytes
	// Verify this is correct before processing a packet
	char checksum = 0;
 	char byte_count = 0;

	while (byte_count < 34){
		checksum += mydata[byte_count++];
	}

	if (checksum == mydata[byte_count]){
		byte_count = 0;
		// Copy data to cache	
		while (byte_count < 35){
			data_cache[byte_count] = mydata[byte_count];
			byte_count++;
		}
		// And set valid flag
		ta_uvr_data_valid = 1;
		return 0;
	} else {
		return 1;
	}
		
}

void ta_uvr_send_data(){

	char snd_count = 0;

	// Parse the data
	// Device ID
	if (data_cache[0] != 0x90) {
		serial_printf("\r\nDevice is not an UVR61-3!\r\n");
	} else {
		serial_printf("\r\nConnected to: UVR61-3\r\n");
	}

	// Regler time
	serial_printf("Local time: 20");
	serial_print_dec(data_cache[7], 2);
	serial_printf("-");
	serial_print_dec(data_cache[6], 2);
	serial_printf("-");
	serial_print_dec(data_cache[5], 2);
	serial_printf(" ");
	serial_print_dec(data_cache[4] & 0x1F, 2); // Mask daylight saving time bit
	serial_printf(":");
	serial_print_dec(data_cache[3], 2);
	serial_print_lf();
	serial_print_lf();

	// Sensor values
	serial_printf("Sensor values:");
	serial_print_lf();

	// 1
	serial_printf("T1: ");
	ta_uvr_print_sensor_value(data_cache[8], data_cache[9]);
	// 2
	serial_printf("T2: ");
	ta_uvr_print_sensor_value(data_cache[10], data_cache[11]);
	// 3
	serial_printf("T3: ");
	ta_uvr_print_sensor_value(data_cache[12], data_cache[13]);
	// 4
	serial_printf("T4: ");
	ta_uvr_print_sensor_value(data_cache[14], data_cache[15]);
	// 5
	serial_printf("T5: ");
	ta_uvr_print_sensor_value(data_cache[16], data_cache[17]);
	// 6
	serial_printf("T6: ");
	ta_uvr_print_sensor_value(data_cache[18], data_cache[19]);
	serial_print_lf();
	
	// Outputs
	serial_printf("Output values:\r\nA1: ");
	if (data_cache[20] & 0x01) { serial_printf("on"); } else { serial_printf("off");};
	serial_print_lf();
	serial_printf("A2: ");
	if (data_cache[20] & 0x02) { serial_printf("on"); } else { serial_printf("off");};
	serial_print_lf();
	serial_printf("A3: ");
	if (data_cache[20] & 0x04) { serial_printf("on"); } else { serial_printf("off");};
	serial_print_lf();
	serial_printf("Pump: ");
	if (data_cache[21] & 0x80) {serial_printf("variable rpm not active");} else { serial_print_dec(data_cache[21] & 0x1F);};
	serial_print_lf();

	ta_uvr_data_valid = 0;
	return;
}

void ta_uvr_print_sensor_value(char low, char high){

	// Extract sensor type
	char value_type = (high & 0x70);
	short temp = 0;
	char high_restored = 0;

	switch (value_type) {
	case 0x00:
		serial_printf("Not connected");
		break;
	case 0x10:
		// Digital value
		if ((high & 0x80) == 0x00){
			serial_printf("off");
		} else {
			serial_printf("on");
		}
		break;
	case 0x20:
		// Temperature
		// Restore short value, keeping in mind the extra info bits in the high value
		high_restored = high;
		if (high_restored & 0x80) {	
			// set status bits to 1
			high_restored |= 0x70;
		} else {
			// clear status bits
			high_restored &= 0x8F;
		}

		MAKESHORT(temp, low, high_restored);

		// Negative temperature? 
		if ((high & 0x80)){
			serial_printf("-");
			temp = (temp) ^ 0xFFFF;
			temp +=1;
		}
		serial_print_dec(temp);
		break;
	default:
		serial_printf("#");
		break;
	}

	serial_print_lf();

	return;
}

void ta_uvr_dump_data(){
	char count = 0;
	serial_printf("Data: [");
	while (count < 35){
		serial_print_hex(data_cache[count]);
		count++;
	}
	serial_printf("]\r\n");
}

// Measure the required timer value for the next packet
short ta_uvr_calibrate_timer(){

	unsigned short timeout = 0;
	short periods[16];
	char count = 0;

	// Prepare timer
	tmr1_setup(TMR_IRQ_OFF);

		
	while (count < 16) {
		// Reset timer
		tmr1_set(0x0000);

		// Wait for rising edge
		while (uvr_data != TA_UVR_LOW) { timeout++; if (timeout > 65000){return 0;}}
		timeout = 0;
		while (uvr_data != TA_UVR_HIGH) { timeout++; if (timeout > 65000){return 0;}}
		// Start timer
		tmr1_start();

		// Wait for falling edge 
		while (uvr_data != TA_UVR_LOW) { }

		// Stop timer and save (check if we have a half period of a full period)
		tmr1_stop();
		// Allow TMR1H to update!!
		nop();
	
		// Half bit period duration gets stored
		short instr_count = tmr1_value();

		if (instr_count > 3000) { instr_count = instr_count >> 1 ;}

		periods[count] = instr_count;
		count++;

	}
		
	
	// Calculate average half bit period time
	count = 1;
	periods[0] = periods[0] >> 1;

	while (count < 16) {
		periods[0] = periods[0] + (periods[count]>>1);
		count++;
	}

	periods[0] = periods[0] >> 3;

	return periods[0];	
}