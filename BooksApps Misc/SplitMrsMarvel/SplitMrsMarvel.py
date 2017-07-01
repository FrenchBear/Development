# SplitMrsMarvel
# Example of system programming with Python
# Split Mrs Marvel archives
# 2016-07-12    PV

import sys
import re
from os import listdir, rename, makedirs
from os.path import isfile, join, exists
from datetime import datetime

# Where files are
#sourcePath = r"C:\Downloads\BD_A_Trier\Ms. Marvel v1"
## Files are named like "Ms. Marvel v1 001-009.jpg"
#p = re.compile(r"Ms\. Marvel v1 (\d\d\d).*", re.IGNORECASE)
#sourcePath = r"C:\Downloads\BD_A_Trier\Ms. Marvel v3"
## Files are named like "Ms. Marvel 005 003.jpg"
#p = re.compile(r"Ms\. Marvel (\d\d\d).*", re.IGNORECASE)
sourcePath=r"D:\Users\Pierre\Downloads\BD_A_Trier\Prince Valiant - 1937-1945"
# Files are named like "Prince Valiant Vol.09 002.jpg"
p = re.compile(r"Prince Valiant Vol\.(\d\d).*", re.IGNORECASE)
sourceFiles = [f for f in listdir(sourcePath) if isfile(join(sourcePath, f)) and p.match(f)]
sourceFiles.sort()
print(len(sourceFiles))

listNewFolders=[]
for f in sourceFiles:
    res = p.search(f)
    num = res.group(1)
    #newfolder = "Ms. Marvel v1 - "+num
    #newfolder = "Ms. Marvel v3 - "+num
    newfolder = "Prince Valiant - "+num
    if not newfolder in listNewFolders:
        print(newfolder)
        listNewFolders.append(newfolder)
        fullpath = join(sourcePath, newfolder)
        if not exists(fullpath): makedirs(fullpath)
    rename(join(sourcePath, f), join(fullpath, f))
