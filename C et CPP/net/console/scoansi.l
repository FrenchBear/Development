%{
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

%}

ESC		\033
CSI		{ESC}\[
n		[0-9]*

%%

{CSI}{n}Z			{ return dec(0, CBT); }
{CSI}{n}E			{ return dec(0, CNL); }
{CSI}{n}F			{ return dec(0, CPL); }
{CSI}{n}D			{ return dec(0, CUB); }
{CSI}{n}C			{ return dec(0, CUF); }
{CSI}{n}B			{ return dec(0, CUD); }
{CSI}{n}A			{ return dec(0, CUU); }
{CSI}{n}(;{n})?H	{ return dec(0, CUP); }
{CSI}{n}P			{ return dec(0, DCH); }
{CSI}{n}M			{ return dec(0, DL); }
{CSI}{n}X			{ return dec(0, ECH); }
{CSI}{n}J			{ return dec(0, ED); }
{CSI}{n}K			{ return dec(0, EL); }
{CSI}{n}\'			{ return dec(0, HPA); }
{CSI}{n}a			{ return dec(0, HPR); }
{CSI}{n}(;{n})?f	{ return dec(0, HVP); }
{CSI}{n}@			{ return dec(0, ICH); }
{CSI}{n}L			{ return dec(0, IL); }
{CSI}2i				{ return MC; }
{CSI}2l				{ return RM; }
{CSI}2h				{ return SM; }
{CSI}\?7l			{ return RMAM; }
{CSI}\?7h			{ return SMAM; }
{CSI}{n}T			{ return dec(0, SD); }
{CSI}{n}S			{ return dec(0, SU); }
{CSI}{n}(;{n})?(;{n})?m	{ return dec(0, SGR); }
{CSI}{n}g			{ return dec(0, TBC); }
{CSI}{n}d			{ return dec(0, VPA); }
{CSI}{n}e			{ return dec(0, VPR); }
{CSI}={n}A			{ return dec(1, ExtOC); }
{CSI}={n}(;{n})?B	{ return dec(1, ExtBP); }
{CSI}={n}(;{n})?C	{ return dec(1, ExtCS); }
{CSI}={n}D			{ return dec(1, ExtBI); }
{CSI}={n}E			{ return dec(1, ExtBBB); }
{CSI}={n}g			{ return dec(1, ExtAGC); }
{CSI}={n}F			{ return dec(1, ExtNF); }
{CSI}={n}G			{ return dec(1, ExtNB); }
{CSI}={n}H			{ return dec(1, ExtRF); }
{CSI}={n}I			{ return dec(1, ExtRB); }
{CSI}={n}J			{ return dec(1, ExtGF); }
{CSI}={n}K			{ return dec(1, ExtGB); }
{CSI}={n}L			{ return dec(1, ExtFNR); }
{CSI}={n}M			{ return dec(1, ExtRCF); }
{CSI}s|{ESC}7		{ return ExtSCP; }
{CSI}u|{ESC}8		{ return ExtRCP; }
{CSI}={n}z			{ return dec(1, ExtSS); }

{ESC}.				{ return 0; }
{CSI}=?{n}(;{n}(;{n})?)?.	{ return 0; }

.|\n		{ return yytext[0]; }

%%

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

