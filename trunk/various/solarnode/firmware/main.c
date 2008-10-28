/*
Hardware connections:

RA0	RSSI
RA1 SOLAR (value must be divided by 100, setup:  2x27 Ohm in series, voltage measured over 1 resistor)
RA2 SUPPLY (value must be divided by 50, setup: 2x10K in series, voltage measured over 1 resistor)
RA3 VREF+ (2.5V, for the master node VCC 3.3V is used as reference)
RA4 TEMP (value represents Celsius value)

RB1 soft uart transmitter
RB2 supply voltage output
RB3 reference enable

*/

/*
1 cycle = 1/20MHz * 4 = 200ns
10Kcycles = 2 ms
*/

#include <p18cxxx.h>
#include <delays.h>
#include <usart.h>
#include <spi.h>
#include <sw_uart.h>
#include <math.h>
#include <stdio.h>
#include <timers.h>
#include <adc.h>
#include "solar_node.h"

#define nop(); _asm nop _endasm 
//#define DIPSW (((~PORTD)&0xF0)>>4)


//config settings
#pragma config OSC = HS
#pragma config WDT = OFF
#pragma config LVP = OFF
#pragma config DEBUG = OFF

//delay functions
#define delay_500ms Delay10KTCYx(250)
#define delay_100ms Delay10KTCYx(50)
#define delay_20ms Delay10KTCYx(10)
#define delay_10ms Delay10KTCYx(5)
#define delay_2ms Delay10KTCYx(1)
//variables
#define UARTBUFFERSIZE 120
signed char rxdata[UARTBUFFERSIZE];
unsigned char rxpointer=0;

//extern char spiBuffer[BUFFERSIZE];
unsigned long stringIndex=0x0;
unsigned long ix;
unsigned long sdcounter=0x0;

int i;
char dip;
char sendbeacon=0;
char beaconID=1;
unsigned int beaconcounter=0;

char wakeup=0;

char nodetemp;
char nodeRSSI;
char nodeSolar;
char nodeSup;

char masterRSSI;

char sent=0;

char seconds=0;
char minutes=0;
char hours=0;
char days=0;

char button_pushed=0;
char writeStringIndex=0;

char RSSI_taken=0;

#define BEACONSIZE 5
#define PACKETSIZE 105
#define SLEEPTIME 5
unsigned int sleepcounter=0;

unsigned long totalseconds=0;
unsigned long indexCounter=0;

//char test=0;


/* soft UART delay functions */

void DelayTXBitUART(void)
{
	//32 cycles for 115Kbaud -> adapted to 30, consistent result
	nop();nop();nop();nop();nop();nop();nop();nop();nop();nop();
	nop();nop();nop();nop();nop();nop();nop();nop();nop();nop();
	nop();nop();nop();nop();nop();nop();nop();nop();nop();nop();
	//nop();nop();
}

void DelayRXHalfBitUART(void)
{
	//13 cycles for 115Kbaud
	nop();nop();nop();nop();nop();nop();nop();nop();nop();nop();
	nop();nop();nop();
}

void DelayRXBitUART(void)
{
	//30 cycles for 115Kbaud
	nop();nop();nop();nop();nop();nop();nop();nop();nop();nop();
	nop();nop();nop();nop();nop();nop();nop();nop();nop();nop();
	nop();nop();nop();nop();nop();nop();nop();nop();nop();nop();
}

/* radio USART functions */

void sendRADIO(char d)
{
	while(BusyUSART());
	WriteUSART(d);
}

void stringRADIO(const far rom char* str)
{
	char i=0;
	while (str[i]!=0)
		sendRADIO(str[i++]);
}


unsigned char get_solar(void)
{
	unsigned char adc_val = 0;

	// turn on voltage ref
	TRISAbits.TRISA4 = 0;
	TRISAbits.TRISA2 = 0;
	PORTAbits.RA4 = 0;
	PORTAbits.RA2 = 1;

	//turn on AD 
	ADCON0=0x89;	
	ADCON1=0x05;
		
	delay_2ms;	//acquisition time

	ADCON0bits.GO=1;
	while(ADCON0bits.GO)
		;
	
	adc_val = ADRESH;

	//turn off AD 
	ADCON0=0;

	// return tris bits to input
	TRISAbits.TRISA4 = 1;
	TRISAbits.TRISA2 = 1;
	
	return adc_val;
}

unsigned char get_supply(void)
{
	unsigned char adc_val = 0;

	// turn on voltage ref
	TRISAbits.TRISA4 = 0;
	TRISAbits.TRISA2 = 0;
	PORTAbits.RA4 = 0;
	PORTAbits.RA2 = 1;

	//turn on AD, now we measure the ref voltage and use VSS/VDD as reference
	ADCON0=0x99;	
	ADCON1=0x04;
		
	delay_2ms;	//acquisition time

	ADCON0bits.GO=1;
	while(ADCON0bits.GO)
		;
	
	adc_val = ADRESH;

	//turn off AD 
	ADCON0=0;

	// return tris bits to input
	TRISAbits.TRISA4 = 1;
	TRISAbits.TRISA2 = 1;
	
	return adc_val;
}
void main()
{
	unsigned char solar_value = 0;
	unsigned char supply_value = 0;
	unsigned char tx          = 0;

	//init
	//switch
	SWITCHtris=1;
	//LED
	LED0tris=0;
	LED1tris=0;
	LED0=0;
	LED1=0;
	
	//wireless	
	BSYtris=1;
	RDYtris=0;
	TXtris=0;
	RXtris=1;
	RSSItris=1;
	RADIOtris=0;
	RADIO=1;	//turn radio off
	//SDcard
	PROTECTtris =1;
	DETECTtris =1;
	SDCARDtris =0;
	SDItris=1;
	SDOtris =0;
	SCKtris =0;
	CStris=0;
	SDCARD=1;	//turn card off
	//DIP
	TRISEbits.PSPMODE=0;
	DIP0tris=1;
	DIP1tris=1;
	DIP2tris=1;
	DIP3tris=1;
	//turn off internal pull-ups
	INTCON2bits.RBPU=1;		
	//turn off WDT
	WDTCONbits.SWDTEN=0;
	//turn off AD
	ADCON0bits.ADON=0;
	//comparator off
	CMCON=0x7;
	//temp sensor	
	VCCTEMPtris=0;
	TEMPtris=1;
	VCCTEMP=0;	//turn temp sensor off

	//ADC reference 2.5V
	REFtris=0;
	REF=0;

	//Supply measurement 
	SUPtris=0;
	SUP=0;

	//set ER400TRS ready
	RDY=0;

	//radio receive buffer@19200 baud
	for(i=0;i<UARTBUFFERSIZE;i++)
	{
		rxdata[i]=0;
	}
	
	
	
	OpenUSART(	USART_TX_INT_OFF &
				USART_RX_INT_ON &		
				USART_ASYNCH_MODE &
				USART_EIGHT_BIT &
				USART_CONT_RX &
				USART_BRGH_HIGH,64);


	IPR1bits.RCIP=0;	//set low priority

	//timer1 32kHz sleep timer
	OpenTimer1(		TIMER_INT_ON	&
					T1_16BIT_RW		&
					T1_SOURCE_EXT	&
					T1_PS_1_1		&
					T1_OSC1EN_ON	&
					T1_SYNC_EXT_OFF);
	
	IPR1bits.TMR1IP=1;		//set high priority

	INTCONbits.INT0IE=1;

	//global interrupt activation
	RCONbits.IPEN = 1;	//enable priority
	INTCONbits.GIEH=1;	//enable hi priority
	INTCONbits.GIEL=1;	//enable lo priority
	
	//read version from ER400TRS
	//RADIO=0;	//turn on RADIO
	delay_100ms;
	rxpointer=0;
	

	//read DIP switch
	//////////////////////// define board type here 0: central node 1:node1 2:node2 ////////////////////
	dip=0x1;
	///////////////////////////////////////////////////////////////////////////////////////////////////
	
	//if(dip!=0x0)
	//	RADIO=1;	//turn off radio

	LEDGREEN=0;	//GREEN data	
	LEDRED=0; //RED beacons

	//reset rxpointer
	rxpointer=0;
	
	
	while(1)
	{
	
			
		//actions before sleep
	/*	if(wakeup==0x0)
		{
			LEDRED=0;

			//turn off USART interrupt to prevent spurious wake-up
			PIE1bits.RCIE=0;
				
			//set all  pins as input
			RDYtris=1;
			TXtris=1;
			//turn off serial port
			RCSTAbits.SPEN=0;	
			
			//turn off radio
			RADIO=1;
				
			// Make sure we TX next time 
			tx = 1;
			//go to sleep 
			nop();nop();nop();
			Sleep();
			nop();nop();nop();	
		}
		//actions after sleep
		else
		{ */

		//turn on USART interrupt
		RDYtris=0;
		TXtris=0;
		RCSTAbits.SPEN=1;	
		PIE1bits.RCIE=1;
		// Get solar valuel
		solar_value = get_solar();
		supply_value = get_supply();

		// Make sure the value does not equal our end of line character '*'
		if (solar_value == '*'){
			solar_value+=1;
		}
		if (supply_value == '*'){
			supply_value+=1;
		}

		//turn on radio
		RADIO=0;
		delay_20ms;

		//LEDRED=1;

		sendRADIO(0x01);
		sendRADIO(solar_value);
		sendRADIO(supply_value);
		sendRADIO('*');
		delay_20ms;
			
		//turn off radio
		RADIO=1;
		//LEDRED=0;
		tx = 0;

		//}	
		//turn off USART interrupt to prevent spurious wake-up
		PIE1bits.RCIE=0;
				
		//set all  pins as input
		RDYtris=1;
		TXtris=1;
		//turn off serial port
		RCSTAbits.SPEN=0;	
			
		//turn off radio
		RADIO=1;
				
	

		wakeup = 0;

		while (wakeup==0){
			//go to sleep 
			nop();nop();nop();
			Sleep();
			nop();nop();nop();	
		}
		

	}
}


/*********************interrupt handler ******************************/
void high_isr(void);
void low_isr(void);

#pragma code low_vector = 0x18
void interrupt_at_low_vector(void)
{
	_asm goto low_isr _endasm
}
#pragma code

#pragma code high_vector = 0x08
void interrupt_at_high_vector(void)
{
	_asm goto high_isr _endasm
}
#pragma code

#pragma interrupt low_isr
void low_isr (void)
{
	//USART interrupt
	if(PIR1bits.RCIF)
	{
		rxdata[0]=ReadUSART();
		PIR1bits.RCIF=0;
	
		//spit out data
		//if(dip==0)
		//	WriteUART(ReadUSART());
		
	}
}

#pragma interrupt high_isr
void high_isr (void)
{
	//button RB0 interrupt
	if(INTCONbits.INT0IF)
	{
		INTCONbits.INT0IF=0;
		button_pushed=1;
	}


	//Timer1 32kHz interrupt
	if(PIR1bits.TMR1IF)
	{
		PIR1bits.TMR1IF=0;
		WriteTimer1(0x7FFF);	//interrupt every second
		
		//local clock
		seconds++;
		totalseconds++;
		if(seconds==60)
		{
			seconds=0;
			minutes++;

			//write stringIndex to EEPROM
		//	writeStringIndex=1;
		}
		if(minutes==60)
		{
			minutes=0;
			hours++;

			
		}
		if(hours==24)
		{
			hours=0;
			days++;
		}

		sleepcounter++;
		if(sleepcounter==SLEEPTIME)
		{
			wakeup=1;
			sleepcounter=0;
		}
	}
}

