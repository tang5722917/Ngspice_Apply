set termoption noenhanced
set title "ce01.cir - 1 transitor circuit"
set xlabel "s"
set ylabel "V"
set grid lw 2
#set logscale x 
set xrange [0.000000e+00:2.000000e-03]
#set logscale y 
set yrange [1e+00:5e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot 'Sweep_HFE.out' using 1:2 with lines lw 3 title "HFE = 120",\
     'Sweep_HFE.out' using 3:4 with lines lw 3 title "HFE = 170",\
	 'Sweep_HFE.out' using 5:6 with lines lw 3 title "HFE = 240"
set terminal push
set terminal png noenhanced
set out 'ce01_hfe.png'
replot
set term pop
replot
