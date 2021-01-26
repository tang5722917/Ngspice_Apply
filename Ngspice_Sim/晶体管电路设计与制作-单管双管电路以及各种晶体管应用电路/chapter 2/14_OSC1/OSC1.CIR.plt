set termoption noenhanced
set title "OSC1.CIR - Twin_T type Oscillator"
set xlabel "s"
set ylabel "V(5) /V"
set grid lw 2
#set logscale x 
set xrange [0.000000e+00:10.000000e-03]
#set logscale y 
set yrange [0:15]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot 'OSC1.out' using 1:2 with lines lw 3 title "TEMP = 0 C",\
     'OSC1.out' using 3:4 with lines lw 3 title "TEMP = 50 C"
set terminal push
set terminal png noenhanced
set out 'OSC1.png'
replot
set term pop
replot
pause mouse
