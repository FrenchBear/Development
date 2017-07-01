# NS - Rename New Scientist Files
# 2015-07-21    PV

import os
from os.path import isfile, join
import re

monthsDic = {'January':'01', 'February':'02', 'March':'03', 'April':'04', 'May':'05', 'June':'06', 'July':'07', 'August':'08', 'September':'09', 'Octobre':'10', 'November':'11', 'December':'12'}

mypath = r'C:\Downloads\New Scientistc All 2014'

onlyfiles = [ f for f in os.listdir(mypath) if os.path.isfile(os.path.join(mypath,f)) ]

for file in onlyfiles:
    print(file)

    match = re.search(r'^New Scientistc ([a-zA-Z]+) ([0-9]+)', file)
    if match:
        month, day = match.groups(0)
        year = '2014'
        m = monthsDic[month]
        if len(day)<2: day='0'+day
        newName='\\New Scientist - '+year+'-'+m+'-'+day+'.pdf'
        print(newName)
        os.rename(mypath+'\\'+file, mypath+newName)
