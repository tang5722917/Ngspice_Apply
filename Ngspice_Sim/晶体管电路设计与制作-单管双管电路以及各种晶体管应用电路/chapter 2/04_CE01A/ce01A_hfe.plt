set termoption noenhanced
set title "ce01a.cir - 1 transitor circuit"
set xlabel "s"
set ylabel "V"
set grid lw 2
set logscale x 
set xrange [1.000000e+1:1.000000e+5]
#set logscale y 
set yrange [22e+00:28e+00]
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
set out 'ce01a_hfe.png'
replot
set term pop
replot
