
CLS
DEFINT A-Z

DIM t(40)
TIMER ON

ON TIMER(1) GOSUB 100

10
DO
  WHILE ok = 0
  WEND
  c = c MOD 8 + 1
  FOR i = 1 TO 40
    SOUND 2000, 1
    COLOR c
    FOR j = 1 TO t(i) / 15
      LOCATE 26 - j, 2 * i - 1
      PRINT "�";
    NEXT
    SOUND 2000, 0
    FOR j = t(i) / 15 + 1 TO 20
      LOCATE 26 - j, 2 * i - 1
      PRINT " ";
    NEXT
  NEXT
  ok = 0
LOOP

100
COLOR 7
LOCATE 1, 1
FOR ii = 1 TO 40
  t(ii) = INT(256 * RND)
  PRINT RIGHT$(HEX$(t(ii) + 256), 2); "  ";
  SOUND 1000, 1: SOUND 1000, 0
  FOR jj = 1 TO 1000
  NEXT
NEXT
ok = 1
RETURN

