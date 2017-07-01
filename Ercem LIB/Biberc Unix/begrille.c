/* begrille.c
** Grilles de saisie de biberc
**  3/12/94	PV	Sortie de esecr.c
*/

#include "biberc.h"

#include "import.h"


void AfficheGrille(GRILLE *g)
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

static void _ChampSuiv(GRILLE *g, int *ip)
{
  int	ips = *ip+1;
  while (g[ips].iType>0) ips++;
  if (g[ips].iType==0)
    *ip = ips;
}

static void _ChampPrec(GRILLE *g, int *ip)
{
  int	ips = *ip-1;
  while (ips>0 && g[ips].iType>0) ips--;
  if (ips>=0 && g[ips].iType==0)
    *ip = ips;
}

int iSaisieGrille(GRILLE *g)
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

