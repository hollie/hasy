Project:      output/sensor_gateway
Build Number: 0
Date:         Tue Nov  9 13:36:25 2010
Compiler:     ICCM8C
Version:      7.02.004

  ROM 38% full. 12448 out of 32768 bytes used (does not include absolute areas).
  RAM 20% full. 342 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   05B7 =   1463. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0423  LoadConfigTBL_sensor_gateway_Bank0
       04A2  LoadConfigTBL_sensor_gateway_Bank1
       04F7  LoadConfigTBL_sensor_gateway_Ordered
       05E2  __ctype
       0757  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   0757   0004 =      4. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0757  __func_lit_start
       075B  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   075B   0065 =    101. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       075B  LoadConfigInit
       075B  _LoadConfigInit
       0765  _LoadConfig_sensor_gateway
       0765  LoadConfig_sensor_gateway
       07C0  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   07C0   06A2 =   1698. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       07C0  Ticker_EnableInt
       07C0  _Ticker_EnableInt
       07C4  _Ticker_DisableInt
       07C4  Ticker_DisableInt
       07C8  _Ticker_Start
       07C8  Ticker_Start
       07CC  _Ticker_Stop
       07CC  Ticker_Stop
       07D0  _Ticker_WritePeriod
       07D0  Ticker_WritePeriod
       07D6  Ticker_WriteCompareValue
       07D6  _Ticker_WriteCompareValue
       07DC  _wTicker_ReadCompareValue
       07DC  _Ticker_wReadCompareValue
       07DC  Ticker_wReadCompareValue
       07DC  wTicker_ReadCompareValue
       07E2  Ticker_wReadCounter
       07E2  _wTicker_ReadCounter
       07E2  wTicker_ReadCounter
       07E2  _Ticker_wReadCounter
       0820  _Speed_PWM_ISR
       0821  Speed_PWM_EnableInt
       0821  _Speed_PWM_EnableInt
       0825  Speed_PWM_DisableInt
       0825  _Speed_PWM_DisableInt
       0829  Speed_PWM_Start
       0829  _Speed_PWM_Start
       082D  _Speed_PWM_Stop
       082D  Speed_PWM_Stop
       0831  _Speed_PWM_WritePeriod
       0831  Speed_PWM_WritePeriod
       0834  _Speed_PWM_WritePulseWidth
       0834  Speed_PWM_WritePulseWidth
       0837  Speed_PWM_bReadPulseWidth
       0837  bSpeed_PWM_ReadPulseWidth
       0837  _bSpeed_PWM_ReadPulseWidth
       0837  _Speed_PWM_bReadPulseWidth
       083A  bSpeed_PWM_ReadCounter
       083A  _bSpeed_PWM_ReadCounter
       083A  _Speed_PWM_bReadCounter
       083A  Speed_PWM_bReadCounter
       0867  _OneWire_ISR
       0868  _OneWire_Start
       0868  OneWire_Start
       0879  OneWire_Stop
       0879  _OneWire_Stop
       0880  _OneWire_fReset
       0880  OneWire_fReset
       0899  OneWire_WriteBit
       0899  _OneWire_WriteBit
       08A5  OneWire_bReadBit
       08A5  _OneWire_bReadBit
       08B6  OneWire_WriteByte
       08B6  _OneWire_WriteByte
       08D1  _OneWire_bReadByte
       08D1  OneWire_bReadByte
       08E5  _OneWire_ClearCRC8
       08E5  OneWire_ClearCRC8
       08EC  _OneWire_bCRC8
       08EC  OneWire_bCRC8
       0906  _OneWire_GetROM
       0906  OneWire_GetROM
       0932  _OneWire_SetROM
       0932  OneWire_SetROM
       095E  OneWire_fFindFirst
       095E  _OneWire_fFindFirst
       0973  OneWire_fFindNext
       0973  _OneWire_fFindNext
       0A97  _OneWire_fVerify
       0A97  OneWire_fVerify
       0B2F  _OneWire_FamilyTargetSetup
       0B2F  OneWire_FamilyTargetSetup
       0B5A  _OneWire_FamilySkipSetup
       0B5A  OneWire_FamilySkipSetup
       0B79  _LTRX_TX_ISR
       0B7A  _LTRX_RX_ISR
       0BEE  LTRX_EnableInt
       0BEE  _LTRX_EnableInt
       0BF5  LTRX_DisableInt
       0BF5  _LTRX_DisableInt
       0BFC  _LTRX_SetTxIntMode
       0BFC  LTRX_SetTxIntMode
       0C0E  _LTRX_Start
       0C0E  LTRX_Start
       0C17  _LTRX_Stop
       0C17  LTRX_Stop
       0C1E  LTRX_SendData
       0C1E  _LTRX_SendData
       0C21  bLTRX_ReadTxStatus
       0C21  _LTRX_bReadTxStatus
       0C21  _bLTRX_ReadTxStatus
       0C21  LTRX_bReadTxStatus
       0C24  _bLTRX_ReadRxData
       0C24  _LTRX_bReadRxData
       0C24  bLTRX_ReadRxData
       0C24  LTRX_bReadRxData
       0C27  bLTRX_ReadRxStatus
       0C27  _LTRX_bReadRxStatus
       0C27  _bLTRX_ReadRxStatus
       0C27  LTRX_bReadRxStatus
       0C2A  _LTRX_TxIntMode
       0C2A  LTRX_TxIntMode
       0C3D  _LTRX_IntCntl
       0C3D  LTRX_IntCntl
       0C68  _LTRX_PutSHexByte
       0C68  LTRX_PutSHexByte
       0C7B  _LTRX_PutSHexInt
       0C7B  LTRX_PutSHexInt
       0C82  _LTRX_PutChar
       0C82  LTRX_PutChar
       0C8A  _LTRX_cGetChar
       0C8A  LTRX_cGetChar
       0C92  LTRX_cReadChar
       0C92  _LTRX_cReadChar
       0CA9  _LTRX_iReadChar
       0CA9  LTRX_iReadChar
       0CBF  LTRX_PutString
       0CBF  _LTRX_PutString
       0CD1  _LTRX_Write
       0CD1  LTRX_Write
       0CF9  LTRX_CWrite
       0CF9  _LTRX_CWrite
       0D25  _LTRX_CPutString
       0D25  LTRX_CPutString
       0D37  LTRX_PutCRLF
       0D37  _LTRX_PutCRLF
       0D40  LTRX_CmdReset
       0D40  _LTRX_CmdReset
       0D56  _LTRX_bCmdCheck
       0D56  LTRX_bCmdCheck
       0D5E  LTRX_bErrCheck
       0D5E  _LTRX_bErrCheck
       0D69  LTRX_bCmdLength
       0D69  _LTRX_bCmdLength
       0D6F  LTRX_szGetParam
       0D6F  _LTRX_szGetParam
       0DCE  LTRX_szGetRestOfParams
       0DCE  _LTRX_szGetRestOfParams
       0DD9  LED1_On
       0DD9  _LED1_On
       0DDD  LED1_Start
       0DDD  LED1_Off
       0DDD  _LED1_Start
       0DDD  _LED1_Off
       0DDD  LED1_Stop
       0DDD  _LED1_Stop
       0DDF  _LED1_Switch
       0DDF  LED1_Switch
       0DF7  LED1_Invert
       0DF7  _LED1_Invert
       0E06  LED1_GetState
       0E06  _LED1_GetState
       0E17  _Counter8_ltrx_ISR
       0E18  _Counter8_ltrx_EnableInt
       0E18  Counter8_ltrx_EnableInt
       0E1C  Counter8_ltrx_DisableInt
       0E1C  _Counter8_ltrx_DisableInt
       0E20  _Counter8_ltrx_Start
       0E20  Counter8_ltrx_Start
       0E24  Counter8_ltrx_Stop
       0E24  _Counter8_ltrx_Stop
       0E28  _Counter8_ltrx_WritePeriod
       0E28  Counter8_ltrx_WritePeriod
       0E2B  _Counter8_ltrx_WriteCompareValue
       0E2B  Counter8_ltrx_WriteCompareValue
       0E2E  bCounter8_ltrx_ReadCompareValue
       0E2E  _bCounter8_ltrx_ReadCompareValue
       0E2E  _Counter8_ltrx_bReadCompareValue
       0E2E  Counter8_ltrx_bReadCompareValue
       0E31  _Counter8_ltrx_bReadCounter
       0E31  _bCounter8_ltrx_ReadCounter
       0E31  bCounter8_ltrx_ReadCounter
       0E31  Counter8_ltrx_bReadCounter
       0E62  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0E62   23DE =   9182. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0E62  __text_start
       0E62  _Ticker_ISR
       0EE4  _print_header
       0EF9  _print_help
       0F10  _hardware_init
       0F3E  _main
       105F  _putchar
       1073  _oo_busreset
       107C  _oo_tx_byte
       1087  _oo_rx_byte
       10A8  _oo_read_scratchpad
       10E9  _oo_get_temp
       1114  _oo_get_count
       113F  _oo_conversion_busy
       1152  _delay_10ms
       1172  _oo_start_conversion
       117F  _oo_wait_for_completion
       11A7  _oo_crc_init
       11AE  _oo_crc_shuffle_byte
       11DF  _oo_read_device
       126B  _oo_print_data
       130C  _oo_report
       13AE  _orcon_Start
       13BB  _orcon_ticker
       13D3  _orcon_control
       1466  _s_Start
       146A  _s_write_byte
       14C4  _s_read_byte
       1524  _s_transstart
       154F  _s_connectionreset
       157D  _s_softreset
       1598  _s_read_statusreg
       15E1  _s_write_statusreg
       160E  _s_measure
       16EF  _calc_sth11
       19DE  _calc_dewpoint
       1B96  _s_do_measure
       1E32  _delay_1us
       1E33  _delay_5us
       1E48  __divmodu_16X16_16
       1E53  __divmodu_8X8_8
       1E6B  __F_analysisEject_util
       1E76  __F_Round_util
       1E8C  __F_Normal_util
       1E97  __F_clrReg_util
       1EA2  __F_NaN_Res_util
       1EAE  __F_SaveRes_util
       1ECB  __F_SendToReg_util
       1EDC  __F_sInf_Res_util
       1EE9  __F_sZero_Res_util
       1EF1  __F_Type_Oprnd_util
       1F10  __F_Unnormal_util
       1F26  __fpadd
       2026  __fpcmp
       2083  __fpdiv
       2166  __fpmul
       2290  __fpsub
       2299  __i_div16_block_util
       22D2  __i_div32_not_util
       22EA  __i_div8_block_util
       2303  __i_mulu8_block_util
       2320  __long2fp
       238B  _cstrcmpLMM
       2396  _cstrcmp
       23C1  __plcall
       23CD  _atoi
       250E  _itoa
       26E7  _utoa
       282A  _isdigit
       284B  _islower
       286C  _isspace
       288D  _toupper
       28CB  _frexpf
       29A1  _log10f
       2A1A  _logf
       2CC9  _cprintf
       2D0A  __cprint
       3354  __xidata_end
       3240  __text_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0068   0161 =    353. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       015E  bGetPowerSetting
       015E  _bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   0003 =      3. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _Port_3_Data_SHADE
       0000  NO_SHADOW
       0000  _NO_SHADOW
       0000  Port_3_Data_SHADE
       0001  LTRX_fStatus
       0001  _LTRX_fStatus
       0002  _LTRX_bRxCnt
       0002  LTRX_bRxCnt

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        LTRX_RAM   0000   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       001C  LTRX_aRxBuffer
       001C  _LTRX_aRxBuffer

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0000   000C =     12. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __bss_start
       003B  OneWire_bCRC8Value
       003B  _OneWire_bCRC8Value

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   002C   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       002C  __rZ
       002D  __rY
       002E  __rX
       002F  __r11
       0030  __r10
       0031  __r9
       0032  __r8
       0033  __r7
       0034  __r6
       0035  __r5
       0036  __r4
       0037  __r3
       0038  __r2
       0039  __r1
       003A  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0127 =    295. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0047  _oo_scratchpad
       0050  _orcon_count
       0052  _errno
       0055  _crc
       0100  _crc_rom

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
./obj/oo.o	[ oo.c ]
./obj/orcon.o	[ orcon.c ]
./obj/shtxx.o	[ shtxx.c ]
<library>	[ ticker.asm, speed_pwmint.asm, speed_pwm.asm, psocconfigtbl.asm, psocconfig.asm, onewireint.asm ]
[ onewire.asm, ltrxint.asm, ltrx.asm, led1.asm, counter8_ltrxint.asm, counter8_ltrx.asm, rZ.asm ]
[ rY.asm, rX.asm, r11.asm, r10.asm, r9.asm, r8.asm, r7.asm, r6.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm ]
[ r0.asm, divmodu_16x16_16_util.asm, divmodu_8x8_8_util.asm, fp_analysiseject_util.asm, fp_clrreg_util.asm ]
[ fp_nan_res_util.asm, fp_saveres_util.asm, fp_sendtoreg_util.asm, fp_sinf_res_util.asm, fp_szero_res_util.asm ]
[ fp_type_oprnd_util.asm, fp_unnormal_util.asm, fpadd_util.asm, fpcmp_util.asm, fpdiv_util.asm ]
[ fpmul_util.asm, fpsub_util.asm, i_div16_block_util.asm, i_div32_not_util.asm, i_div8_block_util.asm ]
[ i_mulu8_block_util.asm, long2fp_util.asm, cstrcmp.s, plcall.s, atoi.s, itoa.s, utoa.s, isdigit.s ]
[ islower.s, isspace.s, ctype.s, toupper.s, frexpf.s, log10f.s, logf.s, printf.s, _printf.s, errno.s ]


Area Definitions

-blit:0x1a0.0x7fff
-bdata:0.0x6ff
-BInterruptRAM:0	allocated at: 0
-Bvirtual_registers	allocated at: 0x2c
-Bsensor_gateway_RAM	allocated at: 0

