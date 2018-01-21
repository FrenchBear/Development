import os, shutil, re


source = r"U:\A_Trier Music\France Gall\Après 1970"
sourcefiles = []
for root, subs, files in os.walk(source):
    for file in files:
        match = re.search(r'^(.+) - (.+) - (.+)\.mp3', file, re.IGNORECASE)
        if match:
            fullpath = os.path.join(root, file)
            song = match.groups(0)[2]
            if not song in sourcefiles: 
                sourcefiles.append(song)
                shutil.copy(fullpath, os.path.join(r"c:\Temp\FG\!All", song+".mp3"))
            else:
                specdir = os.path.join(r"c:\Temp\FG", song)
                if not os.path.exists(specdir):
                    os.makedirs(specdir)
                    shutil.move(os.path.join(r"c:\Temp\FG\!All", song+".mp3"), os.path.join(specdir, "1 - "+song+".mp3"))
                n = len(os.listdir(specdir))+1
                shutil.copy(fullpath, os.path.join(specdir, str(n)+" - "+song+".mp3"))

        #else:
        #    print("No match: "+file)

print(len(sourcefiles))


"""
extra = r"U:\A_Trier Music\France Gall\France Gall - Évidement"
extrafiles = []
for root, subs, files in os.walk(extra):
    for file in files:
        match = re.search(r'^(.+) - (.+) - (.+)\.mp3', file, re.IGNORECASE)
        if match:
            song = match.groups(0)[2]
            if not song in sourcefiles: 
                print("Extra: "+file)
                # print("COPY \""+os.path.join(root, file)+"\" C:\\Temp")
"""



"""
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

for nf in sourcefiles:
    for of in sourcefiles:
        if LevenshteinDistance(nf, of)==1:
            print(of)
            print(nf)
            print()
"""