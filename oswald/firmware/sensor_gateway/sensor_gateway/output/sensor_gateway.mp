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
         _OneWire_Start size 0,0 offset 3
         _Counter8_ltrx_Start size 0,0 offset 3
         _LED1_Start size 0,0 offset 3
         _Ticker_Start size 0,0 offset 3
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
*    _oo_report size 0,16 offset 3
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
*        _oo_read_device size 13,17 offset 19
             _OneWire_GetROM size 0,0 offset 49
             _oo_busreset size 0,0 offset 49
                 _OneWire_fReset size 0,0 offset 49
             _OneWire_SetROM size 0,0 offset 49
             _OneWire_fVerify size 0,0 offset 49
*            _oo_read_scratchpad size 0,1 offset 49
                 _oo_tx_byte size 1,0 offset 50
                 _oo_crc_init size 0,0 offset 50
*                _oo_rx_byte size 0,1 offset 50
         _oo_print_data size 13,1 offset 19
             _LTRX_CPutString size 0,0 offset 33
             _LTRX_PutSHexByte size 0,0 offset 33
             _LTRX_PutChar size 0,0 offset 33
             _LTRX_PutCRLF size 0,0 offset 33
         _OneWire_fFindNext size 0,0 offset 19
     _LTRX_CPutString size 0,0 offset 33
     _LTRX_PutCRLF size 0,0 offset 33
     _LTRX_CmdReset size 0,0 offset 3

Estimated maximum call depth: 5

*intlevel1 size 0,0 offset 53
*    _Ticker_ISR size 0,10 offset 53
*        _LED1_Invert size 0,0 offset 63

Estimated maximum call depth: 2


                Name          Link     Load   Length Selector Space Scale
output\startup.obj
                init          7E8E     7E8E       37    7E04     0
                vectors          0        0        3       0     0
                SSCParmBl       F8       F8        8       0     1
                TOP              4        4       61       0     0
output\sensor_gateway.obj
                intrtext      7DBF     7DBF       41    7DBF     0
                strings       7F00     7F00       F1      7F     0
                cdata         7E00     7E00        4      7E     0
                text          78C5     78C5      477    78C5     0
                maintext      7D3C     7D3C       83    7D3C     0
                ramdata1       100      100      100     100     1
                romdata1       100      100      100     100     0
                bss2           200      200       13     200     1
                rbit0            0        0        1       0     1    8
./obj/boot.obj  PD_startu     7E04     7E04       8A    7E04     0
                TOP              4        4       61       0     0

lib/libpsoc.lib
lib/obj/counter8_ltrx.obj
                UserModul     7270     7270       4C    7270     0
lib/obj/counter8_ltrxint.obj
                UserModul     72BC     72BC        1    7270     0
lib/obj/led1.obj
                UserModul     72BD     72BD       44    7270     0
lib/obj/ltrx.obj
                UserModul     7301     7301      1E7    7270     0
                LTRX_RAM        5F       5F        1       0     1
lib/obj/ltrxint.obj
                Interrupt       40       40        2       0     1
                UserModul     74E8     74E8       75    7270     0
                LTRX_RAM        43       43       10       0     1
lib/obj/onewire.obj
                UserModul     755D     755D      305    7270     0
                bss             53       53        C       0     1
lib/obj/onewireint.obj
                UserModul     7862     7862        1    7270     0
lib/obj/psocconfig.obj
                Interrupt       42       42        1       0     1
                psoc_conf      3B1      3B1       67     200     0
lib/obj/psocconfigtbl.obj
                lit            200      200      1B1     200     0
lib/obj/ticker.obj
                UserModul     7863     7863       62    7270     0

C:/PROGRA~1/Cypress/Common/CYPRES~2/tools/lib/CY8C29000/cms.lib

COMMON          fnauto           1        1       3F       0     1

TOTAL           Name          Link     Load   Length  Space
        CLASS   CODE           
                intrtext      7DBF     7DBF       41     0
                PD_startu     7E04     7E04       8A     0
                init          7E8E     7E8E       37     0
                text          78C5     78C5      477     0
                vectors          0        0        3     0
                maintext      7D3C     7D3C       83     0

        CLASS   BANKROM        
                romdata1       100      100      100     0

        CLASS   ROM            
                UserModul     7270     7270      655     0
                strings       7F00     7F00       F1     0
                cdata         7E00     7E00        4     0
                TOP              4        4       61     0
                psoc_conf      3B1      3B1       67     0
                lit            200      200      1B1     0

        CLASS   RAM            
                Interrupt       40       40        3     1
                fnauto           1        1       3F     1
                SSCParmBl       F8       F8        8     1
                ramdata1       100      100      100     1
                bss2           200      200       13     1
                rbit0            0        0        1     1
                LTRX_RAM        5F       5F        1     1
                LTRX_RAM        43       43       10     1
                bss             53       53        C     1



SEGMENTS        Name           Load    Length   Top     Selector    Space Class

                bss0            000000  000060  000060         0       1  RAM     
                vectors         000000  000003  000003         0       0  CODE    
                romdata1        000100  000100  000200       100       0  BANKROM 
                bss1            000100  000100  000200       100       1  RAM     
                bss2            000200  000013  000213       200       1  RAM     
                lit             000200  000218  000418       200       0  ROM     
                UserModules     007270  000655  0078C5      7270       0  CODE    
                text            0078C5  000477  007D3C      78C5       0  CODE    
                maintext        007D3C  000083  007DBF      7D3C       0  CODE    
                intrtext        007DBF  000041  007E00      7DBF       0  CODE    
                cdata           007E00  000004  007E04        7E       0  ROM     
                PD_startup      007E04  0000C1  007EC5      7E04       0  CODE    
                strings         007F00  0000F1  007FF1        7F       0  ROM     


UNUSED ADDRESS RANGES

        BANKROM          0003-0003
                         0065-00FF
                         0418-726F
                         7EC5-7EFF
                         7FF1-7FFF
        CODE             0003-0003
                         0065-00FF
                         0418-726F
                         7EC5-7EFF
                         7FF1-7FFF
        RAM              0060-00F7
                         0213-07FF
        ROM              0003-0003
                         0065-00FF
                         0418-726F
                         7EC5-7EFF
                         7FF1-7FFF

                                  Symbol Table

??_delay_10ms                        fnauto             0015
??_main                              fnauto             0001
??_oo_crc_shuffle_byte               fnauto             0035
??_oo_print_data                     fnauto             0021
??_oo_read_device                    fnauto             0021
??_oo_read_scratchpad                fnauto             0032
??_oo_report                         fnauto             0004
??_oo_rx_byte                        fnauto             0033
??_oo_wait_for_completion            fnauto             0014
?_oo_crc_shuffle_byte                fnauto             0034
?_oo_print_data                      fnauto             0014
?_oo_read_device                     fnauto             0014
?_oo_tx_byte                         fnauto             0033
Counter8_ltrx_DisableInt             UserModules        7274
Counter8_ltrx_EnableInt              UserModules        7270
Counter8_ltrx_Start                  UserModules        7278
Counter8_ltrx_Stop                   UserModules        727C
Counter8_ltrx_WriteCompareValue      UserModules        7283
Counter8_ltrx_WritePeriod            UserModules        7280
Counter8_ltrx_bReadCompareValue      UserModules        7286
Counter8_ltrx_bReadCounter           UserModules        7289
LED1_GetState                        UserModules        72EE
LED1_Invert                          UserModules        72DD
LED1_Off                             UserModules        72C1
LED1_On                              UserModules        72BD
LED1_Start                           UserModules        72C1
LED1_Stop                            UserModules        72C1
LED1_Switch                          UserModules        72C3
LTRX_CPutString                      UserModules        7436
LTRX_CWrite                          UserModules        7408
LTRX_CmdReset                        UserModules        7451
LTRX_DisableInt                      UserModules        7308
LTRX_EnableInt                       UserModules        7301
LTRX_IntCntl                         UserModules        7350
LTRX_PutCRLF                         UserModules        7448
LTRX_PutChar                         UserModules        7395
LTRX_PutSHexByte                     UserModules        737B
LTRX_PutSHexInt                      UserModules        738E
LTRX_PutString                       UserModules        73D2
LTRX_SendData                        UserModules        7331
LTRX_SetTxIntMode                    UserModules        730F
LTRX_Start                           UserModules        7321
LTRX_Stop                            UserModules        732A
LTRX_TxIntMode                       UserModules        733D
LTRX_Write                           UserModules        73E2
LTRX_aRxBuffer                       LTRX_RAM           0043
LTRX_bCmdCheck                       UserModules        7467
LTRX_bCmdLength                      UserModules        747A
LTRX_bErrCheck                       UserModules        746F
LTRX_bReadRxData                     UserModules        7337
LTRX_bReadRxStatus                   UserModules        733A
LTRX_bReadTxStatus                   UserModules        7334
LTRX_bRxCnt                          InterruptRAM       0041
LTRX_cGetChar                        UserModules        739D
LTRX_cReadChar                       UserModules        73A5
LTRX_fStatus                         InterruptRAM       0040
LTRX_iReadChar                       UserModules        73BC
LTRX_szGetParam                      UserModules        7480
LTRX_szGetRestOfParams               UserModules        74DD
LoadConfigInit                       psoc_config        03B1
LoadConfigTBL_sensor_gateway_Bank0   lit                02E9
LoadConfigTBL_sensor_gateway_Bank1   lit                0362
LoadConfigTBL_sensor_gateway_Ordered lit                0200
LoadConfig_sensor_gateway            psoc_config        03BB
NO_SHADOW                            InterruptRAM       0042
OneWire_ClearCRC8                    UserModules        75DA
OneWire_FamilySkipSetup              UserModules        7843
OneWire_FamilyTargetSetup            UserModules        781A
OneWire_GetROM                       UserModules        75FB
OneWire_SetROM                       UserModules        7625
OneWire_Start                        UserModules        755D
OneWire_Stop                         UserModules        756E
OneWire_WriteBit                     UserModules        758E
OneWire_WriteByte                    UserModules        75AB
OneWire_bCRC8                        UserModules        75E1
OneWire_bCRC8Value                   bss                0053
OneWire_bReadBit                     UserModules        759A
OneWire_bReadByte                    UserModules        75C6
OneWire_fFindFirst                   UserModules        764F
OneWire_fFindNext                    UserModules        7664
OneWire_fReset                       UserModules        7575
OneWire_fVerify                      UserModules        7786
Port_3_Data_SHADE                    InterruptRAM       0042
Ticker_DisableInt                    UserModules        7867
Ticker_EnableInt                     UserModules        7863
Ticker_ISR                           intrtext           7DBF
Ticker_Start                         UserModules        786B
Ticker_Stop                          UserModules        786F
Ticker_WriteCompareValue             UserModules        7879
Ticker_WritePeriod                   UserModules        7873
Ticker_wReadCompareValue             UserModules        787F
Ticker_wReadCounter                  UserModules        7885
_Counter8_ltrx_DisableInt            UserModules        7274
_Counter8_ltrx_EnableInt             UserModules        7270
_Counter8_ltrx_ISR                   UserModules        72BC
_Counter8_ltrx_Start                 UserModules        7278
_Counter8_ltrx_Stop                  UserModules        727C
_Counter8_ltrx_WriteCompareValue     UserModules        7283
_Counter8_ltrx_WritePeriod           UserModules        7280
_Counter8_ltrx_bReadCompareValue     UserModules        7286
_Counter8_ltrx_bReadCounter          UserModules        7289
_LED1_GetState                       UserModules        72EE
_LED1_Invert                         UserModules        72DD
_LED1_Off                            UserModules        72C1
_LED1_On                             UserModules        72BD
_LED1_Start                          UserModules        72C1
_LED1_Stop                           UserModules        72C1
_LED1_Switch                         UserModules        72C3
_LTRX_CPutString                     UserModules        7436
_LTRX_CWrite                         UserModules        7408
_LTRX_CmdReset                       UserModules        7451
_LTRX_DisableInt                     UserModules        7308
_LTRX_EnableInt                      UserModules        7301
_LTRX_IntCntl                        UserModules        7350
_LTRX_PutCRLF                        UserModules        7448
_LTRX_PutChar                        UserModules        7395
_LTRX_PutSHexByte                    UserModules        737B
_LTRX_PutSHexInt                     UserModules        738E
_LTRX_PutString                      UserModules        73D2
_LTRX_RX_ISR                         UserModules        74E9
_LTRX_SendData                       UserModules        7331
_LTRX_SetTxIntMode                   UserModules        730F
_LTRX_Start                          UserModules        7321
_LTRX_Stop                           UserModules        732A
_LTRX_TX_ISR                         UserModules        74E8
_LTRX_TxIntMode                      UserModules        733D
_LTRX_Write                          UserModules        73E2
_LTRX_aRxBuffer                      LTRX_RAM           0043
_LTRX_bCmdCheck                      UserModules        7467
_LTRX_bCmdLength                     UserModules        747A
_LTRX_bErrCheck                      UserModules        746F
_LTRX_bReadRxData                    UserModules        7337
_LTRX_bReadRxStatus                  UserModules        733A
_LTRX_bReadTxStatus                  UserModules        7334
_LTRX_bRxCnt                         InterruptRAM       0041
_LTRX_cGetChar                       UserModules        739D
_LTRX_cReadChar                      UserModules        73A5
_LTRX_fStatus                        InterruptRAM       0040
_LTRX_iReadChar                      UserModules        73BC
_LTRX_szGetParam                     UserModules        7480
_LTRX_szGetRestOfParams              UserModules        74DD
_LoadConfigInit                      psoc_config        03B1
_LoadConfig_sensor_gateway           psoc_config        03BB
_NO_SHADOW                           InterruptRAM       0042
_OneWire_ClearCRC8                   UserModules        75DA
_OneWire_FamilySkipSetup             UserModules        7843
_OneWire_FamilyTargetSetup           UserModules        781A
_OneWire_GetROM                      UserModules        75FB
_OneWire_ISR                         UserModules        7862
_OneWire_SetROM                      UserModules        7625
_OneWire_Start                       UserModules        755D
_OneWire_Stop                        UserModules        756E
_OneWire_WriteBit                    UserModules        758E
_OneWire_WriteByte                   UserModules        75AB
_OneWire_bCRC8                       UserModules        75E1
_OneWire_bCRC8Value                  bss                0053
_OneWire_bReadBit                    UserModules        759A
_OneWire_bReadByte                   UserModules        75C6
_OneWire_fFindFirst                  UserModules        764F
_OneWire_fFindNext                   UserModules        7664
_OneWire_fReset                      UserModules        7575
_OneWire_fVerify                     UserModules        7786
_Port_3_Data_SHADE                   InterruptRAM       0042
_Ticker_DisableInt                   UserModules        7867
_Ticker_EnableInt                    UserModules        7863
_Ticker_ISR                          intrtext           7DBF
_Ticker_Start                        UserModules        786B
_Ticker_Stop                         UserModules        786F
_Ticker_WriteCompareValue            UserModules        7879
_Ticker_WritePeriod                  UserModules        7873
_Ticker_wReadCompareValue            UserModules        787F
_Ticker_wReadCounter                 UserModules        7885
__Bnvbit0                            nvbit0             0001
__Bnvbit1                            nvbit1             0200
__Bnvbit2                            nvbit2             0213
__Bnvbit3                            nvbit3             0300
__Bnvbit4                            nvbit4             0400
__Bnvbit5                            nvbit5             0500
__Bnvbit6                            nvbit6             0600
__Bnvbit7                            nvbit7             0700
__Brbit1                             rbit1              0100
__Brbit2                             rbit2              0213
__Brbit3                             rbit3              0300
__Brbit4                             rbit4              0400
__Brbit5                             rbit5              0500
__Brbit6                             rbit6              0600
__Brbit7                             rbit7              0700
__Bstackps                           stackps            0700
__HInterruptRAM                      InterruptRAM       0043
__HLTRX_RAM                          LTRX_RAM           0700
__HPD_startup                        PD_startup         7E8E
__HSSCParmBlk                        SSCParmBlk         0100
__HTOP                               TOP                0065
__HUserModules                       UserModules        78C5
__Hbss                               bss                0700
__Hbss0                              bss0               0000
__Hbss1                              bss1               0100
__Hbss2                              bss2               0213
__Hbss3                              bss3               0300
__Hbss4                              bss4               0400
__Hbss5                              bss5               0500
__Hbss6                              bss6               0600
__Hbss7                              bss7               0700
__Hcdata                             cdata              7E04
__Hend_init                          end_init           0003
__Hfnauto                            fnauto             0040
__Hinit                              init               7EC5
__Hintrtext                          intrtext           7E00
__Hlit                               lit                0700
__Hmaintext                          maintext           7DBF
__Hnvbit0                            nvbit0             0008
__Hnvbit1                            nvbit1             1000
__Hnvbit2                            nvbit2             1098
__Hnvbit3                            nvbit3             1800
__Hnvbit4                            nvbit4             2000
__Hnvbit5                            nvbit5             2800
__Hnvbit6                            nvbit6             3000
__Hnvbit7                            nvbit7             3800
__Hnvram0                            nvram0             0001
__Hnvram1                            nvram1             0200
__Hnvram2                            nvram2             0213
__Hnvram3                            nvram3             0300
__Hnvram4                            nvram4             0400
__Hnvram5                            nvram5             0500
__Hnvram6                            nvram6             0600
__Hnvram7                            nvram7             0700
__Hpowerup                           powerup            0003
__Hpsoc_config                       psoc_config        0700
__Hramdata0                          ramdata0           0001
__Hramdata1                          ramdata1           0200
__Hramdata2                          ramdata2           0213
__Hramdata3                          ramdata3           0300
__Hramdata4                          ramdata4           0400
__Hramdata5                          ramdata5           0500
__Hramdata6                          ramdata6           0600
__Hramdata7                          ramdata7           0700
__Hrbit0                             rbit0              0001
__Hrbit1                             rbit1              0800
__Hrbit2                             rbit2              1098
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
__Hstrings                           strings            7FF1
__Htext                              text               7D3C
__Hvectors                           vectors            0003
__LInterruptRAM                      InterruptRAM       0040
__LLTRX_RAM                          LTRX_RAM           0700
__LPD_startup                        PD_startup         7E04
__LSSCParmBlk                        SSCParmBlk         0000
__LTOP                               TOP                0000
__LUserModules                       UserModules        7270
__Lbss                               bss                0700
__Lbss0                              bss0               0000
__Lbss1                              bss1               0100
__Lbss2                              bss2               0200
__Lbss3                              bss3               0300
__Lbss4                              bss4               0400
__Lbss5                              bss5               0500
__Lbss6                              bss6               0600
__Lbss7                              bss7               0700
__Lcdata                             cdata              7E00
__Lend_init                          end_init           0003
__Lfnauto                            fnauto             0001
__Linit                              init               7E8E
__Lintrtext                          intrtext           7DBF
__Llit                               lit                0700
__Lmaintext                          maintext           7D3C
__Lnvbit0                            nvbit0             0008
__Lnvbit1                            nvbit1             1000
__Lnvbit2                            nvbit2             1098
__Lnvbit3                            nvbit3             1800
__Lnvbit4                            nvbit4             2000
__Lnvbit5                            nvbit5             2800
__Lnvbit6                            nvbit6             3000
__Lnvbit7                            nvbit7             3800
__Lnvram0                            nvram0             0001
__Lnvram1                            nvram1             0200
__Lnvram2                            nvram2             0213
__Lnvram3                            nvram3             0300
__Lnvram4                            nvram4             0400
__Lnvram5                            nvram5             0500
__Lnvram6                            nvram6             0600
__Lnvram7                            nvram7             0700
__Lpowerup                           powerup            0003
__Lpsoc_config                       psoc_config        0700
__Lramdata0                          ramdata0           0001
__Lramdata1                          ramdata1           0100
__Lramdata2                          ramdata2           0213
__Lramdata3                          ramdata3           0300
__Lramdata4                          ramdata4           0400
__Lramdata5                          ramdata5           0500
__Lramdata6                          ramdata6           0600
__Lramdata7                          ramdata7           0700
__Lrbit0                             rbit0              0000
__Lrbit1                             rbit1              0800
__Lrbit2                             rbit2              1098
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
__Lstrings                           strings            7F00
__Ltext                              text               78C5
__Lvectors                           vectors            0000
__S0                                 (abs)              7FF1
__S1                                 (abs)              0060
__Start                              PD_startup         7E04
___end_of_c_program_code             text               7D3C
___start_of_c_program_code           text               78C5
__end_of_Ticker_ISR                  intrtext           7E00
__end_of_delay_10ms                  text               7CC3
__end_of_hardware_init               text               79EF
__end_of_main                        maintext           7DBF
__end_of_oo_busreset                 text               7C70
__end_of_oo_conversion_busy          text               7C86
__end_of_oo_crc_init                 text               7CD1
__end_of_oo_crc_shuffle_byte         text               7D3C
__end_of_oo_print_data               text               7BC2
__end_of_oo_read_device              text               7AEB
__end_of_oo_read_scratchpad          text               7C61
__end_of_oo_report                   text               79A0
__end_of_oo_rx_byte                  text               7D19
__end_of_oo_start_conversion         text               7A11
__end_of_oo_tx_byte                  text               7CE5
__end_of_oo_wait_for_completion      text               7B23
__end_of_print_header                text               7C0A
__end_of_print_help                  text               78E3
__flash_banks                        cdata              7E02
__flash_blocksize                    cdata              7E03
__flash_size                         cdata              7E00
__stack_start__                      stackps            0700
_bCounter8_ltrx_ReadCompareValue     UserModules        7286
_bCounter8_ltrx_ReadCounter          UserModules        7289
_bGetPowerSetting                    PD_startup         7E8B
_bLTRX_ReadRxData                    UserModules        7337
_bLTRX_ReadRxStatus                  UserModules        733A
_bLTRX_ReadTxStatus                  UserModules        7334
_conflict                            bss2               0211
_crc                                 bss2               0212
_crc_rom                             ramdata1           0100
_delay_10ms                          text               7C86
_hardware_init                       text               79A0
_id                                  bss2               0209
_main                                maintext           7D3C
_new_conflict                        rbit0              0000
_oo_busreset                         text               7C61
_oo_conversion_busy                  text               7C70
_oo_crc_init                         text               7CC3
_oo_crc_shuffle_byte                 text               7D19
_oo_print_data                       text               7B23
_oo_read_device                      text               7A11
_oo_read_scratchpad                  text               7C0A
_oo_report                           text               78E3
_oo_rx_byte                          text               7CE5
_oo_scratchpad                       bss2               0200
_oo_start_conversion                 text               79EF
_oo_tx_byte                          text               7CD1
_oo_wait_for_completion              text               7AEB
_print_header                        text               7BC2
_print_help                          text               78C5
_wTicker_ReadCompareValue            UserModules        787F
_wTicker_ReadCounter                 UserModules        7885
bCounter8_ltrx_ReadCompareValue      UserModules        7286
bCounter8_ltrx_ReadCounter           UserModules        7289
bGetPowerSetting                     PD_startup         7E8B
bLTRX_ReadRxData                     UserModules        7337
bLTRX_ReadRxStatus                   UserModules        733A
bLTRX_ReadTxStatus                   UserModules        7334
delay_10ms@counter                   fnauto             0015
intlevel0                            bss                0060
intlevel1                            bss                0060
intlevel2                            bss                0060
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
reset_vec                            vectors            0000
start                                vectors            0000
startup                              init               7E8E
wTicker_ReadCompareValue             UserModules        787F
wTicker_ReadCounter                  UserModules        7885
