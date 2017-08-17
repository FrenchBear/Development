# MusicFilesCOmparer
# Detects duplicates in newly downloaded music files
# 2017-08-17    PV


import os
import re


# Returns a flat list of mp3 filenames in path or a subfolder
def GetFlatMP3FilesList(path):
    list = []
    for root, subs, files in os.walk(path):
        list += ([f for f in files if f.lower().endswith(".mp3")])
    return list

newFiles = []
newFolder = "C:\Temp\LP";
for file in GetFlatMP3FilesList(newFolder):
    match = re.search(r'^(.*) - (.*)\.mp3', file, re.IGNORECASE)
    if match:
        name = match.groups(0)[0] + " - " + match.groups(0)[1]
        newFiles.append(name)
    else:
        print("No match old: "+file)


oldFiles = []
oldFolder1 = "C:\MusicGD\MP3P\Chansons France"
oldFolder2 = "C:\MusicGD\MP3P\Chansons Intl"
for file in GetFlatMP3FilesList(oldFolder1):
    match = re.search(r'^(.*) - (.*)\.mp3', file, re.IGNORECASE)
    if match:
        name = match.groups(0)[0] + " - " + match.groups(0)[1]
        oldFiles.append(name)
    else:
        print("No match new1: "+file)
for file in GetFlatMP3FilesList(oldFolder2):
    match = re.search(r'^(.*) - (.*)\.mp3', file, re.IGNORECASE)
    if match:
        name = match.groups(0)[0] + " - " + match.groups(0)[1]
        oldFiles.append(name)
    else:
        print("No match new2: "+file)

print("New: "+str(len(newFiles)))
print("Old: "+str(len(oldFiles)))


diffMax = 2
# Adapted from https://en.wikipedia.org/wiki/Levenshtein_distance and personal app DiffMP3Names
def LevenshteinDistance(s, t):
    # Optimisation perso, j'ai pas besoin des distances supérieures à diffMax
    if abs(len(s) - len(t)) > diffMax: return diffMax + 1

    # degenerate cases
    if s == t: return 0
    if len(s) == 0: return t.Length
    if len(t) == 0: return s.Length

    # convert to lowercase, we're doing case insensitive compare here
    s = s.lower()
    t = t.lower()

    # create two work vectors of integer distances
    # initialize v0 (the previous row of distances)
    # this row is A[0][i]: edit distance for an empty s
    # the distance is just the number of characters to delete from t
    v0 = list(range(len(t)+1))
    v1 = [0] * (len(t)+1)

    for i in range(len(s)):
        # calculate v1 (current row distances) from the previous row v0

        # first element of v1 is A[i+1][0]
        # edit distance is delete (i+1) chars from s to match empty t
        v1[0] = i + 1

        # use formula to fill in the rest of the row
        for j in range(len(t)):
            cost = 0 if s[i] == t[j] else 1
            v1[j + 1] = min(v1[j] + 1, v0[j + 1] + 1, v0[j] + cost)

        # copy v1 (current row) to v0 (previous row) for next iteration
        for j in range(len(v0)):
            v0[j] = v1[j]

    return v1[len(t)]

def tld(a,b,d):
    dc = LevenshteinDistance(a,b)
    if d!=dc: print(a + ", "+b+", "+str(d)+", "+str(dc))

# Some tests
#tld("Pomme","Pome",1)
#tld("Il était un petit navire", "Il était un petit navire", 0)
#tld("Il était une petit navire", "Il était un petit navire", 1)
#tld("Il était un petit navire", "Il était une petit navire", 1)
#tld("Il étai un petit naavire", "Il était un petit navire", 2)
#tld("Il était un petit navire", "Il était u petit naavire", 2)

# Find identical names first
for nf in newFiles:
    if nf in oldFiles:
        print(nf)



