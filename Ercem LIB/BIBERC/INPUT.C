/*  INPUT.C	1.70 P.Violent
**
** 27/08/92	Fichier autonome sous Unix, scroll horizontal
** 23/12/92	La flŠche gauche sort du champ en colonne 0
** 24/12/92	InputMode
**  9/04/94 PV	Fin de curses.ref
**
**  Ce module implante une fonction de lecture performante, input().
**  Elle saisit un nombre maximum de caractŠres … un endroit donn‚ sur
**  l'‚cran, avec contr“le de types et gestion des touches d'‚dition.
**
**  ParamŠtres:
**  -----------
**  l0,c0:	Ligne & colonne du 1er caractŠre … saisir
**  buf:	Un char* sur le buffer … remplir.
**  iLgChamp:	Taille du champ … l'affichage
**  iLgVar:	Nb de caractŠres maximum … lire
**  szModele:	ChaŒne des caractŠres valides (char *)
**
**  Retour:
**  -------
**  Le code du caratŠre qui a termin‚ la saisie.
**
**  Principe du modŠle:
**  -------------------
**  Il s'agit d'une chaŒne d‚crivant les caractŠres autoris‚s … la
**  saisie, compos‚e des codes suivants:
**	A: lettres de A … Z
**	a: lettres de a … z  (minuscules sans accents)
**	…: toutes les minuscules, accentu‚es comprises
**	1: chiffres de 0 … 9
**	X: tout caractŠre
**  autre: ce caractŠre (ex: mettre un blanc dans le modŠle pour
**  l'autoriser)
**
**  Ainsi, le modŠle "A1\:." saisit des noms de fichiers complets alors
**  que "A1" n'autorise ni unit‚, ni path ni extension.
**  "1" saisira un entier alors que "1.+-Ee" saisira un r‚el.
**  Noter que les caractŠres seulements sont corrects; c'est … celui qui
**  appelle input() de v‚rifier que la chaŒne rendue … un sens, car pour
**  le 1er exemple, on peut trŠs bien saisir  :AA\\.\\A:\:..
**
**  Les conversions au niveau de la frappe sont effectu‚es par la fctn
**  valid. Voici un tableau donnant la lettre prise en compte en
**  fonction de la touche press‚e et du modŠle:
**
**			  CaractŠres contenus dans le modŠle
**
**				       ÉÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍ»
**				       º   A   ³   a   ³  Aa   ³   …   ³  A…   º
**		      ÉÍÍÍÍÍÍÍÍÎÍÍÍÍÍÍÍØÍÍÍÍÍÍÍØÍÍÍÍÍÍÍØÍÍÍÍÍÍÍØÍÍÍÍÍÍÍ¹
** Touche     º   E    º   E   ³   e   ³   E   ³   e   ³   E   º
** frapp‚e    ÇÄÄÄÄÄÄÄÄ×ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ¶
** au	      º   e    º   E   ³   e   ³   e   ³   e   ³   e   º
** clavier    ÇÄÄÄÄÄÄÄÄ×ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ¶
**		      º   ‚    º   E   ³   e   ³   e   ³   ‚   ³   ‚   º
**		      ÈÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍ¼
*/

#include <stdio.h>
#include <ctype.h>

#include <clib.ref>
#include "biberc.h"

#include "import.h"

static int iAttribActif = BRILLANT|SOULIGNE;
static int iAttribRepos = DIMINUE;

/*====================================================================*/

void InputMode(int iAttActif, int iAttRepos)
{
  iAttribActif = iAttActif;
  iAttribRepos = iAttRepos;
}

/*====================================================================*/

int iInput(int l0, int c0, UC *buf, int iLgVar, int iLgChamp, const UC *szModele)
{
  return iWInput(stdscr,l0,c0,buf,iLgVar,iLgChamp,szModele);
}

int iWInput(WINDOW *win, int l0, int c0,UC *buf, int iLgVar,int iLgChamp, const UC *szModele)
{
  int	iTouche, iCol, iOk;
  int	iInsMode = 1;
  int	i, iExit = 0, lg;
  int	iOff = 0;	/* offset du 1er caractŠre affich‚ */
  int	bRedisp, iOffOld;
  int	iLg2	= iLgChamp/2;

  lg = strlen(buf);
  if (lg>iLgChamp)
    iOff = lg-iLgChamp;
  iCol = lg-iOff;

  bRedisp = 1;

  do
  {
    if (bRedisp)
    { bRedisp = 0;
      wattron(win, iAttribActif);
      wmove(win, l0, c0);
      for (i=0 ; i<iLgChamp ; i++)
		waddch(win, (char)(iOff+i>=lg ? ' ' : buf[iOff+i]));
      wattroff(win, iAttribActif);
    }

    wmove(win, l0, c0+iCol);
    iTouche = wgetch2(win);

    switch(iTouche)
    {
      case KEY_CTRL_A:
      case KEY_INSERT:
		iInsMode = !iInsMode;
		break;

      case KEY_HOME:
		iOffOld = iOff;
		if (iCol+iOff)
		  iCol = iOff = 0;
		else
		{ iCol = lg;
		  iOff = 0;
		  if (lg>iLgChamp)
		  { iOff = lg-iLgChamp;
		    iCol = iLgChamp;
		  }
		}
		bRedisp = iOff!=iOffOld;
		break;

      case KEY_CTRL_Y:
		if (lg==0) break;
		buf[0] = 0;
		iCol = lg = iOff = 0;
		bRedisp = 1;
		break;

      case KEY_CTRL_X:
      case KEY_DELETE:
		i = iCol+iOff;
		if (i==lg) break;
		while (buf[i]=buf[i+1]) i++;
		lg--;
		bRedisp = 1;
		break;

      case KEY_BACK:
		i = iCol+iOff;
		if (i==0) break;
		while (buf[i-1]=buf[i]) i++;
		lg--;
		bRedisp = 1;
		/* suite en s‚quence */
	
	      case KEY_LEFT:
		if (iCol+iOff)
		  if (iCol>1)
		    iCol--;
		  else
		  { if (iOff>=iLg2)
		    { iCol += iLg2-1;
		      iOff -= iLg2;
		    }
		    else
		    { iCol = iOff-1+iCol;
		      iOff = 0;
		    }
		    bRedisp = 1;
		  }
		else
		  iExit = 1;	/* Sortie sur gauche en colonne 1 */
		break;
	
	      default:
		if (iTouche<' ' || iTouche>255)
		{ iExit = 1;
		  break;
		}
		iTouche = iValid(szModele, (UC)iTouche, &iOk);
		if (!iOk) break;
	
		bRedisp = 1;
		if (lg==iLgVar)
		  buf[lg-1] = (UC)iTouche;
		else if (iInsMode)
		{ if (lg==iLgVar) break;
		  i = lg;
		  while (i>=iCol+iOff)
		  { buf[i+1]=buf[i];
		    i--;
		  }
		  buf[iCol+iOff] = (UC)iTouche;
		  lg++;
		}
		else
		{ if (iCol+iOff==iLgVar) break;
		  if (iCol+iOff==lg)
		  { buf[iCol+iOff+1] = 0;
		    lg++;
		  }
		  buf[iCol+iOff] = (UC)iTouche;
		}
		/* suite en s‚quence */

      case KEY_RIGHT:
		if (iCol+iOff<lg)
		  if (iCol<iLgChamp-1)
		    iCol++;
		  else
		  { if (iOff+iLg2+iLgChamp<iLgVar-1)
		    { iOff += iLg2;
		      iCol = iCol-iLg2+1;
		    }
		    else
		    { int iPos = iOff+iCol+1;
		      iOff = iLgVar-iLgChamp;
		      iCol = iPos-iOff;
		    }
		    bRedisp = 1;
		  }
		break;
	
    }

  } while (!iExit);

  wattroff(win, iAttribActif);
  wattron(win, iAttribRepos);
  wmove(win,l0, c0);
  for (i=0 ; i<iLgChamp ; i++)
    waddch(win, (char)(iOff+i>=lg ? ' ' : buf[iOff+i]));
  wattroff(win,iAttribRepos);
  wrefresh(win);

  return iTouche;

} /* iInput */

