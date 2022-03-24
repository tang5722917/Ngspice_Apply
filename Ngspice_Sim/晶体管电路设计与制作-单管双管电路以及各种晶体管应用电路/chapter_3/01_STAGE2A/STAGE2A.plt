set termoption noenhanced
set title "STAGE2A.CIR - Common emitter+common collector"
set xlabel "Frequency /Hz"
set ylabel "Gain /DB"
set grid lw 2
set logscale x 
set xrange [1.000000e+1:4.000000e+6]
#set logscale y 
set yrange [13e+00:28e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot 'STAGE2A_ac1.out' using 1:2 with lines lw 3 title "Without Boost",\
     'STAGE2A_ac2.out' using 1:2 with lines lw 3 title "With Boost"
set terminal push
set terminal png noenhanced
set out 'STAGE2A.png'
replot
set term pop
replot
pause mouse
