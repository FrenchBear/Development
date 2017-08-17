# MusicFilesCOmparer
# Detects duplicates in newly downloaded music files
# 2017-08-17    PV


import os, shutil
import re

# Simple iterator based on os.walk
def GetAllFiles(path):
    for root, subs, files in os.walk(path):
        for file in files:
            yield os.path.join(root, file)


accent_tabin =  u'àâäéèêëîïôöûüùÿç'
accent_tabout = u'aaaeeeeiioouuuyc'
accent_tabin = [ord(char) for char in accent_tabin]
accent_table = dict(zip(accent_tabin, accent_tabout))
def LowerNoAccent(s):
    return s.lower().translate(accent_table)


newFiles = []
newDic = {}
newFolder = "C:\Temp\Work\LP";
for file in GetAllFiles(newFolder):
    match = re.search(r'^.*\\(.*) - (.*)\.mp3', file, re.IGNORECASE)
    if match:
        name = LowerNoAccent(match.groups(0)[0] + " - " + match.groups(0)[1])
        newFiles.append(name)
        newDic[name] = file
    else:
        print("No match old: "+file)


oldFiles = []
oldDic = {}
oldFolder1 = "C:\Temp\Work\Chansons France"
oldFolder2 = "C:\Temp\Work\Chansons Intl"
for file in GetAllFiles(oldFolder1):
    match = re.search(r'^.*\\(.*) - (.*)\.mp3', file, re.IGNORECASE)
    if match:
        name = LowerNoAccent(match.groups(0)[0] + " - " + match.groups(0)[1])
        oldFiles.append(name)
        oldDic[name] = file
    else:
        print("No match new1: "+file)
for file in GetAllFiles(oldFolder2):
    match = re.search(r'^.*\\(.*) - (.*)\.mp3', file, re.IGNORECASE)
    if match:
        name = LowerNoAccent(match.groups(0)[0] + " - " + match.groups(0)[1])
        oldFiles.append(name)
        oldDic[name] = file
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
        print(oldDic[nf])
        print(newDic[nf])
        print()
        # shutil.move(newDic[nf], oldDic[nf])

        #nn = os.path.join(os.path.dirname(newDic[nf]), "Z - "+os.path.basename(oldDic[nf]))
        #print(nn)
        #shutil.move(newDic[nf], nn)

"""
# Distance of 1 or 2
for nf in newFiles:
    for of in oldFiles:
        if LevenshteinDistance(nf, of)<=2:
            print(oldDic[of])
            print(newDic[nf])
            nn = os.path.join(os.path.dirname(newDic[nf]), "Z - "+os.path.basename(oldDic[of]))
            print(nn)
            shutil.move(newDic[nf], nn)
"""
