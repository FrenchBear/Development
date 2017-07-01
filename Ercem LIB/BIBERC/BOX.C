/* box.c
** Trac‚ de boŒtes et de traits
** 09/06/94 PV
*/

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include "biberc.h"

#include "import.h"

/*====================================================================*/

void wdrawbox(WINDOW *w, const UC *szG, int l1, int c1, int dl, int dc)
{
  int i;

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
}

void drawbox(const UC *szG, int l1, int c1, int dl, int dc)
{
  wdrawbox(stdscr, szG, l1, c1, dl, dc);
}

/*====================================================================*/

void wdrawvline(WINDOW *w, const UC *szG, int l1, int c1, int dl)
{
  int i;

  for (i=0 ; i<dl ; i++)
    mvwaddch(w,l1+i,c1,szG[3]);
}

void drawvline(const UC *szG, int l1, int c1, int dl)
{
  wdrawvline(stdscr,szG,l1,c1,dl);
}

void wdrawhline(WINDOW *w, const UC *szG, int l1, int c1, int dc)
{
  int i;

  for (i=0 ; i<dc ; i++)
    mvwaddch(w,l1,c1+i,szG[1]);
}

void drawhline(const UC *szG, int l1, int c1, int dc)
{
  wdrawhline(stdscr,szG,l1,c1,dc);
}
