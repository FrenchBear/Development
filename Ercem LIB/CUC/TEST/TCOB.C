// tcob.c
// Bibliothäque CUC - Test du contrìle ComboBox
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

int ComboRaiseEvent(struct CUC_ComboBox *, int , int );

char buffer[1000];

int main()
{
  int	iActif;
  int	i;

  struct CUC_HScrollBar *pHSB[9];
  struct CUC_ComboBox	*pCOB;
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
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_VALUE, 30);

  mvaddstr( 7,0,"Height");
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MIN, 1);
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

  mvaddstr(10,0,"Style");
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MAX, 2);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_VALUE, 2);

  mvaddstr(11,0,"Sorted");
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_VALUE, 0);

  mvaddstr(12,0,"TabSize");
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MAX, 20);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_VALUE, 8);

#define SetProp(ptr, iBarre, prop)  {int v=CUC_HScrollBarGetPropNum(pHSB[iBarre], CUCP_VALUE); CUC_ComboBoxSetPropNum(ptr, prop, v); move(iBarre+4,12); printw("%3d", v); refresh();}
  pCOB = CUC_ComboBoxCreate(stdscr, ComboRaiseEvent);
  SetProp(pCOB, 0, CUCP_TOP);
  SetProp(pCOB, 1, CUCP_LEFT);
  SetProp(pCOB, 2, CUCP_WIDTH);
  SetProp(pCOB, 3, CUCP_HEIGHT);
  SetProp(pCOB, 4, CUCP_VISIBLE);
  SetProp(pCOB, 5, CUCP_ENABLED);
  SetProp(pCOB, 6, CUCP_STYLE);
  SetProp(pCOB, 8, CUCP_TABSIZE);

  CUC_ComboBoxAddItem(pCOB, "286\niAPX", -1);
  CUC_ComboBoxAddItem(pCOB, "386 SX", -1);
  CUC_ComboBoxAddItem(pCOB, "Pentium", -1);
  CUC_ComboBoxAddItem(pCOB, "186", 0);
  CUC_ComboBoxAddItem(pCOB, "486 SX", 3);
  CUC_ComboBoxAddItem(pCOB, "8086", 0);
  CUC_ComboBoxAddItem(pCOB, "8088", 0);
  CUC_ComboBoxAddItem(pCOB, "8080", 0);

  CUC_ComboBoxSetPropStr(pCOB, CUCP_TEXT, "Texte Combo Box");
  CUC_ComboBoxSetPropNum(pCOB, CUCP_LISTWIDTH, 60);

  attron(SOULIGNE);
  mvaddstr(0, 20, "Bibliothäque CUC - Test du contrìle ComboBox");
  attroff(SOULIGNE);
  mvaddstr(1,0,"Utilisez les fläches pour sÇlectionner et modifier une propriÇtÇ\n+ Ajoute des ÇlÇments, - Ote l'ÇlÇment courant, E efface la liste, * Ajoute le dictionnaire, Q pour quitter, Espace sÇlectionne/dÇsÇlectionne");

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
	  if(iActif<9)
		CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_LOSTFOCUS, 0);
	  else
		CUC_ComboBoxDoEvent(pCOB, CUCE_LOSTFOCUS, 0);
      iActif = (iActif+(c==KEY_TAB?1:9))%10;
	  if(iActif<9)
		CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
	  else
		CUC_ComboBoxDoEvent(pCOB, CUCE_GOTFOCUS, 0);
      continue;
    }
    
	if(c=='\n')
	{
	  CUC_ComboBoxGetPropStr(pCOB, CUCP_TEXT, buffer, 1000);
	  aprintf("COB TEXT","%s",buffer);
	}
    if (c=='-')
    { CUC_ComboBoxRemoveItem(pCOB, -1);
      continue;
    }

	if(c=='c')
	{
	  CUC_ComboBoxCloseList(pCOB);
	  continue;
	}
    
    if (c=='+')
    { CUC_ComboBoxAddItem(pCOB, "Il Çtait", -1);
      CUC_ComboBoxAddItem(pCOB, "un petit", -1);
      CUC_ComboBoxAddItem(pCOB, "navire qui", -1);
      CUC_ComboBoxAddItem(pCOB, "n'avait jamais", -1);
      CUC_ComboBoxAddItem(pCOB, "naviguÇ,", -1);
      CUC_ComboBoxAddItem(pCOB, "OhÇ, ohÇ, matelot...", -1);
      continue;
    }
    
    if (c=='E')
    { CUC_ComboBoxClear(pCOB);
      continue;
    }
    
    if (c=='?')
    {
      if (CUC_ComboBoxGetPropNum(pCOB, CUCP_LISTCOUNT)>0)
      {
		char szBuffer[1000];
		int v;

		v = CUC_ComboBoxGetPropNum(pCOB, CUCP_LISTINDEX);
		// CUC_ComboBoxGetPropStrInd(pCOB, CUCP_LIST, v, szBuffer, 1000);
		if (szBuffer[0]=='*')
		  strdelnc(szBuffer, 1);
		else
		{ strinsnc(szBuffer, 1);
		  szBuffer[0] = '*';
		}
		// CUC_ComboBoxSetPropStrInd(pCOB, CUCP_LIST, v, szBuffer);
      }
      continue;
    }


    if (iActif<9)
    { CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_KEY, c);
      v = CUC_HScrollBarGetPropNum(pHSB[iActif], CUCP_VALUE);
      move(iActif+4, 12);
      printw("%3d", v);


      switch(iActif)
      {
		case 0: CUC_ComboBoxSetPropNum(pCOB, CUCP_TOP, v);		break;
		case 1: CUC_ComboBoxSetPropNum(pCOB, CUCP_LEFT, v);		break;
		case 2: CUC_ComboBoxSetPropNum(pCOB, CUCP_WIDTH, v);	break;
		case 3: CUC_ComboBoxSetPropNum(pCOB, CUCP_HEIGHT, v);	break;
		case 4: CUC_ComboBoxSetPropNum(pCOB, CUCP_VISIBLE, v);	break;
		case 5: CUC_ComboBoxSetPropNum(pCOB, CUCP_ENABLED, v);	break;
		case 6: CUC_ComboBoxSetPropNum(pCOB, CUCP_STYLE, v);	break;
		// case 7: CUC_ComboBoxSetPropNum(pCOB, CUCP_SORTED, v);	break;
		case 8: CUC_ComboBoxSetPropNum(pCOB, CUCP_TABSIZE, v);	break;
      }
    }
	else
	  CUC_ComboBoxDoEvent(pCOB, CUCE_KEY, c);
  }

  CUC_ComboBoxDestruct(pCOB);

  FinEcran();
  return 0;
}


int ComboRaiseEvent(struct CUC_ComboBox *pCOB, int iEvt, int iArg)
{
  char	szBuffer[1000];
  char	*p;

  CUC_ComboBoxGetPropStr(pCOB, CUCP_TEXT, szBuffer, 1000);
  while (p=strchr(szBuffer, '\r')) *p = '.';
  while (p=strchr(szBuffer, '\n')) *p = '.';
  while (p=strchr(szBuffer, '\t')) *p = '.';
  move(7,60);
  printw("%-19.19s", szBuffer);
  return 0;
}
