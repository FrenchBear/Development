/*  INPUT.C	1.70 P.Violent
**
** 27/08/92	Fichier autonome sous Unix, scroll horizontal
** 23/12/92	La fl�che gauche sort du champ en colonne 0
** 24/12/92	InputMode
**  9/04/94 PV	Fin de curses.ref
**
**  Ce module implante une fonction de lecture performante, input().
**  Elle saisit un nombre maximum de caract�res � un endroit donn� sur
**  l'�cran, avec contr�le de types et gestion des touches d'�dition.
**
**  Param�tres:
**  -----------
**  l0,c0:	Ligne & colonne du 1er caract�re � saisir
**  buf:	Un char* sur le buffer � remplir.
**  iLgChamp:	Taille du champ � l'affichage
**  iLgVar:	Nb de caract�res maximum � lire
**  szModele:	Cha�ne des caract�res valides (char *)
**
**  Retour:
**  -------
**  Le code du carat�re qui a termin� la saisie.
**
**  Principe du mod�le:
**  -------------------
**  Il s'agit d'une cha�ne d�crivant les caract�res autoris�s � la
**  saisie, compos�e des codes suivants:
**	A: lettres de A � Z
**	a: lettres de a � z  (minuscules sans accents)
**	�: toutes les minuscules, accentu�es comprises
**	1: chiffres de 0 � 9
**	X: tout caract�re
**  autre: ce caract�re (ex: mettre un blanc dans le mod�le pour
**  l'autoriser)
**
**  Ainsi, le mod�le "A1\:." saisit des noms de fichiers complets alors
**  que "A1" n'autorise ni unit�, ni path ni extension.
**  "1" saisira un entier alors que "1.+-Ee" saisira un r�el.
**  Noter que les caract�res seulements sont corrects; c'est � celui qui
**  appelle input() de v�rifier que la cha�ne rendue � un sens, car pour
**  le 1er exemple, on peut tr�s bien saisir  :AA\\.\\A:\:..
**
**  Les conversions au niveau de la frappe sont effectu�es par la fctn
**  valid. Voici un tableau donnant la lettre prise en compte en
**  fonction de la touche press�e et du mod�le:
**
**			  Caract�res contenus dans le mod�le
**
**				       ���������������������������������������ͻ
**				       �   A   �   a   �  Aa   �   �   �  A�   �
**		      ������������������������������������������������͹
** Touche     �   E    �   E   �   e   �   E   �   e   �   E   �
** frapp�e    ������������������������������������������������Ķ
** au	      �   e    �   E   �   e   �   e   �   e   �   e   �
** clavier    ������������������������������������������������Ķ
**		      �   �    �   E   �   e   �   e   �   �   �   �   �
**		      ������������������������������������������������ͼ
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
  int	iOff = 0;	/* offset du 1er caract�re affich� */
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
		/* suite en s�quence */
	
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
		/* suite en s�quence */

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

