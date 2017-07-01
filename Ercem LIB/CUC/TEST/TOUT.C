// tlst.c
// Bibliothäque CUC - Test du contrìle Outline
// P.VIOLENT DÇcembre 94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

int OutlineRaiseEvent(struct CUC_Outline *, int , int );

int main()
{
  int	iActif;
  int	i;

  struct CUC_HScrollBar *pHSB[8];
  struct CUC_Outline	*pOUT;
  InitEcran();

  for (i=0 ; i<8 ; i++)
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

  mvaddstr(10,0,"TabSize");
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MAX, 20);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_VALUE, 8);

  mvaddstr(11,0,"Style");
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MAX, 3);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_VALUE, 3);

#define SetProp(ptr, iBarre, prop)  {int v=CUC_HScrollBarGetPropNum(pHSB[iBarre], CUCP_VALUE); CUC_OutlineSetPropNum(ptr, prop, v); move(iBarre+4,12); printw("%3d", v); refresh();}
  pOUT = CUC_OutlineCreate(NULL, OutlineRaiseEvent);

  SetProp(pOUT, 0, CUCP_TOP);
  SetProp(pOUT, 1, CUCP_LEFT);
  SetProp(pOUT, 2, CUCP_WIDTH);
  SetProp(pOUT, 3, CUCP_HEIGHT);
  SetProp(pOUT, 5, CUCP_ENABLED);
  SetProp(pOUT, 6, CUCP_TABSIZE);
  SetProp(pOUT, 7, CUCP_STYLE);

  CUC_OutlineSetPropNum(pOUT, CUCP_AUTOREFRESH, 1);
  CUC_OutlineSetPropNum(pOUT, CUCP_SEPARATOR, ':');

  CUC_OutlineAddItemIndent(pOUT, "Ercem", -1, 0);
  CUC_OutlineAddItemIndent(pOUT, "Grenoble", -1, 1);
  CUC_OutlineAddItemIndent(pOUT, "DT", -1, 2);
  CUC_OutlineAddItemIndent(pOUT, "JPVP", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "Nadine", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "DI", -1, 2);
  CUC_OutlineAddItemIndent(pOUT, "Pierre", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "Frank", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "Massy", -1, 1);
  CUC_OutlineAddItemIndent(pOUT, "Massy 1", -1, 2);
  CUC_OutlineAddItemIndent(pOUT, "UOP 4", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "UOP 5", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "Massy 2", -1, 2);
  CUC_OutlineAddItemIndent(pOUT, "DOP", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "UOP 6", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "Massy 3", -1, 2);
  CUC_OutlineAddItemIndent(pOUT, "DG", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "UD", -1, 3);
  CUC_OutlineAddItemIndent(pOUT, "Aix", -1, 1);
  CUC_OutlineAddItemIndent(pOUT, "UOP 7", -1, 2);

  CUC_OutlineSetPropPtr(pOUT, CUCP_WDISP, stdscr);
  SetProp(pOUT, 4, CUCP_VISIBLE);

  attron(SOULIGNE);
  mvaddstr(0, 20, "Bibliothäque CUC - Test du contrìle Outline");
  attroff(SOULIGNE);
  mvaddstr(1,0,"Utilisez Tab et les fläches G&D pour sÇlectionner et modifier une propriÇtÇ\n+ Ouvre, - Ferme, E efface la liste, h et b modifient STARTLINE\nQ pour quitter, Espace sÇlectionne/dÇsÇlectionne, ? dump");

  iActif = 0;
  CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
  for(;;)
  {
    int v;
    int c;
	char szBuffer[80];
    
    v = CUC_OutlineGetPropNum(pOUT, CUCP_LISTCOUNT); move(5,60);    printw("ListCount:  %5d", v);
    v = CUC_OutlineGetPropNum(pOUT, CUCP_LISTINDEX); move(6,60);    printw("ListIndex:  %5d", v);
    v = CUC_OutlineGetPropNum(pOUT, CUCP_LINE); move(7,60);         printw("Line:       %5d", v);
    v = CUC_OutlineGetPropNum(pOUT, CUCP_STARTLINE); move(8,60);    printw("StartLine:  %5d", v);
    v = CUC_OutlineGetPropNum(pOUT, CUCP_INDENT); move(9,60);       printw("Indent:     %5d", v);
    v = CUC_OutlineGetPropNum(pOUT, CUCP_EXPAND); move(10,60);      printw("Expand:     %5d", v);
    v = CUC_OutlineGetPropNum(pOUT, CUCP_HASSUBITEMS); move(11,60); printw("HasSubItems:%5d", v);
    CUC_OutlineGetPropStr(pOUT, CUCP_FULLPATH, szBuffer, sizeof(szBuffer)); move(12,0);    printw("FullPath: %-70.70s", szBuffer);
        
    c = getch2();
    if (c=='q' || c=='Q') break;

    if (c==KEY_TAB || c==KEY_F(1))
    { 
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_LOSTFOCUS, 0);
      iActif = (iActif+(c==KEY_TAB?1:7))%8;
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
      continue;
    }
    
    if (c=='e' || c=='E')
    { CUC_OutlineClear(pOUT);
      continue;
    }

	if ('0'==c)
	{ CUC_OutlineSetPropNum(pOUT, CUCP_LISTINDEX, 0);
	  continue;
	}
    
    if (c=='*')
    { 
      char szBuffer[100];
      int  iNbLig = 0;
      FILE *f;

      CUC_OutlineSetPropNum(pOUT, CUCP_AUTOREFRESH, 0);
      f = fopen("d.txt", "r");
      if (f!=NULL)
      {
        while (fgets(szBuffer, 100, f)!=NULL)
        { char *p;
		  p = szBuffer;
		  szBuffer[strlen(szBuffer)-1] = 0;
		  iNbLig++;
          if (CUC_OutlineAddItem(pOUT, szBuffer, -1)<0)
            break;
        }
        fclose(f);
      }
      CUC_OutlineSetPropNum(pOUT, CUCP_AUTOREFRESH, 1);
      continue;
    }

    if (c==' ')
    {
      if (CUC_OutlineGetPropNum(pOUT, CUCP_LISTCOUNT)>0)
      {
		char szBuffer[1000];
		int v;
		
		v = CUC_OutlineGetPropNum(pOUT, CUCP_LISTINDEX);
		CUC_OutlineGetPropStrInd(pOUT, CUCP_LIST, v, szBuffer, 1000);
		if (szBuffer[0]=='*')
		  strdelnc(szBuffer, 1);
		else
		{ strinsnc(szBuffer, 1);
		  szBuffer[0] = '*';
		}
		CUC_OutlineSetPropStrInd(pOUT, CUCP_LIST, v, szBuffer);
      }
      continue;
    }
    
    if (c=='h')
    { CUC_OutlineSetPropNum(pOUT, CUCP_STARTLINE, CUC_OutlineGetPropNum(pOUT, CUCP_STARTLINE)-1);
      continue;
    }
    if (c=='b')
    { CUC_OutlineSetPropNum(pOUT, CUCP_STARTLINE, CUC_OutlineGetPropNum(pOUT, CUCP_STARTLINE)+1);
      continue;
    }

    if (c=='?')
    { CUC_OutlineDoEvent(pOUT, CUCE_DUMP, c);
      continue;
    }

    if (c==KEY_LEFT || c==KEY_RIGHT)
    { CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_KEY, c);
      v = CUC_HScrollBarGetPropNum(pHSB[iActif], CUCP_VALUE);
      move(iActif+4, 12);
      printw("%3d", v);


      switch(iActif)
      {
		case 0: CUC_OutlineSetPropNum(pOUT, CUCP_TOP, v);		break;
		case 1: CUC_OutlineSetPropNum(pOUT, CUCP_LEFT, v);		break;
		case 2: CUC_OutlineSetPropNum(pOUT, CUCP_WIDTH, v);		break;
		case 3: CUC_OutlineSetPropNum(pOUT, CUCP_HEIGHT, v);	break;
		case 4: CUC_OutlineSetPropNum(pOUT, CUCP_VISIBLE, v);	break;
		case 5: CUC_OutlineSetPropNum(pOUT, CUCP_ENABLED, v);	break;
		case 6: CUC_OutlineSetPropNum(pOUT, CUCP_TABSIZE, v);	break;
		case 7: CUC_OutlineSetPropNum(pOUT, CUCP_STYLE, v);		break;
      }
      continue;
    }
    
    CUC_OutlineDoEvent(pOUT, CUCE_KEY, c);
  }

  CUC_OutlineDestruct(pOUT);

  FinEcran();
  return 0;
}


int OutlineRaiseEvent(struct CUC_Outline *pOUT, int iEvt, int iArg)
{
  /*
  char	szBuffer[1000];
  char	*p;

  CUC_OutlineGetPropStr(pOUT, CUCP_TEXT, szBuffer, 1000);
  while (p=strchr(szBuffer, '\r')) *p = '.';
  while (p=strchr(szBuffer, '\n')) *p = '.';
  while (p=strchr(szBuffer, '\t')) *p = '.';
  move(7,60);
  printw("%-19.19s", szBuffer);
  */
  return 0;
}

