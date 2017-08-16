# MusicFilesCOmparer
# Detects duplicates in newly downloaded music files

import os
import re


# Simple iterator based on os.walk
def files1(path):
    for root, subs, files in os.walk(path):
        for file in files:
            yield os.path.join(root, file)


newFiles = []
for file in files1("C:\Temp\LP"):
    match = re.search(r'^.*\\(.*) - (.*) \(([0-9]+)\)\.mp3', file, re.IGNORECASE)
    if match:
        name = match.groups(0)[0] + " - " + match.groups(0)[1]
        newFiles.append(name)


oldFiles = []
for file in files1("C:\MusicGD\MP3P\Chansons France"):
    match = re.search(r'^.*\\(.*) - (.*)\.mp3', file, re.IGNORECASE)
    if match:
        name = match.groups(0)[0] + " - " + match.groups(0)[1]
        oldFiles.append(name)
for file in files1("C:\MusicGD\MP3P\Chansons Intl"):
    match = re.search(r'^.*\\(.*) - (.*)\.mp3', file, re.IGNORECASE)
    if match:
        name = match.groups(0)[0] + " - " + match.groups(0)[1]
        oldFiles.append(name)

print("New: "+str(len(newFiles)))
print("Old: "+str(len(oldFiles)))
