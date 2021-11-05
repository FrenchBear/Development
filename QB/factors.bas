5 ' Factors.bas  Integer factorization
6 ' 2021-10-14 PV Square optimization
10 Data 2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,0
20 'WAIT 0
25 Input "N="; N
27 LD = 0: FF = 0: B = 0
30 Read D
40 If D = 0 Then FF = 1: GoTo 70
50 If N Mod D = 0 Then GoSub 100: N = N \ D: GoTo 50
60 If D * D < N Then 30
65 FF = 2
70 D = N: GoSub 100
80 End
100 If D = LD Then Let LP = LP + 1: Return
105 If LD = 0 Then 140
110 If B Then Print " * ";
120 B = 1
130 Print Str$(LD);
135 If LP > 1 Then Print "^"; Str$(LP);
140 If FF = 0 Then 150
142 If D = 1 Then Return
144 If B Then Print " * ";
145 If FF = 1 Then Print "(";
146 Print Str$(D);
147 If FF = 1 Then Print ")";
148 Return
150 LD = D
160 LP = 1
170 Return
