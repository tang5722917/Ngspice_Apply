set termoption noenhanced
set title "EMF4 - 4 Tr Emitter follower THD sim"
set xlabel "Vout / Vrms"
set ylabel "THD / %"
set grid lw 2
set logscale x
set xrange [0.1:10]
set logscale y
set yrange [1e-8:0.1]
set border lw 3 
set format y "%g" 
set format x "%g"
plot '08_EMF4_THD_result.txt' using 1:2 with lines lw 2 title "Fre = 1000Hz" at graph 0.2,0.20 ,\
     '08_EMF4_THD_result.txt' using 3:4 with lines lw 2 title "Fre = 20Hz" at graph 0.2,0.25 ,\
     '08_EMF4_THD_result.txt' using 5:6 with lines lw 2 title "Fre = 20000Hz" at graph 0.2,0.30
set terminal push 
set terminal png noenhanced
set out '08_EMF4_THD.png'
replot 
set term pop 
replot 
pause mouse
