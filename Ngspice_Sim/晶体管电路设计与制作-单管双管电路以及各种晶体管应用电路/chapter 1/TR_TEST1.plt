set termoption noenhanced
set y2label
set y2range [-1e-05:7e-05]
set yrange [-0.001:0.007]
set xrange [0.5:0.7]
set y2tics
set title "TR_TEST1 - IB vs VBE, IC vs VBE, IC vs IB"
set xlabel "V(VBbias) Voltage/V"
set ylabel "I(C) Current/A"
set y2label "I(VBbias) Current/A"
plot "tr_test1_i(c).data" axis x1y1,"tr_test1_i(bias).data" axis x1y2
set term pngcairo lw 2 font "Times New Roman,8"
set output "TR_TEST1_I.png"
set grid
plot "tr_test1_i(c).data" axis x1y1,"tr_test1_i(bias).data" axis x1y2