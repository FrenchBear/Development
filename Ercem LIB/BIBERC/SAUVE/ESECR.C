
/* esecr.c
** sous-programmes utilitaires d'entr‚e-sorties ‚cran
** 24/4/91
** 19/7/91	Passage en bibliothŠque. STATIC pour Unix
**  9/05/92	Unix
** 27/08/92	Fin de STATIC, input sorti dans input.c
** 14/10/92	Modifications du menu, lignes '$'
** 26/11/92	Sortie de alert.c
** 10/03/93	Menu retourne syst‚matiquement un !
** 15/03/93	iMenu -> iDoMenu
*/

#include <stdio.h>
#include <curses.h>
#include <ctype.h>
#include <signal.h>
#include <time.h>

#include <clib.ref>

#include "biberc.ref"

#define ALT		A_ALTCHARSET

/*
static UC szBoxdAnsi[] = "ÉÍ»ººÈÍ¼";
static UC szBoxsAnsi[] = "ÚÄ¿³³ÀÄÙ";
static UC szBoxdAnsi[] = "IM;::HM<";
static UC szBoxsAnsi[] = "ZD?33@DY";
static UC szBoxdVT100[] = "lqkxxmqj";
static UC szBoxsVT100[] = "lqkxxmqj";
static UC szBoxd7[] = "+=+||+=+";
static UC szBoxs7[] = "+-+||+-+";
*/

UC *szBoxd, *szBoxs;

// static struct termio bufio;

char szSysteme[40];
char szNomOperateur[40];

/*====================================================================*/
/* Utilitaires de manipulation des curses */

/* Fin d'utilisation des curses */
void stopcurses()
{
  refresh();
  endwin();
//  ioctl(1, TCSETA, bufio);
}

/* par d‚faut, le moindre signal fait d‚gager...
*/
int traitesignal(iSignal)
int iSignal;
{
  stopcurses();
  fprintf(stderr, "biberc: esecr.c: traitesignal: Signal re‡u: %d -> Arrˆt du programme. \n", iSignal);
  exit(2);
  return 0;
}

void NoDelInterrupt()
{
//  struct termio b;
//  ioctl(1, TCGETA, &b);
//  b.c_cc[VINTR]= -1;
//  ioctl(1, TCSETA, &b);
}

void InitWin(w)
WINDOW *w;
{
  keypad(w, TRUE);	/* renvoyer des tokens */
#ifdef grenoble
  notimeout(w, TRUE);	/* tokeniser sur Wyse 995/Unix */
#endif

  noecho();
  crmode();
  nl();
  
// #if !defined(M_TERMCAP)
//   idlok(stdscr,FALSE);	/* ne pas utiliser l'insertion/supp de ligne */
// #endif
}

/* Initialisation des curses
*/
void startcurses()
{
//  ioctl(1, TCGETA, &bufio);

  initscr();
  InitWin(stdscr);
}

/*====================================================================*/

void SignalDefaut()
{
  int	i;
  for (i=1 ; i<15 ; i++)
    signal(i, traitesignal);
}

void SignalApp()
{
  int	i;
  for (i=1 ; i<15 ; i++)
    signal(i, traitesignal);
  signal(2, SIG_IGN);
}

/*====================================================================*/
/* initialisation et fin de esecr */

void InitEcran()
{
  SignalApp();
  startcurses();

  /*
  p = getenv("TERM");
  if (strncmp(p, "ansi", 4)==0) 
  { szBoxd = szBoxdAnsi; 
    szBoxs = szBoxsAnsi; 
  }
  else if (strncmp(p, "vt100", 5)==0) 
  { szBoxd = szBoxdVT100; 
    szBoxs = szBoxsVT100; 
  }
  else
  { szBoxd = szBoxd7; 
    szBoxs = szBoxs7; 
  }
  */

  szBoxd = "ÉÍ»ººÈÍ¼";
  szBoxs = "ÚÄ¿³³ÀÄÙ";
}

void FinEcran()
{
  move(LFKEYS,0); clrtoeol();
  move(LMSG,0); clrtoeol();
  stopcurses();
}

/*====================================================================*/

int wgetch2(w)
WINDOW *w;
{ 
  int i;

  do
  { wrefresh(w);
    i = wgetch(w);
    if (i==KEY_CTRL_R)
      wrefresh(curscr);
  } while (i==KEY_CTRL_R);
  return i;
}

int getch2()
{
  return wgetch2(stdscr);
}

void Refresh()
{
  wrefresh(curscr);
}

/*====================================================================*/
/* Utilitaires */

void ClsZone(l1, l2)
int l1, l2;
{
  int i;

  for (i=l1 ; i<=l2 ; i++)
  { move(i,0);
    clrtoeol();
  }
}

void ClsClient()
{
  ClsZone(1, LINES-4);
}

void Titre(szTitre)
char *szTitre;
{
  int cs = (80-strlen(szTitre))/2;

  attron(BRILLANT);
  drawbox(szBoxs, 1, cs-2, 3, strlen(szTitre)+4);
  mvaddch(2, cs-1, ' ');
  addstr(szTitre);
  addch(' ');
  attroff(BRILLANT);
}

void Cartouche(szApp, szTitre, szNom)
char *szApp, *szTitre, *szNom;
{
  int i;

  ClsClient();
  attron(SOULIGNE);
  mvaddstr(0, 0, szApp);
  for (i=80-strlen(szApp) ; i-- ; )
    addch(' ');
  mvaddstr(0, (80-strlen(szTitre))/2, szTitre);
  mvaddstr(0, 80-strlen(szNom), szNom);
  attroff(SOULIGNE);
  move(LINES-3,0);
  for (i=80 ; i-- ; )
    addch('-' /*196*/);
}

void CartoucheStd(szNomApp)
char *szNomApp;
{
  if (szSysteme[0]==0)
  { char szSystemID[32], szSystemCA[2], szTTY[32];
    int	 off;

    GetEnvString("TRA_NOM", szNomOperateur, "(sans nom)");
    GetEnvString("SYSTEMID", szSystemID, "(systŠme inconnu)");
    GetEnvString("SYSTEMCA", szSystemCA, "?");
    GetEnvString("TTY", szTTY, "?");
    if (strncmp(szTTY, "/dev/", 5)==0)
      off = 5;
    else
      off = 0;
    sprintf(szSysteme, "[%s-%s] %s", szSystemID, szSystemCA, szTTY+off);
  }

  Cartouche(szSysteme, szNomApp, szNomOperateur);
  AfficheHeure();
}

void Message(szMsg)
char *szMsg;
{
  int i;

  attron(DIMINUE);
  mvaddstr(LMSG, 0, szMsg);
  for (i=strlen(szMsg) ; i<79 ; i++)
    addch(' ');
  attroff(DIMINUE);
}

void FkeysL(szMsg, iLigne)
UC *szMsg;
int iLigne;
{
  int	i;
  UC	c;

  move(iLigne, 0);
  for (i=0 ; c=szMsg[i] ; i++)
    switch(c)
    {
      case '[': attron(INVERSE); break;
      case ']': attroff(INVERSE); break;
      default:  addch(c);
    }
  attroff(INVERSE);
  clrtoeol();
}

void Fkeys(szMsg)
UC *szMsg;
{
  FkeysL(szMsg, LFKEYS);
}

void Pause()
{
  char szBidon[16];

  Message("Return pour continuer... ");
  refresh();
  mvgetstr(LMSG,40,szBidon);
}

static int iLLMenu;	/* derniŠre ligne du menu */

void itemMenu(c0, iLigne, szLib, iAttrib)
int c0, iLigne, iAttrib;
char *szLib;
{
  int i;
  char szKey[16];

  if (iAttrib)
  { attron(SOULIGNE|BRILLANT);
    mvaddstr(iLigne, c0, szLib+2);
    attroff(SOULIGNE|BRILLANT);
    return;
  }

  if (szLib[0]==0)
    return;

  for(i=0 ; szLib[i]!=' ' ; i++)
    szKey[i] = szLib[i];
  szKey[i] = 0;

  attron(INVERSE);
  mvaddstr(iLigne, c0+1-i, szKey);
  attroff(INVERSE);
  mvaddstr(iLigne, c0+1, szLib+i);
}

void AfficheMenu(M)
MENU M;
{
  int i,j;
  int iMsgExit = 1;
  int lmax = 0, c0;

  for (i=1 ; M[i]!=NULL ; i++)
    if (M[i][0]!='$')
    { if ((j=strlen(M[i]))>lmax) lmax = j;
    }
    else
      if (M[i][1]=='t')
	if ((j=strlen(M[i])-3)>lmax) lmax = j;

  c0 = 40-lmax/2;

  Titre(M[0]);
  iLLMenu = 5;
  for (i=1 ; M[i]!=NULL ; i++)
    if (M[i][0]!='$')
      itemMenu(c0, iLLMenu++, M[i], 0);
    else
      switch(M[i][1])
      { case '0': iMsgExit = 0; break;
	case 't': if (iLLMenu>5) iLLMenu++;
		  itemMenu(c0, iLLMenu++, M[i], 1);
		  break;
      }

  if (iMsgExit)
  { iLLMenu += 2;
    itemMenu(c0, iLLMenu++, "Fin Quitter", 0);
    Fkeys("[Fin] Retour au niveau pr‚c‚dent");
  }
  Message("Tapez un num‚ro dans le menu");
}

int iDoMenu(M)
MENU M;
{
  int i, iRep;
  int iMsgExit = 1;

  for (i=1 ; M[i]!=NULL ; i++)
    if (M[i][0]=='$')
      switch(M[i][1])
      { case '0': iMsgExit = 0; break;
      }

  mvaddstr(iLLMenu+1, 20, "Choix: ");
  for(;;)
  {
    move(iLLMenu+1, 27);
    refresh();
    iRep = getch2();
    if (iRep>='A' && iRep<='Z')
      iRep += 32;
    if (iMsgExit && (iRep==KEY_END || iRep=='q' || iRep==KEY_ESCAPE))
      return 0;
    if (iRep!='$')
      for (i=1 ; M[i]!=NULL ; i++)
	if (iRep==M[i][0])
	  return iRep;
    if (iRep=='!')
      return iRep;
    /*
    if (iRep>=0)
      mvaddstr(16, 20, "Choix inconnu !");
    */
  }
}


/*====================================================================*/

void AfficheGrille(g)
GRILLE *g;
{
  for(;;g++)
    switch(g->iType)
    {
      case -1:	/* fin de grille */
	return;

      case 0:	/* champ */
	attron(DIMINUE);
	move(g->iLig, g->iCol);
	printw("%-*s", g->iLgr, g->szVar);
	attroff(DIMINUE);
	break;

      case 1:	/* libell‚ */
	move(g->iLig, g->iCol);
	if (g->iLgr) attron(g->iLgr);
	addstr(g->szVar);
	if (g->iLgr) attroff(g->iLgr);
	break;
    }
}

static void _ChampSuiv(g,ip)
GRILLE *g;
int *ip;
{
  int	ips = *ip+1;
  while (g[ips].iType>0) ips++;
  if (g[ips].iType==0)
    *ip = ips;
}

static void _ChampPrec(g,ip)
GRILLE *g;
int *ip;
{
  int	ips = *ip-1;
  while (ips>0 && g[ips].iType>0) ips--;
  if (ips>=0 && g[ips].iType==0)
    *ip = ips;
}

int iSaisieGrille(g)
GRILLE *g;
{
  int	iChamp = -1;
  int	i;

  _ChampSuiv(g, &iChamp);
  do
  {
    i = iInput(g[iChamp].iLig, g[iChamp].iCol, g[iChamp].szVar, 
		g[iChamp].iLgr, g[iChamp].iLgr, g[iChamp].szValid);
    switch(i)
    {
      case KEY_UP:
      case KEY_SHIFT_TAB:
	_ChampPrec(g, &iChamp); break;

      case KEY_RETURN:
      case KEY_DOWN:
      case KEY_TAB:	
	_ChampSuiv(g, &iChamp); break;

      case KEY_ESCAPE:	
	if (iAlert("Abandon ?","|Confirmer l'abandon du programme|",1,2,"Ok|Annuler")==1)
	  return -1;
    }
  } while (i!=KEY_END);
  return 0;
}

/*====================================================================*/

void ErrorLog(szApp, szRoutine, szTitre, szMessage)
char *szApp, *szRoutine, *szTitre, *szMessage;
{
  FILE *f;
  struct tm *lt;
  long l;
  static char *tty;
  static int utilisateur;
  static int premierpassage = 1;

  if (premierpassage)
  { premierpassage=0;
    tty=getenv("TRA_ID");
    if(tty==NULL) utilisateur=0; else utilisateur=atoi(tty);

    tty=getenv("TTY");
    if(tty==NULL) tty="??";
  }

  l = time(0L);
  lt = localtime(&l);

  f = fopen("/usr/log/error.log", "a");
  fprintf(f,"%2d/%02d/%02d %2d:%02d %3d %-10.10s %-9.9s %-10.10s %s: %s\n", 
    lt->tm_mday, lt->tm_mon+1, lt->tm_year, lt->tm_hour, lt->tm_min,
    utilisateur,tty,
    szApp, szRoutine, szTitre, szMessage);
  fclose(f);
}

