# Write log.py
# Simple example writing a text file
# 2015-04-30    PV

from datetime import datetime
import random

log = open("log.txt", "w")

for i in range(5):
    now=str(datetime.now())
    data=random.randint(0,1000)
    log.write(now+"\t"+str(data)+"\n")
    print(".")

log.flush()
log.close()
