defint a-z
dx=50
tx=16

dim tc(15)
data 0,1,2,3,6,4,5,8,9,7,10,11,12,13,15,14
for i=0 to 15:read tc(i):next

screen 9
line (0,0)-(639,349),,Bf

for i=15 to 0 step -1
  for j=0 to tx
    k=dx+tx*i+j
    line (k,0)-(k,349),tc(i)
    line (0,k)-(dx-1,k),tc(i)
    line (k,k)-(640,k),tc(i)
  next
next


