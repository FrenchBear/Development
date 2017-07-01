// ttxt2.c
// BibliothŠque CUC - Test du contr“le TextEdit2
// 

#include <stdio.h>
#include <curses.h>
#include <memory.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"


int main()
{
  struct CUC_TextEdit   *pTXT;
  char  szTextEdit[1000];
  int i;
  
  InitEcran();
  NoDelInterrupt();
  
  for (i=0 ; i<100 ; i++)
  {
	int c;
	
	c = getch2();
	printf("<%d>\n", c);
  }
  exit(1);
  
  pTXT = CUC_TextEditCreate(stdscr, NULL);
  CUC_TextEditDoEvent(pTXT, CUCE_GOTFOCUS, 0);
  
  CUC_TextEditSetPropNum(pTXT, CUCP_TOP, 8);
  CUC_TextEditSetPropNum(pTXT, CUCP_LEFT, 4);
  CUC_TextEditSetPropNum(pTXT, CUCP_WIDTH, 20);
  CUC_TextEditSetPropNum(pTXT, CUCP_HEIGHT, 8);
  CUC_TextEditSetPropNum(pTXT, CUCP_BORDERSTYLE, 1);
  CUC_TextEditSetPropNum(pTXT, CUCP_MULTILINE, 1);
  CUC_TextEditSetPropNum(pTXT, CUCP_SCROLLBARS, 3);

  CUC_TextEditSetPropStr(pTXT, CUCP_TEXT, "Il ‚tait\n\tun petit\nnavire bip !\nDerniŠre ligne");
//  CUC_TextEditSetPropStr(pTXT, CUCP_TEXT, "Il ‚tait un petit navire qui n'avait jamais navigu‚\nOh‚ Oh‚ matelot\nOn tira au sort pour savoir qui serait mang‚...\n");
//  CUC_TextEditSetPropNum(pTXT, CUCP_SELSTART, 3);
//  CUC_TextEditSetPropNum(pTXT, CUCP_SELLENGTH, 99);
//  CUC_TextEditSetPropNum(pTXT, CUCP_MAXLENGTH, 8);

//  Special(pTXT);
//  exit(1);
  
  CUC_TextEditSetPropNum(pTXT, CUCP_VISIBLE, 1);
  CUC_TextEditSetPropNum(pTXT, CUCP_ENABLED, 1);
  CUC_TextEditDoEvent(pTXT, CUCE_GOTFOCUS);
  
  //AfficheEtat(pTXT);
  CUC_TextEditDisplayCursor(pTXT);

  for(;;)
  {
	int c;
	
	c = getch2();
	if (c==KEY_F(10))
	  c = ALT(getch2());

	if (c==4) break;

	if (c==KEY_F(5))
	{
	  int iSB = CUC_TextEditGetPropNum(pTXT, CUCP_SCROLLBARS);
	  CUC_TextEditSetPropNum(pTXT, CUCP_SCROLLBARS, (1+iSB)%4);
	}
	
	if (c=='?')
	  CUC_TextEditDoEvent(pTXT, CUCE_DUMP);
	else
	  CUC_TextEditDoEvent(pTXT, CUCE_KEY, c);
  }
  
  CUC_TextEditGetPropStr(pTXT, CUCP_TEXT, szTextEdit, sizeof(szTextEdit));
  CUC_TextEditDestruct(pTXT);

  FinEcran();
  printf("<%s>\n", szTextEdit);
  return 0;
}
