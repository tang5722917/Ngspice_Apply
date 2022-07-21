set termoption noenhanced
set title "emf2 - NPN + PNP 2 stage emitter follower AC/R3"
set xlabel "Frequency /Hz"
set ylabel "Gain /DB"
set grid lw 2
set logscale x 
set xrange [10:1000000000]
#set logscale y 
set yrange [-60e+00:0e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot '05_EMF2_AC_result.txt' using 1:2 with lines lw 2 title "R3 :1 Ohm" at graph 0.5,0.5 ,\
     '05_EMF2_AC_result.txt' using 3:4 with lines lw 2 title "R3 :100 Ohm" at graph 0.5,0.55,\
     '05_EMF2_AC_result.txt' using 5:6 with lines lw 2 title "R3 :330 Ohm" at graph 0.5,0.6  

set terminal push
set terminal png noenhanced
set out '05_EMF2_AC.png'
replot
set term pop
replot
pause mouse
