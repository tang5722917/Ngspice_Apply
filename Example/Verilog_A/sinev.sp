Title: Simple Sinusoidal Source

.model sines sinev

N1 0 out sines    

.control
pre_osdi sinev.osdi
op
tran 0.01 10 
run
asciiplot V(out) > result.txt
.endc

.end
