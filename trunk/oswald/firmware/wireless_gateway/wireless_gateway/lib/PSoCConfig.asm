; Generated by PSoC Designer ???
;
;==========================================================================
;  PSoCConfig.asm
;  @PSOC_VERSION
;
;  Version: 0.85
;  Revised: June 22, 2004
;  Copyright Cypress MicroSystems 2000-2004. All Rights Reserved.
;
;  This file is generated by the Device Editor on Application Generation.
;  It contains code which loads the configuration data table generated in
;  the file PSoCConfigTBL.asm
;
;  DO NOT EDIT THIS FILE MANUALLY, AS IT IS OVERWRITTEN!!!
;  Edits to this file will not be preserved.
;==========================================================================
;
include "m8c.inc"
include "memory.inc"
include "GlobalParams.inc"

export LoadConfigInit
export _LoadConfigInit
export LoadConfig_wireless_gateway
export _LoadConfig_wireless_gateway

export NO_SHADOW
export _NO_SHADOW

FLAG_CFG_MASK:      equ 10h         ;M8C flag register REG address bit mask
END_CONFIG_TABLE:   equ ffh         ;end of config table indicator

AREA psoc_config(rom, rel)


;---------------------------------------------------------------------------
; LoadConfigInit - Establish the start-up configuration (except for a few
;                  parameters handled by boot code, like CPU speed). This
;                  function can be called from user code, but typically it
;                  is only called from boot.
;
;       INPUTS: None.
;      RETURNS: Nothing.
; SIDE EFFECTS: Registers are volatile: the A and X registers can be modified!
;               In the large memory model currently only the page
;               pointer registers listed below are modified.  This does
;               not guarantee that in future implementations of this
;               function other page pointer registers will not be
;               modified.
;          
;               Page Pointer Registers Modified: 
;               CUR_PP
;
_LoadConfigInit:
 LoadConfigInit:
    RAM_PROLOGUE RAM_USE_CLASS_4
    
	lcall	LoadConfig_wireless_gateway


    RAM_EPILOGUE RAM_USE_CLASS_4
    ret

;---------------------------------------------------------------------------
; Load Configuration wireless_gateway
;
;    Load configuration registers for wireless_gateway.
;    IO Bank 0 registers a loaded first,then those in IO Bank 1.
;
;       INPUTS: None.
;      RETURNS: Nothing.
; SIDE EFFECTS: Registers are volatile: the CPU A and X registers may be
;               modified as may the Page Pointer registers!
;               In the large memory model currently only the page
;               pointer registers listed below are modified.  This does
;               not guarantee that in future implementations of this
;               function other page pointer registers will not be
;               modified.
;          
;               Page Pointer Registers Modified: 
;               CUR_PP
;
_LoadConfig_wireless_gateway:
 LoadConfig_wireless_gateway:
    RAM_PROLOGUE RAM_USE_CLASS_4
    lcall   LoadConfigTBL_wireless_gateway            ; Call load config table routine


    M8C_SetBank0                    ; Force return to bank 0
    RAM_EPILOGUE RAM_USE_CLASS_4
    ret



AREA InterruptRAM(ram, rel)

NO_SHADOW:
_NO_SHADOW:
