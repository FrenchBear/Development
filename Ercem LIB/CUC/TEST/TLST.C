// tlst.c
// BibliothŠque CUC - Test du contr“le List
// P.VIOLENT Juin 94
//  2/12/94	PV	Test des propriétés LINE, COLUMN, STARTLINE et STARTCOLUMN

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

int ListRaiseEvent(struct CUC_List *, int , int );

int main()
{
  int	iActif;
  int	i;

  struct CUC_HScrollBar *pHSB[9];
  struct CUC_List	*pLST;
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
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MIN, 3);
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

  mvaddstr(11,0,"Sorted");
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_VALUE, 0);

  mvaddstr(12,0,"TabSize");
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MAX, 20);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_VALUE, 8);

#define SetProp(ptr, iBarre, prop)  {int v=CUC_HScrollBarGetPropNum(pHSB[iBarre], CUCP_VALUE); CUC_ListSetPropNum(ptr, prop, v); move(iBarre+4,12); printw("%3d", v); refresh();}
  pLST = CUC_ListCreate(NULL, ListRaiseEvent);

  SetProp(pLST, 0, CUCP_TOP);
  SetProp(pLST, 1, CUCP_LEFT);
  SetProp(pLST, 2, CUCP_WIDTH);
  SetProp(pLST, 3, CUCP_HEIGHT);
  SetProp(pLST, 5, CUCP_ENABLED);
  SetProp(pLST, 6, CUCP_COLUMNS);
  SetProp(pLST, 7, CUCP_SORTED);
  SetProp(pLST, 8, CUCP_TABSIZE);

  CUC_ListSetPropNum(pLST, CUCP_AUTOREFRESH, 1);

  CUC_ListAddItem(pLST, "286\niAPX", -1);
  CUC_ListAddItem(pLST, "386\tDX\tSX", -1);
  CUC_ListAddItem(pLST, "Pentium", -1);
  CUC_ListAddItem(pLST, "186", 0);
  CUC_ListAddItem(pLST, "486\tSX\tDX\tDX2", 3);
  CUC_ListAddItem(pLST, "8086", 0);
  CUC_ListAddItem(pLST, "8088", 0);
  CUC_ListAddItem(pLST, "8080", 0);

  CUC_ListSetPropPtr(pLST, CUCP_WDISP, stdscr);
  SetProp(pLST, 4, CUCP_VISIBLE);

  attron(SOULIGNE);
  mvaddstr(0, 20, "BibliothŠque CUC - Test du contr“le List");
  attroff(SOULIGNE);
  mvaddstr(1,0,"Utilisez Tab et les flŠches G&D pour s‚lectionner et modifier une propri‚t‚\n+ Ajoute des ‚l‚ments, - Ote l'‚l‚ment courant, E efface la liste,\n* Ajoute le dictionnaire, Q pour quitter, Espace s‚lectionne/d‚s‚lectionne");

  iActif = 0;
  CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
  for(;;)
  {
    int v;
    int c;
    
    v = CUC_ListGetPropNum(pLST, CUCP_LISTCOUNT); move(5,60);    printw("ListCount:  %5d", v);
    v = CUC_ListGetPropNum(pLST, CUCP_LISTINDEX); move(6,60);    printw("ListIndex:  %5d", v);
    v = CUC_ListGetPropNum(pLST, CUCP_LINE); move(7,60);         printw("Line:       %5d", v);
    v = CUC_ListGetPropNum(pLST, CUCP_COLUMN); move(8,60);       printw("Column:     %5d", v);
    v = CUC_ListGetPropNum(pLST, CUCP_STARTLINE); move(9,60);    printw("StartLine:  %5d", v);
    v = CUC_ListGetPropNum(pLST, CUCP_STARTCOLUMN); move(10,60); printw("StartColumn:%5d", v);
        
    c = getch2();
    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB || c==KEY_F(1))
    { 
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_LOSTFOCUS, 0);
      iActif = (iActif+(c==KEY_TAB?1:8))%9;
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
      continue;
    }
    
    if (c=='-')
    { CUC_ListRemoveItem(pLST, -1);
      continue;
    }
    
    if (c=='+')
    { CUC_ListAddItem(pLST, "Il ‚tait", -1);
      CUC_ListAddItem(pLST, "un petit", -1);
      CUC_ListAddItem(pLST, "navire qui", -1);
      CUC_ListAddItem(pLST, "n'avait jamais", -1);
      CUC_ListAddItem(pLST, "navigu‚,", -1);
      CUC_ListAddItem(pLST, "Oh‚, oh‚, matelot...", -1);
      continue;
    }
    
    if (c=='e' || c=='E')
    { CUC_ListClear(pLST);
      continue;
    }
    
    if (c=='*')
    { 
      char szBuffer[100];
      int  iNbLig = 0;
      FILE *f;

      CUC_ListSetPropNum(pLST, CUCP_AUTOREFRESH, 0);
      f = fopen("d.txt", "r");
      if (f!=NULL)
      {
        while (fgets(szBuffer, 100, f)!=NULL)
        { char *p;
		  p = szBuffer;
		  szBuffer[strlen(szBuffer)-1] = 0;
		  iNbLig++;
          if (CUC_ListAddItem(pLST, szBuffer, -1)<0)
            break;
        }
        fclose(f);
      }
      CUC_ListSetPropNum(pLST, CUCP_AUTOREFRESH, 1);
      continue;
    }

    if (c==' ')
    {
      if (CUC_ListGetPropNum(pLST, CUCP_LISTCOUNT)>0)
      {
		char szBuffer[1000];
		int v;
		
		v = CUC_ListGetPropNum(pLST, CUCP_LISTINDEX);
		CUC_ListGetPropStrInd(pLST, CUCP_LIST, v, szBuffer, 1000);
		if (szBuffer[0]=='*')
		  strdelnc(szBuffer, 1);
		else
		{ strinsnc(szBuffer, 1);
		  szBuffer[0] = '*';
		}
		CUC_ListSetPropStrInd(pLST, CUCP_LIST, v, szBuffer);
      }
      continue;
    }
    
    if (c=='4')
    { CUC_ListSetPropNum(pLST, CUCP_LINE, 4);
      continue;
    }

    if (c=='3')
    { CUC_ListSetPropNum(pLST, CUCP_COLUMN, 3);
      continue;
    }

    if (c=='h')
    { CUC_ListSetPropNum(pLST, CUCP_STARTLINE, CUC_ListGetPropNum(pLST, CUCP_STARTLINE)-1);
      continue;
    }
    if (c=='b')
    { CUC_ListSetPropNum(pLST, CUCP_STARTLINE, CUC_ListGetPropNum(pLST, CUCP_STARTLINE)+1);
      continue;
    }
    if (c=='<')
    { CUC_ListSetPropNum(pLST, CUCP_STARTCOLUMN, CUC_ListGetPropNum(pLST, CUCP_STARTCOLUMN)+1);
      continue;
    }
    if (c=='>')
    { CUC_ListSetPropNum(pLST, CUCP_STARTCOLUMN, CUC_ListGetPropNum(pLST, CUCP_STARTCOLUMN)-1);
      continue;
    }

    if (c=='?')
    { CUC_ListDoEvent(pLST, CUCE_DUMP, c);
      continue;
    }

    if (c==KEY_LEFT || c==KEY_RIGHT)
    { CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_KEY, c);
      v = CUC_HScrollBarGetPropNum(pHSB[iActif], CUCP_VALUE);
      move(iActif+4, 12);
      printw("%3d", v);


      switch(iActif)
      {
		case 0: CUC_ListSetPropNum(pLST, CUCP_TOP, v);		break;
		case 1: CUC_ListSetPropNum(pLST, CUCP_LEFT, v);		break;
		case 2: CUC_ListSetPropNum(pLST, CUCP_WIDTH, v);	break;
		case 3: CUC_ListSetPropNum(pLST, CUCP_HEIGHT, v);	break;
		case 4: CUC_ListSetPropNum(pLST, CUCP_VISIBLE, v);	break;
		case 5: CUC_ListSetPropNum(pLST, CUCP_ENABLED, v);	break;
		case 6: CUC_ListSetPropNum(pLST, CUCP_COLUMNS, v);	break;
		case 7: CUC_ListSetPropNum(pLST, CUCP_SORTED, v);	break;
		case 8: CUC_ListSetPropNum(pLST, CUCP_TABSIZE, v);	break;
      }
      continue;
    }
    
    CUC_ListDoEvent(pLST, CUCE_KEY, c);
  }

  CUC_ListDestruct(pLST);

  FinEcran();
  return 0;
}


int ListRaiseEvent(struct CUC_List *pLST, int iEvt, int iArg)
{
  /*
  char	szBuffer[1000];
  char	*p;

  CUC_ListGetPropStr(pLST, CUCP_TEXT, szBuffer, 1000);
  while (p=strchr(szBuffer, '\r')) *p = '.';
  while (p=strchr(szBuffer, '\n')) *p = '.';
  while (p=strchr(szBuffer, '\t')) *p = '.';
  move(7,60);
  printw("%-19.19s", szBuffer);
  */
  return 0;
}

