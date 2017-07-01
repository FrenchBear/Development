/* cartouch.c
** Gestion du cartouche standard d'affichage de biberc
**  4/12/94 PV	Sortie de esecr.c
*/

#include <string.h>
#include "biberc.h"

#include "import.h"


/*====================================================================*/
/* Utilitaires */

void ClsZone(int l1, int l2)
{
  int i;

  for (i=l1 ; i<=l2 ; i++)
  { move(i,0);
    clrtoeol();
  }
}

void ClsClient()
{
  ClsZone(1, LINES-4);
}

void Titre(const char *szTitre)
{
  unsigned l = strlen(szTitre);
  int cs = (80-l)/2;

  attron(BRILLANT);
  wdrawbox(stdscr, szBoxs, 1, cs-2, 3, l+4);
  mvaddch(2, cs-1, ' ');
  addstr(szTitre);
  addch(' ');
  attroff(BRILLANT);
  mvaddch(1, cs+l+2, (UC)255);
  mvaddch(2, cs+l+2, (UC)255);
  mvaddch(3, cs+l+2, (UC)255);
}

void Cartouche(const char *szApp, const char *szTitre, const char *szNom)
{
  int i;

  ClsClient();
  attron(SOULIGNE);
  mvaddstr(0, 0, szApp);
  for (i=80-strlen(szApp) ; i-- ; )
    addch(' ');
  mvaddstr(0, (80-strlen(szTitre))/2, szTitre);
  mvaddstr(0, 80-strlen(szNom), szNom);
  attroff(SOULIGNE);
  move(LINES-3,0);
  for (i=80 ; i-- ; )
    addch('-' /*196*/);
}

void CartoucheStd(const char *szNomApp)
{
  if (szSysteme[0]==0)
  { char szSystemID[32], szSystemCA[2], szTTY[32];
    int	 off;

    GetEnvString("TRA_NOM", szNomOperateur, "(sans nom)");
    GetEnvString("SYSTEMID", szSystemID, "(systŠme inconnu)");
    GetEnvString("SYSTEMCA", szSystemCA, "?");
    GetEnvString("TTY", szTTY, "?");
    if (strncmp(szTTY, "/dev/", 5)==0)
      off = 5;
    else
      off = 0;
    sprintf(szSysteme, "[%s-%s] %s", szSystemID, szSystemCA, szTTY+off);
  }

  Cartouche(szSysteme, szNomApp, szNomOperateur);
  AfficheHeure();
}

void Message(const char *szMsg)
{
  int i;

  attron(DIMINUE);
  mvaddstr(LMSG, 0, szMsg);
  for (i=strlen(szMsg) ; i<79 ; i++)
    addch(' ');
  attroff(DIMINUE);
}

void FkeysL(const UC *szMsg, int iLigne)
{
  int	i;
  UC	c;

  move(iLigne, 0);
  for (i=0 ; c=szMsg[i] ; i++)
    switch(c)
    {
      case '[': attron(INVERSE); break;
      case ']': attroff(INVERSE); break;
      default:  addch(c);
    }
  attroff(INVERSE);
  clrtoeol();
}

void Fkeys(const UC *szMsg)
{
  FkeysL(szMsg, LFKEYS);
}

void Pause()
{
  char szBidon[16];

  Message("Return pour continuer... ");
  refresh();
  mvgetstr(LMSG,40,szBidon);
}
