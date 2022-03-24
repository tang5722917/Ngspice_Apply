filename = "STAGE2_THD.CIR"
min_VIN = 0.01
max_VIN = 0.1

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
    


if not os.path.exists("TEMP"):     #判断当前路径是否存在，没有则创建new文件夹
    os.makedirs("TEMP")
PATH_EXE = SPATH + "/TEMP/"
os.chdir(PATH_EXE )         #改变当前目录
for i in range(0,1):
    for j in range(0,len(sim_point)):
        target = open(SPATH+filename,'r')
        result = open(PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".cir.TEMP",'w')
        result.truncate()         #如果已存在该文件，则清空文件内容
        for data_line in target.readlines():
            if " fourier" in data_line :
                print("fourier 1000 V(8) > " + filename+"_"+str(i)+"_"+str(j)+".out.TEMP",file=result)
            elif  "Voltage_RMS.out" in data_line :
                print(" write Voltage_RMS" +"_"+str(i)+"_"+str(j)+ ".out.TEMP ymax" ,file=result)
            elif  " alterparam VIN" in data_line :
                print("alterparam VIN = "+ str(format(sim_point[j], '0.5f')) ,file=result)
            else:
                print(data_line.strip(),file=result)
        result.close()
        target.close()
        str_bash = 'ngspice_con -b -p -o '+ PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".log.TEMP "+PATH_EXE+filename+"_"+str(i)+"_"+str(j)+".cir.TEMP"
        os.system(str_bash)