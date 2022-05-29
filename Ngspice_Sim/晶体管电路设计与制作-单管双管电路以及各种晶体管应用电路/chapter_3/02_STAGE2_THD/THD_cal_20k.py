filename = "STAGE2_THD_20k.CIR"
min_VIN = 0.01
max_VIN = 1
Change_num = 2

#被处理文件名
#SPATH = 'C:\\D\\Project\\Script\\PY\\PI_DDR_Netlist\\'

#文件夹路径
import os
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

# Generate and execute the netlsit
for i in range(0,Change_num):
    for j in range(0,len(sim_point)):
        target = open(SPATH+filename,'r')
        result = open(PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".cir.TEMP",'w')
        result.truncate()         #如果已存在该文件，则清空文件内容
        for data_line in target.readlines():
            if " fourier" in data_line :
                print("fourier 20000 V(8) > " + filename+"_"+str(i)+"_"+str(j)+".out.TEMP",file=result)
            elif  "Voltage_RMS.out" in data_line :
                print(" write Voltage_RMS" +"_"+str(i)+"_"+str(j)+ ".out.TEMP ymax" ,file=result)
            elif  " alterparam VIN" in data_line :
                print("alterparam VIN = "+ str(format(sim_point[j], '0.5f')) ,file=result)
            elif "*<Change>" in data_line:
                str_change_data = ' '
                if data_line.split() [1] == str(i+1 ) :
                    for data in data_line.split() [2:]:
                        str_change_data = str_change_data + " " + data
                    print(str_change_data, file=result )
            else:
                print(data_line.strip(),file=result)

        result.close()
        target.close()
        str_bash = 'ngspice -b -p -o '+ PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".log.TEMP "+PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".cir.TEMP"
        os.system(str_bash)

# Windows:  ngspice_con

#Get THD result
for i in range(0, Change_num ):
    for j in range(0,len(sim_point)):
        THD_result = open(PATH_EXE+filename.lower() +"_"+str(i)+"_"+str(j)+".out.temp",'r')
        for data_line in THD_result.readlines():
            if "THD:" in data_line :
                result_item.append(data_line.split() [4] )
        THD_RMS_result = open(PATH_EXE+"Voltage_RMS" +"_"+str(i)+"_"+str(j)+ ".out.TEMP",'r')
        line_num = 0
        for data_line in THD_RMS_result.readlines():
             line_num = line_num + 1
             if line_num == 12:
                result_item.append(data_line.split()[0] )
        result_list_I.append( result_item.copy() )
        result_item.clear()
        THD_result.close()
        THD_RMS_result.close()
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
