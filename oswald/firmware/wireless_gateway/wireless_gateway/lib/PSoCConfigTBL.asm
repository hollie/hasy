; Generated by PSoC Designer ???
;
include "m8c.inc"
;  Personalization tables 
export LoadConfigTBL_wireless_gateway
AREA psoc_config(rom, rel)
LoadConfigTBL_wireless_gateway:
;  Ordered Global Register values
	M8C_SetBank1
	mov	reg[00h], 00h		; Port_0_DriveMode_0 register (PRT0DM0)
	mov	reg[01h], ffh		; Port_0_DriveMode_1 register (PRT0DM1)
	M8C_SetBank0
	mov	reg[03h], ffh		; Port_0_DriveMode_2 register (PRT0DM2)
	mov	reg[02h], 00h		; Port_0_GlobalSelect register (PRT0GS)
	M8C_SetBank1
	mov	reg[02h], 00h		; Port_0_IntCtrl_0 register (PRT0IC0)
	mov	reg[03h], 00h		; Port_0_IntCtrl_1 register (PRT0IC1)
	M8C_SetBank0
	mov	reg[01h], 00h		; Port_0_IntEn register (PRT0IE)
	M8C_SetBank1
	mov	reg[04h], 40h		; Port_1_DriveMode_0 register (PRT1DM0)
	mov	reg[05h], bfh		; Port_1_DriveMode_1 register (PRT1DM1)
	M8C_SetBank0
	mov	reg[07h], bbh		; Port_1_DriveMode_2 register (PRT1DM2)
	mov	reg[06h], 44h		; Port_1_GlobalSelect register (PRT1GS)
	M8C_SetBank1
	mov	reg[06h], 00h		; Port_1_IntCtrl_0 register (PRT1IC0)
	mov	reg[07h], 00h		; Port_1_IntCtrl_1 register (PRT1IC1)
	M8C_SetBank0
	mov	reg[05h], 00h		; Port_1_IntEn register (PRT1IE)
	M8C_SetBank1
	mov	reg[08h], 00h		; Port_2_DriveMode_0 register (PRT2DM0)
	mov	reg[09h], ffh		; Port_2_DriveMode_1 register (PRT2DM1)
	M8C_SetBank0
	mov	reg[0bh], ffh		; Port_2_DriveMode_2 register (PRT2DM2)
	mov	reg[0ah], 00h		; Port_2_GlobalSelect register (PRT2GS)
	M8C_SetBank1
	mov	reg[0ah], 00h		; Port_2_IntCtrl_0 register (PRT2IC0)
	mov	reg[0bh], 00h		; Port_2_IntCtrl_1 register (PRT2IC1)
	M8C_SetBank0
	mov	reg[09h], 00h		; Port_2_IntEn register (PRT2IE)
	M8C_SetBank1
	mov	reg[0ch], 00h		; Port_3_DriveMode_0 register (PRT3DM0)
	mov	reg[0dh], ffh		; Port_3_DriveMode_1 register (PRT3DM1)
	M8C_SetBank0
	mov	reg[0fh], ffh		; Port_3_DriveMode_2 register (PRT3DM2)
	mov	reg[0eh], 00h		; Port_3_GlobalSelect register (PRT3GS)
	M8C_SetBank1
	mov	reg[0eh], 00h		; Port_3_IntCtrl_0 register (PRT3IC0)
	mov	reg[0fh], 00h		; Port_3_IntCtrl_1 register (PRT3IC1)
	M8C_SetBank0
	mov	reg[0dh], 00h		; Port_3_IntEn register (PRT3IE)
	M8C_SetBank1
	mov	reg[10h], 04h		; Port_4_DriveMode_0 register (PRT4DM0)
	mov	reg[11h], fbh		; Port_4_DriveMode_1 register (PRT4DM1)
	M8C_SetBank0
	mov	reg[13h], efh		; Port_4_DriveMode_2 register (PRT4DM2)
	mov	reg[12h], 14h		; Port_4_GlobalSelect register (PRT4GS)
	M8C_SetBank1
	mov	reg[12h], 00h		; Port_4_IntCtrl_0 register (PRT4IC0)
	mov	reg[13h], 00h		; Port_4_IntCtrl_1 register (PRT4IC1)
	M8C_SetBank0
	mov	reg[11h], 00h		; Port_4_IntEn register (PRT4IE)
	M8C_SetBank1
	mov	reg[14h], 00h		; Port_5_DriveMode_0 register (PRT5DM0)
	mov	reg[15h], 00h		; Port_5_DriveMode_1 register (PRT5DM1)
	M8C_SetBank0
	mov	reg[17h], 00h		; Port_5_DriveMode_2 register (PRT5DM2)
	mov	reg[16h], 00h		; Port_5_GlobalSelect register (PRT5GS)
	M8C_SetBank1
	mov	reg[16h], 00h		; Port_5_IntCtrl_0 register (PRT5IC0)
	mov	reg[17h], 00h		; Port_5_IntCtrl_1 register (PRT5IC1)
	M8C_SetBank0
	mov	reg[15h], 00h		; Port_5_IntEn register (PRT5IE)
	M8C_SetBank1
	mov	reg[18h], 00h		; Port_6_DriveMode_0 register (PRT6DM0)
	mov	reg[19h], 00h		; Port_6_DriveMode_1 register (PRT6DM1)
	M8C_SetBank0
	mov	reg[1bh], 00h		; Port_6_DriveMode_2 register (PRT6DM2)
	mov	reg[1ah], 00h		; Port_6_GlobalSelect register (PRT6GS)
	M8C_SetBank1
	mov	reg[1ah], 00h		; Port_6_IntCtrl_0 register (PRT6IC0)
	mov	reg[1bh], 00h		; Port_6_IntCtrl_1 register (PRT6IC1)
	M8C_SetBank0
	mov	reg[19h], 00h		; Port_6_IntEn register (PRT6IE)
	M8C_SetBank1
	mov	reg[1ch], 00h		; Port_7_DriveMode_0 register (PRT7DM0)
	mov	reg[1dh], 00h		; Port_7_DriveMode_1 register (PRT7DM1)
	M8C_SetBank0
	mov	reg[1fh], 00h		; Port_7_DriveMode_2 register (PRT7DM2)
	mov	reg[1eh], 00h		; Port_7_GlobalSelect register (PRT7GS)
	M8C_SetBank1
	mov	reg[1eh], 00h		; Port_7_IntCtrl_0 register (PRT7IC0)
	mov	reg[1fh], 00h		; Port_7_IntCtrl_1 register (PRT7IC1)
	M8C_SetBank0
	mov	reg[1dh], 00h		; Port_7_IntEn register (PRT7IE)
	M8C_SetBank0
;  Global Register values
	mov	reg[60h], 28h		; AnalogColumnInputSelect register (AMX_IN)
	mov	reg[66h], 00h		; AnalogComparatorControl1 register (CMP_CR1)
	mov	reg[63h], 05h		; AnalogReferenceControl register (ARF_CR)
	mov	reg[65h], 00h		; AnalogSyncControl register (ASY_CR)
	mov	reg[e6h], 00h		; DecimatorControl_0 register (DEC_CR0)
	mov	reg[e7h], 00h		; DecimatorControl_1 register (DEC_CR1)
	mov	reg[d6h], 00h		; I2CConfig register (I2CCFG)
	mov	reg[b0h], 01h		; Row_0_InputMux register (RDI0RI)
	mov	reg[b1h], 00h		; Row_0_InputSync register (RDI0SYN)
	mov	reg[b2h], 00h		; Row_0_LogicInputAMux register (RDI0IS)
	mov	reg[b3h], 33h		; Row_0_LogicSelect_0 register (RDI0LT0)
	mov	reg[b4h], 33h		; Row_0_LogicSelect_1 register (RDI0LT1)
	mov	reg[b5h], 00h		; Row_0_OutputDrive_0 register (RDI0SRO0)
	mov	reg[b6h], 00h		; Row_0_OutputDrive_1 register (RDI0SRO1)
	mov	reg[b8h], 65h		; Row_1_InputMux register (RDI1RI)
	mov	reg[b9h], 00h		; Row_1_InputSync register (RDI1SYN)
	mov	reg[bah], 10h		; Row_1_LogicInputAMux register (RDI1IS)
	mov	reg[bbh], 33h		; Row_1_LogicSelect_0 register (RDI1LT0)
	mov	reg[bch], 33h		; Row_1_LogicSelect_1 register (RDI1LT1)
	mov	reg[bdh], 00h		; Row_1_OutputDrive_0 register (RDI1SRO0)
	mov	reg[beh], 08h		; Row_1_OutputDrive_1 register (RDI1SRO1)
	mov	reg[c0h], 00h		; Row_2_InputMux register (RDI2RI)
	mov	reg[c1h], 00h		; Row_2_InputSync register (RDI2SYN)
	mov	reg[c2h], 20h		; Row_2_LogicInputAMux register (RDI2IS)
	mov	reg[c3h], 33h		; Row_2_LogicSelect_0 register (RDI2LT0)
	mov	reg[c4h], 33h		; Row_2_LogicSelect_1 register (RDI3LT1)
	mov	reg[c5h], 00h		; Row_2_OutputDrive_0 register (RDI2SRO0)
	mov	reg[c6h], 00h		; Row_2_OutputDrive_1 register (RDI2SRO1)
	mov	reg[c8h], 55h		; Row_3_InputMux register (RDI3RI)
	mov	reg[c9h], 00h		; Row_3_InputSync register (RDI3SYN)
	mov	reg[cah], 30h		; Row_3_LogicInputAMux register (RDI3IS)
	mov	reg[cbh], 33h		; Row_3_LogicSelect_0 register (RDI3LT0)
	mov	reg[cch], 33h		; Row_3_LogicSelect_1 register (RDI3LT1)
	mov	reg[cdh], 00h		; Row_3_OutputDrive_0 register (RDI3SRO0)
	mov	reg[ceh], 00h		; Row_3_OutputDrive_1 register (RDI3SRO1)
	mov	reg[6ch], 00h		; TMP_DR0 register (TMP_DR0)
	mov	reg[6dh], 00h		; TMP_DR1 register (TMP_DR1)
	mov	reg[6eh], 00h		; TMP_DR2 register (TMP_DR2)
	mov	reg[6fh], 00h		; TMP_DR3 register (TMP_DR3)
;  Instance name Counter8, User Module Counter8
;       Instance name Counter8, Block Name CNTR8(DBB00)
	mov	reg[23h], 00h		;Counter8_CONTROL_REG(DBB00CR0)
	mov	reg[21h], 27h		;Counter8_PERIOD_REG(DBB00DR1)
	mov	reg[22h], 13h		;Counter8_COMPARE_REG(DBB00DR2)
;  Instance name Counter8_ltrx, User Module Counter8
;       Instance name Counter8_ltrx, Block Name CNTR8(DBB10)
	mov	reg[33h], 00h		;Counter8_ltrx_CONTROL_REG(DBB10CR0)
	mov	reg[31h], 27h		;Counter8_ltrx_PERIOD_REG(DBB10DR1)
	mov	reg[32h], 13h		;Counter8_ltrx_COMPARE_REG(DBB10DR2)
;  Instance name LTRX, User Module UART
;       Instance name LTRX, Block Name RX(DCB13)
	mov	reg[3fh], 00h		;LTRX_RX_CONTROL_REG(DCB13CR0)
	mov	reg[3dh], 00h		;LTRX_(DCB13DR1)
	mov	reg[3eh], 00h		;LTRX_RX_BUFFER_REG (DCB13DR2)
;       Instance name LTRX, Block Name TX(DCB12)
	mov	reg[3bh], 00h		;LTRX_TX_CONTROL_REG(DCB12CR0)
	mov	reg[39h], 00h		;LTRX_TX_BUFFER_REG (DCB12DR1)
	mov	reg[3ah], 00h		;LTRX_(DCB12DR2)
;  Instance name UART_IN, User Module UART
;       Instance name UART_IN, Block Name RX(DCB03)
	mov	reg[2fh], 00h		;UART_IN_RX_CONTROL_REG(DCB03CR0)
	mov	reg[2dh], 00h		;UART_IN_(DCB03DR1)
	mov	reg[2eh], 00h		;UART_IN_RX_BUFFER_REG (DCB03DR2)
;       Instance name UART_IN, Block Name TX(DCB02)
	mov	reg[2bh], 00h		;UART_IN_TX_CONTROL_REG(DCB02CR0)
	mov	reg[29h], 00h		;UART_IN_TX_BUFFER_REG (DCB02DR1)
	mov	reg[2ah], 00h		;UART_IN_(DCB02DR2)
	M8C_SetBank1
;  Global Register values
	mov	reg[61h], 00h		; AnalogClockSelect1 register (CLK_CR1)
	mov	reg[69h], 00h		; AnalogClockSelect2 register (CLK_CR2)
	mov	reg[60h], 00h		; AnalogColumnClockSelect register (CLK_CR0)
	mov	reg[62h], 00h		; AnalogIOControl_0 register (ABF_CR0)
	mov	reg[67h], 33h		; AnalogLUTControl0 register (ALT_CR0)
	mov	reg[68h], 33h		; AnalogLUTControl1 register (ALT_CR1)
	mov	reg[63h], 00h		; AnalogModulatorControl_0 register (AMD_CR0)
	mov	reg[66h], 00h		; AnalogModulatorControl_1 register (AMD_CR1)
	mov	reg[d1h], 00h		; GlobalDigitalInterconnect_Drive_Even_Input register (GDI_E_IN)
	mov	reg[d3h], 00h		; GlobalDigitalInterconnect_Drive_Even_Output register (GDI_E_OU)
	mov	reg[d0h], 00h		; GlobalDigitalInterconnect_Drive_Odd_Input register (GDI_O_IN)
	mov	reg[d2h], 00h		; GlobalDigitalInterconnect_Drive_Odd_Output register (GDI_O_OU)
	mov	reg[e1h], 30h		; OscillatorControl_1 register (OSC_CR1)
	mov	reg[e2h], 00h		; OscillatorControl_2 register (OSC_CR2)
	mov	reg[dfh], 00h		; OscillatorControl_3 register (OSC_CR3)
	mov	reg[deh], 00h		; OscillatorControl_4 register (OSC_CR4)
	mov	reg[ddh], 00h		; OscillatorGlobalBusEnableControl register (OSC_GO_EN)
	mov	reg[e7h], 00h		; Type2Decimator_Control register (DEC_CR2)
;  Instance name Counter8, User Module Counter8
;       Instance name Counter8, Block Name CNTR8(DBB00)
	mov	reg[20h], 61h		;Counter8_FUNC_REG(DBB00FN)
	mov	reg[21h], 15h		;Counter8_INPUT_REG(DBB00IN)
	mov	reg[22h], 40h		;Counter8_OUTPUT_REG(DBB00OU)
;  Instance name Counter8_ltrx, User Module Counter8
;       Instance name Counter8_ltrx, Block Name CNTR8(DBB10)
	mov	reg[30h], 61h		;Counter8_ltrx_FUNC_REG(DBB10FN)
	mov	reg[31h], 15h		;Counter8_ltrx_INPUT_REG(DBB10IN)
	mov	reg[32h], 40h		;Counter8_ltrx_OUTPUT_REG(DBB10OU)
;  Instance name LTRX, User Module UART
;       Instance name LTRX, Block Name RX(DCB13)
	mov	reg[3ch], 05h		;LTRX_RX_FUNC_REG   (DCB13FN)
	mov	reg[3dh], e2h		;LTRX_RX_INPUT_REG  (DCB13IN)
	mov	reg[3eh], 40h		;LTRX_RX_OUTPUT_REG (DCB13OU)
;       Instance name LTRX, Block Name TX(DCB12)
	mov	reg[38h], 1dh		;LTRX_TX_FUNC_REG   (DCB12FN)
	mov	reg[39h], 02h		;LTRX_TX_INPUT_REG  (DCB12IN)
	mov	reg[3ah], 46h		;LTRX_TX_OUTPUT_REG (DCB12OU)
;  Instance name UART_IN, User Module UART
;       Instance name UART_IN, Block Name RX(DCB03)
	mov	reg[2ch], 05h		;UART_IN_RX_FUNC_REG   (DCB03FN)
	mov	reg[2dh], c2h		;UART_IN_RX_INPUT_REG  (DCB03IN)
	mov	reg[2eh], 40h		;UART_IN_RX_OUTPUT_REG (DCB03OU)
;       Instance name UART_IN, Block Name TX(DCB02)
	mov	reg[28h], 1dh		;UART_IN_TX_FUNC_REG   (DCB02FN)
	mov	reg[29h], 02h		;UART_IN_TX_INPUT_REG  (DCB02IN)
	mov	reg[2ah], 40h		;UART_IN_TX_OUTPUT_REG (DCB02OU)
	M8C_SetBank0
	ret


; PSoC Configuration file trailer PsocConfig.asm
