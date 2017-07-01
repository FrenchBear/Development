// tbtn.c
// BibliothŠque CUC - Test du contr“le CommandButton 
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>
#include <memory.h>
#include <clib.ref>

#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

char szTexteRef[] = "Il ‚tait &un petit navire\nQui n'avait jamais && navigu‚\nOh‚ oh‚, matelot...&&&";

int CommandButtonRaiseEventB1(struct CUC_CommandButton *pBTN, int iEvt, int iArg);
int CommandButtonRaiseEventB2(struct CUC_CommandButton *pBTN, int iEvt, int iArg);
int CommandButtonRaiseEventB3(struct CUC_CommandButton *pBTN, int iEvt, int iArg);



int main()
{
  int	iActif;
  int	i=0,k=0;
 // char	szTexte[1000];

  struct CUC_HScrollBar *pHSB[9];
  struct CUC_CommandButton	*pBTN[3];
  InitEcran();

  for (i=0 ; i<9 ; i++)
  {
    pHSB[i] = CUC_HScrollBarCreate(stdscr, NULL);  
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_LEFT, 15);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_TOP, 5+i);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_HEIGHT, 1);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_WIDTH, 40);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_SMALLCHANGE, 1);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_LARGECHANGE, 5);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_CSIZE, 2);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_VISIBLE, TRUE);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_ENABLED, TRUE);
  }

  mvaddstr( 5,0,"Top");
  CUC_HScrollBarSetPropNum(pHSB[0], CUCP_MIN, 14);
  CUC_HScrollBarSetPropNum(pHSB[0], CUCP_MAX, 23);
  CUC_HScrollBarSetPropNum(pHSB[0], CUCP_VALUE, 14);

  mvaddstr( 6,0,"Left");
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_MAX, 75);
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_VALUE, 1);

  mvaddstr( 7,0,"Width");
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_MAX, 80);
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_VALUE, 20);

  mvaddstr( 8,0,"Height");
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MAX, 10);
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_VALUE, 4);

  mvaddstr( 9,0,"Visible");
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_VALUE, 1);

  mvaddstr(10,0,"Enabled");
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_VALUE, 1);


  mvaddstr(11,0,"Default");
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_VALUE, 0);

  mvaddstr(12,0,"borderstyle");
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MAX, 2);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_VALUE, 0);

  mvaddstr(13,0,"cancel");
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_VALUE, 1);
  
#define SetProp(ptr, iBarre, prop)  {int v=CUC_HScrollBarGetPropNum(pHSB[iBarre], CUCP_VALUE); CUC_CommandButtonSetPropNum(ptr, prop, v); move(iBarre+5,12); printw("%3d", v);}

  pBTN[0] = CUC_CommandButtonCreate(0, CommandButtonRaiseEventB1);
  pBTN[1] = CUC_CommandButtonCreate(0, CommandButtonRaiseEventB2);
  pBTN[2] = CUC_CommandButtonCreate(0, CommandButtonRaiseEventB3);

  for(i=0;i<3;i++)
  {
    SetProp(pBTN[i], 0, CUCP_TOP);
    SetProp(pBTN[i], 5, CUCP_ENABLED);
  }

//1er bouton
    SetProp(pBTN[0], 1, CUCP_LEFT);
    SetProp(pBTN[0], 2, CUCP_WIDTH);
    SetProp(pBTN[0], 7, CUCP_BORDERSTYLE);
    SetProp(pBTN[0], 3, CUCP_HEIGHT);
    SetProp(pBTN[0], 6, CUCP_DEFAULT);
    SetProp(pBTN[0], 8, CUCP_CANCEL);
    CUC_CommandButtonSetPropStr(pBTN[0], CUCP_CAPTION, szTexteRef);
    CUC_CommandButtonSetPropNum(pBTN[0], CUCP_PARENT, 1);

//2eme bouton
    CUC_CommandButtonSetPropNum(pBTN[1], CUCP_LEFT,45 );
    CUC_CommandButtonSetPropNum(pBTN[1], CUCP_WIDTH,10);
    CUC_CommandButtonSetPropNum(pBTN[1], CUCP_BORDERSTYLE,0);
    CUC_CommandButtonSetPropNum(pBTN[1], CUCP_HEIGHT,3 );
    CUC_CommandButtonSetPropNum(pBTN[1], CUCP_DEFAULT, 0);
    CUC_CommandButtonSetPropNum(pBTN[1], CUCP_CANCEL, 0);
    CUC_CommandButtonSetPropStr(pBTN[1], CUCP_CAPTION, "Bouton 2");
    CUC_CommandButtonSetPropNum(pBTN[1], CUCP_PARENT, 1);

//3eme bouton
    CUC_CommandButtonSetPropNum(pBTN[2], CUCP_LEFT,60 );
    CUC_CommandButtonSetPropNum(pBTN[2], CUCP_WIDTH,9);
    CUC_CommandButtonSetPropNum(pBTN[2], CUCP_BORDERSTYLE,1);
    CUC_CommandButtonSetPropNum(pBTN[2], CUCP_HEIGHT,1 );
    CUC_CommandButtonSetPropNum(pBTN[2], CUCP_DEFAULT, 0);
    CUC_CommandButtonSetPropNum(pBTN[2], CUCP_CANCEL, 0);
    CUC_CommandButtonSetPropStr(pBTN[2], CUCP_CAPTION,"Bou3");
    CUC_CommandButtonSetPropNum(pBTN[2], CUCP_PARENT, 1);

  for(i=0;i<3;i++)
  {
	CUC_CommandButtonSetPropPtr(pBTN[i],CUCP_WDISP,stdscr);
    SetProp(pBTN[i], 4, CUCP_VISIBLE);
  }

  mvaddstr(0,0,"BibliothŠque CUC - Test du contr“le CommandButton");
  mvaddstr(1,0,"La touche ! simule l'appui sur le bouton no 1");
  mvaddstr(2,0,"Utilisez les flŠches pour s‚lectionner et modifier une propri‚t‚\nQ pour quitter.");

  iActif = 0;
  CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
  for(;;)
  {
    
    int v;
    int c = getch2();
    if (c=='q' || c=='Q' || c==4) break;


    if (c==KEY_TAB || c==KEY_F(1))
    { 
      if(iActif>=9)
      {
		   CUC_CommandButtonDoEvent(pBTN[iActif-9], CUCE_LOSTFOCUS, 0);
      }
      else
		CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_LOSTFOCUS, 0);
	  
	  iActif = (iActif+(c==KEY_TAB?1: 11))%12;
	  if(iActif<9)
	  {	
		CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
	  }
	  else
		  CUC_CommandButtonDoEvent(pBTN[iActif-9], CUCE_GOTFOCUS, 0);
	 continue;
    }

	// La touche ! simule l'appui sur le bouton no 1
	if (c=='!')
	{ CUC_CommandButtonSetPropNum(pBTN[0], CUCP_VALUE, 1);
	  if (CUC_CommandButtonGetPropNum(pBTN[0], CUCP_VALUE)!=0)
		aprintf("Erreur !","La valeur d'un bouton doit toujours|ˆtre 0 en dehors d'une proc‚dure d'‚v‚nement !");
	  continue;
	}

    if(iActif<9) 
    {
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_KEY, c);
      v = CUC_HScrollBarGetPropNum(pHSB[iActif], CUCP_VALUE);
      move(iActif+5, 12);
      printw("%3d", v);
      CUC_CommandButtonDoEvent(pBTN[0] ,CUCE_KEY,c);
      CUC_CommandButtonDoEvent(pBTN[1] ,CUCE_KEY,c);
      CUC_CommandButtonDoEvent(pBTN[2] ,CUCE_KEY,c);
    }	
    else CUC_CommandButtonDoEvent(pBTN[iActif-9] ,CUCE_KEY,c);

    switch(iActif)
    { 
      case 0: CUC_CommandButtonSetPropNum(pBTN[0], CUCP_TOP, v);		break;
      case 1: CUC_CommandButtonSetPropNum(pBTN[0], CUCP_LEFT, v);		break;
      case 2: CUC_CommandButtonSetPropNum(pBTN[0], CUCP_WIDTH, v);		break;
      case 3: CUC_CommandButtonSetPropNum(pBTN[0], CUCP_HEIGHT, v);	break;
      case 4: CUC_CommandButtonSetPropNum(pBTN[0], CUCP_VISIBLE, v);	break;
      case 5: CUC_CommandButtonSetPropNum(pBTN[0], CUCP_ENABLED, v);	break;
      case 6: CUC_CommandButtonSetPropNum(pBTN[0], CUCP_DEFAULT, v);	break;
      case 7: CUC_CommandButtonSetPropNum(pBTN[0], CUCP_BORDERSTYLE, v);	break;
      case 8: CUC_CommandButtonSetPropNum(pBTN[0], CUCP_CANCEL, v);	break;
      
    }
  }

  // CUC_CommandButtonGetPropStr(pBTN[0], CUCP_CAPTION, szTexte, 2);
  // if (szTexte[1] || !szTexte[0])
  //   aprintf("PROBLEME !", "Mauvais retour de getPropStr");
  
  for(i=0;i<9;i++) CUC_HScrollBarDestruct(pHSB[i]);
  for (i=0;i<3;i++) CUC_CommandButtonDestruct(pBTN[i]);

  FinEcran();
  return 0;
}


int CommandButtonRaiseEventB1(struct CUC_CommandButton *pBTN, int iEvt, int iArg)
{
  aprintf("EvŠnement CommandButton","Button 1");
  return 0;
}



int CommandButtonRaiseEventB2(struct CUC_CommandButton *pBTN, int iEvt, int iArg)
{
  aprintf("EvŠnement CommandButton","Button 2");
  return 0;
}



int CommandButtonRaiseEventB3(struct CUC_CommandButton *pBTN, int iEvt, int iArg)
{
  aprintf("EvŠnement CommandButton","Button 3");
  return 0;
}
