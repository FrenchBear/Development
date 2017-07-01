'
' S2.BAS
' P.V.  28.VIII.88
'

DECLARE SUB analyse (k$)

DEFINT A-Z

CLS
SCREEN 2
LOCATE , , 1
l0 = 60
l = 2
FOR i = 0 TO 2
  LINE (0, i * l0 + 2)-(639, (i + 1) * l0 + 2), , B
NEXT

PLAY "MLMB"

READ a$
WHILE a$ <> "*"
 
  PLAY a$

  WHILE PLAY(0) > 0
  WEND

  analyse a$

  READ a$

WEND

END

DATA o2, e-16, c16,  e-16, g16,  o3,   c16,  e-16,  d16,  c16,  o2,    b16,   g16,   b16,   o3,   d16,  g16,   f16,   e-16,  d16
DATA o3, e-16, c16,  e-16, g16,  o4,   c16,  e-16,  d16,  c16,  d16,   c16,   o3,    b16,   a16,  g16,  f16,   e-16,  d16
DATA o3, e-16, c16,  e-16, g16,  o4,   c16,  e-16,  d16,  c16,  o3,    b16,   g16,   b16,   o4,   d16,  g16,   f16,   e-16,  d16
DATA o4, e-16, c16,  e-16, g16,  o5,   c16,  e-16,  d16,  c16,  d16,   c16,   o4,    b16,   a16,  g16,  f16,   e-16,  d16

DATA o4, e-16, c16,  o3,   g16,  e-16, c16,  o5,    c16,  o4,   g16,   e-16,  a-16,  o2,    f16
DATA a-16,  o3,    c16,   f16,   a-16,  o4,   c16,  e-16

DATA o4, d16,  o3,   b-16, f16,  d16,  o2,   b-16,  o4,   b-16, f16,   d16,   g16,   o2,    e-16, g16,  b-16,  o3,    e-16,  g16,   b-16, o4,   d16
DATA o4, c16,  o3,   a16,  g+16, a16,  o4,   c16,   o3,   a16,  g+16,  a16,   o4,    e-16,  c16,  o3,   g16,   a16,   o4,    e-16,  c16,  o3,   g16,  a16
DATA o4, d16,  c16,  o3,   f+16, a16,  o4,   a16,   c16,  o3,   f+16,  a16,   o4,    f+16,  c16,  o3,   d16,   a16,   o4,    c16,   o3,   a16,  f+16, d16
DATA o3, b-16, o1,   g16,  b-16, o2,   d16,  g16,   b-16, a16,  g16,   f+16,  d16,   f+16,  a16,  o3,   d16,   c16,   o2,    b-16,  a16
DATA o2, b-16, g16,  b-16, o3,   d16,  g16,  b-16,  a16,  g16,  a16,   g16,   f+16,  e16,   d16,  c16,  o2,    b-16,  a16
DATA o2, b-16, g16,  b-16, o3,   d16,  g16,  b-16,  a16,  g16,  f+16,  d16,   f+16,  a16,   o4,   d16,  c16,   o3,    b-16,  a16
DATA o3, b-16, g16,  b-16, o4,   d16,  g16,  b-16,  a16,  g16,  a16,   g16,   f+16,  e16,   d16,  c16,  o3,    b-16,  a16
DATA o3, b-16, g16,  b-16, o4,   d16,  g16,  d16,   o3,   b-16, g16,   o2,    f16,   o4,    g16,  d16,  o3,    b16,   g16,   b16,   o4,   d16,  g16
DATA o4, c16,  o3,   g16,  o4,   g16,  o3,   g16,   o4,   c16,  o3,    g16,   o4,    g16,   o3,   g16,  b16,   g16,   o4,    f16,   o3,   g16,  b16,  g16,  o4,  f16,  o3,  g16
DATA o4, e-16, c16,  e-16, g16,  o5,   c16,  o4,    g16,  e-16, c16,   o2,    b-16,  o5,    c16,  o4,   g16,   e16,   c16,   e16,   g16,  o5,   c16
DATA o4, f16,  c16,  o5,   c16,  o4,   c16,  f16,   c16,  o5,   c16,   o4,    c16,   e16,   c16,  b-16, c16,   e16,   c16,   b-16,  c16
DATA o4, a-16, o1,   f16,  a-16, o2,   c16,  f16,   a-16, g16,  f16,   e16,   c16,   e16,   g16,  o3,   c16,   o2,    b-16,  a-16,  g16
DATA o2, a-16, f16,  a-16, o3,   c16,  f16,  a-16,  g16,  f16,  g16,   f16,   e16,   d16,   c16,  o2,   b-16,  a-16,  g16
DATA o2, a-16, f16,  a-16, o3,   c16,  f16,  a-16,  g16,  f16,  e16,   c16,   e16,   g16,   o4,   c16,  o3,    b-16,  a-16,  g16
DATA o3, a-16, f16,  a-16, o4,   c16,  f16,  a-16,  g16,  f16,  g16,   f16,   e16,   d16,   c16,  o3,   b-16,  a-16,  g16
DATA o3, a-16, o4,   f16,  c16,  o3,   a-16, f16,   o4,   c16,  o3,    a-16,  f16,   c16,   a-16, f16,  c16,   o2,    a-16,  o3,    f16,  c16,   o2,    a-16
DATA o2, d-2,  o4,   a-16, f16,  e16,  f16,  g16,   f16,  e16,  f16
DATA o2, c2,   o3,   a-16, f16,  e16,  f16,  g16,   f16,  e16,  f16
DATA o1, b2,   o5,   d16,  o4,   f16,  g16,  a-16,  g16,  f16,  e-16,  d16
DATA o4, e-16, g16,  o5,   c16,  o4,   g16,  b-16,  a-16, g16,  f16,   e-4,   d4
DATA o4, c16,  o3,   g16,  o4,   g16,  o3,   g16,   o4,   c16,  o3,    g16,   o4,    g16,   o3,   g16,  b16,   g16,   o4,    f16,   o3,   g16,   b16,   g16,   o4,  g16,  o3,  g16
DATA o3, b-16, g16,  o4,   e16,  o3,   g16,  b-16,  g16,  o4,   e16,   o3,    g16,   a16,   o4,   e-16, o5,    c16,   o4,    e-16,  o3,   a16,   o4,    e-16,  o5,  c16,  o4,  e-16
DATA o3, a-16, f16,  o4,   d16,  o3,   f16,  a-16,  f16,  o4,   d16
DATA o3, f16,  g16,  o4,   d-16, b-16, d-16, o3,    g16,  o4,   d-16,  b-16,  d-16
DATA o3, f+16, e-16, o4,   c16,  o3,   e-16, f+16,  e-16, o4,   c16
DATA o3, e-16, f16
' , e-16
DATA o4, c16,  o5,   c16,  o4,   c16,  o3,   e-16,  o4,   c16,  o5,    c16,   o4,    c16
DATA o3, e-16, o4,   c16,  e-16, g16,  o5,   c16,   g16,  e-16, c16,   g16,   e-16,  c16,   o3,   g16,  o4,    f16,   d16,   o3,    b16,  f16
DATA o3, e-16, o2,   c16,  e-16, g16,  o3,   c16,   e-16, d16,  c16,   o2,    b16,   g16,   b16,  o3,   d16,   g16,   f16,   e-16,  d16
DATA o3, e-16, c16,  e-16, g16,  o4,   c16,  e-16,  d16,  c16,  d16,   c16,   o3,    b16,   a16,  g16,  f16,   e-16,  d16
DATA o3, e-16, c16,  e-16, g16,  o4,   c16,  e-16,  d16,  c16,  o3,    b16,   g16,   b16,   o4,   d16,  g16,   f16,   e-16,  d16
DATA o4, e-16, c16,  e-16, g16,  o5,   c16,  e-16,  d16,  o4,   b16,   o5,    c16,   o4,    g16,  e-16, d16,   c16,   o3,    g16,   e-16,  d16
DATA o3, c16., p16,  p8,   p4,   p2
DATA *

END

SUB analyse (k$) STATIC
  SHARED l0, l

  SELECT CASE LEFT$(k$, 1)
    CASE "o": oct = VAL(MID$(k$, 2)): EXIT SUB
    CASE "a": n = 9
    CASE "b": n = 10
    CASE "c": n = 0
    CASE "d": n = 2
    CASE "e": n = 4
    CASE "f": n = 5
    CASE "g": n = 7
    CASE "p": n = -1
  END SELECT

  plg = 2
  IF INSTR(k$, "-") <> 0 THEN n = n - 1: plg = 3
  IF INSTR(k$, "+") <> 0 THEN n = n + 1: plg = 3

  lg = VAL(MID$(k$, plg))
  SELECT CASE lg
    CASE 2:  lgg = 24
    CASE 4:  lgg = 12
    CASE 8:  lgg = 6
    CASE 16: lgg = 3
  END SELECT

  IF n < 0 THEN c = 2 ELSE c = (12 * (oct - 1) + n)
 
  LINE (l, l0)-(l + lgg - 1, l0 - c), , BF
  l = l + lgg

  t = t + lgg
  IF (t MOD 48) = 0 THEN
    l = l + 1
    IF (l > 620) THEN l0 = l0 + 60: l = 2
  END IF

END SUB

