$ScreenHide
$Console
_Dest _Console

40 ' FracPer.bas - Print fraction period in VB without using arrays (but O(d^2) time)
50 ' 2021-11-03 PV
60 N = 100: D = 23: GoSub 150 ' 4.[3478260869565217391304]
70 'N= 1: D = 9801: GOSUB 150 ' 0.[000102030405060708091011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556575859606162636465666768697071727374757677787980818283848586878889909192939495969799]
80 N = 679: D = 550: GoSub 150
90 N = 1: D = 3: GoSub 150
100 N = 8: D = 4: GoSub 150
110 N = 0: D = 4: GoSub 150
120 N = 4: D = 0: GoSub 150
130 N = 0: D = 0: GoSub 150
140 End
150 Print: Print N; "/"; D; "= ";
160 If D = 0 And N = 0 Then Print "0/0 Undefined": Return
170 If D = 0 Then Print "/0 Error": Return
180 N0 = N
190 N = N Mod D
200 L = 0
210 K = 0
220 For I = 0 To D - 1
    230 If N = 0 Then K = 1: GoTo 320
    240 M = N0 Mod D
    250 For J = 0 To I - 1
        260 L = L + 1
        270 If N = M Then K = 2: GoTo 320
        280 M = (M * 10) Mod D
    290 Next
    300 N = (N * 10) Mod D
310 Next
320 N = N0
330 Print Mid$(Str$(N \ D), 2);
340 N = N Mod D
350 If N = 0 Then 460
360 Print ".";
370 For I = 0 To D - 1
    380 If K = 2 And I = J Then Print "[";
    390 N = N * 10
    400 DEC = N \ D
    410 N = N Mod D
    420 Print Mid$(Str$(DEC), 2);
    430 If N = M And I >= J Then Print "]";: GoTo 460
    440 If N = 0 Then 460
450 Next
460 Print
470 Print L; "iterations"
480 Return

