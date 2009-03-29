;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 6.81
;// License Type  : Full License
;// Limitations   : PIC18 max code size:Unlimited, max RAM banks:Unlimited, Non commercial use only
;/////////////////////////////////////////////////////////////////////////////////

	include "P18F2320.inc"
__HEAPSTART                      EQU	0x000000BA ; Start address of heap 
__HEAPEND                        EQU	0x000001FF ; End address of heap 
gbl_porta                        EQU	0x00000F80 ; bytes:1
gbl_portb                        EQU	0x00000F81 ; bytes:1
gbl_portc                        EQU	0x00000F82 ; bytes:1
gbl_lata                         EQU	0x00000F89 ; bytes:1
gbl_latb                         EQU	0x00000F8A ; bytes:1
gbl_latc                         EQU	0x00000F8B ; bytes:1
gbl_trisa                        EQU	0x00000F92 ; bytes:1
gbl_trisb                        EQU	0x00000F93 ; bytes:1
gbl_trisc                        EQU	0x00000F94 ; bytes:1
gbl_osctune                      EQU	0x00000F9B ; bytes:1
gbl_pie1                         EQU	0x00000F9D ; bytes:1
gbl_pir1                         EQU	0x00000F9E ; bytes:1
gbl_ipr1                         EQU	0x00000F9F ; bytes:1
gbl_pie2                         EQU	0x00000FA0 ; bytes:1
gbl_pir2                         EQU	0x00000FA1 ; bytes:1
gbl_ipr2                         EQU	0x00000FA2 ; bytes:1
gbl_eecon1                       EQU	0x00000FA6 ; bytes:1
gbl_eecon2                       EQU	0x00000FA7 ; bytes:1
gbl_eedata                       EQU	0x00000FA8 ; bytes:1
gbl_eeadr                        EQU	0x00000FA9 ; bytes:1
gbl_rcsta                        EQU	0x00000FAB ; bytes:1
gbl_txsta                        EQU	0x00000FAC ; bytes:1
gbl_txreg                        EQU	0x00000FAD ; bytes:1
gbl_rcreg                        EQU	0x00000FAE ; bytes:1
gbl_spbrg                        EQU	0x00000FAF ; bytes:1
gbl_t3con                        EQU	0x00000FB1 ; bytes:1
gbl_tmr3l                        EQU	0x00000FB2 ; bytes:1
gbl_tmr3h                        EQU	0x00000FB3 ; bytes:1
gbl_cmcon                        EQU	0x00000FB4 ; bytes:1
gbl_cvrcon                       EQU	0x00000FB5 ; bytes:1
gbl_ccp2con                      EQU	0x00000FBA ; bytes:1
gbl_ccpr2l                       EQU	0x00000FBB ; bytes:1
gbl_ccpr2h                       EQU	0x00000FBC ; bytes:1
gbl_ccp1con                      EQU	0x00000FBD ; bytes:1
gbl_ccpr1l                       EQU	0x00000FBE ; bytes:1
gbl_ccpr1h                       EQU	0x00000FBF ; bytes:1
gbl_adcon2                       EQU	0x00000FC0 ; bytes:1
gbl_adcon1                       EQU	0x00000FC1 ; bytes:1
gbl_adcon0                       EQU	0x00000FC2 ; bytes:1
gbl_adresl                       EQU	0x00000FC3 ; bytes:1
gbl_adresh                       EQU	0x00000FC4 ; bytes:1
gbl_sspcon2                      EQU	0x00000FC5 ; bytes:1
gbl_sspcon1                      EQU	0x00000FC6 ; bytes:1
gbl_sspstat                      EQU	0x00000FC7 ; bytes:1
gbl_sspadd                       EQU	0x00000FC8 ; bytes:1
gbl_sspbuf                       EQU	0x00000FC9 ; bytes:1
gbl_t2con                        EQU	0x00000FCA ; bytes:1
gbl_pr2                          EQU	0x00000FCB ; bytes:1
gbl_tmr2                         EQU	0x00000FCC ; bytes:1
gbl_t1con                        EQU	0x00000FCD ; bytes:1
gbl_tmr1l                        EQU	0x00000FCE ; bytes:1
gbl_tmr1h                        EQU	0x00000FCF ; bytes:1
gbl_rcon                         EQU	0x00000FD0 ; bytes:1
gbl_wdtcon                       EQU	0x00000FD1 ; bytes:1
gbl_lvdcon                       EQU	0x00000FD2 ; bytes:1
gbl_osccon                       EQU	0x00000FD3 ; bytes:1
gbl_t0con                        EQU	0x00000FD5 ; bytes:1
gbl_tmr0l                        EQU	0x00000FD6 ; bytes:1
gbl_tmr0h                        EQU	0x00000FD7 ; bytes:1
gbl_status                       EQU	0x00000FD8 ; bytes:1
gbl_fsr2l                        EQU	0x00000FD9 ; bytes:1
gbl_fsr2h                        EQU	0x00000FDA ; bytes:1
gbl_plusw2                       EQU	0x00000FDB ; bytes:1
gbl_preinc2                      EQU	0x00000FDC ; bytes:1
gbl_postdec2                     EQU	0x00000FDD ; bytes:1
gbl_postinc2                     EQU	0x00000FDE ; bytes:1
gbl_indf2                        EQU	0x00000FDF ; bytes:1
gbl_bsr                          EQU	0x00000FE0 ; bytes:1
gbl_fsr1l                        EQU	0x00000FE1 ; bytes:1
gbl_fsr1h                        EQU	0x00000FE2 ; bytes:1
gbl_plusw1                       EQU	0x00000FE3 ; bytes:1
gbl_preinc1                      EQU	0x00000FE4 ; bytes:1
gbl_postdec1                     EQU	0x00000FE5 ; bytes:1
gbl_postinc1                     EQU	0x00000FE6 ; bytes:1
gbl_indf1                        EQU	0x00000FE7 ; bytes:1
gbl_wreg                         EQU	0x00000FE8 ; bytes:1
gbl_fsr0l                        EQU	0x00000FE9 ; bytes:1
gbl_fsr0h                        EQU	0x00000FEA ; bytes:1
gbl_plusw0                       EQU	0x00000FEB ; bytes:1
gbl_preinc0                      EQU	0x00000FEC ; bytes:1
gbl_postdec0                     EQU	0x00000FED ; bytes:1
gbl_postinc0                     EQU	0x00000FEE ; bytes:1
gbl_indf0                        EQU	0x00000FEF ; bytes:1
gbl_intcon3                      EQU	0x00000FF0 ; bytes:1
gbl_intcon2                      EQU	0x00000FF1 ; bytes:1
gbl_intcon                       EQU	0x00000FF2 ; bytes:1
gbl_prodl                        EQU	0x00000FF3 ; bytes:1
gbl_prodh                        EQU	0x00000FF4 ; bytes:1
gbl_tablat                       EQU	0x00000FF5 ; bytes:1
gbl_tblptrl                      EQU	0x00000FF6 ; bytes:1
gbl_tblptrh                      EQU	0x00000FF7 ; bytes:1
gbl_tblptru                      EQU	0x00000FF8 ; bytes:1
gbl_pcl                          EQU	0x00000FF9 ; bytes:1
gbl_pclath                       EQU	0x00000FFA ; bytes:1
gbl_pclatu                       EQU	0x00000FFB ; bytes:1
gbl_stkptr                       EQU	0x00000FFC ; bytes:1
gbl_tosl                         EQU	0x00000FFD ; bytes:1
gbl_tosh                         EQU	0x00000FFE ; bytes:1
gbl_tosu                         EQU	0x00000FFF ; bytes:1
gbl_tmr1if                       EQU	0x00000F9E ; bit:0
tmr1_setup_00000_arg_irq_mode    EQU	0x00000078 ; bytes:1
tmr1_set_00000_arg_value         EQU	0x0000007B ; bytes:2
CompTempVarRet119                EQU	0x000000A0 ; bytes:2
tmr1_value_00000_1_value         EQU	0x0000007D ; bytes:2
gbl_stat0                        EQU	0x00000F80 ; bit:4
gbl_uvr_data                     EQU	0x00000F82 ; bit:2
gbl_interrupt_count              EQU	0x0000004B ; bytes:2
init_00000_1_blink_count         EQU	0x00000056 ; bytes:1
CompTempVar120                   EQU	0x00000057 ; bytes:1
CompTempVar121                   EQU	0x00000080 ; bytes:31
report_and_00022_1_count_shadow  EQU	0x00000056 ; bytes:2
CompTempVar123                   EQU	0x00000062 ; bytes:13
CompTempVar125                   EQU	0x00000059 ; bytes:4
main_1_tmp                       EQU	0x00000051 ; bytes:1
main_1_command_byte              EQU	0x00000052 ; bytes:1
main_1_valid_data                EQU	0x00000053 ; bytes:1
main_1_prev_count                EQU	0x00000054 ; bytes:2
CompTempVar127                   EQU	0x00000080 ; bytes:56
CompTempVar129                   EQU	0x00000062 ; bytes:13
CompTempVar131                   EQU	0x00000056 ; bytes:4
serial_ini_00007_arg_brg         EQU	0x00000058 ; bytes:1
serial_pri_00009_arg_value       EQU	0x000000B9 ; bytes:1
serial_pri_00008_arg_text        EQU	0x00000060 ; bytes:2
serial_pri_00008_1_i             EQU	0x000000B8 ; bytes:1
serial_pri_0000D_arg_number      EQU	0x0000005C ; bytes:1
serial_pri_0000D_1_hexChar       EQU	0x0000005D ; bytes:1
serial_pri_0000D_1_i             EQU	0x0000005E ; bytes:1
serial_pri_0000B_arg_value       EQU	0x00000058 ; bytes:2
serial_pri_0000B_1_value1        EQU	0x0000005A ; bytes:1
serial_pri_0000B_1_value0        EQU	0x0000005B ; bytes:1
serial_pri_0000E_arg_number      EQU	0x00000060 ; bytes:1
CompTempVar138                   EQU	0x00000065 ; bytes:1
CompTempVar140                   EQU	0x00000065 ; bytes:1
CompTempVar142                   EQU	0x00000061 ; bytes:1
serial_pri_0000F_arg_number      EQU	0x0000005D ; bytes:2
CompTempVar148                   EQU	0x00000067 ; bytes:1
CompTempVar149                   EQU	0x00000068 ; bytes:1
CompTempVar150                   EQU	0x00000069 ; bytes:1
CompTempVar151                   EQU	0x0000006A ; bytes:1
CompTempVar157                   EQU	0x00000067 ; bytes:1
CompTempVar158                   EQU	0x00000068 ; bytes:1
CompTempVar159                   EQU	0x00000069 ; bytes:1
CompTempVar160                   EQU	0x0000006A ; bytes:1
CompTempVar166                   EQU	0x00000067 ; bytes:1
CompTempVar167                   EQU	0x00000068 ; bytes:1
CompTempVar168                   EQU	0x00000069 ; bytes:1
CompTempVar169                   EQU	0x0000006A ; bytes:1
CompTempVar175                   EQU	0x00000067 ; bytes:1
CompTempVar176                   EQU	0x00000068 ; bytes:1
CompTempVar177                   EQU	0x00000069 ; bytes:1
CompTempVar178                   EQU	0x0000006A ; bytes:1
CompTempVar179                   EQU	0x00000062 ; bytes:2
CompTempVar181                   EQU	0x00000062 ; bytes:2
CompTempVar185                   EQU	0x0000005F ; bytes:1
CompTempVar186                   EQU	0x00000060 ; bytes:1
serial_pri_00010_arg_number      EQU	0x00000057 ; bytes:1
serial_pri_00010_arg_positions   EQU	0x00000058 ; bytes:1
CompTempVar188                   EQU	0x00000059 ; bytes:1
CompTempVar190                   EQU	0x00000059 ; bytes:1
CompTempVar192                   EQU	0x00000059 ; bytes:1
CompTempVarRet193                EQU	0x00000056 ; bytes:1
CompTempVar195                   EQU	0x00000059 ; bytes:5
gbl_ta_uvr_gotbit                EQU	0x0000004D ; bit:0
gbl_mydata                       EQU	0x00000005 ; bytes:35
gbl_data_cache                   EQU	0x00000028 ; bytes:35
gbl_ta_uvr_tmrl                  EQU	0x0000004E ; bytes:1
gbl_ta_uvr_tmrh                  EQU	0x0000004F ; bytes:1
gbl_ta_uvr_data_valid            EQU	0x00000050 ; bytes:1
CompTempVarRet212                EQU	0x0000005F ; bytes:1
ta_uvr_get_0001B_1_done          EQU	0x00000056 ; bit:0
ta_uvr_get_0001B_1_firstrun      EQU	0x00000056 ; bit:1
ta_uvr_get_0001B_1_counter       EQU	0x00000057 ; bytes:1
ta_uvr_get_0001B_1_input         EQU	0x00000058 ; bytes:1
ta_uvr_get_0001B_1_bytecount     EQU	0x00000059 ; bytes:1
ta_uvr_get_0001B_1_databyte      EQU	0x0000005A ; bytes:1
ta_uvr_get_0001B_1_bit_time      EQU	0x0000005B ; bytes:2
ta_uvr_get_0001B_1_timer_wait    EQU	0x0000005D ; bytes:2
CompTempVarRet239                EQU	0x0000007B ; bytes:2
CompTempVar213                   EQU	0x00000060 ; bytes:1
CompTempVar214                   EQU	0x00000061 ; bytes:1
CompTempVarRet263                EQU	0x00000077 ; bytes:1
CompTempVar217                   EQU	0x00000060 ; bytes:1
CompTempVar218                   EQU	0x00000061 ; bytes:1
CompTempVar219                   EQU	0x00000062 ; bytes:1
CompTempVar220                   EQU	0x00000063 ; bytes:1
CompTempVar223                   EQU	0x00000060 ; bytes:1
CompTempVar224                   EQU	0x00000061 ; bytes:1
CompTempVar227                   EQU	0x00000060 ; bytes:1
CompTempVar228                   EQU	0x00000062 ; bytes:29
CompTempVar230                   EQU	0x00000062 ; bytes:11
CompTempVar232                   EQU	0x00000062 ; bytes:27
CompTempVar234                   EQU	0x00000062 ; bytes:11
CompTempVar237                   EQU	0x00000060 ; bytes:1
CompTempVar238                   EQU	0x00000060 ; bytes:1
CompTempVarRet287                EQU	0x00000058 ; bytes:1
ta_uvr_ver_0001C_1_checksum      EQU	0x00000056 ; bytes:1
ta_uvr_ver_0001C_1_byte_count    EQU	0x00000057 ; bytes:1
CompTempVar292                   EQU	0x00000058 ; bytes:1
CompTempVarRet293                EQU	0x00000056 ; bytes:1
ta_uvr_sen_0001E_1_snd_count     EQU	0x00000056 ; bytes:1
CompTempVar299                   EQU	0x00000062 ; bytes:30
CompTempVar301                   EQU	0x00000062 ; bytes:26
CompTempVar303                   EQU	0x00000062 ; bytes:15
CompTempVar307                   EQU	0x00000057 ; bytes:2
CompTempVar311                   EQU	0x00000057 ; bytes:2
CompTempVar315                   EQU	0x00000057 ; bytes:2
CompTempVar319                   EQU	0x00000057 ; bytes:2
CompTempVar323                   EQU	0x00000062 ; bytes:15
CompTempVar325                   EQU	0x00000059 ; bytes:5
CompTempVar331                   EQU	0x00000059 ; bytes:5
CompTempVar337                   EQU	0x00000059 ; bytes:5
CompTempVar343                   EQU	0x00000059 ; bytes:5
CompTempVar349                   EQU	0x00000059 ; bytes:5
CompTempVar355                   EQU	0x00000059 ; bytes:5
CompTempVar361                   EQU	0x00000062 ; bytes:21
CompTempVar363                   EQU	0x00000057 ; bytes:3
CompTempVar365                   EQU	0x00000057 ; bytes:4
CompTempVar367                   EQU	0x00000059 ; bytes:5
CompTempVar369                   EQU	0x00000057 ; bytes:3
CompTempVar371                   EQU	0x00000057 ; bytes:4
CompTempVar373                   EQU	0x00000059 ; bytes:5
CompTempVar375                   EQU	0x00000057 ; bytes:3
CompTempVar377                   EQU	0x00000057 ; bytes:4
CompTempVar379                   EQU	0x00000059 ; bytes:7
CompTempVar381                   EQU	0x00000062 ; bytes:24
ta_uvr_pri_0001F_arg_low         EQU	0x00000057 ; bytes:1
ta_uvr_pri_0001F_arg_high        EQU	0x00000058 ; bytes:1
ta_uvr_pri_0001F_1_value_type    EQU	0x00000059 ; bytes:1
ta_uvr_pri_0001F_1_temp          EQU	0x0000005A ; bytes:2
ta_uvr_pri_0001F_1_high_restored EQU	0x0000005C ; bytes:1
CompTempVar385                   EQU	0x00000062 ; bytes:14
CompTempVar387                   EQU	0x00000062 ; bytes:4
CompTempVar389                   EQU	0x0000005D ; bytes:3
CompTempVar391                   EQU	0x0000005D ; bytes:2
CompTempVar393                   EQU	0x0000005D ; bytes:1
CompTempVar394                   EQU	0x0000005E ; bytes:1
CompTempVar395                   EQU	0x0000005D ; bytes:2
ta_uvr_cal_00021_1_timeout       EQU	0x00000060 ; bytes:2
ta_uvr_cal_00021_1_periods       EQU	0x00000080 ; bytes:32
ta_uvr_cal_00021_1_count         EQU	0x00000062 ; bytes:1
ta_uvr_cal_00021_5_instr_count   EQU	0x00000079 ; bytes:2
CompTempVar241                   EQU	0x00000063 ; bytes:1
CompTempVar245                   EQU	0x00000063 ; bytes:1
CompTempVar248                   EQU	0x00000063 ; bytes:1
CompTempVar254                   EQU	0x00000063 ; bytes:1
CompTempVar255                   EQU	0x00000064 ; bytes:1
CompTempVar257                   EQU	0x00000065 ; bytes:1
CompTempVar258                   EQU	0x00000066 ; bytes:1
CompTempVar261                   EQU	0x00000063 ; bytes:1
ta_uvr_wai_00023_arg_bit_time    EQU	0x00000060 ; bytes:2
ta_uvr_wai_00023_1_dataword      EQU	0x00000062 ; bytes:2
ta_uvr_wai_00023_1_timer_w_00024 EQU	0x00000064 ; bytes:2
CompTempVar264                   EQU	0x00000066 ; bytes:1
CompTempVar265                   EQU	0x00000067 ; bytes:1
ta_uvr_wai_00023_1_timer_w_00025 EQU	0x00000068 ; bytes:2
CompTempVar268                   EQU	0x0000006A ; bytes:1
CompTempVar269                   EQU	0x0000006B ; bytes:1
CompTempVar270                   EQU	0x0000006C ; bytes:1
CompTempVar271                   EQU	0x0000006D ; bytes:1
ta_uvr_wai_00023_1_timer_w_00026 EQU	0x0000006E ; bytes:2
CompTempVar272                   EQU	0x00000070 ; bytes:1
ta_uvr_wai_00023_1_input         EQU	0x00000071 ; bytes:1
ta_uvr_wai_00023_1_sync_bitcount EQU	0x00000072 ; bytes:1
CompTempVar280                   EQU	0x00000073 ; bytes:1
CompTempVar281                   EQU	0x00000074 ; bytes:1
CompTempVar282                   EQU	0x00000075 ; bytes:1
CompTempVar283                   EQU	0x00000076 ; bytes:1
ta_uvr_wai_00023_1_start_found   EQU	0x00000056 ; bit:2
__div_16_1_00003_arg_a           EQU	0x0000005F ; bytes:2
__div_16_1_00003_arg_b           EQU	0x00000061 ; bytes:2
CompTempVarRet407                EQU	0x0000006E ; bytes:2
__div_16_1_00003_1_r             EQU	0x0000006B ; bytes:2
__div_16_1_00003_1_i             EQU	0x0000006D ; bytes:1
__rem_16_1_00004_arg_a           EQU	0x00000063 ; bytes:2
__rem_16_1_00004_arg_b           EQU	0x00000065 ; bytes:2
CompTempVarRet409                EQU	0x0000006D ; bytes:2
__rem_16_1_00004_1_c             EQU	0x0000006A ; bytes:2
__rem_16_1_00004_1_i             EQU	0x0000006C ; bytes:1
__div_8_8_00000_arg_a            EQU	0x00000061 ; bytes:1
__div_8_8_00000_arg_b            EQU	0x00000062 ; bytes:1
CompTempVarRet411                EQU	0x00000068 ; bytes:1
__div_8_8_00000_1_r              EQU	0x00000066 ; bytes:1
__div_8_8_00000_1_i              EQU	0x00000067 ; bytes:1
__rem_8_8_00000_arg_a            EQU	0x00000063 ; bytes:1
__rem_8_8_00000_arg_b            EQU	0x00000064 ; bytes:1
CompTempVarRet413                EQU	0x00000068 ; bytes:1
__rem_8_8_00000_1_c              EQU	0x00000066 ; bytes:1
__rem_8_8_00000_1_i              EQU	0x00000067 ; bytes:1
delay_ms_00000_arg_del           EQU	0x00000058 ; bytes:1
Int1Context                      EQU	0x00000001 ; bytes:4
	ORG 0x00000000
	GOTO	_startup
	ORG 0x00000008
	GOTO	interrupt
	ORG 0x0000000C
delay_ms_00000
; { delay_ms ; function begin
	MOVF delay_ms_00000_arg_del, F
	BTFSS STATUS,Z
	GOTO	label4026531858
	RETURN
label4026531858
	MOVLW 0xF9
label4026531859
	NOP
	NOP
	NOP
	NOP
	ADDLW 0xFF
	BTFSS STATUS,Z
	GOTO	label4026531859
	NOP
	NOP
	NOP
	NOP
	NOP
	DECFSZ delay_ms_00000_arg_del, F
	GOTO	label4026531858
	RETURN
; } delay_ms function end

	ORG 0x0000003A
serial_pri_00009
; { serial_printf ; function begin
label268436305
	BTFSS gbl_txsta,1
	BRA	label268436305
	MOVF serial_pri_00009_arg_value, W, 1
	MOVWF gbl_txreg
	RETURN
; } serial_printf function end

	ORG 0x00000044
tmr1_set_00000
; { tmr1_set ; function begin
	MOVF tmr1_set_00000_arg_value+D'1', W
	MOVWF gbl_tmr1h
	MOVF tmr1_set_00000_arg_value, W
	MOVWF gbl_tmr1l
	RETURN
; } tmr1_set function end

	ORG 0x0000004E
serial_pri_00008
; { serial_printf ; function begin
	MOVLB 0x00
	CLRF serial_pri_00008_1_i, 1
label268436314
	MOVF serial_pri_00008_arg_text+D'1', W
	MOVWF	FSR0H
	MOVF serial_pri_00008_arg_text, W
	ADDWF serial_pri_00008_1_i, W, 1
	MOVWF FSR0L
	MOVF INDF0, F
	BTFSC STATUS,Z
	RETURN
	MOVF serial_pri_00008_arg_text+D'1', W
	MOVWF	FSR0H
	MOVF serial_pri_00008_arg_text, W
	ADDWF serial_pri_00008_1_i, W, 1
	MOVWF FSR0L
	INCF serial_pri_00008_1_i, F, 1
	MOVF INDF0, W
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	BRA	label268436314
; } serial_printf function end

	ORG 0x00000078
__rem_16_1_00004
; { __rem_16_16 ; function begin
	CLRF CompTempVarRet409
	CLRF CompTempVarRet409+D'1'
	CLRF __rem_16_1_00004_1_c
	CLRF __rem_16_1_00004_1_c+D'1'
	CLRF __rem_16_1_00004_1_i
label268438135
	BTFSC __rem_16_1_00004_1_i,4
	RETURN
	BCF STATUS,C
	RLCF __rem_16_1_00004_1_c, F
	RLCF __rem_16_1_00004_1_c+D'1', F
	RLCF __rem_16_1_00004_arg_a, F
	RLCF __rem_16_1_00004_arg_a+D'1', F
	RLCF CompTempVarRet409, F
	RLCF CompTempVarRet409+D'1', F
	MOVF __rem_16_1_00004_arg_b, W
	SUBWF CompTempVarRet409, W
	MOVF __rem_16_1_00004_arg_b+D'1', W
	CPFSEQ CompTempVarRet409+D'1'
	SUBWF CompTempVarRet409+D'1', W
	BNC	label268438140
	MOVF __rem_16_1_00004_arg_b, W
	SUBWF CompTempVarRet409, F
	MOVF __rem_16_1_00004_arg_b+D'1', W
	SUBWFB CompTempVarRet409+D'1', F
	BSF __rem_16_1_00004_1_c,0
label268438140
	INCF __rem_16_1_00004_1_i, F
	BRA	label268438135
; } __rem_16_16 function end

	ORG 0x000000AE
__div_16_1_00003
; { __div_16_16 ; function begin
	CLRF __div_16_1_00003_1_r
	CLRF __div_16_1_00003_1_r+D'1'
	CLRF CompTempVarRet407
	CLRF CompTempVarRet407+D'1'
	CLRF __div_16_1_00003_1_i
label268438111
	BTFSC __div_16_1_00003_1_i,4
	RETURN
	BCF STATUS,C
	RLCF CompTempVarRet407, F
	RLCF CompTempVarRet407+D'1', F
	RLCF __div_16_1_00003_arg_a, F
	RLCF __div_16_1_00003_arg_a+D'1', F
	RLCF __div_16_1_00003_1_r, F
	RLCF __div_16_1_00003_1_r+D'1', F
	MOVF __div_16_1_00003_arg_b, W
	SUBWF __div_16_1_00003_1_r, W
	MOVF __div_16_1_00003_arg_b+D'1', W
	CPFSEQ __div_16_1_00003_1_r+D'1'
	SUBWF __div_16_1_00003_1_r+D'1', W
	BNC	label268438116
	MOVF __div_16_1_00003_arg_b, W
	SUBWF __div_16_1_00003_1_r, F
	MOVF __div_16_1_00003_arg_b+D'1', W
	SUBWFB __div_16_1_00003_1_r+D'1', F
	BSF CompTempVarRet407,0
label268438116
	INCF __div_16_1_00003_1_i, F
	BRA	label268438111
; } __div_16_16 function end

	ORG 0x000000E4
tmr1_value_00000
; { tmr1_value ; function begin
	MOVF gbl_tmr1l, W
	MOVWF tmr1_value_00000_1_value
	MOVF gbl_tmr1h, W
	MOVWF tmr1_value_00000_1_value+D'1'
	MOVF tmr1_value_00000_1_value, W
	MOVLB 0x00
	MOVWF CompTempVarRet119, 1
	MOVF tmr1_value_00000_1_value+D'1', W
	MOVWF CompTempVarRet119+D'1', 1
	RETURN
; } tmr1_value function end

	ORG 0x000000F8
tmr1_setup_00000
; { tmr1_setup ; function begin
	MOVLW 0x80
	MOVWF gbl_t1con
	CLRF tmr1_set_00000_arg_value
	CLRF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BCF gbl_tmr1if,0
	BTFSC tmr1_setup_00000_arg_irq_mode,0
	BSF gbl_pie1,0
	BTFSS tmr1_setup_00000_arg_irq_mode,0
	BCF gbl_pie1,0
	BTFSC tmr1_setup_00000_arg_irq_mode,0
	BSF gbl_intcon,6
	BTFSS tmr1_setup_00000_arg_irq_mode,0
	BCF gbl_intcon,6
	MOVF tmr1_setup_00000_arg_irq_mode, F
	BTFSS STATUS,Z
	BSF gbl_intcon,7
	RETURN
; } tmr1_setup function end

	ORG 0x0000011E
serial_pri_0000F
; { serial_print_dec ; function begin
	MOVF serial_pri_0000F_arg_number+D'1', W
	SUBLW 0x27
	BNZ	label268436412
	MOVF serial_pri_0000F_arg_number, W
	SUBLW 0x0F
label268436412
	BC	label268436413
	BTFSC serial_pri_0000F_arg_number+D'1',7
	BRA	label268436413
	CLRF CompTempVar151
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label268436438
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar151, F
label268436438
	MOVLW 0x10
	MOVWF __div_16_1_00003_arg_b
	MOVLW 0x27
	MOVWF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet407, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet407+D'1', W
	MOVWF CompTempVar148
	BTFSS CompTempVar151,0
	BRA	label4026532871
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar148, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar148, F
label4026532871
	MOVF CompTempVar148, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar148,7
	BRA	label4026532873
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532873
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet409, W
	MOVWF CompTempVar149
	MOVF CompTempVarRet409+D'1', W
	MOVWF CompTempVar150
	BTFSS CompTempVar148,7
	BRA	label4026532875
	COMF CompTempVar149, F
	COMF CompTempVar150, F
	INCF CompTempVar149, F
	BTFSC STATUS,Z
	INCF CompTempVar150, F
label4026532875
	MOVLW 0x30
	ADDWF CompTempVar149, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436413
	MOVF serial_pri_0000F_arg_number+D'1', W
	SUBLW 0x03
	BNZ	label268436446
	MOVF serial_pri_0000F_arg_number, W
	SUBLW 0xE7
label268436446
	BC	label268436447
	BTFSC serial_pri_0000F_arg_number+D'1',7
	BRA	label268436447
	CLRF CompTempVar160
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label268436472
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar160, F
label268436472
	MOVLW 0xE8
	MOVWF __div_16_1_00003_arg_b
	MOVLW 0x03
	MOVWF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet407, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet407+D'1', W
	MOVWF CompTempVar157
	BTFSS CompTempVar160,0
	BRA	label4026532880
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar157, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar157, F
label4026532880
	MOVF CompTempVar157, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar157,7
	BRA	label4026532882
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532882
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet409, W
	MOVWF CompTempVar158
	MOVF CompTempVarRet409+D'1', W
	MOVWF CompTempVar159
	BTFSS CompTempVar157,7
	BRA	label4026532884
	COMF CompTempVar158, F
	COMF CompTempVar159, F
	INCF CompTempVar158, F
	BTFSC STATUS,Z
	INCF CompTempVar159, F
label4026532884
	MOVLW 0x30
	ADDWF CompTempVar158, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436447
	MOVLW 0x63
	CPFSGT serial_pri_0000F_arg_number
	TSTFSZ serial_pri_0000F_arg_number+D'1'
	BRA	label4026531931
	BRA	label268436481
label4026531931
	BTFSC serial_pri_0000F_arg_number+D'1',7
	BRA	label268436481
	CLRF CompTempVar169
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label268436506
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar169, F
label268436506
	MOVLW 0x64
	MOVWF __div_16_1_00003_arg_b
	CLRF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet407, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet407+D'1', W
	MOVWF CompTempVar166
	BTFSS CompTempVar169,0
	BRA	label4026532891
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar166, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar166, F
label4026532891
	MOVF CompTempVar166, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar166,7
	BRA	label4026532893
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532893
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet409, W
	MOVWF CompTempVar167
	MOVF CompTempVarRet409+D'1', W
	MOVWF CompTempVar168
	BTFSS CompTempVar166,7
	BRA	label4026532895
	COMF CompTempVar167, F
	COMF CompTempVar168, F
	INCF CompTempVar167, F
	BTFSC STATUS,Z
	INCF CompTempVar168, F
label4026532895
	MOVLW 0x30
	ADDWF CompTempVar167, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436481
	MOVLW 0x09
	CPFSGT serial_pri_0000F_arg_number
	TSTFSZ serial_pri_0000F_arg_number+D'1'
	BRA	label4026531944
	BRA	label268436515
label4026531944
	BTFSC serial_pri_0000F_arg_number+D'1',7
	BRA	label268436515
	CLRF CompTempVar178
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label268436540
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar178, F
label268436540
	MOVLW 0x0A
	MOVWF __div_16_1_00003_arg_b
	CLRF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet407, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet407+D'1', W
	MOVWF CompTempVar175
	BTFSS CompTempVar178,0
	BRA	label4026532902
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar175, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar175, F
label4026532902
	MOVF CompTempVar175, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar175,7
	BRA	label4026532904
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532904
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet409, W
	MOVWF CompTempVar176
	MOVF CompTempVarRet409+D'1', W
	MOVWF CompTempVar177
	BTFSS CompTempVar175,7
	BRA	label4026532906
	COMF CompTempVar176, F
	COMF CompTempVar177, F
	INCF CompTempVar176, F
	BTFSC STATUS,Z
	INCF CompTempVar177, F
label4026532906
	MOVLW 0x30
	ADDWF CompTempVar176, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	BRA	label268436548
label268436515
	MOVLW 0x30
	MOVWF CompTempVar179
	CLRF CompTempVar179+D'1'
	MOVLW HIGH(CompTempVar179+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar179+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
label268436548
	MOVLW 0x2E
	MOVWF CompTempVar181
	CLRF CompTempVar181+D'1'
	MOVLW HIGH(CompTempVar181+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar181+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label4026532908
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532908
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet409, W
	MOVWF CompTempVar185
	MOVF CompTempVarRet409+D'1', W
	MOVWF CompTempVar186
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label4026532910
	COMF CompTempVar185, F
	COMF CompTempVar186, F
	INCF CompTempVar185, F
	BTFSC STATUS,Z
	INCF CompTempVar186, F
label4026532910
	MOVLW 0x30
	ADDWF CompTempVar185, W
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
; } serial_print_dec function end

	ORG 0x000003A6
serial_pri_0000D
; { serial_print_hex ; function begin
	CLRF serial_pri_0000D_1_i
label268436329
	MOVLW 0x02
	CPFSLT serial_pri_0000D_1_i
	RETURN
	MOVF serial_pri_0000D_1_i, F
	BNZ	label268436333
	SWAPF serial_pri_0000D_arg_number, W
	ANDLW 0x0F
	MOVWF serial_pri_0000D_1_hexChar
	BRA	label268436336
label268436333
	MOVLW 0x0F
	ANDWF serial_pri_0000D_arg_number, W
	MOVWF serial_pri_0000D_1_hexChar
label268436336
	MOVLW 0x0A
	CPFSLT serial_pri_0000D_1_hexChar
	BRA	label268436338
	MOVLW 0x30
	ADDWF serial_pri_0000D_1_hexChar, W
	MOVWF serial_pri_0000D_1_hexChar
	BRA	label268436341
label268436338
	MOVLW 0x37
	ADDWF serial_pri_0000D_1_hexChar, W
	MOVWF serial_pri_0000D_1_hexChar
label268436341
	MOVF serial_pri_0000D_1_hexChar, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	INCF serial_pri_0000D_1_i, F
	BRA	label268436329
; } serial_print_hex function end

	ORG 0x000003E2
__rem_8_8_00000
; { __rem_8_8 ; function begin
	CLRF CompTempVarRet413
	CLRF __rem_8_8_00000_1_c
	CLRF __rem_8_8_00000_1_i
label268438183
	BTFSC __rem_8_8_00000_1_i,3
	RETURN
	BCF STATUS,C
	RLCF __rem_8_8_00000_1_c, F
	RLCF __rem_8_8_00000_arg_a, F
	RLCF CompTempVarRet413, F
	MOVF CompTempVarRet413, W
	CPFSGT __rem_8_8_00000_arg_b
	BRA	label268438188
	BRA	label268438189
label268438188
	MOVF __rem_8_8_00000_arg_b, W
	SUBWF CompTempVarRet413, F
	BSF __rem_8_8_00000_1_c,0
label268438189
	INCF __rem_8_8_00000_1_i, F
	BRA	label268438183
; } __rem_8_8 function end

	ORG 0x00000406
__div_8_8_00000
; { __div_8_8 ; function begin
	CLRF __div_8_8_00000_1_r
	CLRF CompTempVarRet411
	CLRF __div_8_8_00000_1_i
label268438159
	BTFSC __div_8_8_00000_1_i,3
	RETURN
	BCF STATUS,C
	RLCF CompTempVarRet411, F
	RLCF __div_8_8_00000_arg_a, F
	RLCF __div_8_8_00000_1_r, F
	MOVF __div_8_8_00000_1_r, W
	CPFSGT __div_8_8_00000_arg_b
	BRA	label268438164
	BRA	label268438165
label268438164
	MOVF __div_8_8_00000_arg_b, W
	SUBWF __div_8_8_00000_1_r, F
	BSF CompTempVarRet411,0
label268438165
	INCF __div_8_8_00000_1_i, F
	BRA	label268438159
; } __div_8_8 function end

	ORG 0x0000042A
ta_uvr_wai_00023
; { ta_uvr_waitforsync ; function begin
	CLRF gbl_portb
	MOVLW 0xAA
	MOVWF ta_uvr_wai_00023_1_dataword
	CLRF ta_uvr_wai_00023_1_dataword+D'1'
	MOVLW 0xE1
	MOVWF ta_uvr_wai_00023_arg_bit_time
	MOVLW 0x07
	MOVWF ta_uvr_wai_00023_arg_bit_time+D'1'
	MOVF ta_uvr_wai_00023_arg_bit_time, W
	MOVWF CompTempVar264
	MOVF ta_uvr_wai_00023_arg_bit_time+D'1', W
	MOVWF CompTempVar265
	RLCF CompTempVar265, W
	RRCF CompTempVar265, F
	RRCF CompTempVar264, W
	SUBLW 0xFF
	MOVWF ta_uvr_wai_00023_1_timer_w_00024
	MOVLW 0xFF
	SUBFWB CompTempVar265, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00024+D'1'
	MOVF ta_uvr_wai_00023_arg_bit_time, W
	MOVWF CompTempVar268
	MOVF ta_uvr_wai_00023_arg_bit_time+D'1', W
	MOVWF CompTempVar269
	BCF STATUS,C
	RLCF CompTempVar268, F
	RLCF CompTempVar269, F
	MOVF CompTempVar268, W
	SUBLW 0xFF
	MOVWF CompTempVar270
	MOVLW 0xFF
	SUBFWB CompTempVar269, W
	MOVWF CompTempVar271
	MOVF CompTempVar270, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00025
	MOVF CompTempVar271, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00025+D'1'
	MOVF ta_uvr_wai_00023_arg_bit_time, W
	MOVWF CompTempVar272
	MOVF ta_uvr_wai_00023_arg_bit_time+D'1', W
	MOVWF ta_uvr_wai_00023_1_timer_w_00026+D'1'
	RLCF ta_uvr_wai_00023_1_timer_w_00026+D'1', W
	RRCF ta_uvr_wai_00023_1_timer_w_00026+D'1', F
	RRCF CompTempVar272, W
	ADDWF ta_uvr_wai_00023_1_timer_w_00025, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00026
	MOVF ta_uvr_wai_00023_1_timer_w_00025+D'1', W
	ADDWFC ta_uvr_wai_00023_1_timer_w_00026+D'1', F
	MOVLW 0x0C
	SUBWF ta_uvr_wai_00023_1_timer_w_00025, F
	BTFSS STATUS,C
	DECF ta_uvr_wai_00023_1_timer_w_00025+D'1', F
	MOVF ta_uvr_wai_00023_1_timer_w_00025, W
	MOVWF gbl_ta_uvr_tmrl
	MOVF ta_uvr_wai_00023_1_timer_w_00025+D'1', W
	MOVWF gbl_ta_uvr_tmrh
	CLRF ta_uvr_wai_00023_1_sync_bitcount
label268437903
	BTFSC gbl_uvr_data,2
	BRA	label268437904
	NOP
	BRA	label268437903
label268437904
	BTFSS gbl_uvr_data,2
	BRA	label268437913
	NOP
	BRA	label268437904
label268437913
	CLRF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
	MOVF ta_uvr_wai_00023_1_timer_w_00024, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_wai_00023_1_timer_w_00024+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
	BCF gbl_tmr1if,0
label268437931
	BTFSC gbl_tmr1if,0
	BRA	label268437932
	NOP
	BRA	label268437931
label268437932
	MOVLW 0x01
	MOVWF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
	MOVF ta_uvr_wai_00023_1_timer_w_00025, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_wai_00023_1_timer_w_00025+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
label268437949
	MOVF ta_uvr_wai_00023_1_dataword, W
	MOVWF CompTempVar280
	MOVF ta_uvr_wai_00023_1_dataword+D'1', W
	ANDLW 0x3F
	MOVWF CompTempVar281
	MOVF CompTempVar280, F
	BNZ	label4026532776
	MOVF CompTempVar281, F
	BZ	label268437951
label4026532776
	MOVF ta_uvr_wai_00023_1_dataword, W
	MOVWF CompTempVar282
	MOVF ta_uvr_wai_00023_1_dataword+D'1', W
	ANDLW 0x3F
	MOVWF CompTempVar283
	MOVF CompTempVar282, W
	XORLW 0xFF
	BTFSC CompTempVar283,7
	BRA	label4026532779
	BNZ	label4026532779
	MOVF CompTempVar283, W
	XORLW 0x3F
	BZ	label268437951
label4026532779
	BTFSC gbl_ta_uvr_gotbit,0
	BRA	label268437955
	NOP
	BRA	label4026532779
label268437955
	CLRF ta_uvr_wai_00023_1_input
	BTFSC gbl_uvr_data,2
	INCF ta_uvr_wai_00023_1_input, F
	BSF gbl_portb,0
	BCF gbl_portb,0
	BCF gbl_ta_uvr_gotbit,0
	BCF STATUS,C
	RLCF ta_uvr_wai_00023_1_dataword, F
	RLCF ta_uvr_wai_00023_1_dataword+D'1', F
	BCF ta_uvr_wai_00023_1_dataword,0
	BTFSC ta_uvr_wai_00023_1_input,0
	BSF ta_uvr_wai_00023_1_dataword,0
	INCF ta_uvr_wai_00023_1_sync_bitcount, F
	MOVLW 0xC8
	CPFSEQ ta_uvr_wai_00023_1_sync_bitcount
	BRA	label268437949
	CLRF CompTempVarRet263
	RETURN
label268437951
	BTFSS gbl_uvr_data,2
	BRA	label268437981
	NOP
	BRA	label268437951
label268437981
	BTFSC gbl_uvr_data,2
	BRA	label268437990
	NOP
	BRA	label268437981
label268437990
	BCF ta_uvr_wai_00023_1_start_found,2
	BCF gbl_t1con,0
	BCF gbl_tmr1if,0
	CLRF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
label268438004
	BTFSC ta_uvr_wai_00023_1_start_found,2
	BRA	label268438005
	MOVF ta_uvr_wai_00023_1_timer_w_00026, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_wai_00023_1_timer_w_00026+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
label268438012
	BTFSS gbl_uvr_data,2
	BRA	label268438013
	NOP
	BRA	label268438012
label268438013
	BSF gbl_t1con,0
	NOP
label268438027
	BTFSC gbl_uvr_data,2
	BRA	label268438028
	NOP
	BRA	label268438027
label268438028
	BTFSS gbl_tmr1if,0
	BRA	label268438036
	BSF ta_uvr_wai_00023_1_start_found,2
	BRA	label268438004
label268438036
	BCF gbl_t1con,0
	BRA	label268438004
label268438005
	MOVLW 0x01
	MOVWF CompTempVarRet263
	RETURN
; } ta_uvr_waitforsync function end

	ORG 0x0000058A
ta_uvr_pri_0001F
; { ta_uvr_print_sensor_value ; function begin
	MOVLW 0x70
	ANDWF ta_uvr_pri_0001F_arg_high, W
	MOVWF ta_uvr_pri_0001F_1_value_type
	CLRF ta_uvr_pri_0001F_1_temp
	CLRF ta_uvr_pri_0001F_1_temp+D'1'
	CLRF ta_uvr_pri_0001F_1_high_restored
	MOVF ta_uvr_pri_0001F_1_value_type, F
	BZ	label268437633
	MOVLW 0x10
	CPFSEQ ta_uvr_pri_0001F_1_value_type
	BRA	label268437634
	BRA	label268437635
label268437634
	MOVLW 0x20
	CPFSEQ ta_uvr_pri_0001F_1_value_type
	BRA	label268437638
	BRA	label268437637
label268437633
	MOVLW 0x20
	MOVWF CompTempVar385+D'3'
	MOVLW 0x4E
	MOVWF CompTempVar385
	MOVLW 0x63
	MOVWF CompTempVar385+D'4'
	MOVWF CompTempVar385+D'9'
	MOVLW 0x64
	MOVWF CompTempVar385+D'12'
	MOVLW 0x65
	MOVWF CompTempVar385+D'8'
	MOVWF CompTempVar385+D'11'
	MOVLW 0x6E
	MOVWF CompTempVar385+D'6'
	MOVWF CompTempVar385+D'7'
	MOVLW 0x6F
	MOVWF CompTempVar385+D'1'
	MOVWF CompTempVar385+D'5'
	MOVLW 0x74
	MOVWF CompTempVar385+D'2'
	MOVWF CompTempVar385+D'10'
	CLRF CompTempVar385+D'13'
	MOVLW HIGH(CompTempVar385+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar385+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BRA	label268437645
label268437635
	BTFSC ta_uvr_pri_0001F_arg_high,7
	BRA	label268437646
	MOVLW 0x6F
	MOVWF CompTempVar387
	MOVLW 0x66
	MOVWF CompTempVar387+D'1'
	MOVWF CompTempVar387+D'2'
	CLRF CompTempVar387+D'3'
	MOVLW HIGH(CompTempVar387+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar387+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BRA	label268437645
label268437646
	MOVLW 0x6F
	MOVWF CompTempVar389
	MOVLW 0x6E
	MOVWF CompTempVar389+D'1'
	CLRF CompTempVar389+D'2'
	MOVLW HIGH(CompTempVar389+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar389+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BRA	label268437645
label268437637
	MOVF ta_uvr_pri_0001F_arg_high, W
	MOVWF ta_uvr_pri_0001F_1_high_restored
	BTFSS ta_uvr_pri_0001F_1_high_restored,7
	BRA	label268437664
	MOVLW 0x70
	IORWF ta_uvr_pri_0001F_1_high_restored, F
	BRA	label268437668
label268437664
	MOVLW 0x8F
	ANDWF ta_uvr_pri_0001F_1_high_restored, F
label268437668
	MOVF ta_uvr_pri_0001F_arg_low, W
	MOVWF ta_uvr_pri_0001F_1_temp
	MOVF ta_uvr_pri_0001F_1_high_restored, W
	MOVWF ta_uvr_pri_0001F_1_temp+D'1'
	BTFSS ta_uvr_pri_0001F_arg_high,7
	BRA	label4026532937
	MOVLW 0x2D
	MOVWF CompTempVar391
	CLRF CompTempVar391+D'1'
	MOVLW HIGH(CompTempVar391+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar391+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVLW 0xFF
	XORWF ta_uvr_pri_0001F_1_temp, W
	MOVWF CompTempVar393
	MOVF ta_uvr_pri_0001F_1_temp+D'1', W
	XORLW 0xFF
	MOVWF CompTempVar394
	MOVF CompTempVar393, W
	MOVWF ta_uvr_pri_0001F_1_temp
	MOVF CompTempVar394, W
	MOVWF ta_uvr_pri_0001F_1_temp+D'1'
	INFSNZ ta_uvr_pri_0001F_1_temp, F
	INCF ta_uvr_pri_0001F_1_temp+D'1', F
label4026532937
	MOVF ta_uvr_pri_0001F_1_temp, W
	MOVWF serial_pri_0000F_arg_number
	MOVF ta_uvr_pri_0001F_1_temp+D'1', W
	MOVWF serial_pri_0000F_arg_number+D'1'
	CALL serial_pri_0000F
	BRA	label268437645
label268437638
	MOVLW 0x23
	MOVWF CompTempVar395
	CLRF CompTempVar395+D'1'
	MOVLW HIGH(CompTempVar395+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar395+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
label268437645
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
; } ta_uvr_print_sensor_value function end

	ORG 0x00000694
ta_uvr_cal_00021
; { ta_uvr_calibrate_timer ; function begin
	CLRF ta_uvr_cal_00021_1_timeout
	CLRF ta_uvr_cal_00021_1_timeout+D'1'
	CLRF ta_uvr_cal_00021_1_count
	CLRF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
label268437743
	MOVLW 0x10
	CPFSLT ta_uvr_cal_00021_1_count
	BRA	label268437744
	CLRF tmr1_set_00000_arg_value
	CLRF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
label268437752
	BTFSC gbl_uvr_data,2
	BRA	label268437753
	INFSNZ ta_uvr_cal_00021_1_timeout, F
	INCF ta_uvr_cal_00021_1_timeout+D'1', F
	MOVF ta_uvr_cal_00021_1_timeout+D'1', W
	SUBLW 0xFD
	BNZ	label268437757
	MOVF ta_uvr_cal_00021_1_timeout, W
	SUBLW 0xE8
label268437757
	BC	label268437752
	CLRF CompTempVarRet239
	CLRF CompTempVarRet239+D'1'
	RETURN
label268437753
	CLRF ta_uvr_cal_00021_1_timeout
	CLRF ta_uvr_cal_00021_1_timeout+D'1'
label268437764
	BTFSS gbl_uvr_data,2
	BRA	label268437765
	INFSNZ ta_uvr_cal_00021_1_timeout, F
	INCF ta_uvr_cal_00021_1_timeout+D'1', F
	MOVF ta_uvr_cal_00021_1_timeout+D'1', W
	SUBLW 0xFD
	BNZ	label268437769
	MOVF ta_uvr_cal_00021_1_timeout, W
	SUBLW 0xE8
label268437769
	BC	label268437764
	CLRF CompTempVarRet239
	CLRF CompTempVarRet239+D'1'
	RETURN
label268437765
	BSF gbl_t1con,0
label268437775
	BTFSS gbl_uvr_data,2
	BRA	label268437775
	BCF gbl_t1con,0
	NOP
	CALL tmr1_value_00000
	MOVF CompTempVarRet119, W, 1
	MOVWF ta_uvr_cal_00021_5_instr_count
	MOVF CompTempVarRet119+D'1', W, 1
	MOVWF ta_uvr_cal_00021_5_instr_count+D'1'
	MOVF ta_uvr_cal_00021_5_instr_count+D'1', W
	SUBLW 0x0B
	BNZ	label268437787
	MOVF ta_uvr_cal_00021_5_instr_count, W
	SUBLW 0xB8
label268437787
	BC	label268437788
	BTFSC ta_uvr_cal_00021_5_instr_count+D'1',7
	BRA	label268437788
	MOVF ta_uvr_cal_00021_5_instr_count, W
	MOVWF CompTempVar241
	RLCF ta_uvr_cal_00021_5_instr_count+D'1', W
	RRCF ta_uvr_cal_00021_5_instr_count+D'1', F
	RRCF CompTempVar241, W
	MOVWF ta_uvr_cal_00021_5_instr_count
label268437788
	MOVLW	HIGH(ta_uvr_cal_00021_1_periods)

	MOVWF	FSR0H
	MOVLW LOW(ta_uvr_cal_00021_1_periods+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_cal_00021_1_count, W
	MOVWF CompTempVar245
	BCF STATUS,C
	RLCF CompTempVar245, W
	ADDWF FSR0L, F
	MOVF ta_uvr_cal_00021_5_instr_count, W
	MOVWF INDF0
	MOVF ta_uvr_cal_00021_5_instr_count+D'1', W
	MOVWF PREINC0
	INCF ta_uvr_cal_00021_1_count, F
	BRA	label268437743
label268437744
	MOVLW 0x01
	MOVWF ta_uvr_cal_00021_1_count
	MOVF ta_uvr_cal_00021_1_periods, W, 1
	MOVWF CompTempVar248
	RLCF ta_uvr_cal_00021_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00021_1_periods+D'1', F, 1
	RRCF CompTempVar248, W
	MOVWF ta_uvr_cal_00021_1_periods, 1
label268437805
	MOVLW 0x10
	CPFSLT ta_uvr_cal_00021_1_count
	BRA	label268437806
	MOVLW	HIGH(ta_uvr_cal_00021_1_periods)

	MOVWF	FSR0H
	MOVLW LOW(ta_uvr_cal_00021_1_periods+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_cal_00021_1_count, W
	MOVWF CompTempVar254
	BCF STATUS,C
	RLCF CompTempVar254, W
	ADDWF FSR0L, F
	MOVF INDF0, W
	MOVWF CompTempVar255
	MOVF PREINC0, W
	MOVWF CompTempVar258
	RLCF CompTempVar258, W
	RRCF CompTempVar258, F
	RRCF CompTempVar255, W
	ADDWF ta_uvr_cal_00021_1_periods, W, 1
	MOVWF CompTempVar257
	MOVF ta_uvr_cal_00021_1_periods+D'1', W, 1
	ADDWFC CompTempVar258, F
	MOVF CompTempVar257, W
	MOVWF ta_uvr_cal_00021_1_periods, 1
	MOVF CompTempVar258, W
	MOVWF ta_uvr_cal_00021_1_periods+D'1', 1
	INCF ta_uvr_cal_00021_1_count, F
	BRA	label268437805
label268437806
	MOVF ta_uvr_cal_00021_1_periods, W, 1
	MOVWF CompTempVar261
	RLCF ta_uvr_cal_00021_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00021_1_periods+D'1', F, 1
	RRCF CompTempVar261, F
	RLCF ta_uvr_cal_00021_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00021_1_periods+D'1', F, 1
	RRCF CompTempVar261, F
	RLCF ta_uvr_cal_00021_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00021_1_periods+D'1', F, 1
	RRCF CompTempVar261, W
	MOVWF ta_uvr_cal_00021_1_periods, 1
	MOVF ta_uvr_cal_00021_1_periods, W, 1
	MOVWF CompTempVarRet239
	MOVF ta_uvr_cal_00021_1_periods+D'1', W, 1
	MOVWF CompTempVarRet239+D'1'
	RETURN
; } ta_uvr_calibrate_timer function end

	ORG 0x000007A2
serial_pri_00010
; { serial_print_dec ; function begin
	MOVLW 0x63
	CPFSGT serial_pri_00010_arg_number
	BRA	label268436582
	MOVF serial_pri_00010_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x64
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet411, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF CompTempVar188
	MOVLW 0x30
	ADDWF CompTempVar188, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	BRA	label268436601
label268436582
	MOVLW 0x02
	CPFSGT serial_pri_00010_arg_positions
	BRA	label268436601
	MOVLW 0x30
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436601
	MOVLW 0x09
	CPFSGT serial_pri_00010_arg_number
	BRA	label268436608
	MOVF serial_pri_00010_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet411, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF CompTempVar190
	MOVLW 0x30
	ADDWF CompTempVar190, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	BRA	label268436627
label268436608
	MOVLW 0x01
	CPFSGT serial_pri_00010_arg_positions
	BRA	label268436627
	MOVLW 0x30
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436627
	MOVF serial_pri_00010_arg_number, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF CompTempVar192
	MOVLW 0x30
	ADDWF CompTempVar192, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
; } serial_print_dec function end

	ORG 0x00000840
serial_pri_0000E
; { serial_print_dec ; function begin
	MOVLW 0x63
	CPFSGT serial_pri_0000E_arg_number
	BRA	label268436365
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x64
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet411, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF CompTempVar138
	MOVLW 0x30
	ADDWF CompTempVar138, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436365
	MOVLW 0x09
	CPFSGT serial_pri_0000E_arg_number
	BRA	label268436382
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet411, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF CompTempVar140
	MOVLW 0x30
	ADDWF CompTempVar140, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436382
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF CompTempVar142
	MOVLW 0x30
	ADDWF CompTempVar142, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
; } serial_print_dec function end

	ORG 0x000008BA
serial_pri_0000B
; { serial_print_hex ; function begin
	MOVF serial_pri_0000B_arg_value+D'1', W
	MOVWF serial_pri_0000B_1_value1
	MOVF serial_pri_0000B_1_value1, W
	MOVWF serial_pri_0000D_arg_number
	CALL serial_pri_0000D
	MOVF serial_pri_0000B_arg_value, W
	MOVWF serial_pri_0000B_1_value0
	MOVF serial_pri_0000B_1_value0, W
	MOVWF serial_pri_0000D_arg_number
	CALL serial_pri_0000D
	RETURN
; } serial_print_hex function end

	ORG 0x000008D4
serial_ini_00007
; { serial_init ; function begin
	BSF gbl_trisc,7
	BSF gbl_trisc,6
	BCF gbl_txsta,6
	BSF gbl_txsta,5
	BCF gbl_txsta,4
	BSF gbl_txsta,2
	BSF gbl_rcsta,7
	BCF gbl_rcsta,6
	BSF gbl_rcsta,4
	BCF gbl_rcsta,3
	MOVF serial_ini_00007_arg_brg, W
	MOVWF gbl_spbrg
	RETURN
; } serial_init function end

	ORG 0x000008EE
ta_uvr_ver_0001C
; { ta_uvr_verify_checksum ; function begin
	CLRF ta_uvr_ver_0001C_1_checksum
	CLRF ta_uvr_ver_0001C_1_byte_count
label268437241
	MOVLW 0x22
	CPFSLT ta_uvr_ver_0001C_1_byte_count
	BRA	label268437242
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001C_1_byte_count, W
	ADDWF FSR0L, F
	INCF ta_uvr_ver_0001C_1_byte_count, F
	MOVF INDF0, W
	ADDWF ta_uvr_ver_0001C_1_checksum, F
	BRA	label268437241
label268437242
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001C_1_byte_count, W
	ADDWF FSR0L, F
	MOVF INDF0, W
	CPFSEQ ta_uvr_ver_0001C_1_checksum
	BRA	label268437247
	CLRF ta_uvr_ver_0001C_1_byte_count
label268437251
	MOVLW 0x23
	CPFSLT ta_uvr_ver_0001C_1_byte_count
	BRA	label268437252
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001C_1_byte_count, W
	ADDWF FSR0L, F
	MOVF INDF0, W
	MOVWF CompTempVar292
	MOVLW	HIGH(gbl_data_cache)

	MOVWF	FSR0H
	MOVLW LOW(gbl_data_cache+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001C_1_byte_count, W
	ADDWF FSR0L, F
	MOVF CompTempVar292, W
	MOVWF INDF0
	INCF ta_uvr_ver_0001C_1_byte_count, F
	BRA	label268437251
label268437252
	MOVLW 0x01
	MOVWF gbl_ta_uvr_data_valid
	CLRF CompTempVarRet287
	RETURN
label268437247
	MOVLW 0x01
	MOVWF CompTempVarRet287
	RETURN
; } ta_uvr_verify_checksum function end

	ORG 0x00000958
ta_uvr_sen_0001E
; { ta_uvr_send_data ; function begin
	CLRF ta_uvr_sen_0001E_1_snd_count
	MOVLW 0x90
	CPFSEQ gbl_data_cache
	BRA	label268437278
	BRA	label268437279
label268437278
	MOVLW 0x0A
	MOVWF CompTempVar299+D'1'
	MOVWF CompTempVar299+D'28'
	MOVLW 0x0D
	MOVWF CompTempVar299
	MOVWF CompTempVar299+D'27'
	MOVLW 0x20
	MOVWF CompTempVar299+D'8'
	MOVWF CompTempVar299+D'11'
	MOVWF CompTempVar299+D'15'
	MOVWF CompTempVar299+D'18'
	MOVLW 0x21
	MOVWF CompTempVar299+D'26'
	MOVLW 0x2D
	MOVWF CompTempVar299+D'24'
	MOVLW 0x31
	MOVWF CompTempVar299+D'23'
	MOVLW 0x33
	MOVWF CompTempVar299+D'25'
	MOVLW 0x36
	MOVWF CompTempVar299+D'22'
	MOVLW 0x44
	MOVWF CompTempVar299+D'2'
	MOVLW 0x52
	MOVWF CompTempVar299+D'21'
	MOVLW 0x55
	MOVWF CompTempVar299+D'19'
	MOVLW 0x56
	MOVWF CompTempVar299+D'20'
	MOVLW 0x61
	MOVWF CompTempVar299+D'16'
	MOVLW 0x63
	MOVWF CompTempVar299+D'6'
	MOVLW 0x65
	MOVWF CompTempVar299+D'3'
	MOVWF CompTempVar299+D'7'
	MOVLW 0x69
	MOVWF CompTempVar299+D'5'
	MOVWF CompTempVar299+D'9'
	MOVLW 0x6E
	MOVWF CompTempVar299+D'12'
	MOVWF CompTempVar299+D'17'
	MOVLW 0x6F
	MOVWF CompTempVar299+D'13'
	MOVLW 0x73
	MOVWF CompTempVar299+D'10'
	MOVLW 0x74
	MOVWF CompTempVar299+D'14'
	MOVLW 0x76
	MOVWF CompTempVar299+D'4'
	CLRF CompTempVar299+D'29'
	MOVLW HIGH(CompTempVar299+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar299+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BRA	label268437287
label268437279
	MOVLW 0x0A
	MOVWF CompTempVar301+D'1'
	MOVWF CompTempVar301+D'24'
	MOVLW 0x0D
	MOVWF CompTempVar301
	MOVWF CompTempVar301+D'23'
	MOVLW 0x20
	MOVWF CompTempVar301+D'11'
	MOVWF CompTempVar301+D'15'
	MOVLW 0x2D
	MOVWF CompTempVar301+D'21'
	MOVLW 0x31
	MOVWF CompTempVar301+D'20'
	MOVLW 0x33
	MOVWF CompTempVar301+D'22'
	MOVLW 0x36
	MOVWF CompTempVar301+D'19'
	MOVLW 0x3A
	MOVWF CompTempVar301+D'14'
	MOVLW 0x43
	MOVWF CompTempVar301+D'2'
	MOVLW 0x52
	MOVWF CompTempVar301+D'18'
	MOVLW 0x55
	MOVWF CompTempVar301+D'16'
	MOVLW 0x56
	MOVWF CompTempVar301+D'17'
	MOVLW 0x63
	MOVWF CompTempVar301+D'7'
	MOVLW 0x64
	MOVWF CompTempVar301+D'10'
	MOVLW 0x65
	MOVWF CompTempVar301+D'6'
	MOVWF CompTempVar301+D'9'
	MOVLW 0x6E
	MOVWF CompTempVar301+D'4'
	MOVWF CompTempVar301+D'5'
	MOVLW 0x6F
	MOVWF CompTempVar301+D'3'
	MOVWF CompTempVar301+D'13'
	MOVLW 0x74
	MOVWF CompTempVar301+D'8'
	MOVWF CompTempVar301+D'12'
	CLRF CompTempVar301+D'25'
	MOVLW HIGH(CompTempVar301+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar301+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
label268437287
	MOVLW 0x20
	MOVWF CompTempVar303+D'5'
	MOVWF CompTempVar303+D'11'
	MOVLW 0x30
	MOVWF CompTempVar303+D'13'
	MOVLW 0x32
	MOVWF CompTempVar303+D'12'
	MOVLW 0x3A
	MOVWF CompTempVar303+D'10'
	MOVLW 0x4C
	MOVWF CompTempVar303
	MOVLW 0x61
	MOVWF CompTempVar303+D'3'
	MOVLW 0x63
	MOVWF CompTempVar303+D'2'
	MOVLW 0x65
	MOVWF CompTempVar303+D'9'
	MOVLW 0x69
	MOVWF CompTempVar303+D'7'
	MOVLW 0x6C
	MOVWF CompTempVar303+D'4'
	MOVLW 0x6D
	MOVWF CompTempVar303+D'8'
	MOVLW 0x6F
	MOVWF CompTempVar303+D'1'
	MOVLW 0x74
	MOVWF CompTempVar303+D'6'
	CLRF CompTempVar303+D'14'
	MOVLW HIGH(CompTempVar303+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar303+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'7', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x2D
	MOVWF CompTempVar307
	CLRF CompTempVar307+D'1'
	MOVLW HIGH(CompTempVar307+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar307+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'6', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x2D
	MOVWF CompTempVar311
	CLRF CompTempVar311+D'1'
	MOVLW HIGH(CompTempVar311+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar311+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'5', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x20
	MOVWF CompTempVar315
	CLRF CompTempVar315+D'1'
	MOVLW HIGH(CompTempVar315+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar315+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVLW 0x1F
	ANDWF gbl_data_cache+D'4', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x3A
	MOVWF CompTempVar319
	CLRF CompTempVar319+D'1'
	MOVLW HIGH(CompTempVar319+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar319+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'3', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x20
	MOVWF CompTempVar323+D'6'
	MOVLW 0x3A
	MOVWF CompTempVar323+D'13'
	MOVLW 0x53
	MOVWF CompTempVar323
	MOVLW 0x61
	MOVWF CompTempVar323+D'8'
	MOVLW 0x65
	MOVWF CompTempVar323+D'1'
	MOVWF CompTempVar323+D'11'
	MOVLW 0x6C
	MOVWF CompTempVar323+D'9'
	MOVLW 0x6E
	MOVWF CompTempVar323+D'2'
	MOVLW 0x6F
	MOVWF CompTempVar323+D'4'
	MOVLW 0x72
	MOVWF CompTempVar323+D'5'
	MOVLW 0x73
	MOVWF CompTempVar323+D'3'
	MOVWF CompTempVar323+D'12'
	MOVLW 0x75
	MOVWF CompTempVar323+D'10'
	MOVLW 0x76
	MOVWF CompTempVar323+D'7'
	CLRF CompTempVar323+D'14'
	MOVLW HIGH(CompTempVar323+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar323+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x54
	MOVWF CompTempVar325
	MOVLW 0x31
	MOVWF CompTempVar325+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar325+D'2'
	MOVLW 0x20
	MOVWF CompTempVar325+D'3'
	CLRF CompTempVar325+D'4'
	MOVLW HIGH(CompTempVar325+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar325+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'8', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'9', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar331
	MOVLW 0x32
	MOVWF CompTempVar331+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar331+D'2'
	MOVLW 0x20
	MOVWF CompTempVar331+D'3'
	CLRF CompTempVar331+D'4'
	MOVLW HIGH(CompTempVar331+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar331+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'10', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'11', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar337
	MOVLW 0x33
	MOVWF CompTempVar337+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar337+D'2'
	MOVLW 0x20
	MOVWF CompTempVar337+D'3'
	CLRF CompTempVar337+D'4'
	MOVLW HIGH(CompTempVar337+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar337+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'12', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'13', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar343
	MOVLW 0x34
	MOVWF CompTempVar343+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar343+D'2'
	MOVLW 0x20
	MOVWF CompTempVar343+D'3'
	CLRF CompTempVar343+D'4'
	MOVLW HIGH(CompTempVar343+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar343+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'14', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'15', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar349
	MOVLW 0x35
	MOVWF CompTempVar349+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar349+D'2'
	MOVLW 0x20
	MOVWF CompTempVar349+D'3'
	CLRF CompTempVar349+D'4'
	MOVLW HIGH(CompTempVar349+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar349+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'16', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'17', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar355
	MOVLW 0x36
	MOVWF CompTempVar355+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar355+D'2'
	MOVLW 0x20
	MOVWF CompTempVar355+D'3'
	CLRF CompTempVar355+D'4'
	MOVLW HIGH(CompTempVar355+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar355+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_data_cache+D'18', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'19', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0A
	MOVWF CompTempVar361+D'15'
	MOVLW 0x0D
	MOVWF CompTempVar361+D'14'
	MOVLW 0x20
	MOVWF CompTempVar361+D'6'
	MOVWF CompTempVar361+D'19'
	MOVLW 0x31
	MOVWF CompTempVar361+D'17'
	MOVLW 0x3A
	MOVWF CompTempVar361+D'13'
	MOVWF CompTempVar361+D'18'
	MOVLW 0x41
	MOVWF CompTempVar361+D'16'
	MOVLW 0x4F
	MOVWF CompTempVar361
	MOVLW 0x61
	MOVWF CompTempVar361+D'8'
	MOVLW 0x65
	MOVWF CompTempVar361+D'11'
	MOVLW 0x6C
	MOVWF CompTempVar361+D'9'
	MOVLW 0x70
	MOVWF CompTempVar361+D'3'
	MOVLW 0x73
	MOVWF CompTempVar361+D'12'
	MOVLW 0x74
	MOVWF CompTempVar361+D'2'
	MOVWF CompTempVar361+D'5'
	MOVLW 0x75
	MOVWF CompTempVar361+D'1'
	MOVWF CompTempVar361+D'4'
	MOVWF CompTempVar361+D'10'
	MOVLW 0x76
	MOVWF CompTempVar361+D'7'
	CLRF CompTempVar361+D'20'
	MOVLW HIGH(CompTempVar361+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar361+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BTFSS gbl_data_cache+D'20',0
	BRA	label268437507
	MOVLW 0x6F
	MOVWF CompTempVar363
	MOVLW 0x6E
	MOVWF CompTempVar363+D'1'
	CLRF CompTempVar363+D'2'
	MOVLW HIGH(CompTempVar363+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar363+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BRA	label268437516
label268437507
	MOVLW 0x6F
	MOVWF CompTempVar365
	MOVLW 0x66
	MOVWF CompTempVar365+D'1'
	MOVWF CompTempVar365+D'2'
	CLRF CompTempVar365+D'3'
	MOVLW HIGH(CompTempVar365+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar365+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
label268437516
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x41
	MOVWF CompTempVar367
	MOVLW 0x32
	MOVWF CompTempVar367+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar367+D'2'
	MOVLW 0x20
	MOVWF CompTempVar367+D'3'
	CLRF CompTempVar367+D'4'
	MOVLW HIGH(CompTempVar367+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar367+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BTFSS gbl_data_cache+D'20',1
	BRA	label268437538
	MOVLW 0x6F
	MOVWF CompTempVar369
	MOVLW 0x6E
	MOVWF CompTempVar369+D'1'
	CLRF CompTempVar369+D'2'
	MOVLW HIGH(CompTempVar369+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar369+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BRA	label268437547
label268437538
	MOVLW 0x6F
	MOVWF CompTempVar371
	MOVLW 0x66
	MOVWF CompTempVar371+D'1'
	MOVWF CompTempVar371+D'2'
	CLRF CompTempVar371+D'3'
	MOVLW HIGH(CompTempVar371+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar371+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
label268437547
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x41
	MOVWF CompTempVar373
	MOVLW 0x33
	MOVWF CompTempVar373+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar373+D'2'
	MOVLW 0x20
	MOVWF CompTempVar373+D'3'
	CLRF CompTempVar373+D'4'
	MOVLW HIGH(CompTempVar373+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar373+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BTFSS gbl_data_cache+D'20',2
	BRA	label268437569
	MOVLW 0x6F
	MOVWF CompTempVar375
	MOVLW 0x6E
	MOVWF CompTempVar375+D'1'
	CLRF CompTempVar375+D'2'
	MOVLW HIGH(CompTempVar375+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar375+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BRA	label268437578
label268437569
	MOVLW 0x6F
	MOVWF CompTempVar377
	MOVLW 0x66
	MOVWF CompTempVar377+D'1'
	MOVWF CompTempVar377+D'2'
	CLRF CompTempVar377+D'3'
	MOVLW HIGH(CompTempVar377+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar377+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
label268437578
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x50
	MOVWF CompTempVar379
	MOVLW 0x75
	MOVWF CompTempVar379+D'1'
	MOVLW 0x6D
	MOVWF CompTempVar379+D'2'
	MOVLW 0x70
	MOVWF CompTempVar379+D'3'
	MOVLW 0x3A
	MOVWF CompTempVar379+D'4'
	MOVLW 0x20
	MOVWF CompTempVar379+D'5'
	CLRF CompTempVar379+D'6'
	MOVLW HIGH(CompTempVar379+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar379+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BTFSS gbl_data_cache+D'21',7
	BRA	label268437600
	MOVLW 0x20
	MOVWF CompTempVar381+D'8'
	MOVWF CompTempVar381+D'12'
	MOVWF CompTempVar381+D'16'
	MOVLW 0x61
	MOVWF CompTempVar381+D'1'
	MOVWF CompTempVar381+D'4'
	MOVWF CompTempVar381+D'17'
	MOVLW 0x62
	MOVWF CompTempVar381+D'5'
	MOVLW 0x63
	MOVWF CompTempVar381+D'18'
	MOVLW 0x65
	MOVWF CompTempVar381+D'7'
	MOVWF CompTempVar381+D'22'
	MOVLW 0x69
	MOVWF CompTempVar381+D'3'
	MOVWF CompTempVar381+D'20'
	MOVLW 0x6C
	MOVWF CompTempVar381+D'6'
	MOVLW 0x6D
	MOVWF CompTempVar381+D'11'
	MOVLW 0x6E
	MOVWF CompTempVar381+D'13'
	MOVLW 0x6F
	MOVWF CompTempVar381+D'14'
	MOVLW 0x70
	MOVWF CompTempVar381+D'10'
	MOVLW 0x72
	MOVWF CompTempVar381+D'2'
	MOVWF CompTempVar381+D'9'
	MOVLW 0x74
	MOVWF CompTempVar381+D'15'
	MOVWF CompTempVar381+D'19'
	MOVLW 0x76
	MOVWF CompTempVar381
	MOVWF CompTempVar381+D'21'
	CLRF CompTempVar381+D'23'
	MOVLW HIGH(CompTempVar381+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar381+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BRA	label268437609
label268437600
	MOVLW 0x1F
	ANDWF gbl_data_cache+D'21', W
	MOVWF serial_pri_0000E_arg_number
	CALL serial_pri_0000E
label268437609
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	CLRF gbl_ta_uvr_data_valid
	RETURN
; } ta_uvr_send_data function end

	ORG 0x00000E80
ta_uvr_get_0001B
; { ta_uvr_getinfo ; function begin
	BCF ta_uvr_get_0001B_1_done,0
	BCF ta_uvr_get_0001B_1_firstrun,1
	CLRF ta_uvr_get_0001B_1_counter
	CLRF ta_uvr_get_0001B_1_input
	CLRF ta_uvr_get_0001B_1_bytecount
	CLRF ta_uvr_get_0001B_1_databyte
	CALL ta_uvr_cal_00021
	MOVF CompTempVarRet239, W
	MOVWF ta_uvr_get_0001B_1_bit_time
	MOVF CompTempVarRet239+D'1', W
	MOVWF ta_uvr_get_0001B_1_bit_time+D'1'
	MOVF ta_uvr_get_0001B_1_bit_time, F
	BNZ	label268437064
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', F
	BNZ	label268437064
	MOVLW 0x01
	MOVWF CompTempVarRet212
	RETURN
label268437064
	MOVF ta_uvr_get_0001B_1_bit_time, W
	MOVWF CompTempVar213
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', W
	MOVWF CompTempVar214
	RLCF CompTempVar214, W
	RRCF CompTempVar214, F
	RRCF CompTempVar213, W
	SUBLW 0xFF
	MOVWF ta_uvr_get_0001B_1_timer_wait
	MOVLW 0xFF
	SUBFWB CompTempVar214, W
	MOVWF ta_uvr_get_0001B_1_timer_wait+D'1'
label268437074
	MOVF ta_uvr_get_0001B_1_bit_time, W
	MOVWF ta_uvr_wai_00023_arg_bit_time
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', W
	MOVWF ta_uvr_wai_00023_arg_bit_time+D'1'
	CALL ta_uvr_wai_00023
	TSTFSZ CompTempVarRet263
	BRA	label268437080
	CALL ta_uvr_cal_00021
	MOVF CompTempVarRet239, W
	MOVWF ta_uvr_get_0001B_1_bit_time
	MOVF CompTempVarRet239+D'1', W
	MOVWF ta_uvr_get_0001B_1_bit_time+D'1'
	MOVF ta_uvr_get_0001B_1_bit_time, W
	MOVWF CompTempVar217
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', W
	MOVWF CompTempVar218
	RLCF CompTempVar218, W
	RRCF CompTempVar218, F
	RRCF CompTempVar217, W
	SUBLW 0xFF
	MOVWF CompTempVar219
	MOVLW 0xFF
	SUBFWB CompTempVar218, W
	MOVWF CompTempVar220
	MOVF CompTempVar219, W
	MOVWF ta_uvr_get_0001B_1_timer_wait
	MOVF CompTempVar220, W
	MOVWF ta_uvr_get_0001B_1_timer_wait+D'1'
	BRA	label268437074
label268437080
	MOVF ta_uvr_get_0001B_1_timer_wait, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_get_0001B_1_timer_wait+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
	BCF gbl_tmr1if,0
label268437097
	BTFSC gbl_tmr1if,0
	BRA	label268437098
	NOP
	BRA	label268437097
label268437098
	MOVLW 0x01
	MOVWF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
	MOVF ta_uvr_get_0001B_1_bit_time, W
	MOVWF CompTempVar223
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', W
	MOVWF CompTempVar224
	BCF STATUS,C
	RLCF CompTempVar223, F
	RLCF CompTempVar224, F
	MOVF CompTempVar223, W
	SUBLW 0xFF
	MOVWF tmr1_set_00000_arg_value
	MOVLW 0xFF
	SUBFWB CompTempVar224, W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
	BSF ta_uvr_get_0001B_1_firstrun,1
	CLRF ta_uvr_get_0001B_1_bytecount
label268437124
	MOVLW 0x23
	CPFSLT ta_uvr_get_0001B_1_bytecount
	BRA	label268437125
label4026532962
	BTFSC gbl_ta_uvr_gotbit,0
	BRA	label268437129
	BTFSC ta_uvr_get_0001B_1_firstrun,1
	BRA	label268437129
	NOP
	BRA	label4026532962
label268437129
	CLRF CompTempVar227
	BTFSC gbl_uvr_data,2
	INCF CompTempVar227, F
	MOVF CompTempVar227, W
	MOVWF ta_uvr_get_0001B_1_input
	BSF gbl_portb,1
	BCF gbl_portb,1
	BCF ta_uvr_get_0001B_1_firstrun,1
	BCF gbl_ta_uvr_gotbit,0
	MOVF ta_uvr_get_0001B_1_counter, F
	BNZ	label268437145
	MOVF ta_uvr_get_0001B_1_input, F
	BNZ	label268437148
	MOVLW 0x20
	MOVWF CompTempVar228+D'5'
	MOVWF CompTempVar228+D'9'
	MOVWF CompTempVar228+D'13'
	MOVWF CompTempVar228+D'18'
	MOVWF CompTempVar228+D'22'
	MOVWF CompTempVar228+D'27'
	MOVLW 0x53
	MOVWF CompTempVar228
	MOVLW 0x61
	MOVWF CompTempVar228+D'2'
	MOVLW 0x62
	MOVWF CompTempVar228+D'6'
	MOVWF CompTempVar228+D'23'
	MOVLW 0x65
	MOVWF CompTempVar228+D'15'
	MOVWF CompTempVar228+D'26'
	MOVLW 0x66
	MOVWF CompTempVar228+D'19'
	MOVLW 0x69
	MOVWF CompTempVar228+D'7'
	MOVLW 0x6E
	MOVWF CompTempVar228+D'10'
	MOVLW 0x6F
	MOVWF CompTempVar228+D'11'
	MOVWF CompTempVar228+D'17'
	MOVWF CompTempVar228+D'20'
	MOVLW 0x72
	MOVWF CompTempVar228+D'3'
	MOVWF CompTempVar228+D'16'
	MOVWF CompTempVar228+D'21'
	MOVLW 0x74
	MOVWF CompTempVar228+D'1'
	MOVWF CompTempVar228+D'4'
	MOVWF CompTempVar228+D'8'
	MOVWF CompTempVar228+D'12'
	MOVWF CompTempVar228+D'25'
	MOVLW 0x79
	MOVWF CompTempVar228+D'24'
	MOVLW 0x7A
	MOVWF CompTempVar228+D'14'
	CLRF CompTempVar228+D'28'
	MOVLW HIGH(CompTempVar228+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar228+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF ta_uvr_get_0001B_1_bytecount, W
	MOVWF serial_pri_0000E_arg_number
	CALL serial_pri_0000E
	MOVLW 0x21
	MOVWF CompTempVar230
	MOVWF CompTempVar230+D'1'
	MOVLW 0x20
	MOVWF CompTempVar230+D'2'
	MOVLW 0x51
	MOVWF CompTempVar230+D'3'
	MOVLW 0x75
	MOVWF CompTempVar230+D'4'
	MOVLW 0x69
	MOVWF CompTempVar230+D'5'
	MOVLW 0x74
	MOVWF CompTempVar230+D'6'
	MOVLW 0x2E
	MOVWF CompTempVar230+D'7'
	MOVWF CompTempVar230+D'8'
	MOVWF CompTempVar230+D'9'
	CLRF CompTempVar230+D'10'
	MOVLW HIGH(CompTempVar230+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar230+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x01
	MOVWF CompTempVarRet212
	RETURN
label268437148
	CLRF ta_uvr_get_0001B_1_databyte
	INCF ta_uvr_get_0001B_1_counter, F
	BRA	label268437124
label268437145
	MOVLW 0x09
	CPFSEQ ta_uvr_get_0001B_1_counter
	BRA	label268437181
	DECF ta_uvr_get_0001B_1_input, W
	BNZ	label268437184
	MOVLW 0x20
	MOVWF CompTempVar232+D'4'
	MOVWF CompTempVar232+D'8'
	MOVWF CompTempVar232+D'12'
	MOVWF CompTempVar232+D'16'
	MOVWF CompTempVar232+D'20'
	MOVWF CompTempVar232+D'25'
	MOVLW 0x53
	MOVWF CompTempVar232
	MOVLW 0x62
	MOVWF CompTempVar232+D'5'
	MOVWF CompTempVar232+D'21'
	MOVLW 0x65
	MOVWF CompTempVar232+D'15'
	MOVWF CompTempVar232+D'24'
	MOVLW 0x66
	MOVWF CompTempVar232+D'17'
	MOVLW 0x69
	MOVWF CompTempVar232+D'6'
	MOVLW 0x6E
	MOVWF CompTempVar232+D'9'
	MOVWF CompTempVar232+D'14'
	MOVLW 0x6F
	MOVWF CompTempVar232+D'2'
	MOVWF CompTempVar232+D'10'
	MOVWF CompTempVar232+D'13'
	MOVWF CompTempVar232+D'18'
	MOVLW 0x70
	MOVWF CompTempVar232+D'3'
	MOVLW 0x72
	MOVWF CompTempVar232+D'19'
	MOVLW 0x74
	MOVWF CompTempVar232+D'1'
	MOVWF CompTempVar232+D'7'
	MOVWF CompTempVar232+D'11'
	MOVWF CompTempVar232+D'23'
	MOVLW 0x79
	MOVWF CompTempVar232+D'22'
	CLRF CompTempVar232+D'26'
	MOVLW HIGH(CompTempVar232+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar232+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF ta_uvr_get_0001B_1_bytecount, W
	MOVWF serial_pri_0000E_arg_number
	CALL serial_pri_0000E
	MOVLW 0x21
	MOVWF CompTempVar234
	MOVWF CompTempVar234+D'1'
	MOVLW 0x20
	MOVWF CompTempVar234+D'2'
	MOVLW 0x51
	MOVWF CompTempVar234+D'3'
	MOVLW 0x75
	MOVWF CompTempVar234+D'4'
	MOVLW 0x69
	MOVWF CompTempVar234+D'5'
	MOVLW 0x74
	MOVWF CompTempVar234+D'6'
	MOVLW 0x2E
	MOVWF CompTempVar234+D'7'
	MOVWF CompTempVar234+D'8'
	MOVWF CompTempVar234+D'9'
	CLRF CompTempVar234+D'10'
	MOVLW HIGH(CompTempVar234+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar234+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x01
	MOVWF CompTempVarRet212
	RETURN
label268437184
	CLRF ta_uvr_get_0001B_1_counter
	MOVLW 0xFF
	XORWF ta_uvr_get_0001B_1_databyte, W
	MOVWF CompTempVar237
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_get_0001B_1_bytecount, W
	ADDWF FSR0L, F
	MOVF CompTempVar237, W
	MOVWF INDF0
	INCF ta_uvr_get_0001B_1_bytecount, F
	BCF gbl_t1con,0
	MOVF ta_uvr_get_0001B_1_timer_wait, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_get_0001B_1_timer_wait+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
label268437226
	BTFSS gbl_uvr_data,2
	BRA	label268437226
	BSF gbl_t1con,0
	BRA	label268437124
label268437181
	MOVF ta_uvr_get_0001B_1_databyte, W
	MOVWF CompTempVar238
	BCF STATUS,C
	RRCF CompTempVar238, W
	MOVWF ta_uvr_get_0001B_1_databyte
	BCF ta_uvr_get_0001B_1_databyte,7
	BTFSC ta_uvr_get_0001B_1_input,0
	BSF ta_uvr_get_0001B_1_databyte,7
	INCF ta_uvr_get_0001B_1_counter, F
	BRA	label268437124
label268437125
	CLRF CompTempVarRet212
	RETURN
; } ta_uvr_getinfo function end

	ORG 0x0000111A
ta_uvr_dat_0001D
; { ta_uvr_data_available ; function begin
	MOVF gbl_ta_uvr_data_valid, W
	MOVWF CompTempVarRet293
	RETURN
; } ta_uvr_data_available function end

	ORG 0x00001120
serial_get_00012
; { serial_getch ; function begin
	BTFSS gbl_rcsta,1
	BRA	label268436671
	MOVLW 0x4F
	MOVWF CompTempVar195
	MOVLW 0x45
	MOVWF CompTempVar195+D'1'
	MOVLW 0x52
	MOVWF CompTempVar195+D'2'
	MOVWF CompTempVar195+D'3'
	CLRF CompTempVar195+D'4'
	MOVLW HIGH(CompTempVar195+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar195+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BCF gbl_rcsta,4
	BSF gbl_rcsta,4
label268436671
	BTFSS gbl_pir1,5
	BRA	label268436671
	MOVF gbl_rcreg, W
	MOVWF CompTempVarRet193
	RETURN
; } serial_getch function end

	ORG 0x0000114E
report_and_00022
; { report_and_reset_int_count ; function begin
	CLRF report_and_00022_1_count_shadow
	CLRF report_and_00022_1_count_shadow+D'1'
	MOVLW 0x20
	MOVWF CompTempVar123+D'11'
	MOVLW 0x3A
	MOVWF CompTempVar123+D'10'
	MOVLW 0x49
	MOVWF CompTempVar123
	MOVLW 0x65
	MOVWF CompTempVar123+D'3'
	MOVLW 0x6E
	MOVWF CompTempVar123+D'1'
	MOVLW 0x70
	MOVWF CompTempVar123+D'7'
	MOVLW 0x72
	MOVWF CompTempVar123+D'4'
	MOVWF CompTempVar123+D'5'
	MOVLW 0x73
	MOVWF CompTempVar123+D'9'
	MOVLW 0x74
	MOVWF CompTempVar123+D'2'
	MOVWF CompTempVar123+D'8'
	MOVLW 0x75
	MOVWF CompTempVar123+D'6'
	CLRF CompTempVar123+D'12'
	MOVLW HIGH(CompTempVar123+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar123+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BCF gbl_intcon,7
	MOVF gbl_interrupt_count, W
	MOVWF report_and_00022_1_count_shadow
	MOVF gbl_interrupt_count+D'1', W
	MOVWF report_and_00022_1_count_shadow+D'1'
	CLRF gbl_interrupt_count
	CLRF gbl_interrupt_count+D'1'
	BSF gbl_intcon,7
	MOVF report_and_00022_1_count_shadow, W
	MOVWF serial_pri_0000B_arg_value
	MOVF report_and_00022_1_count_shadow+D'1', W
	MOVWF serial_pri_0000B_arg_value+D'1'
	CALL serial_pri_0000B
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x45
	MOVWF CompTempVar125
	MOVLW 0x4F
	MOVWF CompTempVar125+D'1'
	MOVLW 0x54
	MOVWF CompTempVar125+D'2'
	CLRF CompTempVar125+D'3'
	MOVLW HIGH(CompTempVar125+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar125+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	RETURN
; } report_and_reset_int_count function end

	ORG 0x000011D6
init_00000
; { init ; function begin
	CLRF init_00000_1_blink_count
	CLRF gbl_interrupt_count
	CLRF gbl_interrupt_count+D'1'
	BSF gbl_osccon,4
	BSF gbl_osccon,5
	BSF gbl_osccon,6
	MOVLW 0x0F
	MOVWF gbl_adcon1
	MOVLW 0xEF
	MOVWF gbl_trisa
	MOVLW 0x01
	MOVWF gbl_trisb
	MOVLW 0xDE
	MOVWF gbl_trisc
	MOVLW 0x0C
	MOVWF serial_ini_00007_arg_brg
	CALL serial_ini_00007
label268435887
	MOVF init_00000_1_blink_count, W
	MOVWF CompTempVar120
	INCF init_00000_1_blink_count, F
	MOVLW 0x05
	CPFSLT CompTempVar120
	BRA	label268435889
	MOVLW 0x32
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_stat0,4
	MOVLW 0x32
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BSF gbl_stat0,4
	BRA	label268435887
label268435889
	MOVLW 0x20
	MOVLB 0x00
	MOVWF CompTempVar121+D'7', 1
	MOVWF CompTempVar121+D'15', 1
	MOVWF CompTempVar121+D'19', 1
	MOVLW 0x2D
	MOVWF CompTempVar121+D'13', 1
	MOVLW 0x2E
	MOVWF CompTempVar121+D'26', 1
	MOVWF CompTempVar121+D'27', 1
	MOVWF CompTempVar121+D'28', 1
	MOVWF CompTempVar121+D'29', 1
	MOVLW 0x31
	MOVWF CompTempVar121+D'12', 1
	MOVLW 0x33
	MOVWF CompTempVar121+D'14', 1
	MOVLW 0x36
	MOVWF CompTempVar121+D'11', 1
	MOVLW 0x41
	MOVWF CompTempVar121+D'17', 1
	MOVLW 0x42
	MOVWF CompTempVar121, 1
	MOVLW 0x4C
	MOVWF CompTempVar121+D'16', 1
	MOVLW 0x4E
	MOVWF CompTempVar121+D'18', 1
	MOVLW 0x52
	MOVWF CompTempVar121+D'10', 1
	MOVLW 0x55
	MOVWF CompTempVar121+D'8', 1
	MOVLW 0x56
	MOVWF CompTempVar121+D'9', 1
	MOVLW 0x65
	MOVWF CompTempVar121+D'24', 1
	MOVLW 0x67
	MOVWF CompTempVar121+D'6', 1
	MOVWF CompTempVar121+D'22', 1
	MOVWF CompTempVar121+D'23', 1
	MOVLW 0x69
	MOVWF CompTempVar121+D'4', 1
	MOVLW 0x6C
	MOVWF CompTempVar121+D'20', 1
	MOVLW 0x6E
	MOVWF CompTempVar121+D'5', 1
	MOVLW 0x6F
	MOVWF CompTempVar121+D'1', 1
	MOVWF CompTempVar121+D'2', 1
	MOVWF CompTempVar121+D'21', 1
	MOVLW 0x72
	MOVWF CompTempVar121+D'25', 1
	MOVLW 0x74
	MOVWF CompTempVar121+D'3', 1
	CLRF CompTempVar121+D'30', 1
	MOVLW HIGH(CompTempVar121+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar121+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	BCF gbl_intcon2,6
	BCF gbl_intcon,1
	BSF gbl_intcon,4
	BSF gbl_intcon,7
	RETURN
; } init function end

	ORG 0x000012AC
main
; { main ; function begin
	CLRF main_1_tmp
	CLRF main_1_valid_data
	CLRF main_1_prev_count
	CLRF main_1_prev_count+D'1'
	CALL init_00000
label268436020
	MOVF gbl_interrupt_count, W
	CPFSEQ main_1_prev_count
	BRA	label4026532974
	MOVF gbl_interrupt_count+D'1', W
	CPFSEQ main_1_prev_count+D'1'
	CPFSEQ gbl_interrupt_count+D'1'
	BRA	label268436024
label4026532974
	BCF gbl_portb,1
	MOVF gbl_interrupt_count, W
	MOVWF main_1_prev_count
	MOVF gbl_interrupt_count+D'1', W
	MOVWF main_1_prev_count+D'1'
label268436024
	CALL ta_uvr_get_0001B
	MOVF CompTempVarRet212, F
	BNZ	label268436037
	CALL ta_uvr_ver_0001C
	MOVF CompTempVarRet287, F
	BNZ	label268436033
	BCF gbl_stat0,4
	BRA	label268436037
label268436033
	BSF gbl_stat0,4
label268436037
	BSF gbl_portb,1
	BTFSS gbl_pir1,5
	BRA	label268436020
	BCF gbl_stat0,4
	CALL serial_get_00012
	MOVF CompTempVarRet193, W
	MOVWF main_1_command_byte
	MOVLW 0x53
	CPFSEQ main_1_command_byte
	BRA	label268436047
	CALL report_and_00022
	BRA	label268436020
label268436047
	CALL ta_uvr_dat_0001D
	MOVF CompTempVarRet293, F
	BZ	label268436054
	BSF gbl_stat0,4
	CALL ta_uvr_sen_0001E
	BRA	label268436060
label268436054
	MOVLW 0x20
	MOVLB 0x00
	MOVWF CompTempVar127+D'2', 1
	MOVWF CompTempVar127+D'8', 1
	MOVWF CompTempVar127+D'15', 1
	MOVWF CompTempVar127+D'24', 1
	MOVWF CompTempVar127+D'29', 1
	MOVWF CompTempVar127+D'39', 1
	MOVWF CompTempVar127+D'45', 1
	MOVWF CompTempVar127+D'50', 1
	MOVLW 0x4E
	MOVWF CompTempVar127, 1
	MOVLW 0x61
	MOVWF CompTempVar127+D'4', 1
	MOVWF CompTempVar127+D'10', 1
	MOVWF CompTempVar127+D'35', 1
	MOVWF CompTempVar127+D'47', 1
	MOVWF CompTempVar127+D'53', 1
	MOVLW 0x63
	MOVWF CompTempVar127+D'11', 1
	MOVWF CompTempVar127+D'18', 1
	MOVWF CompTempVar127+D'43', 1
	MOVLW 0x64
	MOVWF CompTempVar127+D'7', 1
	MOVWF CompTempVar127+D'23', 1
	MOVWF CompTempVar127+D'54', 1
	MOVLW 0x65
	MOVWF CompTempVar127+D'13', 1
	MOVWF CompTempVar127+D'17', 1
	MOVWF CompTempVar127+D'19', 1
	MOVWF CompTempVar127+D'22', 1
	MOVWF CompTempVar127+D'31', 1
	MOVWF CompTempVar127+D'44', 1
	MOVWF CompTempVar127+D'52', 1
	MOVLW 0x66
	MOVWF CompTempVar127+D'25', 1
	MOVLW 0x67
	MOVWF CompTempVar127+D'32', 1
	MOVLW 0x69
	MOVWF CompTempVar127+D'6', 1
	MOVWF CompTempVar127+D'20', 1
	MOVWF CompTempVar127+D'41', 1
	MOVLW 0x6B
	MOVWF CompTempVar127+D'12', 1
	MOVLW 0x6C
	MOVWF CompTempVar127+D'5', 1
	MOVWF CompTempVar127+D'34', 1
	MOVWF CompTempVar127+D'46', 1
	MOVLW 0x6D
	MOVWF CompTempVar127+D'28', 1
	MOVLW 0x6E
	MOVWF CompTempVar127+D'42', 1
	MOVLW 0x6F
	MOVWF CompTempVar127+D'1', 1
	MOVWF CompTempVar127+D'27', 1
	MOVWF CompTempVar127+D'37', 1
	MOVLW 0x70
	MOVWF CompTempVar127+D'9', 1
	MOVLW 0x72
	MOVWF CompTempVar127+D'16', 1
	MOVWF CompTempVar127+D'26', 1
	MOVWF CompTempVar127+D'30', 1
	MOVWF CompTempVar127+D'38', 1
	MOVWF CompTempVar127+D'51', 1
	MOVLW 0x73
	MOVWF CompTempVar127+D'40', 1
	MOVWF CompTempVar127+D'48', 1
	MOVLW 0x74
	MOVWF CompTempVar127+D'14', 1
	MOVWF CompTempVar127+D'36', 1
	MOVWF CompTempVar127+D'49', 1
	MOVLW 0x75
	MOVWF CompTempVar127+D'33', 1
	MOVLW 0x76
	MOVWF CompTempVar127+D'3', 1
	MOVWF CompTempVar127+D'21', 1
	CLRF CompTempVar127+D'55', 1
	MOVLW HIGH(CompTempVar127+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar127+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436060
	MOVLW 0x20
	MOVWF CompTempVar129+D'11'
	MOVLW 0x3A
	MOVWF CompTempVar129+D'10'
	MOVLW 0x49
	MOVWF CompTempVar129
	MOVLW 0x65
	MOVWF CompTempVar129+D'3'
	MOVLW 0x6E
	MOVWF CompTempVar129+D'1'
	MOVLW 0x70
	MOVWF CompTempVar129+D'7'
	MOVLW 0x72
	MOVWF CompTempVar129+D'4'
	MOVWF CompTempVar129+D'5'
	MOVLW 0x73
	MOVWF CompTempVar129+D'9'
	MOVLW 0x74
	MOVWF CompTempVar129+D'2'
	MOVWF CompTempVar129+D'8'
	MOVLW 0x75
	MOVWF CompTempVar129+D'6'
	CLRF CompTempVar129+D'12'
	MOVLW HIGH(CompTempVar129+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar129+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	MOVF gbl_interrupt_count, W
	MOVWF serial_pri_0000B_arg_value
	MOVF gbl_interrupt_count+D'1', W
	MOVWF serial_pri_0000B_arg_value+D'1'
	CALL serial_pri_0000B
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x45
	MOVWF CompTempVar131
	MOVLW 0x4F
	MOVWF CompTempVar131+D'1'
	MOVLW 0x54
	MOVWF CompTempVar131+D'2'
	CLRF CompTempVar131+D'3'
	MOVLW HIGH(CompTempVar131+D'0')
	MOVWF serial_pri_00008_arg_text+D'1'
	MOVLW LOW(CompTempVar131+D'0')
	MOVWF serial_pri_00008_arg_text
	CALL serial_pri_00008
	BRA	label268436020
; } main function end

	ORG 0x0000143C
_startup
	CLRF gbl_ta_uvr_data_valid
	GOTO	main
	ORG 0x00001442
interrupt
; { interrupt ; function begin
	MOVFF FSR0H,  Int1Context
	MOVFF FSR0L,  Int1Context+D'1'
	MOVFF PRODH,  Int1Context+D'2'
	MOVFF PRODL,  Int1Context+D'3'
	BTFSS gbl_tmr1if,0
	BRA	label268436103
	MOVF gbl_ta_uvr_tmrh, W
	MOVWF gbl_tmr1h
	MOVF gbl_ta_uvr_tmrl, W
	MOVWF gbl_tmr1l
	BSF gbl_ta_uvr_gotbit,0
	BCF gbl_pir1,0
label268436103
	BTFSS gbl_intcon,1
	BRA	label268436110
	INFSNZ gbl_interrupt_count, F
	INCF gbl_interrupt_count+D'1', F
	BCF gbl_intcon,1
label268436110
	MOVFF Int1Context+D'3',  PRODL
	MOVFF Int1Context+D'2',  PRODH
	MOVFF Int1Context+D'1',  FSR0L
	MOVFF Int1Context,  FSR0H
	RETFIE 1
; } interrupt function end

	ORG 0x00300000
	DW 0x38FF
	DW 0xFEFE
	ORG 0x00300004
	DW 0xFDFF
	DW 0xFFFA
	ORG 0x00300008
	DW 0xFFFF
	DW 0xFFFF
	DW 0xFFFF
	END
