set termoption noenhanced
set title "EMF1F_THD - 1 transitor circuit"
set xlabel "Output Voltage Vrms /V"
set ylabel "THD /%"
set grid lw 2
set logscale x 
set xrange [0.01:4]
set logscale y 
set yrange [0.001:1]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
set mytics 0.1
plot 'THD Data.out' using 1:2 w lp pt 4 title "Transitor emitter followe"

set terminal push
set terminal png noenhanced
set out 'EMF1F_THD.png'
replot
set term pop
replot
