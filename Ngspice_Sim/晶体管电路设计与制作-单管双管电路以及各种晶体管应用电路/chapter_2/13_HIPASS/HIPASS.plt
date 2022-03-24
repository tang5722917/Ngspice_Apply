set termoption noenhanced
set title "HIPASS - Sallen & Key HPF"
set xlabel "Frequency /Hz"
set ylabel "Gain /DB"
set logscale x 
set xrange [100:100000]
#set logscale y 
set yrange [-60:0]
set mytics 10
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
plot 'HIPASS.out' using 1:2 w lp lw 3 pt -1 title "HIPASS - Sallen & Key HPF"
set term pngcairo size 800,600
set term pngcairo font "Times New Roman,14"
set out 'HIPASS.png'
replot
set term pop
replot
