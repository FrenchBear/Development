
/* ved.c
** Editeur texte g‚n‚rique
** 26/11/92	PremiŠre version
**  6/12/92	Mise au point d‚finitive 1.0
** 14/12/92	Textes de plus d'un ‚cran de long
**  1/12/93	500 lignes maximum
** 17/05/94	Fusion avec ved0 (utilis‚ par edlst.c)
**
** Retour de EditeTexte:
** 0: Texte non modifi‚
** 1: Texte modifi‚
** -1: Abandon des modifications
*/

/*
#define TEST
*/

#include <stdio.h>
#include <ctype.h>

#include <clib.ref>
#include <biberc.ref>

static UC *szBuffer;
static WINDOW *wEdit;
#define MAXLIGNE 500
static UC *pcM[MAXLIGNE];
static int LIG0, COL0;		/* D‚but de la zone d'‚dition */
static int NBLIG, NBCOL;

static int	iL0;		/* 1Šre ligne d'affichage */
static int	iLed, iCed;	/* coordonn‚es en cours d'‚dition */
static UC	*pcCour;	/* pointeur courant d'‚dition */
static int	nblt;		/* Nombre de lignes ‚cran au total */
static UC	cEOF, cLF;	/* car affich‚ pour LF et EOF */

int iEdLastKey;		/* derniŠre touche utilis‚e */
int iEdLastPos;		/* derniŠre position du curseur */

/*====================================================================*/

static int iLongMot(pm)
UC *pm;
{
  int iLg = 0;
  UC  c;

  while ((c=*pm++) && !isspace(c)) iLg++;
  while ((c=*pm++) && isspace(c))  iLg++;

  return iLg;
}

/*==================================================*/

static void sorcar(c)
UC c;
{
  if (c=='\n') c=cLF;
#ifdef TEST
  else if (c==' ') c=250;
#endif
  else if (c==0) c=cEOF;
  waddch(wEdit, c);
}


#define EFFFDL wclrtoeol(wEdit)

static void AfficheTexte(pcStart, iLstart)
UC *pcStart;
int iLstart;
{
  int iLcur, iCcur;
  UC  c, d, *p;

  iLcur = iLstart;
  iCcur = 0;
  p = pcStart;

  if (nblt==0)
    pcM[nblt++] = p;

  while (c = *p)
  {
    if (iCcur+iLongMot(p)>=NBCOL)
    { pcM[iLcur+1]=p;
      if (iLcur>=iL0 && iLcur<=iL0+NBLIG-1)
      { wmove(wEdit, LIG0+iLcur-iL0, COL0+iCcur);
	EFFFDL;
      }

      iLcur++;
      iCcur = 0;
    }

    if (iLcur>=iL0 && iLcur<=iL0+NBLIG-1)
      wmove(wEdit, LIG0+iLcur-iL0, COL0+iCcur);

    for (p++ ; c && c!=' ' && c!='\n' ; c = *p++)
    { 
      if (iLcur>=iL0 && iLcur<=iL0+NBLIG-1)
	sorcar(c); 
      iCcur++;
    }

    while (c==' ' || c=='\n')
    {
      if (iLcur>=iL0 && iLcur<=iL0+NBLIG-1)
	sorcar(c);
      iCcur++;

      if (c=='\n')
      { pcM[iLcur+1]=p;
	if (iLcur>=iL0 && iLcur<=iL0+NBLIG-1)
	  EFFFDL;

	iLcur++;
	iCcur = 0;
	if (iLcur>=iL0 && iLcur<=iL0+NBLIG-1)
	  wmove(wEdit, LIG0+iLcur-iL0, COL0+iCcur);
      }

      c = *p++;
    }

    p--;
  } /* while */

  if (iLcur>=iL0 && iLcur<=iL0+NBLIG-1)
  { wmove(wEdit, LIG0+iLcur-iL0, COL0+iCcur);
    sorcar(0); EFFFDL;
    wclrtobot(wEdit);
  }

  pcM[iLcur+1]=p;
  nblt = iLcur+2;

} /* AfficheTexte */


static void ReSynchro()
{
  AfficheTexte(pcM[iLed], iLed);
  /* Re-synchronisation sur pcCour */
  while (iLed+2<nblt && pcM[iLed+1]<=pcCour) iLed++;
  iCed = pcCour-pcM[iLed];
  if (iLed<iL0)
  { iL0 = iLed;
    AfficheTexte(szBuffer, 0);
  }
  if (iLed>=iL0+NBLIG)
  { iL0 = iLed-NBLIG+1;
    AfficheTexte(szBuffer, 0);
  }
}


int EditeTexte(szTexte, w, lig0, col0, nblig, nbcol, iPosStart)
UC *szTexte;
WINDOW *w;
int lig0, col0, nblig, nbcol;
int iPosStart;
{
  int	iCedMax;
  int	k;
  UC	c;
  int	bModif = 0;	/* flag de texte modifi‚ */

  LIG0 = lig0;
  COL0 = col0;
  NBLIG = nblig;
  NBCOL = nbcol;
  iL0 = 0;
  wEdit = w;
  szBuffer = szTexte;

  if (strncmp(termname(), "vt", 2)==0)
  { cLF = 182;
    cEOF = 176+32+12;
  }
  else
  { cLF = 254;
    cEOF = 247;
  }

  nblt = 0;
#ifdef TEST
  drawbox2(lig0-1, col0-1, nblig+2, nbcol+2);
#endif

  iLed = 0;
  iCed = 0;
  pcCour = szBuffer;

  AfficheTexte(szBuffer, 0);

  while (iPosStart>0)
  {
    iCedMax = pcM[iLed+1]-pcM[iLed]-1;
    if (iCed<iCedMax && *pcCour!='\n')
    { pcCour++;
      iCed++;
    }
    else if (iLed<nblt-2)
    { iLed++;
      iCed=0;
      pcCour = pcM[iLed];
    }
    if (iLed>=iL0+NBLIG)
      iL0 = iLed-NBLIG+1;

    iPosStart--;
  }

  if (iL0>0)
    AfficheTexte(szBuffer, 0);

  wrefresh(stdscr);

  for (;;)
  {
#ifdef TEST
    move(0,0);
    printw("l:%2d/%2d c:%2d pos:%3d iL0:%2d ", iLed, nblt, iCed, pcCour-szBuffer, iL0);
#endif
    wmove(wEdit, LIG0+iLed-iL0, COL0+iCed);
    iEdLastPos = pcCour-szBuffer;
    iEdLastKey = k = wgetch2(wEdit);

    switch(k)
    {
      case KEY_END:
      case KEY_ESCAPE:
      case KEY_F(3):
      case KEY_F(7):
      case KEY_F(8):
	return bModif;

      case 26:	/* KEY_CTRL_Z ind‚fini... */
      case KEY_DELETE:
	if (bModif) return -1;
	return 0;

#ifdef TEST
      case '?':
	move(1,0);
	clrtoeol();
	{ int i;
	  for (i=0 ; i<nblt ; i++)
	    printw("%d:%d ", i, pcM[i]-pcM[0]);
	}
	break;
#endif

      case KEY_RIGHT:
	iCedMax = pcM[iLed+1]-pcM[iLed]-1;
	if (iCed<=iCedMax && *pcCour!='\n')
	{ pcCour++;
	  iCed++;
	}
	else if (iLed<nblt-2)
	{ iLed++;
	  iCed=0;
	  pcCour = pcM[iLed];
	}
	if (iLed>=iL0+NBLIG)
	{ iL0 = iLed-NBLIG+1;
	  AfficheTexte(szBuffer, 0);
	}
	break;

      case KEY_LEFT:
	if (pcCour-szBuffer>0)
	{ if (iCed>0)
	 {  pcCour--;
	    iCed--;
	  }
	  else
	  { iLed--;
	    iCed = pcM[iLed+1]-pcM[iLed];
	    if (iCed>0 && pcCour[-1]=='\n')
	    { iCed--;
	      pcCour--;
	    }
	  }
	  if (iLed<iL0)
	  { iL0 = iLed;
	    AfficheTexte(szBuffer, 0);
	  }
	}
	break;

      case KEY_UP:
	if (iLed>0)
	{ iLed--;
	  iCedMax = pcM[iLed+1]-pcM[iLed]-1;
	  if (iCed>iCedMax) iCed=iCedMax;
	  pcCour = pcM[iLed]+iCed;
	}
	if (iLed<iL0)
	{ iL0 = iLed;
	  AfficheTexte(szBuffer, 0);
	}
	break;

      case KEY_DOWN:
	if (iLed<nblt-2)
	{ iLed++;
	  iCedMax = pcM[iLed+1]-pcM[iLed];
	  if (iCed>iCedMax) iCed=iCedMax;
	  pcCour = pcM[iLed]+iCed;
	  if (iCed>0 && pcCour[-1]=='\n')
	  { iCed--;
	    pcCour--;
	  }
	  if (iLed>=iL0+NBLIG)
	  { iL0 = iLed-NBLIG+1;
	    AfficheTexte(szBuffer, 0);
	  }
	}
	break;

      case KEY_PGUP:
	return bModif;
	/*
	iLed = iCed = 0;
	pcCour = pcM[0];
	if (iLed<iL0)
	{ iL0 = iLed;
	  AfficheTexte(szBuffer, 0);
	}
	break;
	*/

      case KEY_PGDN:
	return bModif;
	/*
	iLed = nblt-2;
	iCed = 0;
	pcCour = pcM[iLed];
	if (iLed>=iL0+NBLIG)
	{ iL0 = iLed-NBLIG+1;
	  AfficheTexte(szBuffer, 0);
	}
	break;
	*/

      case KEY_TAB:
	while ((c=*pcCour) && !isspace(c)) pcCour++;
	while ((c=*pcCour) && isspace(c)) pcCour++;
	ReSynchro();
	break;


      case KEY_HOME:
	if (iCed==0)
	{ iCed = pcM[iLed+1]-pcM[iLed];
	  pcCour = pcM[iLed+1];
	  if (iCed>0 && pcCour[-1]=='\n')
	  { iCed--;
	    pcCour--;
	  }
	}
	else
	{ iCed = 0;
	  pcCour = pcM[iLed];
	}
	break;

      case KEY_F(9):
      case KEY_CTRL_X:
	if (*pcCour)
	{ strdelnc(pcCour,1);
	  ReSynchro();
	  bModif = 1;
	}
	break;

      case KEY_CTRL_D:
	if (*pcCour)
	{ strdelnc(pcCour,pcM[iLed+1]-pcM[iLed]);
	  ReSynchro();
	  bModif = 1;
	}
	break;

      case KEY_BACK:
	if (iLed || iCed)
	{ pcCour--;
	  if (iCed==0) iLed--;
	  strdelnc(pcCour, 1);
	  ReSynchro();
	  bModif = 1;
	}
	break;

      case KEY_F(5):
	strinsnc(pcCour, 2);
	*pcCour++ = '{';
	*pcCour = '}';
	ReSynchro();
	bModif = 1;
	break;

      default:
	if ((k>=32 && k<=255 && k!=127) || k=='\n')
	{ strinsnc(pcCour,1);
	  *pcCour++ = (UC)k;
	  ReSynchro();
	  bModif = 1;
	}
	break;

    } /* switch k */
  } /* for(;;) */

  return 0;	/* ‚vite un warning */
} /* EditeTexte */

