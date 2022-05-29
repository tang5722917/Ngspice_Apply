*

.MODEL QC1815 NPN(IS=1E-14 BF=170 xtb=1.7
+                 BR=3.6 VA=100 RB=50 RC=0.76
+                 IK=0.25 CJC=4.8P CJE=18P TF=0.5N TR=20N)

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
.model QA1015 PNP( IS=1.4E-14 BF=170
+      BR=10  VA=100  IK=0.22 RB=30
+      RC=1.4  XTB=1.3  CJC=11p
+      CJE=12p  TF=0.63n  TR=25n)