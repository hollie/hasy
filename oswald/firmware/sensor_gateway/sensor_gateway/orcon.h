/*************************************************************
* Interface to the Orcon HRC ventilation unit remote control
*
* (c) 2009, Lieven Hollevoet
* PSoC Designer v5.0 HiTide compiler
*
* Expects that the remote control buttons are connected to
* IO pins of the controller. The pins need to be 
* configured as 'open drain low' in the chip
* configuration window
*
*************************************************************/
#ifndef _ORCON_H_
#define _ORCON_H_

#include <m8c.h> 

void orcon_Start();
void orcon_low();
void orcon_med();
void orcon_high();

#endif // _ORCON_H_