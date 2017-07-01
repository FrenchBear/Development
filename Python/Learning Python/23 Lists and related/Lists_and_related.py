# 23 Lists and related.py
# learning code on lists and similar stuff
# 2015-10-26    PV


# -------------------------------------------------------------
# Lists

fruits = ['grape' , 'raspberry' , 'apple' , 'banana']
print('fruits: ', fruits)
l1 = sorted(fruits)                     # sorted returns a new list
print('l1: ', l1)
l2 = sorted(fruits, reverse=True)
print('l2: ', l2)
l3 = sorted(fruits, key=len)           # stable sort, grape and apple remain in the same order
print('l3: ', l3)
l4 = sorted(fruits, key=len, reverse=True)
print('l4: ', l4)
# fruits lists is not modified here
fruits.sort()          # In-place sort, not fruits is sorted
print('fruits: ', fruits)


# bisect demo
import bisect
HAYSTACK = [1 , 4 , 5 , 6 , 8 , 12 , 15 , 20 , 21 , 23 , 23 , 26 , 29 , 30] 
NEEDLES = [0 , 1 , 2 , 5 , 8 , 10 , 22 , 23 , 29 , 30 , 31] 
ROW_FMT = '{0:2d} @ {1:2d}    {2}{0:<2d}' 

def demo(bisect_fn): 
    for needle in reversed(NEEDLES): 
        position = bisect_fn(HAYSTACK , needle) 
        offset = position * '  |' 
        print(ROW_FMT . format(needle , position , offset)) 

bisect_fn = bisect.bisect
#bisect_fn = bisect.bisect_left
print()
print('DEMO:', bisect_fn . __name__) 
print('haystack ->' , ' '.join('%2d' % n for n in HAYSTACK)) 
demo(bisect_fn)

# bisect.insort demo
import random
print()
SIZE = 7 
random.seed(1729) 
my_list = [] 
for i in range(SIZE): 
    new_item = random.randrange(SIZE * 2) 
    bisect.insort(my_list, new_item)                # insort_left also exists
    print('%2d ->' % new_item, my_list)


# Example of simple Eratosthenes sieve, list version
def lsieve(n):
    lbits = [True] * n
    primes = []
    i = 2
    while i < n:
        if lbits[i]:
            primes.append(i)
            #primes += [i]
            j = i + i
            while j < n:
                lbits[j] = False
                j += i
        if i==2:
            i = 3
        else:
            i += 2
    return primes

print()
n = 100
print('[list] Primes up to', n, lsieve(n))



# -------------------------------------------------------------
# Arrays
from array import array

# Example of simple Eratosthenes sieve, array version
def asieve(n):
    abits = array('b', [True] * n )       # (True for i in range(n)) is slower
    i = 2
    while i < n:
        if abits[i]:
            j = i + i
            while j < n:
                abits[j] = False
                j += i
        if i==2:
            i = 3
        else:
            i += 2
    return (index for index, bit in enumerate(abits) if bit & (index>1))     # avoid indexed access
    #return (n for n in range(2, n) if abits[n])     

print()
print('[array] Primes up to', n, list(asieve(n)))
#print(' '.join('%d' % n for n in range(2, n) if abits[n])) 



# Performance comparison
# Lists and arrays get about the same performance
# It means that indexed access on a list is not O(n) as I would have expected if list was implemented as a simple chained list...
# After checking http://stackoverflow.com/questions/11400163/python-list-indexing-efficiency is seems that indeed indexing a list is O(1), so
# an array has not much benefits, besides memory usage since it only contains data, no pointers
import time
n = 100000
tstart = time.time()    # Stopwatch start
s1 = lsieve(n)
duration = time.time()-tstart
print('lsieve('+str(n)+'): '+str(round(duration,1))+'s')

tstart = time.time()    # Stopwatch start
s2 = asieve(n)
duration = time.time()-tstart
print('asieve('+str(n)+'): '+str(round(duration,1))+'s')

# timeit doesn't work well importing modules that contain scripts (other than function definitions) since it'll evaluate the module
#import timeit
#t=timeit.timeit('mylist=lsieve(1000)',setup='from Lists_and_related import lsieve', number=100)
#print('lsieve timeit: ', t)
#t=timeit.timeit('len(mylist)',setup='mylist=asieve(1000)',number=100)
#print('asieve timeit: ', t)



# -------------------------------------------------------------
# Deque

print()
print('deque example')

from collections import deque 
dq = deque(range(10), maxlen = 10)
print(dq)
dq.rotate(3)
print(dq)
dq.rotate(-4)
print(dq)
dq.appendleft(-1)
print(dq)
dq.extend([11, 22, 33])
print(dq)
dq.extendleft([10, 20, 30, 40])
print(dq)

