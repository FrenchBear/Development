DECLARE SUB xplay (a$)

' P.V.  19.X.88
PLAY "t140l16mb"
 
100
xplay "o4 g8 b- g"
xplay "d8 g d o3 b-8 o4 d o3 b-"
xplay "g4 d g b- g"

110
xplay "a g a g f# a o4 c o3 a"
xplay "b-8 g8 o4 g8 b- g"
xplay "d8 g d o3 b-8 o4 d o3 b-"

120
xplay "g4 b-8 b-8"
xplay "b-8 b-8 o4 g8 o3 b-8"
xplay "ml b-24 o4 c24 o3 b-24 a8 mn o4 d8 d8"
xplay "d8 d8 b-8 d8"
xplay "d24 e24 d24 c#8 o3 ml a o4 d f d mn"

130
xplay "e d e d c# e g e"
xplay "f e f e d f d c#"
xplay "d g d c# d a d c#"
xplay "d b- d c# d b- a g"

140
xplay "a f e d f8 e24 f24 e24"
xplay "d4 g8 b- g"
xplay "d4 d8 f d"
148
xplay "o3 a8 o4 d o3 a f8 a f"

150
xplay "d4 ml a-8 g8 mn"
xplay "o4 c8 o3 b o4 d f8 e- d"
xplay "ml e-8 c8 mn e-8 g e-"
xplay "c8 e- c o3 a8 o4 c o3 a"

160
xplay "f4 mn f b- o4 d o3 b-"
xplay "o4 c o3 b- o4 c o3 b- a o4 c e- c"
xplay "d c d c o3 b- o4 d o3 b- a"
xplay "b- o4 e- o3 b- a b- o4 f o3 b- a"

170
xplay "b- o4 g o3 b- a b- o4 g f e-"
xplay "f d c o3 b- o4 d8 c24 d24 c24"
xplay "o3 b-4 "

SUB xplay (a$)

  PLAY a$

  DIM t$(100)
  FOR i = 1 TO 100
    IF i <= LEN(a$) THEN t$(i) = MID$(a$, i, 1) ELSE t$(i) = CHR$(0)
  NEXT

  i = 1
  t = 0
  WHILE i <= LEN(a$)
    SELECT CASE t$(i)
      CASE "o": i = i + 1
      CASE "m": i = i + 1
      CASE " ":
      CASE "a", "b", "c", "d", "e", "f", "g":
           k$ = t$(i + 1)
           IF k$ = "-" OR k$ = "#" THEN i = i + 1: k$ = t$(i + 1)
           IF k$ >= "0" AND k$ <= "9" THEN
             i = i + 1
             IF t$(i + 1) >= "0" AND t$(i + 1) <= "9" THEN
               i = i + 1
               t = t + 16 / VAL(k$ + t$(i))
             ELSE
               t = t + 16 / VAL(k$)
             END IF
           ELSE
             t = t + 1
           END IF

    END SELECT
    i = i + 1
  WEND

END SUB

