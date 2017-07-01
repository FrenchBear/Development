
/* szInputBox
** Saisie d'une chaåne dans une boåte de dialogue
** PV Janvier 93
*/

#include <stdio.h>
#include <curses.h>
#include <clib.ref>

#include "biberc.ref"
extern int iAlertl0, iAlertc0;

char *szInputBox(szTitre, szTexte, szBuffer, iLg)
char *szTitre, *szTexte, *szBuffer;
int iLg;
{
  WINDOW *win;

  win = (WINDOW *)iAlert(szTitre,szTexte,0,0,NULL);
  iWInput(win,7,3,szBuffer,iLg,40,"X");
  delwin(win);
  touchwin(stdscr);

  return szBuffer;
}

