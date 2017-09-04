# miracle5.py
# D'après PLS Février 2017
# 2017-09-04    PV


import random

m1 = 10
m2 = 100
sm = m1+m2
e = [m1, m2]
gc = 0
nt = 10000
for i in range(nt):
    c = random.choice(e)
    x = random.random()
    y = x/(1-x)
    if c<=y: c=sm-c
    if c==m2: gc+=1

print(gc/nt)