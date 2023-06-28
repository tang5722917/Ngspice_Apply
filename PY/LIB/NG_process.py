from multiprocessing import  Process
import os


class NG_process:
    p = Process()
    
    def __init__(self,perform_list):
        self.p = Process(target=self.perform_sim,args=(perform_list,))
    def start(self):
        self.p.start()

    def perform_sim(self,perform_list):
        
        for perform_bash in perform_list:
            os.system(perform_bash)
        self.p.join()
