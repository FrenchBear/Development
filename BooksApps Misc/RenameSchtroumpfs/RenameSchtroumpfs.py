# Rename Schtroumpfs
# Example of system Programmation with Python
# Take source names from sourceFiles, and renames files in destinationPath with the same names
# 2016-03-09    PV
# 2016-03-25    PV  .encode(sys.stdout.encoding, errors='replace') to avoid issue with special question mark unicode character
#                   See http://stackoverflow.com/questions/14630288/unicodeencodeerror-charmap-codec-cant-encode-character-maps-to-undefined
# 2016-08-24    PV  Cédric

import sys

from os import listdir, rename
from os.path import isfile, join

# Where the correct filenames are
#sourcePath = r"W:\BD\Classique\Les psy"
sourcePath = r"W:\BD\Classique\Cédric"
sourceFiles = [f for f in listdir(sourcePath) if isfile(join(sourcePath, f))]
sourceFiles.sort()

# Where the files to be renamed are
#destinationPath = r"D:\Users\Pierre\Downloads\Les Psy"
destinationPath = r"D:\Users\Pierre\Downloads\Cedric.Integrale.29.Tomes-PRESSECiTRON"
destinationFiles = [f for f in listdir(destinationPath) if isfile(join(destinationPath, f))]
destinationFiles.sort()

for sn, dn in zip(sourceFiles, destinationFiles):
    rename(join(destinationPath, dn), join(destinationPath, sn))
    print(dn.encode(sys.stdout.encoding, errors='replace'), " --> ", sn.encode(sys.stdout.encoding, errors='replace'))
