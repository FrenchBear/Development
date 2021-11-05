5 ' FracPer.bas - Print fraction period in VB without using arrays (but O(d^2) time)
6 ' 2021-11-03 PV
10 n = 100: d = 23 ' 4.[3478260869565217391304]
20 'n = 1: d = 9801 ' 0.[000102030405060708091011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556575859606162636465666768697071727374757677787980818283848586878889909192939495969799]
30 n0 = n
40 n = n Mod d
60 k = 0
70 For i = 0 To d - 1
    80 n = n * 10
    100 n = n Mod d
    110 If n = 0 Then k = 1: GoTo 200
    120 m = n0
    130 For j = 0 To i - 1
        140 m = m * 10
        160 m = m Mod d
        170 If n = m Then k = 2: GoTo 200
    180 Next
190 Next
200 n = n0
210 Print Mid$(Str$(n \ d), 2); ".";
215 n = n Mod d
220 If k = 2 Then Print "[";
230 For i = 0 To d - 1
    240 n = n * 10
    250 dec = n \ d
    260 n = n Mod d
    270 If n = m And i > 0 Then Print "]";: GoTo 300
    280 Print Mid$(Str$(dec), 2);
    290 If n = 0 Then 300
295 Next
300 Print

