set termoption noenhanced
set title "Current Drive"
set xlabel "Voltage/V"
set ylabel "Current/A"
set grid lw 3 
unset logscale x 
set xrange [0.000000e+00:1.200000e-02]
unset logscale y 
set yrange [1.700000e-01:8.300000e-01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot 'diode2.cir.data' using 1:2 with lines lw 3 title "out"
set terminal push
set terminal png noenhanced
set out 'diode2.cir.png'
replot
set term pop
replot
