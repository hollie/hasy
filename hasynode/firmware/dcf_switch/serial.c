/*************************************************************
* Blocking serial interface code for the hardware UART
* of PIC16-range microcontrollers from Microchip
*
* (c) 2006, Lieven Hollevoet
*     http://electronics.lika.be
*
* Toolsuite: Boostc compiler
* 
* License  : http://license.lika.be
*            Based on code from Yann Hendrikx.
*************************************************************/

#include "serial.h"

////////////////////////////////////////////////////////////
// Hardware initialisation
// input argument: the baudrate scaler
////////////////////////////////////////////////////////////
void serial_init(char brg)
{
    spbrg = brg;		  	//baud rate init
    txsta = 00100100b;      //transmit init
    rcsta = 10010000b;      //receive init
}

////////////////////////////////////////////////////////////
// Print a single character to the serial port
// This funtion is skipped in debug mode since it will 
// block the debugger (the function waits for a hardware
// signal)
////////////////////////////////////////////////////////////
void serial_printf(char value)
{

#ifdef DEBUG
	// Skip when debugging
	return;
#endif

    while((txsta & 1 << TRMT) == 0); 
    txreg = value;
}

////////////////////////////////////////////////////////////
// Prints a line to the serial port. Ends with a linefeed.
// The function parameter is stored in rom.
////////////////////////////////////////////////////////////
void serial_printf(const char* text)
{
    char i = 0;
    while(text[i] != 0)
        serial_printf(text[i++]);
        
}

////////////////////////////////////////////////////////////
// Print a decimal value to the serial port
////////////////////////////////////////////////////////////
void serial_print_dec(char number)
{
    if(number > 99) {
        serial_printf(((number / 100) % 10) + '0');
    }
    if(number > 9) {
        serial_printf(((number / 10) % 10) + '0');
    }
    serial_printf((number % 10) + '0');
}

////////////////////////////////////////////////////////////
// Print a decimal value to the serial port
// The number takes multiple characters. If a character 
// position is not used, it is filled with 0.
// Positions should be 1, 2 or 3.
////////////////////////////////////////////////////////////
void serial_print_dec(char number, char positions)
{

    if(number > 99) {
        serial_printf(((number / 100) % 10) + '0');
    } else {
		if (positions > 2){
			serial_printf('0');
		}
	}
    if(number > 9) {
        serial_printf(((number / 10) % 10) + '0');
    } else {
		if (positions > 1){
			serial_printf('0');
		}
	}
	serial_printf((number % 10) + '0');
}

////////////////////////////////////////////////////////////
// Print a decimal value to the serial port
////////////////////////////////////////////////////////////
void serial_print_dec(short number)
{
	if(number > 9999) {
        serial_printf(((number / 10000) % 10) + '0');
    }
	if(number > 999) {
        serial_printf(((number / 1000) % 10) + '0');
    }
    if(number > 99) {
        serial_printf(((number / 100) % 10) + '0');
    }
    if(number > 9) {
        serial_printf(((number / 10) % 10) + '0');
    }
    serial_printf((number % 10) + '0');
}

////////////////////////////////////////////////////////////
// Print a hex value to the serial port
////////////////////////////////////////////////////////////
void serial_print_hex(char number)
{
    char hexChar;
    char i;
    for(i = 0; i < 2; i++)
    {
        if(i == 0)
            hexChar = number >> 4;
        else
            hexChar = number & 0x0F;
        if(hexChar < 10)
            hexChar = hexChar + '0';
        else
            hexChar = hexChar + ('A' - 10);
        serial_printf(hexChar);
    }
}

////////////////////////////////////////////////////////////
// Print a 16-bit hex value to the serial port
////////////////////////////////////////////////////////////
void serial_print_hex(short value){
	
    char value1 = (char)((value >> 8) & 0x00FF);
    
	serial_print_hex(value1);
 
    char value0 = (char)(value & 0x00FF);
    
	serial_print_hex(value0);
	
	return;
    
}
////////////////////////////////////////////////////////////
// Print a binary value to the serial port
////////////////////////////////////////////////////////////
void serial_print_bin(char number)
{
    char i;
    for(i = 0; i < 8; i++)
    {
		if (number & 10000000b){
			serial_printf('1');
		} else {
		    serial_printf('0');
		}
        number <<= 1;
    }
}

////////////////////////////////////////////////////////////
// Wait for a character to read it from the serial port
// This function is skipped when running in debug mode
// since else it blocks the simulator (waits for a 
// hardware signal from the UART)
////////////////////////////////////////////////////////////
char serial_getch(){

#ifdef DEBUG
	return 0x00;
#endif

	while (!serial_peek());
	return rcreg;
}

// Read a decimal value from the serial port
char serial_get_decimal(){
	char value = 0;
	char input = 0;

	input = serial_getch();
	
	while (input != 0x0D){ 
		serial_printf(input);
		value *= 10;
		value += (input-0x30);
		input = serial_getch();
	}
	serial_print_lf();
	return value;
}