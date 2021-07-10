import os
import sys

print ('参数1:', str(sys.argv[1]))
print ('参数2:', str(sys.argv[2]))
print( str(os.getcwd()))
fl = open("test1",'w+')
fl.close()