/*************************************************************
* Blinds steering firmware
*
* (c) 2007, Lieven Hollevoet, boostc compiler.
*************************************************************/
#ifndef _RELAISCARDNODE_H_
#define _RELAISCARDNODE_H_

#include <system.h>

// Define firmware version
#define VERSION_MAJOR 1
#define VERSION_MINOR 0

// Define oscillator frequency
#pragma CLOCK_FREQ 2000000

// Define port directions
#define PortAConfig  11100000b  //  1=input
#define PortBConfig  11111111b  //  1=input 
#define PortCConfig  11010000b	

// Define special function pins
volatile bit led @ PORTA . 4;

// Function declarations
void init(void);
void disable_blinds();
void all_blinds_up();
void all_blinds_down();
void print_menu();
void print_status();
void program_blind_delay();
void command_blind();
void single_blind_control(char blind, char direction);
void set_disable_timer(char delay);
void command_blind_up(char blind);
void command_blind_down(char blind);
void command_blind_stop(char blind);

// Constant definitions
#define TMR1_VAL 0x0BDC


// Address where to store the motor actuation time in EEPROM
#define DELAY_ADDR      0x00 

// Address in RAM where to store the 2 status variables
#define UP_ADDRESS      0x20
#define DOWN_ADDRESS    0x21
#define CARD_STATUS1    0x22
#define CARD_STATUS2    0x23
#define CARD_STATUS3    0x24

#endif //_MCP2515_TEST_H_
