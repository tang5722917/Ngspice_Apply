set termoption noenhanced
set title "CE00 frequency characteristic"
set xlabel "Frequency Hz"
set ylabel "Vo/Vs DB"
set grid lw 3 
unset logscale x 
set xrange [0.000000e+00:2.000000e-03]
unset logscale y 
set yrange [-6.000000e-01:1.260000e+01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set border lw 3
set format y "%g"
set format x "%g"
set label 1 "HFE=" at 0.0013,12 center textcolor rgb "#FF0000"
set label 2 "50" at 0.0014,12 center textcolor rgb "#FF0000"
set label 3 "100" at 0.0014,11.2 center textcolor rgb "#FF0000"
set label 4 "150" at 0.0014,10.4 center textcolor rgb "#FF0000"
set label 5 "200" at 0.0014,9.6 center textcolor rgb "#FF0000"
plot 'ce00a_hfe.data' using 1:2 with lines lw 3 title "tran1.v(3)",\
'ce00a_hfe.data' using 3:4 with lines lw 3 title "tran2.v(3)",\
'ce00a_hfe.data' using 5:6 with lines lw 3 title "tran3.v(3)",\
'ce00a_hfe.data' using 7:8 with lines lw 3 title "tran4.v(3)"
set terminal push
set terminal png noenhanced
set out 'ce00a_hfe.png'
replot
set term pop
replot
