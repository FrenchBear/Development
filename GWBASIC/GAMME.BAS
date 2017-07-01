PLAY "t160"
PRINT "a: majeur"
PRINT "i: mineur"
PRINT "q: quitter"

DO
  PRINT "?"

  SELECT CASE LCASE$(INPUT$(1))
    CASE "q":
      EXIT DO
    CASE "a":
      PRINT "majeur"
      PLAY "o3cdefgab>c"
    CASE "i":
      PRINT "mineur"
      PLAY "o3cdd#fgg#b>c"
  END SELECT
LOOP

