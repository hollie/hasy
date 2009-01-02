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

#ifndef _SPI_H_
#define _SPI_H_

#include <system.h>

/// Define the interface port and pin numbers

// The chip select of the device connected to the port
volatile bit spi_cs 	@ PORTC . 2;

// The TRIS register bits
bit spi_clk_tris @ TRISC . 3;
bit spi_di_tris  @ TRISC . 4;
bit spi_do_tris  @ TRISC . 5;
bit spi_cs_tris  @ TRISC . 2;
//bit spi_rst_tris @ TRISC . 1;

// The interrupt flag
bit spi_interrupt @ PIR1 . SSPIF;

// Function declarations
void spi_init();
void spi_init_buffer();
void spi_exchange();
char spi_get_byte(char count);
void spi_handle_interrupt();
void spi_load_byte(char input);
void spi_load_zeros(char count);
void spi_wait_for_completion();

#define spi_disable_devices()	spi_cs = 1
#endif // _SPI_H_
