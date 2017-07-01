// ted.c
// BibliothŠque CUC - Test avec text edit et combobox et des contr“les FileListBox et DirListBox
// R.C 30 juin 94

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

int FileListBoxRaiseEvent(struct CUC_FileListBox *, int , int );
void Ouvrir(struct CUC_FileListBox *pFLB, struct CUC_TextEdit *pTXT);

char szTextEdit[1000]; 
char buffer[512];
char Total[1000];

int main()
{
  int	iActif;
  int   jMin=0;
  struct CUC_FileListBox *pFLB;
  struct CUC_DirListBox *pDLB;
  struct CUC_ComboBox *pCOB;
  struct CUC_TextEdit *pTXT;
  char szTexteRef[] = "ligne 1\nligne 2\nligne 3\nligne 4\nligne 5\nligne 6\nligne 7";

  InitEcran();
  NoDelInterrupt();

//control textedit
  
pTXT = CUC_TextEditCreate(stdscr, NULL);  
CUC_TextEditSetPropNum(pTXT,CUCP_TOP,13);
CUC_TextEditSetPropNum(pTXT,CUCP_LEFT,1);
CUC_TextEditSetPropNum(pTXT,CUCP_WIDTH,70);
CUC_TextEditSetPropNum(pTXT,CUCP_HEIGHT,11);
CUC_TextEditSetPropNum(pTXT,CUCP_VISIBLE,1);
CUC_TextEditSetPropNum(pTXT,CUCP_MULTILINE,1);
CUC_TextEditSetPropNum(pTXT,CUCP_SCROLLBARS,1);
CUC_TextEditSetPropNum(pTXT,CUCP_ALIGNMENT,1);
CUC_TextEditSetPropNum(pTXT,CUCP_BORDERSTYLE,2);
CUC_TextEditSetPropNum(pTXT,CUCP_AUTOSIZE,0);

  strcpy(szTextEdit, szTexteRef);
  CUC_TextEditSetPropStr(pTXT, CUCP_TEXT, szTextEdit);

//controle fichier
  
  pFLB = CUC_FileListBoxCreate(stdscr, NULL);
  CUC_FileListBoxSetPropNum(pFLB,CUCP_TOP,1);
  CUC_FileListBoxSetPropNum(pFLB,CUCP_LEFT,1);
  CUC_FileListBoxSetPropNum(pFLB,CUCP_WIDTH,30);
  CUC_FileListBoxSetPropNum(pFLB,CUCP_HEIGHT,6);
  CUC_FileListBoxSetPropNum(pFLB,CUCP_VISIBLE,1);
  CUC_FileListBoxSetPropNum(pFLB,CUCP_ENABLED,1);
  CUC_FileListBoxSetPropNum(pFLB,CUCP_COLUMNS,0);
  CUC_FileListBoxSetPropNum(pFLB,CUCP_TABSIZE,1);
  CUC_FileListBoxSetPropStr(pFLB,CUCP_PATTERN,"*");
  
  //controle repertoire

  pDLB = CUC_DirListBoxCreate(stdscr, NULL);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_TOP,1);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_LEFT,50);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_WIDTH,20);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_HEIGHT,12);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_VISIBLE,1);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_ENABLED,1);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_TABSIZE,1);
  CUC_DirListBoxSetPropNum(pDLB, CUCP_COLUMNS,0);

  //CUC_DirListBoxSetPropStr(pDLB,CUCP_PATH,"/usr/sce/cuc");
  //CUC_DirListBoxSetPropStr(pDLB,CUCP_DRIVE,"/");

  CUC_DirListBoxSetPropStr(pDLB,CUCP_PATH,"/usr/");
  CUC_DirListBoxSetPropStr(pDLB,CUCP_DRIVE,"");

  CUC_FileListBoxSetPropStr(pFLB,CUCP_PATH,"/usr/");
  CUC_FileListBoxSetPropStr(pFLB,CUCP_DRIVE,"");
  
  //controle combobox
  
  pCOB = CUC_ComboBoxCreate(stdscr, NULL);
  CUC_ComboBoxSetPropNum(pCOB, CUCP_TOP,8);
  CUC_ComboBoxSetPropNum(pCOB, CUCP_LEFT,1);
  CUC_ComboBoxSetPropNum(pCOB, CUCP_WIDTH,30);
  CUC_ComboBoxSetPropNum(pCOB, CUCP_HEIGHT,15);
  CUC_ComboBoxSetPropNum(pCOB, CUCP_VISIBLE,1);
  CUC_ComboBoxSetPropNum(pCOB, CUCP_ENABLED,1);
  CUC_ComboBoxSetPropNum(pCOB, CUCP_STYLE,0);
  CUC_ComboBoxSetPropNum(pCOB, CUCP_TABSIZE,8);

  CUC_ComboBoxAddItem(pCOB, "*", -1);
  CUC_ComboBoxAddItem(pCOB, "*.c", -1);
  CUC_ComboBoxAddItem(pCOB, "*.exe", -1);
  CUC_ComboBoxAddItem(pCOB, "*.coucou", 0);
  CUC_ComboBoxAddItem(pCOB, "*.4gl", 3);
  CUC_ComboBoxAddItem(pCOB, "*.jnl", 0);
  CUC_ComboBoxAddItem(pCOB, "*.cpp", 0);
  CUC_ComboBoxAddItem(pCOB, "t*.c", 0);

  attron(SOULIGNE);
  mvaddstr(0, 20, "BibliothŠque CUC - Test du contr“le FileListBox");
  attroff(SOULIGNE);

  iActif = 0;
  for(;;)
  {
    int a=0;
    int c;

    c = getch2();
    if (c==KEY_CTRL_D) break;
	
	if (c==KEY_TAB || c==KEY_F(1))
    { 
	  if(iActif==0)
		CUC_FileListBoxDoEvent(pFLB,CUCE_LOSTFOCUS,0);
	  else if(iActif==1) 
		CUC_DirListBoxDoEvent(pDLB,CUCE_LOSTFOCUS,0);
	  else if(iActif==2)
		CUC_ComboBoxDoEvent(pCOB,CUCE_LOSTFOCUS,0);
      else if(iActif==3)
		 CUC_TextEditDoEvent(pTXT,CUCE_LOSTFOCUS,0);
      iActif = (iActif+(c==KEY_TAB?1:3))%4;
	  if(iActif==0)
		CUC_FileListBoxDoEvent(pFLB,CUCE_GOTFOCUS,0);
	  else if(iActif==1)
		CUC_DirListBoxDoEvent(pDLB,CUCE_GOTFOCUS,0);
	  else if(iActif==2)
		CUC_ComboBoxDoEvent(pCOB,CUCE_GOTFOCUS,0);
	  else if(iActif==3)	 
		 CUC_TextEditDoEvent(pTXT,CUCE_GOTFOCUS,0);
	  continue;
    }
    
    if (iActif!= 3 && c=='\n')
    { 
	  if(iActif==4)
			if(CUC_DirListBoxGetPropNum(pDLB,CUCP_VISIBLE))
			{
			  CUC_DirListBoxSetPropNum(pDLB,CUCP_VISIBLE,0);
			  CUC_FileListBoxSetPropNum(pFLB,CUCP_VISIBLE,0);
			  CUC_ComboBoxSetPropNum(pCOB,CUCP_VISIBLE,0);
	          CUC_TextEditSetPropNum(pTXT,CUCP_VISIBLE,1); 
			}
			else 
			{  
			  CUC_DirListBoxSetPropNum(pDLB,CUCP_VISIBLE,1);
			  CUC_FileListBoxSetPropNum(pFLB,CUCP_VISIBLE,1);
			  CUC_ComboBoxSetPropNum(pCOB,CUCP_VISIBLE,1);
	          CUC_TextEditSetPropNum(pTXT,CUCP_VISIBLE,0); 
			}
	  if(iActif==1)
	  {
		CUC_DirListBoxGetPropStr(pDLB, CUCP_PATH, Total, LGPATH);
		aprintf("test dflb","dirname=%s",Total);
		CUC_DirListBoxSetPropStr(pDLB,CUCP_PATH,Total);
		CUC_FileListBoxSetPropStr(pFLB,CUCP_PATH,Total);
	  }
	  
	  if(iActif==0)
		if(CUC_FileListBoxGetPropStr(pFLB,CUCP_FILENAME,buffer,LGPATH)!=NULL)
		  Ouvrir(pFLB,pTXT);
	  if(iActif==2)
	   { 
		 CUC_ComboBoxGetPropStr(pCOB,CUCP_TEXT,buffer,LGPATH);
		 aprintf("PATTERN","%s",buffer);
		 CUC_FileListBoxSetPropStr(pFLB,CUCP_PATTERN,buffer);
	   }
	}
	//else
	{
	  if(iActif==1) CUC_DirListBoxDoEvent(pDLB, CUCE_KEY, c);
	  if(iActif==0) CUC_FileListBoxDoEvent(pFLB, CUCE_KEY, c);
	  if(iActif==2) CUC_ComboBoxDoEvent(pCOB, CUCE_KEY, c);
      if(iActif==3)	CUC_TextEditDoEvent(pTXT,CUCE_KEY,c);
	
	}
	
  }

  CUC_FileListBoxDestruct(pFLB);
  CUC_DirListBoxDestruct(pDLB);
  CUC_ComboBoxDestruct(pCOB);
  CUC_TextEditDestruct(pTXT); 
  FinEcran();
  return 0;
}


char text[10000];
char szbuff2[2049];

void Ouvrir(struct CUC_FileListBox *pFLB, struct CUC_TextEdit *pTXT)
{
  char szNomFic[LGPATH], szbuff[LGPATH];
  FILE *fic;
  int lFic;
   
  szNomFic[0] = 0;
  if(CUC_FileListBoxGetPropStr(pFLB,CUCP_DRIVE,szbuff,LGPATH)!=NULL)
	strcpy(szNomFic, szbuff);
  lFic = szNomFic!=NULL?(int)strlen(szNomFic):0;
  if(lFic && szNomFic[lFic-1] != '/') strcat(szNomFic,"/");

  if(CUC_FileListBoxGetPropStr(pFLB,CUCP_PATH,szbuff,LGPATH)!=NULL)
	strcat(szNomFic, szbuff);
  lFic = szNomFic!=NULL?(int)strlen(szNomFic):0;
  if(lFic && szNomFic[lFic-1] != '/') strcat(szNomFic,"/");

  if(CUC_FileListBoxGetPropStr(pFLB,CUCP_FILENAME,szbuff,LGPATH)!=NULL)
	strcat(szNomFic, szbuff);

  fic = fopen(szNomFic,"r");
  text[0] = 0;
  if(fic!=NULL)
  {
	int nbCar=0;
	int n;
	while( (n = fread(szbuff2,sizeof(char),2000,fic)))
	{
	  szbuff2[n]=0;
	  strcat(text, szbuff2);
	  nbCar += n;
	  if(nbCar>=98000) break;
	}
	text[nbCar] = 0;
	fclose(fic);

	CUC_TextEditSetPropStr(pTXT, CUCP_TEXT, text);
  }
  else aprintf("Ted","Fichier %s non trouv‚!",szNomFic);
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
