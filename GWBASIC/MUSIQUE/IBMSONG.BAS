4 WIDTH 80
5 ON ERROR GOTO 9500
6 PLAY ("P64")
10 GOSUB 9000
30 B$ = CHR$(2)
40 DIM N$(165)
50 DIM L$(15)
60 DIM B%(253)
70 X% = 165
80 FOR I% = 1 TO X%
90 READ N$(I%)
100 NEXT I%
110 RESTORE 790
120 FOR I% = 1 TO 15
130 READ L$(I%)
140 NEXT I%
150 RESTORE 960
160 FOR I% = 1 TO 253
170 READ B%(I%)
180 NEXT I%
181 PRINT "(Press any key to begin.)";
183 IF INKEY$ = "" THEN 183
190 CLS
200 FOR I% = 1 TO 9
210 PRINT : PRINT L$(I%)
220 NEXT I%
230 R% = 1
240 S% = 1
250 B1% = 0
260 FOR I% = S% TO 165
270 C% = B%(I% + B1%)
280 IF C% > 0 THEN GOTO 310
290 C% = -C%
300 R% = R% + 2
310 LOCATE R%, C%
320 PRINT B$
330 PLAY N$(I%)
340 LOCATE R%, C%
350 PRINT " "
360 NEXT I%
370 IF B1% = 0 THEN 380
371 LOCATE 21, 1
372 PRINT "Transcription of music and lyrics from a copy of a copy... of 'Ever Onward,'"
373 PRINT "and program written by Alden B. Johnson."
374 END
380 B1% = 88
390 S% = 78
400 CLS
410 COLOR 0, 7
420 LOCATE 1, 30
430 PRINT "Second Chorus"
440 COLOR 7, 0
450 LOCATE 3, 1
460 FOR I% = 10 TO 15
470 PRINT L$(I%)
480 PRINT
490 NEXT I%
500 R% = 2
510 GOTO 260
520 END
530 DATA MF T170 L8 MN O3 B4,B8,O4 D4,D8,O3 G4,G8,B4,B8,E4,E8,E4,E8
540 DATA ML E4.E4 MN P64,E8,F#4,E8,D4,E8,F#4,G8,A4,A#8,ML B4.B4.B4. MN P64
550 DATA D4.,B4,B8,O4 D4,D8,O3 G4,G8,B4,B8,E4,E8,E4,E8,ML E4.E4 MN P64
570 DATA F8,F#4,E8,D4,E8,F#4,G8,A4,B8,ML G4.P64,G4.P64,G4.G4 P64 MN,G8
590 DATA F#4,F#8,A4,A8,O4 D4,D8,O3 A4,A8,F#4,F#8,A4,A8,ML O4 D4.D4 P64 MN,D8
610 DATA D4,D8,D4,D8,D4,D8,D4,D8,D4,C8,O3 A4,F#8,D4.
630 DATA O3 D4.,E4.,F#4.,G4.,F#4.,G4.,G#4.,A4.,G4,A8,B4,G8
650 DATA A4,B8,A4,G8,E4.,ML E4.E4 P64 MN,E8,D#4,E8,G4,F#8,F#4,F8
670 DATA F#4.,F4,F#8,A4,G8,G4,F#8,G4.,F#4,G8,B4,A8,A4,G#8
690 DATA A4,E8,F#4,G8,A4.,ML A4.A4 P64 MN,D8,C#4,D8,G4.,G4.
710 DATA ML G4.G4 P64 MN,D8,E4.,F4.,ML G4.G4 P64 MN,G#8,A4,A8,A4,B8
730 DATA O4 C#4,C#8,O3 B4,A8,O4 ML D4.D4.D4 P64 MN,C8,O3 A4,F#8,D4.,E4.,F#4.,G4.
750 DATA F#4,F#8,G4,G8,G#4,G#8,A8,G#8,A8,B4,O4 C8,D4,E8,O3 B4.,A4.
770 DATA ML G4.G4.G4 MN
790 DATA"There's a feel-ing ev'ry where of big-ger things in store. Of new hor-i-zons"
800 DATA"com-ing in-to view. Our aim is clear: To make each year ex-ceed the one be-fore"
810 DATA"Stay-ing in the lead in ev'ry-thing we do. The will to win is built right in."
820 DATA"It will not be de-nied. And we will go a-head we know by work-ing side by side."
830 DATA"Ev-er On-ward, Ev-er On-ward That's the spir-it that has brought us fame."
840 DATA"We're big but big-ger we will be. We can't fail for all can see that to serve"
850 DATA"hu-man-i-ty has been our aim; Our pro-ducts now are known in ev'ry zone."
860 DATA"Our rep-u-ta-tion spark-les like a gem, We've fought our way thru and new"
870 DATA"Fields we're sure to con-quer too for the Ev-er On-ward  I B M"
880 DATA"Ev-er On-ward, Ev-er On-ward We're bound for the top to nev-er fall."
890 DATA"Right here and now we thank-ful-ly pledge sin-cer-est loy-al-ty to the"
900 DATA"cor-por-a-tion that's the best of all. Our lead-ers we re-vere,"
910 DATA"and while we're here, Let's show the world just what we think of them!"
920 DATA"So let us sing men, sing men, once or twice then sing a-gain for the"
930 DATA"                              Ev-er On-ward  I B M"
960 DATA 3,9,12,17,21,23,28,32,36,39,45,50,55,60,64,68,71,74
980 DATA -2,6,9,12,17,22,26,29,34,39,43,48,53,57,61,66,70,73,78
1000 DATA -2,3,7,10,14,18,22,26,28,32,37,40,45,49,53,57,60,65,71,75
1020 DATA -1,6,10,13,16,20,26,29,33,37,40,43,47,51,55,59,64,68,72,77
1040 DATA -1,4,7,11,16,19,22,26,32,38,43,46,50,55,61,66,70,70
1060 DATA -3,8,12,16,20,23,27,31,35,40,45,50,54,58,62,66,70,75
1080 DATA -1,5,8,10,14,18,23,27,27,32,36,40,46,50,55,59,63,65,70
1100 DATA -2,6,9,11,15,21,26,30,34,37,43,49,55,59,63,68,72
1120 DATA -3,10,15,19,23,27,32,36,40,44,46,49,53,58,60,62
1140 DATA 1,4,7,11,16,19,22,26,32,38,43,47,51,54,58,61,66,66
1160 DATA -3,8,13,17,20,25,30,33,38,44,48,52,56,59,62,65,69
1180 DATA -2,6,9,12,18,24,28,32,36,36,41,46,50,53,56,60
1200 DATA -2,7,13,18,24,30,35,40,45,50,54,59,63,68
1220 DATA -1,5,8,12,17,22,27,32,36,41,46,51,55,58,63,67
1240 DATA -31,34,37,41,46,48,50
1250 END
9000 COLOR 7, 0
9010 KEY OFF
9020 CLS
9030 DIM H$(9)
9040 H$(1) = "In the legend of IBM, there are tales of a ritual frequently performed"
9050 H$(2) = "long, long ago in sales meetings, far, far away.  This ritual involved"
9060 H$(3) = "young salesmen and centered around a small book of chants, or songs.  It is"
9070 H$(4) = "said that these songs were a source of great inspiration to the salesforce"
9080 H$(5) = "as it prepared to go out into the world. Although this ritual is no longer"
9090 H$(6) = "practiced, one of the songs has nevertheless survived, being copied and"
9100 H$(7) = "passed down through generation after generation of IBMers."
9110 H$(8) = "The IBM Philharmonic Computer presents:"
9120 FOR I% = 1 TO 8
9130 PRINT H$(I%)
9140 NEXT I%
9150 COLOR 0, 7
9160 LOCATE 9, 25
9170 PRINT CHR$(201); : FOR I% = 1 TO 30: PRINT CHR$(205); : NEXT I%: PRINT CHR$(187)
9180 L$ = CHR$(186)
9190 L1$ = L$ + SPACE$(30) + L$
9200 LOCATE 10, 25: PRINT L$ + "       IBM Rally Song         " + L$
9210 LOCATE 11, 25: PRINT L1$
9220 LOCATE 12, 25: PRINT L$ + "         ";
9230 COLOR 15, 0: PRINT "EVER ONWARD"; : COLOR 0, 7
9240 PRINT "          " + L$
9250 FOR I% = 13 TO 20: LOCATE I%, 25: PRINT L1$: NEXT I%
9260 LOCATE 21, 25: PRINT L$ + "    Written especially for    " + L$
9270 LOCATE 22, 25: PRINT L$ + "       IBM Corporation        " + L$
9280 LOCATE 23, 25
9290 PRINT CHR$(200); : FOR I% = 1 TO 30: PRINT CHR$(205); : NEXT I%: PRINT CHR$(188)
9300 COLOR 7, 0
9340 RETURN
9500 CLS
9510 PRINT "This program requires ADVANCED BASIC; Please reload, using BASICA"
9520 END

