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

*_main size 0,3 offset 0
     _hardware_init size 0,0 offset 3
         _Counter8_ltrx_Start size 0,0 offset 3
         _LED1_Start size 0,0 offset 3
         _Ticker_Start size 0,0 offset 3
         _OneWire_Start size 0,0 offset 3
         _s_Start size 0,0 offset 3
         _LTRX_CmdReset size 0,0 offset 3
         _LTRX_EnableInt size 0,0 offset 3
         _LTRX_Start size 0,0 offset 3
         _Ticker_EnableInt size 0,0 offset 3
     _print_help size 0,0 offset 3
         _print_header size 0,0 offset 3
             _LTRX_PutCRLF size 0,0 offset 33
             _LTRX_CPutString size 0,0 offset 33
         _LTRX_CPutString size 0,0 offset 33
         _LTRX_PutCRLF size 0,0 offset 33
     _LTRX_bCmdCheck size 0,0 offset 3
     _LTRX_szGetParam size 0,0 offset 3
*    _printf size 14,30 offset 19
         _putch size 1,0 offset 63
             _LTRX_PutChar size 0,0 offset 64
         _isdigit size 1,0 offset 63
         ___wmul size 4,4 offset 63
         ___flge size 8,4 offset 63
         ___flneg size 4,0 offset 74
         ___awdiv size 4,6 offset 92
*        _scale size 4,25 offset 63
             ___awdiv size 4,6 offset 92
             ___awmod size 4,4 offset 92
*            ___flmul size 8,11 offset 92
*                ___flunpack size 4,7 offset 111
                 ___flpack size 3,6 offset 111
*        ___flmul size 8,11 offset 92
         _fround size 4,13 offset 63
             ___awdiv size 4,6 offset 92
             ___awmod size 4,4 offset 92
             ___flmul size 8,11 offset 92
         ___fladd size 8,9 offset 75
             ___flunpack size 4,7 offset 111
             ___flpack size 3,6 offset 111
         ___fltol size 4,6 offset 63
             ___flunpack size 4,7 offset 111
         __div_to_l_ size 8,7 offset 63
             ___flunpack size 4,7 offset 111
         ___lltofl size 4,5 offset 63
             ___flpack size 3,6 offset 111
         ___flsub size 8,0 offset 63
             ___fladd size 8,9 offset 75
         ___lldiv size 8,9 offset 63
         ___llmod size 8,5 offset 63
     _oo_report size 0,16 offset 3
         _OneWire_fReset size 0,0 offset 49
         _LTRX_CPutString size 0,0 offset 33
         _LTRX_PutCRLF size 0,0 offset 33
         _oo_start_conversion size 0,0 offset 19
             _oo_tx_byte size 1,0 offset 50
                 _OneWire_WriteByte size 0,0 offset 51
         _oo_wait_for_completion size 0,1 offset 19
             _delay_10ms size 0,2 offset 20
             _oo_conversion_busy size 0,0 offset 20
                 _oo_rx_byte size 0,1 offset 50
                     _OneWire_bReadByte size 0,0 offset 51
                     _oo_crc_shuffle_byte size 1,1 offset 51
         _OneWire_fFindFirst size 0,0 offset 19
         _oo_read_device size 13,17 offset 19
             _OneWire_GetROM size 0,0 offset 49
             _oo_busreset size 0,0 offset 49
                 _OneWire_fReset size 0,0 offset 49
             _OneWire_SetROM size 0,0 offset 49
             _OneWire_fVerify size 0,0 offset 49
             _oo_read_scratchpad size 0,1 offset 49
                 _oo_tx_byte size 1,0 offset 50
                 _oo_crc_init size 0,0 offset 50
                 _oo_rx_byte size 0,1 offset 50
         _oo_print_data size 13,1 offset 19
             _LTRX_CPutString size 0,0 offset 33
             _LTRX_PutSHexByte size 0,0 offset 33
             _LTRX_PutChar size 0,0 offset 64
             _LTRX_PutCRLF size 0,0 offset 33
         _OneWire_fFindNext size 0,0 offset 19
*    _s_do_measure size 0,16 offset 3
         _s_connectionreset size 0,1 offset 19
             _delay_1us size 0,0 offset 32
             _s_transstart size 0,0 offset 32
                 _delay_1us size 0,0 offset 32
                 _delay_5us size 0,0 offset 35
         _s_measure size 5,8 offset 19
             _s_transstart size 0,0 offset 32
             _s_write_byte size 1,2 offset 32
                 _delay_5us size 0,0 offset 35
             _delay_5us size 0,0 offset 35
             _s_read_byte size 1,2 offset 32
                 _delay_5us size 0,0 offset 35
         _LTRX_CPutString size 0,0 offset 33
         _LTRX_PutSHexByte size 0,0 offset 33
         ___lwtofl size 4,8 offset 19
             ___flpack size 3,6 offset 111
         _calc_sth11 size 4,33 offset 19
             ___flmul size 8,11 offset 92
             ___fladd size 8,9 offset 75
             ___flge size 8,4 offset 63
         _calc_dewpoint size 8,24 offset 19
             ___flmul size 8,11 offset 92
             _log10 size 4,0 offset 51
                 _log size 4,3 offset 55
                     ___flge size 8,4 offset 63
                     _frexp size 6,3 offset 62
                     ___flmul size 8,11 offset 92
                     ___fladd size 8,9 offset 75
                     _eval_poly size 8,5 offset 62
                         ___flmul size 8,11 offset 92
                         ___fladd size 8,9 offset 75
                     ___awtofl size 4,8 offset 62
                         ___flpack size 3,6 offset 111
                         ___flneg size 4,0 offset 74
                 ___flmul size 8,11 offset 92
             ___fladd size 8,9 offset 75
             ___fldiv size 8,9 offset 51
                 ___flunpack size 4,7 offset 111
                 ___flpack size 3,6 offset 111
             ___flsub size 8,0 offset 63
*        _printf size 14,30 offset 19
     _LTRX_CmdReset size 0,0 offset 3

Estimated maximum call depth: 6

*intlevel1 size 0,0 offset 122
*    _Ticker_ISR size 0,10 offset 122
*        _LED1_Invert size 0,0 offset 132

Estimated maximum call depth: 2


                Name          Link     Load   Length Selector Space Scale
output\startup.obj
                init          7CC9     7CC9       37    7CC9     0
                vectors          0        0        3       0     0
                SSCParmBl       F8       F8        8       0     1
                TOP              4        4       61       0     0
output\sensor_gateway.obj
                intrtext      7C88     7C88       41    7C88     0
                strings       7E00     7E00      15A      7E     0
                cdata         7D00     7D00       CC      7D     0
                text          413B     413B     3AA5    413B     0
                maintext      7BE0     7BE0       A8    7BE0     0
                ramdata1       100      100      100     100     1
                romdata1       100      100      100     100     0
                bss2           200      200       15     200     1
                rbit0            0        0        1       0     1    8
./obj/boot.obj  PD_startu     7F5A     7F5A       8A    7F5A     0
                TOP              4        4       61       0     0

lib/libpsoc.lib
lib/obj/counter8_ltrx.obj
                UserModul     3AE6     3AE6       4C    3AE6     0
lib/obj/counter8_ltrxint.obj
                UserModul     3B32     3B32        1    3AE6     0
lib/obj/led1.obj
                UserModul     3B33     3B33       44    3AE6     0
lib/obj/ltrx.obj
                UserModul     3B77     3B77      1E7    3AE6     0
                LTRX_RAM        A4       A4        1       0     1
lib/obj/ltrxint.obj
                Interrupt       85       85        2       0     1
                UserModul     3D5E     3D5E       75    3AE6     0
                LTRX_RAM        88       88       10       0     1
lib/obj/onewire.obj
                UserModul     3DD3     3DD3      305    3AE6     0
                bss             98       98        C       0     1
lib/obj/onewireint.obj
                UserModul     40D8     40D8        1    3AE6     0
lib/obj/psocconfig.obj
                Interrupt       87       87        1       0     1
                psoc_conf      3B1      3B1       67     200     0
lib/obj/psocconfigtbl.obj
                lit            200      200      1B1     200     0
lib/obj/ticker.obj
                UserModul     40D9     40D9       62    3AE6     0

C:/PROGRA~1/Cypress/Common/CYPRES~2/tools/lib/CY8C29000/cms.lib

COMMON          fnauto           1        1       84       0     1

TOTAL           Name          Link     Load   Length  Space
        CLASS   CODE           
                intrtext      7C88     7C88       41     0
                PD_startu     7F5A     7F5A       8A     0
                init          7CC9     7CC9       37     0
                text          413B     413B     3AA5     0
                vectors          0        0        3     0
                maintext      7BE0     7BE0       A8     0

        CLASS   BANKROM        
                romdata1       100      100      100     0

        CLASS   ROM            
                UserModul     3AE6     3AE6      655     0
                strings       7E00     7E00      15A     0
                cdata         7D00     7D00       CC     0
                TOP              4        4       61     0
                psoc_conf      3B1      3B1       67     0
                lit            200      200      1B1     0

        CLASS   RAM            
                Interrupt       85       85        3     1
                fnauto           1        1       84     1
                SSCParmBl       F8       F8        8     1
                ramdata1       100      100      100     1
                bss2           200      200       15     1
                rbit0            0        0        1     1
                LTRX_RAM        A4       A4        1     1
                LTRX_RAM        88       88       10     1
                bss             98       98        C     1



SEGMENTS        Name           Load    Length   Top     Selector    Space Class

                bss0            000000  0000A5  0000A5         0       1  RAM     
                vectors         000000  000003  000003         0       0  CODE    
                bss1            000100  000100  000200       100       1  RAM     
                romdata1        000100  000100  000200       100       0  BANKROM 
                bss2            000200  000015  000215       200       1  RAM     
                lit             000200  000218  000418       200       0  ROM     
                UserModules     003AE6  000655  00413B      3AE6       0  CODE    
                text            00413B  003AA5  007BE0      413B       0  CODE    
                maintext        007BE0  0000A8  007C88      7BE0       0  CODE    
                intrtext        007C88  000041  007CC9      7C88       0  CODE    
                init            007CC9  000037  007D00      7CC9       0  CODE    
                cdata           007D00  0000CC  007DCC        7D       0  ROM     
                strings         007E00  00015A  007F5A        7E       0  ROM     
                PD_startup      007F5A  00008A  007FE4      7F5A       0  CODE    


UNUSED ADDRESS RANGES

        BANKROM          0003-0003
                         0065-00FF
                         0418-3AE5
                         7DCC-7DFF
                         7FE4-7FFF
        CODE             0003-0003
                         0065-00FF
                         0418-3AE5
                         7DCC-7DFF
                         7FE4-7FFF
        RAM              00A5-00F7
                         0215-07FF
        ROM              0003-0003
                         0065-00FF
                         0418-3AE5
                         7DCC-7DFF
                         7FE4-7FFF

                                  Symbol Table

??___awdiv                           fnauto             0061
??___awmod                           fnauto             0061
??___awtofl                          fnauto             0043
??___fladd                           fnauto             0054
??___fldiv                           fnauto             003C
??___flge                            fnauto             0048
??___flmul                           fnauto             0065
??___flpack                          fnauto             0073
??___fltol                           fnauto             0044
??___flunpack                        fnauto             0074
??___lldiv                           fnauto             0048
??___llmod                           fnauto             0048
??___lltofl                          fnauto             0044
??___lwtofl                          fnauto             0018
??___wmul                            fnauto             0044
??__div_to_l_                        fnauto             0048
??_calc_dewpoint                     fnauto             001C
??_calc_sth11                        fnauto             0018
??_delay_10ms                        fnauto             0015
??_eval_poly                         fnauto             0047
??_frexp                             fnauto             0045
??_fround                            fnauto             0044
??_log                               fnauto             003C
??_main                              fnauto             0001
??_oo_crc_shuffle_byte               fnauto             0035
??_oo_print_data                     fnauto             0021
??_oo_read_device                    fnauto             0021
??_oo_read_scratchpad                fnauto             0032
??_oo_report                         fnauto             0004
??_oo_rx_byte                        fnauto             0033
??_oo_wait_for_completion            fnauto             0014
??_printf                            fnauto             0022
??_s_connectionreset                 fnauto             0014
??_s_do_measure                      fnauto             0004
??_s_measure                         fnauto             0019
??_s_read_byte                       fnauto             0022
??_s_write_byte                      fnauto             0022
??_scale                             fnauto             0044
?___awdiv                            fnauto             005D
?___awmod                            fnauto             005D
?___awtofl                           fnauto             003F
?___fladd                            fnauto             004C
?___fldiv                            fnauto             0034
?___flge                             fnauto             0040
?___flmul                            fnauto             005D
?___flneg                            fnauto             004B
?___flpack                           fnauto             0070
?___flsub                            fnauto             0040
?___fltol                            fnauto             0040
?___flunpack                         fnauto             0070
?___lldiv                            fnauto             0040
?___llmod                            fnauto             0040
?___lltofl                           fnauto             0040
?___lwtofl                           fnauto             0014
?___wmul                             fnauto             0040
?__div_to_l_                         fnauto             0040
?_calc_dewpoint                      fnauto             0014
?_calc_sth11                         fnauto             0014
?_eval_poly                          fnauto             003F
?_frexp                              fnauto             003F
?_fround                             fnauto             0040
?_isdigit                            fnauto             0040
?_log                                fnauto             0038
?_log10                              fnauto             0034
?_oo_crc_shuffle_byte                fnauto             0034
?_oo_print_data                      fnauto             0014
?_oo_read_device                     fnauto             0014
?_oo_tx_byte                         fnauto             0033
?_printf                             fnauto             0014
?_putch                              fnauto             0040
?_s_measure                          fnauto             0014
?_s_read_byte                        fnauto             0021
?_s_write_byte                       fnauto             0021
?_scale                              fnauto             0040
Counter8_ltrx_DisableInt             UserModules        3AEA
Counter8_ltrx_EnableInt              UserModules        3AE6
Counter8_ltrx_Start                  UserModules        3AEE
Counter8_ltrx_Stop                   UserModules        3AF2
Counter8_ltrx_WriteCompareValue      UserModules        3AF9
Counter8_ltrx_WritePeriod            UserModules        3AF6
Counter8_ltrx_bReadCompareValue      UserModules        3AFC
Counter8_ltrx_bReadCounter           UserModules        3AFF
F64                                  cdata              7DA4
F815                                 cdata              7D90
F816                                 cdata              7D94
F817                                 cdata              7DC8
F818                                 cdata              7D98
F819                                 cdata              7D9C
LED1_GetState                        UserModules        3B64
LED1_Invert                          UserModules        3B53
LED1_Off                             UserModules        3B37
LED1_On                              UserModules        3B33
LED1_Start                           UserModules        3B37
LED1_Stop                            UserModules        3B37
LED1_Switch                          UserModules        3B39
LTRX_CPutString                      UserModules        3CAC
LTRX_CWrite                          UserModules        3C7E
LTRX_CmdReset                        UserModules        3CC7
LTRX_DisableInt                      UserModules        3B7E
LTRX_EnableInt                       UserModules        3B77
LTRX_IntCntl                         UserModules        3BC6
LTRX_PutCRLF                         UserModules        3CBE
LTRX_PutChar                         UserModules        3C0B
LTRX_PutSHexByte                     UserModules        3BF1
LTRX_PutSHexInt                      UserModules        3C04
LTRX_PutString                       UserModules        3C48
LTRX_SendData                        UserModules        3BA7
LTRX_SetTxIntMode                    UserModules        3B85
LTRX_Start                           UserModules        3B97
LTRX_Stop                            UserModules        3BA0
LTRX_TxIntMode                       UserModules        3BB3
LTRX_Write                           UserModules        3C58
LTRX_aRxBuffer                       LTRX_RAM           0088
LTRX_bCmdCheck                       UserModules        3CDD
LTRX_bCmdLength                      UserModules        3CF0
LTRX_bErrCheck                       UserModules        3CE5
LTRX_bReadRxData                     UserModules        3BAD
LTRX_bReadRxStatus                   UserModules        3BB0
LTRX_bReadTxStatus                   UserModules        3BAA
LTRX_bRxCnt                          InterruptRAM       0086
LTRX_cGetChar                        UserModules        3C13
LTRX_cReadChar                       UserModules        3C1B
LTRX_fStatus                         InterruptRAM       0085
LTRX_iReadChar                       UserModules        3C32
LTRX_szGetParam                      UserModules        3CF6
LTRX_szGetRestOfParams               UserModules        3D53
LoadConfigInit                       psoc_config        03B1
LoadConfigTBL_sensor_gateway_Bank0   lit                02E9
LoadConfigTBL_sensor_gateway_Bank1   lit                0362
LoadConfigTBL_sensor_gateway_Ordered lit                0200
LoadConfig_sensor_gateway            psoc_config        03BB
NO_SHADOW                            InterruptRAM       0087
OneWire_ClearCRC8                    UserModules        3E50
OneWire_FamilySkipSetup              UserModules        40B9
OneWire_FamilyTargetSetup            UserModules        4090
OneWire_GetROM                       UserModules        3E71
OneWire_SetROM                       UserModules        3E9B
OneWire_Start                        UserModules        3DD3
OneWire_Stop                         UserModules        3DE4
OneWire_WriteBit                     UserModules        3E04
OneWire_WriteByte                    UserModules        3E21
OneWire_bCRC8                        UserModules        3E57
OneWire_bCRC8Value                   bss                0098
OneWire_bReadBit                     UserModules        3E10
OneWire_bReadByte                    UserModules        3E3C
OneWire_fFindFirst                   UserModules        3EC5
OneWire_fFindNext                    UserModules        3EDA
OneWire_fReset                       UserModules        3DEB
OneWire_fVerify                      UserModules        3FFC
Port_3_Data_SHADE                    InterruptRAM       0087
Ticker_DisableInt                    UserModules        40DD
Ticker_EnableInt                     UserModules        40D9
Ticker_ISR                           intrtext           7C88
Ticker_Start                         UserModules        40E1
Ticker_Stop                          UserModules        40E5
Ticker_WriteCompareValue             UserModules        40EF
Ticker_WritePeriod                   UserModules        40E9
Ticker_wReadCompareValue             UserModules        40F5
Ticker_wReadCounter                  UserModules        40FB
_Counter8_ltrx_DisableInt            UserModules        3AEA
_Counter8_ltrx_EnableInt             UserModules        3AE6
_Counter8_ltrx_ISR                   UserModules        3B32
_Counter8_ltrx_Start                 UserModules        3AEE
_Counter8_ltrx_Stop                  UserModules        3AF2
_Counter8_ltrx_WriteCompareValue     UserModules        3AF9
_Counter8_ltrx_WritePeriod           UserModules        3AF6
_Counter8_ltrx_bReadCompareValue     UserModules        3AFC
_Counter8_ltrx_bReadCounter          UserModules        3AFF
_LED1_GetState                       UserModules        3B64
_LED1_Invert                         UserModules        3B53
_LED1_Off                            UserModules        3B37
_LED1_On                             UserModules        3B33
_LED1_Start                          UserModules        3B37
_LED1_Stop                           UserModules        3B37
_LED1_Switch                         UserModules        3B39
_LTRX_CPutString                     UserModules        3CAC
_LTRX_CWrite                         UserModules        3C7E
_LTRX_CmdReset                       UserModules        3CC7
_LTRX_DisableInt                     UserModules        3B7E
_LTRX_EnableInt                      UserModules        3B77
_LTRX_IntCntl                        UserModules        3BC6
_LTRX_PutCRLF                        UserModules        3CBE
_LTRX_PutChar                        UserModules        3C0B
_LTRX_PutSHexByte                    UserModules        3BF1
_LTRX_PutSHexInt                     UserModules        3C04
_LTRX_PutString                      UserModules        3C48
_LTRX_RX_ISR                         UserModules        3D5F
_LTRX_SendData                       UserModules        3BA7
_LTRX_SetTxIntMode                   UserModules        3B85
_LTRX_Start                          UserModules        3B97
_LTRX_Stop                           UserModules        3BA0
_LTRX_TX_ISR                         UserModules        3D5E
_LTRX_TxIntMode                      UserModules        3BB3
_LTRX_Write                          UserModules        3C58
_LTRX_aRxBuffer                      LTRX_RAM           0088
_LTRX_bCmdCheck                      UserModules        3CDD
_LTRX_bCmdLength                     UserModules        3CF0
_LTRX_bErrCheck                      UserModules        3CE5
_LTRX_bReadRxData                    UserModules        3BAD
_LTRX_bReadRxStatus                  UserModules        3BB0
_LTRX_bReadTxStatus                  UserModules        3BAA
_LTRX_bRxCnt                         InterruptRAM       0086
_LTRX_cGetChar                       UserModules        3C13
_LTRX_cReadChar                      UserModules        3C1B
_LTRX_fStatus                        InterruptRAM       0085
_LTRX_iReadChar                      UserModules        3C32
_LTRX_szGetParam                     UserModules        3CF6
_LTRX_szGetRestOfParams              UserModules        3D53
_LoadConfigInit                      psoc_config        03B1
_LoadConfig_sensor_gateway           psoc_config        03BB
_NO_SHADOW                           InterruptRAM       0087
_OneWire_ClearCRC8                   UserModules        3E50
_OneWire_FamilySkipSetup             UserModules        40B9
_OneWire_FamilyTargetSetup           UserModules        4090
_OneWire_GetROM                      UserModules        3E71
_OneWire_ISR                         UserModules        40D8
_OneWire_SetROM                      UserModules        3E9B
_OneWire_Start                       UserModules        3DD3
_OneWire_Stop                        UserModules        3DE4
_OneWire_WriteBit                    UserModules        3E04
_OneWire_WriteByte                   UserModules        3E21
_OneWire_bCRC8                       UserModules        3E57
_OneWire_bCRC8Value                  bss                0098
_OneWire_bReadBit                    UserModules        3E10
_OneWire_bReadByte                   UserModules        3E3C
_OneWire_fFindFirst                  UserModules        3EC5
_OneWire_fFindNext                   UserModules        3EDA
_OneWire_fReset                      UserModules        3DEB
_OneWire_fVerify                     UserModules        3FFC
_Port_3_Data_SHADE                   InterruptRAM       0087
_Ticker_DisableInt                   UserModules        40DD
_Ticker_EnableInt                    UserModules        40D9
_Ticker_ISR                          intrtext           7C88
_Ticker_Start                        UserModules        40E1
_Ticker_Stop                         UserModules        40E5
_Ticker_WriteCompareValue            UserModules        40EF
_Ticker_WritePeriod                  UserModules        40E9
_Ticker_wReadCompareValue            UserModules        40F5
_Ticker_wReadCounter                 UserModules        40FB
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
__HInterruptRAM                      InterruptRAM       0088
__HLTRX_RAM                          LTRX_RAM           0700
__HPD_startup                        PD_startup         7FE4
__HSSCParmBlk                        SSCParmBlk         0100
__HTOP                               TOP                0065
__HUserModules                       UserModules        413B
__Hbss                               bss                0700
__Hbss0                              bss0               0000
__Hbss1                              bss1               0100
__Hbss2                              bss2               0215
__Hbss3                              bss3               0300
__Hbss4                              bss4               0400
__Hbss5                              bss5               0500
__Hbss6                              bss6               0600
__Hbss7                              bss7               0700
__Hcdata                             cdata              7DCC
__Hend_init                          end_init           0003
__Hfnauto                            fnauto             0085
__Hinit                              init               7D00
__Hintrtext                          intrtext           7CC9
__Hlit                               lit                0700
__Hmaintext                          maintext           7C88
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
__Hstrings                           strings            7F5A
__Htext                              text               7BE0
__Hvectors                           vectors            0003
__LInterruptRAM                      InterruptRAM       0085
__LLTRX_RAM                          LTRX_RAM           0700
__LPD_startup                        PD_startup         7F5A
__LSSCParmBlk                        SSCParmBlk         0000
__LTOP                               TOP                0000
__LUserModules                       UserModules        3AE6
__Lbss                               bss                0700
__Lbss0                              bss0               0000
__Lbss1                              bss1               0100
__Lbss2                              bss2               0200
__Lbss3                              bss3               0300
__Lbss4                              bss4               0400
__Lbss5                              bss5               0500
__Lbss6                              bss6               0600
__Lbss7                              bss7               0700
__Lcdata                             cdata              7D00
__Lend_init                          end_init           0003
__Lfnauto                            fnauto             0001
__Linit                              init               7CC9
__Lintrtext                          intrtext           7C88
__Llit                               lit                0700
__Lmaintext                          maintext           7BE0
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
__Lstrings                           strings            7E00
__Ltext                              text               413B
__Lvectors                           vectors            0000
__S0                                 (abs)              7FE4
__S1                                 (abs)              00A5
__Start                              PD_startup         7F5A
___awdiv                             text               6DB8
___awdiv@counter                     fnauto             0064
___awdiv@dividend                    fnauto             005D
___awdiv@divisor                     fnauto             005F
___awdiv@quotient                    fnauto             0061
___awdiv@sign                        fnauto             0063
___awmod                             text               6EF7
___awmod@counter                     fnauto             0062
___awmod@dividend                    fnauto             005D
___awmod@divisor                     fnauto             005F
___awmod@sign                        fnauto             0061
___awtofl                            text               72CE
___awtofl@c                          fnauto             003F
___awtofl@f1                         fnauto             0043
___end_of_c_program_code             text               7BE0
___fladd                             text               73BA
___fladd@cntr                        fnauto             0057
___fladd@exp1                        fnauto             0054
___fladd@exp2                        fnauto             0055
___fladd@f1                          fnauto             004C
___fladd@f2                          fnauto             0050
___fladd@sign1                       fnauto             0056
___fladd@sign2                       fnauto             0058
___fldiv                             text               632F
___fldiv@exp1                        fnauto             0041
___fldiv@exp2                        fnauto             0043
___fldiv@f1                          fnauto             0034
___fldiv@f2                          fnauto             0038
___fldiv@f3                          fnauto             003C
___fldiv@sign1                       fnauto             0042
___fldiv@sign2                       fnauto             0040
___flge                              text               70F4
___flge@ff1                          fnauto             0040
___flge@ff2                          fnauto             0044
___flmul                             text               7680
___flmul@cntr                        fnauto             0069
___flmul@exp1                        fnauto             006A
___flmul@f1                          fnauto             005D
___flmul@f2                          fnauto             0061
___flmul@f3                          fnauto             0065
___flmul@sign1                       fnauto             006B
___flneg                             text               7895
___flneg@f1                          fnauto             004B
___flpack                            text               78CD
___flpack@arg                        fnauto             0070
___flpack@exp                        fnauto             0072
___flsub                             text               6797
___flsub@f1                          fnauto             0040
___flsub@f2                          fnauto             0044
___fltol                             text               67F1
___fltol@exp1                        fnauto             0048
___fltol@f1                          fnauto             0040
___fltol@lval                        fnauto             0044
___fltol@sign1                       fnauto             0049
___flunpack                          text               7AFC
___flunpack@arg                      fnauto             0070
___flunpack@exp                      fnauto             0072
___flunpack@sign                     fnauto             0074
___lldiv                             text               658D
___lldiv@counter                     fnauto             004C
___lldiv@dividend                    fnauto             0040
___lldiv@divisor                     fnauto             0044
___lldiv@quotient                    fnauto             0048
___llmod                             text               66B7
___llmod@counter                     fnauto             0048
___llmod@dividend                    fnauto             0040
___llmod@divisor                     fnauto             0044
___lltofl                            text               6B14
___lltofl@c                          fnauto             0040
___lltofl@exp                        fnauto             0048
___lltofl@f1                         fnauto             0044
___lwtofl                            text               4AAA
___lwtofl@c                          fnauto             0014
___lwtofl@f1                         fnauto             0018
___start_of_c_program_code           text               413B
___wmul                              text               650E
___wmul@multiplicand                 fnauto             0042
___wmul@multiplier                   fnauto             0040
___wmul@product                      fnauto             0044
__div_to_l_                          text               692A
__div_to_l_@cntr                     fnauto             004D
__div_to_l_@exp1                     fnauto             004C
__div_to_l_@f1                       fnauto             0040
__div_to_l_@f2                       fnauto             0044
__div_to_l_@quot                     fnauto             0048
__end_of_Ticker_ISR                  intrtext           7CC9
__end_of___awdiv                     text               6EF7
__end_of___awmod                     text               700B
__end_of___awtofl                    text               73BA
__end_of___fladd                     text               7680
__end_of___fldiv                     text               64AF
__end_of___flge                      text               71EC
__end_of___flmul                     text               7895
__end_of___flneg                     text               78CD
__end_of___flpack                    text               7AFC
__end_of___flsub                     text               67F1
__end_of___fltol                     text               692A
__end_of___flunpack                  text               7BE0
__end_of___lldiv                     text               66B7
__end_of___llmod                     text               6797
__end_of___lltofl                    text               6B93
__end_of___lwtofl                    text               4B23
__end_of___wmul                      text               658D
__end_of__div_to_l_                  text               6B14
__end_of_calc_dewpoint               text               4744
__end_of_calc_sth11                  text               4AAA
__end_of_delay_10ms                  text               59E4
__end_of_delay_1us                   text               6BB3
__end_of_delay_5us                   text               6BAD
__end_of_eval_poly                   text               72CE
__end_of_frexp                       text               70D1
__end_of_fround                      text               625E
__end_of_hardware_init               text               43DD
__end_of_isdigit                     text               632F
__end_of_log                         text               6DA4
__end_of_log10                       text               650E
__end_of_main                        maintext           7C88
__end_of_oo_busreset                 text               5A68
__end_of_oo_conversion_busy          text               59FA
__end_of_oo_crc_init                 text               7019
__end_of_oo_crc_shuffle_byte         text               70F4
__end_of_oo_print_data               text               4C9C
__end_of_oo_read_device              text               4BFD
__end_of_oo_read_scratchpad          text               5ABF
__end_of_oo_report                   text               4389
__end_of_oo_rx_byte                  text               704D
__end_of_oo_start_conversion         text               43FF
__end_of_oo_tx_byte                  text               6DB8
__end_of_oo_wait_for_completion      text               4CD4
__end_of_print_header                text               4D85
__end_of_print_help                  text               4159
__end_of_printf                      text               59A7
__end_of_putch                       text               630C
__end_of_s_Start                     text               4D90
__end_of_s_connectionreset           text               4D3D
__end_of_s_do_measure                text               42CC
__end_of_s_measure                   text               4530
__end_of_s_read_byte                 text               5B67
__end_of_s_transstart                text               5A59
__end_of_s_write_byte                text               62F8
__end_of_scale                       text               5FC3
__flash_banks                        cdata              7DA2
__flash_blocksize                    cdata              7DA3
__flash_size                         cdata              7DA0
__npowers_                           cdata              7D00
__powers_                            cdata              7D34
__stack_start__                      stackps            0700
_bCounter8_ltrx_ReadCompareValue     UserModules        3AFC
_bCounter8_ltrx_ReadCounter          UserModules        3AFF
_bGetPowerSetting                    PD_startup         7FE1
_bLTRX_ReadRxData                    UserModules        3BAD
_bLTRX_ReadRxStatus                  UserModules        3BB0
_bLTRX_ReadTxStatus                  UserModules        3BAA
_calc_dewpoint                       text               4530
_calc_dewpoint$2728                  fnauto             0030
_calc_dewpoint$2729                  fnauto             002C
_calc_dewpoint$2734                  fnauto             0028
_calc_dewpoint$2735                  fnauto             0024
_calc_sth11                          text               4744
_calc_sth11$2713                     fnauto             0030
_calc_sth11$2714                     fnauto             0034
_calc_sth11$2720                     fnauto             002C
_conflict                            bss2               0213
_crc                                 bss2               0214
_crc_rom                             ramdata1           0100
_delay_10ms                          text               59A7
_delay_1us                           text               6BAD
_delay_5us                           text               6B93
_dpowers                             cdata              7D68
_errno                               bss2               0211
_eval_poly                           text               71EC
_frexp                               text               704D
_fround                              text               5FC3
_fround$2745                         fnauto             004C
_fround$2746                         fnauto             004A
_fround$2747                         fnauto             004E
_fround$2748                         fnauto             0046
_fround$2753                         fnauto             0044
_hardware_init                       text               4389
_id                                  bss2               0209
_isdigit                             text               630C
_log                                 text               6BB3
_log10                               text               64AF
_main                                maintext           7BE0
_new_conflict                        rbit0              0000
_oo_busreset                         text               5A59
_oo_conversion_busy                  text               59E4
_oo_crc_init                         text               700B
_oo_crc_shuffle_byte                 text               70D1
_oo_print_data                       text               4BFD
_oo_read_device                      text               4B23
_oo_read_scratchpad                  text               5A68
_oo_report                           text               42CC
_oo_rx_byte                          text               7019
_oo_scratchpad                       bss2               0200
_oo_start_conversion                 text               43DD
_oo_tx_byte                          text               6DA4
_oo_wait_for_completion              text               4C9C
_print_header                        text               4D3D
_print_help                          text               413B
_printf                              text               4D90
_putch                               text               62F8
_s_Start                             text               4D85
_s_connectionreset                   text               4CD4
_s_do_measure                        text               4159
_s_measure                           text               43FF
_s_read_byte                         text               5ABF
_s_transstart                        text               59FA
_s_write_byte                        text               625E
_scale                               text               5B67
_scale$2761                          fnauto             005A
_scale$2762                          fnauto             0058
_scale$2763                          fnauto             0056
_scale$2764                          fnauto             0052
_scale$2768                          fnauto             0050
_scale$2775                          fnauto             004E
_scale$2776                          fnauto             004C
_scale$2777                          fnauto             004A
_scale$2778                          fnauto             0046
_scale$2782                          fnauto             0044
_wTicker_ReadCompareValue            UserModules        40F5
_wTicker_ReadCounter                 UserModules        40FB
bCounter8_ltrx_ReadCompareValue      UserModules        3AFC
bCounter8_ltrx_ReadCounter           UserModules        3AFF
bGetPowerSetting                     PD_startup         7FE1
bLTRX_ReadRxData                     UserModules        3BAD
bLTRX_ReadRxStatus                   UserModules        3BB0
bLTRX_ReadTxStatus                   UserModules        3BAA
calc_dewpoint@dew_point              fnauto             0020
calc_dewpoint@h                      fnauto             0014
calc_dewpoint@logEx                  fnauto             001C
calc_dewpoint@t                      fnauto             0018
calc_sth11@p_humidity                fnauto             0014
calc_sth11@p_temperature             fnauto             0016
calc_sth11@rh                        fnauto             001C
calc_sth11@rh_lin                    fnauto             0024
calc_sth11@rh_true                   fnauto             0018
calc_sth11@t                         fnauto             0028
calc_sth11@t_C                       fnauto             0020
delay_10ms@counter                   fnauto             0015
eval_poly@d                          fnauto             0043
eval_poly@n                          fnauto             0045
eval_poly@res                        fnauto             0047
eval_poly@x                          fnauto             003F
frexp@eptr                           fnauto             0043
frexp@value                          fnauto             003F
fround@prec                          fnauto             0040
intlevel0                            bss                00A5
intlevel1                            bss                00A5
intlevel2                            bss                00A5
isdigit@c                            fnauto             0040
log10@x                              fnauto             0034
log@exp                              fnauto             003C
log@x                                fnauto             0038
main@UART_bfr                        fnauto             0001
oo_crc_shuffle_byte@input            fnauto             0034
oo_print_data@cntr                   fnauto             0021
oo_print_data@data                   fnauto             0014
oo_read_device@crc                   fnauto             002E
oo_read_device@data                  fnauto             0021
oo_read_scratchpad@counter           fnauto             0032
oo_report@data                       fnauto             0004
oo_rx_byte@data                      fnauto             0033
oo_tx_byte@data                      fnauto             0033
oo_wait_for_completion@counter       fnauto             0014
printf@_val                          fnauto             0026
printf@ap                            fnauto             0036
printf@c                             fnauto             0038
printf@exp                           fnauto             0030
printf@f                             fnauto             0014
printf@flag                          fnauto             0034
printf@fval                          fnauto             0022
printf@integ                         fnauto             002A
printf@prec                          fnauto             002E
printf@width                         fnauto             0032
putch@c                              fnauto             0040
reset_vec                            vectors            0000
s_connectionreset@i                  fnauto             0014
s_do_measure@checksum                fnauto             0011
s_do_measure@dew_point               fnauto             000C
s_do_measure@error                   fnauto             0010
s_do_measure@humi_val                fnauto             0008
s_do_measure@temp_val                fnauto             0004
s_measure@error                      fnauto             0019
s_measure@i                          fnauto             001B
s_measure@mode                       fnauto             0018
s_measure@p_checksum                 fnauto             0016
s_measure@p_value                    fnauto             0014
s_read_byte@ack                      fnauto             0021
s_read_byte@i                        fnauto             0022
s_read_byte@val                      fnauto             0023
s_write_byte@error                   fnauto             0023
s_write_byte@i                       fnauto             0022
s_write_byte@value                   fnauto             0021
scale@scl                            fnauto             0040
start                                vectors            0000
startup                              init               7CC9
wTicker_ReadCompareValue             UserModules        40F5
wTicker_ReadCounter                  UserModules        40FB
