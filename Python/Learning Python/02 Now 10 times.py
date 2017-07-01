# Now 10 times.py
# Simple example of loop and import
# 2015-04-30    PV

from datetime import datetime
from time import sleep

i=0
while i<10:
    now=str(datetime.now())
    print(now)
    i=i+1
    sleep(1)
