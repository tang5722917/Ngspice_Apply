set termoption noenhanced
set title "IC_VCE"
set xlabel "V(CE) Voltage/V"
set ylabel "I(CE) Current/A"
set grid lw 3 
unset logscale x 
set xrange [0.000000e+00:5.000000e+00]
unset logscale y 
set yrange [-3.000000e-04:6.300000e-03]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
set label 1 "IB=10mA" at 3.5,0.0012 center textcolor rgb "#FF0000"
set label 2 "IB=20mA" at 3.5,0.0022 center textcolor rgb "#FF0000"
set label 3 "IB=30mA" at 3.5,0.0032 center textcolor rgb "#FF0000"
set label 4 "IB=40mA" at 3.5,0.0042 center textcolor rgb "#FF0000"
plot 'ic_vce.data' using 1:2 with lines lw 3 title "out"
set terminal push
set terminal png noenhanced
set out 'ic_vce.png'
replot
set term pop
replot
