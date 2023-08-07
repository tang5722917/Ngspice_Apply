import os
import NG_process

def perform_ng(perform_list, perform_process):
    if(perform_process == 1):
        for perform_bash in perform_list:
            os.system(perform_bash)
    else:
        ng = NG_process.NG_process(perform_list,perform_process)
        ng.start()
