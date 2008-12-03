/*
Hardware connections:

 to be completed
*/

#include <p18cxxx.h>
#include <delays.h>
#include <usart.h>
#include <timers.h>
#include <adc.h>
#include "solar_node.h"

#define nop(); _asm nop _endasm 

//config settings
#pragma config OSC = HS
#pragma config WDT = OFF
#pragma config LVP = OFF
#pragma config DEBUG = OFF

//delay functions
#define delay_20ms Delay10KTCYx(10)
#define delay_10ms Delay10KTCYx(5)
#define delay_2ms Delay10KTCYx(1)
#define delay_1ms Delay1KTCYx(5)
#define delay_50us Delay10TCYx(25)

//variables

char wakeup=0;

#define SLEEPTIME 4*5    				// A single sleeptime represents a 15-second interval (4 = one minute)
unsigned int sleepcounter=SLEEPTIME-1; 	// Make sure to perform a first transmission after 15 seconds

// UART helper functions
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

// Measure solar panel voltage
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
		
	delay_50us;	//acquisition time

	ADCON0bits.GO=1;
	while(ADCON0bits.GO)
		;
	
	adc_val = ADRESH;

	//turn off AD 
	ADCON0=0;

	// disable voltage ref
	PORTAbits.RA2 = 0;

	return adc_val;
}

// Measure the own vcc
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
		
	delay_50us;	//acquisition time

	ADCON0bits.GO=1;
	while(ADCON0bits.GO)
		;
	
	adc_val = ADRESH;

	//turn off AD 
	ADCON0=0;

	// disable voltage ref
	PORTAbits.RA2 = 0;


	return adc_val;
}

unsigned char get_temp()
{
	unsigned char temp_val = 0;

	// turn on voltage ref
	TRISAbits.TRISA4 = 0;
	TRISAbits.TRISA2 = 0;
	PORTAbits.RA4 = 0;
	PORTAbits.RA2 = 1;

	//turn on AD, using 2.5V as reference for MAX_ADC, AN4 as temp input
    // note: the config 0x03 for ADCON1 configures the RA2 bit as analog, but since the tris bit is cleared, they behave as digital output 
	ADCON0=0xA1;	
	ADCON1=0x03;
		
	// turn on the temperature sensor
	TRISEbits.TRISE2 = 0;
	PORTEbits.RE2    = 1;

	delay_50us;	//acquisition time

	ADCON0bits.GO=1;
	while(ADCON0bits.GO)
		;
	
	temp_val = ADRESH;

	//turn off AD 
	ADCON0=0;

	// disable voltage ref
	PORTAbits.RA2 = 0;
	
	// disable temperature sensor
	PORTEbits.RE2    = 0;
	
	return temp_val;

}
// Hardware initialisation
void init(void) {

	// First some power management related stuff: make sure no pins are leaking when we're asleep
	//////////////////////////////////////////////////////////////////////////////////////////////

	// Set all ports that are not required to be input as output to be low-power (see PIC datasheet, section 'sleep mode')
	TRISA = 0x2B; // RA0, 1, 3, 5 are inputs
	TRISB = 0xF1; // Portb connected to progger, SDCARD and switch
	TRISC = 0x83; // Serial port RX pin on RC7, crystal on RC0/RC1
	TRISD = 0x00;
	TRISE = 0x02; // Radio busy pin on RE1

    // Drive IO's to known low-power state
	LED0=0;
	LED1=0;
	RDY=0;
	SDI = 1; // Pull-up resistor, make sure to drive this line high to avoid leakage
	SDO = 1; // Pull-up resistor, make sure to drive this line high to avoid leakage

	// Power of subsections of the system
	RADIO=1;	//turn radio off
	VCCTEMP=0;	//turn temp sensor off
	SDCARD=1;	//turn card off

	// Turn off internal pull-ups
	INTCON2bits.RBPU=1;		
	// Turn off WDT
	WDTCONbits.SWDTEN=0;
	// Turn off AD
	ADCON0bits.ADON=0;
	// Comparator off
	CMCON=0x7;



	// Then follow the regular subsystem init routines
	/////////////////////////////////////////////
	OpenUSART(	USART_TX_INT_OFF &
				USART_RX_INT_OFF &		
				USART_ASYNCH_MODE &
				USART_EIGHT_BIT &
				USART_CONT_RX &
				USART_BRGH_HIGH,64);

	IPR1bits.RCIP=0;	//set low priority for RX interrupt, will not be used anyway

	//timer1 32kHz sleep timer
	OpenTimer1(		TIMER_INT_ON	&
					T1_16BIT_RW		&
					T1_SOURCE_EXT	&
					T1_PS_1_8		&
					T1_OSC1EN_ON	&
					T1_SYNC_EXT_OFF);
	
	IPR1bits.TMR1IP=1;		//set high priority

	INTCONbits.INT0IE=0;	// no external interrupt

	//global interrupt activation
	RCONbits.IPEN = 1;	//enable priority
	INTCONbits.GIEH=1;	//enable hi priority
	INTCONbits.GIEL=0;	//enable lo priority
	
	return;
}

// Main program function
void main()
{
	unsigned char solar_value  = 0;
	unsigned char supply_value = 0;
	unsigned char temperature  = 0;
	unsigned char tx           = 0;
	unsigned char do_transmit  = 0;
	unsigned char tx_mode      = 0; // Selects if we transmit lightlevel/supply level or lightlevel/temperature

	// Hardware init
	init();



	// Main loop	
	while(1)
	{
		// Normally, we do transmit
		do_transmit = 1;
		
		// Get solar valuel
		solar_value = get_solar();

		// Get supply value
		supply_value = get_supply();

		// If we should transmit temperature and supply level is above 2.7V, measure temperature
		if (tx_mode == 1){
			temperature = get_temp();
		}

		// If the supply voltage is too low, we do not enable the radio to save power.
		// The radio works if VCC > 2.5V, the pic if VCC > 2 V. No need to drain the ultracap
		// when the radio is not working correctly.
		if (supply_value >= 0xFC) { do_transmit = 0; }
		
		// Make sure the value does not equal our end of line character '*'
		if (solar_value == '*'){
			solar_value+=1;
		}
		if (supply_value == '*'){
			supply_value+=1;
		}
		if (temperature == '*'){
			temperature+=1;
		}

		if (do_transmit) {

			//turn on USART interrupt
			//RDYtris=0;
			//TXtris=0;
			RCSTAbits.SPEN=1;	
			//PIE1bits.RCIE=1;

			//turn on radio
			RADIO=0;
			delay_10ms;
			delay_2ms;
			delay_2ms;

			//LEDRED=1;

			sendRADIO(0x01 + tx_mode);
			sendRADIO(solar_value);
			if (tx_mode == 0) { sendRADIO(supply_value); } else { sendRADIO(temperature); }
			sendRADIO('*');
			delay_20ms;
			delay_2ms;
			
			//turn off radio
			RADIO=1;
			//LEDRED=0;
			tx = 0;
			// Turn off serial port.
			RCSTAbits.SPEN=0;					
	
		}

		// Switch TX mode (see tx_mode definition above)
		if (tx_mode == 0) { tx_mode = 1; } else {tx_mode = 0;}

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
		char rxdata;
		rxdata=ReadUSART();
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
	}


	//Timer1 32kHz interrupt
	if(PIR1bits.TMR1IF)
	{
		PIR1bits.TMR1IF=0;
		WriteTimer1(0x1000);	//interrupt every 15 seconds when prescaler is 8
		
		sleepcounter++;
		if(sleepcounter==SLEEPTIME)
		{
			wakeup=1;
			sleepcounter=0;
		}
	}
}

