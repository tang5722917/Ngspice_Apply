'''
Author: Donald Duck tang5722917@163.com
Date: 2022-08-15 03:22:30
LastEditors: Donald duck tang5722917@163.com
LastEditTime: 2024-06-25 11:05:21
Description: Python script for AC sim
             V02 -- Add the generate gnuplot script (.plt) file
                 -- Add initial netlist .control (...) .endc  instruction
Copyright (c) 2022 by Donald Duck tang5722917@163.com, All Rights Reserved. 
'''

# Netlist 文件名
filename = "CASCODE"
# 电路变量个数
Change_num = 2
# 电路变量列表
Change_list = ["w/ NFB","w/o NFB"]
# AC仿真参数
AC_sim_para = "ac DEC 20 10 100MEG"
# 输入电路节点
Vout_name = "OUT"
# 输出电路节点
Vin_name = "1"

# Gnuplot 设置
# xy轴label
ylabel_name = "AC /dB"
xlabel_name = "Fre / Hz"
# xy轴坐标值  0：线性坐标 1：对数坐标
xvalue_setting = 1
yvalue_setting = 0
# xy轴坐标范围
xvalue = "[1e+1:1e+8]"
yvalue = "[-100:100]"
# plot 曲线备注
plot_title_change_name = ""
plot_title_change_unit = ""
plot_title_start_pointx = 0.4
plot_title_start_pointy = 0.4


#被处理文件名
#SPATH = 'C:\\D\\Project\\Script\\PY\\PI_DDR_Netlist\\'

#文件夹路径
import os
import os.path


SPATH = os.getcwd()+'/'


result_list = list()
result_list_I = list()
result_item = list()
if not os.path.exists("TEMP"):     #判断当前路径是否存在，没有则创建new文件夹
    os.makedirs("TEMP")
PATH_EXE = SPATH + "TEMP/"
os.chdir(PATH_EXE )         #改变当前目录
target = open(SPATH+filename+'.CIR','r') # 打开初始Netlist
Title_line = target.readline()  # 获得Netlist 第一行（Netlist 标题)
control_setting = 0
# Generate and execute the netlsit
    # Generate and execute the netlsit
for i in range(0,Change_num):
    target.seek(0,0)   #回到文件开头
    result = open(PATH_EXE+filename+"_"+str(i)+".cir.TEMP",'w')
    result.truncate()         #如果已存在该文件，则清空文件内容
    for data_line in target.readlines():
        if ".control" in data_line:
            control_setting = 1
        elif ".end" in data_line:
            control_setting = 0
        elif control_setting == 1:
            continue
        elif "*<Change>" in data_line:
            str_change_data = ' '
            if data_line.split() [1] == str(i+1 ) :
                for data in data_line.split() [2:]:
                    str_change_data = str_change_data + " " + data
                print(str_change_data, file=result )
        else:
            print(data_line.strip(),file=result)
    print(".control \nrun \nop \n*Output format Control \n"+ AC_sim_para,file=result)
    print("let OutDB=DB(VM("+Vout_name+")/VM("+Vin_name+"))",file=result)
    print("wrdata " + filename+"_"+str(i)+".out.TEMP  ac1.OutDB   ;Print AC data ",file=result)
    print(".endc \n.end" ,file=result)
    result.close()
    str_bash = 'ngspice -b -p -o '+ PATH_EXE+filename+"_"+str(i)+".log.TEMP "+PATH_EXE+filename+"_"+str(i)+".cir.TEMP"
    os.system(str_bash)
target.close()

# Windows:  ngspice_con

#Merge AC result
for i in range(0, Change_num ):
    AC_result = open(PATH_EXE+filename+"_"+str(i)+".out.TEMP",'r')
    for data_line in AC_result.readlines():
        result_item.append (data_line.split()[0])
        result_item.append (data_line.split()[1])
        result_list_I.append(result_item.copy() )
        result_item.clear()
    result_list.append (result_list_I.copy() )
    result_list_I.clear()
    AC_result.close()
result_output_data = open(SPATH+filename+"_result.txt",'w')
result_output_data.truncate()         #如果已存在该文件，则清空文件内容
out_line = ''

for i in range(0,len(result_list[0])):
    for j in range(0, Change_num ):
        out_line = out_line + result_list[j][i][0] + ' ' + result_list[j][i][1] + ' '
    print(out_line ,file=result_output_data)
    out_line = ''
result_output_data.close()

#Gnuplot Script Generate
gnuplot_f = open(SPATH+filename+".plt",'w')
gnuplot_f.truncate()         #如果已存在该文件，则清空文件内容
print("set termoption noenhanced",file=gnuplot_f)
print('set title "'+ Title_line.strip() +'\"' ,file=gnuplot_f)
print('set xlabel "'+ xlabel_name + '"\nset ylabel "'+ ylabel_name +'"\nset grid lw 2',file=gnuplot_f)
if xvalue_setting == 1 :
    print("set logscale x",file=gnuplot_f)
print("set xrange " + xvalue,file=gnuplot_f)
if yvalue_setting == 1 :
    print("set logscale y",file=gnuplot_f)
print("set yrange " + yvalue,file=gnuplot_f)
print('set border lw 3 \nset format y "%g" \nset format x "%g"',file=gnuplot_f)

for i in range(0,Change_num ):
    if i ==0 :
        print("plot '"+filename+"_result.txt"+"' using "+str(i*2+1)+':'+str(i*2+2)+' with lines lw 2 title "'+plot_title_change_name+ str(Change_list[i])+plot_title_change_unit+'" at graph '+str(plot_title_start_pointx)+","+"{:.2f}".format(plot_title_start_pointy+0.05*i)+' ,\\',file=gnuplot_f)
    elif i == Change_num -1:
        print("     '"+filename+"_result.txt"+"' using "+str(i*2+1)+':'+str(i*2+2)+' with lines lw 2 title "'+plot_title_change_name+ str(Change_list[i])+plot_title_change_unit+'" at graph '+str(plot_title_start_pointx)+","+"{:.2f}".format(plot_title_start_pointy+0.05*i),file=gnuplot_f)
    else :
        print("     '"+filename+"_result.txt"+"' using "+str(i*2+1)+':'+str(i*2+2)+' with lines lw 2 title "'+plot_title_change_name+ str(Change_list[i])+plot_title_change_unit+'" at graph '+str(plot_title_start_pointx)+","+"{:.2f}".format(plot_title_start_pointy+0.05*i)+' ,\\',file=gnuplot_f)
print("set terminal push \nset terminal png noenhanced",file=gnuplot_f)
print("set out '"+ filename +".png'",file=gnuplot_f)
print("replot \nset term pop \nreplot \npause mouse",file=gnuplot_f)
gnuplot_f.close()
os.chdir(SPATH)   
str_bash = 'gnuplot '+ SPATH + filename+".plt"
os.system(str_bash)
