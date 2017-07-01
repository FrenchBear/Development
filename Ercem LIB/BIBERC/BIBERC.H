/* biberc.h
** D‚finitions de la bibliothŠque biberc
** P.VIOLENT
** 25/4/91, 13/10/92, 26/11/92, 
**  6/12/92 PV	strop
** 18/12/92 PV	getenvstr de type char *
** 12/04/93 PV	Affichage de l'heure
**  2/02/94 PV	strncmp / strnicmp
** 10/02/94 PV	szLTrim
** 23/02/94 PV	unixtimeix
**  9/06/94 PV	box; portage MS-Dos; C++
** 20/06/94 PV	Cast des attributs L des curses; vpanel; CTRL_x
** 11/07/94 PV	Fin de strstr; .ref -> .h; strpat
** 22/08/94 PV	unixtimeex, fgets2, strncpy2
** 11/09/94 PV	iModeCurses
** 14/09/94 PV	SQLFatal
** 19/09/94 PV	SQLFatal nouvelle version
** 18/11/94 PV	szUCase, szLCase, Assert et BibercAssert
** 23/11/94 PV	szRight
** 28/11/94 PV	strncat2
**  3/12/94 PV	NULL_INT et NULL_SHORT
** 12/12/94 PV	unixtimeix et ixtimeunix -> dIxToUnix et dUnixToIx
** 12/12/94 PV	timestam.c: YStoUT et UTtoYS
** 13/12/94 PV	Gestion des NAN (NULL pour Informix)
** 14/12/94 PV	timestam:c: JMAtoUS et UTtoJMA
** 17/12/94 PV	Macro sstrcpy (safe strcpy)
** 14/02/95 PV  DelInterrupt
** 11/05/95 PV  szDateFrEx
** 24/05/95 PV  Fonctions de profile, utilitaires fichiers
*/

#ifndef _INC_BIBERC
#define _INC_BIBERC

#include <stdio.h>
#include <time.h>
#include <curses.h>

#if __cplusplus
extern "C" {
#endif /* __cplusplus */

extern WINDOW *current_window;
WINDOW *newwin2(int nlines, int ncols, int begin_y, int begin_x);
void delwin2(WINDOW *win);
void wrefresh2(WINDOW *win);

#define UC unsigned char

extern char szSysteme[40];
extern char szNomOperateur[40];
extern UC *szBoxd, *szBoxs;
extern int iModeCurses;

#ifdef UNIX
int stricmp(const UC *, const UC *);
int strnicmp(const UC *, const UC *, int);
#endif

UC   *strinsnc(UC *, int);
UC   *strdelnc(UC *, int);
int strpat(char *p_buff, char *p_masque);
char *GetEnvString(const char *, UC *, const UC *);
char *szDateFr(void);
char *szDateFrEx(time_t);
char *szRTrim(char *);
char *szLTrim(char *);
char *szFiltreO(char *);

char *szRight(char *szBuffer, int iNbCar);

char *fgets2(char *buffer, int taille, FILE *f);

char *strncpy2(char *dest, const char *source, unsigned count);
char *strncat2(char *dest, const char *source, unsigned count);
#define sstrcpy(d,s) strncpy2(d,s,sizeof(d))

long unixtime(int, int, int);
long unixtimeex(int, int, int, int, int, int);

time_t dIxToUnix(long dIx);
long dUnixToIx(time_t dUnix);
#define unixtimeix(dIx)   dIxToUnix(dIx)
#define ixtimeunix(dUnix) dUnixToIx(dUnix)

char *szUTtoYS(time_t t, char szBuffer[20]);
time_t YStoUT(char *szYS);
char *szUTtoJMA(time_t t, char szBuffer[11]);
time_t JMAtoUT(char *szJMA);

void AfficheHeure(void);
void InitHeure(void);
void FinHeure(void);

/* quelques d‚finitions manquant aux curses... */
#if defined(DOS) || defined(WIN32)
#define KEY_BTAB		28
#define KEY_END			KEY_LL
#endif

#define KEY_PGUP		KEY_PPAGE
#define KEY_PGDN		KEY_NPAGE
#define KEY_TAB			9
#define KEY_CTRL_A		1
#define KEY_CTRL_B		2
#define KEY_CTRL_C  	3
#define KEY_CTRL_D		4
#define KEY_CTRL_E		5
#define KEY_CTRL_F		6
#define KEY_CTRL_G		7
#define KEY_CTRL_H		8
#define KEY_CTRL_I		9
#define KEY_CTRL_J		10
#define KEY_CTRL_K		11
#define KEY_CTRL_L		12
#define KEY_CTRL_M		13
#define KEY_CTRL_N		14
#define KEY_CTRL_O		15
#define KEY_CTRL_P		16
#define KEY_CTRL_Q		17
#define KEY_CTRL_R		18
#define KEY_CTRL_S		19
#define KEY_CTRL_T		20
#define KEY_CTRL_U		21
#define KEY_CTRL_V		22
#define KEY_CTRL_W		23
#define KEY_CTRL_X		24
#define KEY_CTRL_Y		25
#define KEY_CTRL_Z		26
#define KEY_RETURN		10
#define KEY_BACK		8
#define KEY_ESPACE		32
#define KEY_SPACE		32
#define KEY_SHIFT_TAB	KEY_BTAB
#define KEY_ESCAPE		27
#define KEY_ESC			KEY_ESCAPE
#define KEY_INSERT		KEY_IC
#define KEY_DELETE		127
#define KEY_DEL			KEY_DELETE

#define INVERSE			((int)A_REVERSE)
#define BRILLANT		((int)A_BOLD)
#define SOULIGNE		((int)A_UNDERLINE)
#define DIMINUE			((int)A_DIM)
#define CLIGNOTANT		((int)A_BLINK)

#define LINPUT			(LINES-4)
#define LFKEYS			(LINES-2)
#define LMSG			(LINES-1)

typedef char *MENU[];

typedef struct
{ int	iType;
  int	iLig, iCol;
  int	iLgr;
  char	*szVar;
  char	*szValid;
} GRILLE;

/* prototypes de esecr.c */
void	stopcurses(void);
int		traitesignal(int);
void	startcurses(void);
void	SignalDefaut(void);
void	SignalApp(void);
void	InitEcran(void);
void	InitWin(WINDOW *w);
void	FinEcran(void);
void	NoDelInterrupt(void);
void	DelInterrupt(void);
int		getch2(void);
int		wgetch2(WINDOW *);
void	Refresh(void);
void	Cartouche(const char *, const char *, const char *);
void	CartoucheStd(const char *);
void	ClsZone(int, int);
void	ClsClient(void);
void	Titre(const char *);
void	FkeysL(const UC *, int);
void	Fkeys(const UC *);
void	Message(const char *);
void	Pause(void);

/* bemenu.c */
void	itemMenu(int, int , const char *, int);
void	AfficheMenu(char **);
int		iDoMenu(char **);

/* box.c */
void	drawbox(const UC *,int ,int ,int ,int );
void	wdrawbox(WINDOW *,const UC *,int ,int ,int ,int );
void	drawvline(const UC *,int ,int ,int);
void	wdrawvline(WINDOW *,const UC *,int ,int ,int);
void	drawhline(const UC *,int ,int ,int);
void	wdrawhline(WINDOW *,const UC *,int ,int ,int);

int		iAlert(const char *, const char *, int, int, const char *);
void	AlertOk(const char *, const char *);
void	aprintf(const char *szTitre, const char *szFormat, ...);
void	AlertErr(const char *, const char *, const char *);
void	InputMode(int, int);
int		iInput(int ,int ,UC *,int ,int , const UC *);
int		iWInput(WINDOW *, int ,int ,UC *,int ,int , const UC *);
void	AfficheGrille(GRILLE *);
int		iSaisieGrille(GRILLE *);
void	ErrorLog(const char *, const char *, const char *, const char *);

int 	fileselect(const char *, const char *,int,char *,char *,char *,char *);

int 	bFileExist(const char *);
#define exist(f) bFileExist(f)
long	lFileSize(const char *szFullPath);
time_t	tFileDateMAJ(const char *szFullPath);

int		GetPrivateProfileInt(char *, char *, int, char *);
size_t	GetPrivateProfileString(char *, char *, char *, void *, size_t, char *);
int		WritePrivateProfileString(char *, char *, char *, char *);

int 	instring(const UC *,UC);
UC		maj(UC);
UC		majAZ(UC);
UC		minaz(UC);
int		iValid(const UC *, UC, int *);

UC		*szUCase(UC *);
UC		*szLCase(UC *);

char 	*szInputBox(const char *, const char *, char *, int);

FILE	*fopenpath(const char *, const char *, char *);

void	SQLFatal(const char *szApplication, const char *szFichier, int iLigne, int iErr, const char *szMsgUser);

#define Assert(EX) (((EX)== 0)?BibercAssert(#EX, __FILE__, __LINE__):((void)0))
void BibercAssert(const char *szExpression, const char *szFichier, const int iLigne);

#if defined(DOS)
#define NULL_INT -32768			/* 16 bits... */
#define NULL_SHORT -32768
#endif
#if defined(WIN32) || defined(UNIX)
#define NULL_INT -2147483648	/* Mˆmes valeurs qu'Informix, ‡a facilite */
#define NULL_SHORT -32768
#endif

#define isnand(x)  (((*(long *)&(x) & 0x7f800000L)==0x7f800000L)&&((*(long *)&(x) & 0x007fffffL)!=0x00000000L))
#define setnand(x) memset(&(x), 255, 8)

#if __cplusplus
};
#endif	/* __cplusplus */

#endif	/* _INC_BIBERC */
