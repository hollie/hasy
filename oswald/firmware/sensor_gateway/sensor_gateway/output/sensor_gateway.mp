HI-TECH Software C Compiler 

Linker command line:

--edf=C:\Program Files\HI-TECH Software\HCPSOC\PRO\9.61\dat\en_msgs.txt -cs \
  -h+output\sensor_gateway.sym -z -QCY8C29566 -ol.obj \
  -Moutput/sensor_gateway.mp -E1 -ACODE=00h-03h,065h-07FFFh \
  -ABANKROM=00h-03h,065h-0FFh,0100h-01FFhx127 -AROM=00h-03h,065h-07FFFh \
  -ARAM=00h-0F7h,0100h-01FFhx7 -pvectors=0x0 -pstrings=ROM -pcdata=ROM \
  -pPD_startup=CODE,powerup,init,end_init -pintrtext=CODE -pmaintext=CODE \
  -ptext=CODE -pUserModules=CODE \
  -pbss0=00h,rbit0,ramdata0,nvram0,nvbit0,fnauto,InterruptRAM \
  -promdata0=BANKROM -pbss1=0100h,rbit1,ramdata1,nvram1,nvbit1 \
  -promdata1=BANKROM -pbss2=0200h,rbit2,ramdata2,nvram2,nvbit2 \
  -promdata2=BANKROM -pbss3=0300h,rbit3,ramdata3,nvram3,nvbit3 \
  -promdata3=BANKROM -pbss4=0400h,rbit4,ramdata4,nvram4,nvbit4 \
  -promdata4=BANKROM -pbss5=0500h,rbit5,ramdata5,nvram5,nvbit5 \
  -promdata5=BANKROM -pbss6=0600h,rbit6,ramdata6,nvram6,nvbit6 \
  -promdata6=BANKROM -pbss7=0700h,rbit7,ramdata7,nvram7,nvbit7 \
  -promdata7=BANKROM -pstackps=0700h/0700h output\startup.obj \
  output\sensor_gateway.obj ./obj/boot.obj lib/libpsoc.lib \
  C:/PROGRA~1/Cypress/Common/CYPRES~2/tools/lib/CY8C29000/cms.lib 

Object code version is 3.10

Machine type is CY8C29566

Call graph: (short form)

*_main size 0,4 offset 0
     _hardware_init size 0,0 offset 4
         _Counter8_ltrx_Start size 0,0 offset 4
         _LED1_Start size 0,0 offset 4
         _Ticker_Start size 0,0 offset 4
         _OneWire_Start size 0,0 offset 4
         _s_Start size 0,0 offset 4
         _orcon_Start size 0,0 offset 4
         _LTRX_CmdReset size 0,0 offset 4
         _LTRX_EnableInt size 0,0 offset 4
         _LTRX_Start size 0,0 offset 4
         _Ticker_EnableInt size 0,0 offset 4
     _print_help size 0,0 offset 4
         _print_header size 0,0 offset 4
             _LTRX_PutCRLF size 0,0 offset 34
             _LTRX_CPutString size 0,0 offset 34
         _printf size 14,30 offset 20
             _putch size 1,0 offset 64
                 _LTRX_PutChar size 0,0 offset 65
             _isdigit size 1,0 offset 64
             ___wmul size 4,4 offset 64
             ___flge size 8,4 offset 64
             ___flneg size 4,0 offset 75
             ___awdiv size 4,6 offset 93
             _scale size 4,25 offset 64
                 ___awdiv size 4,6 offset 93
                 ___awmod size 4,4 offset 93
                 ___flmul size 8,11 offset 93
                     ___flunpack size 4,7 offset 112
                     ___flpack size 3,6 offset 112
             ___flmul size 8,11 offset 93
             _fround size 4,13 offset 64
                 ___awdiv size 4,6 offset 93
                 ___awmod size 4,4 offset 93
                 ___flmul size 8,11 offset 93
             ___fladd size 8,9 offset 76
                 ___flunpack size 4,7 offset 112
                 ___flpack size 3,6 offset 112
             ___fltol size 4,6 offset 64
                 ___flunpack size 4,7 offset 112
             __div_to_l_ size 8,7 offset 64
                 ___flunpack size 4,7 offset 112
             ___lltofl size 4,5 offset 64
                 ___flpack size 3,6 offset 112
             ___flsub size 8,0 offset 64
                 ___fladd size 8,9 offset 76
             ___lldiv size 8,9 offset 64
             ___llmod size 8,5 offset 64
     _LTRX_bCmdCheck size 0,0 offset 4
     _LTRX_szGetParam size 0,0 offset 4
     _print_header size 0,0 offset 4
*    _printf size 14,30 offset 20
     _oo_report size 0,16 offset 4
         _OneWire_fReset size 0,0 offset 50
         _LTRX_CPutString size 0,0 offset 34
         _LTRX_PutCRLF size 0,0 offset 34
         _oo_start_conversion size 0,0 offset 20
             _oo_tx_byte size 1,0 offset 51
                 _OneWire_WriteByte size 0,0 offset 52
         _oo_wait_for_completion size 0,1 offset 20
             _delay_10ms size 0,2 offset 21
             _oo_conversion_busy size 0,0 offset 21
                 _oo_rx_byte size 0,1 offset 51
                     _OneWire_bReadByte size 0,0 offset 52
                     _oo_crc_shuffle_byte size 1,1 offset 52
         _OneWire_fFindFirst size 0,0 offset 20
         _oo_read_device size 13,17 offset 20
             _OneWire_GetROM size 0,0 offset 50
             _oo_busreset size 0,0 offset 50
                 _OneWire_fReset size 0,0 offset 50
             _OneWire_SetROM size 0,0 offset 50
             _OneWire_fVerify size 0,0 offset 50
             _oo_read_scratchpad size 0,1 offset 50
                 _oo_tx_byte size 1,0 offset 51
                 _oo_crc_init size 0,0 offset 51
                 _oo_rx_byte size 0,1 offset 51
         _oo_print_data size 13,1 offset 20
             _LTRX_CPutString size 0,0 offset 34
             _LTRX_PutSHexByte size 0,0 offset 34
             _LTRX_PutChar size 0,0 offset 65
             _LTRX_PutCRLF size 0,0 offset 34
         _OneWire_fFindNext size 0,0 offset 20
*    _s_do_measure size 0,16 offset 4
         _s_connectionreset size 0,1 offset 20
             _delay_5us size 0,0 offset 36
             _s_transstart size 0,0 offset 33
                 _delay_5us size 0,0 offset 36
         _s_measure size 5,8 offset 20
             _s_transstart size 0,0 offset 33
             _s_write_byte size 1,2 offset 33
                 _delay_5us size 0,0 offset 36
             _delay_5us size 0,0 offset 36
             _s_read_byte size 1,2 offset 33
                 _delay_5us size 0,0 offset 36
         _LTRX_CPutString size 0,0 offset 34
         _LTRX_PutSHexByte size 0,0 offset 34
         ___lwtofl size 4,8 offset 20
             ___flpack size 3,6 offset 112
         _calc_sth11 size 4,33 offset 20
             ___flmul size 8,11 offset 93
             ___fladd size 8,9 offset 76
             ___flge size 8,4 offset 64
         _calc_dewpoint size 8,24 offset 20
             ___flmul size 8,11 offset 93
             _log10 size 4,0 offset 52
                 _log size 4,3 offset 56
                     ___flge size 8,4 offset 64
                     _frexp size 6,3 offset 63
                     ___flmul size 8,11 offset 93
                     ___fladd size 8,9 offset 76
                     _eval_poly size 8,5 offset 63
                         ___flmul size 8,11 offset 93
                         ___fladd size 8,9 offset 76
                     ___awtofl size 4,8 offset 63
                         ___flpack size 3,6 offset 112
                         ___flneg size 4,0 offset 75
                 ___flmul size 8,11 offset 93
             ___fladd size 8,9 offset 76
             ___fldiv size 8,9 offset 52
                 ___flunpack size 4,7 offset 112
                 ___flpack size 3,6 offset 112
             ___flsub size 8,0 offset 64
*        _printf size 14,30 offset 20
     _strcmp size 4,2 offset 4
*    _orcon_low size 0,0 offset 4
*        _printf size 14,30 offset 20
         _orcon_delay size 0,2 offset 4
             _orcon_delay_5us size 0,0 offset 6
*    _orcon_med size 0,0 offset 4
*        _printf size 14,30 offset 20
         _orcon_delay size 0,2 offset 4
*    _orcon_high size 0,0 offset 4
*        _printf size 14,30 offset 20
         _orcon_delay size 0,2 offset 4
     _LTRX_CmdReset size 0,0 offset 4

Estimated maximum call depth: 6

*intlevel1 size 0,0 offset 123
*    _Ticker_ISR size 0,10 offset 123
*        _LED1_Invert size 0,0 offset 133

Estimated maximum call depth: 2


                Name          Link     Load   Length Selector Space Scale
output\startup.obj
                init          7BC9     7BC9       37    7BC9     0
                vectors          0        0        3       0     0
                SSCParmBl       F8       F8        8       0     1
                TOP              4        4       61       0     0
output\sensor_gateway.obj
                intrtext      7B88     7B88       41    7B88     0
                strings       7D00     7D00      255      7D     0
                cdata         7C00     7C00       CC      7C     0
                text          3D41     3D41     3CE6    3D41     0
                maintext      7A27     7A27      161    7A27     0
                ramdata1       100      100      100     100     1
                romdata1       100      100      100     100     0
                bss2           200      200       15     200     1
                rbit0            0        0        1       0     1    8
./obj/boot.obj  PD_startu     7F55     7F55       8A    7F55     0
                TOP              4        4       61       0     0

lib/libpsoc.lib
lib/obj/counter8_ltrx.obj
                UserModul     36EC     36EC       4C    36EC     0
lib/obj/counter8_ltrxint.obj
                UserModul     3738     3738        1    36EC     0
lib/obj/led1.obj
                UserModul     3739     3739       44    36EC     0
lib/obj/ltrx.obj
                UserModul     377D     377D      1E7    36EC     0
                LTRX_RAM        A5       A5        1       0     1
lib/obj/ltrxint.obj
                Interrupt       86       86        2       0     1
                UserModul     3964     3964       75    36EC     0
                LTRX_RAM        89       89       10       0     1
lib/obj/onewire.obj
                UserModul     39D9     39D9      305    36EC     0
                bss             99       99        C       0     1
lib/obj/onewireint.obj
                UserModul     3CDE     3CDE        1    36EC     0
lib/obj/psocconfig.obj
                Interrupt       88       88        1       0     1
                psoc_conf      3B1      3B1       67     200     0
lib/obj/psocconfigtbl.obj
                lit            200      200      1B1     200     0
lib/obj/ticker.obj
                UserModul     3CDF     3CDF       62    36EC     0

C:/PROGRA~1/Cypress/Common/CYPRES~2/tools/lib/CY8C29000/cms.lib

COMMON          fnauto           1        1       85       0     1

TOTAL           Name          Link     Load   Length  Space
        CLASS   CODE           
                intrtext      7B88     7B88       41     0
                PD_startu     7F55     7F55       8A     0
                init          7BC9     7BC9       37     0
                text          3D41     3D41     3CE6     0
                vectors          0        0        3     0
                maintext      7A27     7A27      161     0

        CLASS   BANKROM        
                romdata1       100      100      100     0

        CLASS   ROM            
                UserModul     36EC     36EC      655     0
                strings       7D00     7D00      255     0
                cdata         7C00     7C00       CC     0
                TOP              4        4       61     0
                psoc_conf      3B1      3B1       67     0
                lit            200      200      1B1     0

        CLASS   RAM            
                Interrupt       86       86        3     1
                fnauto           1        1       85     1
                SSCParmBl       F8       F8        8     1
                ramdata1       100      100      100     1
                bss2           200      200       15     1
                rbit0            0        0        1     1
                LTRX_RAM        A5       A5        1     1
                LTRX_RAM        89       89       10     1
                bss             99       99        C     1



SEGMENTS        Name           Load    Length   Top     Selector    Space Class

                bss0            000000  0000A6  0000A6         0       1  RAM     
                vectors         000000  000003  000003         0       0  CODE    
                bss1            000100  000100  000200       100       1  RAM     
                romdata1        000100  000100  000200       100       0  BANKROM 
                bss2            000200  000015  000215       200       1  RAM     
                lit             000200  000218  000418       200       0  ROM     
                UserModules     0036EC  000655  003D41      36EC       0  CODE    
                text            003D41  003CE6  007A27      3D41       0  CODE    
                maintext        007A27  000161  007B88      7A27       0  CODE    
                intrtext        007B88  000041  007BC9      7B88       0  CODE    
                init            007BC9  000037  007C00      7BC9       0  CODE    
                cdata           007C00  0000CC  007CCC        7C       0  ROM     
                strings         007D00  000255  007F55        7D       0  ROM     
                PD_startup      007F55  00008A  007FDF      7F55       0  CODE    


UNUSED ADDRESS RANGES

        BANKROM          0003-0003
                         0065-00FF
                         0418-36EB
                         7CCC-7CFF
                         7FDF-7FFF
        CODE             0003-0003
                         0065-00FF
                         0418-36EB
                         7CCC-7CFF
                         7FDF-7FFF
        RAM              00A6-00F7
                         0215-07FF
        ROM              0003-0003
                         0065-00FF
                         0418-36EB
                         7CCC-7CFF
                         7FDF-7FFF

                                  Symbol Table

??___awdiv                           fnauto             0062
??___awmod                           fnauto             0062
??___awtofl                          fnauto             0044
??___fladd                           fnauto             0055
??___fldiv                           fnauto             003D
??___flge                            fnauto             0049
??___flmul                           fnauto             0066
??___flpack                          fnauto             0074
??___fltol                           fnauto             0045
??___flunpack                        fnauto             0075
??___lldiv                           fnauto             0049
??___llmod                           fnauto             0049
??___lltofl                          fnauto             0045
??___lwtofl                          fnauto             0019
??___wmul                            fnauto             0045
??__div_to_l_                        fnauto             0049
??_calc_dewpoint                     fnauto             001D
??_calc_sth11                        fnauto             0019
??_delay_10ms                        fnauto             0016
??_eval_poly                         fnauto             0048
??_frexp                             fnauto             0046
??_fround                            fnauto             0045
??_log                               fnauto             003D
??_main                              fnauto             0001
??_oo_crc_shuffle_byte               fnauto             0036
??_oo_print_data                     fnauto             0022
??_oo_read_device                    fnauto             0022
??_oo_read_scratchpad                fnauto             0033
??_oo_report                         fnauto             0005
??_oo_rx_byte                        fnauto             0034
??_oo_wait_for_completion            fnauto             0015
??_orcon_delay                       fnauto             0005
??_printf                            fnauto             0023
??_s_connectionreset                 fnauto             0015
??_s_do_measure                      fnauto             0005
??_s_measure                         fnauto             001A
??_s_read_byte                       fnauto             0023
??_s_write_byte                      fnauto             0023
??_scale                             fnauto             0045
??_strcmp                            fnauto             0009
?___awdiv                            fnauto             005E
?___awmod                            fnauto             005E
?___awtofl                           fnauto             0040
?___fladd                            fnauto             004D
?___fldiv                            fnauto             0035
?___flge                             fnauto             0041
?___flmul                            fnauto             005E
?___flneg                            fnauto             004C
?___flpack                           fnauto             0071
?___flsub                            fnauto             0041
?___fltol                            fnauto             0041
?___flunpack                         fnauto             0071
?___lldiv                            fnauto             0041
?___llmod                            fnauto             0041
?___lltofl                           fnauto             0041
?___lwtofl                           fnauto             0015
?___wmul                             fnauto             0041
?__div_to_l_                         fnauto             0041
?_calc_dewpoint                      fnauto             0015
?_calc_sth11                         fnauto             0015
?_eval_poly                          fnauto             0040
?_frexp                              fnauto             0040
?_fround                             fnauto             0041
?_isdigit                            fnauto             0041
?_log                                fnauto             0039
?_log10                              fnauto             0035
?_oo_crc_shuffle_byte                fnauto             0035
?_oo_print_data                      fnauto             0015
?_oo_read_device                     fnauto             0015
?_oo_tx_byte                         fnauto             0034
?_printf                             fnauto             0015
?_putch                              fnauto             0041
?_s_measure                          fnauto             0015
?_s_read_byte                        fnauto             0022
?_s_write_byte                       fnauto             0022
?_scale                              fnauto             0041
?_strcmp                             fnauto             0005
Counter8_ltrx_DisableInt             UserModules        36F0
Counter8_ltrx_EnableInt              UserModules        36EC
Counter8_ltrx_Start                  UserModules        36F4
Counter8_ltrx_Stop                   UserModules        36F8
Counter8_ltrx_WriteCompareValue      UserModules        36FF
Counter8_ltrx_WritePeriod            UserModules        36FC
Counter8_ltrx_bReadCompareValue      UserModules        3702
Counter8_ltrx_bReadCounter           UserModules        3705
F64                                  cdata              7CA4
F815                                 cdata              7C90
F816                                 cdata              7C94
F817                                 cdata              7CC8
F818                                 cdata              7C98
F819                                 cdata              7C9C
LED1_GetState                        UserModules        376A
LED1_Invert                          UserModules        3759
LED1_Off                             UserModules        373D
LED1_On                              UserModules        3739
LED1_Start                           UserModules        373D
LED1_Stop                            UserModules        373D
LED1_Switch                          UserModules        373F
LTRX_CPutString                      UserModules        38B2
LTRX_CWrite                          UserModules        3884
LTRX_CmdReset                        UserModules        38CD
LTRX_DisableInt                      UserModules        3784
LTRX_EnableInt                       UserModules        377D
LTRX_IntCntl                         UserModules        37CC
LTRX_PutCRLF                         UserModules        38C4
LTRX_PutChar                         UserModules        3811
LTRX_PutSHexByte                     UserModules        37F7
LTRX_PutSHexInt                      UserModules        380A
LTRX_PutString                       UserModules        384E
LTRX_SendData                        UserModules        37AD
LTRX_SetTxIntMode                    UserModules        378B
LTRX_Start                           UserModules        379D
LTRX_Stop                            UserModules        37A6
LTRX_TxIntMode                       UserModules        37B9
LTRX_Write                           UserModules        385E
LTRX_aRxBuffer                       LTRX_RAM           0089
LTRX_bCmdCheck                       UserModules        38E3
LTRX_bCmdLength                      UserModules        38F6
LTRX_bErrCheck                       UserModules        38EB
LTRX_bReadRxData                     UserModules        37B3
LTRX_bReadRxStatus                   UserModules        37B6
LTRX_bReadTxStatus                   UserModules        37B0
LTRX_bRxCnt                          InterruptRAM       0087
LTRX_cGetChar                        UserModules        3819
LTRX_cReadChar                       UserModules        3821
LTRX_fStatus                         InterruptRAM       0086
LTRX_iReadChar                       UserModules        3838
LTRX_szGetParam                      UserModules        38FC
LTRX_szGetRestOfParams               UserModules        3959
LoadConfigInit                       psoc_config        03B1
LoadConfigTBL_sensor_gateway_Bank0   lit                02E9
LoadConfigTBL_sensor_gateway_Bank1   lit                0362
LoadConfigTBL_sensor_gateway_Ordered lit                0200
LoadConfig_sensor_gateway            psoc_config        03BB
NO_SHADOW                            InterruptRAM       0088
OneWire_ClearCRC8                    UserModules        3A56
OneWire_FamilySkipSetup              UserModules        3CBF
OneWire_FamilyTargetSetup            UserModules        3C96
OneWire_GetROM                       UserModules        3A77
OneWire_SetROM                       UserModules        3AA1
OneWire_Start                        UserModules        39D9
OneWire_Stop                         UserModules        39EA
OneWire_WriteBit                     UserModules        3A0A
OneWire_WriteByte                    UserModules        3A27
OneWire_bCRC8                        UserModules        3A5D
OneWire_bCRC8Value                   bss                0099
OneWire_bReadBit                     UserModules        3A16
OneWire_bReadByte                    UserModules        3A42
OneWire_fFindFirst                   UserModules        3ACB
OneWire_fFindNext                    UserModules        3AE0
OneWire_fReset                       UserModules        39F1
OneWire_fVerify                      UserModules        3C02
Port_3_Data_SHADE                    InterruptRAM       0088
Ticker_DisableInt                    UserModules        3CE3
Ticker_EnableInt                     UserModules        3CDF
Ticker_ISR                           intrtext           7B88
Ticker_Start                         UserModules        3CE7
Ticker_Stop                          UserModules        3CEB
Ticker_WriteCompareValue             UserModules        3CF5
Ticker_WritePeriod                   UserModules        3CEF
Ticker_wReadCompareValue             UserModules        3CFB
Ticker_wReadCounter                  UserModules        3D01
_Counter8_ltrx_DisableInt            UserModules        36F0
_Counter8_ltrx_EnableInt             UserModules        36EC
_Counter8_ltrx_ISR                   UserModules        3738
_Counter8_ltrx_Start                 UserModules        36F4
_Counter8_ltrx_Stop                  UserModules        36F8
_Counter8_ltrx_WriteCompareValue     UserModules        36FF
_Counter8_ltrx_WritePeriod           UserModules        36FC
_Counter8_ltrx_bReadCompareValue     UserModules        3702
_Counter8_ltrx_bReadCounter          UserModules        3705
_LED1_GetState                       UserModules        376A
_LED1_Invert                         UserModules        3759
_LED1_Off                            UserModules        373D
_LED1_On                             UserModules        3739
_LED1_Start                          UserModules        373D
_LED1_Stop                           UserModules        373D
_LED1_Switch                         UserModules        373F
_LTRX_CPutString                     UserModules        38B2
_LTRX_CWrite                         UserModules        3884
_LTRX_CmdReset                       UserModules        38CD
_LTRX_DisableInt                     UserModules        3784
_LTRX_EnableInt                      UserModules        377D
_LTRX_IntCntl                        UserModules        37CC
_LTRX_PutCRLF                        UserModules        38C4
_LTRX_PutChar                        UserModules        3811
_LTRX_PutSHexByte                    UserModules        37F7
_LTRX_PutSHexInt                     UserModules        380A
_LTRX_PutString                      UserModules        384E
_LTRX_RX_ISR                         UserModules        3965
_LTRX_SendData                       UserModules        37AD
_LTRX_SetTxIntMode                   UserModules        378B
_LTRX_Start                          UserModules        379D
_LTRX_Stop                           UserModules        37A6
_LTRX_TX_ISR                         UserModules        3964
_LTRX_TxIntMode                      UserModules        37B9
_LTRX_Write                          UserModules        385E
_LTRX_aRxBuffer                      LTRX_RAM           0089
_LTRX_bCmdCheck                      UserModules        38E3
_LTRX_bCmdLength                     UserModules        38F6
_LTRX_bErrCheck                      UserModules        38EB
_LTRX_bReadRxData                    UserModules        37B3
_LTRX_bReadRxStatus                  UserModules        37B6
_LTRX_bReadTxStatus                  UserModules        37B0
_LTRX_bRxCnt                         InterruptRAM       0087
_LTRX_cGetChar                       UserModules        3819
_LTRX_cReadChar                      UserModules        3821
_LTRX_fStatus                        InterruptRAM       0086
_LTRX_iReadChar                      UserModules        3838
_LTRX_szGetParam                     UserModules        38FC
_LTRX_szGetRestOfParams              UserModules        3959
_LoadConfigInit                      psoc_config        03B1
_LoadConfig_sensor_gateway           psoc_config        03BB
_NO_SHADOW                           InterruptRAM       0088
_OneWire_ClearCRC8                   UserModules        3A56
_OneWire_FamilySkipSetup             UserModules        3CBF
_OneWire_FamilyTargetSetup           UserModules        3C96
_OneWire_GetROM                      UserModules        3A77
_OneWire_ISR                         UserModules        3CDE
_OneWire_SetROM                      UserModules        3AA1
_OneWire_Start                       UserModules        39D9
_OneWire_Stop                        UserModules        39EA
_OneWire_WriteBit                    UserModules        3A0A
_OneWire_WriteByte                   UserModules        3A27
_OneWire_bCRC8                       UserModules        3A5D
_OneWire_bCRC8Value                  bss                0099
_OneWire_bReadBit                    UserModules        3A16
_OneWire_bReadByte                   UserModules        3A42
_OneWire_fFindFirst                  UserModules        3ACB
_OneWire_fFindNext                   UserModules        3AE0
_OneWire_fReset                      UserModules        39F1
_OneWire_fVerify                     UserModules        3C02
_Port_3_Data_SHADE                   InterruptRAM       0088
_Ticker_DisableInt                   UserModules        3CE3
_Ticker_EnableInt                    UserModules        3CDF
_Ticker_ISR                          intrtext           7B88
_Ticker_Start                        UserModules        3CE7
_Ticker_Stop                         UserModules        3CEB
_Ticker_WriteCompareValue            UserModules        3CF5
_Ticker_WritePeriod                  UserModules        3CEF
_Ticker_wReadCompareValue            UserModules        3CFB
_Ticker_wReadCounter                 UserModules        3D01
__Bnvbit0                            nvbit0             0001
__Bnvbit1                            nvbit1             0200
__Bnvbit2                            nvbit2             0215
__Bnvbit3                            nvbit3             0300
__Bnvbit4                            nvbit4             0400
__Bnvbit5                            nvbit5             0500
__Bnvbit6                            nvbit6             0600
__Bnvbit7                            nvbit7             0700
__Brbit1                             rbit1              0100
__Brbit2                             rbit2              0215
__Brbit3                             rbit3              0300
__Brbit4                             rbit4              0400
__Brbit5                             rbit5              0500
__Brbit6                             rbit6              0600
__Brbit7                             rbit7              0700
__Bstackps                           stackps            0700
__HInterruptRAM                      InterruptRAM       0089
__HLTRX_RAM                          LTRX_RAM           0700
__HPD_startup                        PD_startup         7FDF
__HSSCParmBlk                        SSCParmBlk         0100
__HTOP                               TOP                0065
__HUserModules                       UserModules        3D41
__Hbss                               bss                0700
__Hbss0                              bss0               0000
__Hbss1                              bss1               0100
__Hbss2                              bss2               0215
__Hbss3                              bss3               0300
__Hbss4                              bss4               0400
__Hbss5                              bss5               0500
__Hbss6                              bss6               0600
__Hbss7                              bss7               0700
__Hcdata                             cdata              7CCC
__Hend_init                          end_init           0003
__Hfnauto                            fnauto             0086
__Hinit                              init               7C00
__Hintrtext                          intrtext           7BC9
__Hlit                               lit                0700
__Hmaintext                          maintext           7B88
__Hnvbit0                            nvbit0             0008
__Hnvbit1                            nvbit1             1000
__Hnvbit2                            nvbit2             10A8
__Hnvbit3                            nvbit3             1800
__Hnvbit4                            nvbit4             2000
__Hnvbit5                            nvbit5             2800
__Hnvbit6                            nvbit6             3000
__Hnvbit7                            nvbit7             3800
__Hnvram0                            nvram0             0001
__Hnvram1                            nvram1             0200
__Hnvram2                            nvram2             0215
__Hnvram3                            nvram3             0300
__Hnvram4                            nvram4             0400
__Hnvram5                            nvram5             0500
__Hnvram6                            nvram6             0600
__Hnvram7                            nvram7             0700
__Hpowerup                           powerup            0003
__Hpsoc_config                       psoc_config        0700
__Hramdata0                          ramdata0           0001
__Hramdata1                          ramdata1           0200
__Hramdata2                          ramdata2           0215
__Hramdata3                          ramdata3           0300
__Hramdata4                          ramdata4           0400
__Hramdata5                          ramdata5           0500
__Hramdata6                          ramdata6           0600
__Hramdata7                          ramdata7           0700
__Hrbit0                             rbit0              0001
__Hrbit1                             rbit1              0800
__Hrbit2                             rbit2              10A8
__Hrbit3                             rbit3              1800
__Hrbit4                             rbit4              2000
__Hrbit5                             rbit5              2800
__Hrbit6                             rbit6              3000
__Hrbit7                             rbit7              3800
__Hromdata0                          romdata0           0003
__Hromdata1                          romdata1           0200
__Hromdata2                          romdata2           0003
__Hromdata3                          romdata3           0003
__Hromdata4                          romdata4           0003
__Hromdata5                          romdata5           0003
__Hromdata6                          romdata6           0003
__Hromdata7                          romdata7           0003
__Hsensor_gateway_RAM                sensor_gateway_RAM 0700
__Hstackps                           stackps            0700
__Hstrings                           strings            7F55
__Htext                              text               7A27
__Hvectors                           vectors            0003
__LInterruptRAM                      InterruptRAM       0086
__LLTRX_RAM                          LTRX_RAM           0700
__LPD_startup                        PD_startup         7F55
__LSSCParmBlk                        SSCParmBlk         0000
__LTOP                               TOP                0000
__LUserModules                       UserModules        36EC
__Lbss                               bss                0700
__Lbss0                              bss0               0000
__Lbss1                              bss1               0100
__Lbss2                              bss2               0200
__Lbss3                              bss3               0300
__Lbss4                              bss4               0400
__Lbss5                              bss5               0500
__Lbss6                              bss6               0600
__Lbss7                              bss7               0700
__Lcdata                             cdata              7C00
__Lend_init                          end_init           0003
__Lfnauto                            fnauto             0001
__Linit                              init               7BC9
__Lintrtext                          intrtext           7B88
__Llit                               lit                0700
__Lmaintext                          maintext           7A27
__Lnvbit0                            nvbit0             0008
__Lnvbit1                            nvbit1             1000
__Lnvbit2                            nvbit2             10A8
__Lnvbit3                            nvbit3             1800
__Lnvbit4                            nvbit4             2000
__Lnvbit5                            nvbit5             2800
__Lnvbit6                            nvbit6             3000
__Lnvbit7                            nvbit7             3800
__Lnvram0                            nvram0             0001
__Lnvram1                            nvram1             0200
__Lnvram2                            nvram2             0215
__Lnvram3                            nvram3             0300
__Lnvram4                            nvram4             0400
__Lnvram5                            nvram5             0500
__Lnvram6                            nvram6             0600
__Lnvram7                            nvram7             0700
__Lpowerup                           powerup            0003
__Lpsoc_config                       psoc_config        0700
__Lramdata0                          ramdata0           0001
__Lramdata1                          ramdata1           0100
__Lramdata2                          ramdata2           0215
__Lramdata3                          ramdata3           0300
__Lramdata4                          ramdata4           0400
__Lramdata5                          ramdata5           0500
__Lramdata6                          ramdata6           0600
__Lramdata7                          ramdata7           0700
__Lrbit0                             rbit0              0000
__Lrbit1                             rbit1              0800
__Lrbit2                             rbit2              10A8
__Lrbit3                             rbit3              1800
__Lrbit4                             rbit4              2000
__Lrbit5                             rbit5              2800
__Lrbit6                             rbit6              3000
__Lrbit7                             rbit7              3800
__Lromdata0                          romdata0           0003
__Lromdata1                          romdata1           0100
__Lromdata2                          romdata2           0003
__Lromdata3                          romdata3           0003
__Lromdata4                          romdata4           0003
__Lromdata5                          romdata5           0003
__Lromdata6                          romdata6           0003
__Lromdata7                          romdata7           0003
__Lsensor_gateway_RAM                sensor_gateway_RAM 0700
__Lstackps                           stackps            0700
__Lstrings                           strings            7D00
__Ltext                              text               3D41
__Lvectors                           vectors            0000
__S0                                 (abs)              7FDF
__S1                                 (abs)              00A6
__Start                              PD_startup         7F55
___awdiv                             text               6D2D
___awdiv@counter                     fnauto             0065
___awdiv@dividend                    fnauto             005E
___awdiv@divisor                     fnauto             0060
___awdiv@quotient                    fnauto             0062
___awdiv@sign                        fnauto             0064
___awmod                             text               6A28
___awmod@counter                     fnauto             0063
___awmod@dividend                    fnauto             005E
___awmod@divisor                     fnauto             0060
___awmod@sign                        fnauto             0062
___awtofl                            text               6E94
___awtofl@c                          fnauto             0040
___awtofl@f1                         fnauto             0044
___end_of_c_program_code             text               7A27
___fladd                             text               7416
___fladd@cntr                        fnauto             0058
___fladd@exp1                        fnauto             0055
___fladd@exp2                        fnauto             0056
___fladd@f1                          fnauto             004D
___fladd@f2                          fnauto             0051
___fladd@sign1                       fnauto             0057
___fladd@sign2                       fnauto             0059
___fldiv                             text               5A6E
___fldiv@exp1                        fnauto             0042
___fldiv@exp2                        fnauto             0044
___fldiv@f1                          fnauto             0035
___fldiv@f2                          fnauto             0039
___fldiv@f3                          fnauto             003D
___fldiv@sign1                       fnauto             0043
___fldiv@sign2                       fnauto             0041
___flge                              text               6F80
___flge@ff1                          fnauto             0041
___flge@ff2                          fnauto             0045
___flmul                             text               7201
___flmul@cntr                        fnauto             006A
___flmul@exp1                        fnauto             006B
___flmul@f1                          fnauto             005E
___flmul@f2                          fnauto             0062
___flmul@f3                          fnauto             0066
___flmul@sign1                       fnauto             006C
___flneg                             text               76DC
___flneg@f1                          fnauto             004C
___flpack                            text               77F8
___flpack@arg                        fnauto             0071
___flpack@exp                        fnauto             0073
___flsub                             text               5D18
___flsub@f1                          fnauto             0041
___flsub@f2                          fnauto             0045
___fltol                             text               6831
___fltol@exp1                        fnauto             0049
___fltol@f1                          fnauto             0041
___fltol@lval                        fnauto             0045
___fltol@sign1                       fnauto             004A
___flunpack                          text               7714
___flunpack@arg                      fnauto             0071
___flunpack@exp                      fnauto             0073
___flunpack@sign                     fnauto             0075
___lldiv                             text               5BEE
___lldiv@counter                     fnauto             004D
___lldiv@dividend                    fnauto             0041
___lldiv@divisor                     fnauto             0045
___lldiv@quotient                    fnauto             0049
___llmod                             text               5DF1
___llmod@counter                     fnauto             0049
___llmod@dividend                    fnauto             0041
___llmod@divisor                     fnauto             0045
___lltofl                            text               5ED1
___lltofl@c                          fnauto             0041
___lltofl@exp                        fnauto             0049
___lltofl@f1                         fnauto             0045
___lwtofl                            text               4949
___lwtofl@c                          fnauto             0015
___lwtofl@f1                         fnauto             0019
___start_of_c_program_code           text               3D41
___wmul                              text               5D72
___wmul@multiplicand                 fnauto             0043
___wmul@multiplier                   fnauto             0041
___wmul@product                      fnauto             0045
__div_to_l_                          text               6647
__div_to_l_@cntr                     fnauto             004E
__div_to_l_@exp1                     fnauto             004D
__div_to_l_@f1                       fnauto             0041
__div_to_l_@f2                       fnauto             0045
__div_to_l_@quot                     fnauto             0049
__end_of_Ticker_ISR                  intrtext           7BC9
__end_of___awdiv                     text               6E6C
__end_of___awmod                     text               6B3C
__end_of___awtofl                    text               6F80
__end_of___fladd                     text               76DC
__end_of___fldiv                     text               5BEE
__end_of___flge                      text               7078
__end_of___flmul                     text               7416
__end_of___flneg                     text               7714
__end_of___flpack                    text               7A27
__end_of___flsub                     text               5D72
__end_of___fltol                     text               696A
__end_of___flunpack                  text               77F8
__end_of___lldiv                     text               5D18
__end_of___llmod                     text               5ED1
__end_of___lltofl                    text               5F50
__end_of___lwtofl                    text               49C2
__end_of___wmul                      text               5DF1
__end_of__div_to_l_                  text               6831
__end_of_calc_dewpoint               text               484B
__end_of_calc_sth11                  text               4637
__end_of_delay_10ms                  text               69CA
__end_of_delay_5us                   text               6E86
__end_of_eval_poly                   text               715A
__end_of_frexp                       text               7201
__end_of_fround                      text               61EB
__end_of_hardware_init               text               404A
__end_of_isdigit                     text               698D
__end_of_log                         text               6D2D
__end_of_log10                       text               58B3
__end_of_main                        maintext           7B88
__end_of_oo_busreset                 text               5840
__end_of_oo_conversion_busy          text               69E0
__end_of_oo_crc_init                 text               6E94
__end_of_oo_crc_shuffle_byte         text               717D
__end_of_oo_print_data               text               42D1
__end_of_oo_read_device              text               41D8
__end_of_oo_read_scratchpad          text               5831
__end_of_oo_report                   text               3E52
__end_of_oo_rx_byte                  text               6A28
__end_of_oo_start_conversion         text               41FA
__end_of_oo_tx_byte                  text               69F4
__end_of_oo_wait_for_completion      text               4232
__end_of_orcon_Start                 text               4B67
__end_of_orcon_delay                 text               4949
__end_of_orcon_delay_5us             text               5A6E
__end_of_orcon_high                  text               4086
__end_of_orcon_low                   text               40FE
__end_of_orcon_med                   text               40C2
__end_of_print_header                text               57CF
__end_of_print_help                  text               3FF1
__end_of_printf                      text               577E
__end_of_putch                       text               5854
__end_of_s_Start                     text               57DA
__end_of_s_connectionreset           text               4A2B
__end_of_s_do_measure                text               3FC5
__end_of_s_measure                   text               4B5C
__end_of_s_read_byte                 text               5A54
__end_of_s_transstart                text               5912
__end_of_s_write_byte                text               59AC
__end_of_scale                       text               6647
__end_of_strcmp                      text               3D95
__flash_banks                        cdata              7CA2
__flash_blocksize                    cdata              7CA3
__flash_size                         cdata              7CA0
__npowers_                           cdata              7C00
__powers_                            cdata              7C34
__stack_start__                      stackps            0700
_bCounter8_ltrx_ReadCompareValue     UserModules        3702
_bCounter8_ltrx_ReadCounter          UserModules        3705
_bGetPowerSetting                    PD_startup         7FDC
_bLTRX_ReadRxData                    UserModules        37B3
_bLTRX_ReadRxStatus                  UserModules        37B6
_bLTRX_ReadTxStatus                  UserModules        37B0
_calc_dewpoint                       text               4637
_calc_dewpoint$3267                  fnauto             0031
_calc_dewpoint$3268                  fnauto             002D
_calc_dewpoint$3273                  fnauto             0029
_calc_dewpoint$3274                  fnauto             0025
_calc_sth11                          text               42D1
_calc_sth11$3252                     fnauto             0031
_calc_sth11$3253                     fnauto             0035
_calc_sth11$3259                     fnauto             002D
_conflict                            bss2               0213
_crc                                 bss2               0214
_crc_rom                             ramdata1           0100
_delay_10ms                          text               698D
_delay_5us                           text               6E6C
_dpowers                             cdata              7C68
_errno                               bss2               0211
_eval_poly                           text               7078
_frexp                               text               717D
_fround                              text               5F50
_fround$3284                         fnauto             004D
_fround$3285                         fnauto             004B
_fround$3286                         fnauto             004F
_fround$3287                         fnauto             0047
_fround$3292                         fnauto             0045
_hardware_init                       text               3FF1
_id                                  bss2               0209
_isdigit                             text               696A
_log                                 text               6B3C
_log10                               text               5854
_main                                maintext           7A27
_new_conflict                        rbit0              0000
_oo_busreset                         text               5831
_oo_conversion_busy                  text               69CA
_oo_crc_init                         text               6E86
_oo_crc_shuffle_byte                 text               715A
_oo_print_data                       text               4232
_oo_read_device                      text               40FE
_oo_read_scratchpad                  text               57DA
_oo_report                           text               3D95
_oo_rx_byte                          text               69F4
_oo_scratchpad                       bss2               0200
_oo_start_conversion                 text               41D8
_oo_tx_byte                          text               69E0
_oo_wait_for_completion              text               41FA
_orcon_Start                         text               4B5C
_orcon_delay                         text               484B
_orcon_delay_5us                     text               5A54
_orcon_high                          text               404A
_orcon_low                           text               40C2
_orcon_med                           text               4086
_print_header                        text               577E
_print_help                          text               3FC5
_printf                              text               4B67
_putch                               text               5840
_s_Start                             text               57CF
_s_connectionreset                   text               49C2
_s_do_measure                        text               3E52
_s_measure                           text               4A2B
_s_read_byte                         text               59AC
_s_transstart                        text               58B3
_s_write_byte                        text               5912
_scale                               text               61EB
_scale$3300                          fnauto             005B
_scale$3301                          fnauto             0059
_scale$3302                          fnauto             0057
_scale$3303                          fnauto             0053
_scale$3307                          fnauto             0051
_scale$3314                          fnauto             004F
_scale$3315                          fnauto             004D
_scale$3316                          fnauto             004B
_scale$3317                          fnauto             0047
_scale$3321                          fnauto             0045
_strcmp                              text               3D41
_wTicker_ReadCompareValue            UserModules        3CFB
_wTicker_ReadCounter                 UserModules        3D01
bCounter8_ltrx_ReadCompareValue      UserModules        3702
bCounter8_ltrx_ReadCounter           UserModules        3705
bGetPowerSetting                     PD_startup         7FDC
bLTRX_ReadRxData                     UserModules        37B3
bLTRX_ReadRxStatus                   UserModules        37B6
bLTRX_ReadTxStatus                   UserModules        37B0
calc_dewpoint@dew_point              fnauto             0021
calc_dewpoint@h                      fnauto             0015
calc_dewpoint@logEx                  fnauto             001D
calc_dewpoint@t                      fnauto             0019
calc_sth11@p_humidity                fnauto             0015
calc_sth11@p_temperature             fnauto             0017
calc_sth11@rh                        fnauto             001D
calc_sth11@rh_lin                    fnauto             0025
calc_sth11@rh_true                   fnauto             0019
calc_sth11@t                         fnauto             0029
calc_sth11@t_C                       fnauto             0021
delay_10ms@counter                   fnauto             0016
eval_poly@d                          fnauto             0044
eval_poly@n                          fnauto             0046
eval_poly@res                        fnauto             0048
eval_poly@x                          fnauto             0040
frexp@eptr                           fnauto             0044
frexp@value                          fnauto             0040
fround@prec                          fnauto             0041
intlevel0                            bss                00A6
intlevel1                            bss                00A6
intlevel2                            bss                00A6
isdigit@c                            fnauto             0041
log10@x                              fnauto             0035
log@exp                              fnauto             003D
log@x                                fnauto             0039
main@UART_bfr                        fnauto             0001
oo_crc_shuffle_byte@input            fnauto             0035
oo_print_data@cntr                   fnauto             0022
oo_print_data@data                   fnauto             0015
oo_read_device@crc                   fnauto             002F
oo_read_device@data                  fnauto             0022
oo_read_scratchpad@counter           fnauto             0033
oo_report@data                       fnauto             0005
oo_rx_byte@data                      fnauto             0034
oo_tx_byte@data                      fnauto             0034
oo_wait_for_completion@counter       fnauto             0015
orcon_delay@i                        fnauto             0005
printf@_val                          fnauto             0027
printf@ap                            fnauto             0037
printf@c                             fnauto             0039
printf@exp                           fnauto             0031
printf@f                             fnauto             0015
printf@flag                          fnauto             0035
printf@fval                          fnauto             0023
printf@integ                         fnauto             002B
printf@prec                          fnauto             002F
printf@width                         fnauto             0033
putch@c                              fnauto             0041
reset_vec                            vectors            0000
s_connectionreset@i                  fnauto             0015
s_do_measure@checksum                fnauto             0012
s_do_measure@dew_point               fnauto             000D
s_do_measure@error                   fnauto             0011
s_do_measure@humi_val                fnauto             0009
s_do_measure@temp_val                fnauto             0005
s_measure@error                      fnauto             001A
s_measure@i                          fnauto             001C
s_measure@mode                       fnauto             0019
s_measure@p_checksum                 fnauto             0017
s_measure@p_value                    fnauto             0015
s_read_byte@ack                      fnauto             0022
s_read_byte@i                        fnauto             0023
s_read_byte@val                      fnauto             0024
s_write_byte@error                   fnauto             0024
s_write_byte@i                       fnauto             0023
s_write_byte@value                   fnauto             0022
scale@scl                            fnauto             0041
start                                vectors            0000
startup                              init               7BC9
strcmp@r                             fnauto             0009
strcmp@s1                            fnauto             0005
strcmp@s2                            fnauto             0007
wTicker_ReadCompareValue             UserModules        3CFB
wTicker_ReadCounter                  UserModules        3D01
