DEFINT A-Z
OPEN "COM2:9600,N,8,1,CS0,DS0" FOR RANDOM AS #1
CLS
PRINT "C'est parti !"
DO
  INPUT #1, a$
  PRINT "-------------------------------------"
  IF LEN(a$) <> 18 THEN
    PRINT CHR$(34); a$; CHR$(34)
    'PRINT "Longueur incorrecte ! (re�u:"; LEN(a$); " attendu: 18)"
  ELSE
    t = 0
    FOR i = 1 TO 16
      t = t + (i - 1) * VAL(MID$(a$, i, 1))
    NEXT
    IF (t MOD 100) <> VAL(MID$(a$, 17, 2)) THEN
      PRINT "*** Somme de contr�le incorrecte ! Relisez !"
      PRINT CHR$(34); a$; CHR$(34)
      BEEP
    ELSE
      n1 = VAL(MID$(a$, 1, 3))
      n2 = VAL(MID$(a$, 4, 6))
      n3 = VAL(MID$(a$, 10, 2))
      n4 = VAL(MID$(a$, 12, 5))
      n11 = n1 \ 26
      n12 = n1 MOD 26
      PRINT "Ref "; MID$("GAPMO", n11 + 1, 1); CHR$(65 + n12); n2; n3
      PRINT "Etb"; n4
    END IF
  END IF
LOOP

