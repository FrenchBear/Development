DEFINT I-N
INPUT n
m = LOG(n) / LOG(2)
DIM pm(m + 1), ar(n), ai(n), x(n)
pm(1) = 2: pi = 4 * ATN(1)
FOR k = 1 TO m
pm(k + 1) = 2 * pm(k)
NEXT
a = 2 * pi / n
n0 = 8.555
b = n0 * a
FOR k = 1 TO n
  ar(k) = SIN(b * k)
  ai(k) = 0
NEXT
m2 = m / 2: mm = n - 1: j = 1
FOR i = 1 TO mm
  IF i < j THEN
    tr = ar(j): ti = ai(j)
    ar(j) = ar(i): ai(j) = ai(i)
    ar(i) = tr: ai(i) = tr
  END IF
  k = m2
  WHILE k < j
    j = j - k
    k = k / 2
  WEND
  j = j + k
NEXT i

FOR k = 1 TO m
  le = pm(k): l1 = le / 2
  ur = 1: ui = 0
  wr = COS(pi / l1): wi = SIN(pi / l1)
  FOR j = 1 TO l1
    FOR i = j TO m STEP le
      br = ar(i): bi = ai(i)
      ip = i + l1
      tr = ar(ip) * ur - ai(ip) * ui
      ti = ar(ip) * ui + ai(ip) * ur
      ar(ip) = br - tr: ai(ip) = bi - ti
      ar(i) = br + tr: ai(i) = bi + ti
    NEXT
    ua = ur * wr - ui * wi
    ui = ur * wi + ui * wr
    ur = ua
  NEXT
NEXT

FOR k = 1 TO n
  x(k) = ar(k) * ar(k) + ai(k) * ai(k)
NEXT

FOR k = 1 TO n
  PRINT k, ar(k), ai(k), x(k)
NEXT

FOR k = 1 TO n
  PRINT TAB(5 + INT(3 * x(k))); "*"
NEXT

