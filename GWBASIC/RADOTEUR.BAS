DECLARE FUNCTION radote$ (t$)
CLS
a$ = "peche poire pomme cerise banane kiwi vanille noix orange citron ananas mandarine clementine mangue myrtille prune abricot noisette melon mirabelle fraise framboise pamplemousse amande cassis chataigne coing figue datte grenade groseille litchi mure papaye pasteque raisin brugnon griotte merise goyave "

FOR i = 1 TO 100
  PRINT radote(a$); " ";
NEXT

FUNCTION radote$ (t$)
  DO
    m$ = ""
    DO
      p = INT((LEN(t$) - 1) * RND + 1)
    LOOP WHILE MID$(t$, p, 1) <> " "
	p = p + 1
	c$ = MID$(t$, p, 1)
    DO
      m$ = m$ + c$
      DO
        p = INT((LEN(t$) - 1) * RND + 1)
      LOOP UNTIL MID$(t$, p, 1) = c$
      DO
        p = p + 1
        IF p > LEN(t$) THEN p = 1
      LOOP UNTIL MID$(t$, p, 1) = c$
      p = p + 1
      c$ = MID$(t$, p, 1)
    LOOP UNTIL c$ = " "
  LOOP UNTIL LEN(m$) >= 4
  radote$ = m$
END FUNCTION
