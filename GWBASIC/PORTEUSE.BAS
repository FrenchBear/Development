DEFINT I-N

DIM s(640), p(640)

CONST kv = 112
CONST ip = 2

RANDOMIZE 3
FOR i = 0 TO 640 STEP ip
'  s(i) = COS(i / 25) * (i - 320) / 320
  s(i) = (640 - i) / 640
  p(i) = SIN(i / 15)
NEXT

CLS
SCREEN 12

' Dessin �chelles
LOCATE 1, 1: PRINT "Signal"
LINE (0, 20)-(0, 100)
LINE (0, 60)-(640, 60)

LOCATE 8, 1: PRINT "Porteuse"
LINE (0, 20 + kv)-(0, 100 + kv)
LINE (0, 60 + kv)-(640, 60 + kv)

LOCATE 15, 1: PRINT "Modulation d'amplitude"
LINE (0, 20 + 2 * kv)-(0, 100 + 2 * kv)
LINE (0, 60 + 2 * kv)-(640, 60 + 2 * kv)

LOCATE 22, 1: PRINT "Modulation de fr�quence"
LINE (0, 20 + 3 * kv)-(0, 100 + 3 * kv)
LINE (0, 60 + 3 * kv)-(640, 60 + 3 * kv)


'dessin signal
FOR i = 0 TO 640 STEP ip
  IF i = 0 THEN PSET (i, 60 + 30 * s(i)), 14 ELSE LINE -(i, 60 + 30 * s(i)), 14
NEXT

a$ = INPUT$(1)
' dessin porteuses  
FOR i = 0 TO 640 STEP ip
  IF i = 0 THEN PSET (i, 60 + 1 * kv + 40 * p(i)), 11 ELSE LINE -(i, 60 + 1 * kv + 40 * p(i)), 11
NEXT
FOR i = 0 TO 640 STEP ip
  IF i = 0 THEN PSET (i, 60 + 2 * kv + 40 * p(i)), 11 ELSE LINE -(i, 60 + 2 * kv + 40 * p(i)), 11
NEXT
FOR i = 0 TO 640 STEP ip
  IF i = 0 THEN PSET (i, 60 + 3 * kv + 40 * p(i)), 11 ELSE LINE -(i, 60 + 3 * kv + 40 * p(i)), 11
NEXT

a$ = INPUT$(1)
' dessin AM
FOR i = 0 TO 640 STEP ip
  y = p(i) * (.8 + ABS(s(i)))
  IF i = 0 THEN PSET (i, 60 + 2 * kv + 40 * y), 12 ELSE LINE -(i, 60 + 2 * kv + 40 * y), 12
NEXT

a$ = INPUT$(1)
' dessin FM
CONST kf = 8
t = 0
FOR i = 0 TO 640 STEP ip
  t = t + ip / 15 + ABS(s(i)) / 2
  y = SIN(t)
  IF i = 0 THEN PSET (i, 60 + 3 * kv + 40 * y), 13 ELSE LINE -(i, 60 + 3 * kv + 40 * y), 13
NEXT

