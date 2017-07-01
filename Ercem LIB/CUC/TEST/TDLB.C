// tdlb.c
// Bibliothäque CUC - Test du contrìle DirListBox
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

int DirListBoxRaiseEvent(struct CUC_DirListBox *, int , int );

int main()
{
  int	iActif;
  int  i,  jMin=0;
  struct CUC_HScrollBar *pHSB[9];
  struct CUC_DirListBox *pDLB;

  
  InitEcran();
  
  for (i=0 ; i<9 ; i++)
  {
    pHSB[i] = CUC_HScrollBarCreate(stdscr, NULL);  
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_LEFT, 15);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_TOP, 4+i);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_WIDTH, 40);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_HEIGHT, 1);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_SMALLCHANGE, 1);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_LARGECHANGE, 5);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_CSIZE, 2);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_VISIBLE, TRUE);
    CUC_HScrollBarSetPropNum(pHSB[i], CUCP_ENABLED, TRUE);
  }

  mvaddstr( 4,0,"Top");
  CUC_HScrollBarSetPropNum(pHSB[0], CUCP_MIN, 13);
  CUC_HScrollBarSetPropNum(pHSB[0], CUCP_MAX, 23);
  CUC_HScrollBarSetPropNum(pHSB[0], CUCP_VALUE, 13);

  mvaddstr( 5,0,"Left");
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_MAX, 75);
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_VALUE, 8);

  mvaddstr( 6,0,"Width");
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_MIN, 2);
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_MAX, 80);
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_VALUE, 60);

  mvaddstr( 7,0,"Height");
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MIN, 2);
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MAX, 12);
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_VALUE, 10);

  mvaddstr( 8,0,"Visible");
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_VALUE, 1);

  mvaddstr( 9,0,"Enabled");
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_VALUE, 1);

  mvaddstr(10,0,"Columns");
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MAX, 6);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_VALUE, 0);

  mvaddstr(11,0,"");
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_VALUE, 0);

  mvaddstr(12,0,"TabSize");
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MAX, 20);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_VALUE, 2);

#define SetProp(ptr, iBarre, prop)  {int v=CUC_HScrollBarGetPropNum(pHSB[iBarre], CUCP_VALUE); CUC_DirListBoxSetPropNum(ptr, prop, v); move(iBarre+4,12); printw("%3d", v); refresh();}
  pDLB = CUC_DirListBoxCreate(stdscr, NULL);
  SetProp(pDLB, 0, CUCP_TOP);
  SetProp(pDLB, 1, CUCP_LEFT);
  SetProp(pDLB, 2, CUCP_WIDTH);
  SetProp(pDLB, 3, CUCP_HEIGHT);
  SetProp(pDLB, 4, CUCP_VISIBLE);
  SetProp(pDLB, 5, CUCP_ENABLED);
 
  SetProp(pDLB, 6, CUCP_COLUMNS);
  // SetProp(pDLB, 7, CUCP_SORTED);
  SetProp(pDLB, 8, CUCP_TABSIZE);

  CUC_DirListBoxSetPropStr(pDLB,CUCP_PATH,"/usr/");
  CUC_DirListBoxSetPropStr(pDLB,CUCP_DRIVE,"");
  attron(SOULIGNE);
  mvaddstr(0, 20, "Bibliothäque CUC - Test du contrìle DirListBox");
  attroff(SOULIGNE);
  mvaddstr(1,0,"Utilisez les fläches pour sÇlectionner et modifier une propriÇtÇ\n+ Ajoute des ÇlÇments, - Ote l'ÇlÇment courant, E efface la DirListBoxe, * Ajoute le dictionnaire, Q pour quitter, Espace sÈlectionne/dÈsÈlectionne");

  iActif = 0;
  CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
  for(;;)
  {
    int v;
    int c;
    
    c = getch2();
    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB || c==KEY_F(1))
    { 
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_LOSTFOCUS, 0);
      iActif = (iActif+(c==KEY_TAB?1:8))%9;
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
      continue;
    }


	if(c=='p')
	{
	  char buff[LGPATH];

	  CUC_DirListBoxGetPropStr(pDLB,CUCP_PATH,buff,LGPATH);
	  aprintf("Tdlb","path=%s",buff);
	}

	if(c=='i')
	{
	  int j;
	  char buff[LGPATH];

	  for(j=-5;j<5;j++)
	  {
		CUC_DirListBoxGetPropStrInd(pDLB,CUCP_LIST,j,buff,LGPATH);
		aprintf("Tdlb","List(%d)=%s",j,buff);
	  }
	}

    CUC_DirListBoxDoEvent(pDLB, CUCE_KEY, c);

    if (c==KEY_LEFT || c==KEY_RIGHT)
    { CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_KEY, c);
      v = CUC_HScrollBarGetPropNum(pHSB[iActif], CUCP_VALUE);
      move(iActif+4, 12);
      printw("%3d", v);


      switch(iActif)
      {
		case 0: CUC_DirListBoxSetPropNum(pDLB, CUCP_TOP, v);		break;
		case 1: CUC_DirListBoxSetPropNum(pDLB, CUCP_LEFT, v);		break;
		case 2: CUC_DirListBoxSetPropNum(pDLB, CUCP_WIDTH, v);	break;
		case 3: CUC_DirListBoxSetPropNum(pDLB, CUCP_HEIGHT, v);	break;
		case 4: CUC_DirListBoxSetPropNum(pDLB, CUCP_VISIBLE, v);	break;
		case 5: CUC_DirListBoxSetPropNum(pDLB, CUCP_ENABLED, v);	break;
		case 6: CUC_DirListBoxSetPropNum(pDLB, CUCP_COLUMNS, v);	break;
		// case 7: CUC_DirListBoxSetPropNum(pDLB, CUCP_SORTED, v);	break;
		case 8: CUC_DirListBoxSetPropNum(pDLB, CUCP_TABSIZE, v);	break;
      }
    }
  }

  CUC_DirListBoxDestruct(pDLB);

  FinEcran();
  return 0;
}


int DirListBoxRaiseEvent(struct CUC_DirListBox *pDLB, int iEvt, int iArg)
{
  char	szBuffer[1000];
  char	*p;

  CUC_DirListBoxGetPropStr(pDLB, CUCP_TEXT, szBuffer, 1000);
  while (p=strchr(szBuffer, '\r')) *p = '.';
  while (p=strchr(szBuffer, '\n')) *p = '.';
  while (p=strchr(szBuffer, '\t')) *p = '.';
  move(7,60);
  printw("%-19.19s", szBuffer);
  return 0;
}
