
#Author: Donald duck tang5722917@163.com
#Date: 2023-06-28 11:23:23
#LastEditors: Donald duck tang5722917@163.com
#LastEditTime: 2023-06-28 12:10:32
#FilePath: \Ngspice_Sim\晶体管电路设计与制作-单管双管电路以及各种晶体管应用电路\chapter_5\1_2_PWM_THD\THD_cal_V021.py
#Description: 
#             V02  -- Add the generate gnuplot script (.plt) file
#                  -- Add initial netlist .control (...) .endc  instruction
#             V02_1-- Add different fourier frequency 
#             V02_2-- add env setting file /multi-process support
#Copyright (c) 2023 by Donald duck email: tang5722917@163.com, All Rights Reserved.
import os
import time
class Ng_process(object):
    def __init__(self,ng_perform):
        self.ng_perform = ng_perform

    def work(self, perform_bash):
        start = time.time()
        os.system(perform_bash)
        end = time.time()
        return 'Task %s runs %0.2f seconds.' % (os.getpid(), (end - start))

    @staticmethod
    def call_back(res):
        print(f'Perform Ngspice sim: {res}')

    @staticmethod
    def err_call_back(err):
        print(f'出错啦~ error：{str(err)}')


if __name__ == '__main__':
    import platform
    from  multiprocessing import Process,Pool
    if(platform.system() == "Windows"):
        sim_ng = "ngspice_con"
    else:
        sim_ng = "ngspice"
    import configparser
    config = configparser.ConfigParser()

    try:
        config.read('../../../../PY/python.env')
        #env setting
        #gnuplot_path = config['SYS_ENV']['gnuplot_path']
        gnuplot_path = "gnuplot"
        multi_process =int(config['SYS_ENV']['multi-process'])
    except:
        multi_process = 1

    # Netlist 文件名
    filename = "CASCODE"
    # THD 测试输入电压范围
    min_VIN = 0.01
    max_VIN = 1
    # 电路变量个数
    Change_num = 3
    Change_list = ["20","1000","20000"]
    # 观测节点 
    Node = 'V(OUT)'
    # x轴含义  0：输入电压RMS 1：输出电压RMS
    xlabel_setting = 1

    # Gnuplot 设置
    # xy轴label
    xlabel_name = "Vout / Vrms"
    ylabel_name = "THD / %"
    # xy轴坐标值  0：线性坐标 1：对数坐标
    xvalue_setting = 1
    yvalue_setting = 1
    # xy轴坐标范围
    xvalue = "[0.1:10]"
    yvalue = "[0.0000001:0.1]"
    # plot 曲线备注
    plot_title_change_name = "Fre"
    plot_title_change_unit = "Hz"
    plot_title_start_pointx = 0.2
    plot_title_start_pointy = 0.2

    #文件夹路径
    import os.path
    SPATH = os.getcwd()+'/'
    tempVIN1 = min_VIN
    tempVIN2 = min_VIN
    sim_point = list() 
    sim_point.append(tempVIN1)
    while ( tempVIN1 <= max_VIN - tempVIN2 ):
        for i in range(1,10):
            tempVIN1 = tempVIN1+tempVIN2
            sim_point.append(tempVIN1)
        tempVIN2 = 10 * tempVIN2

    
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
    perform_list = list()
    # Generate and execute the netlsit
    for i in range(0,Change_num):
        for j in range(0,len(sim_point)):
            target.seek(0,0)   #回到文件开头
            result = open(PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".cir.TEMP",'w')
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
            print(".control \nlet ymax = 0" ,file=result)
            print("alterparam VIN = "+ str(format(sim_point[j], '0.5f')) ,file=result)
            print("reset \nrun" ,file=result)
            print("meas tran ymax RMS "+ Node +" from=0 to=10m",file=result)
            print("set filetype = ascii" ,file=result)
            print("write Voltage_RMS" +"_"+str(i)+"_"+str(j)+ ".out.TEMP ymax" ,file=result)
            print("set appendwrite" ,file=result)
            
            print("fourier "+Change_list[i]+" "+ Node +" > " + filename+"_"+str(i)+"_"+str(j)+".out.TEMP",file=result)
            
            print(".endc \n.end" ,file=result)
            result.close()
    # Windows:  ngspice_con
            str_bash = sim_ng + ' -b -p -o '+ PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".log.TEMP "+PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".cir.TEMP"
            perform_list.append(str_bash)
    target.close()
    # ngspice 执行
    if(multi_process == 1):
        for perform_bash in perform_list:
            os.system(perform_bash)
    else:
        ng_process = Ng_process(perform_list)
        pool = Pool(multi_process)
        for sim in perform_list:
            pool.apply_async(
                ng_process.work,
                args=(sim,),
                callback=ng_process.call_back,
                error_callback=ng_process.err_call_back
            )
        pool.close()
        pool.join()

        print('结束测试')
        
    #Get THD result
    for i in range(0, Change_num ):
        for j in range(0,len(sim_point)):
            THD_result = open(PATH_EXE+filename.lower() +"_"+str(i)+"_"+str(j)+".out.temp",'r')
            for data_line in THD_result.readlines():
                if "THD:" in data_line :
                    result_item.append(data_line.split() [4] )
            if xlabel_setting == 1:
                THD_RMS_result = open(PATH_EXE+"Voltage_RMS" +"_"+str(i)+"_"+str(j)+ ".out.TEMP",'r')
                line_num = 0
                for data_line in THD_RMS_result.readlines():
                    line_num = line_num + 1
                    if line_num == 12:
                        result_item.append(data_line.split()[0] )
                THD_RMS_result.close()
            elif xlabel_setting == 0:
                result_item.append("{:.5f}".format(sim_point[j]/1.4142))
            result_list_I.append( result_item.copy() )
            result_item.clear()
            THD_result.close()
        result_list.append (result_list_I.copy() )
        result_list_I.clear()

    result_output_data = open(SPATH+filename+"_result.txt",'w')
    result_output_data.truncate()         #如果已存在该文件，则清空文件内容
    out_line = ''
    for i in range(0,len(sim_point)):
        for j in range(0, Change_num ):
            out_line = out_line + result_list[j][i][1] + ' ' + result_list[j][i][0] + ' '
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

    for i in range(0,Change_num):
        if (i==0) & (Change_num == 1) :
            print("plot '"+filename+"_result.txt"+"' using "+str(i*2+1)+':'+str(i*2+2)+' with lines lw 2 title "'+plot_title_change_name+' = '+ str(Change_list[i])+plot_title_change_unit+'" at graph '+str(plot_title_start_pointx)+","+"{:.2f}".format(plot_title_start_pointy+0.05*i) ,file=gnuplot_f)
        elif i ==0 :
            print("plot '"+filename+"_result.txt"+"' using "+str(i*2+1)+':'+str(i*2+2)+' with lines lw 2 title "'+plot_title_change_name+' = '+ str(Change_list[i])+plot_title_change_unit+'" at graph '+str(plot_title_start_pointx)+","+"{:.2f}".format(plot_title_start_pointy+0.05*i)+' ,\\',file=gnuplot_f)
        elif i == Change_num-1:
            print("     '"+filename+"_result.txt"+"' using "+str(i*2+1)+':'+str(i*2+2)+' with lines lw 2 title "'+plot_title_change_name+' = '+ str(Change_list[i])+plot_title_change_unit+'" at graph '+str(plot_title_start_pointx)+","+"{:.2f}".format(plot_title_start_pointy+0.05*i),file=gnuplot_f)
        else :
            print("     '"+filename+"_result.txt"+"' using "+str(i*2+1)+':'+str(i*2+2)+' with lines lw 2 title "'+plot_title_change_name+' = '+ str(Change_list[i])+plot_title_change_unit+'" at graph '+str(plot_title_start_pointx)+","+"{:.2f}".format(plot_title_start_pointy+0.05*i)+' ,\\',file=gnuplot_f)
    print("set terminal push \nset terminal png noenhanced",file=gnuplot_f)
    print("set out '"+ filename +".png'",file=gnuplot_f)
    print("replot \nset term pop \nreplot \npause mouse",file=gnuplot_f)
    gnuplot_f.close()
    os.chdir(SPATH)   
    str_bash = gnuplot_path+" " +SPATH + filename+".plt"
    os.system(str_bash)
    