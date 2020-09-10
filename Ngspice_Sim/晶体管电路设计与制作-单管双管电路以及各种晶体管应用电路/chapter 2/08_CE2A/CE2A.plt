set termoption noenhanced
set title "ce02.cir - 1 transitor circuit"
set xlabel "s"
set ylabel "V(7) /V"
set grid lw 2
set logscale x 
set xrange [1.000000e+01:1.000000e05]
#set logscale y 
set yrange [34:48]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot 'SweepAC_HFE.out' using 1:2 with lines lw 3 title "HFE = 120",\
     'SweepAC_HFE.out' using 3:4 with lines lw 3 title "HFE = 170",\
	 'SweepAC_HFE.out' using 5:6 with lines lw 3 title "HFE = 240"
set terminal push
set terminal png noenhanced
set out 'CE02A.png'
replot
set term pop
replot
