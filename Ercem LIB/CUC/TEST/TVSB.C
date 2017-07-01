// tvsb.c
// Bibliothäque CUC - Test du contrìle VScrollBar
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"


struct CUC_VScrollBar *pVSB1, *pVSB2, *pVSB3;

int VScrollBarRaiseEventB1(struct CUC_VScrollBar *,int ,int );
int VScrollBarRaiseEventB2(struct CUC_VScrollBar *,int ,int );
int VScrollBarRaiseEventB3(struct CUC_VScrollBar *,int ,int );

int main()
{
  int iActif;

  InitEcran();

  mvaddstr(0,0,"Bibliothäque CUC - Test du contrìle VScrollBar");
  mvaddstr(2,0,"Utilisez les fläches, page suivante, page prÇcÇdente, origine, fin\npour modifier la valeur du curseur.\nQ pour quitter.");

  pVSB1 = CUC_VScrollBarCreate(stdscr,VScrollBarRaiseEventB1);
  pVSB2 = CUC_VScrollBarCreate(stdscr,VScrollBarRaiseEventB2);
  pVSB3 = CUC_VScrollBarCreate(stdscr,VScrollBarRaiseEventB3);

  CUC_VScrollBarSetPropNum(pVSB1, CUCP_LEFT, 5);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_TOP, 18);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_WIDTH, 1);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_HEIGHT, 12);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_MIN, 0);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_MAX, 10);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_SMALLCHANGE, 1);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_LARGECHANGE, 5);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_VALUE, 0);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_CSIZE, 1);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_VISIBLE, TRUE);
  CUC_VScrollBarSetPropNum(pVSB1, CUCP_ENABLED, TRUE);

  CUC_VScrollBarSetPropNum(pVSB2, CUCP_LEFT, 15);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_TOP, 8);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_WIDTH, 2);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_HEIGHT, 12);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_MIN, 1);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_MAX, 9);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_SMALLCHANGE, 1);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_LARGECHANGE, 5);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_VALUE, 3);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_CSIZE, 2);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_VISIBLE, TRUE);
  CUC_VScrollBarSetPropNum(pVSB2, CUCP_ENABLED, TRUE);

  CUC_VScrollBarSetPropNum(pVSB3, CUCP_LEFT, 35);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_TOP, 8);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_WIDTH, 3);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_HEIGHT, 12);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_MIN, 3);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_MAX, 17);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_SMALLCHANGE, 1);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_LARGECHANGE, 5);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_VALUE, 12);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_CSIZE, 3);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_VISIBLE, TRUE);
  CUC_VScrollBarSetPropNum(pVSB3, CUCP_ENABLED, TRUE);

  iActif = 0;
  CUC_VScrollBarDoEvent(pVSB1, CUCE_GOTFOCUS, 0);
  for(;;)
  {
    int c = getch2();
    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB)
    { 
      CUC_VScrollBarDoEvent(iActif==0?pVSB1:iActif==1?pVSB2:pVSB3, CUCE_LOSTFOCUS, 0);
      iActif = (iActif+1)%3;
      CUC_VScrollBarDoEvent(iActif==0?pVSB1:iActif==1?pVSB2:pVSB3, CUCE_GOTFOCUS, 0);
      continue;
    }

    switch(iActif)
    {
      case 0:
	CUC_VScrollBarDoEvent(pVSB1, CUCE_KEY, c);
	break;

      case 1:
	CUC_VScrollBarDoEvent(pVSB2, CUCE_KEY, c);
	break;

      case 2:
	CUC_VScrollBarDoEvent(pVSB3, CUCE_KEY, c);
	break;
    }
  }

  CUC_VScrollBarDestruct(pVSB1);
  CUC_VScrollBarDestruct(pVSB2);
  CUC_VScrollBarDestruct(pVSB3);

  FinEcran();
  return 0;
}

int VScrollBarRaiseEventB1(struct CUC_VScrollBar *pVSB, int iEvt,int iArg)
{
	int v = CUC_VScrollBarGetPropNum(pVSB, CUCP_VALUE);
	move(6,5);
	printw("%-3d", v);
	CUC_VScrollBarSetPropNum(pVSB2, CUCP_LEFT, 15+v);
	return 0;
}
int VScrollBarRaiseEventB2(struct CUC_VScrollBar *pVSB, int iEvt,int iArg)
{
	int v = CUC_VScrollBarGetPropNum(pVSB, CUCP_VALUE);
	move(6,15);
	printw("%-3d", v);
	CUC_VScrollBarSetPropNum(pVSB3, CUCP_WIDTH, v);
	return 0;
}

int VScrollBarRaiseEventB3(struct CUC_VScrollBar *pVSB, int iEvt,int iArg)
{
	int v = CUC_VScrollBarGetPropNum(pVSB, CUCP_VALUE);
	move(6,35);
	printw("%-3d", v);
	CUC_VScrollBarSetPropNum(pVSB1, CUCP_HEIGHT, v);
	return 0;
}
