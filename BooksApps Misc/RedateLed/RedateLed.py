# RedateLed
# Example of system programming with Python
# Change filenames like  Janvier Février 2004   into   204-01..02
# 2016-07-25    PV

import sys
import re
from os import listdir, rename, makedirs
from os.path import isfile, join, exists
from datetime import datetime

sourcePath=r"C:\Temp\New Scientist 2014"
p = re.compile(r"New Scientist - (.*)\.pdf", re.IGNORECASE)
sourceFiles = [f for f in listdir(sourcePath) if isfile(join(sourcePath, f)) and p.match(f)]
sourceFiles.sort()
print(len(sourceFiles))

#moisDic = {"janvier":"01", "fevrier":"02", "février":"02", "mars":"03", "avril":"04", "mai":"05", "juin":"06", "juillet":"07", "aout":"08", "août":"08", "septembre":"09", "octobre":"10", "novembre":"11", "decembre":"12", "décembre":"12"}
moisDic = {"January":"01", "February":"02", "March":"03", "April":"04", "May":"05", "June":"06", "July":"07", "August":"08", "September":"09", "October":"10", "November":"11", "December":"12"}

reYear = re.compile(r"^(\d\d\d\d)$")
reDay = re.compile(r"^(\d?\d)$")
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
                maDay = reDay.search(seg)
                if not (maDay is None):
                    d = maDay.group(1)
                    if len(d)==1:
                        d="0"+d
                else:
                    if seg in moisDic:
                        if ms=="":
                            ms = moisDic[seg]
                        else:
                            ms = ms + ".." + moisDic[segl]
                    else:
                        print("Bad seg: ", seg, "    from    ", f)

        nn = "New Scientist - " + y + "-" + ms + "-" + d + ".pdf"
        print(nn, "       old:  ", f)
        rename(join(sourcePath, f), join(sourcePath, nn))

"""
    #newfolder = "Ms. Marvel v1 - "+num
    #newfolder = "Ms. Marvel v3 - "+num
    newfolder = "Prince Valiant - "+num
    if not newfolder in listNewFolders:
        print(newfolder)
        listNewFolders.append(newfolder)
        fullpath = join(sourcePath, newfolder)
        if not exists(fullpath): makedirs(fullpath)
    rename(join(sourcePath, f), join(fullpath, f))
"""