# Courge du Dragon utilisant un générateur L-System
# # 2018-03-07    PV

import numpy as np
import matplotlib.pyplot as plt

Angle = 8
Axiom = 'FX'
Rules = {'F':'', 'Y':'+FX--FY+', 'X':'-FX++FY-'}

# Recursive iterator implementation
# Not the fastest, but for this example, good enough
def LSystemIterator(depth, axiom, rules):
    """Implements a L-System engine using a recursive iterator model
    that uses little memory for complex/deep systems"""
    # End recursivity case, depth==0, simply returns axiom
    if depth==0:
        for c in axiom:
            yield c
    else:
        # General case, apply transformation rules on depth-1 version
        for c in LSystemIterator(depth-1, axiom, rules):
            if c in rules:
                for c2 in rules[c]:
                    yield c2
            else:
                yield c

# matplotlib will automatically take care of boundaries management
# Just assume here we start at (0, 0) and all segments have a length of one unit
def PlotLSystem(rule):
    x, y = 0.0, 0.0
    a = 0
    dx = np.cos(np.linspace(0.0, 2*np.pi, Angle, endpoint=False))
    dy = -np.sin(np.linspace(0.0, 2*np.pi, Angle, endpoint=False))

    #print('dx=', dx)
    #print('dy=', dy)

    px = [x]
    py = [y]

    for c in rule:
        if c=='+': a += 1
        if c=='-': a -= 1
        if c=='F':
            x += dx[a%8]
            y += dy[a%8]
            px.append(x)
            py.append(y)


    #print('px=', px)
    #print('py=', py)

    plt.figure(num=None, figsize=(10, 7), dpi=100, facecolor='w', edgecolor='k')
    plt.title("Courbe du dragon level="+str(Level))
    plt.plot(px, py)
    plt.axis('off')
    plt.savefig(r"C:\Temp\Dragon12.png", bbox_inches='tight')
    plt.show()


Level=12
generated = LSystemIterator(Level, Axiom, Rules)

PlotLSystem(generated)


