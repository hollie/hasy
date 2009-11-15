;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 6.81
;// License Type  : Full License
;// Limitations   : PIC18 max code size:Unlimited, max RAM banks:Unlimited, Non commercial use only
;/////////////////////////////////////////////////////////////////////////////////

	include "P18F2320.inc"
__HEAPSTART                      EQU	0x000000BC ; Start address of heap 
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
gbl_tmr3if                       EQU	0x00000FA1 ; bit:1
tmr1_setup_00000_arg_irq_mode    EQU	0x00000079 ; bytes:1
tmr1_set_00000_arg_value         EQU	0x0000007C ; bytes:2
CompTempVarRet119                EQU	0x000000A0 ; bytes:2
tmr1_value_00000_1_value         EQU	0x0000007E ; bytes:2
tmr3_setup_00000_arg_irq_mode    EQU	0x00000059 ; bytes:1
tmr3_set_00000_arg_value         EQU	0x000000BA ; bytes:2
gbl_stat0                        EQU	0x00000F80 ; bit:4
gbl_uvr_data                     EQU	0x00000F82 ; bit:2
gbl_interrupt_count              EQU	0x0000004B ; bytes:2
gbl_tmr3_count                   EQU	0x0000004D ; bytes:1
init_00000_1_blink_count         EQU	0x00000057 ; bytes:1
CompTempVar120                   EQU	0x00000058 ; bytes:1
report_and_00022_1_count_shadow  EQU	0x00000057 ; bytes:2
CompTempVar121                   EQU	0x00000063 ; bytes:27
CompTempVar123                   EQU	0x00000063 ; bytes:13
CompTempVar125                   EQU	0x0000005A ; bytes:4
main_1_tmp                       EQU	0x00000052 ; bytes:1
main_1_command_byte              EQU	0x00000053 ; bytes:1
main_1_valid_data                EQU	0x00000054 ; bytes:1
main_1_prev_count                EQU	0x00000055 ; bytes:2
CompTempVar127                   EQU	0x00000080 ; bytes:56
CompTempVar129                   EQU	0x00000063 ; bytes:16
CompTempVar131                   EQU	0x00000063 ; bytes:13
CompTempVar133                   EQU	0x00000057 ; bytes:4
serial_ini_00007_arg_brg         EQU	0x00000059 ; bytes:1
serial_pri_00008_arg_value       EQU	0x000000B9 ; bytes:1
serial_pri_0000A_arg_text        EQU	0x00000061 ; bytes:2
serial_pri_0000A_1_i             EQU	0x000000B8 ; bytes:1
serial_pri_0000D_arg_number      EQU	0x0000005D ; bytes:1
serial_pri_0000D_1_hexChar       EQU	0x0000005E ; bytes:1
serial_pri_0000D_1_i             EQU	0x0000005F ; bytes:1
serial_pri_0000B_arg_value       EQU	0x00000059 ; bytes:2
serial_pri_0000B_1_value1        EQU	0x0000005B ; bytes:1
serial_pri_0000B_1_value0        EQU	0x0000005C ; bytes:1
serial_pri_0000E_arg_number      EQU	0x00000061 ; bytes:1
CompTempVar140                   EQU	0x00000066 ; bytes:1
CompTempVar142                   EQU	0x00000066 ; bytes:1
CompTempVar144                   EQU	0x00000062 ; bytes:1
serial_pri_0000F_arg_number      EQU	0x0000005E ; bytes:2
CompTempVar150                   EQU	0x00000068 ; bytes:1
CompTempVar151                   EQU	0x00000069 ; bytes:1
CompTempVar152                   EQU	0x0000006A ; bytes:1
CompTempVar153                   EQU	0x0000006B ; bytes:1
CompTempVar159                   EQU	0x00000068 ; bytes:1
CompTempVar160                   EQU	0x00000069 ; bytes:1
CompTempVar161                   EQU	0x0000006A ; bytes:1
CompTempVar162                   EQU	0x0000006B ; bytes:1
CompTempVar168                   EQU	0x00000068 ; bytes:1
CompTempVar169                   EQU	0x00000069 ; bytes:1
CompTempVar170                   EQU	0x0000006A ; bytes:1
CompTempVar171                   EQU	0x0000006B ; bytes:1
CompTempVar177                   EQU	0x00000068 ; bytes:1
CompTempVar178                   EQU	0x00000069 ; bytes:1
CompTempVar179                   EQU	0x0000006A ; bytes:1
CompTempVar180                   EQU	0x0000006B ; bytes:1
CompTempVar181                   EQU	0x00000063 ; bytes:2
CompTempVar183                   EQU	0x00000063 ; bytes:2
CompTempVar187                   EQU	0x00000060 ; bytes:1
CompTempVar188                   EQU	0x00000061 ; bytes:1
serial_pri_00010_arg_number      EQU	0x00000058 ; bytes:1
serial_pri_00010_arg_positions   EQU	0x00000059 ; bytes:1
CompTempVar190                   EQU	0x0000005A ; bytes:1
CompTempVar192                   EQU	0x0000005A ; bytes:1
CompTempVar194                   EQU	0x0000005A ; bytes:1
CompTempVarRet195                EQU	0x00000057 ; bytes:1
CompTempVar197                   EQU	0x0000005A ; bytes:5
gbl_ta_uvr_gotbit                EQU	0x0000004E ; bit:0
gbl_mydata                       EQU	0x00000005 ; bytes:35
gbl_data_cache                   EQU	0x00000028 ; bytes:35
gbl_ta_uvr_tmrl                  EQU	0x0000004F ; bytes:1
gbl_ta_uvr_tmrh                  EQU	0x00000050 ; bytes:1
gbl_ta_uvr_data_valid            EQU	0x00000051 ; bytes:1
CompTempVarRet214                EQU	0x00000060 ; bytes:1
ta_uvr_get_0001B_1_done          EQU	0x00000057 ; bit:0
ta_uvr_get_0001B_1_firstrun      EQU	0x00000057 ; bit:1
ta_uvr_get_0001B_1_counter       EQU	0x00000058 ; bytes:1
ta_uvr_get_0001B_1_input         EQU	0x00000059 ; bytes:1
ta_uvr_get_0001B_1_bytecount     EQU	0x0000005A ; bytes:1
ta_uvr_get_0001B_1_databyte      EQU	0x0000005B ; bytes:1
ta_uvr_get_0001B_1_bit_time      EQU	0x0000005C ; bytes:2
ta_uvr_get_0001B_1_timer_wait    EQU	0x0000005E ; bytes:2
CompTempVarRet241                EQU	0x0000007C ; bytes:2
CompTempVar215                   EQU	0x00000061 ; bytes:1
CompTempVar216                   EQU	0x00000062 ; bytes:1
CompTempVarRet265                EQU	0x00000078 ; bytes:1
CompTempVar219                   EQU	0x00000061 ; bytes:1
CompTempVar220                   EQU	0x00000062 ; bytes:1
CompTempVar221                   EQU	0x00000063 ; bytes:1
CompTempVar222                   EQU	0x00000064 ; bytes:1
CompTempVar225                   EQU	0x00000061 ; bytes:1
CompTempVar226                   EQU	0x00000062 ; bytes:1
CompTempVar229                   EQU	0x00000061 ; bytes:1
CompTempVar230                   EQU	0x00000063 ; bytes:29
CompTempVar232                   EQU	0x00000063 ; bytes:11
CompTempVar234                   EQU	0x00000063 ; bytes:27
CompTempVar236                   EQU	0x00000063 ; bytes:11
CompTempVar239                   EQU	0x00000061 ; bytes:1
CompTempVar240                   EQU	0x00000061 ; bytes:1
CompTempVarRet289                EQU	0x00000059 ; bytes:1
ta_uvr_ver_0001C_1_checksum      EQU	0x00000057 ; bytes:1
ta_uvr_ver_0001C_1_byte_count    EQU	0x00000058 ; bytes:1
CompTempVar294                   EQU	0x00000059 ; bytes:1
CompTempVarRet295                EQU	0x00000057 ; bytes:1
ta_uvr_sen_0001E_1_snd_count     EQU	0x00000057 ; bytes:1
CompTempVar301                   EQU	0x00000080 ; bytes:30
CompTempVar303                   EQU	0x00000063 ; bytes:26
CompTempVar305                   EQU	0x00000063 ; bytes:15
CompTempVar309                   EQU	0x00000058 ; bytes:2
CompTempVar313                   EQU	0x00000058 ; bytes:2
CompTempVar317                   EQU	0x00000058 ; bytes:2
CompTempVar321                   EQU	0x00000058 ; bytes:2
CompTempVar325                   EQU	0x00000063 ; bytes:15
CompTempVar327                   EQU	0x0000005A ; bytes:5
CompTempVar333                   EQU	0x0000005A ; bytes:5
CompTempVar339                   EQU	0x0000005A ; bytes:5
CompTempVar345                   EQU	0x0000005A ; bytes:5
CompTempVar351                   EQU	0x0000005A ; bytes:5
CompTempVar357                   EQU	0x0000005A ; bytes:5
CompTempVar363                   EQU	0x00000063 ; bytes:21
CompTempVar365                   EQU	0x00000058 ; bytes:3
CompTempVar367                   EQU	0x00000058 ; bytes:4
CompTempVar369                   EQU	0x0000005A ; bytes:5
CompTempVar371                   EQU	0x00000058 ; bytes:3
CompTempVar373                   EQU	0x00000058 ; bytes:4
CompTempVar375                   EQU	0x0000005A ; bytes:5
CompTempVar377                   EQU	0x00000058 ; bytes:3
CompTempVar379                   EQU	0x00000058 ; bytes:4
CompTempVar381                   EQU	0x0000005A ; bytes:7
CompTempVar383                   EQU	0x00000063 ; bytes:24
ta_uvr_pri_0001F_arg_low         EQU	0x00000058 ; bytes:1
ta_uvr_pri_0001F_arg_high        EQU	0x00000059 ; bytes:1
ta_uvr_pri_0001F_1_value_type    EQU	0x0000005A ; bytes:1
ta_uvr_pri_0001F_1_temp          EQU	0x0000005B ; bytes:2
ta_uvr_pri_0001F_1_high_restored EQU	0x0000005D ; bytes:1
CompTempVar387                   EQU	0x00000063 ; bytes:14
CompTempVar389                   EQU	0x00000063 ; bytes:4
CompTempVar391                   EQU	0x0000005E ; bytes:3
CompTempVar393                   EQU	0x0000005E ; bytes:2
CompTempVar395                   EQU	0x0000005E ; bytes:1
CompTempVar396                   EQU	0x0000005F ; bytes:1
CompTempVar397                   EQU	0x0000005E ; bytes:2
ta_uvr_cal_00021_1_timeout       EQU	0x00000061 ; bytes:2
ta_uvr_cal_00021_1_periods       EQU	0x00000080 ; bytes:32
ta_uvr_cal_00021_1_count         EQU	0x00000063 ; bytes:1
ta_uvr_cal_00021_5_instr_count   EQU	0x0000007A ; bytes:2
CompTempVar243                   EQU	0x00000064 ; bytes:1
CompTempVar247                   EQU	0x00000064 ; bytes:1
CompTempVar250                   EQU	0x00000064 ; bytes:1
CompTempVar256                   EQU	0x00000064 ; bytes:1
CompTempVar257                   EQU	0x00000065 ; bytes:1
CompTempVar259                   EQU	0x00000066 ; bytes:1
CompTempVar260                   EQU	0x00000067 ; bytes:1
CompTempVar263                   EQU	0x00000064 ; bytes:1
ta_uvr_wai_00023_arg_bit_time    EQU	0x00000061 ; bytes:2
ta_uvr_wai_00023_1_dataword      EQU	0x00000063 ; bytes:2
ta_uvr_wai_00023_1_timer_w_00024 EQU	0x00000065 ; bytes:2
CompTempVar266                   EQU	0x00000067 ; bytes:1
CompTempVar267                   EQU	0x00000068 ; bytes:1
ta_uvr_wai_00023_1_timer_w_00025 EQU	0x00000069 ; bytes:2
CompTempVar270                   EQU	0x0000006B ; bytes:1
CompTempVar271                   EQU	0x0000006C ; bytes:1
CompTempVar272                   EQU	0x0000006D ; bytes:1
CompTempVar273                   EQU	0x0000006E ; bytes:1
ta_uvr_wai_00023_1_timer_w_00026 EQU	0x0000006F ; bytes:2
CompTempVar274                   EQU	0x00000071 ; bytes:1
ta_uvr_wai_00023_1_input         EQU	0x00000072 ; bytes:1
ta_uvr_wai_00023_1_sync_bitcount EQU	0x00000073 ; bytes:1
CompTempVar282                   EQU	0x00000074 ; bytes:1
CompTempVar283                   EQU	0x00000075 ; bytes:1
CompTempVar284                   EQU	0x00000076 ; bytes:1
CompTempVar285                   EQU	0x00000077 ; bytes:1
ta_uvr_wai_00023_1_start_found   EQU	0x00000057 ; bit:2
__div_16_1_00003_arg_a           EQU	0x00000060 ; bytes:2
__div_16_1_00003_arg_b           EQU	0x00000062 ; bytes:2
CompTempVarRet409                EQU	0x0000006F ; bytes:2
__div_16_1_00003_1_r             EQU	0x0000006C ; bytes:2
__div_16_1_00003_1_i             EQU	0x0000006E ; bytes:1
__rem_16_1_00004_arg_a           EQU	0x00000064 ; bytes:2
__rem_16_1_00004_arg_b           EQU	0x00000066 ; bytes:2
CompTempVarRet411                EQU	0x0000006E ; bytes:2
__rem_16_1_00004_1_c             EQU	0x0000006B ; bytes:2
__rem_16_1_00004_1_i             EQU	0x0000006D ; bytes:1
__div_8_8_00000_arg_a            EQU	0x00000062 ; bytes:1
__div_8_8_00000_arg_b            EQU	0x00000063 ; bytes:1
CompTempVarRet413                EQU	0x00000069 ; bytes:1
__div_8_8_00000_1_r              EQU	0x00000067 ; bytes:1
__div_8_8_00000_1_i              EQU	0x00000068 ; bytes:1
__rem_8_8_00000_arg_a            EQU	0x00000064 ; bytes:1
__rem_8_8_00000_arg_b            EQU	0x00000065 ; bytes:1
CompTempVarRet415                EQU	0x00000069 ; bytes:1
__rem_8_8_00000_1_c              EQU	0x00000067 ; bytes:1
__rem_8_8_00000_1_i              EQU	0x00000068 ; bytes:1
delay_ms_00000_arg_del           EQU	0x00000059 ; bytes:1
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
tmr3_set_00000
; { tmr3_set ; function begin
	MOVF tmr3_set_00000_arg_value+D'1', W, 1
	MOVWF gbl_tmr3h
	MOVF tmr3_set_00000_arg_value, W, 1
	MOVWF gbl_tmr3l
	RETURN
; } tmr3_set function end

	ORG 0x00000044
serial_pri_00008
; { serial_printf ; function begin
label268436400
	BTFSS gbl_txsta,1
	BRA	label268436400
	MOVF serial_pri_00008_arg_value, W, 1
	MOVWF gbl_txreg
	RETURN
; } serial_printf function end

	ORG 0x0000004E
tmr1_set_00000
; { tmr1_set ; function begin
	MOVF tmr1_set_00000_arg_value+D'1', W
	MOVWF gbl_tmr1h
	MOVF tmr1_set_00000_arg_value, W
	MOVWF gbl_tmr1l
	RETURN
; } tmr1_set function end

	ORG 0x00000058
serial_pri_0000A
; { serial_printf ; function begin
	MOVLB 0x00
	CLRF serial_pri_0000A_1_i, 1
label268436409
	MOVF serial_pri_0000A_arg_text+D'1', W
	MOVWF	FSR0H
	MOVF serial_pri_0000A_arg_text, W
	ADDWF serial_pri_0000A_1_i, W, 1
	MOVWF FSR0L
	MOVF INDF0, F
	BTFSC STATUS,Z
	RETURN
	MOVF serial_pri_0000A_arg_text+D'1', W
	MOVWF	FSR0H
	MOVF serial_pri_0000A_arg_text, W
	ADDWF serial_pri_0000A_1_i, W, 1
	MOVWF FSR0L
	INCF serial_pri_0000A_1_i, F, 1
	MOVF INDF0, W
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	BRA	label268436409
; } serial_printf function end

	ORG 0x00000082
__rem_16_1_00004
; { __rem_16_16 ; function begin
	CLRF CompTempVarRet411
	CLRF CompTempVarRet411+D'1'
	CLRF __rem_16_1_00004_1_c
	CLRF __rem_16_1_00004_1_c+D'1'
	CLRF __rem_16_1_00004_1_i
label268438235
	BTFSC __rem_16_1_00004_1_i,4
	RETURN
	BCF STATUS,C
	RLCF __rem_16_1_00004_1_c, F
	RLCF __rem_16_1_00004_1_c+D'1', F
	RLCF __rem_16_1_00004_arg_a, F
	RLCF __rem_16_1_00004_arg_a+D'1', F
	RLCF CompTempVarRet411, F
	RLCF CompTempVarRet411+D'1', F
	MOVF __rem_16_1_00004_arg_b, W
	SUBWF CompTempVarRet411, W
	MOVF __rem_16_1_00004_arg_b+D'1', W
	CPFSEQ CompTempVarRet411+D'1'
	SUBWF CompTempVarRet411+D'1', W
	BNC	label268438240
	MOVF __rem_16_1_00004_arg_b, W
	SUBWF CompTempVarRet411, F
	MOVF __rem_16_1_00004_arg_b+D'1', W
	SUBWFB CompTempVarRet411+D'1', F
	BSF __rem_16_1_00004_1_c,0
label268438240
	INCF __rem_16_1_00004_1_i, F
	BRA	label268438235
; } __rem_16_16 function end

	ORG 0x000000B8
__div_16_1_00003
; { __div_16_16 ; function begin
	CLRF __div_16_1_00003_1_r
	CLRF __div_16_1_00003_1_r+D'1'
	CLRF CompTempVarRet409
	CLRF CompTempVarRet409+D'1'
	CLRF __div_16_1_00003_1_i
label268438211
	BTFSC __div_16_1_00003_1_i,4
	RETURN
	BCF STATUS,C
	RLCF CompTempVarRet409, F
	RLCF CompTempVarRet409+D'1', F
	RLCF __div_16_1_00003_arg_a, F
	RLCF __div_16_1_00003_arg_a+D'1', F
	RLCF __div_16_1_00003_1_r, F
	RLCF __div_16_1_00003_1_r+D'1', F
	MOVF __div_16_1_00003_arg_b, W
	SUBWF __div_16_1_00003_1_r, W
	MOVF __div_16_1_00003_arg_b+D'1', W
	CPFSEQ __div_16_1_00003_1_r+D'1'
	SUBWF __div_16_1_00003_1_r+D'1', W
	BNC	label268438216
	MOVF __div_16_1_00003_arg_b, W
	SUBWF __div_16_1_00003_1_r, F
	MOVF __div_16_1_00003_arg_b+D'1', W
	SUBWFB __div_16_1_00003_1_r+D'1', F
	BSF CompTempVarRet409,0
label268438216
	INCF __div_16_1_00003_1_i, F
	BRA	label268438211
; } __div_16_16 function end

	ORG 0x000000EE
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

	ORG 0x00000102
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
	DECF tmr1_setup_00000_arg_irq_mode, W
	BNZ	label4026532889
	BTFSS tmr1_setup_00000_arg_irq_mode,0
	BRA	label268435643
	BSF gbl_intcon,6
label268435643
	BTFSS tmr1_setup_00000_arg_irq_mode,0
	BCF gbl_intcon,6
label4026532889
	MOVF tmr1_setup_00000_arg_irq_mode, F
	BTFSS STATUS,Z
	BSF gbl_intcon,7
	RETURN
; } tmr1_setup function end

	ORG 0x0000012E
serial_pri_0000F
; { serial_print_dec ; function begin
	MOVF serial_pri_0000F_arg_number+D'1', W
	SUBLW 0x27
	BNZ	label268436507
	MOVF serial_pri_0000F_arg_number, W
	SUBLW 0x0F
label268436507
	BC	label268436508
	BTFSC serial_pri_0000F_arg_number+D'1',7
	BRA	label268436508
	CLRF CompTempVar153
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label268436533
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar153, F
label268436533
	MOVLW 0x10
	MOVWF __div_16_1_00003_arg_b
	MOVLW 0x27
	MOVWF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet409, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet409+D'1', W
	MOVWF CompTempVar150
	BTFSS CompTempVar153,0
	BRA	label4026532895
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar150, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar150, F
label4026532895
	MOVF CompTempVar150, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar150,7
	BRA	label4026532897
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532897
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet411, W
	MOVWF CompTempVar151
	MOVF CompTempVarRet411+D'1', W
	MOVWF CompTempVar152
	BTFSS CompTempVar150,7
	BRA	label4026532899
	COMF CompTempVar151, F
	COMF CompTempVar152, F
	INCF CompTempVar151, F
	BTFSC STATUS,Z
	INCF CompTempVar152, F
label4026532899
	MOVLW 0x30
	ADDWF CompTempVar151, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
label268436508
	MOVF serial_pri_0000F_arg_number+D'1', W
	SUBLW 0x03
	BNZ	label268436541
	MOVF serial_pri_0000F_arg_number, W
	SUBLW 0xE7
label268436541
	BC	label268436542
	BTFSC serial_pri_0000F_arg_number+D'1',7
	BRA	label268436542
	CLRF CompTempVar162
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label268436567
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar162, F
label268436567
	MOVLW 0xE8
	MOVWF __div_16_1_00003_arg_b
	MOVLW 0x03
	MOVWF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet409, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet409+D'1', W
	MOVWF CompTempVar159
	BTFSS CompTempVar162,0
	BRA	label4026532904
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar159, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar159, F
label4026532904
	MOVF CompTempVar159, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar159,7
	BRA	label4026532906
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532906
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet411, W
	MOVWF CompTempVar160
	MOVF CompTempVarRet411+D'1', W
	MOVWF CompTempVar161
	BTFSS CompTempVar159,7
	BRA	label4026532908
	COMF CompTempVar160, F
	COMF CompTempVar161, F
	INCF CompTempVar160, F
	BTFSC STATUS,Z
	INCF CompTempVar161, F
label4026532908
	MOVLW 0x30
	ADDWF CompTempVar160, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
label268436542
	MOVLW 0x63
	CPFSGT serial_pri_0000F_arg_number
	TSTFSZ serial_pri_0000F_arg_number+D'1'
	BRA	label4026531939
	BRA	label268436576
label4026531939
	BTFSC serial_pri_0000F_arg_number+D'1',7
	BRA	label268436576
	CLRF CompTempVar171
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label268436601
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar171, F
label268436601
	MOVLW 0x64
	MOVWF __div_16_1_00003_arg_b
	CLRF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet409, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet409+D'1', W
	MOVWF CompTempVar168
	BTFSS CompTempVar171,0
	BRA	label4026532915
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar168, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar168, F
label4026532915
	MOVF CompTempVar168, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar168,7
	BRA	label4026532917
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532917
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet411, W
	MOVWF CompTempVar169
	MOVF CompTempVarRet411+D'1', W
	MOVWF CompTempVar170
	BTFSS CompTempVar168,7
	BRA	label4026532919
	COMF CompTempVar169, F
	COMF CompTempVar170, F
	INCF CompTempVar169, F
	BTFSC STATUS,Z
	INCF CompTempVar170, F
label4026532919
	MOVLW 0x30
	ADDWF CompTempVar169, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
label268436576
	MOVLW 0x09
	CPFSGT serial_pri_0000F_arg_number
	TSTFSZ serial_pri_0000F_arg_number+D'1'
	BRA	label4026531952
	BRA	label268436610
label4026531952
	BTFSC serial_pri_0000F_arg_number+D'1',7
	BRA	label268436610
	CLRF CompTempVar180
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label268436635
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar180, F
label268436635
	MOVLW 0x0A
	MOVWF __div_16_1_00003_arg_b
	CLRF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet409, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet409+D'1', W
	MOVWF CompTempVar177
	BTFSS CompTempVar180,0
	BRA	label4026532926
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar177, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar177, F
label4026532926
	MOVF CompTempVar177, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar177,7
	BRA	label4026532928
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532928
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet411, W
	MOVWF CompTempVar178
	MOVF CompTempVarRet411+D'1', W
	MOVWF CompTempVar179
	BTFSS CompTempVar177,7
	BRA	label4026532930
	COMF CompTempVar178, F
	COMF CompTempVar179, F
	INCF CompTempVar178, F
	BTFSC STATUS,Z
	INCF CompTempVar179, F
label4026532930
	MOVLW 0x30
	ADDWF CompTempVar178, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	BRA	label268436643
label268436610
	MOVLW 0x30
	MOVWF CompTempVar181
	CLRF CompTempVar181+D'1'
	MOVLW HIGH(CompTempVar181+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar181+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
label268436643
	MOVLW 0x2E
	MOVWF CompTempVar183
	CLRF CompTempVar183+D'1'
	MOVLW HIGH(CompTempVar183+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar183+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF serial_pri_0000F_arg_number+D'1', W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label4026532932
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532932
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet411, W
	MOVWF CompTempVar187
	MOVF CompTempVarRet411+D'1', W
	MOVWF CompTempVar188
	BTFSS serial_pri_0000F_arg_number+D'1',7
	BRA	label4026532934
	COMF CompTempVar187, F
	COMF CompTempVar188, F
	INCF CompTempVar187, F
	BTFSC STATUS,Z
	INCF CompTempVar188, F
label4026532934
	MOVLW 0x30
	ADDWF CompTempVar187, W
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	RETURN
; } serial_print_dec function end

	ORG 0x000003B6
serial_pri_0000D
; { serial_print_hex ; function begin
	CLRF serial_pri_0000D_1_i
label268436424
	MOVLW 0x02
	CPFSLT serial_pri_0000D_1_i
	RETURN
	MOVF serial_pri_0000D_1_i, F
	BNZ	label268436428
	SWAPF serial_pri_0000D_arg_number, W
	ANDLW 0x0F
	MOVWF serial_pri_0000D_1_hexChar
	BRA	label268436431
label268436428
	MOVLW 0x0F
	ANDWF serial_pri_0000D_arg_number, W
	MOVWF serial_pri_0000D_1_hexChar
label268436431
	MOVLW 0x0A
	CPFSLT serial_pri_0000D_1_hexChar
	BRA	label268436433
	MOVLW 0x30
	ADDWF serial_pri_0000D_1_hexChar, W
	MOVWF serial_pri_0000D_1_hexChar
	BRA	label268436436
label268436433
	MOVLW 0x37
	ADDWF serial_pri_0000D_1_hexChar, W
	MOVWF serial_pri_0000D_1_hexChar
label268436436
	MOVF serial_pri_0000D_1_hexChar, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	INCF serial_pri_0000D_1_i, F
	BRA	label268436424
; } serial_print_hex function end

	ORG 0x000003F2
__rem_8_8_00000
; { __rem_8_8 ; function begin
	CLRF CompTempVarRet415
	CLRF __rem_8_8_00000_1_c
	CLRF __rem_8_8_00000_1_i
label268438283
	BTFSC __rem_8_8_00000_1_i,3
	RETURN
	BCF STATUS,C
	RLCF __rem_8_8_00000_1_c, F
	RLCF __rem_8_8_00000_arg_a, F
	RLCF CompTempVarRet415, F
	MOVF CompTempVarRet415, W
	CPFSGT __rem_8_8_00000_arg_b
	BRA	label268438288
	BRA	label268438289
label268438288
	MOVF __rem_8_8_00000_arg_b, W
	SUBWF CompTempVarRet415, F
	BSF __rem_8_8_00000_1_c,0
label268438289
	INCF __rem_8_8_00000_1_i, F
	BRA	label268438283
; } __rem_8_8 function end

	ORG 0x00000416
__div_8_8_00000
; { __div_8_8 ; function begin
	CLRF __div_8_8_00000_1_r
	CLRF CompTempVarRet413
	CLRF __div_8_8_00000_1_i
label268438259
	BTFSC __div_8_8_00000_1_i,3
	RETURN
	BCF STATUS,C
	RLCF CompTempVarRet413, F
	RLCF __div_8_8_00000_arg_a, F
	RLCF __div_8_8_00000_1_r, F
	MOVF __div_8_8_00000_1_r, W
	CPFSGT __div_8_8_00000_arg_b
	BRA	label268438264
	BRA	label268438265
label268438264
	MOVF __div_8_8_00000_arg_b, W
	SUBWF __div_8_8_00000_1_r, F
	BSF CompTempVarRet413,0
label268438265
	INCF __div_8_8_00000_1_i, F
	BRA	label268438259
; } __div_8_8 function end

	ORG 0x0000043A
tmr3_setup_00000
; { tmr3_setup ; function begin
	MOVLW 0xA0
	MOVWF gbl_t3con
	CLRF gbl_tmr3h
	CLRF gbl_tmr3l
	BCF gbl_tmr3if,1
	BTFSC tmr3_setup_00000_arg_irq_mode,0
	BSF gbl_pie2,1
	BTFSS tmr3_setup_00000_arg_irq_mode,0
	BCF gbl_pie2,1
	BTFSC tmr3_setup_00000_arg_irq_mode,0
	BSF gbl_intcon,6
	BTFSS tmr3_setup_00000_arg_irq_mode,0
	BCF gbl_intcon,6
	MOVF tmr3_setup_00000_arg_irq_mode, F
	BTFSS STATUS,Z
	BSF gbl_intcon,7
	RETURN
; } tmr3_setup function end

	ORG 0x0000045C
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
	MOVWF CompTempVar266
	MOVF ta_uvr_wai_00023_arg_bit_time+D'1', W
	MOVWF CompTempVar267
	RLCF CompTempVar267, W
	RRCF CompTempVar267, F
	RRCF CompTempVar266, W
	SUBLW 0xFF
	MOVWF ta_uvr_wai_00023_1_timer_w_00024
	MOVLW 0xFF
	SUBFWB CompTempVar267, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00024+D'1'
	MOVF ta_uvr_wai_00023_arg_bit_time, W
	MOVWF CompTempVar270
	MOVF ta_uvr_wai_00023_arg_bit_time+D'1', W
	MOVWF CompTempVar271
	BCF STATUS,C
	RLCF CompTempVar270, F
	RLCF CompTempVar271, F
	MOVF CompTempVar270, W
	SUBLW 0xFF
	MOVWF CompTempVar272
	MOVLW 0xFF
	SUBFWB CompTempVar271, W
	MOVWF CompTempVar273
	MOVF CompTempVar272, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00025
	MOVF CompTempVar273, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00025+D'1'
	MOVF ta_uvr_wai_00023_arg_bit_time, W
	MOVWF CompTempVar274
	MOVF ta_uvr_wai_00023_arg_bit_time+D'1', W
	MOVWF ta_uvr_wai_00023_1_timer_w_00026+D'1'
	RLCF ta_uvr_wai_00023_1_timer_w_00026+D'1', W
	RRCF ta_uvr_wai_00023_1_timer_w_00026+D'1', F
	RRCF CompTempVar274, W
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
label268438003
	BTFSC gbl_uvr_data,2
	BRA	label268438004
	NOP
	BRA	label268438003
label268438004
	BTFSS gbl_uvr_data,2
	BRA	label268438013
	NOP
	BRA	label268438004
label268438013
	CLRF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
	MOVF ta_uvr_wai_00023_1_timer_w_00024, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_wai_00023_1_timer_w_00024+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
	BCF gbl_tmr1if,0
label268438031
	BTFSC gbl_tmr1if,0
	BRA	label268438032
	NOP
	BRA	label268438031
label268438032
	MOVLW 0x01
	MOVWF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
	MOVF ta_uvr_wai_00023_1_timer_w_00025, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_wai_00023_1_timer_w_00025+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
label268438049
	MOVF ta_uvr_wai_00023_1_dataword, W
	MOVWF CompTempVar282
	MOVF ta_uvr_wai_00023_1_dataword+D'1', W
	ANDLW 0x3F
	MOVWF CompTempVar283
	MOVF CompTempVar282, F
	BNZ	label4026532798
	MOVF CompTempVar283, F
	BZ	label268438051
label4026532798
	MOVF ta_uvr_wai_00023_1_dataword, W
	MOVWF CompTempVar284
	MOVF ta_uvr_wai_00023_1_dataword+D'1', W
	ANDLW 0x3F
	MOVWF CompTempVar285
	MOVF CompTempVar284, W
	XORLW 0xFF
	BTFSC CompTempVar285,7
	BRA	label4026532801
	BNZ	label4026532801
	MOVF CompTempVar285, W
	XORLW 0x3F
	BZ	label268438051
label4026532801
	BTFSC gbl_ta_uvr_gotbit,0
	BRA	label268438055
	NOP
	BRA	label4026532801
label268438055
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
	BRA	label268438049
	CLRF CompTempVarRet265
	RETURN
label268438051
	BTFSS gbl_uvr_data,2
	BRA	label268438081
	NOP
	BRA	label268438051
label268438081
	BTFSC gbl_uvr_data,2
	BRA	label268438090
	NOP
	BRA	label268438081
label268438090
	BCF ta_uvr_wai_00023_1_start_found,2
	BCF gbl_t1con,0
	BCF gbl_tmr1if,0
	CLRF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
label268438104
	BTFSC ta_uvr_wai_00023_1_start_found,2
	BRA	label268438105
	MOVF ta_uvr_wai_00023_1_timer_w_00026, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_wai_00023_1_timer_w_00026+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
label268438112
	BTFSS gbl_uvr_data,2
	BRA	label268438113
	NOP
	BRA	label268438112
label268438113
	BSF gbl_t1con,0
	NOP
label268438127
	BTFSC gbl_uvr_data,2
	BRA	label268438128
	NOP
	BRA	label268438127
label268438128
	BTFSS gbl_tmr1if,0
	BRA	label268438136
	BSF ta_uvr_wai_00023_1_start_found,2
	BRA	label268438104
label268438136
	BCF gbl_t1con,0
	BRA	label268438104
label268438105
	MOVLW 0x01
	MOVWF CompTempVarRet265
	RETURN
; } ta_uvr_waitforsync function end

	ORG 0x000005BC
ta_uvr_pri_0001F
; { ta_uvr_print_sensor_value ; function begin
	MOVLW 0x70
	ANDWF ta_uvr_pri_0001F_arg_high, W
	MOVWF ta_uvr_pri_0001F_1_value_type
	CLRF ta_uvr_pri_0001F_1_temp
	CLRF ta_uvr_pri_0001F_1_temp+D'1'
	CLRF ta_uvr_pri_0001F_1_high_restored
	MOVF ta_uvr_pri_0001F_1_value_type, F
	BZ	label268437729
	MOVLW 0x10
	CPFSEQ ta_uvr_pri_0001F_1_value_type
	BRA	label268437730
	BRA	label268437731
label268437730
	MOVLW 0x20
	CPFSEQ ta_uvr_pri_0001F_1_value_type
	BRA	label268437734
	BRA	label268437733
label268437729
	MOVLW 0x20
	MOVWF CompTempVar387+D'3'
	MOVLW 0x4E
	MOVWF CompTempVar387
	MOVLW 0x63
	MOVWF CompTempVar387+D'4'
	MOVWF CompTempVar387+D'9'
	MOVLW 0x64
	MOVWF CompTempVar387+D'12'
	MOVLW 0x65
	MOVWF CompTempVar387+D'8'
	MOVWF CompTempVar387+D'11'
	MOVLW 0x6E
	MOVWF CompTempVar387+D'6'
	MOVWF CompTempVar387+D'7'
	MOVLW 0x6F
	MOVWF CompTempVar387+D'1'
	MOVWF CompTempVar387+D'5'
	MOVLW 0x74
	MOVWF CompTempVar387+D'2'
	MOVWF CompTempVar387+D'10'
	CLRF CompTempVar387+D'13'
	MOVLW HIGH(CompTempVar387+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar387+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BRA	label268437741
label268437731
	BTFSC ta_uvr_pri_0001F_arg_high,7
	BRA	label268437742
	MOVLW 0x6F
	MOVWF CompTempVar389
	MOVLW 0x66
	MOVWF CompTempVar389+D'1'
	MOVWF CompTempVar389+D'2'
	CLRF CompTempVar389+D'3'
	MOVLW HIGH(CompTempVar389+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar389+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BRA	label268437741
label268437742
	MOVLW 0x6F
	MOVWF CompTempVar391
	MOVLW 0x6E
	MOVWF CompTempVar391+D'1'
	CLRF CompTempVar391+D'2'
	MOVLW HIGH(CompTempVar391+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar391+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BRA	label268437741
label268437733
	MOVF ta_uvr_pri_0001F_arg_high, W
	MOVWF ta_uvr_pri_0001F_1_high_restored
	BTFSS ta_uvr_pri_0001F_1_high_restored,7
	BRA	label268437760
	MOVLW 0x70
	IORWF ta_uvr_pri_0001F_1_high_restored, F
	BRA	label268437764
label268437760
	MOVLW 0x8F
	ANDWF ta_uvr_pri_0001F_1_high_restored, F
label268437764
	MOVF ta_uvr_pri_0001F_arg_low, W
	MOVWF ta_uvr_pri_0001F_1_temp
	MOVF ta_uvr_pri_0001F_1_high_restored, W
	MOVWF ta_uvr_pri_0001F_1_temp+D'1'
	BTFSS ta_uvr_pri_0001F_arg_high,7
	BRA	label4026532966
	MOVLW 0x2D
	MOVWF CompTempVar393
	CLRF CompTempVar393+D'1'
	MOVLW HIGH(CompTempVar393+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar393+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVLW 0xFF
	XORWF ta_uvr_pri_0001F_1_temp, W
	MOVWF CompTempVar395
	MOVF ta_uvr_pri_0001F_1_temp+D'1', W
	XORLW 0xFF
	MOVWF CompTempVar396
	MOVF CompTempVar395, W
	MOVWF ta_uvr_pri_0001F_1_temp
	MOVF CompTempVar396, W
	MOVWF ta_uvr_pri_0001F_1_temp+D'1'
	INFSNZ ta_uvr_pri_0001F_1_temp, F
	INCF ta_uvr_pri_0001F_1_temp+D'1', F
label4026532966
	MOVF ta_uvr_pri_0001F_1_temp, W
	MOVWF serial_pri_0000F_arg_number
	MOVF ta_uvr_pri_0001F_1_temp+D'1', W
	MOVWF serial_pri_0000F_arg_number+D'1'
	CALL serial_pri_0000F
	BRA	label268437741
label268437734
	MOVLW 0x23
	MOVWF CompTempVar397
	CLRF CompTempVar397+D'1'
	MOVLW HIGH(CompTempVar397+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar397+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
label268437741
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	RETURN
; } ta_uvr_print_sensor_value function end

	ORG 0x000006C6
ta_uvr_cal_00021
; { ta_uvr_calibrate_timer ; function begin
	CLRF ta_uvr_cal_00021_1_timeout
	CLRF ta_uvr_cal_00021_1_timeout+D'1'
	CLRF ta_uvr_cal_00021_1_count
	CLRF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
label268437839
	MOVLW 0x10
	CPFSLT ta_uvr_cal_00021_1_count
	BRA	label268437840
	CLRF tmr1_set_00000_arg_value
	CLRF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
label268437848
	BTFSC gbl_uvr_data,2
	BRA	label268437849
	INFSNZ ta_uvr_cal_00021_1_timeout, F
	INCF ta_uvr_cal_00021_1_timeout+D'1', F
	MOVF ta_uvr_cal_00021_1_timeout+D'1', W
	SUBLW 0xFD
	BNZ	label268437853
	MOVF ta_uvr_cal_00021_1_timeout, W
	SUBLW 0xE8
label268437853
	BC	label268437848
	CLRF CompTempVarRet241
	CLRF CompTempVarRet241+D'1'
	RETURN
label268437849
	CLRF ta_uvr_cal_00021_1_timeout
	CLRF ta_uvr_cal_00021_1_timeout+D'1'
label268437860
	BTFSS gbl_uvr_data,2
	BRA	label268437861
	INFSNZ ta_uvr_cal_00021_1_timeout, F
	INCF ta_uvr_cal_00021_1_timeout+D'1', F
	MOVF ta_uvr_cal_00021_1_timeout+D'1', W
	SUBLW 0xFD
	BNZ	label268437865
	MOVF ta_uvr_cal_00021_1_timeout, W
	SUBLW 0xE8
label268437865
	BC	label268437860
	CLRF CompTempVarRet241
	CLRF CompTempVarRet241+D'1'
	RETURN
label268437861
	BSF gbl_t1con,0
label268437871
	BTFSS gbl_uvr_data,2
	BRA	label268437871
	BCF gbl_t1con,0
	NOP
	CALL tmr1_value_00000
	MOVF CompTempVarRet119, W, 1
	MOVWF ta_uvr_cal_00021_5_instr_count
	MOVF CompTempVarRet119+D'1', W, 1
	MOVWF ta_uvr_cal_00021_5_instr_count+D'1'
	MOVF ta_uvr_cal_00021_5_instr_count+D'1', W
	SUBLW 0x0B
	BNZ	label268437883
	MOVF ta_uvr_cal_00021_5_instr_count, W
	SUBLW 0xB8
label268437883
	BC	label268437884
	BTFSC ta_uvr_cal_00021_5_instr_count+D'1',7
	BRA	label268437884
	MOVF ta_uvr_cal_00021_5_instr_count, W
	MOVWF CompTempVar243
	RLCF ta_uvr_cal_00021_5_instr_count+D'1', W
	RRCF ta_uvr_cal_00021_5_instr_count+D'1', F
	RRCF CompTempVar243, W
	MOVWF ta_uvr_cal_00021_5_instr_count
label268437884
	MOVLW	HIGH(ta_uvr_cal_00021_1_periods)

	MOVWF	FSR0H
	MOVLW LOW(ta_uvr_cal_00021_1_periods+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_cal_00021_1_count, W
	MOVWF CompTempVar247
	BCF STATUS,C
	RLCF CompTempVar247, W
	ADDWF FSR0L, F
	MOVF ta_uvr_cal_00021_5_instr_count, W
	MOVWF INDF0
	MOVF ta_uvr_cal_00021_5_instr_count+D'1', W
	MOVWF PREINC0
	INCF ta_uvr_cal_00021_1_count, F
	BRA	label268437839
label268437840
	MOVLW 0x01
	MOVWF ta_uvr_cal_00021_1_count
	MOVF ta_uvr_cal_00021_1_periods, W, 1
	MOVWF CompTempVar250
	RLCF ta_uvr_cal_00021_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00021_1_periods+D'1', F, 1
	RRCF CompTempVar250, W
	MOVWF ta_uvr_cal_00021_1_periods, 1
label268437901
	MOVLW 0x10
	CPFSLT ta_uvr_cal_00021_1_count
	BRA	label268437902
	MOVLW	HIGH(ta_uvr_cal_00021_1_periods)

	MOVWF	FSR0H
	MOVLW LOW(ta_uvr_cal_00021_1_periods+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_cal_00021_1_count, W
	MOVWF CompTempVar256
	BCF STATUS,C
	RLCF CompTempVar256, W
	ADDWF FSR0L, F
	MOVF INDF0, W
	MOVWF CompTempVar257
	MOVF PREINC0, W
	MOVWF CompTempVar260
	RLCF CompTempVar260, W
	RRCF CompTempVar260, F
	RRCF CompTempVar257, W
	ADDWF ta_uvr_cal_00021_1_periods, W, 1
	MOVWF CompTempVar259
	MOVF ta_uvr_cal_00021_1_periods+D'1', W, 1
	ADDWFC CompTempVar260, F
	MOVF CompTempVar259, W
	MOVWF ta_uvr_cal_00021_1_periods, 1
	MOVF CompTempVar260, W
	MOVWF ta_uvr_cal_00021_1_periods+D'1', 1
	INCF ta_uvr_cal_00021_1_count, F
	BRA	label268437901
label268437902
	MOVF ta_uvr_cal_00021_1_periods, W, 1
	MOVWF CompTempVar263
	RLCF ta_uvr_cal_00021_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00021_1_periods+D'1', F, 1
	RRCF CompTempVar263, F
	RLCF ta_uvr_cal_00021_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00021_1_periods+D'1', F, 1
	RRCF CompTempVar263, F
	RLCF ta_uvr_cal_00021_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00021_1_periods+D'1', F, 1
	RRCF CompTempVar263, W
	MOVWF ta_uvr_cal_00021_1_periods, 1
	MOVF ta_uvr_cal_00021_1_periods, W, 1
	MOVWF CompTempVarRet241
	MOVF ta_uvr_cal_00021_1_periods+D'1', W, 1
	MOVWF CompTempVarRet241+D'1'
	RETURN
; } ta_uvr_calibrate_timer function end

	ORG 0x000007D4
serial_pri_00010
; { serial_print_dec ; function begin
	MOVLW 0x63
	CPFSGT serial_pri_00010_arg_number
	BRA	label268436677
	MOVF serial_pri_00010_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x64
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet415, W
	MOVWF CompTempVar190
	MOVLW 0x30
	ADDWF CompTempVar190, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	BRA	label268436696
label268436677
	MOVLW 0x02
	CPFSGT serial_pri_00010_arg_positions
	BRA	label268436696
	MOVLW 0x30
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
label268436696
	MOVLW 0x09
	CPFSGT serial_pri_00010_arg_number
	BRA	label268436703
	MOVF serial_pri_00010_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet415, W
	MOVWF CompTempVar192
	MOVLW 0x30
	ADDWF CompTempVar192, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	BRA	label268436722
label268436703
	MOVLW 0x01
	CPFSGT serial_pri_00010_arg_positions
	BRA	label268436722
	MOVLW 0x30
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
label268436722
	MOVF serial_pri_00010_arg_number, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet415, W
	MOVWF CompTempVar194
	MOVLW 0x30
	ADDWF CompTempVar194, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	RETURN
; } serial_print_dec function end

	ORG 0x00000872
serial_pri_0000E
; { serial_print_dec ; function begin
	MOVLW 0x63
	CPFSGT serial_pri_0000E_arg_number
	BRA	label268436460
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x64
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet415, W
	MOVWF CompTempVar140
	MOVLW 0x30
	ADDWF CompTempVar140, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
label268436460
	MOVLW 0x09
	CPFSGT serial_pri_0000E_arg_number
	BRA	label268436477
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet413, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet415, W
	MOVWF CompTempVar142
	MOVLW 0x30
	ADDWF CompTempVar142, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
label268436477
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet415, W
	MOVWF CompTempVar144
	MOVLW 0x30
	ADDWF CompTempVar144, W
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	RETURN
; } serial_print_dec function end

	ORG 0x000008EC
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

	ORG 0x00000906
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

	ORG 0x00000920
ta_uvr_ver_0001C
; { ta_uvr_verify_checksum ; function begin
	CLRF ta_uvr_ver_0001C_1_checksum
	CLRF ta_uvr_ver_0001C_1_byte_count
label268437337
	MOVLW 0x22
	CPFSLT ta_uvr_ver_0001C_1_byte_count
	BRA	label268437338
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001C_1_byte_count, W
	ADDWF FSR0L, F
	INCF ta_uvr_ver_0001C_1_byte_count, F
	MOVF INDF0, W
	ADDWF ta_uvr_ver_0001C_1_checksum, F
	BRA	label268437337
label268437338
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001C_1_byte_count, W
	ADDWF FSR0L, F
	MOVF INDF0, W
	CPFSEQ ta_uvr_ver_0001C_1_checksum
	BRA	label268437343
	CLRF ta_uvr_ver_0001C_1_byte_count
label268437347
	MOVLW 0x23
	CPFSLT ta_uvr_ver_0001C_1_byte_count
	BRA	label268437348
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001C_1_byte_count, W
	ADDWF FSR0L, F
	MOVF INDF0, W
	MOVWF CompTempVar294
	MOVLW	HIGH(gbl_data_cache)

	MOVWF	FSR0H
	MOVLW LOW(gbl_data_cache+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001C_1_byte_count, W
	ADDWF FSR0L, F
	MOVF CompTempVar294, W
	MOVWF INDF0
	INCF ta_uvr_ver_0001C_1_byte_count, F
	BRA	label268437347
label268437348
	MOVLW 0x01
	MOVWF gbl_ta_uvr_data_valid
	CLRF CompTempVarRet289
	RETURN
label268437343
	MOVLW 0x01
	MOVWF CompTempVarRet289
	RETURN
; } ta_uvr_verify_checksum function end

	ORG 0x0000098A
ta_uvr_sen_0001E
; { ta_uvr_send_data ; function begin
	CLRF ta_uvr_sen_0001E_1_snd_count
	MOVLW 0x90
	CPFSEQ gbl_data_cache
	BRA	label268437374
	BRA	label268437375
label268437374
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF CompTempVar301+D'1', 1
	MOVWF CompTempVar301+D'28', 1
	MOVLW 0x0D
	MOVWF CompTempVar301, 1
	MOVWF CompTempVar301+D'27', 1
	MOVLW 0x20
	MOVWF CompTempVar301+D'8', 1
	MOVWF CompTempVar301+D'11', 1
	MOVWF CompTempVar301+D'15', 1
	MOVWF CompTempVar301+D'18', 1
	MOVLW 0x21
	MOVWF CompTempVar301+D'26', 1
	MOVLW 0x2D
	MOVWF CompTempVar301+D'24', 1
	MOVLW 0x31
	MOVWF CompTempVar301+D'23', 1
	MOVLW 0x33
	MOVWF CompTempVar301+D'25', 1
	MOVLW 0x36
	MOVWF CompTempVar301+D'22', 1
	MOVLW 0x44
	MOVWF CompTempVar301+D'2', 1
	MOVLW 0x52
	MOVWF CompTempVar301+D'21', 1
	MOVLW 0x55
	MOVWF CompTempVar301+D'19', 1
	MOVLW 0x56
	MOVWF CompTempVar301+D'20', 1
	MOVLW 0x61
	MOVWF CompTempVar301+D'16', 1
	MOVLW 0x63
	MOVWF CompTempVar301+D'6', 1
	MOVLW 0x65
	MOVWF CompTempVar301+D'3', 1
	MOVWF CompTempVar301+D'7', 1
	MOVLW 0x69
	MOVWF CompTempVar301+D'5', 1
	MOVWF CompTempVar301+D'9', 1
	MOVLW 0x6E
	MOVWF CompTempVar301+D'12', 1
	MOVWF CompTempVar301+D'17', 1
	MOVLW 0x6F
	MOVWF CompTempVar301+D'13', 1
	MOVLW 0x73
	MOVWF CompTempVar301+D'10', 1
	MOVLW 0x74
	MOVWF CompTempVar301+D'14', 1
	MOVLW 0x76
	MOVWF CompTempVar301+D'4', 1
	CLRF CompTempVar301+D'29', 1
	MOVLW HIGH(CompTempVar301+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar301+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BRA	label268437383
label268437375
	MOVLW 0x0A
	MOVWF CompTempVar303+D'1'
	MOVWF CompTempVar303+D'24'
	MOVLW 0x0D
	MOVWF CompTempVar303
	MOVWF CompTempVar303+D'23'
	MOVLW 0x20
	MOVWF CompTempVar303+D'11'
	MOVWF CompTempVar303+D'15'
	MOVLW 0x2D
	MOVWF CompTempVar303+D'21'
	MOVLW 0x31
	MOVWF CompTempVar303+D'20'
	MOVLW 0x33
	MOVWF CompTempVar303+D'22'
	MOVLW 0x36
	MOVWF CompTempVar303+D'19'
	MOVLW 0x3A
	MOVWF CompTempVar303+D'14'
	MOVLW 0x43
	MOVWF CompTempVar303+D'2'
	MOVLW 0x52
	MOVWF CompTempVar303+D'18'
	MOVLW 0x55
	MOVWF CompTempVar303+D'16'
	MOVLW 0x56
	MOVWF CompTempVar303+D'17'
	MOVLW 0x63
	MOVWF CompTempVar303+D'7'
	MOVLW 0x64
	MOVWF CompTempVar303+D'10'
	MOVLW 0x65
	MOVWF CompTempVar303+D'6'
	MOVWF CompTempVar303+D'9'
	MOVLW 0x6E
	MOVWF CompTempVar303+D'4'
	MOVWF CompTempVar303+D'5'
	MOVLW 0x6F
	MOVWF CompTempVar303+D'3'
	MOVWF CompTempVar303+D'13'
	MOVLW 0x74
	MOVWF CompTempVar303+D'8'
	MOVWF CompTempVar303+D'12'
	CLRF CompTempVar303+D'25'
	MOVLW HIGH(CompTempVar303+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar303+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
label268437383
	MOVLW 0x20
	MOVWF CompTempVar305+D'5'
	MOVWF CompTempVar305+D'11'
	MOVLW 0x30
	MOVWF CompTempVar305+D'13'
	MOVLW 0x32
	MOVWF CompTempVar305+D'12'
	MOVLW 0x3A
	MOVWF CompTempVar305+D'10'
	MOVLW 0x4C
	MOVWF CompTempVar305
	MOVLW 0x61
	MOVWF CompTempVar305+D'3'
	MOVLW 0x63
	MOVWF CompTempVar305+D'2'
	MOVLW 0x65
	MOVWF CompTempVar305+D'9'
	MOVLW 0x69
	MOVWF CompTempVar305+D'7'
	MOVLW 0x6C
	MOVWF CompTempVar305+D'4'
	MOVLW 0x6D
	MOVWF CompTempVar305+D'8'
	MOVLW 0x6F
	MOVWF CompTempVar305+D'1'
	MOVLW 0x74
	MOVWF CompTempVar305+D'6'
	CLRF CompTempVar305+D'14'
	MOVLW HIGH(CompTempVar305+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar305+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'7', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x2D
	MOVWF CompTempVar309
	CLRF CompTempVar309+D'1'
	MOVLW HIGH(CompTempVar309+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar309+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'6', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x2D
	MOVWF CompTempVar313
	CLRF CompTempVar313+D'1'
	MOVLW HIGH(CompTempVar313+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar313+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'5', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x20
	MOVWF CompTempVar317
	CLRF CompTempVar317+D'1'
	MOVLW HIGH(CompTempVar317+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar317+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVLW 0x1F
	ANDWF gbl_data_cache+D'4', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x3A
	MOVWF CompTempVar321
	CLRF CompTempVar321+D'1'
	MOVLW HIGH(CompTempVar321+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar321+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'3', W
	MOVWF serial_pri_00010_arg_number
	MOVLW 0x02
	MOVWF serial_pri_00010_arg_positions
	CALL serial_pri_00010
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x20
	MOVWF CompTempVar325+D'6'
	MOVLW 0x3A
	MOVWF CompTempVar325+D'13'
	MOVLW 0x53
	MOVWF CompTempVar325
	MOVLW 0x61
	MOVWF CompTempVar325+D'8'
	MOVLW 0x65
	MOVWF CompTempVar325+D'1'
	MOVWF CompTempVar325+D'11'
	MOVLW 0x6C
	MOVWF CompTempVar325+D'9'
	MOVLW 0x6E
	MOVWF CompTempVar325+D'2'
	MOVLW 0x6F
	MOVWF CompTempVar325+D'4'
	MOVLW 0x72
	MOVWF CompTempVar325+D'5'
	MOVLW 0x73
	MOVWF CompTempVar325+D'3'
	MOVWF CompTempVar325+D'12'
	MOVLW 0x75
	MOVWF CompTempVar325+D'10'
	MOVLW 0x76
	MOVWF CompTempVar325+D'7'
	CLRF CompTempVar325+D'14'
	MOVLW HIGH(CompTempVar325+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar325+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x54
	MOVWF CompTempVar327
	MOVLW 0x31
	MOVWF CompTempVar327+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar327+D'2'
	MOVLW 0x20
	MOVWF CompTempVar327+D'3'
	CLRF CompTempVar327+D'4'
	MOVLW HIGH(CompTempVar327+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar327+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'8', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'9', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar333
	MOVLW 0x32
	MOVWF CompTempVar333+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar333+D'2'
	MOVLW 0x20
	MOVWF CompTempVar333+D'3'
	CLRF CompTempVar333+D'4'
	MOVLW HIGH(CompTempVar333+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar333+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'10', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'11', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar339
	MOVLW 0x33
	MOVWF CompTempVar339+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar339+D'2'
	MOVLW 0x20
	MOVWF CompTempVar339+D'3'
	CLRF CompTempVar339+D'4'
	MOVLW HIGH(CompTempVar339+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar339+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'12', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'13', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar345
	MOVLW 0x34
	MOVWF CompTempVar345+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar345+D'2'
	MOVLW 0x20
	MOVWF CompTempVar345+D'3'
	CLRF CompTempVar345+D'4'
	MOVLW HIGH(CompTempVar345+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar345+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'14', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'15', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar351
	MOVLW 0x35
	MOVWF CompTempVar351+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar351+D'2'
	MOVLW 0x20
	MOVWF CompTempVar351+D'3'
	CLRF CompTempVar351+D'4'
	MOVLW HIGH(CompTempVar351+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar351+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'16', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'17', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x54
	MOVWF CompTempVar357
	MOVLW 0x36
	MOVWF CompTempVar357+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar357+D'2'
	MOVLW 0x20
	MOVWF CompTempVar357+D'3'
	CLRF CompTempVar357+D'4'
	MOVLW HIGH(CompTempVar357+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar357+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_data_cache+D'18', W
	MOVWF ta_uvr_pri_0001F_arg_low
	MOVF gbl_data_cache+D'19', W
	MOVWF ta_uvr_pri_0001F_arg_high
	CALL ta_uvr_pri_0001F
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0A
	MOVWF CompTempVar363+D'15'
	MOVLW 0x0D
	MOVWF CompTempVar363+D'14'
	MOVLW 0x20
	MOVWF CompTempVar363+D'6'
	MOVWF CompTempVar363+D'19'
	MOVLW 0x31
	MOVWF CompTempVar363+D'17'
	MOVLW 0x3A
	MOVWF CompTempVar363+D'13'
	MOVWF CompTempVar363+D'18'
	MOVLW 0x41
	MOVWF CompTempVar363+D'16'
	MOVLW 0x4F
	MOVWF CompTempVar363
	MOVLW 0x61
	MOVWF CompTempVar363+D'8'
	MOVLW 0x65
	MOVWF CompTempVar363+D'11'
	MOVLW 0x6C
	MOVWF CompTempVar363+D'9'
	MOVLW 0x70
	MOVWF CompTempVar363+D'3'
	MOVLW 0x73
	MOVWF CompTempVar363+D'12'
	MOVLW 0x74
	MOVWF CompTempVar363+D'2'
	MOVWF CompTempVar363+D'5'
	MOVLW 0x75
	MOVWF CompTempVar363+D'1'
	MOVWF CompTempVar363+D'4'
	MOVWF CompTempVar363+D'10'
	MOVLW 0x76
	MOVWF CompTempVar363+D'7'
	CLRF CompTempVar363+D'20'
	MOVLW HIGH(CompTempVar363+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar363+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BTFSS gbl_data_cache+D'20',0
	BRA	label268437603
	MOVLW 0x6F
	MOVWF CompTempVar365
	MOVLW 0x6E
	MOVWF CompTempVar365+D'1'
	CLRF CompTempVar365+D'2'
	MOVLW HIGH(CompTempVar365+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar365+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BRA	label268437612
label268437603
	MOVLW 0x6F
	MOVWF CompTempVar367
	MOVLW 0x66
	MOVWF CompTempVar367+D'1'
	MOVWF CompTempVar367+D'2'
	CLRF CompTempVar367+D'3'
	MOVLW HIGH(CompTempVar367+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar367+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
label268437612
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x41
	MOVWF CompTempVar369
	MOVLW 0x32
	MOVWF CompTempVar369+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar369+D'2'
	MOVLW 0x20
	MOVWF CompTempVar369+D'3'
	CLRF CompTempVar369+D'4'
	MOVLW HIGH(CompTempVar369+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar369+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BTFSS gbl_data_cache+D'20',1
	BRA	label268437634
	MOVLW 0x6F
	MOVWF CompTempVar371
	MOVLW 0x6E
	MOVWF CompTempVar371+D'1'
	CLRF CompTempVar371+D'2'
	MOVLW HIGH(CompTempVar371+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar371+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BRA	label268437643
label268437634
	MOVLW 0x6F
	MOVWF CompTempVar373
	MOVLW 0x66
	MOVWF CompTempVar373+D'1'
	MOVWF CompTempVar373+D'2'
	CLRF CompTempVar373+D'3'
	MOVLW HIGH(CompTempVar373+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar373+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
label268437643
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x41
	MOVWF CompTempVar375
	MOVLW 0x33
	MOVWF CompTempVar375+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar375+D'2'
	MOVLW 0x20
	MOVWF CompTempVar375+D'3'
	CLRF CompTempVar375+D'4'
	MOVLW HIGH(CompTempVar375+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar375+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BTFSS gbl_data_cache+D'20',2
	BRA	label268437665
	MOVLW 0x6F
	MOVWF CompTempVar377
	MOVLW 0x6E
	MOVWF CompTempVar377+D'1'
	CLRF CompTempVar377+D'2'
	MOVLW HIGH(CompTempVar377+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar377+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BRA	label268437674
label268437665
	MOVLW 0x6F
	MOVWF CompTempVar379
	MOVLW 0x66
	MOVWF CompTempVar379+D'1'
	MOVWF CompTempVar379+D'2'
	CLRF CompTempVar379+D'3'
	MOVLW HIGH(CompTempVar379+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar379+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
label268437674
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x50
	MOVWF CompTempVar381
	MOVLW 0x75
	MOVWF CompTempVar381+D'1'
	MOVLW 0x6D
	MOVWF CompTempVar381+D'2'
	MOVLW 0x70
	MOVWF CompTempVar381+D'3'
	MOVLW 0x3A
	MOVWF CompTempVar381+D'4'
	MOVLW 0x20
	MOVWF CompTempVar381+D'5'
	CLRF CompTempVar381+D'6'
	MOVLW HIGH(CompTempVar381+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar381+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BTFSS gbl_data_cache+D'21',7
	BRA	label268437696
	MOVLW 0x20
	MOVWF CompTempVar383+D'8'
	MOVWF CompTempVar383+D'12'
	MOVWF CompTempVar383+D'16'
	MOVLW 0x61
	MOVWF CompTempVar383+D'1'
	MOVWF CompTempVar383+D'4'
	MOVWF CompTempVar383+D'17'
	MOVLW 0x62
	MOVWF CompTempVar383+D'5'
	MOVLW 0x63
	MOVWF CompTempVar383+D'18'
	MOVLW 0x65
	MOVWF CompTempVar383+D'7'
	MOVWF CompTempVar383+D'22'
	MOVLW 0x69
	MOVWF CompTempVar383+D'3'
	MOVWF CompTempVar383+D'20'
	MOVLW 0x6C
	MOVWF CompTempVar383+D'6'
	MOVLW 0x6D
	MOVWF CompTempVar383+D'11'
	MOVLW 0x6E
	MOVWF CompTempVar383+D'13'
	MOVLW 0x6F
	MOVWF CompTempVar383+D'14'
	MOVLW 0x70
	MOVWF CompTempVar383+D'10'
	MOVLW 0x72
	MOVWF CompTempVar383+D'2'
	MOVWF CompTempVar383+D'9'
	MOVLW 0x74
	MOVWF CompTempVar383+D'15'
	MOVWF CompTempVar383+D'19'
	MOVLW 0x76
	MOVWF CompTempVar383
	MOVWF CompTempVar383+D'21'
	CLRF CompTempVar383+D'23'
	MOVLW HIGH(CompTempVar383+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar383+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BRA	label268437705
label268437696
	MOVLW 0x1F
	ANDWF gbl_data_cache+D'21', W
	MOVWF serial_pri_0000E_arg_number
	CALL serial_pri_0000E
label268437705
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	CLRF gbl_ta_uvr_data_valid
	RETURN
; } ta_uvr_send_data function end

	ORG 0x00000EB4
ta_uvr_get_0001B
; { ta_uvr_getinfo ; function begin
	BCF ta_uvr_get_0001B_1_done,0
	BCF ta_uvr_get_0001B_1_firstrun,1
	CLRF ta_uvr_get_0001B_1_counter
	CLRF ta_uvr_get_0001B_1_input
	CLRF ta_uvr_get_0001B_1_bytecount
	CLRF ta_uvr_get_0001B_1_databyte
	CALL ta_uvr_cal_00021
	MOVF CompTempVarRet241, W
	MOVWF ta_uvr_get_0001B_1_bit_time
	MOVF CompTempVarRet241+D'1', W
	MOVWF ta_uvr_get_0001B_1_bit_time+D'1'
	MOVF ta_uvr_get_0001B_1_bit_time, F
	BNZ	label268437160
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', F
	BNZ	label268437160
	MOVLW 0x01
	MOVWF CompTempVarRet214
	RETURN
label268437160
	MOVF ta_uvr_get_0001B_1_bit_time, W
	MOVWF CompTempVar215
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', W
	MOVWF CompTempVar216
	RLCF CompTempVar216, W
	RRCF CompTempVar216, F
	RRCF CompTempVar215, W
	SUBLW 0xFF
	MOVWF ta_uvr_get_0001B_1_timer_wait
	MOVLW 0xFF
	SUBFWB CompTempVar216, W
	MOVWF ta_uvr_get_0001B_1_timer_wait+D'1'
label268437170
	MOVF ta_uvr_get_0001B_1_bit_time, W
	MOVWF ta_uvr_wai_00023_arg_bit_time
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', W
	MOVWF ta_uvr_wai_00023_arg_bit_time+D'1'
	CALL ta_uvr_wai_00023
	TSTFSZ CompTempVarRet265
	BRA	label268437176
	CALL ta_uvr_cal_00021
	MOVF CompTempVarRet241, W
	MOVWF ta_uvr_get_0001B_1_bit_time
	MOVF CompTempVarRet241+D'1', W
	MOVWF ta_uvr_get_0001B_1_bit_time+D'1'
	MOVF ta_uvr_get_0001B_1_bit_time, W
	MOVWF CompTempVar219
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', W
	MOVWF CompTempVar220
	RLCF CompTempVar220, W
	RRCF CompTempVar220, F
	RRCF CompTempVar219, W
	SUBLW 0xFF
	MOVWF CompTempVar221
	MOVLW 0xFF
	SUBFWB CompTempVar220, W
	MOVWF CompTempVar222
	MOVF CompTempVar221, W
	MOVWF ta_uvr_get_0001B_1_timer_wait
	MOVF CompTempVar222, W
	MOVWF ta_uvr_get_0001B_1_timer_wait+D'1'
	BRA	label268437170
label268437176
	MOVF ta_uvr_get_0001B_1_timer_wait, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_get_0001B_1_timer_wait+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
	BCF gbl_tmr1if,0
label268437193
	BTFSC gbl_tmr1if,0
	BRA	label268437194
	NOP
	BRA	label268437193
label268437194
	MOVLW 0x01
	MOVWF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
	MOVF ta_uvr_get_0001B_1_bit_time, W
	MOVWF CompTempVar225
	MOVF ta_uvr_get_0001B_1_bit_time+D'1', W
	MOVWF CompTempVar226
	BCF STATUS,C
	RLCF CompTempVar225, F
	RLCF CompTempVar226, F
	MOVF CompTempVar225, W
	SUBLW 0xFF
	MOVWF tmr1_set_00000_arg_value
	MOVLW 0xFF
	SUBFWB CompTempVar226, W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
	BSF ta_uvr_get_0001B_1_firstrun,1
	CLRF ta_uvr_get_0001B_1_bytecount
label268437220
	MOVLW 0x23
	CPFSLT ta_uvr_get_0001B_1_bytecount
	BRA	label268437221
label4026532991
	BTFSC gbl_ta_uvr_gotbit,0
	BRA	label268437225
	BTFSC ta_uvr_get_0001B_1_firstrun,1
	BRA	label268437225
	NOP
	BRA	label4026532991
label268437225
	CLRF CompTempVar229
	BTFSC gbl_uvr_data,2
	INCF CompTempVar229, F
	MOVF CompTempVar229, W
	MOVWF ta_uvr_get_0001B_1_input
	BSF gbl_portb,1
	BCF gbl_portb,1
	BCF ta_uvr_get_0001B_1_firstrun,1
	BCF gbl_ta_uvr_gotbit,0
	MOVF ta_uvr_get_0001B_1_counter, F
	BNZ	label268437241
	MOVF ta_uvr_get_0001B_1_input, F
	BNZ	label268437244
	MOVLW 0x20
	MOVWF CompTempVar230+D'5'
	MOVWF CompTempVar230+D'9'
	MOVWF CompTempVar230+D'13'
	MOVWF CompTempVar230+D'18'
	MOVWF CompTempVar230+D'22'
	MOVWF CompTempVar230+D'27'
	MOVLW 0x53
	MOVWF CompTempVar230
	MOVLW 0x61
	MOVWF CompTempVar230+D'2'
	MOVLW 0x62
	MOVWF CompTempVar230+D'6'
	MOVWF CompTempVar230+D'23'
	MOVLW 0x65
	MOVWF CompTempVar230+D'15'
	MOVWF CompTempVar230+D'26'
	MOVLW 0x66
	MOVWF CompTempVar230+D'19'
	MOVLW 0x69
	MOVWF CompTempVar230+D'7'
	MOVLW 0x6E
	MOVWF CompTempVar230+D'10'
	MOVLW 0x6F
	MOVWF CompTempVar230+D'11'
	MOVWF CompTempVar230+D'17'
	MOVWF CompTempVar230+D'20'
	MOVLW 0x72
	MOVWF CompTempVar230+D'3'
	MOVWF CompTempVar230+D'16'
	MOVWF CompTempVar230+D'21'
	MOVLW 0x74
	MOVWF CompTempVar230+D'1'
	MOVWF CompTempVar230+D'4'
	MOVWF CompTempVar230+D'8'
	MOVWF CompTempVar230+D'12'
	MOVWF CompTempVar230+D'25'
	MOVLW 0x79
	MOVWF CompTempVar230+D'24'
	MOVLW 0x7A
	MOVWF CompTempVar230+D'14'
	CLRF CompTempVar230+D'28'
	MOVLW HIGH(CompTempVar230+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar230+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF ta_uvr_get_0001B_1_bytecount, W
	MOVWF serial_pri_0000E_arg_number
	CALL serial_pri_0000E
	MOVLW 0x21
	MOVWF CompTempVar232
	MOVWF CompTempVar232+D'1'
	MOVLW 0x20
	MOVWF CompTempVar232+D'2'
	MOVLW 0x51
	MOVWF CompTempVar232+D'3'
	MOVLW 0x75
	MOVWF CompTempVar232+D'4'
	MOVLW 0x69
	MOVWF CompTempVar232+D'5'
	MOVLW 0x74
	MOVWF CompTempVar232+D'6'
	MOVLW 0x2E
	MOVWF CompTempVar232+D'7'
	MOVWF CompTempVar232+D'8'
	MOVWF CompTempVar232+D'9'
	CLRF CompTempVar232+D'10'
	MOVLW HIGH(CompTempVar232+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar232+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x01
	MOVWF CompTempVarRet214
	RETURN
label268437244
	CLRF ta_uvr_get_0001B_1_databyte
	INCF ta_uvr_get_0001B_1_counter, F
	BRA	label268437220
label268437241
	MOVLW 0x09
	CPFSEQ ta_uvr_get_0001B_1_counter
	BRA	label268437277
	DECF ta_uvr_get_0001B_1_input, W
	BNZ	label268437280
	MOVLW 0x20
	MOVWF CompTempVar234+D'4'
	MOVWF CompTempVar234+D'8'
	MOVWF CompTempVar234+D'12'
	MOVWF CompTempVar234+D'16'
	MOVWF CompTempVar234+D'20'
	MOVWF CompTempVar234+D'25'
	MOVLW 0x53
	MOVWF CompTempVar234
	MOVLW 0x62
	MOVWF CompTempVar234+D'5'
	MOVWF CompTempVar234+D'21'
	MOVLW 0x65
	MOVWF CompTempVar234+D'15'
	MOVWF CompTempVar234+D'24'
	MOVLW 0x66
	MOVWF CompTempVar234+D'17'
	MOVLW 0x69
	MOVWF CompTempVar234+D'6'
	MOVLW 0x6E
	MOVWF CompTempVar234+D'9'
	MOVWF CompTempVar234+D'14'
	MOVLW 0x6F
	MOVWF CompTempVar234+D'2'
	MOVWF CompTempVar234+D'10'
	MOVWF CompTempVar234+D'13'
	MOVWF CompTempVar234+D'18'
	MOVLW 0x70
	MOVWF CompTempVar234+D'3'
	MOVLW 0x72
	MOVWF CompTempVar234+D'19'
	MOVLW 0x74
	MOVWF CompTempVar234+D'1'
	MOVWF CompTempVar234+D'7'
	MOVWF CompTempVar234+D'11'
	MOVWF CompTempVar234+D'23'
	MOVLW 0x79
	MOVWF CompTempVar234+D'22'
	CLRF CompTempVar234+D'26'
	MOVLW HIGH(CompTempVar234+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar234+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF ta_uvr_get_0001B_1_bytecount, W
	MOVWF serial_pri_0000E_arg_number
	CALL serial_pri_0000E
	MOVLW 0x21
	MOVWF CompTempVar236
	MOVWF CompTempVar236+D'1'
	MOVLW 0x20
	MOVWF CompTempVar236+D'2'
	MOVLW 0x51
	MOVWF CompTempVar236+D'3'
	MOVLW 0x75
	MOVWF CompTempVar236+D'4'
	MOVLW 0x69
	MOVWF CompTempVar236+D'5'
	MOVLW 0x74
	MOVWF CompTempVar236+D'6'
	MOVLW 0x2E
	MOVWF CompTempVar236+D'7'
	MOVWF CompTempVar236+D'8'
	MOVWF CompTempVar236+D'9'
	CLRF CompTempVar236+D'10'
	MOVLW HIGH(CompTempVar236+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar236+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x01
	MOVWF CompTempVarRet214
	RETURN
label268437280
	CLRF ta_uvr_get_0001B_1_counter
	MOVLW 0xFF
	XORWF ta_uvr_get_0001B_1_databyte, W
	MOVWF CompTempVar239
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_get_0001B_1_bytecount, W
	ADDWF FSR0L, F
	MOVF CompTempVar239, W
	MOVWF INDF0
	INCF ta_uvr_get_0001B_1_bytecount, F
	BCF gbl_t1con,0
	MOVF ta_uvr_get_0001B_1_timer_wait, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_get_0001B_1_timer_wait+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
label268437322
	BTFSS gbl_uvr_data,2
	BRA	label268437322
	BSF gbl_t1con,0
	BRA	label268437220
label268437277
	MOVF ta_uvr_get_0001B_1_databyte, W
	MOVWF CompTempVar240
	BCF STATUS,C
	RRCF CompTempVar240, W
	MOVWF ta_uvr_get_0001B_1_databyte
	BCF ta_uvr_get_0001B_1_databyte,7
	BTFSC ta_uvr_get_0001B_1_input,0
	BSF ta_uvr_get_0001B_1_databyte,7
	INCF ta_uvr_get_0001B_1_counter, F
	BRA	label268437220
label268437221
	CLRF CompTempVarRet214
	RETURN
; } ta_uvr_getinfo function end

	ORG 0x0000114E
ta_uvr_dat_0001D
; { ta_uvr_data_available ; function begin
	MOVF gbl_ta_uvr_data_valid, W
	MOVWF CompTempVarRet295
	RETURN
; } ta_uvr_data_available function end

	ORG 0x00001154
serial_get_00012
; { serial_getch ; function begin
	BTFSS gbl_rcsta,1
	BRA	label268436766
	MOVLW 0x4F
	MOVWF CompTempVar197
	MOVLW 0x45
	MOVWF CompTempVar197+D'1'
	MOVLW 0x52
	MOVWF CompTempVar197+D'2'
	MOVWF CompTempVar197+D'3'
	CLRF CompTempVar197+D'4'
	MOVLW HIGH(CompTempVar197+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar197+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BCF gbl_rcsta,4
	BSF gbl_rcsta,4
label268436766
	BTFSS gbl_pir1,5
	BRA	label268436766
	MOVF gbl_rcreg, W
	MOVWF CompTempVarRet195
	RETURN
; } serial_getch function end

	ORG 0x00001182
report_and_00022
; { report_and_reset_int_count ; function begin
	CLRF report_and_00022_1_count_shadow
	CLRF report_and_00022_1_count_shadow+D'1'
	MOVLW 0x20
	MOVWF CompTempVar121+D'9'
	MOVWF CompTempVar121+D'13'
	MOVLW 0x2E
	MOVWF CompTempVar121+D'23'
	MOVWF CompTempVar121+D'24'
	MOVWF CompTempVar121+D'25'
	MOVLW 0x52
	MOVWF CompTempVar121
	MOVLW 0x61
	MOVWF CompTempVar121+D'10'
	MOVLW 0x64
	MOVWF CompTempVar121+D'12'
	MOVLW 0x65
	MOVWF CompTempVar121+D'1'
	MOVWF CompTempVar121+D'15'
	MOVWF CompTempVar121+D'17'
	MOVLW 0x67
	MOVWF CompTempVar121+D'8'
	MOVWF CompTempVar121+D'22'
	MOVLW 0x69
	MOVWF CompTempVar121+D'6'
	MOVWF CompTempVar121+D'20'
	MOVLW 0x6E
	MOVWF CompTempVar121+D'7'
	MOVWF CompTempVar121+D'11'
	MOVWF CompTempVar121+D'21'
	MOVLW 0x6F
	MOVWF CompTempVar121+D'3'
	MOVLW 0x70
	MOVWF CompTempVar121+D'2'
	MOVLW 0x72
	MOVWF CompTempVar121+D'4'
	MOVWF CompTempVar121+D'14'
	MOVLW 0x73
	MOVWF CompTempVar121+D'16'
	MOVLW 0x74
	MOVWF CompTempVar121+D'5'
	MOVWF CompTempVar121+D'18'
	MOVWF CompTempVar121+D'19'
	CLRF CompTempVar121+D'26'
	MOVLW HIGH(CompTempVar121+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar121+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x57
	MOVWF CompTempVar123
	MOVLW 0x61
	MOVWF CompTempVar123+D'1'
	MOVLW 0x74
	MOVWF CompTempVar123+D'2'
	MOVWF CompTempVar123+D'3'
	MOVLW 0x2D
	MOVWF CompTempVar123+D'4'
	MOVLW 0x68
	MOVWF CompTempVar123+D'5'
	MOVLW 0x6F
	MOVWF CompTempVar123+D'6'
	MOVLW 0x75
	MOVWF CompTempVar123+D'7'
	MOVLW 0x72
	MOVWF CompTempVar123+D'8'
	MOVLW 0x73
	MOVWF CompTempVar123+D'9'
	MOVLW 0x3A
	MOVWF CompTempVar123+D'10'
	MOVLW 0x20
	MOVWF CompTempVar123+D'11'
	CLRF CompTempVar123+D'12'
	MOVLW HIGH(CompTempVar123+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar123+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
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
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x45
	MOVWF CompTempVar125
	MOVLW 0x4F
	MOVWF CompTempVar125+D'1'
	MOVLW 0x54
	MOVWF CompTempVar125+D'2'
	CLRF CompTempVar125+D'3'
	MOVLW HIGH(CompTempVar125+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar125+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	RETURN
; } report_and_reset_int_count function end

	ORG 0x0000127A
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
label268435929
	MOVF init_00000_1_blink_count, W
	MOVWF CompTempVar120
	INCF init_00000_1_blink_count, F
	MOVLW 0x05
	CPFSLT CompTempVar120
	BRA	label268435931
	MOVLW 0x32
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_stat0,4
	MOVLW 0x32
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BSF gbl_stat0,4
	BRA	label268435929
label268435931
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	BCF gbl_intcon2,7
	BCF gbl_intcon2,6
	BCF gbl_intcon,1
	BSF gbl_intcon,4
	BSF gbl_intcon,7
	MOVLW 0x01
	MOVWF tmr3_setup_00000_arg_irq_mode
	CALL tmr3_setup_00000
	RETURN
; } init function end

	ORG 0x000012E6
main
; { main ; function begin
	CLRF main_1_tmp
	CLRF main_1_valid_data
	CLRF main_1_prev_count
	CLRF main_1_prev_count+D'1'
	CALL init_00000
	BCF gbl_stat0,4
label268436080
	MOVF gbl_interrupt_count, W
	CPFSEQ main_1_prev_count
	BRA	label4026533003
	MOVF gbl_interrupt_count+D'1', W
	CPFSEQ main_1_prev_count+D'1'
	CPFSEQ gbl_interrupt_count+D'1'
	BRA	label268436084
label4026533003
	MOVF gbl_interrupt_count, W
	MOVWF main_1_prev_count
	MOVF gbl_interrupt_count+D'1', W
	MOVWF main_1_prev_count+D'1'
label268436084
	CALL ta_uvr_get_0001B
	MOVF CompTempVarRet214, F
	BNZ	label268436093
	CALL ta_uvr_ver_0001C
	MOVF CompTempVarRet289, F
label268436093
	BTFSS gbl_pir1,5
	BRA	label268436080
	CALL serial_get_00012
	MOVF CompTempVarRet195, W
	MOVWF main_1_command_byte
	MOVLW 0x53
	CPFSEQ main_1_command_byte
	BRA	label268436100
	CALL report_and_00022
	BRA	label268436080
label268436100
	CALL ta_uvr_dat_0001D
	MOVF CompTempVarRet295, F
	BZ	label268436107
	CALL ta_uvr_sen_0001E
	BRA	label268436112
label268436107
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
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar127+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
label268436112
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x20
	MOVWF CompTempVar129+D'7'
	MOVLW 0x3A
	MOVWF CompTempVar129+D'14'
	MOVLW 0x44
	MOVWF CompTempVar129
	MOVLW 0x61
	MOVWF CompTempVar129+D'5'
	MOVLW 0x67
	MOVWF CompTempVar129+D'2'
	MOVLW 0x69
	MOVWF CompTempVar129+D'1'
	MOVWF CompTempVar129+D'3'
	MOVWF CompTempVar129+D'8'
	MOVLW 0x6C
	MOVWF CompTempVar129+D'6'
	MOVLW 0x6E
	MOVWF CompTempVar129+D'9'
	MOVLW 0x70
	MOVWF CompTempVar129+D'10'
	MOVLW 0x73
	MOVWF CompTempVar129+D'13'
	MOVLW 0x74
	MOVWF CompTempVar129+D'4'
	MOVWF CompTempVar129+D'12'
	MOVLW 0x75
	MOVWF CompTempVar129+D'11'
	CLRF CompTempVar129+D'15'
	MOVLW HIGH(CompTempVar129+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar129+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVLW 0x0A
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x57
	MOVWF CompTempVar131
	MOVLW 0x61
	MOVWF CompTempVar131+D'1'
	MOVLW 0x74
	MOVWF CompTempVar131+D'2'
	MOVWF CompTempVar131+D'3'
	MOVLW 0x2D
	MOVWF CompTempVar131+D'4'
	MOVLW 0x68
	MOVWF CompTempVar131+D'5'
	MOVLW 0x6F
	MOVWF CompTempVar131+D'6'
	MOVLW 0x75
	MOVWF CompTempVar131+D'7'
	MOVLW 0x72
	MOVWF CompTempVar131+D'8'
	MOVLW 0x73
	MOVWF CompTempVar131+D'9'
	MOVLW 0x3A
	MOVWF CompTempVar131+D'10'
	MOVLW 0x20
	MOVWF CompTempVar131+D'11'
	CLRF CompTempVar131+D'12'
	MOVLW HIGH(CompTempVar131+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar131+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	MOVF gbl_interrupt_count, W
	MOVWF serial_pri_0000B_arg_value
	MOVF gbl_interrupt_count+D'1', W
	MOVWF serial_pri_0000B_arg_value+D'1'
	CALL serial_pri_0000B
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x0D
	MOVWF serial_pri_00008_arg_value, 1
	CALL serial_pri_00008
	MOVLW 0x45
	MOVWF CompTempVar133
	MOVLW 0x4F
	MOVWF CompTempVar133+D'1'
	MOVLW 0x54
	MOVWF CompTempVar133+D'2'
	CLRF CompTempVar133+D'3'
	MOVLW HIGH(CompTempVar133+D'0')
	MOVWF serial_pri_0000A_arg_text+D'1'
	MOVLW LOW(CompTempVar133+D'0')
	MOVWF serial_pri_0000A_arg_text
	CALL serial_pri_0000A
	BRA	label268436080
; } main function end

	ORG 0x000014CE
_startup
	CLRF gbl_ta_uvr_data_valid
	GOTO	main
	ORG 0x000014D4
interrupt
; { interrupt ; function begin
	MOVFF FSR0H,  Int1Context
	MOVFF FSR0L,  Int1Context+D'1'
	MOVFF PRODH,  Int1Context+D'2'
	MOVFF PRODL,  Int1Context+D'3'
	BTFSS gbl_tmr1if,0
	BRA	label268436177
	MOVF gbl_ta_uvr_tmrh, W
	MOVWF gbl_tmr1h
	MOVF gbl_ta_uvr_tmrl, W
	MOVWF gbl_tmr1l
	BSF gbl_ta_uvr_gotbit,0
	BCF gbl_pir1,0
label268436177
	BTFSS gbl_intcon,1
	BRA	label268436184
	BTFSS gbl_intcon,4
	BRA	label268436184
	BSF gbl_stat0,4
	INFSNZ gbl_interrupt_count, F
	INCF gbl_interrupt_count+D'1', F
	BCF gbl_intcon,4
	MOVLB 0x00
	CLRF tmr3_set_00000_arg_value, 1
	CLRF tmr3_set_00000_arg_value+D'1', 1
	CALL tmr3_set_00000
	CLRF gbl_tmr3_count
	BSF gbl_t3con,0
	BCF gbl_intcon,1
label268436184
	BTFSS gbl_tmr3if,1
	BRA	label268436198
	INCF gbl_tmr3_count, F
	MOVLW 0x04
	CPFSEQ gbl_tmr3_count
	BRA	label268436202
	BCF gbl_t3con,0
	BCF gbl_intcon,1
	BSF gbl_intcon,4
	BCF gbl_stat0,4
label268436202
	BCF gbl_tmr3if,1
label268436198
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
