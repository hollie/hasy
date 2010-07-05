;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: Counter8_ltrxINT.asm
;;   Version: 2.5, Updated on 2009/10/15 at 17:11:37
;;  Generated by PSoC Designer 5.0.1127.0
;;
;;  DESCRIPTION: Counter8 Interrupt Service Routine
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2009. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"
include "Counter8_ltrx.inc"


;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
export  _Counter8_ltrx_ISR


AREA InterruptRAM (RAM,REL,CON)

;@PSoC_UserCode_INIT@ (Do not change this line.)
;---------------------------------------------------
; Insert your custom declarations below this banner
;---------------------------------------------------

;------------------------
; Includes
;------------------------

	
;------------------------
;  Constant Definitions
;------------------------


;------------------------
; Variable Allocation
;------------------------


;---------------------------------------------------
; Insert your custom declarations above this banner
;---------------------------------------------------
;@PSoC_UserCode_END@ (Do not change this line.)


AREA UserModules (ROM, REL)

;-----------------------------------------------------------------------------
;  FUNCTION NAME: _Counter8_ltrx_ISR
;
;  DESCRIPTION: Unless modified, this implements only a null handler stub.
;
;-----------------------------------------------------------------------------
;

_Counter8_ltrx_ISR:

   ;@PSoC_UserCode_BODY@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.

   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti


; end of file Counter8_ltrxINT.asm
