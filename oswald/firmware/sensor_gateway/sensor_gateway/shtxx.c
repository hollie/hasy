/***********************************************************************************
Project:          SHTxx demo program (V2.1)
Filename:         SHTxx_Sample_Code.c    

Original version: http://www.sensirion.com

Ported to PSOC C compiler by Lieven Hollevoet.
***********************************************************************************/
#include "PSoCAPI.h"
#include <stdio.h>
#include "shtxx.h"

// Internal function prototypes
void delay_1us(void);
void delay_5us(void);

enum {TEMP,HUMI};

typedef union 
{ unsigned int i;
  float f;
} value;

//----------------------------------------------------------------------------------
// modul-var
//----------------------------------------------------------------------------------

// Data and clock set macros
// DATA is on P2.1, set it to 'open drain low' drive in chip view
#define DATA(b) (PRT2DR = (b==0) ? (PRT2DR&0xFD) : (PRT2DR|0x02))
#define DATA_IN PRT2DR&0x02

// CLOCK is on P4.7, set it to 'strong slow' drive in chip view
#define SCK(b)  (PRT4DR = (b==0) ? (PRT4DR&0x7F) : (PRT4DR|0x80))


#define noACK 0
#define ACK   1
                            //adr  command  r/w
#define STATUS_REG_W 0x06   //000   0011    0
#define STATUS_REG_R 0x07   //000   0011    1
#define MEASURE_TEMP 0x03   //000   0001    1
#define MEASURE_HUMI 0x05   //000   0010    1
#define RESET        0x1e   //000   1111    0


void s_Start(void)
{
	// Release the IO line
	DATA(1);
	
}

//----------------------------------------------------------------------------------
char s_write_byte(unsigned char value)
//----------------------------------------------------------------------------------
// writes a byte on the Sensibus and checks the acknowledge 
{ 
  unsigned char i,error=0;  
  for (i=0x80;i>0;i/=2)             //shift bit for masking
  { if (i & value) DATA(1);          //masking value with i , write to SENSI-BUS
    else DATA(0);                        
    SCK(1);                          //clk for SENSI-BUS
    delay_5us();  	
    SCK(0);
  }
  DATA(1);                           //release DATA-line
  SCK(1);                            //clk #9 for ack 
  delay_5us();
  error=DATA_IN;                       //check ack (DATA will be pulled down by SHT11)
  SCK(0);        
  return error;                     //error=1 in case of no acknowledge
}

//----------------------------------------------------------------------------------
char s_read_byte(unsigned char ack)
//----------------------------------------------------------------------------------
// reads a byte form the Sensibus and gives an acknowledge in case of "ack=1" 
{ 
  unsigned char i,val=0;
  DATA(1);                           //release DATA-line
  for (i=0x80;i>0;i/=2)             //shift bit for masking
  { SCK(1);                          //clk for SENSI-BUS
    if (DATA_IN) val=(val | i);        //read bit  
    SCK(0);  					 
  }
  
  if (ack){
  	DATA(0);
  } else {
  	DATA(1);
  }
                         //in case of "ack==1" pull down DATA-Line
  SCK(1);                            //clk #9 for ack
  delay_5us(); 
  SCK(0);				                   //release DATA-line						    
  DATA(1);
          
  return val;
}

//----------------------------------------------------------------------------------
void s_transstart(void)
//----------------------------------------------------------------------------------
// generates a transmission start 
//       _____         ________
// DATA:      |_______|
//           ___     ___
// SCK : ___|   |___|   |______
{  
   DATA(1); SCK(0);                   //Initial state
   delay_5us();
   SCK(1);
   delay_5us();
   DATA(0);
   delay_5us();
   SCK(0);  
   delay_5us();
   SCK(1);
   delay_5us();
   DATA(1);		   
   delay_5us();
   SCK(0);		   
}

//----------------------------------------------------------------------------------
void s_connectionreset(void)
//----------------------------------------------------------------------------------
// communication reset: DATA-line=1 and at least 9 SCK cycles followed by transstart
//       _____________________________________________________         ________
// DATA:                                                      |_______|
//          _    _    _    _    _    _    _    _    _        ___     ___
// SCK : __| |__| |__| |__| |__| |__| |__| |__| |__| |______|   |___|   |______
{  
  unsigned char i; 
  DATA(1); 
  delay_5us();
  SCK(0);                    //Initial state
  delay_5us();  
  for(i=0;i<9;i++)                  //9 SCK cycles
  { SCK(1);
    delay_5us();
    SCK(0);
    delay_5us();
  }
  s_transstart();                   //transmission start
}

//----------------------------------------------------------------------------------
char s_softreset(void)
//----------------------------------------------------------------------------------
// resets the sensor by a softreset 
{ 
  unsigned char error=0;  
  s_connectionreset();              //reset communication
  error+=s_write_byte(RESET);       //send RESET-command to sensor
  return error;                     //error=1 in case of no response form the sensor
}

//----------------------------------------------------------------------------------
char s_read_statusreg(unsigned char *p_value, unsigned char *p_checksum)
//----------------------------------------------------------------------------------
// reads the status register with checksum (8-bit)
{ 
  unsigned char error=0;
  s_transstart();                   //transmission start
  error=s_write_byte(STATUS_REG_R); //send command to sensor
  *p_value=s_read_byte(ACK);        //read status register (8-bit)
  *p_checksum=s_read_byte(noACK);   //read checksum (8-bit)  
  return error;                     //error=1 in case of no response form the sensor
}

//----------------------------------------------------------------------------------
char s_write_statusreg(unsigned char *p_value)
//----------------------------------------------------------------------------------
// writes the status register with checksum (8-bit)
{ 
  unsigned char error=0;
  s_transstart();                   //transmission start
  error+=s_write_byte(STATUS_REG_W);//send command to sensor
  error+=s_write_byte(*p_value);    //send value of status register
  return error;                     //error>=1 in case of no response form the sensor
}
 							   
//----------------------------------------------------------------------------------
char s_measure(unsigned char *p_value, unsigned char *p_checksum, unsigned char mode)
//----------------------------------------------------------------------------------
// makes a measurement (humidity/temperature) with checksum
{ 
  unsigned error=0;
  unsigned int i;

  s_transstart();                   //transmission start
  switch(mode){                     //send command to sensor
    case TEMP	: error+=s_write_byte(MEASURE_TEMP); break;
    case HUMI	: error+=s_write_byte(MEASURE_HUMI); break;
    default     : break;	 
  }
  
  i=0;
  while (DATA_IN && i < 65535) {
  	delay_5us();
	i++;
  }
  /*for (i=0;i<65535;i++) {
  	if(DATA_IN==0) {i=65535;} //wait until sensor has finished the measurement
	delay_5us();
	//delay_5us();
	//delay_5us();
	//delay_5us();
  }*/
  
  if(DATA_IN) error+=1;                // or timeout (~2 sec.) is reached
  *(p_value)  =s_read_byte(ACK);    //read the first byte (MSB)
  *(p_value+1)=s_read_byte(ACK);    //read the second byte (LSB)
  *p_checksum =s_read_byte(noACK);  //read checksum
  
  return error;
  
}


//----------------------------------------------------------------------------------------
void calc_sth11(float *p_humidity ,float *p_temperature)
//----------------------------------------------------------------------------------------
// calculates temperature [°C] and humidity [%RH] 
// input :  humi [Ticks] (12 bit) 
//          temp [Ticks] (14 bit)
// output:  humi [%RH]
//          temp [°C]
{ float C1=-4.0;              // for 12 Bit
  float C2=+0.0405;           // for 12 Bit
  float C3=-0.0000028;        // for 12 Bit
  float T1=+0.01;             // for 14 Bit @ 5V
  float T2=+0.00008;           // for 14 Bit @ 5V	

  float rh=*p_humidity;             // rh:      Humidity [Ticks] 12 Bit 
  float t=*p_temperature;           // t:       Temperature [Ticks] 14 Bit
  float rh_lin;                     // rh_lin:  Humidity linear
  float rh_true;                    // rh_true: Temperature compensated humidity
  float t_C;                        // t_C   :  Temperature [°C]

  t_C=t*0.01 - 40;                  //calc. temperature from ticks to [°C]
  rh_lin=C3*rh*rh + C2*rh + C1;     //calc. humidity from ticks to [%RH]
  rh_true=(t_C-25)*(T1+T2*rh)+rh_lin;   //calc. temperature compensated humidity [%RH]
  if(rh_true>100)rh_true=100;       //cut if the value is outside of
  if(rh_true<0.1)rh_true=0.1;       //the physical possible range

  *p_temperature=t_C;               //return temperature [°C]
  *p_humidity=rh_true;              //return humidity[%RH]
}

//--------------------------------------------------------------------
float calc_dewpoint(float h,float t)
//--------------------------------------------------------------------
// calculates dew point
// input:   humidity [%RH], temperature [°C]
// output:  dew point [°C]
{ float logEx,dew_point;
  logEx=0.66077+7.5*t/(237.3+t)+(log10(h)-2);
  dew_point = (logEx - 0.66077)*237.3/(0.66077+7.5-logEx);
  return dew_point;
}

//----------------------------------------------------------------------------------
void s_do_measure(void){
//----------------------------------------------------------------------------------
// sample program that shows how to use SHT11 functions
// 1. connection reset 
// 2. measure humidity [ticks](12 bit) and temperature [ticks](14 bit)
// 3. calculate humidity [%RH] and temperature [°C]
// 4. calculate dew point [°C]
// 5. print temperature, humidity, dew point  



  value humi_val,temp_val;
  float dew_point;
  unsigned char error,checksum;
  unsigned int i;

  
  s_connectionreset();
  
  //while(1)
  //{ 
  error=0;
  error+=s_measure((unsigned char*) &humi_val.i,&checksum,HUMI);  //measure humidity
  error+=s_measure((unsigned char*) &temp_val.i,&checksum,TEMP);  //measure temperature
  
  if(error!=0) {s_connectionreset(); LTRX_CPutString("SHTxx error: "); LTRX_PutSHexByte(error); }                //in case of an error: connection reset
  else
  { humi_val.f=(float)humi_val.i;                   //converts integer to float
    temp_val.f=(float)temp_val.i;                   //converts integer to float
    calc_sth11(&humi_val.f,&temp_val.f);            //calculate humidity, temperature
    dew_point=calc_dewpoint(humi_val.f,temp_val.f); //calculate dew point
	  
	cprintf("SHTxx T:%5.1f C RH:%5.1f% pct DewPt:%5.1f C\r\n",temp_val.f,humi_val.f,dew_point);
  }
 
} 

// Delay of 1 us when main clock == 24 MHz and Sysclk = main / 1
// Acctually, calling this function takes 2.3 us, do not use it for 
// precise timing loops
void delay_1us(void) {
	return;
}

// Delay of 5 us when main clock == 24 MHz and Sysclk = main / 1
// Actual delay: 5.3 us
void delay_5us(void) {

	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
	asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");

	return;
}