
DEFINT I-N
DEFLNG C

CONST ROUGE = 1
CONST VERT = 256
CONST BLEU = 65536

DIM coul(192)

FOR i = 0 TO 5
  j0 = 32 * i
  FOR j = 0 TO 31
    SELECT CASE i
      CASE 0: c = 63 * ROUGE + 2 * j * VERT
      CASE 1: c = 2 * (31 - j) * ROUGE + 63 * VERT
      CASE 2: c = 63 * VERT + 2 * j * BLEU
      CASE 3: c = 2 * (31 - j) * VERT + 63 * BLEU
      CASE 4: c = 63 * BLEU + 2 * j * ROUGE
      CASE 5: c = 2 * (31 - j) * BLEU + 63 * ROUGE
    END SELECT
    coul(j0 + j) = c
  NEXT
NEXT

SCREEN 3
LINE (0, 100)-(720, 100)
LINE (0, 200)-(720, 200)
LINE (0, 300)-(720, 300)

FOR i = 0 TO 192
  LINE (3 * i, 100)-STEP(1, -coul(i) MOD 256), , B
  LINE (3 * i, 200)-STEP(1, -(coul(i) \ 256) MOD 256), , B
  LINE (3 * i, 300)-STEP(1, -(coul(i) \ 65536) MOD 256), , B
NEXT

