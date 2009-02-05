HI-TECH Software C Compiler 

Linker command line:

--edf=C:\Program Files\HI-TECH Software\HCPSOC\PRO\9.61\dat\en_msgs.txt -cs \
  -h+output\onewire_gateway.sym -z -QCY8C29566 -ol.obj \
  -Moutput/onewire_gateway.mp -E1 -ACODE=00h-03h,065h-07FFFh \
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
  output\onewire_gateway.obj ./obj/boot.obj lib/libpsoc.lib \
  C:/PROGRA~1/Cypress/Common/CYPRES~2/tools/lib/CY8C29000/cms.lib 

Object code version is 3.10

Machine type is CY8C29566

Call graph: (short form)

*_main size 0,3 offset 0
     _hardware_init size 0,0 offset 3
         _OneWire_Start size 0,0 offset 3
         _Counter8_Start size 0,0 offset 3
         _Counter8_ltrx_Start size 0,0 offset 3
         _LED1_Start size 0,0 offset 3
         _Ticker_Start size 0,0 offset 3
         _LTRX_CmdReset size 0,0 offset 3
         _LTRX_EnableInt size 0,0 offset 3
         _LTRX_Start size 0,0 offset 3
         _Ticker_EnableInt size 0,0 offset 3
     _get_sensors size 0,1 offset 3
         _OneWire_fReset size 0,0 offset 57
         _LTRX_CPutString size 0,0 offset 58
         _LTRX_PutCRLF size 0,0 offset 58
         _OneWire_fFindFirst size 0,0 offset 27
         _OneWire_GetROM size 0,0 offset 57
         _OneWire_fFindNext size 0,0 offset 4
     _get_temp size 0,2 offset 3
         _OneWire_fReset size 0,0 offset 57
         _LTRX_CPutString size 0,0 offset 58
         _LTRX_PutCRLF size 0,0 offset 58
         _OneWire_WriteByte size 0,0 offset 59
         _OneWire_bReadByte size 0,0 offset 59
         _OneWire_SetROM size 0,0 offset 57
         _OneWire_fVerify size 0,0 offset 57
     _print_data size 0,0 offset 3
         _LTRX_PutCRLF size 0,0 offset 58
         _LTRX_CPutString size 0,0 offset 58
         _print_id size 2,1 offset 3
             _LTRX_PutSHexByte size 0,0 offset 58
         _LTRX_PutSHexInt size 0,0 offset 3
     _LTRX_bCmdCheck size 0,0 offset 3
     _LTRX_szGetParam size 0,0 offset 3
*    _oo_report size 0,24 offset 3
         _oo_busreset size 0,0 offset 57
             _OneWire_fReset size 0,0 offset 57
         _LTRX_CPutString size 0,0 offset 58
         _LTRX_PutCRLF size 0,0 offset 58
         _oo_start_conversion size 0,0 offset 27
             _oo_tx_byte size 1,0 offset 58
                 _OneWire_WriteByte size 0,0 offset 59
         _oo_wait_for_completion size 0,1 offset 27
             _delay_10ms size 0,2 offset 28
             _oo_conversion_busy size 0,0 offset 28
                 _oo_rx_byte size 0,1 offset 58
                     _OneWire_bReadByte size 0,0 offset 59
                     _oo_crc_shuffle_byte size 1,1 offset 59
         _OneWire_fFindFirst size 0,0 offset 27
         _OneWire_GetROM size 0,0 offset 57
*        _oo_read_device size 13,17 offset 27
             _OneWire_GetROM size 0,0 offset 57
             _oo_busreset size 0,0 offset 57
             _OneWire_fReset size 0,0 offset 57
             _OneWire_SetROM size 0,0 offset 57
             _OneWire_fVerify size 0,0 offset 57
*            _oo_read_scratchpad size 0,1 offset 57
                 _oo_tx_byte size 1,0 offset 58
                 _oo_crc_init size 0,0 offset 58
                 _LTRX_CPutString size 0,0 offset 58
*                _oo_rx_byte size 0,1 offset 58
                 _LTRX_PutSHexByte size 0,0 offset 58
                 _LTRX_PutCRLF size 0,0 offset 58
         _oo_print_data size 13,1 offset 27
             _LTRX_PutSHexByte size 0,0 offset 58
             _LTRX_CPutString size 0,0 offset 58
             _LTRX_PutChar size 0,0 offset 41
             _LTRX_PutCRLF size 0,0 offset 58
     _print_help size 0,0 offset 3
         _print_header size 0,0 offset 3
             _LTRX_PutCRLF size 0,0 offset 58
             _LTRX_CPutString size 0,0 offset 58
         _LTRX_PutCRLF size 0,0 offset 58
         _LTRX_CPutString size 0,0 offset 58
     _LTRX_CmdReset size 0,0 offset 3

Estimated maximum call depth: 5

*intlevel1 size 0,0 offset 61
*    _Ticker_ISR size 0,10 offset 61
*        _LED1_Invert size 0,0 offset 71

Estimated maximum call depth: 2


                Name          Link     Load   Length Selector Space Scale
output\startup.obj
                init          7F7B     7F7B       37    7F7B     0
                vectors          0        0        3       0     0
                SSCParmBl       F8       F8        8       0     1
                TOP              4        4       61       0     0
output\onewire_gateway.obj
                intrtext      7FB2     7FB2       41    7F7B     0
                strings       7E00     7E00      17B      7E     0
                cdata         7D00     7D00        4      7D     0
                text          748D     748D      7DE    748D     0
                maintext      7C6B     7C6B       95    7C6B     0
                ramdata1       100      100      100     100     1
                romdata1       100      100      100     100     0
                bss2           200      200       27     200     1
                rbit0            0        0        1       0     1    8
./obj/boot.obj  PD_startu     7D04     7D04       8A    7D04     0
                TOP              4        4       61       0     0

lib/libpsoc.lib
lib/obj/counter8.obj
                UserModul     6DEB     6DEB       4C    6DEB     0
lib/obj/counter8_ltrx.obj
                UserModul     6E37     6E37       4C    6DEB     0
lib/obj/counter8_ltrxint.obj
                UserModul     6E83     6E83        1    6DEB     0
lib/obj/counter8int.obj
                UserModul     6E84     6E84        1    6DEB     0
lib/obj/led1.obj
                UserModul     6E85     6E85       44    6DEB     0
lib/obj/ltrx.obj
                UserModul     6EC9     6EC9      1E7    6DEB     0
                LTRX_RAM        67       67        1       0     1
lib/obj/ltrxint.obj
                Interrupt       48       48        2       0     1
                UserModul     70B0     70B0       75    6DEB     0
                LTRX_RAM        4B       4B       10       0     1
lib/obj/onewire.obj
                UserModul     7125     7125      305    6DEB     0
                bss             5B       5B        C       0     1
lib/obj/onewireint.obj
                UserModul     742A     742A        1    6DEB     0
lib/obj/psocconfig.obj
                Interrupt       4A       4A        1       0     1
                psoc_conf     7D8E     7D8E       67    7D8E     0
lib/obj/psocconfigtbl.obj
                lit            200      200      1BD     200     0
lib/obj/ticker.obj
                UserModul     742B     742B       62    6DEB     0

C:/PROGRA~1/Cypress/Common/CYPRES~2/tools/lib/CY8C29000/cms.lib

COMMON          fnauto           1        1       47       0     1

TOTAL           Name          Link     Load   Length  Space
        CLASS   CODE           
                intrtext      7FB2     7FB2       41     0
                PD_startu     7D04     7D04       8A     0
                init          7F7B     7F7B       37     0
                text          748D     748D      7DE     0
                vectors          0        0        3     0
                maintext      7C6B     7C6B       95     0

        CLASS   BANKROM        
                romdata1       100      100      100     0

        CLASS   ROM            
                UserModul     6DEB     6DEB      6A2     0
                strings       7E00     7E00      17B     0
                cdata         7D00     7D00        4     0
                TOP              4        4       61     0
                psoc_conf     7D8E     7D8E       67     0
                lit            200      200      1BD     0

        CLASS   RAM            
                Interrupt       48       48        3     1
                fnauto           1        1       47     1
                SSCParmBl       F8       F8        8     1
                ramdata1       100      100      100     1
                bss2           200      200       27     1
                rbit0            0        0        1     1
                LTRX_RAM        67       67        1     1
                LTRX_RAM        4B       4B       10     1
                bss             5B       5B        C     1



SEGMENTS        Name           Load    Length   Top     Selector    Space Class

                bss0            000000  000068  000068         0       1  RAM     
                vectors         000000  000003  000003         0       0  CODE    
                romdata1        000100  000100  000200       100       0  BANKROM 
                bss1            000100  000100  000200       100       1  RAM     
                bss2            000200  000027  000227       200       1  RAM     
                lit             000200  0001BD  0003BD       200       0  ROM     
                UserModules     006DEB  0006A2  00748D      6DEB       0  CODE    
                text            00748D  0007DE  007C6B      748D       0  CODE    
                maintext        007C6B  000095  007D00      7C6B       0  CODE    
                cdata           007D00  000004  007D04        7D       0  ROM     
                PD_startup      007D04  00008A  007D8E      7D04       0  CODE    
                psoc_config     007D8E  000067  007DF5      7D8E       0  ROM     
                strings         007E00  00017B  007F7B        7E       0  ROM     
                init            007F7B  000078  007FF3      7F7B       0  CODE    


UNUSED ADDRESS RANGES

        BANKROM          0003-0003
                         0065-00FF
                         03BD-6DEA
                         7DF5-7DFF
                         7FF3-7FFF
        CODE             0003-0003
                         0065-00FF
                         03BD-6DEA
                         7DF5-7DFF
                         7FF3-7FFF
        RAM              0068-00F7
                         0227-07FF
        ROM              0003-0003
                         0065-00FF
                         03BD-6DEA
                         7DF5-7DFF
                         7FF3-7FFF

                                  Symbol Table

??_delay_10ms                         fnauto              001D
??_get_sensors                        fnauto              0004
??_get_temp                           fnauto              0004
??_main                               fnauto              0001
??_oo_crc_shuffle_byte                fnauto              003D
??_oo_print_data                      fnauto              0029
??_oo_read_device                     fnauto              0029
??_oo_read_scratchpad                 fnauto              003A
??_oo_report                          fnauto              0004
??_oo_rx_byte                         fnauto              003B
??_oo_wait_for_completion             fnauto              001C
??_print_id                           fnauto              0006
?_oo_crc_shuffle_byte                 fnauto              003C
?_oo_print_data                       fnauto              001C
?_oo_read_device                      fnauto              001C
?_oo_tx_byte                          fnauto              003B
?_print_id                            fnauto              0004
Counter8_DisableInt                   UserModules         6DEF
Counter8_EnableInt                    UserModules         6DEB
Counter8_Start                        UserModules         6DF3
Counter8_Stop                         UserModules         6DF7
Counter8_WriteCompareValue            UserModules         6DFE
Counter8_WritePeriod                  UserModules         6DFB
Counter8_bReadCompareValue            UserModules         6E01
Counter8_bReadCounter                 UserModules         6E04
Counter8_ltrx_DisableInt              UserModules         6E3B
Counter8_ltrx_EnableInt               UserModules         6E37
Counter8_ltrx_Start                   UserModules         6E3F
Counter8_ltrx_Stop                    UserModules         6E43
Counter8_ltrx_WriteCompareValue       UserModules         6E4A
Counter8_ltrx_WritePeriod             UserModules         6E47
Counter8_ltrx_bReadCompareValue       UserModules         6E4D
Counter8_ltrx_bReadCounter            UserModules         6E50
LED1_GetState                         UserModules         6EB6
LED1_Invert                           UserModules         6EA5
LED1_Off                              UserModules         6E89
LED1_On                               UserModules         6E85
LED1_Start                            UserModules         6E89
LED1_Stop                             UserModules         6E89
LED1_Switch                           UserModules         6E8B
LTRX_CPutString                       UserModules         6FFE
LTRX_CWrite                           UserModules         6FD0
LTRX_CmdReset                         UserModules         7019
LTRX_DisableInt                       UserModules         6ED0
LTRX_EnableInt                        UserModules         6EC9
LTRX_IntCntl                          UserModules         6F18
LTRX_PutCRLF                          UserModules         7010
LTRX_PutChar                          UserModules         6F5D
LTRX_PutSHexByte                      UserModules         6F43
LTRX_PutSHexInt                       UserModules         6F56
LTRX_PutString                        UserModules         6F9A
LTRX_SendData                         UserModules         6EF9
LTRX_SetTxIntMode                     UserModules         6ED7
LTRX_Start                            UserModules         6EE9
LTRX_Stop                             UserModules         6EF2
LTRX_TxIntMode                        UserModules         6F05
LTRX_Write                            UserModules         6FAA
LTRX_aRxBuffer                        LTRX_RAM            004B
LTRX_bCmdCheck                        UserModules         702F
LTRX_bCmdLength                       UserModules         7042
LTRX_bErrCheck                        UserModules         7037
LTRX_bReadRxData                      UserModules         6EFF
LTRX_bReadRxStatus                    UserModules         6F02
LTRX_bReadTxStatus                    UserModules         6EFC
LTRX_bRxCnt                           InterruptRAM        0049
LTRX_cGetChar                         UserModules         6F65
LTRX_cReadChar                        UserModules         6F6D
LTRX_fStatus                          InterruptRAM        0048
LTRX_iReadChar                        UserModules         6F84
LTRX_szGetParam                       UserModules         7048
LTRX_szGetRestOfParams                UserModules         70A5
LoadConfigInit                        psoc_config         7D8E
LoadConfigTBL_onewire_gateway_Bank0   lit                 02E9
LoadConfigTBL_onewire_gateway_Bank1   lit                 0368
LoadConfigTBL_onewire_gateway_Ordered lit                 0200
LoadConfig_onewire_gateway            psoc_config         7D98
NO_SHADOW                             InterruptRAM        004A
OneWire_ClearCRC8                     UserModules         71A2
OneWire_FamilySkipSetup               UserModules         740B
OneWire_FamilyTargetSetup             UserModules         73E2
OneWire_GetROM                        UserModules         71C3
OneWire_SetROM                        UserModules         71ED
OneWire_Start                         UserModules         7125
OneWire_Stop                          UserModules         7136
OneWire_WriteBit                      UserModules         7156
OneWire_WriteByte                     UserModules         7173
OneWire_bCRC8                         UserModules         71A9
OneWire_bCRC8Value                    bss                 005B
OneWire_bReadBit                      UserModules         7162
OneWire_bReadByte                     UserModules         718E
OneWire_fFindFirst                    UserModules         7217
OneWire_fFindNext                     UserModules         722C
OneWire_fReset                        UserModules         713D
OneWire_fVerify                       UserModules         734E
Port_3_Data_SHADE                     InterruptRAM        004A
Ticker_DisableInt                     UserModules         742F
Ticker_EnableInt                      UserModules         742B
Ticker_ISR                            intrtext            7FB2
Ticker_Start                          UserModules         7433
Ticker_Stop                           UserModules         7437
Ticker_WriteCompareValue              UserModules         7441
Ticker_WritePeriod                    UserModules         743B
Ticker_wReadCompareValue              UserModules         7447
Ticker_wReadCounter                   UserModules         744D
_Counter8_DisableInt                  UserModules         6DEF
_Counter8_EnableInt                   UserModules         6DEB
_Counter8_ISR                         UserModules         6E84
_Counter8_Start                       UserModules         6DF3
_Counter8_Stop                        UserModules         6DF7
_Counter8_WriteCompareValue           UserModules         6DFE
_Counter8_WritePeriod                 UserModules         6DFB
_Counter8_bReadCompareValue           UserModules         6E01
_Counter8_bReadCounter                UserModules         6E04
_Counter8_ltrx_DisableInt             UserModules         6E3B
_Counter8_ltrx_EnableInt              UserModules         6E37
_Counter8_ltrx_ISR                    UserModules         6E83
_Counter8_ltrx_Start                  UserModules         6E3F
_Counter8_ltrx_Stop                   UserModules         6E43
_Counter8_ltrx_WriteCompareValue      UserModules         6E4A
_Counter8_ltrx_WritePeriod            UserModules         6E47
_Counter8_ltrx_bReadCompareValue      UserModules         6E4D
_Counter8_ltrx_bReadCounter           UserModules         6E50
_LED1_GetState                        UserModules         6EB6
_LED1_Invert                          UserModules         6EA5
_LED1_Off                             UserModules         6E89
_LED1_On                              UserModules         6E85
_LED1_Start                           UserModules         6E89
_LED1_Stop                            UserModules         6E89
_LED1_Switch                          UserModules         6E8B
_LTRX_CPutString                      UserModules         6FFE
_LTRX_CWrite                          UserModules         6FD0
_LTRX_CmdReset                        UserModules         7019
_LTRX_DisableInt                      UserModules         6ED0
_LTRX_EnableInt                       UserModules         6EC9
_LTRX_IntCntl                         UserModules         6F18
_LTRX_PutCRLF                         UserModules         7010
_LTRX_PutChar                         UserModules         6F5D
_LTRX_PutSHexByte                     UserModules         6F43
_LTRX_PutSHexInt                      UserModules         6F56
_LTRX_PutString                       UserModules         6F9A
_LTRX_RX_ISR                          UserModules         70B1
_LTRX_SendData                        UserModules         6EF9
_LTRX_SetTxIntMode                    UserModules         6ED7
_LTRX_Start                           UserModules         6EE9
_LTRX_Stop                            UserModules         6EF2
_LTRX_TX_ISR                          UserModules         70B0
_LTRX_TxIntMode                       UserModules         6F05
_LTRX_Write                           UserModules         6FAA
_LTRX_aRxBuffer                       LTRX_RAM            004B
_LTRX_bCmdCheck                       UserModules         702F
_LTRX_bCmdLength                      UserModules         7042
_LTRX_bErrCheck                       UserModules         7037
_LTRX_bReadRxData                     UserModules         6EFF
_LTRX_bReadRxStatus                   UserModules         6F02
_LTRX_bReadTxStatus                   UserModules         6EFC
_LTRX_bRxCnt                          InterruptRAM        0049
_LTRX_cGetChar                        UserModules         6F65
_LTRX_cReadChar                       UserModules         6F6D
_LTRX_fStatus                         InterruptRAM        0048
_LTRX_iReadChar                       UserModules         6F84
_LTRX_szGetParam                      UserModules         7048
_LTRX_szGetRestOfParams               UserModules         70A5
_LoadConfigInit                       psoc_config         7D8E
_LoadConfig_onewire_gateway           psoc_config         7D98
_NO_SHADOW                            InterruptRAM        004A
_OneWire_ClearCRC8                    UserModules         71A2
_OneWire_FamilySkipSetup              UserModules         740B
_OneWire_FamilyTargetSetup            UserModules         73E2
_OneWire_GetROM                       UserModules         71C3
_OneWire_ISR                          UserModules         742A
_OneWire_SetROM                       UserModules         71ED
_OneWire_Start                        UserModules         7125
_OneWire_Stop                         UserModules         7136
_OneWire_WriteBit                     UserModules         7156
_OneWire_WriteByte                    UserModules         7173
_OneWire_bCRC8                        UserModules         71A9
_OneWire_bCRC8Value                   bss                 005B
_OneWire_bReadBit                     UserModules         7162
_OneWire_bReadByte                    UserModules         718E
_OneWire_fFindFirst                   UserModules         7217
_OneWire_fFindNext                    UserModules         722C
_OneWire_fReset                       UserModules         713D
_OneWire_fVerify                      UserModules         734E
_Port_3_Data_SHADE                    InterruptRAM        004A
_Ticker_DisableInt                    UserModules         742F
_Ticker_EnableInt                     UserModules         742B
_Ticker_ISR                           intrtext            7FB2
_Ticker_Start                         UserModules         7433
_Ticker_Stop                          UserModules         7437
_Ticker_WriteCompareValue             UserModules         7441
_Ticker_WritePeriod                   UserModules         743B
_Ticker_wReadCompareValue             UserModules         7447
_Ticker_wReadCounter                  UserModules         744D
__Bnvbit0                             nvbit0              0001
__Bnvbit1                             nvbit1              0200
__Bnvbit2                             nvbit2              0227
__Bnvbit3                             nvbit3              0300
__Bnvbit4                             nvbit4              0400
__Bnvbit5                             nvbit5              0500
__Bnvbit6                             nvbit6              0600
__Bnvbit7                             nvbit7              0700
__Brbit1                              rbit1               0100
__Brbit2                              rbit2               0227
__Brbit3                              rbit3               0300
__Brbit4                              rbit4               0400
__Brbit5                              rbit5               0500
__Brbit6                              rbit6               0600
__Brbit7                              rbit7               0700
__Bstackps                            stackps             0700
__HInterruptRAM                       InterruptRAM        004B
__HLTRX_RAM                           LTRX_RAM            0700
__HPD_startup                         PD_startup          7D8E
__HSSCParmBlk                         SSCParmBlk          0100
__HTOP                                TOP                 0065
__HUserModules                        UserModules         748D
__Hbss                                bss                 0700
__Hbss0                               bss0                0000
__Hbss1                               bss1                0100
__Hbss2                               bss2                0227
__Hbss3                               bss3                0300
__Hbss4                               bss4                0400
__Hbss5                               bss5                0500
__Hbss6                               bss6                0600
__Hbss7                               bss7                0700
__Hcdata                              cdata               7D04
__Hend_init                           end_init            0003
__Hfnauto                             fnauto              0048
__Hinit                               init                7FB2
__Hintrtext                           intrtext            7FF3
__Hlit                                lit                 0700
__Hmaintext                           maintext            7D00
__Hnvbit0                             nvbit0              0008
__Hnvbit1                             nvbit1              1000
__Hnvbit2                             nvbit2              1138
__Hnvbit3                             nvbit3              1800
__Hnvbit4                             nvbit4              2000
__Hnvbit5                             nvbit5              2800
__Hnvbit6                             nvbit6              3000
__Hnvbit7                             nvbit7              3800
__Hnvram0                             nvram0              0001
__Hnvram1                             nvram1              0200
__Hnvram2                             nvram2              0227
__Hnvram3                             nvram3              0300
__Hnvram4                             nvram4              0400
__Hnvram5                             nvram5              0500
__Hnvram6                             nvram6              0600
__Hnvram7                             nvram7              0700
__Honewire_gateway_RAM                onewire_gateway_RAM 0700
__Hpowerup                            powerup             0003
__Hpsoc_config                        psoc_config         0700
__Hramdata0                           ramdata0            0001
__Hramdata1                           ramdata1            0200
__Hramdata2                           ramdata2            0227
__Hramdata3                           ramdata3            0300
__Hramdata4                           ramdata4            0400
__Hramdata5                           ramdata5            0500
__Hramdata6                           ramdata6            0600
__Hramdata7                           ramdata7            0700
__Hrbit0                              rbit0               0001
__Hrbit1                              rbit1               0800
__Hrbit2                              rbit2               1138
__Hrbit3                              rbit3               1800
__Hrbit4                              rbit4               2000
__Hrbit5                              rbit5               2800
__Hrbit6                              rbit6               3000
__Hrbit7                              rbit7               3800
__Hromdata0                           romdata0            0003
__Hromdata1                           romdata1            0200
__Hromdata2                           romdata2            0003
__Hromdata3                           romdata3            0003
__Hromdata4                           romdata4            0003
__Hromdata5                           romdata5            0003
__Hromdata6                           romdata6            0003
__Hromdata7                           romdata7            0003
__Hstackps                            stackps             0700
__Hstrings                            strings             7F7B
__Htext                               text                7C6B
__Hvectors                            vectors             0003
__LInterruptRAM                       InterruptRAM        0048
__LLTRX_RAM                           LTRX_RAM            0700
__LPD_startup                         PD_startup          7D04
__LSSCParmBlk                         SSCParmBlk          0000
__LTOP                                TOP                 0000
__LUserModules                        UserModules         6DEB
__Lbss                                bss                 0700
__Lbss0                               bss0                0000
__Lbss1                               bss1                0100
__Lbss2                               bss2                0200
__Lbss3                               bss3                0300
__Lbss4                               bss4                0400
__Lbss5                               bss5                0500
__Lbss6                               bss6                0600
__Lbss7                               bss7                0700
__Lcdata                              cdata               7D00
__Lend_init                           end_init            0003
__Lfnauto                             fnauto              0001
__Linit                               init                7F7B
__Lintrtext                           intrtext            7FB2
__Llit                                lit                 0700
__Lmaintext                           maintext            7C6B
__Lnvbit0                             nvbit0              0008
__Lnvbit1                             nvbit1              1000
__Lnvbit2                             nvbit2              1138
__Lnvbit3                             nvbit3              1800
__Lnvbit4                             nvbit4              2000
__Lnvbit5                             nvbit5              2800
__Lnvbit6                             nvbit6              3000
__Lnvbit7                             nvbit7              3800
__Lnvram0                             nvram0              0001
__Lnvram1                             nvram1              0200
__Lnvram2                             nvram2              0227
__Lnvram3                             nvram3              0300
__Lnvram4                             nvram4              0400
__Lnvram5                             nvram5              0500
__Lnvram6                             nvram6              0600
__Lnvram7                             nvram7              0700
__Lonewire_gateway_RAM                onewire_gateway_RAM 0700
__Lpowerup                            powerup             0003
__Lpsoc_config                        psoc_config         0700
__Lramdata0                           ramdata0            0001
__Lramdata1                           ramdata1            0100
__Lramdata2                           ramdata2            0227
__Lramdata3                           ramdata3            0300
__Lramdata4                           ramdata4            0400
__Lramdata5                           ramdata5            0500
__Lramdata6                           ramdata6            0600
__Lramdata7                           ramdata7            0700
__Lrbit0                              rbit0               0000
__Lrbit1                              rbit1               0800
__Lrbit2                              rbit2               1138
__Lrbit3                              rbit3               1800
__Lrbit4                              rbit4               2000
__Lrbit5                              rbit5               2800
__Lrbit6                              rbit6               3000
__Lrbit7                              rbit7               3800
__Lromdata0                           romdata0            0003
__Lromdata1                           romdata1            0100
__Lromdata2                           romdata2            0003
__Lromdata3                           romdata3            0003
__Lromdata4                           romdata4            0003
__Lromdata5                           romdata5            0003
__Lromdata6                           romdata6            0003
__Lromdata7                           romdata7            0003
__Lstackps                            stackps             0700
__Lstrings                            strings             7E00
__Ltext                               text                748D
__Lvectors                            vectors             0000
__S0                                  (abs)               7FF3
__S1                                  (abs)               0068
__Start                               PD_startup          7D04
___end_of_c_program_code              text                7C6B
___start_of_c_program_code            text                748D
__end_of_Ticker_ISR                   intrtext            7FF3
__end_of_delay_10ms                   text                7B5E
__end_of_get_sensors                  text                76BD
__end_of_get_temp                     text                75E8
__end_of_hardware_init                text                78A0
__end_of_main                         maintext            7D00
__end_of_oo_busreset                  text                7BF9
__end_of_oo_conversion_busy           text                7B74
__end_of_oo_crc_init                  text                7C07
__end_of_oo_crc_shuffle_byte          text                7C6B
__end_of_oo_print_data                text                7963
__end_of_oo_read_device               text                7AA9
__end_of_oo_read_scratchpad           text                7BEA
__end_of_oo_report                    text                7848
__end_of_oo_rx_byte                   text                7C48
__end_of_oo_start_conversion          text                7985
__end_of_oo_tx_byte                   text                7C1B
__end_of_oo_wait_for_completion       text                79BD
__end_of_print_data                   text                778F
__end_of_print_header                 text                7B21
__end_of_print_help                   text                760F
__end_of_print_id                     text                7AEF
__flash_banks                         cdata               7D02
__flash_blocksize                     cdata               7D03
__flash_size                          cdata               7D00
__stack_start__                       stackps             0700
_bCounter8_ReadCompareValue           UserModules         6E01
_bCounter8_ReadCounter                UserModules         6E04
_bCounter8_ltrx_ReadCompareValue      UserModules         6E4D
_bCounter8_ltrx_ReadCounter           UserModules         6E50
_bGetPowerSetting                     PD_startup          7D8B
_bLTRX_ReadRxData                     UserModules         6EFF
_bLTRX_ReadRxStatus                   UserModules         6F02
_bLTRX_ReadTxStatus                   UserModules         6EFC
_conflict                             bss2                0215
_crc                                  bss2                0216
_crc_rom                              ramdata1            0100
_delay_10ms                           text                7B21
_get_sensors                          text                760F
_get_temp                             text                748D
_hardware_init                        text                7848
_id                                   bss2                0209
_id0                                  bss2                0217
_id1                                  bss2                021F
_main                                 maintext            7C6B
_new_conflict                         rbit0               0000
_oo_busreset                          text                7BEA
_oo_conversion_busy                   text                7B5E
_oo_crc_init                          text                7BF9
_oo_crc_shuffle_byte                  text                7C48
_oo_print_data                        text                78A0
_oo_read_device                       text                79BD
_oo_read_scratchpad                   text                7B74
_oo_report                            text                778F
_oo_rx_byte                           text                7C1B
_oo_scratchpad                        bss2                0200
_oo_start_conversion                  text                7963
_oo_tx_byte                           text                7C07
_oo_wait_for_completion               text                7985
_print_data                           text                76BD
_print_header                         text                7AEF
_print_help                           text                75E8
_print_id                             text                7AA9
_temp0                                bss2                0211
_temp1                                bss2                0213
_wTicker_ReadCompareValue             UserModules         7447
_wTicker_ReadCounter                  UserModules         744D
bCounter8_ReadCompareValue            UserModules         6E01
bCounter8_ReadCounter                 UserModules         6E04
bCounter8_ltrx_ReadCompareValue       UserModules         6E4D
bCounter8_ltrx_ReadCounter            UserModules         6E50
bGetPowerSetting                      PD_startup          7D8B
bLTRX_ReadRxData                      UserModules         6EFF
bLTRX_ReadRxStatus                    UserModules         6F02
bLTRX_ReadTxStatus                    UserModules         6EFC
delay_10ms@counter                    fnauto              001D
get_sensors@next_found                fnauto              0004
intlevel0                             bss                 0068
intlevel1                             bss                 0068
intlevel2                             bss                 0068
main@strPtr                           fnauto              0001
oo_crc_shuffle_byte@input             fnauto              003C
oo_print_data@cntr                    fnauto              0029
oo_print_data@data                    fnauto              001C
oo_read_device@crc                    fnauto              0036
oo_read_device@data                   fnauto              0029
oo_read_scratchpad@counter            fnauto              003A
oo_report@data                        fnauto              0004
oo_report@id                          fnauto              0011
oo_rx_byte@data                       fnauto              003B
oo_tx_byte@data                       fnauto              003B
oo_wait_for_completion@counter        fnauto              001C
print_id@cntr                         fnauto              0006
print_id@id                           fnauto              0004
reset_vec                             vectors             0000
start                                 vectors             0000
startup                               init                7F7B
wTicker_ReadCompareValue              UserModules         7447
wTicker_ReadCounter                   UserModules         744D
