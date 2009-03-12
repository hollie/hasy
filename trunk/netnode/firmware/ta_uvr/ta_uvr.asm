;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 6.81
;// License Type  : Full License
;// Limitations   : PIC18 max code size:Unlimited, max RAM banks:Unlimited, Non commercial use only
;/////////////////////////////////////////////////////////////////////////////////

	include "P18F2320.inc"
__HEAPSTART                      EQU	0x000000B9 ; Start address of heap 
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
tmr1_setup_00000_arg_irq_mode    EQU	0x00000077 ; bytes:1
tmr1_set_00000_arg_value         EQU	0x0000007B ; bytes:2
CompTempVarRet134                EQU	0x000000A0 ; bytes:2
tmr1_value_00000_1_value         EQU	0x0000007D ; bytes:2
gbl_stat0                        EQU	0x00000F80 ; bit:4
gbl_uvr_data                     EQU	0x00000F82 ; bit:2
gbl_interrupt_count              EQU	0x0000004B ; bytes:2
init_00000_1_blink_count         EQU	0x00000056 ; bytes:1
CompTempVar148                   EQU	0x00000057 ; bytes:1
main_1_tmp                       EQU	0x00000051 ; bytes:1
main_1_command_byte              EQU	0x00000052 ; bytes:1
main_1_valid_data                EQU	0x00000053 ; bytes:1
main_1_prev_count                EQU	0x00000054 ; bytes:2
CompTempVar149                   EQU	0x00000080 ; bytes:56
CompTempVar151                   EQU	0x00000061 ; bytes:13
CompTempVar153                   EQU	0x00000056 ; bytes:4
serial_ini_0000B_arg_brg         EQU	0x00000058 ; bytes:1
serial_pri_00009_arg_value       EQU	0x000000B8 ; bytes:1
serial_pri_00007_arg_text        EQU	0x0000005F ; bytes:2
serial_pri_00007_1_i             EQU	0x0000007F ; bytes:1
serial_pri_0000D_arg_number      EQU	0x0000005F ; bytes:1
CompTempVar160                   EQU	0x00000064 ; bytes:1
CompTempVar162                   EQU	0x00000064 ; bytes:1
CompTempVar164                   EQU	0x00000060 ; bytes:1
serial_pri_0000E_arg_number      EQU	0x0000005D ; bytes:2
CompTempVar170                   EQU	0x00000067 ; bytes:1
CompTempVar171                   EQU	0x00000068 ; bytes:1
CompTempVar172                   EQU	0x00000069 ; bytes:1
CompTempVar173                   EQU	0x0000006A ; bytes:1
CompTempVar179                   EQU	0x00000067 ; bytes:1
CompTempVar180                   EQU	0x00000068 ; bytes:1
CompTempVar181                   EQU	0x00000069 ; bytes:1
CompTempVar182                   EQU	0x0000006A ; bytes:1
CompTempVar188                   EQU	0x00000067 ; bytes:1
CompTempVar189                   EQU	0x00000068 ; bytes:1
CompTempVar190                   EQU	0x00000069 ; bytes:1
CompTempVar191                   EQU	0x0000006A ; bytes:1
CompTempVar197                   EQU	0x00000067 ; bytes:1
CompTempVar198                   EQU	0x00000068 ; bytes:1
CompTempVar199                   EQU	0x00000069 ; bytes:1
CompTempVar200                   EQU	0x0000006A ; bytes:1
CompTempVar201                   EQU	0x00000061 ; bytes:2
CompTempVar203                   EQU	0x00000061 ; bytes:2
CompTempVar207                   EQU	0x0000005F ; bytes:1
CompTempVar208                   EQU	0x00000060 ; bytes:1
serial_pri_0000F_arg_number      EQU	0x00000057 ; bytes:1
serial_pri_0000F_arg_positions   EQU	0x00000058 ; bytes:1
CompTempVar210                   EQU	0x00000059 ; bytes:1
CompTempVar212                   EQU	0x00000059 ; bytes:1
CompTempVar214                   EQU	0x00000059 ; bytes:1
CompTempVarRet215                EQU	0x00000056 ; bytes:1
CompTempVar217                   EQU	0x00000059 ; bytes:5
gbl_ta_uvr_gotbit                EQU	0x0000004D ; bit:0
gbl_mydata                       EQU	0x00000005 ; bytes:35
gbl_data_cache                   EQU	0x00000028 ; bytes:35
gbl_ta_uvr_tmrl                  EQU	0x0000004E ; bytes:1
gbl_ta_uvr_tmrh                  EQU	0x0000004F ; bytes:1
gbl_ta_uvr_data_valid            EQU	0x00000050 ; bytes:1
ta_uvr_get_0001C_1_done          EQU	0x00000056 ; bit:0
ta_uvr_get_0001C_1_firstrun      EQU	0x00000056 ; bit:1
ta_uvr_get_0001C_1_counter       EQU	0x00000057 ; bytes:1
ta_uvr_get_0001C_1_input         EQU	0x00000058 ; bytes:1
ta_uvr_get_0001C_1_bytecount     EQU	0x00000059 ; bytes:1
ta_uvr_get_0001C_1_databyte      EQU	0x0000005A ; bytes:1
ta_uvr_get_0001C_1_bit_time      EQU	0x0000005B ; bytes:2
ta_uvr_get_0001C_1_timer_wait    EQU	0x0000005D ; bytes:2
CompTempVarRet260                EQU	0x0000007B ; bytes:2
CompTempVar234                   EQU	0x0000005F ; bytes:1
CompTempVar235                   EQU	0x00000060 ; bytes:1
CompTempVarRet284                EQU	0x00000076 ; bytes:1
CompTempVar238                   EQU	0x0000005F ; bytes:1
CompTempVar239                   EQU	0x00000060 ; bytes:1
CompTempVar240                   EQU	0x00000061 ; bytes:1
CompTempVar241                   EQU	0x00000062 ; bytes:1
CompTempVar244                   EQU	0x0000005F ; bytes:1
CompTempVar245                   EQU	0x00000060 ; bytes:1
CompTempVar248                   EQU	0x0000005F ; bytes:1
CompTempVar249                   EQU	0x00000061 ; bytes:29
CompTempVar251                   EQU	0x00000061 ; bytes:11
CompTempVar253                   EQU	0x00000061 ; bytes:27
CompTempVar255                   EQU	0x00000061 ; bytes:11
CompTempVar258                   EQU	0x0000005F ; bytes:1
CompTempVar259                   EQU	0x0000005F ; bytes:1
CompTempVarRet308                EQU	0x00000058 ; bytes:1
ta_uvr_ver_0001D_1_checksum      EQU	0x00000056 ; bytes:1
ta_uvr_ver_0001D_1_byte_count    EQU	0x00000057 ; bytes:1
CompTempVar313                   EQU	0x00000058 ; bytes:1
CompTempVarRet314                EQU	0x00000056 ; bytes:1
ta_uvr_sen_0001F_1_snd_count     EQU	0x00000056 ; bytes:1
CompTempVar320                   EQU	0x00000061 ; bytes:30
CompTempVar322                   EQU	0x00000061 ; bytes:26
CompTempVar324                   EQU	0x00000061 ; bytes:15
CompTempVar328                   EQU	0x00000057 ; bytes:2
CompTempVar332                   EQU	0x00000057 ; bytes:2
CompTempVar336                   EQU	0x00000057 ; bytes:2
CompTempVar340                   EQU	0x00000057 ; bytes:2
CompTempVar344                   EQU	0x00000061 ; bytes:15
CompTempVar346                   EQU	0x00000059 ; bytes:5
CompTempVar352                   EQU	0x00000059 ; bytes:5
CompTempVar358                   EQU	0x00000059 ; bytes:5
CompTempVar364                   EQU	0x00000059 ; bytes:5
CompTempVar370                   EQU	0x00000059 ; bytes:5
CompTempVar376                   EQU	0x00000059 ; bytes:5
CompTempVar382                   EQU	0x00000061 ; bytes:21
CompTempVar384                   EQU	0x00000057 ; bytes:3
CompTempVar386                   EQU	0x00000057 ; bytes:4
CompTempVar388                   EQU	0x00000059 ; bytes:5
CompTempVar390                   EQU	0x00000057 ; bytes:3
CompTempVar392                   EQU	0x00000057 ; bytes:4
CompTempVar394                   EQU	0x00000059 ; bytes:5
CompTempVar396                   EQU	0x00000057 ; bytes:3
CompTempVar398                   EQU	0x00000057 ; bytes:4
CompTempVar400                   EQU	0x00000061 ; bytes:7
CompTempVar402                   EQU	0x00000061 ; bytes:24
ta_uvr_pri_00020_arg_low         EQU	0x00000057 ; bytes:1
ta_uvr_pri_00020_arg_high        EQU	0x00000058 ; bytes:1
ta_uvr_pri_00020_1_value_type    EQU	0x00000059 ; bytes:1
ta_uvr_pri_00020_1_temp          EQU	0x0000005A ; bytes:2
ta_uvr_pri_00020_1_high_restored EQU	0x0000005C ; bytes:1
CompTempVar406                   EQU	0x00000061 ; bytes:14
CompTempVar408                   EQU	0x00000061 ; bytes:4
CompTempVar410                   EQU	0x00000061 ; bytes:3
CompTempVar412                   EQU	0x0000005D ; bytes:2
CompTempVar414                   EQU	0x0000005D ; bytes:1
CompTempVar415                   EQU	0x0000005E ; bytes:1
CompTempVar416                   EQU	0x0000005D ; bytes:2
ta_uvr_cal_00022_1_timeout       EQU	0x0000005F ; bytes:2
ta_uvr_cal_00022_1_periods       EQU	0x00000080 ; bytes:32
ta_uvr_cal_00022_1_count         EQU	0x00000061 ; bytes:1
ta_uvr_cal_00022_5_instr_count   EQU	0x00000079 ; bytes:2
CompTempVar262                   EQU	0x00000062 ; bytes:1
CompTempVar266                   EQU	0x00000062 ; bytes:1
CompTempVar269                   EQU	0x00000062 ; bytes:1
CompTempVar275                   EQU	0x00000062 ; bytes:1
CompTempVar276                   EQU	0x00000063 ; bytes:1
CompTempVar278                   EQU	0x00000064 ; bytes:1
CompTempVar279                   EQU	0x00000065 ; bytes:1
CompTempVar282                   EQU	0x00000062 ; bytes:1
ta_uvr_wai_00023_arg_bit_time    EQU	0x0000005F ; bytes:2
ta_uvr_wai_00023_1_dataword      EQU	0x00000061 ; bytes:2
ta_uvr_wai_00023_1_timer_w_00024 EQU	0x00000063 ; bytes:2
CompTempVar285                   EQU	0x00000065 ; bytes:1
CompTempVar286                   EQU	0x00000066 ; bytes:1
ta_uvr_wai_00023_1_timer_w_00025 EQU	0x00000067 ; bytes:2
CompTempVar289                   EQU	0x00000069 ; bytes:1
CompTempVar290                   EQU	0x0000006A ; bytes:1
CompTempVar291                   EQU	0x0000006B ; bytes:1
CompTempVar292                   EQU	0x0000006C ; bytes:1
ta_uvr_wai_00023_1_timer_w_00026 EQU	0x0000006D ; bytes:2
CompTempVar293                   EQU	0x0000006F ; bytes:1
ta_uvr_wai_00023_1_input         EQU	0x00000070 ; bytes:1
ta_uvr_wai_00023_1_sync_bitcount EQU	0x00000071 ; bytes:1
CompTempVar301                   EQU	0x00000072 ; bytes:1
CompTempVar302                   EQU	0x00000073 ; bytes:1
CompTempVar303                   EQU	0x00000074 ; bytes:1
CompTempVar304                   EQU	0x00000075 ; bytes:1
ta_uvr_wai_00023_1_start_found   EQU	0x00000056 ; bit:2
__div_16_1_00003_arg_a           EQU	0x0000005F ; bytes:2
__div_16_1_00003_arg_b           EQU	0x00000061 ; bytes:2
CompTempVarRet428                EQU	0x0000006E ; bytes:2
__div_16_1_00003_1_r             EQU	0x0000006B ; bytes:2
__div_16_1_00003_1_i             EQU	0x0000006D ; bytes:1
__rem_16_1_00004_arg_a           EQU	0x00000063 ; bytes:2
__rem_16_1_00004_arg_b           EQU	0x00000065 ; bytes:2
CompTempVarRet430                EQU	0x0000006D ; bytes:2
__rem_16_1_00004_1_c             EQU	0x0000006A ; bytes:2
__rem_16_1_00004_1_i             EQU	0x0000006C ; bytes:1
__div_8_8_00000_arg_a            EQU	0x00000060 ; bytes:1
__div_8_8_00000_arg_b            EQU	0x00000061 ; bytes:1
CompTempVarRet432                EQU	0x00000067 ; bytes:1
__div_8_8_00000_1_r              EQU	0x00000065 ; bytes:1
__div_8_8_00000_1_i              EQU	0x00000066 ; bytes:1
__rem_8_8_00000_arg_a            EQU	0x00000062 ; bytes:1
__rem_8_8_00000_arg_b            EQU	0x00000063 ; bytes:1
CompTempVarRet434                EQU	0x00000067 ; bytes:1
__rem_8_8_00000_1_c              EQU	0x00000065 ; bytes:1
__rem_8_8_00000_1_i              EQU	0x00000066 ; bytes:1
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
label268436586
	BTFSS gbl_txsta,1
	BRA	label268436586
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
serial_pri_00007
; { serial_printf ; function begin
	CLRF serial_pri_00007_1_i
label268436595
	MOVF serial_pri_00007_arg_text+D'1', W
	MOVWF	FSR0H
	MOVF serial_pri_00007_arg_text, W
	ADDWF serial_pri_00007_1_i, W
	MOVWF FSR0L
	MOVF INDF0, F
	BTFSC STATUS,Z
	RETURN
	MOVF serial_pri_00007_arg_text+D'1', W
	MOVWF	FSR0H
	MOVF serial_pri_00007_arg_text, W
	ADDWF serial_pri_00007_1_i, W
	MOVWF FSR0L
	INCF serial_pri_00007_1_i, F
	MOVF INDF0, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	BRA	label268436595
; } serial_printf function end

	ORG 0x00000078
__rem_16_1_00004
; { __rem_16_16 ; function begin
	CLRF CompTempVarRet430
	CLRF CompTempVarRet430+D'1'
	CLRF __rem_16_1_00004_1_c
	CLRF __rem_16_1_00004_1_c+D'1'
	CLRF __rem_16_1_00004_1_i
label268438410
	BTFSC __rem_16_1_00004_1_i,4
	RETURN
	BCF STATUS,C
	RLCF __rem_16_1_00004_1_c, F
	RLCF __rem_16_1_00004_1_c+D'1', F
	RLCF __rem_16_1_00004_arg_a, F
	RLCF __rem_16_1_00004_arg_a+D'1', F
	RLCF CompTempVarRet430, F
	RLCF CompTempVarRet430+D'1', F
	MOVF __rem_16_1_00004_arg_b, W
	SUBWF CompTempVarRet430, W
	MOVF __rem_16_1_00004_arg_b+D'1', W
	CPFSEQ CompTempVarRet430+D'1'
	SUBWF CompTempVarRet430+D'1', W
	BNC	label268438415
	MOVF __rem_16_1_00004_arg_b, W
	SUBWF CompTempVarRet430, F
	MOVF __rem_16_1_00004_arg_b+D'1', W
	SUBWFB CompTempVarRet430+D'1', F
	BSF __rem_16_1_00004_1_c,0
label268438415
	INCF __rem_16_1_00004_1_i, F
	BRA	label268438410
; } __rem_16_16 function end

	ORG 0x000000AE
__div_16_1_00003
; { __div_16_16 ; function begin
	CLRF __div_16_1_00003_1_r
	CLRF __div_16_1_00003_1_r+D'1'
	CLRF CompTempVarRet428
	CLRF CompTempVarRet428+D'1'
	CLRF __div_16_1_00003_1_i
label268438386
	BTFSC __div_16_1_00003_1_i,4
	RETURN
	BCF STATUS,C
	RLCF CompTempVarRet428, F
	RLCF CompTempVarRet428+D'1', F
	RLCF __div_16_1_00003_arg_a, F
	RLCF __div_16_1_00003_arg_a+D'1', F
	RLCF __div_16_1_00003_1_r, F
	RLCF __div_16_1_00003_1_r+D'1', F
	MOVF __div_16_1_00003_arg_b, W
	SUBWF __div_16_1_00003_1_r, W
	MOVF __div_16_1_00003_arg_b+D'1', W
	CPFSEQ __div_16_1_00003_1_r+D'1'
	SUBWF __div_16_1_00003_1_r+D'1', W
	BNC	label268438391
	MOVF __div_16_1_00003_arg_b, W
	SUBWF __div_16_1_00003_1_r, F
	MOVF __div_16_1_00003_arg_b+D'1', W
	SUBWFB __div_16_1_00003_1_r+D'1', F
	BSF CompTempVarRet428,0
label268438391
	INCF __div_16_1_00003_1_i, F
	BRA	label268438386
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
	MOVWF CompTempVarRet134, 1
	MOVF tmr1_value_00000_1_value+D'1', W
	MOVWF CompTempVarRet134+D'1', 1
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
serial_pri_0000E
; { serial_print_dec ; function begin
	MOVF serial_pri_0000E_arg_number+D'1', W
	SUBLW 0x27
	BNZ	label268436693
	MOVF serial_pri_0000E_arg_number, W
	SUBLW 0x0F
label268436693
	BC	label268436694
	BTFSC serial_pri_0000E_arg_number+D'1',7
	BRA	label268436694
	CLRF CompTempVar173
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000E_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000E_arg_number+D'1',7
	BRA	label268436719
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar173, F
label268436719
	MOVLW 0x10
	MOVWF __div_16_1_00003_arg_b
	MOVLW 0x27
	MOVWF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet428, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet428+D'1', W
	MOVWF CompTempVar170
	BTFSS CompTempVar173,0
	BRA	label4026532868
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar170, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar170, F
label4026532868
	MOVF CompTempVar170, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar170,7
	BRA	label4026532870
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532870
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet430, W
	MOVWF CompTempVar171
	MOVF CompTempVarRet430+D'1', W
	MOVWF CompTempVar172
	BTFSS CompTempVar170,7
	BRA	label4026532872
	COMF CompTempVar171, F
	COMF CompTempVar172, F
	INCF CompTempVar171, F
	BTFSC STATUS,Z
	INCF CompTempVar172, F
label4026532872
	MOVLW 0x30
	ADDWF CompTempVar171, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436694
	MOVF serial_pri_0000E_arg_number+D'1', W
	SUBLW 0x03
	BNZ	label268436727
	MOVF serial_pri_0000E_arg_number, W
	SUBLW 0xE7
label268436727
	BC	label268436728
	BTFSC serial_pri_0000E_arg_number+D'1',7
	BRA	label268436728
	CLRF CompTempVar182
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000E_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000E_arg_number+D'1',7
	BRA	label268436753
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar182, F
label268436753
	MOVLW 0xE8
	MOVWF __div_16_1_00003_arg_b
	MOVLW 0x03
	MOVWF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet428, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet428+D'1', W
	MOVWF CompTempVar179
	BTFSS CompTempVar182,0
	BRA	label4026532877
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar179, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar179, F
label4026532877
	MOVF CompTempVar179, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar179,7
	BRA	label4026532879
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532879
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet430, W
	MOVWF CompTempVar180
	MOVF CompTempVarRet430+D'1', W
	MOVWF CompTempVar181
	BTFSS CompTempVar179,7
	BRA	label4026532881
	COMF CompTempVar180, F
	COMF CompTempVar181, F
	INCF CompTempVar180, F
	BTFSC STATUS,Z
	INCF CompTempVar181, F
label4026532881
	MOVLW 0x30
	ADDWF CompTempVar180, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436728
	MOVLW 0x63
	CPFSGT serial_pri_0000E_arg_number
	TSTFSZ serial_pri_0000E_arg_number+D'1'
	BRA	label4026531938
	BRA	label268436762
label4026531938
	BTFSC serial_pri_0000E_arg_number+D'1',7
	BRA	label268436762
	CLRF CompTempVar191
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000E_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000E_arg_number+D'1',7
	BRA	label268436787
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar191, F
label268436787
	MOVLW 0x64
	MOVWF __div_16_1_00003_arg_b
	CLRF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet428, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet428+D'1', W
	MOVWF CompTempVar188
	BTFSS CompTempVar191,0
	BRA	label4026532888
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar188, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar188, F
label4026532888
	MOVF CompTempVar188, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar188,7
	BRA	label4026532890
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532890
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet430, W
	MOVWF CompTempVar189
	MOVF CompTempVarRet430+D'1', W
	MOVWF CompTempVar190
	BTFSS CompTempVar188,7
	BRA	label4026532892
	COMF CompTempVar189, F
	COMF CompTempVar190, F
	INCF CompTempVar189, F
	BTFSC STATUS,Z
	INCF CompTempVar190, F
label4026532892
	MOVLW 0x30
	ADDWF CompTempVar189, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436762
	MOVLW 0x09
	CPFSGT serial_pri_0000E_arg_number
	TSTFSZ serial_pri_0000E_arg_number+D'1'
	BRA	label4026531951
	BRA	label268436796
label4026531951
	BTFSC serial_pri_0000E_arg_number+D'1',7
	BRA	label268436796
	CLRF CompTempVar200
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __div_16_1_00003_arg_a
	MOVF serial_pri_0000E_arg_number+D'1', W
	MOVWF __div_16_1_00003_arg_a+D'1'
	BTFSS serial_pri_0000E_arg_number+D'1',7
	BRA	label268436821
	COMF __div_16_1_00003_arg_a, F
	COMF __div_16_1_00003_arg_a+D'1', F
	INCF __div_16_1_00003_arg_a, F
	BTFSC STATUS,Z
	INCF __div_16_1_00003_arg_a+D'1', F
	INCF CompTempVar200, F
label268436821
	MOVLW 0x0A
	MOVWF __div_16_1_00003_arg_b
	CLRF __div_16_1_00003_arg_b+D'1'
	CALL __div_16_1_00003
	MOVF CompTempVarRet428, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF CompTempVarRet428+D'1', W
	MOVWF CompTempVar197
	BTFSS CompTempVar200,0
	BRA	label4026532899
	COMF __rem_16_1_00004_arg_a, F
	COMF CompTempVar197, F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF CompTempVar197, F
label4026532899
	MOVF CompTempVar197, W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS CompTempVar197,7
	BRA	label4026532901
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532901
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet430, W
	MOVWF CompTempVar198
	MOVF CompTempVarRet430+D'1', W
	MOVWF CompTempVar199
	BTFSS CompTempVar197,7
	BRA	label4026532903
	COMF CompTempVar198, F
	COMF CompTempVar199, F
	INCF CompTempVar198, F
	BTFSC STATUS,Z
	INCF CompTempVar199, F
label4026532903
	MOVLW 0x30
	ADDWF CompTempVar198, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	BRA	label268436829
label268436796
	MOVLW 0x30
	MOVWF CompTempVar201
	CLRF CompTempVar201+D'1'
	MOVLW HIGH(CompTempVar201+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar201+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
label268436829
	MOVLW 0x2E
	MOVWF CompTempVar203
	CLRF CompTempVar203+D'1'
	MOVLW HIGH(CompTempVar203+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar203+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF serial_pri_0000E_arg_number, W
	MOVWF __rem_16_1_00004_arg_a
	MOVF serial_pri_0000E_arg_number+D'1', W
	MOVWF __rem_16_1_00004_arg_a+D'1'
	BTFSS serial_pri_0000E_arg_number+D'1',7
	BRA	label4026532905
	COMF __rem_16_1_00004_arg_a, F
	COMF __rem_16_1_00004_arg_a+D'1', F
	INCF __rem_16_1_00004_arg_a, F
	BTFSC STATUS,Z
	INCF __rem_16_1_00004_arg_a+D'1', F
label4026532905
	MOVLW 0x0A
	MOVWF __rem_16_1_00004_arg_b
	CLRF __rem_16_1_00004_arg_b+D'1'
	CALL __rem_16_1_00004
	MOVF CompTempVarRet430, W
	MOVWF CompTempVar207
	MOVF CompTempVarRet430+D'1', W
	MOVWF CompTempVar208
	BTFSS serial_pri_0000E_arg_number+D'1',7
	BRA	label4026532907
	COMF CompTempVar207, F
	COMF CompTempVar208, F
	INCF CompTempVar207, F
	BTFSC STATUS,Z
	INCF CompTempVar208, F
label4026532907
	MOVLW 0x30
	ADDWF CompTempVar207, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
; } serial_print_dec function end

	ORG 0x000003A8
__rem_8_8_00000
; { __rem_8_8 ; function begin
	CLRF CompTempVarRet434
	CLRF __rem_8_8_00000_1_c
	CLRF __rem_8_8_00000_1_i
label268438458
	BTFSC __rem_8_8_00000_1_i,3
	RETURN
	BCF STATUS,C
	RLCF __rem_8_8_00000_1_c, F
	RLCF __rem_8_8_00000_arg_a, F
	RLCF CompTempVarRet434, F
	MOVF CompTempVarRet434, W
	CPFSGT __rem_8_8_00000_arg_b
	BRA	label268438463
	BRA	label268438464
label268438463
	MOVF __rem_8_8_00000_arg_b, W
	SUBWF CompTempVarRet434, F
	BSF __rem_8_8_00000_1_c,0
label268438464
	INCF __rem_8_8_00000_1_i, F
	BRA	label268438458
; } __rem_8_8 function end

	ORG 0x000003CC
__div_8_8_00000
; { __div_8_8 ; function begin
	CLRF __div_8_8_00000_1_r
	CLRF CompTempVarRet432
	CLRF __div_8_8_00000_1_i
label268438434
	BTFSC __div_8_8_00000_1_i,3
	RETURN
	BCF STATUS,C
	RLCF CompTempVarRet432, F
	RLCF __div_8_8_00000_arg_a, F
	RLCF __div_8_8_00000_1_r, F
	MOVF __div_8_8_00000_1_r, W
	CPFSGT __div_8_8_00000_arg_b
	BRA	label268438439
	BRA	label268438440
label268438439
	MOVF __div_8_8_00000_arg_b, W
	SUBWF __div_8_8_00000_1_r, F
	BSF CompTempVarRet432,0
label268438440
	INCF __div_8_8_00000_1_i, F
	BRA	label268438434
; } __div_8_8 function end

	ORG 0x000003F0
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
	MOVWF CompTempVar285
	MOVF ta_uvr_wai_00023_arg_bit_time+D'1', W
	MOVWF CompTempVar286
	RLCF CompTempVar286, W
	RRCF CompTempVar286, F
	RRCF CompTempVar285, W
	SUBLW 0xFF
	MOVWF ta_uvr_wai_00023_1_timer_w_00024
	MOVLW 0xFF
	SUBFWB CompTempVar286, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00024+D'1'
	MOVF ta_uvr_wai_00023_arg_bit_time, W
	MOVWF CompTempVar289
	MOVF ta_uvr_wai_00023_arg_bit_time+D'1', W
	MOVWF CompTempVar290
	BCF STATUS,C
	RLCF CompTempVar289, F
	RLCF CompTempVar290, F
	MOVF CompTempVar289, W
	SUBLW 0xFF
	MOVWF CompTempVar291
	MOVLW 0xFF
	SUBFWB CompTempVar290, W
	MOVWF CompTempVar292
	MOVF CompTempVar291, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00025
	MOVF CompTempVar292, W
	MOVWF ta_uvr_wai_00023_1_timer_w_00025+D'1'
	MOVF ta_uvr_wai_00023_arg_bit_time, W
	MOVWF CompTempVar293
	MOVF ta_uvr_wai_00023_arg_bit_time+D'1', W
	MOVWF ta_uvr_wai_00023_1_timer_w_00026+D'1'
	RLCF ta_uvr_wai_00023_1_timer_w_00026+D'1', W
	RRCF ta_uvr_wai_00023_1_timer_w_00026+D'1', F
	RRCF CompTempVar293, W
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
label268438178
	BTFSC gbl_uvr_data,2
	BRA	label268438179
	NOP
	BRA	label268438178
label268438179
	BTFSS gbl_uvr_data,2
	BRA	label268438188
	NOP
	BRA	label268438179
label268438188
	CLRF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
	MOVF ta_uvr_wai_00023_1_timer_w_00024, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_wai_00023_1_timer_w_00024+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
	BCF gbl_tmr1if,0
label268438206
	BTFSC gbl_tmr1if,0
	BRA	label268438207
	NOP
	BRA	label268438206
label268438207
	MOVLW 0x01
	MOVWF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
	MOVF ta_uvr_wai_00023_1_timer_w_00025, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_wai_00023_1_timer_w_00025+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
label268438224
	MOVF ta_uvr_wai_00023_1_dataword, W
	MOVWF CompTempVar301
	MOVF ta_uvr_wai_00023_1_dataword+D'1', W
	ANDLW 0x3F
	MOVWF CompTempVar302
	MOVF CompTempVar301, F
	BNZ	label4026532775
	MOVF CompTempVar302, F
	BZ	label268438226
label4026532775
	MOVF ta_uvr_wai_00023_1_dataword, W
	MOVWF CompTempVar303
	MOVF ta_uvr_wai_00023_1_dataword+D'1', W
	ANDLW 0x3F
	MOVWF CompTempVar304
	MOVF CompTempVar303, W
	XORLW 0xFF
	BTFSC CompTempVar304,7
	BRA	label4026532778
	BNZ	label4026532778
	MOVF CompTempVar304, W
	XORLW 0x3F
	BZ	label268438226
label4026532778
	BTFSC gbl_ta_uvr_gotbit,0
	BRA	label268438230
	NOP
	BRA	label4026532778
label268438230
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
	BRA	label268438224
	CLRF CompTempVarRet284
	RETURN
label268438226
	BTFSS gbl_uvr_data,2
	BRA	label268438256
	NOP
	BRA	label268438226
label268438256
	BTFSC gbl_uvr_data,2
	BRA	label268438265
	NOP
	BRA	label268438256
label268438265
	BCF ta_uvr_wai_00023_1_start_found,2
	BCF gbl_t1con,0
	BCF gbl_tmr1if,0
	CLRF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
label268438279
	BTFSC ta_uvr_wai_00023_1_start_found,2
	BRA	label268438280
	MOVF ta_uvr_wai_00023_1_timer_w_00026, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_wai_00023_1_timer_w_00026+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
label268438287
	BTFSS gbl_uvr_data,2
	BRA	label268438288
	NOP
	BRA	label268438287
label268438288
	BSF gbl_t1con,0
	NOP
label268438302
	BTFSC gbl_uvr_data,2
	BRA	label268438303
	NOP
	BRA	label268438302
label268438303
	BTFSS gbl_tmr1if,0
	BRA	label268438311
	BSF ta_uvr_wai_00023_1_start_found,2
	BRA	label268438279
label268438311
	BCF gbl_t1con,0
	BRA	label268438279
label268438280
	MOVLW 0x01
	MOVWF CompTempVarRet284
	RETURN
; } ta_uvr_waitforsync function end

	ORG 0x00000550
ta_uvr_pri_00020
; { ta_uvr_print_sensor_value ; function begin
	MOVLW 0x70
	ANDWF ta_uvr_pri_00020_arg_high, W
	MOVWF ta_uvr_pri_00020_1_value_type
	CLRF ta_uvr_pri_00020_1_temp
	CLRF ta_uvr_pri_00020_1_temp+D'1'
	CLRF ta_uvr_pri_00020_1_high_restored
	MOVF ta_uvr_pri_00020_1_value_type, F
	BZ	label268437909
	MOVLW 0x10
	CPFSEQ ta_uvr_pri_00020_1_value_type
	BRA	label268437910
	BRA	label268437911
label268437910
	MOVLW 0x20
	CPFSEQ ta_uvr_pri_00020_1_value_type
	BRA	label268437914
	BRA	label268437913
label268437909
	MOVLW 0x20
	MOVWF CompTempVar406+D'3'
	MOVLW 0x4E
	MOVWF CompTempVar406
	MOVLW 0x63
	MOVWF CompTempVar406+D'4'
	MOVWF CompTempVar406+D'9'
	MOVLW 0x64
	MOVWF CompTempVar406+D'12'
	MOVLW 0x65
	MOVWF CompTempVar406+D'8'
	MOVWF CompTempVar406+D'11'
	MOVLW 0x6E
	MOVWF CompTempVar406+D'6'
	MOVWF CompTempVar406+D'7'
	MOVLW 0x6F
	MOVWF CompTempVar406+D'1'
	MOVWF CompTempVar406+D'5'
	MOVLW 0x74
	MOVWF CompTempVar406+D'2'
	MOVWF CompTempVar406+D'10'
	CLRF CompTempVar406+D'13'
	MOVLW HIGH(CompTempVar406+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar406+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BRA	label268437921
label268437911
	BTFSC ta_uvr_pri_00020_arg_high,7
	BRA	label268437922
	MOVLW 0x6F
	MOVWF CompTempVar408
	MOVLW 0x66
	MOVWF CompTempVar408+D'1'
	MOVWF CompTempVar408+D'2'
	CLRF CompTempVar408+D'3'
	MOVLW HIGH(CompTempVar408+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar408+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BRA	label268437921
label268437922
	MOVLW 0x6F
	MOVWF CompTempVar410
	MOVLW 0x6E
	MOVWF CompTempVar410+D'1'
	CLRF CompTempVar410+D'2'
	MOVLW HIGH(CompTempVar410+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar410+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BRA	label268437921
label268437913
	MOVF ta_uvr_pri_00020_arg_high, W
	MOVWF ta_uvr_pri_00020_1_high_restored
	BTFSS ta_uvr_pri_00020_1_high_restored,7
	BRA	label268437940
	MOVLW 0x70
	IORWF ta_uvr_pri_00020_1_high_restored, F
	BRA	label268437944
label268437940
	MOVLW 0x8F
	ANDWF ta_uvr_pri_00020_1_high_restored, F
label268437944
	MOVF ta_uvr_pri_00020_arg_low, W
	MOVWF ta_uvr_pri_00020_1_temp
	MOVF ta_uvr_pri_00020_1_high_restored, W
	MOVWF ta_uvr_pri_00020_1_temp+D'1'
	BTFSS ta_uvr_pri_00020_arg_high,7
	BRA	label4026532932
	MOVLW 0x2D
	MOVWF CompTempVar412
	CLRF CompTempVar412+D'1'
	MOVLW HIGH(CompTempVar412+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar412+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVLW 0xFF
	XORWF ta_uvr_pri_00020_1_temp, W
	MOVWF CompTempVar414
	MOVF ta_uvr_pri_00020_1_temp+D'1', W
	XORLW 0xFF
	MOVWF CompTempVar415
	MOVF CompTempVar414, W
	MOVWF ta_uvr_pri_00020_1_temp
	MOVF CompTempVar415, W
	MOVWF ta_uvr_pri_00020_1_temp+D'1'
	INFSNZ ta_uvr_pri_00020_1_temp, F
	INCF ta_uvr_pri_00020_1_temp+D'1', F
label4026532932
	MOVF ta_uvr_pri_00020_1_temp, W
	MOVWF serial_pri_0000E_arg_number
	MOVF ta_uvr_pri_00020_1_temp+D'1', W
	MOVWF serial_pri_0000E_arg_number+D'1'
	CALL serial_pri_0000E
	BRA	label268437921
label268437914
	MOVLW 0x23
	MOVWF CompTempVar416
	CLRF CompTempVar416+D'1'
	MOVLW HIGH(CompTempVar416+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar416+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
label268437921
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
; } ta_uvr_print_sensor_value function end

	ORG 0x0000065C
ta_uvr_cal_00022
; { ta_uvr_calibrate_timer ; function begin
	CLRF ta_uvr_cal_00022_1_timeout
	CLRF ta_uvr_cal_00022_1_timeout+D'1'
	CLRF ta_uvr_cal_00022_1_count
	CLRF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
label268438019
	MOVLW 0x10
	CPFSLT ta_uvr_cal_00022_1_count
	BRA	label268438020
	CLRF tmr1_set_00000_arg_value
	CLRF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
label268438028
	BTFSC gbl_uvr_data,2
	BRA	label268438029
	INFSNZ ta_uvr_cal_00022_1_timeout, F
	INCF ta_uvr_cal_00022_1_timeout+D'1', F
	MOVF ta_uvr_cal_00022_1_timeout+D'1', W
	SUBLW 0xFD
	BNZ	label268438033
	MOVF ta_uvr_cal_00022_1_timeout, W
	SUBLW 0xE8
label268438033
	BC	label268438028
	CLRF CompTempVarRet260
	CLRF CompTempVarRet260+D'1'
	RETURN
label268438029
	CLRF ta_uvr_cal_00022_1_timeout
	CLRF ta_uvr_cal_00022_1_timeout+D'1'
label268438040
	BTFSS gbl_uvr_data,2
	BRA	label268438041
	INFSNZ ta_uvr_cal_00022_1_timeout, F
	INCF ta_uvr_cal_00022_1_timeout+D'1', F
	MOVF ta_uvr_cal_00022_1_timeout+D'1', W
	SUBLW 0xFD
	BNZ	label268438045
	MOVF ta_uvr_cal_00022_1_timeout, W
	SUBLW 0xE8
label268438045
	BC	label268438040
	CLRF CompTempVarRet260
	CLRF CompTempVarRet260+D'1'
	RETURN
label268438041
	BSF gbl_t1con,0
label268438051
	BTFSS gbl_uvr_data,2
	BRA	label268438051
	BCF gbl_t1con,0
	NOP
	CALL tmr1_value_00000
	MOVF CompTempVarRet134, W, 1
	MOVWF ta_uvr_cal_00022_5_instr_count
	MOVF CompTempVarRet134+D'1', W, 1
	MOVWF ta_uvr_cal_00022_5_instr_count+D'1'
	MOVF ta_uvr_cal_00022_5_instr_count+D'1', W
	SUBLW 0x0B
	BNZ	label268438063
	MOVF ta_uvr_cal_00022_5_instr_count, W
	SUBLW 0xB8
label268438063
	BC	label268438064
	BTFSC ta_uvr_cal_00022_5_instr_count+D'1',7
	BRA	label268438064
	MOVF ta_uvr_cal_00022_5_instr_count, W
	MOVWF CompTempVar262
	RLCF ta_uvr_cal_00022_5_instr_count+D'1', W
	RRCF ta_uvr_cal_00022_5_instr_count+D'1', F
	RRCF CompTempVar262, W
	MOVWF ta_uvr_cal_00022_5_instr_count
label268438064
	MOVLW	HIGH(ta_uvr_cal_00022_1_periods)

	MOVWF	FSR0H
	MOVLW LOW(ta_uvr_cal_00022_1_periods+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_cal_00022_1_count, W
	MOVWF CompTempVar266
	BCF STATUS,C
	RLCF CompTempVar266, W
	ADDWF FSR0L, F
	MOVF ta_uvr_cal_00022_5_instr_count, W
	MOVWF INDF0
	MOVF ta_uvr_cal_00022_5_instr_count+D'1', W
	MOVWF PREINC0
	INCF ta_uvr_cal_00022_1_count, F
	BRA	label268438019
label268438020
	MOVLW 0x01
	MOVWF ta_uvr_cal_00022_1_count
	MOVF ta_uvr_cal_00022_1_periods, W, 1
	MOVWF CompTempVar269
	RLCF ta_uvr_cal_00022_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00022_1_periods+D'1', F, 1
	RRCF CompTempVar269, W
	MOVWF ta_uvr_cal_00022_1_periods, 1
label268438081
	MOVLW 0x10
	CPFSLT ta_uvr_cal_00022_1_count
	BRA	label268438082
	MOVLW	HIGH(ta_uvr_cal_00022_1_periods)

	MOVWF	FSR0H
	MOVLW LOW(ta_uvr_cal_00022_1_periods+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_cal_00022_1_count, W
	MOVWF CompTempVar275
	BCF STATUS,C
	RLCF CompTempVar275, W
	ADDWF FSR0L, F
	MOVF INDF0, W
	MOVWF CompTempVar276
	MOVF PREINC0, W
	MOVWF CompTempVar279
	RLCF CompTempVar279, W
	RRCF CompTempVar279, F
	RRCF CompTempVar276, W
	ADDWF ta_uvr_cal_00022_1_periods, W, 1
	MOVWF CompTempVar278
	MOVF ta_uvr_cal_00022_1_periods+D'1', W, 1
	ADDWFC CompTempVar279, F
	MOVF CompTempVar278, W
	MOVWF ta_uvr_cal_00022_1_periods, 1
	MOVF CompTempVar279, W
	MOVWF ta_uvr_cal_00022_1_periods+D'1', 1
	INCF ta_uvr_cal_00022_1_count, F
	BRA	label268438081
label268438082
	MOVF ta_uvr_cal_00022_1_periods, W, 1
	MOVWF CompTempVar282
	RLCF ta_uvr_cal_00022_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00022_1_periods+D'1', F, 1
	RRCF CompTempVar282, F
	RLCF ta_uvr_cal_00022_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00022_1_periods+D'1', F, 1
	RRCF CompTempVar282, F
	RLCF ta_uvr_cal_00022_1_periods+D'1', W, 1
	RRCF ta_uvr_cal_00022_1_periods+D'1', F, 1
	RRCF CompTempVar282, W
	MOVWF ta_uvr_cal_00022_1_periods, 1
	MOVF ta_uvr_cal_00022_1_periods, W, 1
	MOVWF CompTempVarRet260
	MOVF ta_uvr_cal_00022_1_periods+D'1', W, 1
	MOVWF CompTempVarRet260+D'1'
	RETURN
; } ta_uvr_calibrate_timer function end

	ORG 0x0000076A
serial_pri_0000F
; { serial_print_dec ; function begin
	MOVLW 0x63
	CPFSGT serial_pri_0000F_arg_number
	BRA	label268436863
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x64
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet432, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet434, W
	MOVWF CompTempVar210
	MOVLW 0x30
	ADDWF CompTempVar210, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	BRA	label268436882
label268436863
	MOVLW 0x02
	CPFSGT serial_pri_0000F_arg_positions
	BRA	label268436882
	MOVLW 0x30
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436882
	MOVLW 0x09
	CPFSGT serial_pri_0000F_arg_number
	BRA	label268436889
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet432, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet434, W
	MOVWF CompTempVar212
	MOVLW 0x30
	ADDWF CompTempVar212, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	BRA	label268436908
label268436889
	MOVLW 0x01
	CPFSGT serial_pri_0000F_arg_positions
	BRA	label268436908
	MOVLW 0x30
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436908
	MOVF serial_pri_0000F_arg_number, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet434, W
	MOVWF CompTempVar214
	MOVLW 0x30
	ADDWF CompTempVar214, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
; } serial_print_dec function end

	ORG 0x00000808
serial_pri_0000D
; { serial_print_dec ; function begin
	MOVLW 0x63
	CPFSGT serial_pri_0000D_arg_number
	BRA	label268436646
	MOVF serial_pri_0000D_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x64
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet432, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet434, W
	MOVWF CompTempVar160
	MOVLW 0x30
	ADDWF CompTempVar160, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436646
	MOVLW 0x09
	CPFSGT serial_pri_0000D_arg_number
	BRA	label268436663
	MOVF serial_pri_0000D_arg_number, W
	MOVWF __div_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __div_8_8_00000_arg_b
	CALL __div_8_8_00000
	MOVF CompTempVarRet432, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet434, W
	MOVWF CompTempVar162
	MOVLW 0x30
	ADDWF CompTempVar162, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436663
	MOVF serial_pri_0000D_arg_number, W
	MOVWF __rem_8_8_00000_arg_a
	MOVLW 0x0A
	MOVWF __rem_8_8_00000_arg_b
	CALL __rem_8_8_00000
	MOVF CompTempVarRet434, W
	MOVWF CompTempVar164
	MOVLW 0x30
	ADDWF CompTempVar164, W
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
; } serial_print_dec function end

	ORG 0x00000882
serial_ini_0000B
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
	MOVF serial_ini_0000B_arg_brg, W
	MOVWF gbl_spbrg
	RETURN
; } serial_init function end

	ORG 0x0000089C
ta_uvr_ver_0001D
; { ta_uvr_verify_checksum ; function begin
	CLRF ta_uvr_ver_0001D_1_checksum
	CLRF ta_uvr_ver_0001D_1_byte_count
label268437517
	MOVLW 0x22
	CPFSLT ta_uvr_ver_0001D_1_byte_count
	BRA	label268437518
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001D_1_byte_count, W
	ADDWF FSR0L, F
	INCF ta_uvr_ver_0001D_1_byte_count, F
	MOVF INDF0, W
	ADDWF ta_uvr_ver_0001D_1_checksum, F
	BRA	label268437517
label268437518
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001D_1_byte_count, W
	ADDWF FSR0L, F
	MOVF INDF0, W
	CPFSEQ ta_uvr_ver_0001D_1_checksum
	BRA	label268437523
	CLRF ta_uvr_ver_0001D_1_byte_count
label268437527
	MOVLW 0x23
	CPFSLT ta_uvr_ver_0001D_1_byte_count
	BRA	label268437528
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001D_1_byte_count, W
	ADDWF FSR0L, F
	MOVF INDF0, W
	MOVWF CompTempVar313
	MOVLW	HIGH(gbl_data_cache)

	MOVWF	FSR0H
	MOVLW LOW(gbl_data_cache+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_ver_0001D_1_byte_count, W
	ADDWF FSR0L, F
	MOVF CompTempVar313, W
	MOVWF INDF0
	INCF ta_uvr_ver_0001D_1_byte_count, F
	BRA	label268437527
label268437528
	MOVLW 0x01
	MOVWF gbl_ta_uvr_data_valid
	CLRF CompTempVarRet308
	RETURN
label268437523
	MOVLW 0x01
	MOVWF CompTempVarRet308
	RETURN
; } ta_uvr_verify_checksum function end

	ORG 0x00000906
ta_uvr_sen_0001F
; { ta_uvr_send_data ; function begin
	CLRF ta_uvr_sen_0001F_1_snd_count
	MOVLW 0x90
	CPFSEQ gbl_data_cache
	BRA	label268437554
	BRA	label268437555
label268437554
	MOVLW 0x0A
	MOVWF CompTempVar320+D'1'
	MOVWF CompTempVar320+D'28'
	MOVLW 0x0D
	MOVWF CompTempVar320
	MOVWF CompTempVar320+D'27'
	MOVLW 0x20
	MOVWF CompTempVar320+D'8'
	MOVWF CompTempVar320+D'11'
	MOVWF CompTempVar320+D'15'
	MOVWF CompTempVar320+D'18'
	MOVLW 0x21
	MOVWF CompTempVar320+D'26'
	MOVLW 0x2D
	MOVWF CompTempVar320+D'24'
	MOVLW 0x31
	MOVWF CompTempVar320+D'23'
	MOVLW 0x33
	MOVWF CompTempVar320+D'25'
	MOVLW 0x36
	MOVWF CompTempVar320+D'22'
	MOVLW 0x44
	MOVWF CompTempVar320+D'2'
	MOVLW 0x52
	MOVWF CompTempVar320+D'21'
	MOVLW 0x55
	MOVWF CompTempVar320+D'19'
	MOVLW 0x56
	MOVWF CompTempVar320+D'20'
	MOVLW 0x61
	MOVWF CompTempVar320+D'16'
	MOVLW 0x63
	MOVWF CompTempVar320+D'6'
	MOVLW 0x65
	MOVWF CompTempVar320+D'3'
	MOVWF CompTempVar320+D'7'
	MOVLW 0x69
	MOVWF CompTempVar320+D'5'
	MOVWF CompTempVar320+D'9'
	MOVLW 0x6E
	MOVWF CompTempVar320+D'12'
	MOVWF CompTempVar320+D'17'
	MOVLW 0x6F
	MOVWF CompTempVar320+D'13'
	MOVLW 0x73
	MOVWF CompTempVar320+D'10'
	MOVLW 0x74
	MOVWF CompTempVar320+D'14'
	MOVLW 0x76
	MOVWF CompTempVar320+D'4'
	CLRF CompTempVar320+D'29'
	MOVLW HIGH(CompTempVar320+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar320+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BRA	label268437563
label268437555
	MOVLW 0x0A
	MOVWF CompTempVar322+D'1'
	MOVWF CompTempVar322+D'24'
	MOVLW 0x0D
	MOVWF CompTempVar322
	MOVWF CompTempVar322+D'23'
	MOVLW 0x20
	MOVWF CompTempVar322+D'11'
	MOVWF CompTempVar322+D'15'
	MOVLW 0x2D
	MOVWF CompTempVar322+D'21'
	MOVLW 0x31
	MOVWF CompTempVar322+D'20'
	MOVLW 0x33
	MOVWF CompTempVar322+D'22'
	MOVLW 0x36
	MOVWF CompTempVar322+D'19'
	MOVLW 0x3A
	MOVWF CompTempVar322+D'14'
	MOVLW 0x43
	MOVWF CompTempVar322+D'2'
	MOVLW 0x52
	MOVWF CompTempVar322+D'18'
	MOVLW 0x55
	MOVWF CompTempVar322+D'16'
	MOVLW 0x56
	MOVWF CompTempVar322+D'17'
	MOVLW 0x63
	MOVWF CompTempVar322+D'7'
	MOVLW 0x64
	MOVWF CompTempVar322+D'10'
	MOVLW 0x65
	MOVWF CompTempVar322+D'6'
	MOVWF CompTempVar322+D'9'
	MOVLW 0x6E
	MOVWF CompTempVar322+D'4'
	MOVWF CompTempVar322+D'5'
	MOVLW 0x6F
	MOVWF CompTempVar322+D'3'
	MOVWF CompTempVar322+D'13'
	MOVLW 0x74
	MOVWF CompTempVar322+D'8'
	MOVWF CompTempVar322+D'12'
	CLRF CompTempVar322+D'25'
	MOVLW HIGH(CompTempVar322+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar322+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
label268437563
	MOVLW 0x20
	MOVWF CompTempVar324+D'5'
	MOVWF CompTempVar324+D'11'
	MOVLW 0x30
	MOVWF CompTempVar324+D'13'
	MOVLW 0x32
	MOVWF CompTempVar324+D'12'
	MOVLW 0x3A
	MOVWF CompTempVar324+D'10'
	MOVLW 0x4C
	MOVWF CompTempVar324
	MOVLW 0x61
	MOVWF CompTempVar324+D'3'
	MOVLW 0x63
	MOVWF CompTempVar324+D'2'
	MOVLW 0x65
	MOVWF CompTempVar324+D'9'
	MOVLW 0x69
	MOVWF CompTempVar324+D'7'
	MOVLW 0x6C
	MOVWF CompTempVar324+D'4'
	MOVLW 0x6D
	MOVWF CompTempVar324+D'8'
	MOVLW 0x6F
	MOVWF CompTempVar324+D'1'
	MOVLW 0x74
	MOVWF CompTempVar324+D'6'
	CLRF CompTempVar324+D'14'
	MOVLW HIGH(CompTempVar324+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar324+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'7', W
	MOVWF serial_pri_0000F_arg_number
	MOVLW 0x02
	MOVWF serial_pri_0000F_arg_positions
	CALL serial_pri_0000F
	MOVLW 0x2D
	MOVWF CompTempVar328
	CLRF CompTempVar328+D'1'
	MOVLW HIGH(CompTempVar328+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar328+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'6', W
	MOVWF serial_pri_0000F_arg_number
	MOVLW 0x02
	MOVWF serial_pri_0000F_arg_positions
	CALL serial_pri_0000F
	MOVLW 0x2D
	MOVWF CompTempVar332
	CLRF CompTempVar332+D'1'
	MOVLW HIGH(CompTempVar332+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar332+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'5', W
	MOVWF serial_pri_0000F_arg_number
	MOVLW 0x02
	MOVWF serial_pri_0000F_arg_positions
	CALL serial_pri_0000F
	MOVLW 0x20
	MOVWF CompTempVar336
	CLRF CompTempVar336+D'1'
	MOVLW HIGH(CompTempVar336+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar336+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVLW 0x1F
	ANDWF gbl_data_cache+D'4', W
	MOVWF serial_pri_0000F_arg_number
	MOVLW 0x02
	MOVWF serial_pri_0000F_arg_positions
	CALL serial_pri_0000F
	MOVLW 0x3A
	MOVWF CompTempVar340
	CLRF CompTempVar340+D'1'
	MOVLW HIGH(CompTempVar340+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar340+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'3', W
	MOVWF serial_pri_0000F_arg_number
	MOVLW 0x02
	MOVWF serial_pri_0000F_arg_positions
	CALL serial_pri_0000F
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
	MOVWF CompTempVar344+D'6'
	MOVLW 0x3A
	MOVWF CompTempVar344+D'13'
	MOVLW 0x53
	MOVWF CompTempVar344
	MOVLW 0x61
	MOVWF CompTempVar344+D'8'
	MOVLW 0x65
	MOVWF CompTempVar344+D'1'
	MOVWF CompTempVar344+D'11'
	MOVLW 0x6C
	MOVWF CompTempVar344+D'9'
	MOVLW 0x6E
	MOVWF CompTempVar344+D'2'
	MOVLW 0x6F
	MOVWF CompTempVar344+D'4'
	MOVLW 0x72
	MOVWF CompTempVar344+D'5'
	MOVLW 0x73
	MOVWF CompTempVar344+D'3'
	MOVWF CompTempVar344+D'12'
	MOVLW 0x75
	MOVWF CompTempVar344+D'10'
	MOVLW 0x76
	MOVWF CompTempVar344+D'7'
	CLRF CompTempVar344+D'14'
	MOVLW HIGH(CompTempVar344+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar344+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x54
	MOVWF CompTempVar346
	MOVLW 0x31
	MOVWF CompTempVar346+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar346+D'2'
	MOVLW 0x20
	MOVWF CompTempVar346+D'3'
	CLRF CompTempVar346+D'4'
	MOVLW HIGH(CompTempVar346+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar346+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'8', W
	MOVWF ta_uvr_pri_00020_arg_low
	MOVF gbl_data_cache+D'9', W
	MOVWF ta_uvr_pri_00020_arg_high
	CALL ta_uvr_pri_00020
	MOVLW 0x54
	MOVWF CompTempVar352
	MOVLW 0x32
	MOVWF CompTempVar352+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar352+D'2'
	MOVLW 0x20
	MOVWF CompTempVar352+D'3'
	CLRF CompTempVar352+D'4'
	MOVLW HIGH(CompTempVar352+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar352+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'10', W
	MOVWF ta_uvr_pri_00020_arg_low
	MOVF gbl_data_cache+D'11', W
	MOVWF ta_uvr_pri_00020_arg_high
	CALL ta_uvr_pri_00020
	MOVLW 0x54
	MOVWF CompTempVar358
	MOVLW 0x33
	MOVWF CompTempVar358+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar358+D'2'
	MOVLW 0x20
	MOVWF CompTempVar358+D'3'
	CLRF CompTempVar358+D'4'
	MOVLW HIGH(CompTempVar358+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar358+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'12', W
	MOVWF ta_uvr_pri_00020_arg_low
	MOVF gbl_data_cache+D'13', W
	MOVWF ta_uvr_pri_00020_arg_high
	CALL ta_uvr_pri_00020
	MOVLW 0x54
	MOVWF CompTempVar364
	MOVLW 0x34
	MOVWF CompTempVar364+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar364+D'2'
	MOVLW 0x20
	MOVWF CompTempVar364+D'3'
	CLRF CompTempVar364+D'4'
	MOVLW HIGH(CompTempVar364+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar364+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'14', W
	MOVWF ta_uvr_pri_00020_arg_low
	MOVF gbl_data_cache+D'15', W
	MOVWF ta_uvr_pri_00020_arg_high
	CALL ta_uvr_pri_00020
	MOVLW 0x54
	MOVWF CompTempVar370
	MOVLW 0x35
	MOVWF CompTempVar370+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar370+D'2'
	MOVLW 0x20
	MOVWF CompTempVar370+D'3'
	CLRF CompTempVar370+D'4'
	MOVLW HIGH(CompTempVar370+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar370+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'16', W
	MOVWF ta_uvr_pri_00020_arg_low
	MOVF gbl_data_cache+D'17', W
	MOVWF ta_uvr_pri_00020_arg_high
	CALL ta_uvr_pri_00020
	MOVLW 0x54
	MOVWF CompTempVar376
	MOVLW 0x36
	MOVWF CompTempVar376+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar376+D'2'
	MOVLW 0x20
	MOVWF CompTempVar376+D'3'
	CLRF CompTempVar376+D'4'
	MOVLW HIGH(CompTempVar376+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar376+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF gbl_data_cache+D'18', W
	MOVWF ta_uvr_pri_00020_arg_low
	MOVF gbl_data_cache+D'19', W
	MOVWF ta_uvr_pri_00020_arg_high
	CALL ta_uvr_pri_00020
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0A
	MOVWF CompTempVar382+D'15'
	MOVLW 0x0D
	MOVWF CompTempVar382+D'14'
	MOVLW 0x20
	MOVWF CompTempVar382+D'6'
	MOVWF CompTempVar382+D'19'
	MOVLW 0x31
	MOVWF CompTempVar382+D'17'
	MOVLW 0x3A
	MOVWF CompTempVar382+D'13'
	MOVWF CompTempVar382+D'18'
	MOVLW 0x41
	MOVWF CompTempVar382+D'16'
	MOVLW 0x4F
	MOVWF CompTempVar382
	MOVLW 0x61
	MOVWF CompTempVar382+D'8'
	MOVLW 0x65
	MOVWF CompTempVar382+D'11'
	MOVLW 0x6C
	MOVWF CompTempVar382+D'9'
	MOVLW 0x70
	MOVWF CompTempVar382+D'3'
	MOVLW 0x73
	MOVWF CompTempVar382+D'12'
	MOVLW 0x74
	MOVWF CompTempVar382+D'2'
	MOVWF CompTempVar382+D'5'
	MOVLW 0x75
	MOVWF CompTempVar382+D'1'
	MOVWF CompTempVar382+D'4'
	MOVWF CompTempVar382+D'10'
	MOVLW 0x76
	MOVWF CompTempVar382+D'7'
	CLRF CompTempVar382+D'20'
	MOVLW HIGH(CompTempVar382+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar382+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BTFSS gbl_data_cache+D'20',0
	BRA	label268437783
	MOVLW 0x6F
	MOVWF CompTempVar384
	MOVLW 0x6E
	MOVWF CompTempVar384+D'1'
	CLRF CompTempVar384+D'2'
	MOVLW HIGH(CompTempVar384+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar384+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BRA	label268437792
label268437783
	MOVLW 0x6F
	MOVWF CompTempVar386
	MOVLW 0x66
	MOVWF CompTempVar386+D'1'
	MOVWF CompTempVar386+D'2'
	CLRF CompTempVar386+D'3'
	MOVLW HIGH(CompTempVar386+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar386+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
label268437792
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x41
	MOVWF CompTempVar388
	MOVLW 0x32
	MOVWF CompTempVar388+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar388+D'2'
	MOVLW 0x20
	MOVWF CompTempVar388+D'3'
	CLRF CompTempVar388+D'4'
	MOVLW HIGH(CompTempVar388+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar388+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BTFSS gbl_data_cache+D'20',1
	BRA	label268437814
	MOVLW 0x6F
	MOVWF CompTempVar390
	MOVLW 0x6E
	MOVWF CompTempVar390+D'1'
	CLRF CompTempVar390+D'2'
	MOVLW HIGH(CompTempVar390+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar390+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BRA	label268437823
label268437814
	MOVLW 0x6F
	MOVWF CompTempVar392
	MOVLW 0x66
	MOVWF CompTempVar392+D'1'
	MOVWF CompTempVar392+D'2'
	CLRF CompTempVar392+D'3'
	MOVLW HIGH(CompTempVar392+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar392+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
label268437823
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x41
	MOVWF CompTempVar394
	MOVLW 0x33
	MOVWF CompTempVar394+D'1'
	MOVLW 0x3A
	MOVWF CompTempVar394+D'2'
	MOVLW 0x20
	MOVWF CompTempVar394+D'3'
	CLRF CompTempVar394+D'4'
	MOVLW HIGH(CompTempVar394+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar394+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BTFSS gbl_data_cache+D'20',2
	BRA	label268437845
	MOVLW 0x6F
	MOVWF CompTempVar396
	MOVLW 0x6E
	MOVWF CompTempVar396+D'1'
	CLRF CompTempVar396+D'2'
	MOVLW HIGH(CompTempVar396+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar396+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BRA	label268437854
label268437845
	MOVLW 0x6F
	MOVWF CompTempVar398
	MOVLW 0x66
	MOVWF CompTempVar398+D'1'
	MOVWF CompTempVar398+D'2'
	CLRF CompTempVar398+D'3'
	MOVLW HIGH(CompTempVar398+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar398+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
label268437854
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x50
	MOVWF CompTempVar400
	MOVLW 0x75
	MOVWF CompTempVar400+D'1'
	MOVLW 0x6D
	MOVWF CompTempVar400+D'2'
	MOVLW 0x70
	MOVWF CompTempVar400+D'3'
	MOVLW 0x3A
	MOVWF CompTempVar400+D'4'
	MOVLW 0x20
	MOVWF CompTempVar400+D'5'
	CLRF CompTempVar400+D'6'
	MOVLW HIGH(CompTempVar400+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar400+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BTFSS gbl_data_cache+D'21',7
	BRA	label268437876
	MOVLW 0x20
	MOVWF CompTempVar402+D'8'
	MOVWF CompTempVar402+D'12'
	MOVWF CompTempVar402+D'16'
	MOVLW 0x61
	MOVWF CompTempVar402+D'1'
	MOVWF CompTempVar402+D'4'
	MOVWF CompTempVar402+D'17'
	MOVLW 0x62
	MOVWF CompTempVar402+D'5'
	MOVLW 0x63
	MOVWF CompTempVar402+D'18'
	MOVLW 0x65
	MOVWF CompTempVar402+D'7'
	MOVWF CompTempVar402+D'22'
	MOVLW 0x69
	MOVWF CompTempVar402+D'3'
	MOVWF CompTempVar402+D'20'
	MOVLW 0x6C
	MOVWF CompTempVar402+D'6'
	MOVLW 0x6D
	MOVWF CompTempVar402+D'11'
	MOVLW 0x6E
	MOVWF CompTempVar402+D'13'
	MOVLW 0x6F
	MOVWF CompTempVar402+D'14'
	MOVLW 0x70
	MOVWF CompTempVar402+D'10'
	MOVLW 0x72
	MOVWF CompTempVar402+D'2'
	MOVWF CompTempVar402+D'9'
	MOVLW 0x74
	MOVWF CompTempVar402+D'15'
	MOVWF CompTempVar402+D'19'
	MOVLW 0x76
	MOVWF CompTempVar402
	MOVWF CompTempVar402+D'21'
	CLRF CompTempVar402+D'23'
	MOVLW HIGH(CompTempVar402+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar402+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BRA	label268437885
label268437876
	MOVLW 0x1F
	ANDWF gbl_data_cache+D'21', W
	MOVWF serial_pri_0000D_arg_number
	CALL serial_pri_0000D
label268437885
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	CLRF gbl_ta_uvr_data_valid
	RETURN
; } ta_uvr_send_data function end

	ORG 0x00000E38
ta_uvr_get_0001C
; { ta_uvr_getinfo ; function begin
	BCF ta_uvr_get_0001C_1_done,0
	BCF ta_uvr_get_0001C_1_firstrun,1
	CLRF ta_uvr_get_0001C_1_counter
	CLRF ta_uvr_get_0001C_1_input
	CLRF ta_uvr_get_0001C_1_bytecount
	CLRF ta_uvr_get_0001C_1_databyte
	CALL ta_uvr_cal_00022
	MOVF CompTempVarRet260, W
	MOVWF ta_uvr_get_0001C_1_bit_time
	MOVF CompTempVarRet260+D'1', W
	MOVWF ta_uvr_get_0001C_1_bit_time+D'1'
	MOVF ta_uvr_get_0001C_1_bit_time, F
	BNZ	label268437344
	MOVF ta_uvr_get_0001C_1_bit_time+D'1', F
	BNZ	label268437344
	RETURN
label268437344
	MOVF ta_uvr_get_0001C_1_bit_time, W
	MOVWF CompTempVar234
	MOVF ta_uvr_get_0001C_1_bit_time+D'1', W
	MOVWF CompTempVar235
	RLCF CompTempVar235, W
	RRCF CompTempVar235, F
	RRCF CompTempVar234, W
	SUBLW 0xFF
	MOVWF ta_uvr_get_0001C_1_timer_wait
	MOVLW 0xFF
	SUBFWB CompTempVar235, W
	MOVWF ta_uvr_get_0001C_1_timer_wait+D'1'
label268437353
	MOVF ta_uvr_get_0001C_1_bit_time, W
	MOVWF ta_uvr_wai_00023_arg_bit_time
	MOVF ta_uvr_get_0001C_1_bit_time+D'1', W
	MOVWF ta_uvr_wai_00023_arg_bit_time+D'1'
	CALL ta_uvr_wai_00023
	TSTFSZ CompTempVarRet284
	BRA	label268437359
	CALL ta_uvr_cal_00022
	MOVF CompTempVarRet260, W
	MOVWF ta_uvr_get_0001C_1_bit_time
	MOVF CompTempVarRet260+D'1', W
	MOVWF ta_uvr_get_0001C_1_bit_time+D'1'
	MOVF ta_uvr_get_0001C_1_bit_time, W
	MOVWF CompTempVar238
	MOVF ta_uvr_get_0001C_1_bit_time+D'1', W
	MOVWF CompTempVar239
	RLCF CompTempVar239, W
	RRCF CompTempVar239, F
	RRCF CompTempVar238, W
	SUBLW 0xFF
	MOVWF CompTempVar240
	MOVLW 0xFF
	SUBFWB CompTempVar239, W
	MOVWF CompTempVar241
	MOVF CompTempVar240, W
	MOVWF ta_uvr_get_0001C_1_timer_wait
	MOVF CompTempVar241, W
	MOVWF ta_uvr_get_0001C_1_timer_wait+D'1'
	BRA	label268437353
label268437359
	MOVF ta_uvr_get_0001C_1_timer_wait, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_get_0001C_1_timer_wait+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
	BCF gbl_tmr1if,0
label268437376
	BTFSC gbl_tmr1if,0
	BRA	label268437377
	NOP
	BRA	label268437376
label268437377
	MOVLW 0x01
	MOVWF tmr1_setup_00000_arg_irq_mode
	CALL tmr1_setup_00000
	MOVF ta_uvr_get_0001C_1_bit_time, W
	MOVWF CompTempVar244
	MOVF ta_uvr_get_0001C_1_bit_time+D'1', W
	MOVWF CompTempVar245
	BCF STATUS,C
	RLCF CompTempVar244, F
	RLCF CompTempVar245, F
	MOVF CompTempVar244, W
	SUBLW 0xFF
	MOVWF tmr1_set_00000_arg_value
	MOVLW 0xFF
	SUBFWB CompTempVar245, W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
	BSF gbl_t1con,0
	BSF ta_uvr_get_0001C_1_firstrun,1
	CLRF ta_uvr_get_0001C_1_bytecount
label268437403
	MOVLW 0x23
	CPFSLT ta_uvr_get_0001C_1_bytecount
	RETURN
label4026532957
	BTFSC gbl_ta_uvr_gotbit,0
	BRA	label268437408
	BTFSC ta_uvr_get_0001C_1_firstrun,1
	BRA	label268437408
	NOP
	BRA	label4026532957
label268437408
	CLRF CompTempVar248
	BTFSC gbl_uvr_data,2
	INCF CompTempVar248, F
	MOVF CompTempVar248, W
	MOVWF ta_uvr_get_0001C_1_input
	BSF gbl_portb,1
	BCF gbl_portb,1
	BCF ta_uvr_get_0001C_1_firstrun,1
	BCF gbl_ta_uvr_gotbit,0
	MOVF ta_uvr_get_0001C_1_counter, F
	BNZ	label268437424
	MOVF ta_uvr_get_0001C_1_input, F
	BNZ	label268437427
	MOVLW 0x20
	MOVWF CompTempVar249+D'5'
	MOVWF CompTempVar249+D'9'
	MOVWF CompTempVar249+D'13'
	MOVWF CompTempVar249+D'18'
	MOVWF CompTempVar249+D'22'
	MOVWF CompTempVar249+D'27'
	MOVLW 0x53
	MOVWF CompTempVar249
	MOVLW 0x61
	MOVWF CompTempVar249+D'2'
	MOVLW 0x62
	MOVWF CompTempVar249+D'6'
	MOVWF CompTempVar249+D'23'
	MOVLW 0x65
	MOVWF CompTempVar249+D'15'
	MOVWF CompTempVar249+D'26'
	MOVLW 0x66
	MOVWF CompTempVar249+D'19'
	MOVLW 0x69
	MOVWF CompTempVar249+D'7'
	MOVLW 0x6E
	MOVWF CompTempVar249+D'10'
	MOVLW 0x6F
	MOVWF CompTempVar249+D'11'
	MOVWF CompTempVar249+D'17'
	MOVWF CompTempVar249+D'20'
	MOVLW 0x72
	MOVWF CompTempVar249+D'3'
	MOVWF CompTempVar249+D'16'
	MOVWF CompTempVar249+D'21'
	MOVLW 0x74
	MOVWF CompTempVar249+D'1'
	MOVWF CompTempVar249+D'4'
	MOVWF CompTempVar249+D'8'
	MOVWF CompTempVar249+D'12'
	MOVWF CompTempVar249+D'25'
	MOVLW 0x79
	MOVWF CompTempVar249+D'24'
	MOVLW 0x7A
	MOVWF CompTempVar249+D'14'
	CLRF CompTempVar249+D'28'
	MOVLW HIGH(CompTempVar249+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar249+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF ta_uvr_get_0001C_1_bytecount, W
	MOVWF serial_pri_0000D_arg_number
	CALL serial_pri_0000D
	MOVLW 0x21
	MOVWF CompTempVar251
	MOVWF CompTempVar251+D'1'
	MOVLW 0x20
	MOVWF CompTempVar251+D'2'
	MOVLW 0x51
	MOVWF CompTempVar251+D'3'
	MOVLW 0x75
	MOVWF CompTempVar251+D'4'
	MOVLW 0x69
	MOVWF CompTempVar251+D'5'
	MOVLW 0x74
	MOVWF CompTempVar251+D'6'
	MOVLW 0x2E
	MOVWF CompTempVar251+D'7'
	MOVWF CompTempVar251+D'8'
	MOVWF CompTempVar251+D'9'
	CLRF CompTempVar251+D'10'
	MOVLW HIGH(CompTempVar251+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar251+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
label268437427
	CLRF ta_uvr_get_0001C_1_databyte
	INCF ta_uvr_get_0001C_1_counter, F
	BRA	label268437403
label268437424
	MOVLW 0x09
	CPFSEQ ta_uvr_get_0001C_1_counter
	BRA	label268437459
	DECF ta_uvr_get_0001C_1_input, W
	BNZ	label268437462
	MOVLW 0x20
	MOVWF CompTempVar253+D'4'
	MOVWF CompTempVar253+D'8'
	MOVWF CompTempVar253+D'12'
	MOVWF CompTempVar253+D'16'
	MOVWF CompTempVar253+D'20'
	MOVWF CompTempVar253+D'25'
	MOVLW 0x53
	MOVWF CompTempVar253
	MOVLW 0x62
	MOVWF CompTempVar253+D'5'
	MOVWF CompTempVar253+D'21'
	MOVLW 0x65
	MOVWF CompTempVar253+D'15'
	MOVWF CompTempVar253+D'24'
	MOVLW 0x66
	MOVWF CompTempVar253+D'17'
	MOVLW 0x69
	MOVWF CompTempVar253+D'6'
	MOVLW 0x6E
	MOVWF CompTempVar253+D'9'
	MOVWF CompTempVar253+D'14'
	MOVLW 0x6F
	MOVWF CompTempVar253+D'2'
	MOVWF CompTempVar253+D'10'
	MOVWF CompTempVar253+D'13'
	MOVWF CompTempVar253+D'18'
	MOVLW 0x70
	MOVWF CompTempVar253+D'3'
	MOVLW 0x72
	MOVWF CompTempVar253+D'19'
	MOVLW 0x74
	MOVWF CompTempVar253+D'1'
	MOVWF CompTempVar253+D'7'
	MOVWF CompTempVar253+D'11'
	MOVWF CompTempVar253+D'23'
	MOVLW 0x79
	MOVWF CompTempVar253+D'22'
	CLRF CompTempVar253+D'26'
	MOVLW HIGH(CompTempVar253+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar253+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVF ta_uvr_get_0001C_1_bytecount, W
	MOVWF serial_pri_0000D_arg_number
	CALL serial_pri_0000D
	MOVLW 0x21
	MOVWF CompTempVar255
	MOVWF CompTempVar255+D'1'
	MOVLW 0x20
	MOVWF CompTempVar255+D'2'
	MOVLW 0x51
	MOVWF CompTempVar255+D'3'
	MOVLW 0x75
	MOVWF CompTempVar255+D'4'
	MOVLW 0x69
	MOVWF CompTempVar255+D'5'
	MOVLW 0x74
	MOVWF CompTempVar255+D'6'
	MOVLW 0x2E
	MOVWF CompTempVar255+D'7'
	MOVWF CompTempVar255+D'8'
	MOVWF CompTempVar255+D'9'
	CLRF CompTempVar255+D'10'
	MOVLW HIGH(CompTempVar255+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar255+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	RETURN
label268437462
	CLRF ta_uvr_get_0001C_1_counter
	MOVLW 0xFF
	XORWF ta_uvr_get_0001C_1_databyte, W
	MOVWF CompTempVar258
	MOVLW	HIGH(gbl_mydata)

	MOVWF	FSR0H
	MOVLW LOW(gbl_mydata+D'0')
	MOVWF FSR0L
	MOVF ta_uvr_get_0001C_1_bytecount, W
	ADDWF FSR0L, F
	MOVF CompTempVar258, W
	MOVWF INDF0
	INCF ta_uvr_get_0001C_1_bytecount, F
	BCF gbl_t1con,0
	MOVF ta_uvr_get_0001C_1_timer_wait, W
	MOVWF tmr1_set_00000_arg_value
	MOVF ta_uvr_get_0001C_1_timer_wait+D'1', W
	MOVWF tmr1_set_00000_arg_value+D'1'
	CALL tmr1_set_00000
label268437503
	BTFSS gbl_uvr_data,2
	BRA	label268437503
	BSF gbl_t1con,0
	BRA	label268437403
label268437459
	MOVF ta_uvr_get_0001C_1_databyte, W
	MOVWF CompTempVar259
	BCF STATUS,C
	RRCF CompTempVar259, W
	MOVWF ta_uvr_get_0001C_1_databyte
	BCF ta_uvr_get_0001C_1_databyte,7
	BTFSC ta_uvr_get_0001C_1_input,0
	BSF ta_uvr_get_0001C_1_databyte,7
	INCF ta_uvr_get_0001C_1_counter, F
	BRA	label268437403
; } ta_uvr_getinfo function end

	ORG 0x000010C6
ta_uvr_dat_0001E
; { ta_uvr_data_available ; function begin
	MOVF gbl_ta_uvr_data_valid, W
	MOVWF CompTempVarRet314
	RETURN
; } ta_uvr_data_available function end

	ORG 0x000010CC
serial_get_00011
; { serial_getch ; function begin
	BTFSS gbl_rcsta,1
	BRA	label268436952
	MOVLW 0x4F
	MOVWF CompTempVar217
	MOVLW 0x45
	MOVWF CompTempVar217+D'1'
	MOVLW 0x52
	MOVWF CompTempVar217+D'2'
	MOVWF CompTempVar217+D'3'
	CLRF CompTempVar217+D'4'
	MOVLW HIGH(CompTempVar217+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar217+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BCF gbl_rcsta,4
	BSF gbl_rcsta,4
label268436952
	BTFSS gbl_pir1,5
	BRA	label268436952
	MOVF gbl_rcreg, W
	MOVWF CompTempVarRet215
	RETURN
; } serial_getch function end

	ORG 0x000010FA
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
	MOVWF serial_ini_0000B_arg_brg
	CALL serial_ini_0000B
label268436208
	MOVF init_00000_1_blink_count, W
	MOVWF CompTempVar148
	INCF init_00000_1_blink_count, F
	MOVLW 0x05
	CPFSLT CompTempVar148
	BRA	label268436210
	MOVLW 0x32
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF gbl_stat0,4
	MOVLW 0x32
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BSF gbl_stat0,4
	BRA	label268436208
label268436210
	MOVLW 0x0A
	MOVLB 0x00
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

	ORG 0x0000115C
main
; { main ; function begin
	CLRF main_1_tmp
	CLRF main_1_valid_data
	CLRF main_1_prev_count
	CLRF main_1_prev_count+D'1'
	CALL init_00000
label268436306
	MOVF gbl_interrupt_count, W
	CPFSEQ main_1_prev_count
	BRA	label4026532969
	MOVF gbl_interrupt_count+D'1', W
	CPFSEQ main_1_prev_count+D'1'
	CPFSEQ gbl_interrupt_count+D'1'
	BRA	label268436310
label4026532969
	BCF gbl_portb,1
	MOVF gbl_interrupt_count, W
	MOVWF main_1_prev_count
	MOVF gbl_interrupt_count+D'1', W
	MOVWF main_1_prev_count+D'1'
label268436310
	CALL ta_uvr_get_0001C
	BSF gbl_portb,1
	CALL ta_uvr_ver_0001D
	MOVF CompTempVarRet308, F
	BNZ	label268436318
	BCF gbl_stat0,4
	BRA	label268436322
label268436318
	BSF gbl_stat0,4
label268436322
	BTFSS gbl_pir1,5
	BRA	label268436306
	CALL serial_get_00011
	MOVF CompTempVarRet215, W
	MOVWF main_1_command_byte
	CALL ta_uvr_dat_0001E
	MOVF CompTempVarRet314, F
	BZ	label268436331
	BSF gbl_stat0,4
	CALL ta_uvr_sen_0001F
	BRA	label268436337
label268436331
	MOVLW 0x20
	MOVLB 0x00
	MOVWF CompTempVar149+D'2', 1
	MOVWF CompTempVar149+D'8', 1
	MOVWF CompTempVar149+D'15', 1
	MOVWF CompTempVar149+D'24', 1
	MOVWF CompTempVar149+D'29', 1
	MOVWF CompTempVar149+D'39', 1
	MOVWF CompTempVar149+D'45', 1
	MOVWF CompTempVar149+D'50', 1
	MOVLW 0x4E
	MOVWF CompTempVar149, 1
	MOVLW 0x61
	MOVWF CompTempVar149+D'4', 1
	MOVWF CompTempVar149+D'10', 1
	MOVWF CompTempVar149+D'35', 1
	MOVWF CompTempVar149+D'47', 1
	MOVWF CompTempVar149+D'53', 1
	MOVLW 0x63
	MOVWF CompTempVar149+D'11', 1
	MOVWF CompTempVar149+D'18', 1
	MOVWF CompTempVar149+D'43', 1
	MOVLW 0x64
	MOVWF CompTempVar149+D'7', 1
	MOVWF CompTempVar149+D'23', 1
	MOVWF CompTempVar149+D'54', 1
	MOVLW 0x65
	MOVWF CompTempVar149+D'13', 1
	MOVWF CompTempVar149+D'17', 1
	MOVWF CompTempVar149+D'19', 1
	MOVWF CompTempVar149+D'22', 1
	MOVWF CompTempVar149+D'31', 1
	MOVWF CompTempVar149+D'44', 1
	MOVWF CompTempVar149+D'52', 1
	MOVLW 0x66
	MOVWF CompTempVar149+D'25', 1
	MOVLW 0x67
	MOVWF CompTempVar149+D'32', 1
	MOVLW 0x69
	MOVWF CompTempVar149+D'6', 1
	MOVWF CompTempVar149+D'20', 1
	MOVWF CompTempVar149+D'41', 1
	MOVLW 0x6B
	MOVWF CompTempVar149+D'12', 1
	MOVLW 0x6C
	MOVWF CompTempVar149+D'5', 1
	MOVWF CompTempVar149+D'34', 1
	MOVWF CompTempVar149+D'46', 1
	MOVLW 0x6D
	MOVWF CompTempVar149+D'28', 1
	MOVLW 0x6E
	MOVWF CompTempVar149+D'42', 1
	MOVLW 0x6F
	MOVWF CompTempVar149+D'1', 1
	MOVWF CompTempVar149+D'27', 1
	MOVWF CompTempVar149+D'37', 1
	MOVLW 0x70
	MOVWF CompTempVar149+D'9', 1
	MOVLW 0x72
	MOVWF CompTempVar149+D'16', 1
	MOVWF CompTempVar149+D'26', 1
	MOVWF CompTempVar149+D'30', 1
	MOVWF CompTempVar149+D'38', 1
	MOVWF CompTempVar149+D'51', 1
	MOVLW 0x73
	MOVWF CompTempVar149+D'40', 1
	MOVWF CompTempVar149+D'48', 1
	MOVLW 0x74
	MOVWF CompTempVar149+D'14', 1
	MOVWF CompTempVar149+D'36', 1
	MOVWF CompTempVar149+D'49', 1
	MOVLW 0x75
	MOVWF CompTempVar149+D'33', 1
	MOVLW 0x76
	MOVWF CompTempVar149+D'3', 1
	MOVWF CompTempVar149+D'21', 1
	CLRF CompTempVar149+D'55', 1
	MOVLW HIGH(CompTempVar149+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar149+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	MOVLW 0x0A
	MOVLB 0x00
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
label268436337
	MOVLW 0x20
	MOVWF CompTempVar151+D'11'
	MOVLW 0x3A
	MOVWF CompTempVar151+D'10'
	MOVLW 0x49
	MOVWF CompTempVar151
	MOVLW 0x65
	MOVWF CompTempVar151+D'3'
	MOVLW 0x6E
	MOVWF CompTempVar151+D'1'
	MOVLW 0x70
	MOVWF CompTempVar151+D'7'
	MOVLW 0x72
	MOVWF CompTempVar151+D'4'
	MOVWF CompTempVar151+D'5'
	MOVLW 0x73
	MOVWF CompTempVar151+D'9'
	MOVLW 0x74
	MOVWF CompTempVar151+D'2'
	MOVWF CompTempVar151+D'8'
	MOVLW 0x75
	MOVWF CompTempVar151+D'6'
	CLRF CompTempVar151+D'12'
	MOVLW HIGH(CompTempVar151+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar151+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BCF gbl_intcon,7
	MOVF gbl_interrupt_count, W
	MOVWF serial_pri_0000E_arg_number
	MOVF gbl_interrupt_count+D'1', W
	MOVWF serial_pri_0000E_arg_number+D'1'
	CALL serial_pri_0000E
	CLRF gbl_interrupt_count
	CLRF gbl_interrupt_count+D'1'
	CLRF main_1_prev_count
	CLRF main_1_prev_count+D'1'
	BSF gbl_intcon,7
	MOVLW 0x0A
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x0D
	MOVWF serial_pri_00009_arg_value, 1
	CALL serial_pri_00009
	MOVLW 0x45
	MOVWF CompTempVar153
	MOVLW 0x4F
	MOVWF CompTempVar153+D'1'
	MOVLW 0x54
	MOVWF CompTempVar153+D'2'
	CLRF CompTempVar153+D'3'
	MOVLW HIGH(CompTempVar153+D'0')
	MOVWF serial_pri_00007_arg_text+D'1'
	MOVLW LOW(CompTempVar153+D'0')
	MOVWF serial_pri_00007_arg_text
	CALL serial_pri_00007
	BRA	label268436306
; } main function end

	ORG 0x000012E6
_startup
	CLRF gbl_ta_uvr_data_valid
	GOTO	main
	ORG 0x000012EC
interrupt
; { interrupt ; function begin
	MOVFF FSR0H,  Int1Context
	MOVFF FSR0L,  Int1Context+D'1'
	MOVFF PRODH,  Int1Context+D'2'
	MOVFF PRODL,  Int1Context+D'3'
	BTFSS gbl_tmr1if,0
	BRA	label268436384
	MOVF gbl_ta_uvr_tmrh, W
	MOVWF gbl_tmr1h
	MOVF gbl_ta_uvr_tmrl, W
	MOVWF gbl_tmr1l
	BSF gbl_ta_uvr_gotbit,0
	BCF gbl_pir1,0
label268436384
	BTFSS gbl_intcon,1
	BRA	label268436391
	INFSNZ gbl_interrupt_count, F
	INCF gbl_interrupt_count+D'1', F
	BCF gbl_intcon,1
label268436391
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
