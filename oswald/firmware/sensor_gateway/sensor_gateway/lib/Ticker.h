//*****************************************************************************
//*****************************************************************************
//  FILENAME: Ticker.h
//   Version: 2.5, Updated on 2009/10/15 at 17:11:37
//  Generated by PSoC Designer 5.0.1127.0
//
//  DESCRIPTION: Counter16 User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2009. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************

#include <m8c.h>

#pragma fastcall16 Ticker_EnableInt
#pragma fastcall16 Ticker_DisableInt
#pragma fastcall16 Ticker_Start
#pragma fastcall16 Ticker_Stop
#pragma fastcall16 Ticker_wReadCounter              // Read  DR0
#pragma fastcall16 Ticker_WritePeriod               // Write DR1
#pragma fastcall16 Ticker_wReadCompareValue         // Read  DR2
#pragma fastcall16 Ticker_WriteCompareValue         // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 wTicker_ReadCounter              // Read  DR0 (Deprecated)
#pragma fastcall16 wTicker_ReadCompareValue         // Read  DR2 (Deprecated)

//-------------------------------------------------
// Prototypes of the Ticker API.
//-------------------------------------------------
extern void Ticker_EnableInt(void);                           // Proxy Class 1
extern void Ticker_DisableInt(void);                          // Proxy Class 1
extern void Ticker_Start(void);                               // Proxy Class 1
extern void Ticker_Stop(void);                                // Proxy Class 1
extern WORD Ticker_wReadCounter(void);                        // Proxy Class 2
extern void Ticker_WritePeriod(WORD wPeriod);                 // Proxy Class 1
extern WORD Ticker_wReadCompareValue(void);                   // Proxy Class 1
extern void Ticker_WriteCompareValue(WORD wCompareValue);     // Proxy Class 1

// The following functions are deprecated.
// They may be omitted in future releases
//
extern WORD wTicker_ReadCounter(void);            // Deprecated
extern WORD wTicker_ReadCompareValue(void);       // Deprecated


//--------------------------------------------------
// Constants for Ticker API's.
//--------------------------------------------------

#define Ticker_CONTROL_REG_START_BIT           ( 0x01 )
#define Ticker_INT_REG_ADDR                    ( 0x0df )
#define Ticker_INT_MASK                        ( 0x08 )


//--------------------------------------------------
// Constants for Ticker user defined values
//--------------------------------------------------

#define Ticker_PERIOD                          ( 0xffff )
#define Ticker_COMPARE_VALUE                   ( 0x1 )


//-------------------------------------------------
// Register Addresses for Ticker
//-------------------------------------------------

#pragma ioport  Ticker_COUNTER_LSB_REG: 0x048              //DR0 Counter register LSB
BYTE            Ticker_COUNTER_LSB_REG;
#pragma ioport  Ticker_COUNTER_MSB_REG: 0x04c              //DR0 Counter register MSB
BYTE            Ticker_COUNTER_MSB_REG;
#pragma ioport  Ticker_PERIOD_LSB_REG:  0x049              //DR1 Period register LSB
BYTE            Ticker_PERIOD_LSB_REG;
#pragma ioport  Ticker_PERIOD_MSB_REG:  0x04d              //DR1 Period register MSB
BYTE            Ticker_PERIOD_MSB_REG;
#pragma ioport  Ticker_COMPARE_LSB_REG: 0x04a              //DR2 Compare register LSB
BYTE            Ticker_COMPARE_LSB_REG;
#pragma ioport  Ticker_COMPARE_MSB_REG: 0x04e              //DR2 Compare register MSB
BYTE            Ticker_COMPARE_MSB_REG;
#pragma ioport  Ticker_CONTROL_LSB_REG: 0x04b              //Control register LSB
BYTE            Ticker_CONTROL_LSB_REG;
#pragma ioport  Ticker_CONTROL_MSB_REG: 0x04f              //Control register MSB
BYTE            Ticker_CONTROL_MSB_REG;
#pragma ioport  Ticker_FUNC_LSB_REG:    0x148              //Function register LSB
BYTE            Ticker_FUNC_LSB_REG;
#pragma ioport  Ticker_FUNC_MSB_REG:    0x14c              //Function register MSB
BYTE            Ticker_FUNC_MSB_REG;
#pragma ioport  Ticker_INPUT_LSB_REG:   0x149              //Input register LSB
BYTE            Ticker_INPUT_LSB_REG;
#pragma ioport  Ticker_INPUT_MSB_REG:   0x14d              //Input register MSB
BYTE            Ticker_INPUT_MSB_REG;
#pragma ioport  Ticker_OUTPUT_LSB_REG:  0x14a              //Output register LSB
BYTE            Ticker_OUTPUT_LSB_REG;
#pragma ioport  Ticker_OUTPUT_MSB_REG:  0x14e              //Output register MSB
BYTE            Ticker_OUTPUT_MSB_REG;
#pragma ioport  Ticker_INT_REG:       0x0df                //Interrupt Mask Register
BYTE            Ticker_INT_REG;


//-------------------------------------------------
// Ticker Macro 'Functions'
//-------------------------------------------------

#define Ticker_Start_M \
   ( Ticker_CONTROL_LSB_REG |=  Ticker_CONTROL_REG_START_BIT )

#define Ticker_Stop_M  \
   ( Ticker_CONTROL_LSB_REG &= ~Ticker_CONTROL_REG_START_BIT )

#define Ticker_EnableInt_M   \
   M8C_EnableIntMask(  Ticker_INT_REG, Ticker_INT_MASK )

#define Ticker_DisableInt_M  \
   M8C_DisableIntMask( Ticker_INT_REG, Ticker_INT_MASK )

// end of file Ticker.h
