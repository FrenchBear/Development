// topt.c
// Bibliothäque CUC - Test du contrìle option bouton
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>
#include <clib.ref>

#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"


int OptionButtonRaiseEvent(struct CUC_OptionButton *, int , int );


int main()
{
  int iActif;
  int i,k=1;

  int b=10;
  struct CUC_OptionButton *pOPT[100];
  InitEcran();

  drawbox(szBoxs, 5,9,9,17);
  drawbox(szBoxs, 14,9,6,30);

  for(i=0;i<100;i++)
	pOPT[i] = CUC_OptionButtonCreate(stdscr, OptionButtonRaiseEvent);  

  for(i=7;i<90;i++)
    CUC_OptionButtonDestruct(pOPT[i]);
    
  for (i=0,k=1 ; i<3 ;k++, i++)
  {
    // pOPT[i] = CUC_OptionButtonCreate(stdscr, OptionButtonRaiseEvent);  

    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_LEFT, 10);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_TOP,k+ 6+i);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_WIDTH, 15);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_HEIGHT, 2);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_VALUE, 0);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_ALIGNMENT,1 );

    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_VISIBLE, TRUE);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_ENABLED, TRUE);
    CUC_OptionButtonSetPropPtr(pOPT[i], CUCP_PARENT, (void *)1);
  }
 
  for (i=3 ; i<6 ; i++)
  {
    // pOPT[i] = CUC_OptionButtonCreate(stdscr, OptionButtonRaiseEvent);  

    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_LEFT, 10);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_TOP, 12+i);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_WIDTH, 28);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_HEIGHT, 2);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_VALUE, 0);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_ALIGNMENT, 1);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_VISIBLE, TRUE);
    CUC_OptionButtonSetPropNum(pOPT[i], CUCP_ENABLED, TRUE);
    CUC_OptionButtonSetPropPtr(pOPT[i], CUCP_PARENT, (void *)2);
  }
  CUC_OptionButtonSetPropNum(pOPT[1], CUCP_VALUE, 0);
  CUC_OptionButtonSetPropNum(pOPT[2], CUCP_VALUE, 1);
  CUC_OptionButtonSetPropNum(pOPT[5], CUCP_VALUE, 1);

  CUC_OptionButtonSetPropStr(pOPT[0], CUCP_CAPTION,"bonjourgggnnnng"); 
  CUC_OptionButtonSetPropStr(pOPT[1], CUCP_CAPTION,0);
  CUC_OptionButtonSetPropStr(pOPT[2], CUCP_CAPTION, "SoulignÇ \ntrait &simple");
  CUC_OptionButtonSetPropStr(pOPT[3], CUCP_CAPTION, "&&");
  CUC_OptionButtonSetPropStr(pOPT[4], CUCP_CAPTION, "R&ouge");
  CUC_OptionButtonSetPropNum(pOPT[5], CUCP_HEIGHT, 2);
  CUC_OptionButtonSetPropStr(pOPT[5], CUCP_CAPTION, "Bleu && Vert\n2äme Ligne");

  mvaddstr(0,0,"Bibliothäque CUC - Test du contrìle OptionButton");
  mvaddstr(2,0,"Utilisez les fläches, page suivante, page prÇcÇdente, origine, fin\npour modifier la valeur du curseur.\nQ pour quitter. A bascule la propriÇtÇ alignment. V change la valeur");

  mvaddstr(20,0,"Alignement: droite");

  iActif = 1;
  CUC_OptionButtonDoEvent(pOPT[iActif], CUCE_GOTFOCUS);
  for(;;)
  {
    int v;
    int c;
    
    for (i=0 ; i<6 ; i++)
    { v = CUC_OptionButtonGetPropNum(pOPT[i], CUCP_VALUE);
      move(6+i,0);
      printw("%3d", v);
    }

    c = getch2();

    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB || c==KEY_F(1))
    { CUC_OptionButtonDoEvent(pOPT[iActif], CUCE_LOSTFOCUS);
      iActif = (iActif+(c==KEY_TAB?1:5))%6;
      CUC_OptionButtonDoEvent(pOPT[iActif], CUCE_GOTFOCUS);
      continue;
    }

	if(c=='*')
	{
	  int v;
	  v = CUC_OptionButtonGetPropNum(pOPT[iActif], CUCP_ACCELERATOR);
	  aprintf("ACCELERATOR","%c", v);
	}

    if (c=='a' || c=='A')
    { v = 1-CUC_OptionButtonGetPropNum(pOPT[0], CUCP_ALIGNMENT);
      for (i=0 ; i<6 ; i++)
	CUC_OptionButtonSetPropNum(pOPT[i], CUCP_ALIGNMENT, v);

      if (v==0)
	mvaddstr(20,0,"Alignement:gauche ");
         
      else
	mvaddstr(20,0,"Alignement: droite");
      continue;
    }


    CUC_OptionButtonDoEvent(pOPT[iActif], CUCE_KEY, c);
  }

  for (i=0 ; i<6 ; i++)
    CUC_OptionButtonDestruct(pOPT[i]);

  for (i=91 ; i<100 ; i++)
    CUC_OptionButtonDestruct(pOPT[i]);

  FinEcran();
  return 0;
}


int OptionButtonRaiseEvent(struct CUC_OptionButton *pOPT, int iArg, int iArg2)
{
  // aprintf("", "Valeur: %d", CUC_OptionButtonGetPropNum(pOPT, CUCP_VALUE));
  return 0;
}
