'''
Author: Donald Duck tang5722917@163.com
Date: 2022-08-15 03:22:30
LastEditors: Donald Duck tang5722917@163.com
LastEditTime: 2022-08-15 23:41:18
FilePath: /Ngspice_Apply/Ngspice_Sim/晶体管电路设计与制作-单管双管电路以及各种晶体管应用电路/chapter_4/05_VOLUME_WAVE/WAVE_VC.py
Description: Python script for Tran sim

Copyright (c) 2022 by Donald Duck tang5722917@163.com, All Rights Reserved. 
'''
filename = "05_VOLUME_Wave"
Change_list = ["0","2","3","4","6","8"]

Change_num = 1

#被处理文件名
#SPATH = 'C:\\D\\Project\\Script\\PY\\PI_DDR_Netlist\\'

#文件夹路径
import os
import os.path
import csv


SPATH = os.getcwd()+'/'
'''
tempVIN1 = min_VIN
tempVIN2 = min_VIN
sim_point = list() 
sim_point.append(tempVIN1)
while ( tempVIN1 <= max_VIN - tempVIN2 ):
    for i in range(1,10):
        tempVIN1 = tempVIN1+tempVIN2
        sim_point.append(tempVIN1)
    tempVIN2 = 10 * tempVIN2
'''    
result_list = list()
result_list_I = list()
result_item = list()
if not os.path.exists("TEMP"):     #判断当前路径是否存在，没有则创建new文件夹
    os.makedirs("TEMP")
PATH_EXE = SPATH + "TEMP/"
os.chdir(PATH_EXE )         #改变当前目录

# Generate and execute the netlsit
for i in range(0,Change_num):
    for j in range(0,len(Change_list)):
        target = open(SPATH+filename+'.CIR','r')
        result = open(PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".cir.TEMP",'w')
        result.truncate()         #如果已存在该文件，则清空文件内容
        for data_line in target.readlines():
            if "PYTHON_ac1.out.temp" in data_line :
                print("wrdata " + filename+"_"+str(i)+"_"+str(j)+".out.TEMP  tran1.OUT   ;Print AC data ",file=result)
            elif "*<Change>" in data_line:
                str_change_data = ' '
                if data_line.split() [1] == str(i+1 ) :
                    for data in data_line.split() [2:]:
                        if "<Value>" in data : 
                            str_change_data = str_change_data + " " + Change_list[j]
                        else :
                            str_change_data = str_change_data + " " + data
                        
                    print(str_change_data, file=result )
            else:
                print(data_line.strip(),file=result)

        result.close()
        target.close()
        str_bash = 'ngspice -b -p -o '+ PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".log.TEMP "+PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".cir.TEMP"
        os.system(str_bash)

# Windows:  ngspice_con

#Merge AC result
for i in range(0, Change_num ):
    for j in range(0,len(Change_list)):
        WAVE_result = open(PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".out.TEMP",'r')
        for data_line in WAVE_result.readlines():
            result_item.append (data_line.split()[0])
            result_item.append (data_line.split()[1])
            result_list_I.append(result_item.copy() )
            result_item.clear()
        result_list.append (result_list_I.copy() )
        result_list_I.clear()

result_output_data = open(SPATH+filename+"_result.txt",'w')
result_output_data.truncate()         #如果已存在该文件，则清空文件内容
out_line = ''
outputdata = list()
outputdata_I= list()
crow_num= list()
for i in range(0, (Change_num *  len(Change_list)) ):
    crow_num.append(len(result_list[i]))
for i in range(0,max(crow_num)):
    for j in range(0,(Change_num *  len(Change_list))):
        if i < crow_num[j]:    
            outputdata_I.append(result_list[j][i][0])
            outputdata_I.append(result_list[j][i][1])
        else: 
            outputdata_I.append("")
            outputdata_I.append("")
    outputdata.append(outputdata_I.copy())
    outputdata_I.clear()
    out_line = ''
writer = csv.writer( result_output_data,delimiter=' ' )
writer.writerows(outputdata)
result_output_data.close()
