DEFINT A-Z

DIM tbit(7) AS INTEGER
tbit(0) = 1
FOR i = 1 TO 7
  tbit(i) = 2 * tbit(i - 1)
NEXT

OPEN "I", #1, "newfont"
font$ = INPUT$(1705, 1)
CLOSE #1

CLS
FOR i = 1 TO 94
  f$ = MID$(font$, 12 + 18 * (i - 1), 17)
  PRINT i; f$
  
  FOR k = 0 TO 5
    FOR j = 1 TO 8
      x = ASC(MID$(f$, j, 1)) - 63
      IF x AND tbit(k) THEN PRINT "��";  ELSE PRINT "��";
    NEXT
    PRINT
  NEXT
  FOR k = 0 TO 5
    FOR j = 10 TO 17
      x = ASC(MID$(f$, j, 1)) - 63
      IF x AND tbit(k) THEN PRINT "��";  ELSE PRINT "��";
    NEXT
    PRINT
  NEXT
  PRINT
  PRINT
'  a$ = INPUT$(1)
NEXT

