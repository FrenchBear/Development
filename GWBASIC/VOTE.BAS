screen 9
line (0,330)-(640,330):line (0,290)-(640,290)
defint i-n

ix=20:iy=10
dim k(ix-1,iy-1)

for i=0 to ix-1
  for j=0 to iy-1
    k(i,j)=int(rnd+.5)
    n1=n1+k(i,j)
    locate 1+j,1+2*i
    if k(i,j) then print chr$(2); else print "ú";
  next
next
n2=ix*iy

boucle:
  i=int(ix*rnd)
  j=int(iy*rnd)
  kk=k((i+int(3*rnd)-1+ix) mod ix,(j+int(3*rnd)-1+iy) mod iy)
  if k(i,j)<>kk then k(i,j)=kk:if kk then n1=n1+1 else n1=n1-1
  locate 1+j,1+2*i
  if k(i,j) then print chr$(2); else print "ú";
  g=g+1:ig=ig+1
  if ig=29 then
    locate 25,1
    print using "T:######     n1:###   n2:###     Vote n1:###.##%";g,n1,n2-n1,100*(n1/n2);
    ig=0
    ig2=(ig2+1)mod 640
    pset (ig2,330-30*(n1/n2))
  end if
  if n1<>n2 goto boucle


