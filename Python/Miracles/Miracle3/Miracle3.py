
# miracle5.py
# D'après PLS Février 2017
# 2017-09-04    PV

def num(l):
    return 1000*int(l[0])+100*int(l[1])+10*int(l[2])+int(l[3])

def miracle5(i):
    z1 = i
    ni = 0
    while True:
        l1 = list(str(z1).zfill(4))
        l1.sort()
        l2 = list(l1)
        l2.reverse()
        z2 = num(l2)-num(l1)
        if z1==z2: break;
        ni += 1
        z1 = z2
    print(i, ni, z1)

miracle5(1400)

#for i in range(1000, 10000):
#    if (i % 1111)!=0: miracle5(i)
