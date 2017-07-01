// tchb.c
// Bibliothäque CUC - Test du contrìle checkbox
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

int CheckBoxRaiseEvent(struct CUC_CheckBox *, int , int );


int main()
{
  int iActif;
  int k,i;

  struct CUC_CheckBox *pCHB[3];
  InitEcran();

  drawbox(szBoxs, 5,9,9,17);

  for (i=0,k=1 ; i<3 ;k++, i++)
  {
    pCHB[i] = CUC_CheckBoxCreate(stdscr, CheckBoxRaiseEvent);  

    CUC_CheckBoxSetPropNum(pCHB[i], CUCP_LEFT, 10);
    CUC_CheckBoxSetPropNum(pCHB[i], CUCP_TOP, k+6+i);
    CUC_CheckBoxSetPropNum(pCHB[i], CUCP_WIDTH, 15);
    CUC_CheckBoxSetPropNum(pCHB[i], CUCP_HEIGHT, 1);
    CUC_CheckBoxSetPropNum(pCHB[i], CUCP_VALUE, 0);
    CUC_CheckBoxSetPropNum(pCHB[i], CUCP_TRISTATE, 0);
    CUC_CheckBoxSetPropNum(pCHB[i], CUCP_ALIGNMENT, 0);
    CUC_CheckBoxSetPropNum(pCHB[i], CUCP_VISIBLE, TRUE);
    CUC_CheckBoxSetPropNum(pCHB[i], CUCP_ENABLED,TRUE );
    
  }

  CUC_CheckBoxSetPropNum(pCHB[2], CUCP_TRISTATE, 1);

  CUC_CheckBoxSetPropNum(pCHB[1], CUCP_VALUE, 1);
  CUC_CheckBoxSetPropNum(pCHB[2], CUCP_VALUE, -1);

  CUC_CheckBoxSetPropNum(pCHB[2], CUCP_HEIGHT, 2);
  CUC_CheckBoxSetPropStr(pCHB[0], CUCP_CAPTION, "&Gras123456789");
  CUC_CheckBoxSetPropStr(pCHB[1], CUCP_CAPTION,"bonjou&retour\ncoucou" );
  CUC_CheckBoxSetPropStr(pCHB[2], CUCP_CAPTION, "SoulignÇ \ntrait &simple");

  mvaddstr(0,0,"Bibliothäque CUC - Test du contrìle CheckBox");
  mvaddstr(2,0,"Utilisez les fläches, page suivante, page prÇcÇdente, origine, fin\npour modifier la valeur du curseur.\nQ pour quitter. A bascule la propriÇtÇ alignment. V change la valeur");

  mvaddstr(20,0,"Alignement: gauche");

  iActif = 0;
  CUC_CheckBoxDoEvent(pCHB[iActif], CUCE_GOTFOCUS);
  for(;;)
  {
    int v;
    int c;
    
    v = CUC_CheckBoxGetPropNum(pCHB[iActif], CUCP_VALUE);
    move(6+iActif,0);
    printw("%3d", v);

    c = getch2();

    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB)
    { CUC_CheckBoxDoEvent(pCHB[iActif], CUCE_LOSTFOCUS);
      iActif = (iActif+1)%3;
      CUC_CheckBoxDoEvent(pCHB[iActif], CUCE_GOTFOCUS);
      continue;
    }

    if (c=='a' || c=='A')
    { v = 1-CUC_CheckBoxGetPropNum(pCHB[0], CUCP_ALIGNMENT);
      for (i=0 ; i<3 ; i++)
	CUC_CheckBoxSetPropNum(pCHB[i], CUCP_ALIGNMENT, v);

      if (v==0)
	mvaddstr(20,0,"Alignement: gauche");
      else
	mvaddstr(20,0,"Alignement: droite");
      continue;
    }

    if (c=='v' || c=='V')
    { v = CUC_CheckBoxGetPropNum(pCHB[iActif], CUCP_VALUE);
      if (v<=0)
	v = 1;
      else
	v = 0;
      CUC_CheckBoxSetPropNum(pCHB[iActif], CUCP_VALUE, v);
      continue;
    }

    CUC_CheckBoxDoEvent(pCHB[iActif], CUCE_KEY, c);
  }

  for (i=0 ; i<3 ; i++)
    CUC_CheckBoxDestruct(pCHB[i]);

  FinEcran();
  return 0;
}


int CheckBoxRaiseEvent(struct CUC_CheckBox *pCHB, int iArg, int iArg2)
{
  // aprintf("", "Valeur: %d", CUC_CheckBoxGetPropNum(pCHB, CUCP_VALUE));
  return 0;
}
