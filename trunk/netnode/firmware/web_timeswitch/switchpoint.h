/*************************************************************
* Helper functions for storing switchpoints in EEPROM
* (c) Lieven Hollevoet
*************************************************************/

#ifndef _SWITCHPOINT_H_
#define _SWITCHPOINT_H_

// The switch is connected to this output bit
//#define output (PORTBbits.RB4)

#define DATA_START_ADDRESS 0x04
#define POINT_COUNT_ADDRESS 0x00

// Datatypes & enums
typedef struct s_switch_point {
                 char hour;
				 char minute;
				 unsigned char mask;
				 char action;
				 char position;
              } switch_point;


// Function prototypes
void         print_switch_list(void);
switch_point get_switch_point(char);
void         put_switch_point(switch_point);
void         print_switch_point(switch_point);
void         add_switch_point(void);
void         delete_switch_point(void);
char         update_switch_state(char, char, char);
void         switchpoint_init(void);

#endif // _SWITCHPOINT_H_