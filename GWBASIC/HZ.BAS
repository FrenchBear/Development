
DO
  i = INT(5 * RND)
  f = 13000 + 1000 * i
  PRINT f
  DO
    SOUND f, 1
  LOOP UNTIL INKEY$ <> ""

LOOP

