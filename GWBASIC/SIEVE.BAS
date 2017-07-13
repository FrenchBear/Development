'ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
'³   This  program demonstrates the SIEVE algorithm of determining prime     ³
'³   numbers. The algorithm is often used in benchmarking the speed of       ³
'³   compilers.                                                              ³
'³                                                                           ³
'³      In order to run this program do the following:                       ³
'³        1. Load Turbo Basic by typing TB at the DOS prompt.                ³
'³        2. Load the file SIEVE.BAS from the Load option of the File        ³
'³           pulldown menu.                                                  ³
'³        3. Select Run from the Main menu                                   ³
'ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

' The Classic Sieve of Eratosthenes Benchmark
'
DEFINT A-Z
DIM Flags(8190)

CLS
PRINT "Sieve - 25 iterations"
X# = TIMER

FOR Iter = 1 TO 25
  count = 0
  FOR I = 0 TO 8190
    Flags(I) = 1
  NEXT I
  FOR I = 0 TO 8190
    IF Flags(I) THEN
      Prime = I + I + 3
      K = I + Prime
      WHILE K <= 8190
	Flags(K) = 0
	K = K + Prime
      WEND
      count = count + 1
    END IF
  NEXT I
NEXT Iter

XX# = TIMER
PRINT USING "#### primes in ##.### seconds"; count; XX# - X#

END

