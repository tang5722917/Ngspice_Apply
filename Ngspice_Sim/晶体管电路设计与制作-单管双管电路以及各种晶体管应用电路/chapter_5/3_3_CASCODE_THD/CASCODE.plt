set termoption noenhanced
set title "CASCODE - Wide freq range amp"
set xlabel "Vout / Vrms"
set ylabel "THD / %"
set grid lw 2
set logscale x
set xrange [0.1:10]
set logscale y
set yrange [0.0000001:0.1]
set border lw 3 
set format y "%g" 
set format x "%g"
plot 'CASCODE_result.txt' using 1:2 with lines lw 2 title "Fre = 20Hz" at graph 0.2,0.20 ,\
     'CASCODE_result.txt' using 3:4 with lines lw 2 title "Fre = 1000Hz" at graph 0.2,0.25 ,\
     'CASCODE_result.txt' using 5:6 with lines lw 2 title "Fre = 20000Hz" at graph 0.2,0.30
set terminal push 
set terminal png noenhanced
set out 'CASCODE.png'
replot 
set term pop 
replot 
pause mouse
