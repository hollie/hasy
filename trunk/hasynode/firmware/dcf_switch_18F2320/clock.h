/*************************************************************
* 24h clock routines
*
* Keeps track of the current time 
*
* (c) 2006, Lieven Hollevoet
*     http://electronics.lika.be
*
* Toolsuite: Boostc compiler
* 
* License  : http://license.lika.be
*************************************************************/

#ifndef _CLOCK_H_
#define _CLOCK_H_

#include <system.h>

void clock_increment();
void clock_set(char hours, char mins, char secs);
void clock_clear();
void clock_print();
char clock_get_minutes();
char clock_get_seconds();
char clock_get_hours();

#endif // _CLOCK_H_
