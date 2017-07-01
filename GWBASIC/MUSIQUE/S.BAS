DECLARE SUB pl (a$)
DECLARE SUB analyse (k$)

DEFINT A-Z

CLS
SCREEN 2
LOCATE , , 1
l0 = 66

PLAY "ML"
pl "o2 e-16 c16 e-16 g16 o3 c16 e-16 d16 c16 o2 b16 g16 b16 o3 d16 g16 f16 e-16 d16"
pl "o3 e-16 c16 e-16 g16 o4 c16 e-16 d16 c16 d16 c16 o3 b16 a16 g16 f16 e-16 d16"
pl "o3 e-16 c16 e-16 g16 o4 c16 e-16 d16 c16 o3 b16 g16 b16 o4 d16 g16 f16 e-16 d16"
pl "o4 e-16 c16 e-16 g16 o5 c16 e-16 d16 c16 d16 c16 o4 b16 a16 g16 f16 e-16 d16"
pl "o4 e-16 c16 o3 g16 e-16 c16 o5 c16 o4 g16 e-16 a-16 o2 f16 a16 o3 c16 f16 a-16 o4 c16 e-16"
pl "o4 d16 o3 b-16 f16 d16 o2 b-16 o4 b-16 f16 d16 g16 o2 e-16 g16 b-16 o3 e-16 g16 b-16 o4 d16"
pl "o4 c16 o3 a16 g+16 a16 o4 c16 o3 a16 g+16 a16 o4 e-16 c16 o3 g16 a16 o4 e-16 c16 o3 g16 a16"
pl "o4 d16 c16 o3 f+16 a16 o4 a16 c16 o3 f+16 a16 o4 f+16 c16 o3 d16 a16 o4 c16 o3 a16 f+16 d16"
pl "o3 b-16 o1 g16 b-16 o2 d16 g16 b-16 a16 g16 f+16 d16 f+16 a16 o3 d16 c16 o2 b-16 a16"
pl "o2 b-16 g16 b-16 o3 d16 g16 b-16 a16 g16 a16 g16 f+16 e16 d16 c16 o2 b-16 a16"
pl "o2 b-16 g16 b-16 o3 d16 g16 b-16 a16 g16 f+16 d16 f+16 a16 o4 d16 c16 o3 b-16 a16"
pl "o3 b-16 g16 b-16 o4 d16 g16 b-16 a16 g16 a16 g16 f+16 e16 d16 c16 o3 b-16 a16"
pl "o3 b-16 g16 b-16 o4 d16 g16 d16 o3 b-16 g16 o2 f16 o4 g16 d16 o3 b16 g16 b16 o4 d16 g16"
pl "o4 c16 o3 g16 o4 g16 o3 g16 o4 c16 o3 g16 o4 g16 o3 g16 b16 g16 o4 f16 o3 g16 b16 g16 o4 f16 o3 g16"
pl "o4 e-16 c16 e-16 g16 o5 c16 o4 g16 e-16 c16 o2 b-16 o5 c16 o4 g16 e16 c16 e16 g16 o5 c16"
pl "o4 f16 c16 o5 c16 o4 c16 f16 c16 o5 c16 o4 c16 e16 c16 b-16 c16 e16 c16 b-16 c16"
pl "o4 a-16 o1 f16 a-16 o2 c16 f16 a-16 g16 f16 e16 c16 e16 g16 o3 c16 o2 b-16 a-16 g16"
pl "o2 a-16 f16 a-16 o3 c16 f16 a-16 g16 f16 g16 f16 e16 d16 c16 o2 b-16 a-16 g16"
pl "o2 a-16 f16 a-16 o3 c16 f16 a-16 g16 f16 e16 c16 e16 g16 o4 c16 o3 b-16 a-16 g16"
pl "o3 a-16 f16 a-16 o4 c16 f16 a-16 g16 f16 g16 f16 e16 d16 c16 o3 b-16 a-16 g16"
pl "o3 a-16 o4 f16 c16 o3 a-16 f16 o4 c16 o3 a-16 f16 c16 a-16 f16 c16 o2 a-16 o3 f16 c16 o2 a-16"
pl "o2 d-2 o4 a-16 f16 e16 f16 g16 f16 e16 f16"
pl "o2 c2 o3 a-16 f16 e16 f16 g16 f16 e16 f16"
pl "o1 b2 o5 d16 o4 f16 g16 a-16 g16 f16 e-16 d16"
pl "o4 e-16 g16 o5 c16 o4 g16 b-16 a-16 g16 f16 e-4 d4"
pl "o4 c16 o3 g16 o4 g16 o3 g16 o4 c16 o3 g16 o4 g16 o3 g16 b16 g16 o4 f16 o3 g16 b16 g16 o4 g16 o3 g16"
pl "o3 b-16 g16 o4 e16 o3 g16 b-16 g16 o4 e16 o3 g16 a16 o4 e-16 o5 c16 o4 e-16 o3 a16 o4 e-16 o5 c16 o4 e-16"
pl "o3 a-16 f16 o4 d16 o3 f16 a-16 f16 o4 d16 o3 f16 g16 o4 d-16 b-16 d-16 o3 g16 o4 d-16 b-16 d-16"
pl "o3 f+16 e-16 o4 c16 o3 e-16 f+16 e-16 o4 c16 o3 e-16 e-16 o4 c16 o5 c16 o4 c16 o3 e-16 o4 c16 o5 c16 o4 c16"
pl "o3 e-16 o4 c16 e-16 g16 o5 c16 g16 e-16 c16 g16 e-16 c16 o3 g16 o4 f16 d16 o3 b16 f16"
pl "o3 e-16 o2 c16 e-16 g16 o3 c16 e-16 d16 c16 o2 b16 g16 b16 o3 d16 g16 f16 e-16 d16"
pl "o3 e-16 c16 e-16 g16 o4 c16 e-16 d16 c16 d16 c16 o3 b16 a16 g16 f16 e-16 d16"
pl "o3 e-16 c16 e-16 g16 o4 c16 e-16 d16 c16 o3 b16 g16 b16 o4 d16 g16 f16 e-16 d16"
pl "o4 e-16 c16 e-16 g16 o5 c16 e-16 d16 o4 b16 o5 c16 o4 g16 e-16 d16 c16 o3 g16 e-16 d16"
pl "o3 c16. p16 p8 p4 p2 "

SUB analyse (k$) STATIC
  SHARED l0

  SELECT CASE LEFT$(UCASE$(k$), 1)
    CASE "O": oct = VAL(MID$(k$, 2)): EXIT SUB
    CASE "A": n = 9
    CASE "B": n = 10
    CASE "C": n = 0
    CASE "D": n = 2
    CASE "E": n = 4
    CASE "F": n = 5
    CASE "G": n = 7
    CASE "P": EXIT SUB
  END SELECT
  plg = 2
  IF INSTR(k$, "-") <> 0 THEN n = n - 1: plg = 3
 
  lg = VAL(MID$(k$, plg))
  SELECT CASE lg
    CASE 2:  lg = 16
    CASE 4:  lg = 8
    CASE 8:  lg = 4
    CASE 16: lg = 2
  END SELECT

  c = (12 * oct + n)
  LINE (l, l0)-(l + lg - 1, l0 - c), (l MOD 3) + 1, BF
  l = l + lg

  IF (l > 630) THEN l0 = l0 + 66: l = 0
END SUB

SUB pl (a$)
  DO
    p1 = INSTR(a$, " ")
    IF p1 = 0 THEN p1 = LEN(a$) + 1
    b$ = LEFT$(a$, p1 - 1)
'    PLAY b$
'    IF LEFT$(UCASE$(b$), 1) <> "o" THEN analyse b$
    analyse b$
    a$ = MID$(a$, p1 + 1)
  LOOP WHILE a$ <> ""
END SUB

