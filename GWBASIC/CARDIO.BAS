DEFINT C
SCREEN 9
rx = 315
ry = 170

CONST DegToRad = 3.1416 / 180

FOR a = 0 TO 359 STEP 3
  c = (c MOD 15) + 1
  t = a * DegToRad
  LINE (320 + rx * COS(t), 175 - ry * SIN(t))-(320 + rx * COS(t + t), 175 - ry * SIN(t + t)), c
NEXT

a$ = INPUT$(1)

'WHILE INKEY$ = ""
'  FOR i = 1 TO 15
'    PALETTE i, c
'    c = (c + 1) MOD 16
'  NEXT
'
'WEND

