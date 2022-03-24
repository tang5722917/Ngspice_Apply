set termoption noenhanced
set title "CE02F_THD - 1 transitor circuit"
set xlabel "Output Voltage Vrms /V"
set ylabel "THD /%"
set grid lw 2
set logscale x 
set xrange [0.01:2]
set logscale y 
set yrange [0.1:30]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
set mytics 0.1
plot 'THD Data.out' using 1:2 w lp pt 4 title "HFE = 170"

set terminal push
set terminal png noenhanced
set out 'CE02F_THD.png'
replot
set term pop
replot
