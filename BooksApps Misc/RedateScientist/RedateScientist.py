# RedateScientist
# Example of system programming with Python
# Change filenames like  February 2016   into   2016-02
# 2017-01-09    PV

"""
12
The Scientist - 2016-04.pdf        old:   The Scientist April 2016.pdf
The Scientist - 2016-08.pdf        old:   The Scientist August 2016.pdf
The Scientist - 2016-12.pdf        old:   The Scientist December 2016.pdf
The Scientist - 2016-02.pdf        old:   The Scientist February 2016.pdf
The Scientist - 2016-01.pdf        old:   The Scientist January 2016.pdf
The Scientist - 2016-07.pdf        old:   The Scientist July 2016.pdf
The Scientist - 2016-06.pdf        old:   The Scientist June 2016.pdf
The Scientist - 2016-03.pdf        old:   The Scientist March 2016.pdf
The Scientist - 2016-05.pdf        old:   The Scientist May 2016.pdf
The Scientist - 2016-11.pdf        old:   The Scientist November 2016.pdf
The Scientist - 2016-10.pdf        old:   The Scientist October 2016.pdf
The Scientist - 2016-09.pdf        old:   The Scientist September 2016.pdf
"""

import sys
import re
from os import listdir, rename, makedirs
from os.path import isfile, join, exists
from datetime import datetime

sourcePath=r"D:\Users\Pierre\Downloads\The Scientist"
p = re.compile(r"The Scientist (.*)\.pdf", re.IGNORECASE)
sourceFiles = [f for f in listdir(sourcePath) if isfile(join(sourcePath, f)) and p.match(f)]
sourceFiles.sort()
print(len(sourceFiles))

moisDic = {"January":"01", "February":"02", "March":"03", "April":"04", "May":"05", "June":"06", "July":"07", "August":"08", "September":"09", "October":"10", "November":"11", "December":"12"}

reYear = re.compile(r"^(\d\d\d\d)$")
for f in sourceFiles:
    res = p.search(f)
    ext = res.group(1).split()

    if len(ext)>=2:
        ms = ""
        y = ""
        for seg in ext:
            maYear = reYear.search(seg)
            if not (maYear is None):
                y = maYear.group(1)
            else: 
                if seg in moisDic:
                    ms = moisDic[seg]

        nn = "The Scientist - " + y + "-" + ms + ".pdf"
        print(nn, "       old:  ", f)
        rename(join(sourcePath, f), join(sourcePath, nn))
