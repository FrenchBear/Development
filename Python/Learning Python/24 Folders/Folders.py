# 24 Folders
# 2016-05-13 PV
# 2016-12-05 PV Added os.walk
# 2018-08-16 PV Enum files; Chrono

"""
Skull output:

subdirs1*100 -> 15 in 0.01s
subdirs2*100 -> 15 in 1.4s
subdirs3*100 -> 15 in 0.03s
files1*1 -> 2901 in 0.93s
files2*1 -> 2901 in 9.33s
files3*1 -> 2901 in 10.24s
"""

"""
>>> [f.name for f in os.scandir(r'c:\users\Pierre') if f.is_file()]
['.bash_history', '.git-credentials', '.gitconfig', '.productivitypowerpack2017', '.viminfo', 'IP_Log_Data.js', 'Network_Meter_Data.js', 'ntuser.dat', 'ntuser.dat.log1', 'ntuser.dat.log2', 'NTUSER.DAT{02ea2724-e200-11e7-a8fc-8c5539d148f7}.TxR.0.regtrans-ms', 'NTUSER.DAT{02ea2724-e200-11e7-a8fc-8c5539d148f7}.TxR.1.regtrans-ms', 'NTUSER.DAT{02ea2724-e200-11e7-a8fc-8c5539d148f7}.TxR.2.regtrans-ms', 'NTUSER.DAT{02ea2724-e200-11e7-a8fc-8c5539d148f7}.TxR.blf', 'NTUSER.DAT{02ea2725-e200-11e7-a8fc-8c5539d148f7}.TM.blf', 'NTUSER.DAT{02ea2725-e200-11e7-a8fc-8c5539d148f7}.TMContainer00000000000000000001.regtrans-ms', 'NTUSER.DAT{02ea2725-e200-11e7-a8fc-8c5539d148f7}.TMContainer00000000000000000002.regtrans-ms', 'ntuser.dat{125b04a9-fcbd-11e7-8c7a-9cb6d0f2a6e2}.TM.blf', 'ntuser.dat{125b04a9-fcbd-11e7-8c7a-9cb6d0f2a6e2}.TMContainer00000000000000000001.regtrans-ms', 'ntuser.dat{125b04a9-fcbd-11e7-8c7a-9cb6d0f2a6e2}.TMContainer00000000000000000002.regtrans-ms', 'ntuser.ini', 'ntuser.pol', '_viminfo', '_vimrc']
>>> [f for f in os.listdir(r'c:\users\Pierre') if os.path.isfile(os.path.join(r'c:\users\Pierre', f))]
['.bash_history', '.git-credentials', '.gitconfig', '.productivitypowerpack2017', '.viminfo', 'IP_Log_Data.js', 'Network_Meter_Data.js', 'ntuser.dat', 'ntuser.dat.log1', 'ntuser.dat.log2', 'NTUSER.DAT{02ea2724-e200-11e7-a8fc-8c5539d148f7}.TxR.0.regtrans-ms', 'NTUSER.DAT{02ea2724-e200-11e7-a8fc-8c5539d148f7}.TxR.1.regtrans-ms', 'NTUSER.DAT{02ea2724-e200-11e7-a8fc-8c5539d148f7}.TxR.2.regtrans-ms', 'NTUSER.DAT{02ea2724-e200-11e7-a8fc-8c5539d148f7}.TxR.blf', 'NTUSER.DAT{02ea2725-e200-11e7-a8fc-8c5539d148f7}.TM.blf', 'NTUSER.DAT{02ea2725-e200-11e7-a8fc-8c5539d148f7}.TMContainer00000000000000000001.regtrans-ms', 'NTUSER.DAT{02ea2725-e200-11e7-a8fc-8c5539d148f7}.TMContainer00000000000000000002.regtrans-ms', 'ntuser.dat{125b04a9-fcbd-11e7-8c7a-9cb6d0f2a6e2}.TM.blf', 'ntuser.dat{125b04a9-fcbd-11e7-8c7a-9cb6d0f2a6e2}.TMContainer00000000000000000001.regtrans-ms', 'ntuser.dat{125b04a9-fcbd-11e7-8c7a-9cb6d0f2a6e2}.TMContainer00000000000000000002.regtrans-ms', 'ntuser.ini', 'ntuser.pol', '_viminfo', '_vimrc']
>>> l1=[f.name for f in os.scandir(r'c:\users\Pierre') if f.is_file()]
>>> l2=[f for f in os.listdir(r'c:\users\Pierre') if os.path.isfile(os.path.join(r'c:\users\Pierre', f))]
>>> l1==l2
True
>>> 
"""

import os
import os.path
import time
from glob import glob


source = r"W:\Revues\Science"
source = r"C:\Public"
source = r"U:\A_Trier Music\France Gall\France Gall - Collection 1966-2001"

# os.scandir is faster
# see https://www.python.org/dev/peps/pep-0471/
def subdirs1(path):
    """Yield directory names not starting with '.' under given path."""
    for entry in os.scandir(path):
        if entry.is_dir():      # and not entry.name.startswith('.')
            yield entry.name

def subdirs2(path):
    return [f for f in os.listdir(path) if not os.path.isfile(os.path.join(path, f))]		# 2018-03-03  Why not os.path.isdir ??

# os.walk returns the complete hierarchy in a recursive way
# 1st entry is about the root folder
# So it's inefficient in this example
def subdirs3(path):
    _, dirs, _ = next(os.walk(path))        # Takes 1st element of an iterator
    return dirs

#print(list(subdirs1(source)))
#print(list(subdirs2(source)))
#print(list(subdirs3(source)))



# And now, files

# Simple iterator based on os.walk
def files1(path):
    for root, subs, files in os.walk(path):
        for file in files:
            yield os.path.join(root, file)


# Recursive list-build based on os.listdir
def files2(path):
    if not os.path.isdir(path):
        print("*** Problème " + path)
    l = []
    for f in os.listdir(path):
        full = os.path.join(path, f)
        if os.path.isfile(full):
            #print("Append file "+full)
            l.append(full)
        else:
            l2 = files2(full)
            #print("Append folder: "+full + " -> "+str(len(l2)))
            l += l2
            #l.append(l2)
    return l


# Recursive iterator based on os.listdir()
def files3(path):
    if not os.path.isdir(path):
        print("*** Problème " + path)
    l = []
    for f in os.listdir(path):
        full = os.path.join(path, f)
        if os.path.isfile(full):
            yield full
        else:
            for f2 in files3(full):
                yield f2


# From https://stackoverflow.com/questions/18394147/recursive-sub-folder-search-and-return-files-in-a-list-python
# But glob doesn't work for folders like ".vs" or files like ".suo"...
def files4(path, pattern):
    return [y for x in os.walk(path) for y in glob(os.path.join(x[0], pattern))]

def files5(path, pattern):
    return [file for file in glob(path + '/**/' + pattern, recursive=True)]



def Chrono(name, repeat, action):
    tstart = time.time()    # Stopwatch start
    repeatOriginal = repeat
    while repeat >= 0:
        repeat -= 1
        n = action()
    duration = time.time() - tstart
    print(name + "*" + str(repeatOriginal) + " -> " + str(n) + " in " + str(round(duration,2)) + 's')



Chrono("subdirs1", 100, lambda : len(list(subdirs1(source))))
Chrono("subdirs2", 100, lambda : len(list(subdirs2(source))))
Chrono("subdirs3", 100, lambda : len(list(subdirs3(source))))


Chrono("files1", 1, lambda : len(list(files1(source))))
#Chrono("files2", 1, lambda : len(files2(source)))
#Chrono("files3", 1, lambda : len(list(files3(source))))
Chrono("files4", 1, lambda : len(files4(source, "*.*")))
Chrono("files5", 1, lambda : len(files5(source, "*.*")))

print(list(files1(source)))
print(files4(source, "*.*"))
