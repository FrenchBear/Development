// fb.cpp
// FormBuilder, bas‚ sur la bibliothŠque CUC
// PV 9/6/94
// 10/12/94	Ajout de quelques contrôles

#include <stdlib.h>
// #include <signal.h>

#include "cstring.h"

#include "cucpp.h"

// Tableau des contr“les en m‚moire
#define		MAXCTL 100	// Nb maximum de contr“les
int			iNbCtl;     // Nb de contr“les cr‚‚s
int			iCtlActif;  // No du contr“le courant
struct tagtCtl
{
  CUCControl	*ctl;	// Le contr“le
  int			iType;	// Le type du contr“le
  CString		sNom;	// Nom du contr“le
} tCtl[MAXCTL];			// Tableau des contr“les

CUCWindow *Feuille;		// Feuille d'affichage des contr“les
WINDOW *wForm;			// Fenˆtre "curses" de la feuille

CUCList *plstProp;		// Liste des propri‚t‚s

int iResizeMode = 0;	// Par d‚faut en mode d‚placement
int iTestMode = 0;		// 1 en mode simulation
char *szMessage;		// Affich‚ à gauche dans la barre d'‚tat


// D‚finition des propri‚t‚s support‚es par les contr“le, et leur type
#define MAXTYPECTL		13		// Nombre de classes de contr“le trait‚s

#define NAME			200		// Pseudo-propri‚t‚ "priv‚e"

struct
{
  int	iProp;					// No de la propri‚t‚ ou de la pseudo-propri‚t‚
  char	cType;					// *: pseudo-propri‚t‚, N:num‚rique, A:alphanum‚rique, C:caractŠre(int)
} tProp[MAXTYPECTL][30] =
{
// Type 0: rien...
  {
	{ -1, 0 }
  },
  
// HScrollBar
  { 
	{ NAME,				'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_MIN,			'N' },
	{ CUCP_MAX,			'N' },
	{ CUCP_VALUE,		'N' },
	{ CUCP_CSIZE,		'N' },
	{ CUCP_SMALLCHANGE,	'N' },
	{ CUCP_LARGECHANGE,	'N' },
	{ -1, 0 }
  },

// VScrollBar
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_MIN,			'N' },
	{ CUCP_MAX,			'N' },
	{ CUCP_VALUE,		'N' },
	{ CUCP_CSIZE,		'N' },
	{ CUCP_SMALLCHANGE,	'N' },
	{ CUCP_LARGECHANGE,	'N' },
	{ -1, 0 }
  },

// List
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_LISTCOUNT,	'N' },
	{ CUCP_LISTINDEX,	'N' },
	{ CUCP_COLUMNS,		'N' },
	{ CUCP_SORTED,		'N' },
	{ CUCP_TABSIZE,		'N' },
	{ CUCP_AUTOREFRESH,	'N' },
	{ CUCP_TEXT,		'A' },
	{ -1, 0 }
  },

// CheckBox
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_VALUE,		'N' },
	{ CUCP_CAPTION,		'A' },
	{ CUCP_TRISTATE,	'N' },
	{ CUCP_ACCELERATOR,	'C' },
	{ -1, 0 }
  },

// OptionButton
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_VALUE,		'N' },
	{ CUCP_CAPTION,		'A' },
	{ CUCP_ACCELERATOR,	'C' },
	{ -1, 0 }
  },

// Label
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_CAPTION,		'A' },
	{ CUCP_ALIGNMENT,	'N' },
	{ CUCP_AUTOSIZE,	'N' },
	{ CUCP_BORDERSTYLE,	'N' },
	{ CUCP_ACCELERATOR,	'C' },
	{ -1, 0 }
  },

// TextEdit
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_TEXT,		'A' },
	{ CUCP_SELSTART,	'N' },
	{ CUCP_SELLENGTH,	'N' },
	{ CUCP_SELTEXT,		'A' },
	{ CUCP_TABSIZE,		'N' },
	{ CUCP_MULTILINE,	'N' },
	{ CUCP_SCROLLBARS,	'N' },
	{ CUCP_MAXLENGTH,	'N' },
	{ CUCP_INSMODE,		'N' },
	{ -1, 0 }
  },

// Frame
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_BORDERSTYLE,	'N' },
	{ CUCP_CAPTION,		'A' },
	{ CUCP_ACCELERATOR,	'C' },
	{ -1, 0 }
  },

// CommandButton
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_VALUE,		'N' },
	{ CUCP_CAPTION,		'A' },
	{ CUCP_BORDERSTYLE,	'N' },
	{ CUCP_DEFAULT,		'N' },
	{ CUCP_CANCEL,		'N' },
	{ CUCP_VALUE,		'N' },
	{ CUCP_ACCELERATOR,	'C' },
	{ -1, 0 }
  },

// ComboBox
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_STYLE,		'N' },
	{ CUCP_LISTCOUNT,	'N' },
	{ CUCP_LISTINDEX,	'N' },
	{ CUCP_TABSIZE,		'N' },
	{ CUCP_TEXT,		'A' },
	{ -1, 0 }
  },
  
// File List Box
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_LISTCOUNT,	'N' },
	{ CUCP_LISTINDEX,	'N' },
	{ CUCP_AUTOREFRESH,	'N' },
	{ CUCP_TEXT,		'A' },
	{ -1, 0 }
  },

// Dir List Box
  {  
	{ NAME,     		'*' },
	{ CUCP_TYPE,		'A' },
	{ CUCP_TOP,			'N' },
	{ CUCP_LEFT,		'N' },
	{ CUCP_HEIGHT,		'N' },
	{ CUCP_WIDTH,		'N' },
	{ CUCP_VISIBLE,		'N' },
	{ CUCP_ENABLED,		'N' },
	{ CUCP_FOCUS,		'N' },
	{ CUCP_TAG,			'A' },
	{ CUCP_TABSTOP,		'N' },
	{ CUCP_LISTCOUNT,	'N' },
	{ CUCP_LISTINDEX,	'N' },
	{ CUCP_AUTOREFRESH,	'N' },
	{ CUCP_TEXT,		'A' },
	{ -1, 0 }
  },

};



// Routines utilitaires d'affichage

// Affiche la barre d'‚tat au bas de l'‚cran
void AfficheStatus()
{
  attron(INVERSE);
  move(LINES-1, 0);
  printw("%-59s|%-19s", szMessage, 
    iResizeMode ? "Dimensionnement":"D‚placement    ");
  attroff(INVERSE);
}

// Efface les coins brillants en r‚affichant le contr“le
void Deselectionne(CUCControl *c)
{
  c->LostFocus();
  c->Refresh();
}

// Affiche le contr“le avec les 4 coins remplac‚s par un carr‚ sur fond brillant
void Selectionne(CUCControl *c)
{
  unsigned char coin = 254;
  
  c->Refresh();
  c->GotFocus();

  if (!iTestMode)
  {
	wattron(wForm, BRILLANT);
	cmvwaddch(wForm, c->iGetTop(), c->iGetLeft(), coin);
	cmvwaddch(wForm, c->iGetTop(), c->iGetLeft()+c->iGetWidth()-1, coin);
	cmvwaddch(wForm, c->iGetTop()+c->iGetHeight()-1, c->iGetLeft(), coin);
	cmvwaddch(wForm, c->iGetTop()+c->iGetHeight()-1, c->iGetLeft()+c->iGetWidth()-1, coin);
	wattroff(wForm, BRILLANT);
  }
}


// conversion nombre -> texte
char *itoa(int n)
{
  static char szBuffer[10];
  sprintf(szBuffer, "%d", n);
  return szBuffer;
}


// Cr‚e un nouveau contr“le
void AjouteControle()
{
  // La liste de contr“les est affich‚e dans une liste
  
  CUCList lstCtl(stdscr, NULL, 5,2,12,16);
  
  lstCtl.SetVisible();
  lstCtl.iAddItem("HScrollBar");
  lstCtl.iAddItem("VScrollBar");
  lstCtl.iAddItem("List");
  lstCtl.iAddItem("CheckBox");
  lstCtl.iAddItem("OptionButton");
  lstCtl.iAddItem("Label");
  lstCtl.iAddItem("TextEdit");
  lstCtl.iAddItem("Frame");
  lstCtl.iAddItem("CommandButton");
  lstCtl.iAddItem("ComboBox");
  lstCtl.iAddItem("FileListBox");
  lstCtl.iAddItem("DirListBox");
  
  for(;;)
  {
    int  iKey;
    char szClasse[20];
    int  iClasse;
    
    iKey = getch2();
    
    if (iKey==KEY_ESC || iKey==KEY_DEL)
    { lstCtl.SetVisible(0);
      break;
    }
    
    if (iKey==KEY_RETURN)
    { 
      lstCtl.szGetText(szClasse, 20);
      iClasse = lstCtl.iGetListIndex()+1;
      lstCtl.SetVisible(0);
	  tCtl[iNbCtl].iType = iClasse;

      switch(iClasse)
      {
        case CUCT_HSCROLLBAR:
		  tCtl[iNbCtl].ctl = new CUCHScrollBar(wForm, NULL, 16,10,1,40);
		  tCtl[iNbCtl].sNom = CString("HScrollBar")+itoa(iNbCtl+1);
		  break;
		  
        case CUCT_VSCROLLBAR:
		  tCtl[iNbCtl].ctl = new CUCVScrollBar(wForm, NULL, 2,50,15,2);
		  tCtl[iNbCtl].sNom = CString("VScrollBar")+itoa(iNbCtl+1);
		  break;
		  
        case CUCT_LIST:
        { CUCList *pLST;
		  pLST = new CUCList(wForm, NULL, 5,33,10,15);
		  tCtl[iNbCtl].ctl = pLST;
		  pLST->iAddItem("Un");
		  pLST->iAddItem("Deux");
		  pLST->iAddItem("Trois");
		  pLST->iAddItem("Quatre");
		  pLST->iAddItem("Cinq");
		  pLST->iAddItem("Six");
		  pLST->iAddItem("Sept");
		  pLST->iAddItem("Huit");
		  pLST->iAddItem("Neuf");
		  pLST->iAddItem("Dix");
		  tCtl[iNbCtl].sNom = CString("List")+itoa(iNbCtl+1);
		  break;
		}
		
        case CUCT_CHECKBOX:
		  tCtl[iNbCtl].ctl = new CUCCheckBox(wForm, NULL, 6,15,1,12, "&CheckBox");
		  tCtl[iNbCtl].sNom = CString("CheckBox")+itoa(iNbCtl+1);
		  break;
		  
        case CUCT_OPTIONBUTTON:
		  tCtl[iNbCtl].ctl = new CUCOptionButton(wForm, NULL, 7,15,1,12, "&Option");
		  tCtl[iNbCtl].sNom = CString("OptionButton")+itoa(iNbCtl+1);
		  break;
		  
        case CUCT_LABEL:
		  tCtl[iNbCtl].ctl = new CUCLabel(wForm, NULL, 3,12,1,8, "&Label:");
		  tCtl[iNbCtl].sNom = CString("Label")+itoa(iNbCtl+1);
		  break;
		  
        case CUCT_TEXTEDIT:
		  tCtl[iNbCtl].ctl = new CUCTextEdit(wForm, NULL, 2,20,3,28);
		  tCtl[iNbCtl].sNom = CString("TextEdit")+itoa(iNbCtl+1);
		  break;
		  
        case CUCT_FRAME:
		  tCtl[iNbCtl].ctl = new CUCFrame(wForm, NULL, 5,14,5,15, "&Cadre");
		  tCtl[iNbCtl].sNom = CString("Frame")+itoa(iNbCtl+1);
		  break;
		  
        case CUCT_COMMANDBUTTON:
		  tCtl[iNbCtl].ctl = new CUCCommandButton(wForm, NULL, 12,11,3,8, "&Ok");
		  tCtl[iNbCtl].sNom = CString("CommandButton")+itoa(iNbCtl+1);
		  break;
		  
        case CUCT_COMBOBOX:
          { CUCComboBox *pCBX;
			pCBX = new CUCComboBox(wForm, NULL, 2,20,6,28);
			tCtl[iNbCtl].ctl = pCBX;
			pCBX->iAddItem("Un");
			pCBX->iAddItem("Deux");
			pCBX->iAddItem("Trois");
			pCBX->iAddItem("Quatre");
			pCBX->iAddItem("Cinq");
			pCBX->iAddItem("Six");
			pCBX->iAddItem("Sept");
			pCBX->iAddItem("Huit");
			pCBX->iAddItem("Neuf");
			pCBX->iAddItem("Dix");
			tCtl[iNbCtl].sNom = CString("ComboBox")+itoa(iNbCtl+1);
		  }
		  break;
		
		case CUCT_FILELISTBOX:
		  tCtl[iNbCtl].ctl = new CUCFileListBox(wForm, NULL, 5,33,10,15);
		  tCtl[iNbCtl].sNom = CString("FileListBox")+itoa(iNbCtl+1);
		  break;

		case CUCT_DIRLISTBOX:
		  tCtl[iNbCtl].ctl = new CUCDirListBox(wForm, NULL, 5,33,10,15);
		  tCtl[iNbCtl].sNom = CString("FileListBox")+itoa(iNbCtl+1);
		  break;
      }
      
      if (iCtlActif>=0) Deselectionne(tCtl[iCtlActif].ctl);
      
      iCtlActif = iNbCtl++;
      tCtl[iCtlActif].ctl->SetVisible();
      Selectionne(tCtl[iCtlActif].ctl);
      
      break;
    }
    
    lstCtl.Key(iKey);
  }
}


void AfficheControles()
{
  for (int i=0 ; i<iNbCtl ; i++)
    tCtl[i].ctl->Refresh();
}


CString CreeUneLigneProp(int iLigne)
{
  CString sLigne;
  int	iType = tCtl[iCtlActif].iType;
  char	szBuffer[100];
  
  if (tProp[iType][iLigne].cType=='*')		// Pseudo-propri‚t‚
    sLigne = "Nom";
  else
    sLigne = CString(szCUCPropName(tProp[iType][iLigne].iProp)).Left(10);
			
  sLigne += '\t';
			  
  switch(tProp[iType][iLigne].cType)
  {  
    case 'N':
      sLigne += itoa(tCtl[iCtlActif].ctl->iGetPropNum(tProp[iType][iLigne].iProp));
      break;
			    
    case 'C':
      sLigne += char(tCtl[iCtlActif].ctl->iGetPropNum(tProp[iType][iLigne].iProp));
      break;
			    
    case 'A':
  	  sLigne += tCtl[iCtlActif].ctl->szGetPropStr(tProp[iType][iLigne].iProp, szBuffer, 100);
 	  break;
	
    case '*':
	  sLigne += tCtl[iCtlActif].sNom;
	  break;
  }

  return sLigne;
}

// Reg‚nŠre la liste complŠte des propri‚t‚s

void GenereListeProprietes()
{
  // On affiche les propri‚t‚s du contr“le courant
  int	i = 0;
  int	iType = tCtl[iCtlActif].iType;
  
  plstProp->Clear();
  while (tProp[iType][i].iProp>=0)		// La fin de la liste est rep‚r‚e par le type -1
  { plstProp->iAddItem((const char *)CreeUneLigneProp(i));
	i++;
  }
  plstProp->SetListIndex(-1);
}


void ActiveProprietes()
{
  plstProp->SetListIndex(0);
  for(;;)
  {
    int  iKey;
    
    iKey = getch2();
    
    if (iKey==KEY_ESC || iKey==KEY_DEL)
      break;

	if (iKey==KEY_TAB)
	{
	  if (iNbCtl)
	  { Deselectionne(tCtl[iCtlActif].ctl);
		iCtlActif = (iCtlActif+1)%iNbCtl;
		Selectionne(tCtl[iCtlActif].ctl);
		GenereListeProprietes();
	  }
	  break;
	}
      
	if (iKey==KEY_F(2) || iKey==KEY_RETURN)
	{ char	szBuffer[100];
	  int	iType = tCtl[iCtlActif].iType;
	  int	iLigne = plstProp->iGetListIndex();
	  
	  switch(tProp[iType][iLigne].cType)
	  {
		case 'N':
		  sprintf(szBuffer, "%d", tCtl[iCtlActif].ctl->iGetPropNum(tProp[iType][iLigne].iProp));
		  break;
			
		case 'C':
		  sprintf(szBuffer, "%c", tCtl[iCtlActif].ctl->iGetPropNum(tProp[iType][iLigne].iProp));
		  break;
			
		case 'A':
		  tCtl[iCtlActif].ctl->szGetPropStr(tProp[iType][iLigne].iProp, szBuffer, 100);
		  break;

		case '*':
		  strcpy(szBuffer, tCtl[iCtlActif].sNom);
		  break;
	  }
	  
	  iInput(3,1,(UC *)szBuffer,24,24, (UC *)"X");
	  mvaddstr(3,1,"                        ");
	  
	  switch(tProp[iType][iLigne].cType)
	  {
		case 'N':
		  tCtl[iCtlActif].ctl->SetPropNum(tProp[iType][iLigne].iProp, atoi(szBuffer));
		  break;

		case 'C':
		  tCtl[iCtlActif].ctl->SetPropNum(tProp[iType][iLigne].iProp, szBuffer[0]);
		  break;
			
		case 'A':
		  tCtl[iCtlActif].ctl->SetPropStr(tProp[iType][iLigne].iProp, szBuffer);
		  break;

		case '*':
		  tCtl[iCtlActif].sNom = szBuffer;
		  break;
	  }
	  
	  AfficheControles();
	  Selectionne(tCtl[iCtlActif].ctl);
	  wrefresh(wForm);    
			
	  plstProp->SetText((const char *)CreeUneLigneProp(iLigne));
	  continue;
	}
    
    plstProp->Key(iKey);
  }
  plstProp->SetListIndex(-1);

}


void Simulation()
{
  int iCurCtl;

  plstProp->SetVisible(0);
  szMessage = "Echap Retour en mode conception";
  AfficheStatus();

  Deselectionne(tCtl[iCtlActif].ctl);
  iTestMode = 1;

  iCurCtl = 0;
  for(;;)
  {
    int  iKey;
    
    wrefresh(wForm);    
    iKey = getch2();
    
    if (iKey==KEY_ESC || iKey==KEY_DEL)
      break;
    
    if (iKey==KEY_TAB)
	{ Deselectionne(tCtl[iCurCtl].ctl);
	  iCurCtl = (iCurCtl+1)%iNbCtl;
	  Selectionne(tCtl[iCurCtl].ctl);
	  continue;
	}

	tCtl[iCurCtl].ctl->DoEvent(CUCE_KEY, iKey);
  }

  iTestMode = 0;
  plstProp->SetVisible(1);
}

extern "C" int (*signal(int, int(*)(int)))();


int main()
{ 
  InitEcran();
  NoDelInterrupt();
  // signal(11, 0);
  
  move(0,0);
  addstr("FB 1.1\nCUC FormBuilder");

  // drawvline(szBoxs, 0, 25, LINES-1);

  plstProp = new CUCList(stdscr, NULL, 4,1,LINES-5,24);
  plstProp->SetVisible();
  plstProp->SetTabSize(11);
  
  refresh();
  Feuille = new CUCWindow(NULL, NULL, 0, 26, LINES-1, 54, "Feuille");
  wForm = (WINDOW *)Feuille->pGetPropPtr(CUCP_WDISP);

  iCtlActif = -1;
  
  for(;;)
  {
    int	iKey;  

	szMessage = "Ins, F2 Prop, F5 Sim, F6 d‚pl/dim, Tab, FlŠches, Q Quit";
	AfficheStatus();

	// On affiche les propri‚t‚s du contr“le courant
	if (iNbCtl)
	{
	  GenereListeProprietes();
	  plstProp->SetListIndex(-1);
	}

    wrefresh(wForm);
    iKey = getch2();
    
    if (iKey=='q' || iKey=='Q')
      break;
    
    switch(iKey)
    {
    
      case KEY_F(1):	// Affiche la liste des contr“les
        {
          CString sMessage;
		  char	szBuffer[15];
  
          for (int i=0 ; i<iNbCtl ; i++)
		  {
            sMessage += tCtl[i].sNom;
            sMessage += ": ";
            sMessage += tCtl[i].ctl->szGetPropStr(CUCP_TYPE, szBuffer, 15);
            sMessage += '|';
		  }
          AlertOk("Liste des contr“les", sMessage);
        }
        break;
        
      case KEY_F(5):	// Simulation
		if (iNbCtl>0)
		  Simulation();
		break;

      case KEY_F(2):	// Liste des propri‚t‚s
        ActiveProprietes();
        break;
        
      case KEY_F(6):	// Mode d‚placement/dimension
        iResizeMode = 1-iResizeMode;
		AfficheStatus();
		break;
	
      case KEY_INSERT:
        AjouteControle();
        break;
        
      case KEY_TAB:
        if (iNbCtl)
        { Deselectionne(tCtl[iCtlActif].ctl);
          iCtlActif = (iCtlActif+1)%iNbCtl;
          Selectionne(tCtl[iCtlActif].ctl);
        }
        break;
      
      case KEY_UP:
        if (iNbCtl)
        {
		  if (iResizeMode)
		    tCtl[iCtlActif].ctl->SetHeight(tCtl[iCtlActif].ctl->iGetHeight()-1);
		  else
		    tCtl[iCtlActif].ctl->SetTop(tCtl[iCtlActif].ctl->iGetTop()-1);
          AfficheControles();
          Selectionne(tCtl[iCtlActif].ctl);
        }
        break;
      
      case KEY_DOWN:
        if (iNbCtl)
        {
		  if (iResizeMode)
		    tCtl[iCtlActif].ctl->SetHeight(tCtl[iCtlActif].ctl->iGetHeight()+1);
		  else
		    tCtl[iCtlActif].ctl->SetTop(tCtl[iCtlActif].ctl->iGetTop()+1);
          AfficheControles();
          Selectionne(tCtl[iCtlActif].ctl);
        }
        break;
      
      case KEY_LEFT:
        if (iNbCtl)
        {
		  if (iResizeMode)
		    tCtl[iCtlActif].ctl->SetWidth(tCtl[iCtlActif].ctl->iGetWidth()-1);
		  else
		    tCtl[iCtlActif].ctl->SetLeft(tCtl[iCtlActif].ctl->iGetLeft()-1);
          AfficheControles();
          Selectionne(tCtl[iCtlActif].ctl);
        }
        break;

      case KEY_RIGHT:
        if (iNbCtl)
        {
		  if (iResizeMode)
		    tCtl[iCtlActif].ctl->SetWidth(tCtl[iCtlActif].ctl->iGetWidth()+1);
		  else
		    tCtl[iCtlActif].ctl->SetLeft(tCtl[iCtlActif].ctl->iGetLeft()+1);
          AfficheControles();
          Selectionne(tCtl[iCtlActif].ctl);
        }
        break;
     }
  }

  for (int i=0 ; i<iNbCtl ; i++)
    delete tCtl[i].ctl;
  
  // delete Feuille;
  
  FinEcran();
  return 0;
}
