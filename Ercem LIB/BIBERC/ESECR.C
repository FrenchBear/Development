/* esecr.c
** sous-programmes utilitaires d'entr‚e-sorties ‚cran de bas niveau
** 24/04/91
** 19/07/91 PV	Passage en bibliothŠque. STATIC pour Unix
**  9/05/92 PV	Unix
** 27/08/92 PV	Fin de STATIC, input sorti dans input.c
** 14/10/92 PV	Modifications du menu, lignes '$'
** 26/11/92 PV	Sortie de alert.c
** 10/03/93 PV	Menu retourne syst‚matiquement un !
** 15/03/93 PV	iMenu -> iDoMenu
**  9/04/94 PV	drawbox->wdrawbox, dans box.c. Fin de curses.ref
**  6/09/94 PV	Blanc non brillant … droite du cadre du menu
** 11/09/94 PV	iModeCurses
** 14/09/94 PV	HardCopy (Ctrl+F)
**  3/12/94 PV	Sortie des menus, des grilles et de la gestion du cartouche
** 11/01/95 PV  Ecriture sur stdout
** 14/02/95 PV  DelInterrupt
*/

#include <stdio.h>
#include <signal.h>
#include <clib.ref>

#include "biberc.h"

#include "import.h"


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

UC *szBoxd="", *szBoxs="";

#ifdef UNIX
static struct termio bufio;
#endif

char szSysteme[40]="";
char szNomOperateur[40]="";

int iModeCurses=0;		/* vrai si curses actives */

/*====================================================================*/
/* Utilitaires de manipulation des curses */

/* Fin d'utilisation des curses */
void stopcurses()
{
  refresh();
  endwin();
  iModeCurses = 0;
#ifdef UNIX
  ioctl(1, TCSETA, bufio);
#endif
}

/* par d‚faut, le moindre signal fait d‚gager...
*/
int traitesignal(int iSignal)
{
  stopcurses();
  printf("biberc: esecr.c: traitesignal: Signal re‡u: %d -> Arrˆt du programme. \n", iSignal);
  exit(2);
  return 0;
}

void NoDelInterrupt()
{
#ifdef UNIX
  struct termio b;
  ioctl(1, TCGETA, &b);
  b.c_cc[VINTR] = -1;
  ioctl(1, TCSETA, &b);
#endif
}

void DelInterrupt()
{
#ifdef UNIX
  struct termio b;
  ioctl(1, TCGETA, &b);
  b.c_cc[VINTR] = 127;
  ioctl(1, TCSETA, &b);
#endif
}

void InitWin(WINDOW *w)
{
  keypad(w, TRUE);		/* renvoyer des tokens */
  noecho();
  crmode();				/* pour pccurses */
  nl();					/* pour pccurses */
#if !defined(M_TERMCAP)
  idlok(stdscr,FALSE);	/* ne pas utiliser l'insertion/supp de ligne */
#endif
}

/* Initialisation des curses
*/
void startcurses()
{
#ifdef UNIX
  ioctl(1, TCGETA, &bufio);
#endif

  initscr();
  InitWin(stdscr);
  iModeCurses = 1;
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
  /*
  char	*p;

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

  SignalApp();
  startcurses();

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

void HardCopy()
{
  FILE *f;
  int i,j;
#ifdef UNIX
  char c;
  char *szCa;

  szCa = getenv("SYSTEMCA");
  if (szCa!=NULL && szCa[0]=='W')
	f = popen("lpr -s -dhplj3n", "w");
  else
	f = popen("lpr -s", "w");
#else
  f = fopen("LPT1:", "w");
#endif
  if (f==NULL) return;
  for (i=0 ; i<LINES ; i++)
  { for (j=0 ; j<COLS ; j++)
	  fprintf(f, "%c", A_CHARTEXT & mvwinch(curscr, i, j));
	fprintf(f, "\n");
  }
#ifdef UNIX
  pclose(f);
#else
  fclose(f);
#endif

}

int wgetch2(WINDOW *w)
{ 
  int i;

  doupdate();
  for(;;)
  { 
#ifndef UNIX
    wrefresh(w);
#endif
    i = wgetch(w);
    if (i==KEY_CTRL_R)
	{ wrefresh(curscr);
	  continue;
	}
	if (i==KEY_CTRL_W)
	{ HardCopy();
	  continue;
	}
	break;
  }
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

