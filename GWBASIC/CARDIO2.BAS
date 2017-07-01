defint c
screen 9
rx=315
ry=170
c3=4

for t=0 to 6.28 step 0.02
  line (320+rx*cos(t),175-ry*sin(t))-(320+rx*cos(c3*t),175-ry*sin(c3*t))
next



