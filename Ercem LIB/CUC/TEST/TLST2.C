// tlst.c
// BibliothŠque CUC - Test du contr“le List
// P.VIOLENT Juin 94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.ref>

#include "cuc.h"
#include "cucpriv.h"

int ListRaiseEvent(struct CUC_List *, int , int );

int main()
{
  int	iActif;
  int	i;

  struct CUC_List	*pLST;
  InitEcran();

  pLST = CUC_ListCreate(stdscr, NULL);

  CUC_ListSetPropNum(pLST, CUCP_TOP, 0);
  CUC_ListSetPropNum(pLST, CUCP_LEFT, 0);
  CUC_ListSetPropNum(pLST, CUCP_HEIGHT, 5);
  CUC_ListSetPropNum(pLST, CUCP_WIDTH, 30);
  CUC_ListSetPropNum(pLST, CUCP_ENABLED, 1);
  CUC_ListSetPropNum(pLST, CUCP_VISIBLE, 1);
  // CUC_ListSetPropNum(pLST, CUCP_, );
  CUC_ListAddItem(pLST, "286\niAPX", -1);
  CUC_ListAddItem(pLST, "386\tDX\tSX", -1);
  CUC_ListAddItem(pLST, "Pentium", -1);
  CUC_ListAddItem(pLST, "186", 0);
  CUC_ListAddItem(pLST, "486\tSX\tDX\tDX2", 3);
  CUC_ListAddItem(pLST, "8086", 0);
  CUC_ListAddItem(pLST, "8088", 0);
  CUC_ListAddItem(pLST, "8080", 0);

  iActif = 0;
  for(;;)
  {
    int v;
    int c;
    
    c = getch2();
    if (c=='q' || c=='Q') break;

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
