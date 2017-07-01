# Dev for fun project #5, Percolation
# 2016-02-22    PV

import numpy
import random

# p est la probabilité d'avoir une cellule remplie dans ]0,1[
# Retourne la grille et la probabilité réelle
def create_grid(h,w,p):
    g = numpy.zeros((h,w))
    f = 0
    for r in range(h):
        for c in range(w):
            if random.random() < p:
                g[r,c] = 1.0
                f += 1
    return g, f / (h * w)

def print_grid(g):
    h,w = g.shape
    for r in range(h):
        for c in range(w):
            if g[r,c] == 0.0:
                print('..',end='')
            elif g[r,c] == 1.0:
                print('##',end='')
            else:
                print('oo',end='')
        print()

# Performs percolation in grid g, starting with first row empty cells
# Returns True if percolation has reached last line, False otherwise
def percolate(g):
    h,w = g.shape
    ecl = []        # Empty cells list
    # Initialize the list with all empty cells of first row
    for c in range(w):
        if g[0,c] == 0.0:
            ecl.append((0,c))
    while len(ecl) > 0:
        r,c = ecl.pop()
        if g[r,c] == 0.0:
            g[r,c] = 0.5
            if r > 0 and g[r - 1,c] == 0.0: ecl.append((r - 1,c))
            if r < h - 1 and g[r + 1,c] == 0.0: ecl.append((r + 1,c))
            if c > 0 and g[r,c - 1] == 0.0: ecl.append((r,c - 1))
            if c < w - 1 and g[r,c + 1] == 0.0: ecl.append((r,c + 1))
    # At the end, check if at least one cell of the last row has percolated
    for c in range(w):
        if g[h - 1,c] == 0.5:
            return True
    return False

def test_proba(p,s,n):
    tr = []
    for i in range(n):
        g,pr = create_grid(s,s,p)
        f = percolate(g)
        tr.append(f)
    return tr.count(True) / len(tr)

def my_range(start, end, step):
    while start <= end:
        yield start
        start += step

n = 100
s = 50
print('Proba percolation grille en fonction de la densité size=',s,'x',s,', ',n,' tests par densité')
for p in my_range(0.30,0.5005,0.01):
    r = test_proba(p,s,n)
    print(p, r)

"""
s = 45
p = 0.5
g,pr = create_grid(s,s,p)
f = percolate(g)
print_grid(g)
print()
print('Target probability: ', p)
print('Real probability: ', pr)
print('Percolation success: ', f)
"""
