; Generated by PSoC Designer 5.0.1127.0
;
; LED1Pin address and mask equates
LED1Pin_Data_ADDR:	equ	ch
LED1Pin_DriveMode_0_ADDR:	equ	10ch
LED1Pin_DriveMode_1_ADDR:	equ	10dh
LED1Pin_DriveMode_2_ADDR:	equ	fh
LED1Pin_GlobalSelect_ADDR:	equ	eh
LED1Pin_IntCtrl_0_ADDR:	equ	10eh
LED1Pin_IntCtrl_1_ADDR:	equ	10fh
LED1Pin_IntEn_ADDR:	equ	dh
LED1Pin_MASK:	equ	80h
; LED1Pin_Data access macros
;   GetLED1Pin_Data macro, return in a
macro GetLED1Pin_Data
	mov		a,[Port_3_Data_SHADE]
	and		a, 80h
endm
;   SetLED1Pin_Data macro
macro SetLED1Pin_Data
	or		[Port_3_Data_SHADE], 80h
	mov		a, [Port_3_Data_SHADE]
	mov		reg[LED1Pin_Data_ADDR], a
endm
;   ClearLED1Pin_Data macro
macro ClearLED1Pin_Data
	and		[Port_3_Data_SHADE], ~80h
	mov		a, [Port_3_Data_SHADE]
	mov		reg[LED1Pin_Data_ADDR], a
endm

