' PAL2.BAS
' Palette de couleurs, avec echelle de gris … illusion d'optique
' PV 1988

k1 = 40
k2 = 200 \ 32
SCREEN 13
FOR i = 0 TO 7
  FOR j = 0 TO 31
    LINE (k1 * i, k2 * j)-(k1 * (i + 1), k2 * (j + 1)), 32 * i + j, BF
  NEXT
NEXT

FOR i = 0 TO 31

  j = 2 * i

  r = j
  v = 256 * j
  b = 65536 * j

  PALETTE i, r
  PALETTE 32 + i, v
  PALETTE 64 + i, b

  PALETTE 96 + i, r + v
  PALETTE 128 + i, r + b
  PALETTE 160 + i, v + b

NEXT

FOR i = 0 TO 63
  PALETTE 192 + i, i + 256 * i + 65536 * i
NEXT

a$ = INPUT$(1)

