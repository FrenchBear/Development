// ttxt.c
// Bibliothäque CUC - Test du contrìle TextEditdit
// 

#include <stdio.h>
#include <curses.h>
#include <memory.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

char szTexteRef[] = "012345678901 0123456789 012345 01234567890123 0123 0123 01 0123 0123 0123 0123 0123 012 0123456 0123456 01 012345 01 012 012"
"012345678901 0123456789 012345 01234567890123 0123 0123 01 0123 0123 0123 0123 0123 012 0123456 0123456 01 012345 01 012 012"
"012345678901 0123456789 012345 01234567890123 0123 0123 01 0123 0123 0123 0123 0123 012 0123456 0123456 01 012345 01 012 012"
"012345678901 0123456789 012345 01234567890123 0123 0123 01 0123 0123 0123 0123 0123 012 0123456 0123456 01 012345 01 012 012"
"012345678901 0123456789 012345 01234567890123 0123 0123 01 0123 0123 0123 0123 0123 012 0123456 0123456 01 012345 01 012 012"
"012345678901 0123456789 012345 01234567890123 0123 0123 01 0123 0123 0123 0123 0123 012 0123456 0123456 01 012345 01 012 012";
 





int TextEditEvent(struct CUC_TextEdit *pTXT, int iEvt, int iArg)
{
  //aprintf("TextEditEvent", "iEvt:%d", iEvt);
  return 0;
}


int main()
{
  int	iActif;
  int	i;
  char	szTextEdit[1000];

  struct CUC_HScrollBar *pHSB[10];
  struct CUC_TextEdit	*pTXT;
  InitEcran();
  NoDelInterrupt();

  for (i=0 ; i<10 ; i++)
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
  CUC_HScrollBarSetPropNum(pHSB[0], CUCP_MIN, 14);
  CUC_HScrollBarSetPropNum(pHSB[0], CUCP_MAX, 23);
  CUC_HScrollBarSetPropNum(pHSB[0], CUCP_VALUE, 14);

  mvaddstr( 5,0,"Left");
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_MAX, 79);
  CUC_HScrollBarSetPropNum(pHSB[1], CUCP_VALUE, 8);

  mvaddstr( 6,0,"Width");
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_MAX, 80);
  CUC_HScrollBarSetPropNum(pHSB[2], CUCP_VALUE, 32);

  mvaddstr( 7,0,"Height");
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MIN, 1);
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_MAX, 10);
  CUC_HScrollBarSetPropNum(pHSB[3], CUCP_VALUE, 10);

  mvaddstr( 8,0,"Visible");
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[4], CUCP_VALUE, 1);

  mvaddstr(9,0,"MultiLine");
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[5], CUCP_VALUE, 1);

  mvaddstr(10,0,"SrollBars");
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_MAX, 3);
  CUC_HScrollBarSetPropNum(pHSB[6], CUCP_VALUE, 0);

  mvaddstr(11,0,"Alignment");
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_MAX, 2);
  CUC_HScrollBarSetPropNum(pHSB[7], CUCP_VALUE, 0);

  mvaddstr(12,0,"Border Style");
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_MAX, 2);
  CUC_HScrollBarSetPropNum(pHSB[8], CUCP_VALUE, 1);

  mvaddstr(13,0,"Autosize");
  CUC_HScrollBarSetPropNum(pHSB[9], CUCP_MIN, 0);
  CUC_HScrollBarSetPropNum(pHSB[9], CUCP_MAX, 1);
  CUC_HScrollBarSetPropNum(pHSB[9], CUCP_VALUE, 0);

  
#define SetProp(ptr, iBarre, prop)  {int v=CUC_HScrollBarGetPropNum(pHSB[iBarre], CUCP_VALUE); CUC_TextEditSetPropNum(ptr, prop, v); move(iBarre+4,12); printw("%3d", v);}
  pTXT = CUC_TextEditCreate(stdscr, TextEditEvent);  
  SetProp(pTXT, 0, CUCP_TOP);
  SetProp(pTXT, 1, CUCP_LEFT);
  SetProp(pTXT, 2, CUCP_WIDTH);
  SetProp(pTXT, 3, CUCP_HEIGHT);
  SetProp(pTXT, 4, CUCP_VISIBLE);
  SetProp(pTXT, 5, CUCP_MULTILINE);
  SetProp(pTXT, 6, CUCP_SCROLLBARS);
  SetProp(pTXT, 7, CUCP_ALIGNMENT);
  SetProp(pTXT, 8, CUCP_BORDERSTYLE);
  SetProp(pTXT, 9, CUCP_AUTOSIZE);

  CUC_TextEditSetPropNum(pTXT, CUCP_STDATTRIB, BRILLANT);
  //CUC_TextEditSetPropNum(pTXT, CUCP_EOFCHAR, ' ');

  strcpy(szTextEdit, szTexteRef);
  //CUC_TextEditSetPropStr(pTXT, CUCP_TEXT, szTextEdit);
  //CUC_TextEditSetPropNum(pTXT, CUCP_SELSTART, 0);
  //CUC_TextEditSetPropNum(pTXT, CUCP_SELLENGTH, 99);
  //CUC_TextEditSetPropNum(pTXT, CUCP_MAXLENGTH, 10);
  //CUC_TextEditSetPropStr(pTXT, CUCP_SELTEXT, "toto");

  if (strcmp(szTextEdit, szTexteRef))
    aprintf("PROBLEME !", "Le buffer de l'application|a ÇtÇ modifiÇ !");


  mvaddstr(0,0,"Bibliothäque CUC - Test du contrìle TextEdit");
  mvaddstr(2,0,"Utilisez les fläches pour sÇlectionner et modifier une propriÇtÇ\nQ pour quitter.");

  iActif = 0;
  CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
  iActif = 11;

  // for(i=0;i<10;i++) mvaddstr( 14+i,28,"###############################");

  for(;;)
  {
    int v;
    int c;
    
    c = getch2();
	if (c==KEY_F(10))
	  c = ALT(getch2());
    if (c==4) break;


    if (c==KEY_F(2) || c==KEY_F(1))
    {
      if(iActif==10)
		CUC_TextEditDoEvent(pTXT, CUCE_LOSTFOCUS, 0);
      else if(iActif<10)
		CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_LOSTFOCUS, 0);
      iActif = (iActif+(c==KEY_F(2)?1:10))%11;
      if(iActif<10)
		CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_GOTFOCUS, 0);
      else
	  {
		CUC_TextEditDoEvent(pTXT, CUCE_GOTFOCUS, 0);
		//CUC_TextEditSetPropNum(pTXT, CUCP_SELSTART, 0);
		//CUC_TextEditSetPropNum(pTXT, CUCP_SELLENGTH, 99);
		continue;
	  }
    }
    if (c==KEY_F(5))
	{
	  char szBuff[1000];
	  CUC_TextEditGetPropStr(pTXT, CUCP_TEXT, szBuff, 100);
	  aprintf("F5", "txt = %s",szBuff);
	  continue;
	}
    if (c==KEY_F(6))
	{
	  char szBuff[100];
	  CUC_TextEditDoEvent(pTXT, CUCE_DUMP, 0);
	  continue;
	}

    if(iActif<10)
    {
      CUC_HScrollBarDoEvent(pHSB[iActif], CUCE_KEY, c);
      v = CUC_HScrollBarGetPropNum(pHSB[iActif], CUCP_VALUE);
      move(iActif+4, 12);
      printw("%3d", v);
    }
    else
      CUC_TextEditDoEvent(pTXT, CUCE_KEY, c);

    switch(iActif)
    {
      case 0: CUC_TextEditSetPropNum(pTXT, CUCP_TOP, v);		break;
      case 1: CUC_TextEditSetPropNum(pTXT, CUCP_LEFT, v);		break;
      case 2: CUC_TextEditSetPropNum(pTXT, CUCP_WIDTH, v);		break;
      case 3: CUC_TextEditSetPropNum(pTXT, CUCP_HEIGHT, v);	break;
      case 4: CUC_TextEditSetPropNum(pTXT, CUCP_VISIBLE, v);	break;
      case 5: CUC_TextEditSetPropNum(pTXT, CUCP_MULTILINE, v);	break;
      case 6: CUC_TextEditSetPropNum(pTXT, CUCP_SCROLLBARS, v);	break;
      case 7: CUC_TextEditSetPropNum(pTXT, CUCP_ALIGNMENT, v);	break;
      case 8: CUC_TextEditSetPropNum(pTXT, CUCP_BORDERSTYLE, v);	break;
      case 9: CUC_TextEditSetPropNum(pTXT, CUCP_AUTOSIZE, v);	break;
    }
  } /* for */

  memchr(szTextEdit, 0, strlen(szTexteRef));
  CUC_TextEditGetPropStr(pTXT, CUCP_TEXT, szTextEdit, 2);
  if (szTextEdit[1] || !szTextEdit[0])
    aprintf("PROBLEME !", "Mauvais retour de getPropStr");

  CUC_TextEditGetPropStr(pTXT, CUCP_TEXT, szTextEdit, 1000);
  
  CUC_TextEditDestruct(pTXT);

  FinEcran();
  return 0;
}

