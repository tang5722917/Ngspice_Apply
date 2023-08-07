
from multiprocessing import  Process, Pool
import os
def perform_sim(perform_bash):
        #os.system(perform_bash)
    print(perform_bash + "Ngspice Run PID:"+os.getpid())

class NG_process(object):
    def __init__(self,perform_list,perform_process):
        self.perform_list = perform_list
        self.perform_process = perform_process
        self.pool = Pool(self.perform_process)    #创建进程池
        

        
    def start(self):
        if __name__=='__main__':
            for i in range(10):
                self.pool.apply_async(func=perform_sim, args=(i,))
            self.pool.close()
            self.pool.join()
            print("Finish Ngspice Sim")
