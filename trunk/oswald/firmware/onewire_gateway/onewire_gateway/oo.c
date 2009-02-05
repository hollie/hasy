/*************************************************************
* OneWire interface lib for the Dallas DS1820 and alike
*
* (c) 2009, Lieven Hollevoet
* PSoC Designer v5.0 HiTide compiler
*************************************************************/

#include "oo.h"
#include "PSoCAPI.h"

char oo_scratchpad[9];
// Scratchpad contents
// 0	Temperature LSB
// 1	Temperature MSB
// 2	Hi alarm temperature
// 3	Lo alarm temperature
// 4	Reserved, 0xFF
// 5	Reserved, 0xFF
// 6	Remainder register
// 7	Nr of counts per degree
// 8	CRC of pad contents

#ifdef OO_CRC_CHECKING

// CRC working variable
char crc = 0;

// CRC lookup table
char crc_rom[256] = {0, 94, 188, 226, 97, 63, 221, 131, 194, 156, 126, 32, 163, 253, 31, 65, 157, 195, 33, 127, 252, 162, 64, 30, 95, 1, 227, 189, 62, 96, 130, 220, 35, 125, 159, 193, 66, 28, 254, 160, 225, 191, 93, 3, 128, 222, 60, 98, 190, 224, 2, 92, 223, 129, 99, 61, 124, 34, 192, 158, 29, 67, 161, 255, 70, 24, 250, 164, 39, 121, 155, 197, 132, 218, 56, 102, 229, 187, 89, 7, 219, 133, 103, 57, 186, 228, 6, 88, 25, 71, 165, 251, 120, 38, 196, 154, 101, 59, 217, 135, 4, 90, 184, 230, 167, 249, 27, 69, 198, 152, 122, 36, 248, 166, 68, 26, 153, 199, 37, 123, 58, 100, 134, 216, 91, 5, 231, 185, 140, 210, 48, 110, 237, 179, 81, 15, 78, 16, 242, 172, 47, 113, 147, 205, 17, 79, 173, 243, 112, 46, 204, 146, 211, 141, 111, 49, 178, 236, 14, 80, 175, 241, 19, 77, 206, 144, 114, 44, 109, 51, 209, 143, 12, 82, 176, 238, 50, 108, 142, 208, 83, 13, 239, 177, 240, 174, 76, 18, 145, 207, 45, 115, 202, 148, 118, 40, 171, 245, 23, 73, 8, 86, 180, 234, 105, 55, 213, 139, 87, 9, 235, 181, 54, 104, 138, 212, 149, 203, 41, 119, 244, 170, 72, 22, 233, 183, 85, 11, 136, 214, 52, 106, 43, 117, 151, 201, 74, 20, 246, 168, 116, 42, 200, 150, 21, 75, 169, 247, 182, 232, 10, 84, 215, 137, 107, 53};

// CRC function prototypes
void oo_crc_init();
void oo_crc_shuffle_byte(char input);
#endif

// Internal variables
char        id[8];
signed char conflict;
bit         new_conflict;



////////////////////////////////////////////////////////////
// oo_busreset()
// 
// Issues a 'ping' on the bus. If there is at least one
// sensor on the bus, it will generate a presence pulse.
// Returns: 1 if a presence pulse was detected
//          0 if no device was detected
////////////////////////////////////////////////////////////
char oo_busreset(){
	
	return OneWire_fReset();
	
}

////////////////////////////////////////////////////////////
// oo_tx_byte(char data)
// 
// Transmits a single byte from the bus
////////////////////////////////////////////////////////////
void oo_tx_byte(char data){
	OneWire_WriteByte(data);
	return;
}

////////////////////////////////////////////////////////////
// char oo_rx_byte()
// 
// Receives a single byte from the bus
////////////////////////////////////////////////////////////
char oo_rx_byte(){

	char data = 0;
	
	OneWire_bReadByte();

#ifdef OO_CRC_CHECKING
	oo_crc_shuffle_byte(data);
#endif	
	return data;
}


////////////////////////////////////////////////////////////
// char oo_read_scratchpad()
// 
// Reads the scratchpad of the currently selected device
////////////////////////////////////////////////////////////
char oo_read_scratchpad(){
	
	// Read the scratchpad
	oo_tx_byte(OO_READPAD);
	
	char counter = 0;

#ifdef OO_CRC_CHECKING
	// Reset the CRC register, CRC is updated in the oo_rx_byte() function.
	oo_crc_init();
#endif
	LTRX_CPutString("Scratchpad: ");
	while (counter < 9){
		oo_scratchpad[counter] = oo_rx_byte();
		LTRX_PutSHexByte(oo_scratchpad[counter]);
		counter++;
	}
	LTRX_PutCRLF();	

#ifdef OO_CRC_CHECKING
	// Verify the CRC
	return crc;
#endif

	return 0;
}

////////////////////////////////////////////////////////////
// short oo_get_temp()
// 
// DS1820 specific
// Returns the 2-byte value of the temperature register
////////////////////////////////////////////////////////////
short oo_get_temp(){
	short retval;
	retval = (short)oo_scratchpad[1];
	retval = retval << 8;
	retval += (short)oo_scratchpad[0];
	return retval; 
}

////////////////////////////////////////////////////////////
// short oo_get_count()
// 
// DS1820 specific
// Returns the 2-byte value of the count register
////////////////////////////////////////////////////////////
short oo_get_count(){
	short retval;
	retval = (short)oo_scratchpad[7];
	retval = retval << 8;
	retval += (short)oo_scratchpad[6];
	return retval; 
}

////////////////////////////////////////////////////////////
// oo_conversion_busy()
// 
// DS1820 specific
// Returns 1 if a sensor is still processing
//         0 if all sensors are done
////////////////////////////////////////////////////////////
char oo_conversion_busy(){
	if (oo_rx_byte() == 0xFF){
		return 1;
	} else {
		return 0;
	}
}

////////////////////////////////////////////////////////////
// oo_start_conversion()
// 
// DS1820 specific
// Commands all sensors to start a temperature conversion
////////////////////////////////////////////////////////////
void oo_start_conversion(){
	// Command all temp sensors on the bus to start a conversion
	oo_tx_byte(OO_SKIPROM);
	
	// Convert temperature
	oo_tx_byte(OO_CONVERTT);
	
	return;
}


void delay_10ms(){
	short counter;
	
	for (counter = 0; counter<15000; counter++){
		asm("nop");
	}
}
////////////////////////////////////////////////////////////
// char oo_wait_for_completion()
// 
// DS1820 specific
// Wait for the completion of the temperature conversion
// returns 0 if timed out, returns 1 when finished OK.
////////////////////////////////////////////////////////////
char oo_wait_for_completion(){

	char counter = 0;
	
	while (oo_conversion_busy()){
		// Security: if the conversion is not completed
		// after > 1 sec -> break.
		delay_10ms();
		counter++;
		if (counter == 100){
			return 0;
		}	
	}
	
	return 1;
}

#ifdef OO_CRC_CHECKING
////////////////////////////////////////////////////////////
// oo_crc_init()
//
// Initialise the CRC working register to be able to 
// start a new calculation
////////////////////////////////////////////////////////////
void oo_crc_init(){
	crc = 0;
}

////////////////////////////////////////////////////////////
// oo_crc_shuffle_byte()
//
// Shuffle the next byte into the CRC
////////////////////////////////////////////////////////////
void oo_crc_shuffle_byte(char input){
	crc = crc_rom[crc ^ input];
}
#endif



char  oo_get_pad_byte(char index){
	return oo_scratchpad[index];
}

// Extract the info from the selected device
oo_tdata oo_read_device(){

	char loper;
	char crc;
	
	oo_tdata data;
	
	data.valid = 0;
	
	// Get the ID
	OneWire_GetROM(data.id);
	
	oo_busreset();

	// Select the device
	OneWire_SetROM(data.id);
	OneWire_fVerify();
	
	// Read the scratchpad
	if (crc = oo_read_scratchpad()){
		return data;
	}
	
	// And extract the temperature information
	data.t_msb    = oo_scratchpad[1];
	data.t_lsb    = oo_scratchpad[0];
	data.remain   = oo_scratchpad[6];
	data.nr_count = oo_scratchpad[7];
	if (crc == oo_scratchpad[8]) {	data.valid = 1; }
	
	return data;
	
}

void oo_print_data(oo_tdata data){

	char cntr;
	
	// print ID
	for (cntr=0; cntr<8; cntr++){
		LTRX_PutSHexByte(*(data.id+cntr));	
	}
	
	LTRX_CPutString(" - ");
	
	// print temperature in hex
	LTRX_PutSHexByte(data.t_msb);
	LTRX_PutSHexByte(data.t_lsb);
	
	LTRX_CPutString(" - ");
	
	// print counter/reminder
	LTRX_PutSHexByte(data.nr_count);
	LTRX_CPutString("/");
	LTRX_PutSHexByte(data.remain);
	
	LTRX_CPutString(" - ");
	LTRX_PutChar(data.valid+0x30);	

	LTRX_PutCRLF();
	
	
}

// Get a system report from the OneWire bus
// This means: 
//  * reset the bus and check devices are present
//  * start conversion on all devices
//  * wait for completion
//  * read the scratchpad of the first device, extract temperature data, print ID + status
//  * continue until the last sensor is read
void oo_report(){
	
	oo_tdata data;
	
	unsigned char id[8];
	
	// Reset
	if (!oo_busreset()){
		LTRX_CPutString("No OneWire devices found on the bus!");
		LTRX_PutCRLF();
		return;
	}
	
	// Start conversion
	oo_start_conversion();
	
	// Wait for completion
	if (!oo_wait_for_completion()){
		LTRX_CPutString("Timed out while waiting for conversion!");
		LTRX_PutCRLF();
		return;
	}
	
	// Find the first device on the bus
	if (OneWire_fFindFirst()){
		OneWire_GetROM(id);
	} else {
		LTRX_CPutString("Problem detecting first device on the bus");
		LTRX_PutCRLF();		
		return;
	}
	
	
	data = oo_read_device();
	
	oo_print_data(data);
	
	
	
}

