# RenameTimeMagazine
# Example of system programming with Python
# Rename some files
# 2016-05-20    PV

import sys
import re
from os import listdir, rename
from os.path import isfile, join
from datetime import datetime

# Where files are
sourcePath = r"C:\Temp\Time Magazine"
# Files are named like "03. Time - 02 February 2015 .pdf"
p = re.compile(r"\d\d\. Time - (.*) .*", re.IGNORECASE)
sourceFiles = [f for f in listdir(sourcePath) if isfile(join(sourcePath, f)) and p.match(f)]
#sourceFiles.sort()

for f in sourceFiles:
    res = p.search(f)
    datestring = res.group(1)
    # see http://stackoverflow.com/questions/466345/converting-string-into-datetime
    # see https://docs.python.org/2/library/datetime.html#strftime-strptime-behavior
    d = datetime.strptime(datestring, "%d %B %Y")
    nn = "Time Magazine - " + d.strftime("%Y-%m-%d") + ".pdf"
    print(nn)
    rename(join(sourcePath, f), join(sourcePath, nn))
