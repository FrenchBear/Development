// twin.c
// Bibliothäque CUC - Test du contrìle fenàtre
// P.VIOLENT Juillet 94

#include <stdio.h>
#include <curses.h>
#include <memory.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"


int main()
{
  int	iActif;
  int	i;

  struct CUC_HScrollBar *pHSB[5];
  struct CUC_Window	*pWIN;
  InitEcran();

  for (i=0 ; i<5 ; i++)
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


  pWIN = CUC_WindowCreate(NULL, NULL);  
  CUC_WindowSetPropStr(pWIN, CUCP_CAPTION, "Titre");
  
#define SetProp(ptr, iBarre, prop)  {int v=CUC_HScrollBarGetPropNum(pHSB[iBarre], CUCP_VALUE); CUC_WindowSetPropNum(ptr, prop, v); move(iBarre+5,12); printw("%3d", v);}
  SetProp(pWIN, 0, CUCP_TOP);
  SetProp(pWIN, 1, CUCP_LEFT);
  SetProp(pWIN, 2, CUCP_WIDTH);
  SetProp(pWIN, 3, CUCP_HEIGHT);
  SetProp(pWIN, 4, CUCP_VISIBLE);


  mvaddstr(0,0,"Bibliothäque CUC - Test du contrìle Window");
  mvaddstr(2,0,"Utilisez les fläches pour sÇlectionner et modifier une propriÇtÇ\nQ pour quitter.");

  iActif = 0;
  CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);

  for(;;)
  {
    int v;
    int c;
     
    refresh();
    CUC_WindowRefresh(pWIN);
    c = getch2();
    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB || c==KEY_F(1))
    { 
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_LOSTFOCUS, 0);
      iActif = (iActif+(c==KEY_TAB?1:4))%5;
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
      continue;
    }

    CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_KEY, c);
    v = CUC_HScrollBarGetPropNum(pHSB[iActif], CUCP_VALUE);
    move(iActif+5, 12);
    printw("%3d", v);

    switch(iActif)
    {
      case 0: CUC_WindowSetPropNum(pWIN, CUCP_TOP, v);		break;
      case 1: CUC_WindowSetPropNum(pWIN, CUCP_LEFT, v);		break;
      case 2: CUC_WindowSetPropNum(pWIN, CUCP_WIDTH, v);	break;
      case 3: CUC_WindowSetPropNum(pWIN, CUCP_HEIGHT, v);	break;
      case 4: CUC_WindowSetPropNum(pWIN, CUCP_VISIBLE, v);	break;
    }
  }

  
  CUC_WindowDestruct(pWIN);

  FinEcran();
  return 0;
}

