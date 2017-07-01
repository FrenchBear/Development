# makefile de scoansi
# PV 14/4/96

CFLAGS = -J

ansi:	lex.yy.o
		cc lex.yy.o -ll -o ansi

lex.yy.c:	scoansi.l
			lex scoansi.l
