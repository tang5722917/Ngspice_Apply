set termoption noenhanced
set title "stage2b - NPN + PNP"
set xlabel "R6 /k Ohm"
set ylabel "THD/%"
set grid lw 2
set logscale x 
set xrange [1:40]
set logscale y 
set yrange [0.001:0.04]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot '03_STAGE2B_THD_R6.CIR_result.txt' using 1:2 with lines lw 3 title "THD  Different value of R6" ,\
    
set terminal push
set terminal png noenhanced
set out '03_STAGE2B_THD_R6.png'
replot
set term pop
replot
pause mouse
