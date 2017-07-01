// thsb.c
// Bibliothäque CUC - Test du contrìle HScrollBar
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "../cuc.h"
#include "../cucpriv.h"

struct CUC_HScrollBar *pHSB1, *pHSB2, *pHSB3;

int HScrollBarRaiseEventB1(struct CUC_HScrollBar *, int , int );
int HScrollBarRaiseEventB2(struct CUC_HScrollBar *, int , int );
int HScrollBarRaiseEventB3(struct CUC_HScrollBar *, int , int );

int main()
{
  int iActif;

  InitEcran();
  
  mvaddstr(0,0,"Bibliothäque CUC - Test du contrìle HScrollBar");
  mvaddstr(2,0,"Utilisez les fläches, page suivante, page prÇcÇdente, origine, fin\npour modifier la valeur du curseur.\nQ pour quitter.");

  pHSB1 = CUC_HScrollBarCreate(stdscr, HScrollBarRaiseEventB1);  
  pHSB2 = CUC_HScrollBarCreate(stdscr, HScrollBarRaiseEventB2);  
  pHSB3 = CUC_HScrollBarCreate(stdscr, HScrollBarRaiseEventB3);  

  CUC_HScrollBarSetPropNum(pHSB1, CUCP_LEFT, 5);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_TOP, 6);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_WIDTH, 41);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_HEIGHT, 1);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_MAX, 80);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_SMALLCHANGE, 1);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_LARGECHANGE, 5);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_VALUE, 0);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_CSIZE, 1);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_VISIBLE, TRUE);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_ENABLED, TRUE);

  CUC_HScrollBarSetPropNum(pHSB2, CUCP_LEFT, 5);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_TOP, 8);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_WIDTH, 40);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_HEIGHT, 2);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_MAX, 9);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_SMALLCHANGE, 1);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_LARGECHANGE, 5);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_VALUE, 3);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_CSIZE, 2);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_VISIBLE, TRUE);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_ENABLED, TRUE);

  CUC_HScrollBarSetPropNum(pHSB3, CUCP_LEFT, 5);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_TOP, 11);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_WIDTH, 40);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_HEIGHT, 3);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_MAX, 30);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_SMALLCHANGE, 1);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_LARGECHANGE, 5);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_VALUE, 30);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_CSIZE, 3);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_VISIBLE, TRUE);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_ENABLED, TRUE);

  iActif = 0;
  CUC_HScrollBarDoEvent(pHSB1, CUCE_GOTFOCUS, 0);
  for(;;)
  {
    int c = getch2();
    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB)
    { 
      CUC_HScrollBarDoEvent(iActif==0?pHSB1:iActif==1?pHSB2:pHSB3, CUCE_LOSTFOCUS, 0);
      iActif = (iActif+1)%3;
      CUC_HScrollBarDoEvent(iActif==0?pHSB1:iActif==1?pHSB2:pHSB3, CUCE_GOTFOCUS, 0);
      continue;
    }

    switch(iActif)
    { case 0: CUC_HScrollBarDoEvent(pHSB1, CUCE_KEY, c); break;
      case 1: CUC_HScrollBarDoEvent(pHSB2, CUCE_KEY, c); break;
      case 2: CUC_HScrollBarDoEvent(pHSB3, CUCE_KEY, c); break;
    }
  }

  CUC_HScrollBarDestruct(pHSB1);
  CUC_HScrollBarDestruct(pHSB2);
  CUC_HScrollBarDestruct(pHSB3);
  
  FinEcran();
  return 0;
}


int HScrollBarRaiseEventB1(struct CUC_HScrollBar *pHSB, int iEvt, int iArg)
{
  int v = CUC_HScrollBarGetPropNum(pHSB, CUCP_VALUE);
  move(6,0);
  printw("%3d", v);
  CUC_HScrollBarSetPropNum(pHSB2, CUCP_LEFT, 5+v);
  return 0;
}

int HScrollBarRaiseEventB2(struct CUC_HScrollBar *pHSB, int iEvt, int iArg)
{
  int v = CUC_HScrollBarGetPropNum(pHSB, CUCP_VALUE);
  move(8,0);
  printw("%3d", v);
  CUC_HScrollBarSetPropNum(pHSB3, CUCP_HEIGHT, v);
  return 0;
}

int HScrollBarRaiseEventB3(struct CUC_HScrollBar *pHSB, int iEvt, int iArg)
{
  int v = CUC_HScrollBarGetPropNum(pHSB, CUCP_VALUE);
  move(11,0);
  printw("%3d", v);
  CUC_HScrollBarSetPropNum(pHSB1, CUCP_WIDTH, v+10);
  return 0;
}
