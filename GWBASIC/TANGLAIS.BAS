DECLARE SUB test (mode%, t1$(), t2$())
DECLARE SUB testfrang ()
DECLARE SUB testangfr ()

DEFINT A-Z

CONST nbmaxmot = 1000, nbquest = 5

DIM SHARED fr$(1 TO nbmaxmot), ang$(1 TO nbmaxmot)
DIM SHARED nbm

CLS
PRINT "Test d'anglais"
PRINT

OPEN "I", #1, "dico"
DO
  nbm = nbm + 1
  LINE INPUT #1, ligne$
  p = INSTR(ligne$, ",")
  IF p = 0 THEN
    PRINT "Ligne incorrecte: manque une virgule: "; ligne$
    probleme = 1
  ELSE
    fr$(nbm) = LEFT$(ligne$, p - 1)
    ang$(nbm) = MID$(ligne$, p + 1)
    IF INSTR(ang$(nbm), ",") <> 0 THEN
      PRINT "Ligne incorrecte: plus d'une virgule: "; ligne$
      probleme = 1
    END IF
  END IF
  IF nbm = nbmaxmot THEN
    PRINT "Nombre maximum de mot atteint !"
    probleme = 1
    EXIT DO
  END IF
LOOP WHILE NOT EOF(1)
CLOSE

IF probleme THEN
  PRINT
  PRINT "Il y a eu des erreurs � la lecture du dictionnaire -> stop."
  END
END IF

DO
  PRINT
  PRINT "1: test fran�ais -> anglais"
  PRINT "2: test anglais -> fran�ais"
  PRINT "3: quitter"
  PRINT
  INPUT "Choix: ", ch$

  SELECT CASE ch$
    CASE "1": CALL test(1, fr$(), ang$())
    CASE "2": CALL test(2, ang$(), fr$())
    CASE "3", "q", "Q": PRINT "Au revoir...": END
    CASE ELSE: PRINT "R�pondez 1, 2 ou 3 !"
  END SELECT
LOOP

SUB test (mode, t1$(), t2$())

  SELECT CASE mode
    CASE 1: m1$ = "Fran�ais": m2$ = "Anglais "
    CASE 2: m1$ = "Anglais ": m2$ = "Fran�ais"
  END SELECT

  FOR i = 1 TO nbquest
    imot = INT(nbm * RND + 1)

    p = INSTR(t1$(imot), "|")
    IF p = 0 THEN p = LEN(t1$(imot)) + 1
    a$ = LEFT$(t1$(imot), p - 1)

    iessai = 1
    DO
      PRINT USING "##/##: "; i, nbquest;
      PRINT m1$; ": "; a$; TAB(35);
      PRINT m2$; ": ";
      INPUT ; "", tr$
      PRINT TAB(57);
      IF UCASE$(tr$) = "STOP" THEN EXIT SUB
      IF INSTR("|" + UCASE$(t2$(imot)) + "|", "|" + UCASE$(tr$) + "|") <> 0 THEN EXIT DO
      IF iessai > 3 THEN EXIT DO
      PRINT "Faux!  recommencez..."
      iessai = iessai + 1
    LOOP

    SELECT CASE iessai
      CASE 1: PRINT "F�licitations !"
      CASE 2: PRINT "Pas mal"
      CASE 3: PRINT "Bof"
      CASE ELSE:
              PRINT "Nul !"
              PRINT "La traduction �tait: ";
              t$ = t2$(imot)
              DO
                p = INSTR(t$, "|")
                IF p = 0 THEN PRINT t$: EXIT DO
                PRINT LEFT$(t$, p - 1); " ou ";
                t$ = MID$(t$, p + 1)
              LOOP
    END SELECT

  NEXT

END SUB

