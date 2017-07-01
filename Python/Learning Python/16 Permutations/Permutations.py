# 16 Permutations.py
# Variants of permutation in Python
# 2016-06-26    PV


import time

# Compute the list of all permutations of a list l (from Python language reference manual)
def perm(l):
    if len(l) <= 1:
        return [l]
    r = []
    for i in range(len(l)):
        s = l[:i] + l[i+1:]
        p = perm(s)
        for x in p:
            r.append(l[i:i+1] + x)
    return r


# A recursive iterator to produce all possible permutations of a list (my code)
def Permutator(t):
    if len(t)==1:
        yield t
    else:
        for i in range(len(t)):
            for x in Permutator(t[:i] + t[i+1:]):
                yield t[i:i+1]+x

# Compare performances
l = [1,2,3,4,5,6,7,8]

tstart = time.time()    # Stopwatch start
ns=0
for x in perm(l):
    ns+=1
duration = time.time()-tstart
print('perm: '+str(ns)+' solution(s) found in '+str(round(duration,1))+'s')

tstart = time.time()    # Stopwatch start
ns=0
for x in Permutator(l):
    ns+=1
duration = time.time()-tstart
print('Permutator: '+str(ns)+' solution(s) found in '+str(round(duration,1))+'s')
