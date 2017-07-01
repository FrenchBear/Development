// tlbl.c
// BibliothŠque CUC - Test du contr“le label
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>
#include <memory.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

char szTexteRef[] = "Il ‚tait &un petit 				navire\nQui n'avait jamais && navigu‚\nOh‚ oh‚, matelot...&&&";


int main()
{
  int	iActif;
  int	i;
  char	szTexte[1000];

  struct CUC_HScrollBar *pHSB[9];
  struct CUC_Label	*pLBL;
  InitEcran();

  for (i=0 ; i<9 ; i++)
  {
    pHSB[i] = CUC_HScrollBarCreate(stdscr, NULL);  
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_LEFT, 15);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_TOP, 5+i);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_WIDTH, 40);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_HEIGHT, 1);
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
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_MIN, 8);
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_MAX, 75);
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_VALUE, 8);

  mvaddstr( 7,0,"Width");
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_MAX, 80);
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_VALUE, 20);

  mvaddstr( 8,0,"Height");
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MAX, 10);
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_VALUE, 3);

  mvaddstr( 9,0,"Visible");
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_VALUE, 1);

  mvaddstr(10,0,"Enabled");
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_VALUE, 1);

  mvaddstr(11,0,"Alignment");
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MAX, 2);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_VALUE, 0);

  mvaddstr(12,0,"Border Style");
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MAX, 2);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_VALUE, 0);

  mvaddstr(13,0,"Autosize");
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_VALUE, 0);

  
#define SetProp(ptr, iBarre, prop)  {int v=CUC_HScrollBarGetPropNum(pHSB[iBarre], CUCP_VALUE); CUC_LabelSetPropNum(ptr, prop, v); move(iBarre+5,12); printw("%3d", v);}
  pLBL = CUC_LabelCreate(0, NULL);  
  SetProp(pLBL, 0, CUCP_TOP);
  SetProp(pLBL, 1, CUCP_LEFT);
  SetProp(pLBL, 2, CUCP_WIDTH);
  SetProp(pLBL, 3, CUCP_HEIGHT);
  SetProp(pLBL, 5, CUCP_ENABLED);
  SetProp(pLBL, 6, CUCP_ALIGNMENT);
  SetProp(pLBL, 7, CUCP_BORDERSTYLE);
  SetProp(pLBL, 8, CUCP_AUTOSIZE);

  strcpy(szTexte, szTexteRef);
  CUC_LabelSetPropStr(pLBL, CUCP_CAPTION, szTexte);
CUC_LabelSetPropPtr(pLBL, CUCP_WDISP, stdscr);
  SetProp(pLBL, 4, CUCP_VISIBLE);


  if (strcmp(szTexte, szTexteRef))
    aprintf("PROBLEME !", "Le buffer de l'application|a ‚t‚ modifi‚ !");


  mvaddstr(0,0,"BibliothŠque CUC - Test du contr“le Label");
  mvaddstr(2,0,"Utilisez les flŠches pour s‚lectionner et modifier une propri‚t‚\nQ pour quitter.");

  iActif = 0;
  CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);

  for(;;)
  {
    int v;
    int c = getch2();
    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB || c==KEY_F(1))
    { 
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_LOSTFOCUS, 0);
      iActif = (iActif+(c==KEY_TAB?1:8))%9;
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
      continue;
    }
	if(c=='a' || c=='A') aprintf("TLBL","Accelerator=%c",CUC_LabelGetPropNum(pLBL, CUCP_ACCELERATOR));

    CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_KEY, c);
    v = CUC_HScrollBarGetPropNum(pHSB[iActif], CUCP_VALUE);
    move(iActif+5, 12);
    printw("%3d", v);

    switch(iActif)
    {
      case 0: CUC_LabelSetPropNum(pLBL, CUCP_TOP, v);		break;
      case 1: CUC_LabelSetPropNum(pLBL, CUCP_LEFT, v);		break;
      case 2: CUC_LabelSetPropNum(pLBL, CUCP_WIDTH, v);		break;
      case 3: CUC_LabelSetPropNum(pLBL, CUCP_HEIGHT, v);	break;
      case 4: CUC_LabelSetPropNum(pLBL, CUCP_VISIBLE, v);	break;
      case 5: CUC_LabelSetPropNum(pLBL, CUCP_ENABLED, v);	break;
      case 6: CUC_LabelSetPropNum(pLBL, CUCP_ALIGNMENT, v);	break;
      case 7: CUC_LabelSetPropNum(pLBL, CUCP_BORDERSTYLE, v);	break;
      case 8: CUC_LabelSetPropNum(pLBL, CUCP_AUTOSIZE, v);	break;
    }
  }

  memchr(szTexte, 0, strlen(szTexteRef));
  CUC_LabelGetPropStr(pLBL, CUCP_CAPTION, szTexte, 2);
  if (szTexte[1] || !szTexte[0])
    aprintf("PROBLEME !", "Mauvais retour de getPropStr");

  CUC_LabelGetPropStr(pLBL, CUCP_CAPTION, szTexte, 1000);
  if (strcmp(szTexte, szTexteRef))
    aprintf("PROBLEME !", "Le propri‚t‚ caption|a ‚t‚ alt‚r‚e par le contr“le !");
  
  CUC_LabelDestruct(pLBL);

  FinEcran();
  return 0;
}

