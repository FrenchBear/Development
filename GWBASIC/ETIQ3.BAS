
WIDTH LPRINT 255

e$ = CHR$(27)

LPRINT e$; "D"; CHR$(27); CHR$(55); CHR$(0);
LPRINT e$; "3"; CHR$(37);

w1$ = e$ + "W1"
w0$ = e$ + "W0"

a$(0) = "Doc"
a$(1) = "Projet"
a$(2) = "Utilisation"
a$(3) = "Doc. annexe"
a$(4) = ""
a$(5) = "Date"

ta(0) = 38
ta(1) = 38
ta(2) = 38
ta(3) = 38
ta(4) = 38
ta(5) = 38

FOR i = 1 TO 9
  FOR j = 0 TO 5
    IF j = 0 THEN
      LPRINT w1$; a$(j); w0$; CHR$(9); w1$; a$(j); w0$; CHR$(9); w1$; a$(j); w0$;
    ELSE
      LPRINT a$(j); CHR$(9); a$(j); CHR$(9); a$(j);
    END IF
    LPRINT e$; "3"; CHR$(ta(j))
  NEXT
  LPRINT
NEXT

LPRINT CHR$(12);

