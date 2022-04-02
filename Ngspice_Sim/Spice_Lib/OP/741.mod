.SUBCKT 741 1 2 3 4 5
* EWB Version 4 - 5 Terminal Opamp Model
* nodes: 3=+ 2=- 1=out 5=V+ 4=V-
* VCC= 15 VEE= -15 CC= 3e-011 A= 200000 RI= 2e+006
* RO= 75 VOS= 0.001 IOS= 2e-008 IBS= 8e-008
* VSW+= 14 VSW-= -14 CMMR= 90
* ISC= 0.025 SR= 0.5 Fu= 1e+006 Pm= 6.09112e-007
    VC 5 15 DC 1.68573V 
    VE 12 4 DC 1.68573V 
    IEE 10 4 DC 1.516e-005A
    R1  10  0 10Gohm 
    R6  11  0 100Kohm
    R7   5  4 1Kohm   
    Rc1  6  5 5305.16ohm  
    Rc2  5  7 5305.16ohm  
    Re1  9 10 1839.19ohm 
    Re2  8 10 1839.19ohm 
    Ro1  1 14 37.5ohm 
    Ro2 14  0 37.5ohm 
    Ree 10  0 1.31926e+007ohm 
    Rcc  0 13 2.20906e-005ohm 
    Cee  0 10 1e-012    
    Cc  14 11 3e-011    
    C1   6  7 1e-016    
    GA  11  0  6  7 0.000188496 
    GC   0 13  1  0 45268.1 
    GB  14  0 11  0 282.942 
    GCM  0 11 10  0 5.96075e-009 
    D1  14 13 Dopamp1 
    D2  13 14 Dopamp1 
    D3   1 15 Dopamp2 
    D4  12  1 Dopamp2 
    Qt1  6 2 9 Qopamp1 
    Qt2  7 3 8 Qopamp2 
.MODEL Dopamp1 D (Is=7.53769e-014A Rs=0 Cjo=0F Vj=750mV Tt=0s M=0)
.MODEL Dopamp2 D (Is=8e-016A Rs=0 Cjo=0F Vj=750mV Tt=0s M=0)
.MODEL Qopamp1 NPN (Is=8e-016A BF=83.3333 BR=960m
+       Rb=0ohm Re=0ohm Rc=0ohm Cjs=0F Cje=0F Cjc=0F
+       Vje=750m Vjc=750m Tf=0 Tr=0 mje=0 mjc=0 VA=50)
.MODEL Qopamp2 NPN (Is=8.30948e-016A BF=107.143 BR=960m
+       Rb=0ohm Re=0ohm Rc=0ohm Cjs=0F Cje=0F Cjc=0F
+       Vje=750m Vjc=750m Tf=0 Tr=0 mje=0 mjc=0 VA=50)
.ENDS
