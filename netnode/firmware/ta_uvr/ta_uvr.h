#ifndef _TA_UVR_H_
#define _TA_UVR_H_

#include <system.h>

#define NR_DATA_BYTES 35
#define UVR_BIT_TIME 4567
// Structure for data exchange
typedef struct s_ta_uvr61_data {
                 short sensor1;
                 short sensor2;
                 short sensor3;
                 short sensor4;
                 short sensor5;
                 short sensor6;
                 char  output;
                 char  pump_speed;
                 char  analog;
                 char  valid;
              } ta_uvr_data;
            
void ta_uvr_getinfo();
char ta_uvr_verify_checksum();
char ta_uvr_data_available();

void ta_uvr_send_data();
void ta_uvr_print_sensor_value(char low, char high);
void ta_uvr_dump_data();
short ta_uvr_calibrate_timer();

volatile bit uvr_data @ PORTC . 2;
extern volatile bit ta_uvr_gotbit;

#define TA_UVR_LOW 1
#define TA_UVR_HIGH 0

#endif // _TA_UVR_H_
