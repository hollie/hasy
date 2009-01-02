/*************************************************************
* SPI interface code for PIC16F devices
*
* Provides an interface to the SPI hardware unit. A single 
* buffer is used for both TX and RX. The basic idea is that
* the buffer is loaded with bytes that need to be
* transmitted, then the 'exchange' funtion is called. 
* The bytes are transmitted sequentially and are replaced
* by the bytes that are received from the other device.
* The exchange is handles through the interrupt service
* routine.
*
* (c) 2005, Lieven Hollevoet, boostc compiler.
*************************************************************/

#include "spi.h"

// Declaration of local variables.
char spi_data_buffer[12];
char spi_pointer;
char spi_counter;

////////////////////////////////////////////////////////////
// Init of the hardware unit
////////////////////////////////////////////////////////////
void spi_init(){

	// Tris settings
	// outputs
	spi_clk_tris = 0;
	spi_do_tris  = 0;
	spi_cs_tris  = 0;

	// inputs
	spi_di_tris  = 1;
	
	// Hardware registers
	clear_bit(sspcon, SSPEN); 	// disable spi interface
	sspcon = 0x11;				// SPI Master, Idle high, Fosc/16
	
	set_bit(sspcon, SSPEN);		// enable spi interface
	clear_bit(pir1, SSPIF);		// clear interrupt flag
	set_bit(pie1, SSPIE);		// enable interrupt flag
	set_bit(intcon, PEIE);		// enable peripheral interrupts
	
}

////////////////////////////////////////////////////////////
// Init the databuffer of the SPI code
////////////////////////////////////////////////////////////
void spi_init_buffer(){
	spi_pointer = 0;
	return;
}

////////////////////////////////////////////////////////////
// Handle the SPI interrupt.
// A single buffer, at spi_data_buffer, is used for both 
// SPI RX and TX.  When a byte is removed from the buffer 
// for transmission, it is replaced by the received byte.
// The count, spi_counter, contains the number of bytes 
// remaining to be received.  This is one less than the
// number remaining to be transmitted. When the counter
// reaches zero the transaction is completed.
////////////////////////////////////////////////////////////
void spi_handle_interrupt(){    
        
    // Clear interrupt flag    
	clear_bit(pir1, SSPIF);		

	// Store the received byte in the data buffer
	spi_data_buffer[spi_pointer] = sspbuf;
	spi_pointer++;

	// Decrement the buffer counter
	spi_counter--;
	
	// Exit if we received the last byte
	if (spi_counter == 0){
		spi_cs = 1;
		return;
	}
	
	// If we get here, there is still data left
	sspbuf = spi_data_buffer[spi_pointer];
	return;
}

////////////////////////////////////////////////////////////
// Add a byte to the SPI TX buffer
////////////////////////////////////////////////////////////
void spi_load_byte(char input){
	spi_data_buffer[spi_pointer] = input;
	spi_pointer++;
}

////////////////////////////////////////////////////////////
// Initiate an SPI transaction
////////////////////////////////////////////////////////////
void spi_exchange(){
	
	// Get the number of bytes to transmit
	spi_counter = spi_pointer;
	
	// Sanity check
    if (spi_counter == 0){
		// Nothing to exchange
		return;
	}

	// Enable chipselect
	spi_cs = 0;
	
	// Transmit the first byte
	sspbuf = spi_data_buffer[0];
	spi_pointer = 0;

	return;
}

////////////////////////////////////////////////////////////
// Wait for the completion of the SPI exchange
// Skipped when running in debug mode.
////////////////////////////////////////////////////////////
void spi_wait_for_completion(){

#ifdef DEBUG
	return;
#endif

	while (spi_counter);

	spi_cs = 1;
	
}

////////////////////////////////////////////////////////////
// Load a number of zeros in the SPI data buffer
// Handy when a certain number of extra bytes is expected
// from the other SPI device
////////////////////////////////////////////////////////////
void spi_load_zeros(char count){
	
	char lcount = 0;
		
	while ( lcount < count ) {
		spi_data_buffer[spi_pointer] = 0x00;
		spi_pointer++;
		lcount++;
	}
	
	return;
}

////////////////////////////////////////////////////////////
// Get a byte from the spi data buffer
////////////////////////////////////////////////////////////
char spi_get_byte(char count){
	return spi_data_buffer[count];
}
