Title: Simple Verilog-A Capacitor

.model capacitor cap

N1 1 0 capacitor       
R1 1 2 1k
R2 2 0 1k
VS 1 0 AC 1

.control
pre_osdi Capacitor_test.osdi
op
ac DEC 10 1Meg 1G
run
let OutDB=DB(VM(2)/VM(1))
asciiplot V(OutDB) > result.txt
.endc

.end
