// board port definitions
//LEDs
#define LED0tris TRISDbits.TRISD0
#define LED1tris TRISDbits.TRISD1
#define LED0 PORTDbits.RD1	//LEDs are swapped
#define LED1 PORTDbits.RD0
#define LEDGREEN LED0
#define LEDRED LED1

//ER400TRX
#define BSYtris TRISEbits.TRISE1
#define RDYtris TRISEbits.TRISE0
#define TXtris TRISCbits.TRISC6
#define RXtris TRISCbits.TRISC7
#define RSSItris TRISAbits.TRISA0
#define RADIOtris TRISDbits.TRISD2
#define BSY PORTEbits.RE1
#define RDY PORTEbits.RE0
#define TX PORTCbits.RC6
#define RX PORTCbits.RC7
#define RSSI PORTAbits.RA0
#define RADIO PORTDbits.RD2
//DIP
#define DIP0tris TRISDbits.TRISD4
#define DIP1tris TRISDbits.TRISD5
#define DIP2tris TRISDbits.TRISD6
#define DIP3tris TRISDbits.TRISD7
#define DIP0 PORTDbits.RD4
#define DIP1 PORTDbits.RD5
#define DIP2 PORTDbits.RD6
#define DIP3 PORTDbits.RD7
//switch
#define SWITCHtris TRISBbits.TRISB0
#define SWITCH PORTBbits.RB0
//SD card
#define PROTECTtris TRISBbits.TRISB4 
#define DETECTtris TRISBbits.TRISB5
#define SDCARDtris TRISDbits.TRISD3
#define SDItris TRISCbits.TRISC4
#define SDOtris TRISCbits.TRISC5
#define SCKtris TRISCbits.TRISC3
#define CStris TRISCbits.TRISC2
#define PROTECT PORTBbits.RB4 
#define DETECT PORTBbits.RB5
#define SDCARD PORTDbits.RD3
#define SDI PORTCbits.RC4
#define SDO PORTCbits.RC5
#define SCK PORTCbits.RC3
#define CS PORTCbits.RC2
//TEMP 
#define TEMPtris TRISAbits.TRISA5
#define TEMP PORTAbits.RA5
#define VCCTEMPtris TRISEbits.TRISE2
#define VCCTEMP PORTEbits.RE2
//REF
#define REFtris TRISBbits.TRISB3
#define REF PORTBbits.RB3
//SUPPLY
#define SUPtris TRISBbits.TRISB2
#define SUP PORTBbits.RB2
