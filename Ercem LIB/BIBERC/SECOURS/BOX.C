
//box.c
// Trac‚ de boŒtes et de traits

#include <stdio.h>
#include <curses.h>

#include <clib.ref>

#include "biberc.h"

/*====================================================================*/

void wdrawbox(w,szG,l1,c1,dl,dc)
WINDOW  *w;
UC      *szG;
int l1,c1,dl,dc;
{
  int i;

  /* wattron(w,ALT); */
  mvwaddch(w,l1,c1,szG[0]);
  for (i=dc-2 ; i-- ; )
    waddch(w,szG[1]);
  waddch(w,szG[2]);
  for (i=1 ; i<dl ; i++)
  { mvwaddch(w,l1+i,c1,szG[3]);
    mvwaddch(w,l1+i,c1+dc-1,szG[4]);
  }
  mvwaddch(w,l1+dl-1,c1,szG[5]);
  for (i=dc-2 ; i-- ; )
    waddch(w,szG[6]);
  waddch(w,szG[7]);
  /* wattroff(w,ALT); */
}

void drawbox(szG,l1, c1, dl, dc)
UC      *szG;
int l1, c1, dl, dc;
{
  wdrawbox(stdscr, szG, l1, c1, dl, dc);
}

/*====================================================================*/

void wdrawvline(w,szG,l1,c1,dl)
WINDOW  *w;
UC      *szG;
int l1,c1,dl;
{
  int i;

  for (i=0 ; i<dl ; i++)
    mvwaddch(w,l1+i,c1,szG[3]);
}

void drawvline(szG,l1,c1,dl)
UC      *szG;
int l1,c1,dl;
{
  wdrawvline(stdscr,szG,l1,c1,dl);
}

void wdrawhline(w,szG,l1,c1,dc)
WINDOW  *w;
UC      *szG;
int l1,c1,dc;
{
  int i;

  for (i=0 ; i<dc ; i++)
    mvwaddch(w,l1,c1+i,szG[1]);
}

void drawhline(szG,l1,c1,dc)
UC      *szG;
int l1,c1,dc;
{
  wdrawhline(stdscr,szG,l1,c1,dc);
}
