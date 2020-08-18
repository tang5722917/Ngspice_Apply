set termoption noenhanced
set title "TR_TEST1_I(bias)"
set xlabel "Voltage/V"
set ylabel "Current/A"
set grid lw 3 
unset logscale x 
set xrange [5.000000e-01:7.000000e-01]
unset logscale y 
set yrange [-3.000000e-06:6.300000e-05]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot 'tr_test1_i(bias).data' using 1:2 with lines lw 3 title "out1"
set terminal push
set terminal png noenhanced
set out 'tr_test1_i(bias).png'
replot
set term pop
replot
