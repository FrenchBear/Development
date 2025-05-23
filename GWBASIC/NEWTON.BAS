DECLARE FUNCTION kf% (x!, y!)

DEFINT I-N
SCREEN 7

CONST xmax = 100
CONST ymax = 100
CONST eps = .0001
CONST cr = .8660254037844386#

DEF fnpr (a, b) = a * a * a - 3 * a * b * b - 1
DEF fnpi (a, b) = 3 * a * a * b - b * b * b

DEF fnp.r (a, b) = 3 * (a * a - b * b)
DEF fnp.i (a, b) = 6 * a * b

FOR i = 0 TO xmax
  FOR j = 0 TO ymax
    x = (i / xmax - .5) * 4
    y = (j / ymax - .5) * 4
    PSET (i, j), kf(x, y)
  NEXT
NEXT

FUNCTION kf (a, b)

n = 0

DO
  c = fnpr(a, b)
  d = fnpi(a, b)
  e = fnp.r(a, b)
  f = fnp.i(a, b)

  div = e * e + f * f

  IF div = 0 THEN kf = 15: EXIT FUNCTION

  a1 = a - (c * e + d * f) / div
  b1 = b - (d * e - c * f) / div

  IF ABS(a - a1) < eps AND ABS(b - b1) < eps THEN EXIT DO

  a = a1
  b = b1
  n = n + 1
LOOP

IF b < -.1 THEN kf = 12: EXIT FUNCTION
IF b > .1 THEN kf = 11: EXIT FUNCTION
kf = 14
 
END FUNCTION

