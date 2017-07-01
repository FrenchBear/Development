# InitialBDClean
# Bulk initial cleaning of BD:
# Splits segments on " - " and space-trim them
# Segments T## are renamed ##
# Segments start with Uppercase, rest is lowercase
# 2016-09-22    PV
# 2016-10-09    PV  Réécriture avec os.walk de façon à inclure les sous-dossiers

import sys
import os
import re

# Where the correct filenames are
sourcePath = r"D:\Users\Pierre\Downloads\eMule\Incoming\Isabelle Aubret"

sourceFiles = []
destinationFiles = []
for root, directories, filenames in os.walk(sourcePath):
    for filename in filenames: 
        sourceFiles.append(os.path.join(root,filename))
        ts = filename.split(" - ")
        for i in range(len(ts)):
            ts[i] = ts[i].strip()
            if re.match(r"^T[0-9]{2}$", ts[i]):
                ts[i] = ts[i][1:]
            else:
                ts[i] = ts[i][0].upper() + ts[i][1:].lower()
        destinationFiles.append(os.path.join(root, " - ".join(ts)))


for sn, dn in zip(sourceFiles, destinationFiles):
    os.rename(sn, dn)
    print(sn, " --> ", dn)
    print()
