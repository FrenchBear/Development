DIM fu$(9, 10)
DATA 440,536,673,707,760,806,832,859,887,903,130
FOR i = 0 TO 10: READ fu$(2, i): NEXT
DIM k(9)
DATA .6,.8,1,1.25,1.5,2,2.5,3,4,5
FOR i = 0 TO 9: READ k(i): NEXT
DIM e(2, 2)
a = 24
b = 12
ht = 3.2
hu = .85
r1 = .5
r3 = .3
r4 = .1
d = 1.25
ri = .62
cp = 2
rs = 0
j0 = 0
hs = 0
r2 = r1
nl = 2

h = ht - hu - hs
k = a * b / (h * (a + b))
IF k < .4 OR k > 7 THEN BEEP: STOP
FOR i = 0 TO 8: IF k < (k(i) + k(i + 1)) / 2 THEN k = k(i): GOTO 510
IF k = (k(i) + k(i + 1)) / 2 THEN k = k(i + 1): GOTO 510
NEXT
k = k(i)
510
fu = VAL(fu$(cp, 1)) / 1000!: de = VAL(fu$(cp, 10)) / 100

