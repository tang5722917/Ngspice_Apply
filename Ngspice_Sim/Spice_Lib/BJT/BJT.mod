*

.MODEL QC1815 NPN(IS=1E-14 BF=170 xtb=1.7
+                 BR=3.6 VA=100 RB=50 RC=0.76
+                 IK=0.25 CJC=4.8P CJE=18P TF=0.5N TR=20N)

.model QC1844 NPN ( IS=8.5E-14 BF=400 
+                  XTB=1.7 RB=24 TF=0.7N TR=28N 
+                  CJE=25P CJC=11.7P IK=0.1 VA=100)

.model Q2sc1906 NPN(Is=269.4f Xti=3 Eg=1.11 Vaf=100 Bf=162.8 Ise=6.41p Ne=1.559
+               Ikf=.32 Nk=1.108 Xtb=1.5 Var=100 Br=1 Isc=0 Nc=2 Ikr=0 Rc=0
+               Cjc=2.429p Mjc=.3333 Vjc=.75 Fc=.5 Cje=5p Mje=.3333 Vje=.75
+               Tr=10n Tf=114.1p Itf=.4325 Xtf=114.2 Vtf=10)
**
*
.model QC2240 NPN( IS=6.3E-14 BF=400
+      XTB=1.7 RB=20 TF=0.7NS TR=28NS
+      CJE=44PF CJC=7.6PF VAF=200)
**
*
*************   2SC3381 （Dual-Tr, VCBO=80V 
*                   IC=100mA  PC=200mW/unit)
.model QC3381 NPN ( IS=1E-14  IK=0.1 
+                    XTB=1.7 BF=400 RB=20 TF=0.9N 
+                    TR=36N CJE=34P CJC=18P VAF=100
+)

.MODEL QC2602 NPN ( IS=1.7E-13 BF=500 XTB=1.7
+                 VA=100 IK=0.3 RB=3 CJC=21P 
+                 CJE=80P TF=0.9N TR=36N )


.model QA1015 PNP( IS=1.4E-14 BF=170
+      BR=10  VA=100  IK=0.22 RB=30
+      RC=1.4  XTB=1.3  CJC=11p
+      CJE=12p  TF=0.63n  TR=25n)

*2SA1114(VCBO=70V,IC=200ma,PC=500mW)
.model QA1114 PNP (IS=1.7E-13 BF=500
+                  VA=100 IK=0.3 RB=2 XTB=1.7 
+                  CJC=32P CJE=59P TF=1.5N TR=60N
+)

.model QA872A PNP (IS=1.5E-14 BF=500
+                    RB=200  XTB=1.4 TF=1.3N TR=52N
+                    CJE=5P CJC=6.6P IK=0.025 VAF=150
+)

.model QA991 PNP ( IS=4.5E-14 BF=400
+                  XTB=1.4 RB=24 TF=0.7N TR=28N 
+                  CJE=24P CJC=29P IK=0.1 VA=100
) 
