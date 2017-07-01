/* bemenu.c
** Menus de biberc
**  3/12/94 PC	Sortie de esecr.s
*/

#include <string.h>
#include "biberc.h"

#include "import.h"


static int iLLMenu;	/* derniŠre ligne du menu */

void itemMenu(int c0, int iLigne, const char *szLib, int iAttrib)
{
  int i;
  char szKey[16];

  if (iAttrib)
  { attron(SOULIGNE|BRILLANT);
    mvaddstr(iLigne, c0, szLib+2);
    attroff(SOULIGNE|BRILLANT);
    return;
  }

  if (szLib[0]==0)
    return;

  for(i=0 ; szLib[i]!=' ' ; i++)
    szKey[i] = szLib[i];
  szKey[i] = 0;

  attron(INVERSE);
  mvaddstr(iLigne, c0+1-i, szKey);
  attroff(INVERSE);
  mvaddstr(iLigne, c0+1, szLib+i);
}

void AfficheMenu(MENU M)
{
  int i,j;
  int iMsgExit = 1;
  int lmax = 0, c0;

  for (i=1 ; M[i]!=NULL ; i++)
    if (M[i][0]!='$')
    { if ((j=strlen(M[i]))>lmax) lmax = j;
    }
    else
      if (M[i][1]=='t')
	if ((j=strlen(M[i])-3)>lmax) lmax = j;

  c0 = 40-lmax/2;

  Titre(M[0]);
  iLLMenu = 5;
  for (i=1 ; M[i]!=NULL ; i++)
    if (M[i][0]!='$')
      itemMenu(c0, iLLMenu++, M[i], 0);
    else
      switch(M[i][1])
      { case '0': iMsgExit = 0; break;
	case 't': if (iLLMenu>5) iLLMenu++;
		  itemMenu(c0, iLLMenu++, M[i], 1);
		  break;
      }

  if (iMsgExit)
  { iLLMenu += 2;
    itemMenu(c0, iLLMenu++, "Fin Quitter", 0);
    Fkeys("[Fin] Retour au niveau pr‚c‚dent");
  }
  Message("Tapez un num‚ro dans le menu");
}

int iDoMenu(MENU M)
{
  int i, iRep;
  int iMsgExit = 1;

  for (i=1 ; M[i]!=NULL ; i++)
    if (M[i][0]=='$')
      switch(M[i][1])
      { case '0': iMsgExit = 0; break;
      }

  mvaddstr(iLLMenu+1, 20, "Choix: ");
  for(;;)
  {
    move(iLLMenu+1, 27);
    refresh();
    iRep = getch2();
    if (iRep>='A' && iRep<='Z')
      iRep += 32;
    if (iMsgExit && (iRep==KEY_END || iRep=='q' || iRep==KEY_ESCAPE))
      return 0;
    if (iRep!='$')
      for (i=1 ; M[i]!=NULL ; i++)
	if (iRep==M[i][0])
	  return iRep;
    if (iRep=='!')
      return iRep;
    /*
    if (iRep>=0)
      mvaddstr(16, 20, "Choix inconnu !");
    */
  }
}

