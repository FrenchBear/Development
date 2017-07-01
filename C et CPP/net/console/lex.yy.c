# include "stdio.h"
# define U(x) ((unsigned char)(x))
# define NLSTATE yyprevious=YYNEWLINE
# define BEGIN yybgin = yysvec + 1 +
# define INITIAL 0
# define YYLERR yysvec
# define YYSTATE (yyestate-yysvec-1)
# define YYOPTIM 1
# ifndef YYLMAX
# define YYLMAX 200
# endif
# define output(c) (void)putc(c,yyout)
#if defined(__cplusplus) || defined(__STDC__)
# if defined(__cplusplus) && !defined(LEX_USES_CPLUS_LINKAGE)
   extern "C" {
# endif
	int yyback(int *, int);
	int yyinput(void);
	int yylook(void);
	void yyoutput(int);
	int yyracc(int);
	int yyreject(void);
	void yyunput(int);

#ifdef __STDC__
#ifndef yyless
	void yyless(int);
#endif
#ifndef yywrap
	int yywrap(void);
#endif
#endif /*__STDC__*/

# if defined(__cplusplus) && !defined(LEX_USES_CPLUS_LINKAGE)
   }
# endif /*defined(__cplusplus) && !defined(LEX_USES_CPLUS_LINKAGE)*/
#endif /*defined(__cplusplus) || defined(__STDC__)*/
# define input() (((yytchar=yysptr>yysbuf?U(*--yysptr):getc(yyin))==10?(yylineno++,yytchar):yytchar)==EOF?0:yytchar)
# define unput(c) {yytchar= (c);if(yytchar=='\n')yylineno--;*yysptr++=yytchar;}
# define yymore() (yymorfg=1)
# define ECHO (void)fprintf(yyout, "%s",yytext)
# define REJECT { nstr = yyreject(); goto yyfussy;}
int yyleng; extern char yytext[];
int yymorfg;
extern char *yysptr, yysbuf[];
int yytchar;
FILE *yyin = {stdin}, *yyout = {stdout};
extern int yylineno;
struct yysvf { 
	struct yywork *yystoff;
	struct yysvf *yyother;
	int *yystops;};
struct yysvf *yyestate;
extern struct yysvf yysvec[], *yybgin;

# line 3 "scoansi.l"
/* scoansi.l
** Analyseur lexico de s‚quences de terminal ANSI SCO
** 14/4/96 PV
*/

enum
{ 
  CBT=256,	// Cursor Backward Tabulation
  CNL,		// Cursor Next Line
  CPL,		// Cursor to Previous Line
  CUB,		// Cursor Backward
  CUD,		// Cursor Down
  CUF,		// Cursor Forward
  CUP,		// Cursor Position
  CUU,		// CUrsor Up
  DCH,		// Delete Character
  DL,		// Delete Line
  ECH,		// Erase Character
  ED,		// Erase in Display
  EL,		// Erase in Line
  HPA,		// Horizontal Position Absolute
  HPR,		// Horizontal Position Relative
  HVP,		// Horizontal & Vertical Position
  ICH,		// Insert Character
  IL,		// Insert Line
  MC,		// Media Copy
  RM,		// Reset Mode
  RMAM,		// Reset Mode Automatic Margins
  SD,		// Scroll Down
  SGR,		// Select Graphic Rendition
  SM,		// Set Mode
  SMAM,		// Set Mode Automatic Margins
  SU,		// Scoll Up
  TBC,		// Tabulation Clear
  VPA,		// Vertical Position Absolute
  VPR,		// Vertical Position Relative

  ExtOC,	// Overscan Color
  ExtBP,	// Bell Parameter
  ExtCS,	// Cursor Scanline
  ExtBI,	// Background Intensity
  ExtBBB,	// Blink vs Bold Background
  ExtAGC,	// Alternate Graphics Set Character
  ExtNF,	// Normal Foreground
  ExtNB,	// Normal Background
  ExtRF,	// Reverse Foreground
  ExtRB,	// Reverse Background
  ExtGF,	// Graphics Foreground
  ExtGB,	// Graphics Background
  ExtFNR,	// Fill New Regions attribute
  ExtRCF,	// Returns Current Foreground
  ExtSCP,	// Save Cursor Position
  ExtRCP,	// Restore Cursor Position
  ExtSS,	// Screen Switch
  ExtFKD,	// Function Key Definition
};

int p1;		// 1er argument d'une fonction
int p2;		// 2Šme argument d'une fonction
int p3;		// 3Šme argument d'une fonction

int dec(int iOff, int iFonction)
{
  extern char *strchr();
  char *pp = strchr(yytext, ';');
  p1 = atoi(yytext+2+iOff);
  if (pp!=NULL)
  {
	p2 = atoi(pp+1);
	pp = strchr(pp+2, ';');
	if (pp!=NULL)
	  p3 = atoi(pp+1);
	else
	  p3 = 0;
  }
  else
	p2 = p3 = 0;

  return iFonction;
}

# define YYNEWLINE 10
yylex(){
int nstr; extern int yyprevious;
while((nstr = yylook()) >= 0)
yyfussy: switch(nstr){
case 0:
if(yywrap()) return(0); break;
case 1:

# line 91 "scoansi.l"
		{ return dec(0, CBT); }
break;
case 2:

# line 92 "scoansi.l"
		{ return dec(0, CNL); }
break;
case 3:

# line 93 "scoansi.l"
		{ return dec(0, CPL); }
break;
case 4:

# line 94 "scoansi.l"
		{ return dec(0, CUB); }
break;
case 5:

# line 95 "scoansi.l"
		{ return dec(0, CUF); }
break;
case 6:

# line 96 "scoansi.l"
		{ return dec(0, CUD); }
break;
case 7:

# line 97 "scoansi.l"
		{ return dec(0, CUU); }
break;
case 8:

# line 98 "scoansi.l"
{ return dec(0, CUP); }
break;
case 9:

# line 99 "scoansi.l"
		{ return dec(0, DCH); }
break;
case 10:

# line 100 "scoansi.l"
		{ return dec(0, DL); }
break;
case 11:

# line 101 "scoansi.l"
		{ return dec(0, ECH); }
break;
case 12:

# line 102 "scoansi.l"
		{ return dec(0, ED); }
break;
case 13:

# line 103 "scoansi.l"
		{ return dec(0, EL); }
break;
case 14:

# line 104 "scoansi.l"
		{ return dec(0, HPA); }
break;
case 15:

# line 105 "scoansi.l"
		{ return dec(0, HPR); }
break;
case 16:

# line 106 "scoansi.l"
{ return dec(0, HVP); }
break;
case 17:

# line 107 "scoansi.l"
		{ return dec(0, ICH); }
break;
case 18:

# line 108 "scoansi.l"
		{ return dec(0, IL); }
break;
case 19:

# line 109 "scoansi.l"
			{ return MC; }
break;
case 20:

# line 110 "scoansi.l"
			{ return RM; }
break;
case 21:

# line 111 "scoansi.l"
			{ return SM; }
break;
case 22:

# line 112 "scoansi.l"
		{ return RMAM; }
break;
case 23:

# line 113 "scoansi.l"
		{ return SMAM; }
break;
case 24:

# line 114 "scoansi.l"
		{ return dec(0, SD); }
break;
case 25:

# line 115 "scoansi.l"
		{ return dec(0, SU); }
break;
case 26:

# line 116 "scoansi.l"
{ return dec(0, SGR); }
break;
case 27:

# line 117 "scoansi.l"
		{ return dec(0, TBC); }
break;
case 28:

# line 118 "scoansi.l"
		{ return dec(0, VPA); }
break;
case 29:

# line 119 "scoansi.l"
		{ return dec(0, VPR); }
break;
case 30:

# line 120 "scoansi.l"
		{ return dec(1, ExtOC); }
break;
case 31:

# line 121 "scoansi.l"
{ return dec(1, ExtBP); }
break;
case 32:

# line 122 "scoansi.l"
{ return dec(1, ExtCS); }
break;
case 33:

# line 123 "scoansi.l"
		{ return dec(1, ExtBI); }
break;
case 34:

# line 124 "scoansi.l"
		{ return dec(1, ExtBBB); }
break;
case 35:

# line 125 "scoansi.l"
		{ return dec(1, ExtAGC); }
break;
case 36:

# line 126 "scoansi.l"
		{ return dec(1, ExtNF); }
break;
case 37:

# line 127 "scoansi.l"
		{ return dec(1, ExtNB); }
break;
case 38:

# line 128 "scoansi.l"
		{ return dec(1, ExtRF); }
break;
case 39:

# line 129 "scoansi.l"
		{ return dec(1, ExtRB); }
break;
case 40:

# line 130 "scoansi.l"
		{ return dec(1, ExtGF); }
break;
case 41:

# line 131 "scoansi.l"
		{ return dec(1, ExtGB); }
break;
case 42:

# line 132 "scoansi.l"
		{ return dec(1, ExtFNR); }
break;
case 43:

# line 133 "scoansi.l"
		{ return dec(1, ExtRCF); }
break;
case 44:

# line 134 "scoansi.l"
	{ return ExtSCP; }
break;
case 45:

# line 135 "scoansi.l"
	{ return ExtRCP; }
break;
case 46:

# line 136 "scoansi.l"
		{ return dec(1, ExtSS); }
break;
case 47:

# line 138 "scoansi.l"
			{ return 0; }
break;
case 48:

# line 139 "scoansi.l"
{ return 0; }
break;
case 49:

# line 141 "scoansi.l"
	{ return yytext[0]; }
break;
case -1:
break;
default:
(void)fprintf(yyout,"bad switch yylook %d",nstr);
} return(0); }
/* end of yylex */

/*
*/

int main()
{
  int c;

  for(;c=yylex();)
	switch(c)
	{
	  case CBT:		printf("CBT<%d>\n", p1); break;
	  case CNL:		printf("CNL<%d>\n", p1); break;
	  case CPL:		printf("CPL<%d>\n", p1); break;
	  case CUB:		printf("CUB<%d>\n", p1); break;
	  case CUD:		printf("CUD<%d>\n", p1); break;
	  case CUF:		printf("CUF<%d>\n", p1); break;
	  case CUU:		printf("CUU<%d>\n", p1); break;
	  case CUP:		printf("CUU<%d,%d>\n", p1,p2); break;
	  case DCH:		printf("DCH<%d>\n", p1); break;
	  case DL:		printf("DL<%d>\n", p1); break;
	  case ECH:		printf("ECH<%d>\n", p1); break;
	  case ED:		printf("ED<%d>\n", p1); break;
	  case EL:		printf("EL<%d>\n", p1); break;
	  case HPA:		printf("HPA<%d>\n", p1); break;
	  case HPR:		printf("HPR<%d>\n", p1); break;
	  case HVP:		printf("HVP<%d,%d>\n", p1,p2); break;
	  case ICH:		printf("ICH<%d>\n", p1); break;
	  case IL:		printf("IL<%d>\n", p1); break;
	  case MC:		printf("MC\n"); break;
	  case RM:		printf("RM\n"); break;
	  case SM:		printf("SM\n"); break;
	  case RMAM:	printf("RMAM\n"); break;
	  case SMAM:	printf("SMAM\n"); break;
	  case SD:		printf("SD<%d>\n", p1); break;
	  case SU:		printf("SU<%d>\n", p1); break;
	  case SGR:		printf("SGR<%d,%d,%d>\n", p1,p2,p3); break;
	  case TBC:		printf("TBC<%d>\n", p1); break;
	  case VPA:		printf("VPA<%d>\n", p1); break;
	  case VPR:		printf("VPR<%d>\n", p1); break;
	  case ExtOC:	printf("ExtOC<%d>\n", p1); break;
	  case ExtBP:	printf("ExtBP<%d,%d>\n", p1, p2); break;
	  case ExtCS:	printf("ExtCS<%d,%d>\n", p1, p2); break;
	  case ExtBI:	printf("ExtBI<%d>\n", p1); break;
	  case ExtBBB:	printf("ExtBBB<%d>\n", p1); break;
	  case ExtAGC:	printf("ExtAGC<%d>\n", p1); break;
	  case ExtNF:	printf("ExtNF<%d>\n", p1); break;
	  case ExtNB:	printf("ExtNB<%d>\n", p1); break;
	  case ExtRF:	printf("ExtRF<%d>\n", p1); break;
	  case ExtRB:	printf("ExtRB<%d>\n", p1); break;
	  case ExtGF:	printf("ExtGF<%d>\n", p1); break;
	  case ExtGB:	printf("ExtGB<%d>\n", p1); break;
	  case ExtFNR:	printf("ExtFNR<%d>\n", p1); break;
	  case ExtRCF:	printf("ExtRCF<%d>\n", p1); break;
	  case ExtSCP:	printf("ExtSCP\n"); break;
	  case ExtRCP:	printf("ExtRCP\n"); break;
	  case ExtSS:	printf("ExtSS<%d>\n", p1); break;

	  default: if (c>=32 && c<=255 || c==10 || c==13 || c==8)
				 printf("Char %d\n", c);
			   else
				 printf("*** Code %d\n", c);
			   break;
	  case 0: break;
	}
  printf("Fin\n");
  return 0;
}

int yyvstop[] = {
0,

49,
0,

49,
0,

44,
49,
0,

47,
0,

45,
47,
0,

47,
0,

48,
0,

14,
48,
0,

48,
0,

48,
0,

48,
0,

48,
0,

48,
0,

17,
48,
0,

7,
48,
0,

6,
48,
0,

5,
48,
0,

4,
48,
0,

2,
48,
0,

3,
48,
0,

8,
48,
0,

12,
48,
0,

13,
48,
0,

18,
48,
0,

10,
48,
0,

9,
48,
0,

25,
48,
0,

24,
48,
0,

11,
48,
0,

1,
48,
0,

15,
48,
0,

28,
48,
0,

29,
48,
0,

16,
48,
0,

27,
48,
0,

26,
48,
0,

44,
48,
0,

45,
48,
0,

21,
48,
0,

19,
48,
0,

20,
48,
0,

48,
0,

48,
0,

30,
48,
0,

31,
48,
0,

32,
48,
0,

33,
48,
0,

34,
48,
0,

36,
48,
0,

37,
48,
0,

38,
48,
0,

39,
48,
0,

40,
48,
0,

41,
48,
0,

42,
48,
0,

43,
48,
0,

35,
48,
0,

46,
48,
0,

48,
0,

23,
0,

22,
0,
0};
# define YYTYPE unsigned char
struct yywork { YYTYPE verify, advance; } yycrank[] = {
0,0,	0,0,	1,3,	4,6,	
44,9,	8,9,	62,9,	0,0,	
0,0,	0,0,	0,0,	1,3,	
4,0,	44,0,	8,0,	62,0,	
0,0,	45,9,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	45,0,	0,0,	
1,4,	2,4,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	8,10,	
0,0,	0,0,	0,0,	0,0,	
0,0,	1,3,	4,6,	44,44,	
8,11,	62,62,	8,12,	0,0,	
15,61,	0,0,	4,7,	0,0,	
0,0,	0,0,	0,0,	8,13,	
45,45,	8,14,	0,0,	8,15,	
8,16,	8,17,	8,18,	8,19,	
8,20,	8,21,	8,22,	45,62,	
8,23,	11,9,	8,24,	8,25,	
8,26,	8,27,	45,47,	45,48,	
8,28,	0,0,	11,0,	8,29,	
8,30,	0,0,	0,0,	13,9,	
8,31,	4,8,	8,32,	0,0,	
0,0,	0,0,	0,0,	0,0,	
13,0,	8,33,	0,0,	0,0,	
8,34,	8,35,	8,36,	8,37,	
0,0,	0,0,	61,63,	0,0,	
44,38,	8,38,	61,64,	11,10,	
0,0,	0,0,	0,0,	8,39,	
0,0,	8,40,	0,0,	0,0,	
11,11,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	11,13,	
0,0,	0,0,	13,13,	0,0,	
11,16,	11,17,	11,18,	11,19,	
11,20,	11,21,	11,22,	0,0,	
11,23,	13,44,	11,24,	11,25,	
11,26,	11,27,	0,0,	0,0,	
11,28,	0,0,	0,0,	11,29,	
11,30,	0,0,	13,23,	12,9,	
11,31,	0,0,	11,32,	0,0,	
0,0,	0,0,	0,0,	0,0,	
12,0,	11,33,	0,0,	0,0,	
11,34,	11,35,	11,36,	11,37,	
0,0,	0,0,	0,0,	0,0,	
0,0,	11,38,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
13,36,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	13,38,	
0,0,	12,10,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	12,11,	14,9,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
14,0,	12,13,	0,0,	0,0,	
1,5,	2,5,	12,16,	12,17,	
12,18,	12,19,	12,20,	12,21,	
12,22,	0,0,	12,23,	0,0,	
12,24,	12,25,	12,26,	12,27,	
0,0,	0,0,	12,28,	0,0,	
0,0,	12,29,	12,30,	0,0,	
0,0,	0,0,	12,31,	0,0,	
12,32,	0,0,	0,0,	0,0,	
0,0,	0,0,	14,14,	12,33,	
0,0,	0,0,	12,34,	12,35,	
12,36,	12,37,	12,41,	12,42,	
0,0,	14,45,	12,43,	12,38,	
0,0,	0,0,	0,0,	14,46,	
14,47,	14,48,	14,49,	14,50,	
14,51,	14,52,	14,53,	14,54,	
14,55,	14,56,	14,57,	14,58,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	14,59,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
0,0,	0,0,	0,0,	0,0,	
14,60,	0,0,	0,0,	0,0,	
0,0};
struct yysvf yysvec[] = {
0,	0,	0,
yycrank+-1,	0,		0,	
yycrank+-2,	yysvec+1,	0,	
yycrank+0,	0,		yyvstop+1,
yycrank+-2,	0,		yyvstop+3,
yycrank+0,	0,		yyvstop+5,
yycrank+0,	0,		yyvstop+8,
yycrank+0,	0,		yyvstop+10,
yycrank+-4,	0,		yyvstop+13,
yycrank+0,	0,		yyvstop+15,
yycrank+0,	0,		yyvstop+17,
yycrank+-76,	0,		yyvstop+20,
yycrank+-162,	0,		yyvstop+22,
yycrank+-90,	0,		yyvstop+24,
yycrank+-210,	0,		yyvstop+26,
yycrank+1,	0,		yyvstop+28,
yycrank+0,	0,		yyvstop+30,
yycrank+0,	0,		yyvstop+33,
yycrank+0,	0,		yyvstop+36,
yycrank+0,	0,		yyvstop+39,
yycrank+0,	0,		yyvstop+42,
yycrank+0,	0,		yyvstop+45,
yycrank+0,	0,		yyvstop+48,
yycrank+0,	0,		yyvstop+51,
yycrank+0,	0,		yyvstop+54,
yycrank+0,	0,		yyvstop+57,
yycrank+0,	0,		yyvstop+60,
yycrank+0,	0,		yyvstop+63,
yycrank+0,	0,		yyvstop+66,
yycrank+0,	0,		yyvstop+69,
yycrank+0,	0,		yyvstop+72,
yycrank+0,	0,		yyvstop+75,
yycrank+0,	0,		yyvstop+78,
yycrank+0,	0,		yyvstop+81,
yycrank+0,	0,		yyvstop+84,
yycrank+0,	0,		yyvstop+87,
yycrank+0,	0,		yyvstop+90,
yycrank+0,	0,		yyvstop+93,
yycrank+0,	0,		yyvstop+96,
yycrank+0,	0,		yyvstop+99,
yycrank+0,	0,		yyvstop+102,
yycrank+0,	0,		yyvstop+105,
yycrank+0,	0,		yyvstop+108,
yycrank+0,	0,		yyvstop+111,
yycrank+-3,	0,		yyvstop+114,
yycrank+-16,	0,		yyvstop+116,
yycrank+0,	0,		yyvstop+118,
yycrank+0,	0,		yyvstop+121,
yycrank+0,	0,		yyvstop+124,
yycrank+0,	0,		yyvstop+127,
yycrank+0,	0,		yyvstop+130,
yycrank+0,	0,		yyvstop+133,
yycrank+0,	0,		yyvstop+136,
yycrank+0,	0,		yyvstop+139,
yycrank+0,	0,		yyvstop+142,
yycrank+0,	0,		yyvstop+145,
yycrank+0,	0,		yyvstop+148,
yycrank+0,	0,		yyvstop+151,
yycrank+0,	0,		yyvstop+154,
yycrank+0,	0,		yyvstop+157,
yycrank+0,	0,		yyvstop+160,
yycrank+6,	0,		0,	
yycrank+-5,	0,		yyvstop+163,
yycrank+0,	0,		yyvstop+165,
yycrank+0,	0,		yyvstop+167,
0,	0,	0};
struct yywork *yytop = yycrank+332;
struct yysvf *yybgin = yysvec+1;
unsigned char yymatch[] = {
00  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,012 ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,'0' ,
'0' ,'0' ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
01  ,01  ,01  ,01  ,01  ,01  ,01  ,01  ,
0};
char yyextra[] = {
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0};
#ident	"@(#) ncform 20.1 94/12/04 "
#ident	"@(#)libl:lib/ncform	1.7"

/*
 * For the SCO C++ compiler, the C-linkage routines will be called for stdio
 * compiles, and the C++ linkage routines will be called for iostream.
 * This is function overloading at link time, sort of.
 */
#if defined(__cplusplus)
#   include <stdlib.h>
#   if defined(__cplusplus) && !defined(_LEX_USES_IOSTREAMS)
        extern "C" void allprint(const char);
        extern "C" void sprint (const char *);
#   else
        void allprint(const char);
        void sprint (const char *);
#   endif
#endif

int yylineno =1;
# define YYU(x) x
# define NLSTATE yyprevious=YYNEWLINE
char yytext[YYLMAX];
struct yysvf *yylstate [YYLMAX], **yylsp, **yyolsp;
char yysbuf[YYLMAX];
char *yysptr = yysbuf;
int *yyfnd;
extern struct yysvf *yyestate;
int yyprevious = YYNEWLINE;
#if defined(__cplusplus) || defined(__STDC__)
#   if defined(__cplusplus) && !defined(_LEX_USES_IOSTREAMS)
        extern "C"
#   endif
int yylook(void)
#else
yylook()
#endif
{
	register struct yysvf *yystate, **lsp;
	register struct yywork *yyt;
	struct yysvf *yyz;
	int yych, yyfirst;
	struct yywork *yyr;
# ifdef LEXDEBUG
	int debug;
# endif
	char *yylastch;
	/* start off machines */
# ifdef LEXDEBUG
	debug = 0;
# endif
	yyfirst=1;
	if (!yymorfg)
		yylastch = yytext;
	else {
		yymorfg=0;
		yylastch = yytext+yyleng;
		}
	for(;;){
		lsp = yylstate;
		yyestate = yystate = yybgin;
		if (yyprevious==YYNEWLINE) yystate++;
		for (;;){
# ifdef LEXDEBUG
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
			if(debug)*yyout << "state " << yystate-yysvec-1 << endl;
#   else
			if(debug)fprintf(yyout,"state %d\n",yystate-yysvec-1);
#   endif
# endif
			yyt = yystate->yystoff;
			if(yyt == yycrank && !yyfirst){  /* may not be any transitions */
				yyz = yystate->yyother;
				if(yyz == 0)break;
				if(yyz->yystoff == yycrank)break;
				}
			*yylastch++ = yych = input();
			if(yylastch > &yytext[YYLMAX]) {
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
				*yyout  << "Input string too long, limit " << YYLMAX << endl;
#   else
				fprintf(yyout,"Input string too long, limit %d\n",YYLMAX);
#   endif
				exit(1);
			}
			yyfirst=0;
		tryagain:
# ifdef LEXDEBUG
			if(debug){
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
				*yyout << "char ";
				allprint (yych);
				*yyout << endl;
#   else
				fprintf(yyout,"char ");
				allprint(yych);
				putchar('\n');
#   endif
				}
# endif
			yyr = yyt;
			if ( (int)yyt > (int)yycrank){
				yyt = yyr + yych;
				if (yyt <= yytop && yyt->verify+yysvec == yystate){
					if(yyt->advance+yysvec == YYLERR)	/* error transitions */
						{unput(*--yylastch);break;}
					*lsp++ = yystate = yyt->advance+yysvec;
					if(lsp > &yylstate[YYLMAX]) {
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
						*yyout  << "Input string too long, limit " << YYLMAX << endl;
#   else
						fprintf(yyout,"Input string too long, limit %d\n",YYLMAX);
#   endif
						exit(1);
					}
					goto contin;
					}
				}
# ifdef YYOPTIM
			else if((int)yyt < (int)yycrank) {		/* r < yycrank */
				yyt = yyr = yycrank+(yycrank-yyt);
# ifdef LEXDEBUG
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
				if(debug)*yyout << "compressed state\n";
#   else
				if(debug)fprintf(yyout,"compressed state\n");
#   endif
# endif
				yyt = yyt + yych;
				if(yyt <= yytop && yyt->verify+yysvec == yystate){
					if(yyt->advance+yysvec == YYLERR)	/* error transitions */
						{unput(*--yylastch);break;}
					*lsp++ = yystate = yyt->advance+yysvec;
					if(lsp > &yylstate[YYLMAX]) {
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
						*yyout  << "Input string too long, limit " << YYLMAX << endl;
#   else
						fprintf(yyout,"Input string too long, limit %d\n",YYLMAX);
#   endif
						exit(1);
					}
					goto contin;
					}
				yyt = yyr + YYU(yymatch[yych]);
# ifdef LEXDEBUG
				if(debug){
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
					*yyout << "try fall back character ";
					allprint (YYU(yymatch[yych]));
					*yyout << endl;
#   else
					fprintf(yyout,"try fall back character ");
					allprint(YYU(yymatch[yych]));
					putchar('\n');
#   endif
					}
# endif
				if(yyt <= yytop && yyt->verify+yysvec == yystate){
					if(yyt->advance+yysvec == YYLERR)	/* error transition */
						{unput(*--yylastch);break;}
					*lsp++ = yystate = yyt->advance+yysvec;
					if(lsp > &yylstate[YYLMAX]) {
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
						*yyout  << "Input string too long, limit " << YYLMAX << endl;
#   else
						fprintf(yyout,"Input string too long, limit %d\n",YYLMAX);
#   endif
						exit(1);
					}
					goto contin;
					}
				}
			if ((yystate = yystate->yyother) && (yyt= yystate->yystoff) != yycrank){
# ifdef LEXDEBUG
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
				if(debug)*yyout << "fall back to state "
					<< yystate-yysvec-1 << endl;
#   else
				if(debug)fprintf(yyout,"fall back to state %d\n",yystate-yysvec-1);
#   endif
# endif
				goto tryagain;
				}
# endif
			else
				{unput(*--yylastch);break;}
		contin:
# ifdef LEXDEBUG
			if(debug){
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
				*yyout  << "state " << yystate-yysvec-1
					<< " char ";
				allprint (yych);
				*yyout << endl;
#   else
				fprintf(yyout,"state %d char ",yystate-yysvec-1);
				allprint(yych);
				putchar('\n');
#   endif
				}
# endif
			;
			}
# ifdef LEXDEBUG
		if(debug){
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
			*yyout << "stopped at " << *(lsp-1)-yysvec-1
			       << " with ";
			allprint (yych);
			*yyout << endl;
#   else
			fprintf(yyout,"stopped at %d with ",*(lsp-1)-yysvec-1);
			allprint(yych);
			putchar('\n');
#   endif
			}
# endif
		while (lsp-- > yylstate){
			*yylastch-- = 0;
			if (*lsp != 0 && (yyfnd= (*lsp)->yystops) && *yyfnd > 0){
				yyolsp = lsp;
				if(yyextra[*yyfnd]){		/* must backup */
					while(yyback((*lsp)->yystops,-*yyfnd) != 1 && lsp > yylstate){
						lsp--;
						unput(*yylastch--);
						}
					}
				yyprevious = YYU(*yylastch);
				yylsp = lsp;
				yyleng = yylastch-yytext+1;
				yytext[yyleng] = 0;
# ifdef LEXDEBUG
				if(debug){
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
					*yyout << "\nmatch ";
					sprint (yytext);
					*yyout << " action " << *yyfnd << endl;
#   else
					fprintf(yyout,"\nmatch ");
					sprint(yytext);
					fprintf(yyout," action %d\n",*yyfnd);
#   endif
					}
# endif
				return(*yyfnd++);
				}
			unput(*yylastch);
			}
		if (yytext[0] == 0  /* && feof(yyin) */)
			{
			yysptr=yysbuf;
			return(0);
			}
		yyprevious = yytext[0] = input();
		if (yyprevious>0)
			output(yyprevious);
		yylastch=yytext;
# ifdef LEXDEBUG
#   if defined(__cplusplus) && defined(_LEX_USES_IOSTREAMS)
		if(debug)*yyout << endl;
#   else
		if(debug)putchar('\n');
#   endif
# endif
		}
	}
#if defined(__cplusplus) || defined(__STDC__)
# if defined(__cplusplus) && !defined(LEX_USES_CPLUS_LINKAGE)
   extern "C"
# endif
int yyback(int *p, int m)
#else
yyback(p, m)
	int *p;
#endif
{
	if (p==0) return(0);
	while (*p) {
		if (*p++ == m)
			return(1);
	}
	return(0);
}
	/* the following are only used in the lex library */
#if defined(__cplusplus) || defined(__STDC__)
# if defined(__cplusplus) && !defined(LEX_USES_CPLUS_LINKAGE)
   extern "C"
# endif
int yyinput(void)
#else
yyinput()
#endif
{
	return(input());
	}
#if defined(__cplusplus) || defined(__STDC__)
# if defined(__cplusplus) && !defined(LEX_USES_CPLUS_LINKAGE)
   extern "C"
# endif
void yyoutput(int c)
#else
yyoutput(c)
  int c; 
#endif
{
	output(c);
	}
#if defined(__cplusplus) || defined(__STDC__)
# if defined(__cplusplus) && !defined(LEX_USES_CPLUS_LINKAGE)
   extern "C"
# endif
void yyunput(int c)
#else
yyunput(c)
   int c; 
#endif
{
	unput(c);
	}


/*
 *  For the SCO/C++ compiler, the main() function is used in the libC.a
 *  library but defined in the libl.a library.  However, since libl.a
 *  is placed before libC.a in the cc command line within the C++ compiler
 *  driver, the linker cannot find main().  To get around this, we define
 *  a dummy function here which calls it.
*/
#if defined(__cplusplus)
extern "C" int main(void);
void _lldumMain_() { main(); }
#endif

