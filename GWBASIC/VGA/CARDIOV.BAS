DEFINT C
SCREEN 12
rx = 315
ry = 235

n = 12

pi = 6.28 / (n * 15)
FOR t = 0 TO 6.28 - pi / 2 STEP pi
  c = (c MOD 15) + 1
  LINE (320 + rx * COS(t), 240 - ry * SIN(t))-(320 + rx * COS(t + t), 240 - ry * SIN(t + t)), c
NEXT

DIM p(255) AS LONG

FOR i = 1 TO 15
  FOR j = 1 TO 15
    p(16 * i + j) = (((i + j - 2) MOD 15) * 4 + 3) * (1 + 256)
  NEXT
NEXT

WHILE INKEY$ = ""
  FOR i = 15 TO 1 STEP -1
    PALETTE USING p(16 * i)
  NEXT
WEND

