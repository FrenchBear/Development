// tflb.c
// Bibliothäque CUC - Test du contrìle FileListBox
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

int FileListBoxRaiseEvent(struct CUC_FileListBox *, int , int );

int main()
{
  int	iActif;
  int  i,  jMin=0;
  struct CUC_HScrollBar *pHSB[9];
  struct CUC_FileListBox *pFLB;
  char buffer[512];

  
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
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_VALUE, 8);

#define SetProp(ptr, iBarre, prop)  {int v=CUC_HScrollBarGetPropNum(pHSB[iBarre], CUCP_VALUE); CUC_FileListBoxSetPropNum(ptr, prop, v); move(iBarre+4,12); printw("%3d", v); refresh();}
  pFLB = CUC_FileListBoxCreate(stdscr, NULL);
  SetProp(pFLB, 0, CUCP_TOP);
  SetProp(pFLB, 1, CUCP_LEFT);
  SetProp(pFLB, 2, CUCP_WIDTH);
  SetProp(pFLB, 3, CUCP_HEIGHT);
  SetProp(pFLB, 4, CUCP_VISIBLE);
  SetProp(pFLB, 5, CUCP_ENABLED);
 
  SetProp(pFLB, 6, CUCP_COLUMNS);
  // SetProp(pFLB, 7, CUCP_SORTED);
  SetProp(pFLB, 8, CUCP_TABSIZE);
  // CUC_FileListBoxSetPropNum(pFLB, CUCP_AUTOREFRESH, 1);


  CUC_FileListBoxSetPropStr(pFLB,CUCP_PATH,"/u/serveur/stat");
  CUC_FileListBoxSetPropStr(pFLB,CUCP_DRIVE,"/");
  CUC_FileListBoxSetPropStr(pFLB,CUCP_PATTERN,"*.ext");
  attron(SOULIGNE);
  mvaddstr(0, 20, "Bibliothäque CUC - Test du contrìle FileListBox");
  attroff(SOULIGNE);
  mvaddstr(1,0,"Utilisez les fläches pour sÇlectionner et modifier une propriÇtÇ\n+ Ajoute des ÇlÇments, - Ote l'ÇlÇment courant, E efface la FileListBoxe, * Ajoute le dictionnaire, Q pour quitter, Espace sÈlectionne/dÈsÈlectionne");

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
    CUC_FileListBoxDoEvent(pFLB, CUCE_KEY, c);

    if (c=='\n')
    { 
	  if(CUC_FileListBoxGetPropStr(pFLB, CUCP_FILENAME, buffer, 512)!=NULL)
		aprintf("Test FileListBox","Fichier : %s",buffer);
	}

    if (c==KEY_LEFT || c==KEY_RIGHT)
    { CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_KEY, c);
      v = CUC_HScrollBarGetPropNum(pHSB[iActif], CUCP_VALUE);
      move(iActif+4, 12);
      printw("%3d", v);


      switch(iActif)
      {
	case 0: CUC_FileListBoxSetPropNum(pFLB, CUCP_TOP, v);		break;
	case 1: CUC_FileListBoxSetPropNum(pFLB, CUCP_LEFT, v);		break;
	case 2: CUC_FileListBoxSetPropNum(pFLB, CUCP_WIDTH, v);	break;
	case 3: CUC_FileListBoxSetPropNum(pFLB, CUCP_HEIGHT, v);	break;
	case 4: CUC_FileListBoxSetPropNum(pFLB, CUCP_VISIBLE, v);	break;
	case 5: CUC_FileListBoxSetPropNum(pFLB, CUCP_ENABLED, v);	break;
	case 6: CUC_FileListBoxSetPropNum(pFLB, CUCP_COLUMNS, v);	break;
	// case 7: CUC_FileListBoxSetPropNum(pFLB, CUCP_SORTED, v);	break;
	case 8: CUC_FileListBoxSetPropNum(pFLB, CUCP_TABSIZE, v);	break;
      }
    }
  }

  CUC_FileListBoxDestruct(pFLB);

  FinEcran();
  return 0;
}


int FileListBoxRaiseEvent(struct CUC_FileListBox *pFLB, int iEvt, int iArg)
{
  char	szBuffer[1000];
  char	*p;

  CUC_FileListBoxGetPropStr(pFLB, CUCP_TEXT, szBuffer, 1000);
  while (p=strchr(szBuffer, '\r')) *p = '.';
  while (p=strchr(szBuffer, '\n')) *p = '.';
  while (p=strchr(szBuffer, '\t')) *p = '.';
  move(7,60);
  printw("%-19.19s", szBuffer);
  return 0;
}
