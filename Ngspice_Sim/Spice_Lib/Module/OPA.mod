*

.SUBCKT OPAMP3 NI INV OUT CMP VCC VEE
R1 VCC 1 30K
R2 CMP VEE 3.9K
R3 VCC OUT 2.2K
Q1 CMP NI 1 QA872A
Q2 VEE INV 1 QA872A
Q3 OUT CMP VEE QC1815 
.ENDS


.SUBCKT OPAMP5 NI INV OUT CMP VCC VEE
Q1 CMP NI 1 QA872A
Q2 VEE INV 1 QA872A
Q3 1 2 4 QA1015
D1 VCC 3 DS1588
D2 3 2 DS1588
R1 2 VEE 10K
R2 4 VCC 1.5K
R3 CMP VEE 3.9K
R4 2 5 470
R5 VCC 6 100
Q4 OUT CMP VEE QC1815
Q5 OUT 5 6 QA1015 
.ENDS