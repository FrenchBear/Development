
WIDTH LPRINT 255

e$ = CHR$(27)

LPRINT e$; "D"; CHR$(27); CHR$(55); CHR$(0);
LPRINT e$; "3"; CHR$(37);

a$(0) = "Pierre VIOLENT"
a$(1) = "48, rue Nicolas CHORIER"
a$(2) = "38000 GRENOBLE"
a$(3) = ""
a$(4) = "Tel: 76.70.00.52"
a$(5) = ""

ta(0) = 38
ta(1) = 38
ta(2) = 38
ta(3) = 38
ta(4) = 38
ta(5) = 38

FOR i = 1 TO 9
  FOR j = 0 TO 5
    LPRINT a$(j); CHR$(9); a$(j); CHR$(9); a$(j);
    LPRINT e$; "3"; CHR$(ta(j))
  NEXT
  LPRINT
NEXT

LPRINT CHR$(12);

