/*************************************************************
* Test suite for the MCP2515 CAN interface lib
*
* (c) 2005, Lieven Hollevoet, boostc compiler.
*************************************************************/
#ifndef _HASYNODE_H_
#define _HASYNODE_H_

#include <system.h>

// Define oscillator frequency
#pragma CLOCK_FREQ 2000000

// Define port directions
#define PortAConfig  11111111b  //  1=input
#define PortBConfig  11000000b  //  1=input 
#define PortCConfig  11010000b	

// Function declarations
void init(void);

#endif //_MCP2515_TEST_H_
