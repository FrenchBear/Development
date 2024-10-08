DECLARE FUNCTION inpnb! (message$)
DECLARE FUNCTION inpstr$ (message$)

DIM cl$(41), fu$(9, 10), k(9), e(2, 2)

WIDTH 80, 50

CONST pi = 3.141593
CONST inpfic = 1

IF inpfic THEN OPEN "I", #1, "mazda.inp"

DATA "002500140","002500130","002800085","002800080","002500115","003600080"
DATA "004500335","004500325","004800210","004800200","004500300","004800320"
DATA "005600200","007100520","007100510","007600330","007600325","007100480"
DATA "007600510",'008200325","025000560","050001400","009400385","014100650"
DATA "026701400","042302400","074004200","106006000","008800580","016701600"
DATA "027802500","044004700","105512000","027801900","041002500","042303200"
DATA "105008400","209317000","050000830","100001840","050001000","100002500"
FOR i = 0 TO 41
  READ cl$(i)
NEXT i

DATA "690","755","795","836","852","886","909","927","951","967","100"
DATA "566","648","700","755","783","832","865","889","920","940","110"
DATA "440","536","673","707","760","806","832","859","887","903","130"
DATA "362","454","584","630","688","748","787","821","860","884","160"
DATA "285","375","556","612","647","728","780","809","854","883","190"
DATA "222","347","579","646","703","773","823","843","877","898","200"
DATA "245","322","473","528","559","646","701","734","787","823","200"
DATA "226","292","426","477","503","588","641","676","731","769","190"
DATA "150","243","403","475","523","624","692","728","787","826","200"
DATA "142","208","325","375","404","486","541","577","636","678","230"
FOR j = 0 TO 9
  FOR z = 0 TO 10
    READ fu$(j, z)
  NEXT z
NEXT j

DATA 0.6, 0.8, 1.0, 1.25, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0
FOR i = 0 TO 9
  READ k(i)
NEXT i

CLS
np$ = inpstr$("NOM DU PROJET ............. ")

nouveau.local:
PRINT : a = inpnb("LONGUEUR DU LOCAL ......... ")
PRINT : b = inpnb("LARGEUR DU LOCAL .......... ")
PRINT : ht = inpnb("HAUTEUR SOL/PLAFOND ....... ")
PRINT : hu = inpnb("HAUTEUR PLAN UTILE ........ ")
PRINT : fr = inpnb("FACTEURS DE REFLEXION [xxx] ")
r4 = (fr MOD 10) / 10: fr = fr \ 10
r3 = (fr MOD 10) / 10: fr = fr \ 10
r1 = fr / 10

PRINT : d = inpnb("DEPRECIATION [>=1] ........ ")
PRINT : b$ = inpstr$("Luminaire d�ja choisi [o/n] ")
IF UCASE$(b$) = "O" GOTO 195

label.d:
PRINT
PRINT "CHOISISSEZ UN LUMINAIRE"
na$ = inpstr$("Son nom ................... ")
PRINT
PRINT "DONNEES ECLAIRAGISTE"
PRINT "entrez ainsi: 0.##X+0.##T . : 0.";
GOSUB label.b: g$ = b$: PRINT b$;
GOSUB label.b: PRINT b$;
ri = VAL(g$ + b$) / 100
GOSUB label.e
cp = ASC(b$) - 65
PRINT b$; "+0.";
GOSUB label.b: g$ = b$: PRINT b$;
GOSUB label.b: PRINT b$; "T"
rs = VAL(g$ + b$) / 100

PRINT
b$ = inpstr$("APPAREIL SUSPENDU [o/n] ... ")
IF UCASE$(b$) = "N" THEN
  j0 = 0
  hs = 0
  r2 = r1
ELSE
  j0 = 1 / 3
  PRINT
  hs = inpnb("HAUTEUR DE SUSPENSION ..... ")
  r2 = r3
END IF

195 :
PRINT
b$ = inpstr$("LAMPE DEJA CHOISIE [o/n] .. ")
IF UCASE$(b$) = "O" GOTO 360

label.f:
PRINT
DO
  cl = inpnb("Entrez code lampe [xx] .... ")
  IF cl > 41 THEN PRINT "CODE ERRONE"
LOOP WHILE cl < 0 OR cl > 41

v = VAL(LEFT$(cl$(cl), 4))
fl = VAL(RIGHT$(cl$(cl), 5)) * 10


cl = 8
SELECT CASE cl
  CASE IS < 6: la = .8
  CASE IS < 13: la = 1.4
  CASE IS < 20: la = 1.7
  CASE ELSE: la = .7
END SELECT


360 :
PRINT
nl = inpnb("Nb.LAMPES/APPAREIL ........ ")
h = ht - hu - hs

k = a * b / (h * (a + b))
IF k < .4 OR k > 7 THEN
  BEEP
  PRINT "INDICE LOCAL HORS NORMES"
  GOTO 1400
END IF

FOR i = 0 TO 8
  IF k < (k(i) + k(i + 1)) / 2 THEN k = k(i): GOTO 510
  IF k = (k(i) + k(i + 1)) / 2 THEN k = k(i + 1): GOTO 510
NEXT i
k = k(9)

510 :
fu = VAL(fu$(cp, i)) / 1000
de = VAL(fu$(cp, 10)) / 100
g1 = 0: g2 = 0: g3 = 0: k9 = k: GOSUB label.r
g1 = z: g4 = 1 - g1
IF j0 <> 0 THEN
  k9 = (1 - j0) * k: GOSUB label.r
  g3 = z: k9 = k9 / (2 * j0): GOSUB label.r: g2 = z
END IF

e(0, 0) = 1 - r1 + 2 * j0 * (1 - r2) / ((1 - j0) * k)
e(0, 1) = 2 * (1 - r3) / k
e(0, 2) = 1 - r4
e(2, 0) = g3 * (r2 - r1) - g1 * r2
e(2, 1) = -g4 * r3
e(2, 2) = 1
e(1, 0) = g2 * (r2 - r1) - r2
e(1, 1) = e(0, 1) - e(2, 1)
e(1, 2) = 1 - g4 * r4

FOR i = 0 TO 2
  e(i, i) = e(i, i) + 1
NEXT i
FOR m = 0 TO 2
  p = e(m, m) - 1
  IF p = 0 THEN PRINT "CALCUL LUMINANCES IMPOSSIBLE !!!": STOP
  FOR z = 0 TO 2
    e(m, z) = e(m, z) / p
  NEXT z
  FOR i = 0 TO 2
    IF i <> m THEN
      q = e(i, m)
      FOR z = 0 TO 2
        e(i, z) = e(i, z) - q * e(m, z)
      NEXT z
    END IF
  NEXT i
NEXT m
FOR i = 0 TO 2
  e(i, i) = e(i, i) - 1
NEXT i

u1 = (e(0, 2) * fu + e(0, 0) + e(0, 1)) * ri + e(0, 0) * rs
u3 = (e(1, 2) * fu + e(1, 0) + e(1, 1)) * ri + e(1, 0) * rs
u4 = (e(2, 2) * fu + e(2, 0) + e(2, 1)) * ri + e(2, 0) * rs

PRINT
PRINT USING "u1=#.###  u3=#.###  u4=#.###"; u1, u3, u4

label.g:
PRINT
b$ = inpstr$("NB.LUMINAIRE IMPOSE [o/n] . ")
PRINT
IF UCASE$(b$) = "O" THEN
  n = inpnb("NOMBRE DE LUMINAIRES ...... ")
ELSE
  e = inpnb("ECLAIRAGE DEMANDE (lux) ... ")
  n = e * d * a * b / (nl * fl * u4)
  IF n <> INT(n) THEN n = INT(n) + 1
END IF

n3 = a / (de * h)
n4 = b / (de * h)
IF n3 <> INT(n3) THEN n3 = INT(n3) + 1
IF n4 <> INT(n4) THEN n4 = INT(n4) + 1

IF n < n3 * n4 THEN
  BEEP
  PRINT "ESPACEMENTS TROP GRANDS !!!"
END IF

GOSUB label.t
PRINT "N ="; n; "  *MIN/L = "; n3; "  *min/l = "; n4
PRINT "E1="; e1; " E3="; e3; " E4="; e4

IF UCASE$(b$) = "N" THEN
  PRINT
  b$ = inpstr$("NOMBRE DE LUMINAIRES OK [o/n] ... ")
  IF UCASE$(b$) = "N" GOTO label.g
END IF


PRINT
PRINT "AIDE A L'IMPLANTATION"
PRINT

910 C = SQR(n * a / b):
IF cl > 19 THEN
  ll = .7
ELSE
  SELECT CASE nl
    CASE 1: ll = .2
    CASE 2: ll = .4
    CASE ELSE: ll = .7
  END SELECT
END IF
b$ = inpstr$("APPAREILS // A LA LONGUEUR [o/n] ")
PRINT
IF UCASE$(b$) = "O" THEN
  PRINT "APPAREILS // A LA LONGUEUR"
  n1 = INT(a / la)
  n2 = INT(b / ll)
ELSE
  PRINT "APPAREILS // A LA LARGEUR"
  n1 = INT(a / ll)
  n2 = INT(b / la)
END IF

PRINT "min/long ="; n3
PRINT "min/larg ="; n4
PRINT "max/long ="; n1
PRINT "max/larg = "; n2

PRINT
PRINT "COMBINAISONS AUTORISEES :"
SELECT CASE n
  CASE IS < 30: pc = 20
  CASE IS < 100: pc = 10
  CASE IS < 200: pc = 7.5
  CASE IS < 400: pc = 5
  CASE ELSE: pc = 2.5
END SELECT

FOR i = n3 TO n1
  FOR j = n4 TO n2
    IF (i * j >= n - n * pc / 100) AND (i * j <= n + n * pc / 100) THEN
      PRINT USING "## * ## = ###   E4=####"; i, j, i * j, INT(i * j * e4 / n)
    END IF
  NEXT j
NEXT i

PRINT
PRINT "COMBINAISONS PROPORTIONNEES A A/B"
IF C <> INT(C) THEN
  PRINT INT(C + 1); " *"; INT(n / C) + 1; " ="; INT(C + 1) * (INT(n / C) + 1)
  PRINT INT(C + 1); " *"; INT(n / C); " ="; INT(C + 1) * INT(n / C)
END IF
PRINT INT(C); " *"; INT(n / C) + 1; " ="; INT(C) * (INT(n / C) + 1)
PRINT INT(C); " *"; INT(n / C); " ="; INT(C) * INT(n / C)

PRINT
na = inpnb("NOMBRE D'APP. DANS LA LONGUEUR .. ")

PRINT
nb = inpnb("NOMBRE D'APP. DANS LA LARGEUR  .. ")
n = na * nb

PRINT
PRINT "SOLUTION CHOISIE :"
PRINT USING "## * ## = ### appareils"; na, nb, n
GOSUB label.t
GOSUB label.u
PRINT "PUISSANCE INSTALLEE : "; v * nl * n / 1000; " KW"
PRINT "ESPACEMENT / LONGUEUR : "; INT(100 * a / na) / 100; " M"
PRINT "ESPACEMENT / LARGEUR  : "; INT(100 * b / nb) / 100; " M"

1400 :
b$ = inpstr$("NOUVEAU LOCAL [o/n] ...... ")
IF UCASE$(b$) = "O" THEN GOTO nouveau.local
b$ = inpstr$("NOUVEAU LUMINAIRE [o/n] .. ")
IF UCASE$(b$) = "O" THEN GOTO label.d
b$ = inpstr$("NOUVELLE LAMPE [o/n] ... ")
IF UCASE$(b$) = "O" THEN GOTO label.f
END

label.t:
  e = n * nl * fl / (a * b * d): PRINT "E = "; e; " lux"
  e1 = INT(e * u1): e3 = INT(e * u3): e4 = INT(e * u4)
  RETURN

label.u:
  PRINT "ECLAIREMENTS MOYENS"
  PRINT "   PLAFOND :"; e1; " lux"
  PRINT "      MURS :"; e3; " lux"
  PRINT "PLAN UTILE :"; e4; " lux"
  PRINT
  PRINT "� la mise en service : "; INT(e4 * d); " lux"
  RETURN


label.b:
  DO
    IF inpfic THEN b$ = INPUT$(1, 1) ELSE b$ = INPUT$(1)
  LOOP WHILE b$ < "0" OR b$ > "9"
  RETURN

label.e:
  DO
    IF inpfic THEN b$ = INPUT$(1, 1) ELSE b$ = INPUT$(1)
    b$ = UCASE$(b$)
  LOOP WHILE b$ < "A" OR b$ > "J"
  RETURN

label.r:
  k9 = 2 * k9
  j1 = k9 / SQR(k9 ^ 2 + 1)
  j2 = k9
  z1 = ATN(j1) / j1 + (j1 ^ 2 - 1) * LOG(j1 ^ 2 + 1) / (4 * j1 ^ 2) - LOG(j1) / 2
  z2 = ATN(j2) / j2 + (j2 ^ 2 - 1) * LOG(j2 ^ 2 + 1) / (4 * j2 ^ 2) - LOG(j2) / 2
  z = (z1 - z2) / (pi / 4)
  RETURN

FUNCTION inpnb (message$)
  PRINT message$; ": ";
  IF inpfic THEN
    INPUT #1, a
    IF a >= 0 THEN PRINT MID$(STR$(a), 2) ELSE PRINT a
  ELSE
    INPUT "", a
  END IF
  inpnb = a
END FUNCTION

FUNCTION inpstr$ (message$)
  PRINT message$; ": ";
  IF inpfic THEN
    LINE INPUT #1, a$
    PRINT a$
  ELSE
    INPUT "", a$
  END IF
  inpstr$ = a$
END FUNCTION

