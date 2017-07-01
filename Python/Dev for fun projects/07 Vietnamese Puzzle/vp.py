# Vietnamese puzzle
# Solver for a problem published in the Guardian
# http://www.theguardian.com/science/alexs-adventures-in-numberland/2015/may/20/can-you-do-the-maths-puzzle-for-vietnamese-eight-year-olds-that-has-stumped-parents-and-teachers
# All you need to do is place the digits from 1 to 9 in the grid.
#
# 2015-05-20    PV

"""
Output (on THOR):
[1, 2, 6, 4, 7, 8, 3, 5, 9]
[1, 2, 6, 4, 7, 8, 5, 3, 9]
[1, 3, 2, 4, 5, 8, 7, 9, 6]
[1, 3, 2, 4, 5, 8, 9, 7, 6]
...
[9, 8, 6, 2, 4, 1, 5, 7, 3]
[9, 8, 6, 2, 4, 1, 7, 5, 3]
128 solution(s) found
362880 permutations analyzed in 49.4s

But it takes 26.4s on Raspberry Pi 2 to get the same results !
"""

import time

# A recursive iterator to produce all possible permutations of a set
def Permutator(t):
    if len(t)==1:
        # If there's only one element in the list, the only solution is the list itself
        yield t
    else:
        # For each element of the list
        for i in range(len(t)):
            #q = list(t)     # t.copy() works on Windows in Python 3.4.4, but not on Raspberry Pi with Python 3.2.3
            #h = q.pop(i)    # Take (and remove) the ith element of the list

            #better... but slower!!!
            q = t[:i]+t[i+1:]

            # Return the concatenation of this element with all possible permutations of remaining elements in the list
            for x in Permutator(q):
                #yield [h]+x
                yield t[i:i+1]+x

# For Vietnamese puzzle we have to use the digits from 1 to 9
t = [1,2,3,4,5,6,7,8,9]
np = 0                  # Number of permutations
ns = 0                  # Number of solutions
tstart = time.time()    # Stopwatch start
for x in Permutator(t):
    np += 1
    if x[0]+13*x[1]/x[2]+x[3]+12*x[4]-x[5]-11+x[6]*x[7]/x[8]-10 == 66:
        # Found a solution!
        #print(x)
        ns += 1
duration = time.time()-tstart
print(str(ns)+' solution(s) found')
print(str(np)+' permutations analyzed in '+str(round(duration,1))+'s')

# Just check that the number of permutations is equal to 9!
def fact(n):
    return 1 if n<2 else n*fact(n-1)

if np!=fact(len(t)):
    print('We have a problem!')
