/*************************************************************
* Interface to the Orcon HRC ventilation unit remote control
*
* (c) 2009, Lieven Hollevoet
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

enum ORCON_MODE_TYPE { LOW = 0, MEDIUM = 1, HIGH = 2 };

void orcon_Start(void);
void orcon_ticker(void);
void orcon_control(enum ORCON_MODE_TYPE mode);


#endif // _ORCON_H_