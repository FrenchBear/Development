# ReadFile.py
# Reads file whose name is passed as an argument
# 2015-04-30    PV

import sys

if (len(sys.argv)!=2):
    print("Usage: python ReadFile.py filename")
    sys.exit()

scriptname=sys.argv[0]
filename=sys.argv[1]

file=open(filename)   # mode "r" is default
lines=file.readlines()
file.close()

lc=0
for line in lines:
    print(line, end='')
    lc=lc+1
print("\n"+str(lc)+" line(s)")
