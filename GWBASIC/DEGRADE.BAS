SCREEN 13
FOR i = 0 TO 31
  PALETTE 112 + i, 65536 * i + 256 * i
  PALETTE 80 + i, i
  PALETTE 48 + i, 256 * i
  PALETTE 16 + i, 65536 * i
  LINE (10 * i, 0)-(10 * (i + 1), 50), 16 + i, BF
  LINE (10 * i, 50)-(10 * (i + 1), 100), 48 + i, BF
  LINE (10 * i, 100)-(10 * (i + 1), 150), 80 + i, BF
  LINE (10 * i, 150)-(10 * (i + 1), 200), 112 + i, BF
NEXT

COLOR 14
LOCATE 13, 16
PRINT " PLEXUS "

a$ = INPUT$(1)

