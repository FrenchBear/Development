# Mulitplication.py
# Compare various multiplication algorithms
#
# Idea: https://www.codeandgadgets.com/karatsuba-multiplication-python/
# 
# 2018-02-12    PV  my own implementation


def multPython(a, b):
    return a * b

def multSchool(a, b):
    t = 0
    stra = str(a)
    for d in reversed(str(b)):
        t += int(stra) * int(d)
        stra += '0'
    return t

def nextPowerOf2(n):
    p = 1
    while True:
        if p >= n: return p
        p *= 2

def multKaratsuba(x, y):
    # If 2 digits, use standard multiplication
    if x < 100 and y < 100: return x * y

    # Otherwise use recursively Karatsuba algorithm
    strx = str(x)
    stry = str(y)
    lx = len(strx)
    ly = len(stry)
    
    # Align lengths of arguments to the next power of 2, left-padding with zeros
    l = nextPowerOf2(max(lx, ly))
    strx = '0'*(l-lx) + strx
    stry = '0'*(l-ly) + stry

    # Split numbers in two, x -> a*10^l2 + b, y -> c*10^l2 + d
    l2 = l >> 1
    a = int(strx[:l2])
    b = int(strx[l2:])
    c = int(stry[:l2])
    d = int(stry[l2:])

    # Compute ac, bd and m = ab + bc
    ac = multKaratsuba(a, c)
    bd = multKaratsuba(b, d)
    m = multKaratsuba(a + b, c + d) - ac - bd           # Trick to compute middle element with two multiplications
    r = int(str(ac) + '0' * l) + int(str(m) + '0' * l2) + int(bd)
    return r




a = 6463254768323
b = 5426288911234

print(a, ' * ', b)

c1 = multPython(a,b)
print('Python:    ', c1)

c2 = multSchool(a,b)
print('School:    ', c2)

c3 = multKaratsuba(a,b)
print('Karatsuba: ', c3)
