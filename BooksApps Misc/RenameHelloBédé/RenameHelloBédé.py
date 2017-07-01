# Rename Hello Bédé
# Example of system programming with Python
# File saved in utf-8 format since source code contains accents (not Visual Studio default)
# Rename some files
# 2016-05-11    PV

import sys
import re

from os import listdir, rename
from os.path import isfile, join

# Where files are
sourcePath = r"W:\BD\Revues\Hello Bédé"
#p = re.compile(r"Hello Bédé - 1991.*", re.IGNORECASE)
#p = re.compile(r"Hello Bédé - 1990.*", re.IGNORECASE)
p = re.compile(r"Hello Bédé - 1989.*", re.IGNORECASE)
sourceFiles = [f for f in listdir(sourcePath) if isfile(join(sourcePath, f)) and p.match(f)]
sourceFiles.sort()

#n=67
#n=15
n=1
for f in sourceFiles:
    g = "Hello Bédé n°{0:03d}".format(n) + f[10:]
    print(g)
    rename(join(sourcePath, f), join(sourcePath, g))
    n+=1
