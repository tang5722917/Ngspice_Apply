set termoption noenhanced
set title "TR_TEST1_I(bias)"
set xlabel "Voltage/V"
set ylabel "Current/A"
set grid lw 3 
unset logscale x 
set xrange [4.000000e-01:8.000000e-01]
unset logscale y 
set yrange [-5.000000e-04:1.050000e-02]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
set label 1 "T=+100" at 0.55,0.005 center textcolor rgb "#FF0000"
set label 2 "+75" at 0.60,0.005 center textcolor rgb "#FF0000"
set label 3 "+50" at 0.65,0.005 center textcolor rgb "#FF0000"
set label 4 "+25" at 0.69,0.005 center textcolor rgb "#FF0000"
set label 5 "+0" at 0.73,0.005 center textcolor rgb "#FF0000"
plot 'tr_test2_i(bias).data' using 1:2 with lines lw 3 title "out2"
set terminal push
set terminal png noenhanced
set out 'tr_test2_i(bias).png'
replot
set term pop
replot
