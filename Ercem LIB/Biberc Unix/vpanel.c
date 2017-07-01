/* vpanel.c
** Gestion d'une liste de fenˆtes pour aider les curses …
** r‚afficher proprement ce qui est derriŠre une fenˆtre
** effac‚e...
** newwin2 et delwin2 s'utilisent comme newwin et delwin,
** mais lors d'un delwin2 l'arriŠre est automatiquement et
** correctement redessinn‚
** 20/06/94 PV
** 04/07/94 PV  Test de la validit‚ du pointeur dans delwin2
** 11/01/95 PV  Ecriture sur stdout
*/

#include <stdio.h>
#include <stdlib.h>
#include <curses.h>
#include "biberc.h"

#include "import.h"


struct WList
{
  WINDOW *w;
  struct WList *suiv;
};

static struct WList WL0;

WINDOW *newwin2(int nlines, int ncols, int begin_y, int begin_x)
{
  struct WList *wl;

  wl = (struct WList *)malloc(sizeof(struct WList));
  if (wl==NULL) return NULL;

  wl->w = newwin(nlines, ncols, begin_y, begin_x);
  wl->suiv = WL0.suiv;
  WL0.suiv = wl;
  return wl->w;
}


static void rafraichit(struct WList *wl)
{
  if (wl)
  { rafraichit(wl->suiv);
	touchwin(wl->w);
	wnoutrefresh(wl->w);
  }
  else
  { touchwin(stdscr);
	wnoutrefresh(stdscr);
  }
}

void delwin2(WINDOW *win)
{
  struct WList *wl, *pwl;

  for (wl=WL0.suiv,pwl=&WL0 ; wl!=NULL ; wl=wl->suiv,pwl=pwl->suiv)
	if (wl->w==win)
	{ pwl->suiv = wl->suiv;
	  delwin(wl->w);
	  rafraichit(wl->suiv);
	  free((char *)wl);
	  return;
	}
  
  stopcurses();
  printf("biberc: vpanel.c: delwin2: WINDOW * %lx incorrect ! -> Arrˆt du programme.\n", win);
  exit(2);
}

void wrefresh2(WINDOW *win)
{
  if(win!=NULL) wrefresh(win);
  else
  {
	stopcurses();
	printf("biberc: vpanel.c: wrefresh2: WINDOW NULL incorrect ! -> Arrˆt du programme.\n");
	exit(2);
  }
}

