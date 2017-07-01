/* szInputBox
** Saisie d'une chaåne dans une boåte de dialogue
** PV Janvier 93
** 11/07/94 PV	Utilisation de delwin2
**  5/12/94 PV	Pasage du Window * propre de Alert ‡ szInputbox pour le mode 16 bits large
*/

#include <stdio.h>
#include <curses.h>
#include <clib.ref>

#include "biberc.h"
#include "import.h"

extern int iAlertl0, iAlertc0;
extern WINDOW *wAlert;

char *szInputBox(const char *szTitre, const char *szTexte, char *szBuffer, int iLg)
{
  WINDOW *win;

  iAlert(szTitre,szTexte,0,0,NULL);
  win = wAlert;
  iWInput(win,7,3,szBuffer,iLg,40,"X");
  delwin2(win);
  touchwin(stdscr);

  return szBuffer;
}

