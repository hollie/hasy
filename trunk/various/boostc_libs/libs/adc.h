/*************************************************************
* ADC interface for the internal PIC16F ADC units
*
* (C) 2005-2006, L. Hollevoet, BoostC compiler,
*                http://boostc.lika.be
*
* Adapted to use in SourceBoost installation by Pavel Baranov
* (C) 2006, Pavel Baranov, David Hobday
*************************************************************/

#ifndef _ADC_H_
#define _ADC_H_

#ifdef GO
volatile bit adc_go @ ADCON0 . GO;
#else
	volatile bit adc_go @ ADCON0 . GO_DONE;
#endif
 
void adc_init(void);
short adc_measure(char channel);

#endif  // _ADC_H_
