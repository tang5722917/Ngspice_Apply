set encoding utf8
set termoption noenhanced
set title "Inverse current characteristic"
set xlabel "IB(Q1) A"
set ylabel "IE(Q1) A"
set grid
unset logscale x 
set xrange [0.000000e+00:1.000000e-03]
unset logscale y 
set yrange [-2.000000e-04:4.200000e-03]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'inverse.data' using 1:2 with lines lw 3 title "i(vmess)"
set terminal push
set terminal png noenhanced
set out 'inverse.png'
replot
set term pop
replot
