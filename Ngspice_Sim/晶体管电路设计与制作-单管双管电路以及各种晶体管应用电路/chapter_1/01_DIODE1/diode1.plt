set termoption noenhanced
set title "Voltage Drive"
set xlabel "Voltage/V"
set ylabel "Current/A"
set grid lw 2 
unset logscale x 
set xrange [-8.000000e-01:8.000000e-01]
unset logscale y 
set yrange [-2.500000e-03:8.500000e-03]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 2
set format y "%g"
set format x "%g"
plot 'diode1.data' using 1:2 with lines lw 2 title "out"
set terminal push
set terminal png noenhanced
set out 'diode1.png'
replot
set term pop
replot
