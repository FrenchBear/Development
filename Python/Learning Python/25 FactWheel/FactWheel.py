# FactWheel
# Computes factorization wheel efficiency
# 2016-08-07 PV

import functools

def ComputeEfficiency(l):
    prod = functools.reduce(lambda x,y: x * y, l)
    fl = range(prod)
    for i in l:
        fl = list(filter(lambda x: x % i != 0, fl))
    print(l, prod, "->", len(fl), len(fl)/prod)


ComputeEfficiency([2])
ComputeEfficiency([2,3])
ComputeEfficiency([2,3,5])
ComputeEfficiency([2,3,5,7])
ComputeEfficiency([2,3,5,7,11])
ComputeEfficiency([2,3,5,7,11,13])
