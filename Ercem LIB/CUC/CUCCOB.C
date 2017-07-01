/* cuccob.c
** Impl‚mentation du contr“le ComboBox de la bibliothŠque CUC
** 23/06/94 FG
** 26/12/94 PV	strncpy2; Assert
** 13/02/95 FG	Propri‚t‚ CUCP_EXPAND
** 14/02/95 PV	Ev‚nement CUCE_COLLAPSE g‚n‚r‚ sur fermeture de liste
*/

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

static char szNomClasse[] = "CUC ComboBox";
static char szNomType[]   = "COB";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_ComboBox
{
  char  szType[4];		// Pour des contr“les internes
  WINDOW *wDisp;		// Fenˆtre (curses) d'affichage du contr“le
  void  *IdBack;		// Identificateur de retour
  int   (*iRaiseEvent)(void *, int , int ); // Messages en retour
  void  *Parent;		// Pointeur sur un contr“le parent

  int   iEnabled;		// Vrai si le contr“le doit r‚agir
  int   iVisible;		// Vrai si le contr“le est affich‚
  int   iHasFocus;		// Vrai si le contr“le a le focus

  int   iTop;       	// No de ligne … l'‚cran, base 0
  int   iLeft;          // No de colonne … l'‚cran, base 0
  int   iWidth; 	    // Largeur du contr“le en colonnes
  int   iHeight;      	// Hauteur du contr“le en lignes

  char  *szTag;         // Tag du contr“le
  int   iTabStop;      	// Arrˆt sur tabulation
  
  // Sp‚cifique
  int   iStyle; 	    // 0: liste modifiable et d‚roulante
						// 1: liste modifiable d‚roul‚e en permanence
						// 2: liste d‚roulante non modifiable
  // Champs priv‚s
  struct CUC_TextEdit   *pTXT;  // TextEdit
  struct CUC_List       *pLST;  // List
};


//====================================================================
static WINDOW *CreeFenetreCurses(struct CUC_ComboBox *pCOB)
{
  WINDOW *wDisp;
  int x, y;
  int iWidth;

  // On teste wDisp … cause de l'appel … getbegxy
  if (iOkWDisp(pCOB->wDisp, szNomClasse, "CreeFenetreCurses")<0) return NULL;
  
  wDisp = CUC_ListGetPropPtr(pCOB->pLST, CUCP_WDISP);
  iWidth = CUC_ListGetPropNum(pCOB->pLST, CUCP_WIDTH);
  // On r‚cupŠre l'offset de la fenˆtre
  getbegyx(pCOB->wDisp, y, x);
  if(pCOB->pLST!=NULL && wDisp!=NULL && wDisp!=stdscr && wDisp!=pCOB->wDisp)
  {
	delwin2(wDisp);
	CUC_ListSetPropPtr(pCOB->pLST, CUCP_WDISP, NULL);
  }
  if(pCOB->iLeft+x+iWidth>=80)
	wDisp = newwin2(pCOB->iHeight-1, iWidth, pCOB->iTop+1+y, 79-iWidth+x);
  else 
	wDisp = newwin2(pCOB->iHeight-1, iWidth, pCOB->iTop+1+y, pCOB->iLeft+x);
  InitWin(wDisp);
  return wDisp;
}


//====================================================================
static void CloseList(struct CUC_ComboBox *pCOB)
{
  WINDOW *wd;

  if( (wd = CUC_ListGetPropPtr(pCOB->pLST, CUCP_WDISP))!=NULL)
  {
	if(wd!=stdscr && wd!=pCOB->wDisp)
	{
	  if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE))
		CUC_ListSetPropNum(pCOB->pLST, CUCP_VISIBLE, 0);
	  delwin2(wd);
	  CUC_ListSetPropPtr(pCOB->pLST, CUCP_WDISP, NULL);
	}
	else if(wd==pCOB->wDisp)
	{
	  int i,j;
	  int iWidth = CUC_ListGetPropNum(pCOB->pLST, CUCP_WIDTH);

	  for (i=1 ; i<pCOB->iHeight ; i++)
		for (j=0 ; j<iWidth ; j++)
		  cmvwaddch(pCOB->wDisp, pCOB->iTop+i, pCOB->iLeft+j, ' ');
	  if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE))
		CUC_ListSetPropNum(pCOB->pLST, CUCP_VISIBLE, 0);
	}
	if (pCOB->iRaiseEvent!=NULL)
	  pCOB->iRaiseEvent(pCOB->IdBack, CUCE_COLLAPSE, 0);
  }
}


//====================================================================
// Efface completement le contr“le de l'‚cran (affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver derriŠre (en dessous)

static void Efface(struct CUC_ComboBox *pCOB)
{
  int j;

  if (iOkWDisp(pCOB->wDisp, szNomClasse, "Efface")<0) return;
  
  // Efface la zone TextEdit
  for (j=0 ; j<pCOB->iWidth ; j++)
	cmvwaddch(pCOB->wDisp, pCOB->iTop, pCOB->iLeft+j, ' ');
  if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE)) CloseList(pCOB);
}


//====================================================================
static void MajTextEdit(struct CUC_ComboBox *pCOB)
{
  char buff[1000];

  CUC_ListGetPropStr(pCOB->pLST, CUCP_TEXT, buff, 1000);
  CUC_TextEditSetPropStr(pCOB->pTXT, CUCP_TEXT, buff);
  // CUC_TextEditDoEvent(pCOB->pTXT, CUCE_KEY, KEY_END);
  if(pCOB->iStyle!=2 && buff!=NULL)
  {
	CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_SELSTART, 0);
	CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_SELLENGTH, strlen(buff));
  }
}


//====================================================================
static void ListRefresh(struct CUC_List *pLST)
{
  WINDOW *wd;

  CUC_ListRefresh(pLST); 
  if( (wd = CUC_ListGetPropPtr(pLST, CUCP_WDISP))!=NULL && wd!=stdscr)
  {
	wrefresh2(wd);
  }
}


//====================================================================
// Redessine complŠtement le contr“le
static void Affiche(struct CUC_ComboBox *pCOB)
{
  if (iOkWDisp(pCOB->wDisp, szNomClasse, "Affiche")<0) return;
  
  if (!pCOB->iEnabled) wattron(pCOB->wDisp, DIMINUE);
  cmvwaddch(pCOB->wDisp, pCOB->iTop, pCOB->iLeft, '[');
  cmvwaddch(pCOB->wDisp, pCOB->iTop, pCOB->iLeft+pCOB->iWidth-2, ']');
  cmvwaddch(pCOB->wDisp, pCOB->iTop, pCOB->iLeft+pCOB->iWidth-1, 'v');
  if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE) )
	ListRefresh(pCOB->pLST);
  else CloseList(pCOB);
  if(pCOB->iWidth>3) CUC_TextEditRefresh(pCOB->pTXT);
  if (!pCOB->iEnabled) wattroff(pCOB->wDisp, DIMINUE);
}


/*====================================================================*/
// Cr‚ation du contr“le
// Cr‚ation du contr“le TextEdit
static void CreateTXT(struct CUC_ComboBox *pCOB)
{
  pCOB->pTXT = CUC_TextEditCreate(pCOB->wDisp, NULL);  
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_LEFT, pCOB->iLeft+1);
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_TOP, pCOB->iTop);
  if(pCOB->iWidth>3)
	CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_WIDTH, pCOB->iWidth-3);
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_HEIGHT, 1);
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_VISIBLE, FALSE);
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_ENABLED, TRUE);
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_MULTILINE, FALSE);
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_SCROLLBARS, 0);
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_ALIGNMENT, 0);
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_BORDERSTYLE, 0);
  CUC_TextEditSetPropNum(pCOB->pTXT, CUCP_TABSIZE, 8);

  CUC_TextEditSetPropStr(pCOB->pTXT, CUCP_TEXT, NULL);
}


// Cr‚ation du contr“le List
static void CreateLST(struct CUC_ComboBox *pCOB)
{
  pCOB->pLST = CUC_ListCreate(NULL, NULL);
  // pCOB->pLST = CUC_ListCreate(pCOB->wDisp, NULL);
  CUC_ListSetPropNum(pCOB->pLST, CUCP_LEFT, 0);
  CUC_ListSetPropNum(pCOB->pLST, CUCP_TOP, 0);
  CUC_ListSetPropNum(pCOB->pLST, CUCP_WIDTH, pCOB->iWidth);
  if (pCOB->iHeight>3)
	CUC_ListSetPropNum(pCOB->pLST, CUCP_HEIGHT, pCOB->iHeight-1);
  CUC_ListSetPropNum(pCOB->pLST, CUCP_VISIBLE, FALSE);
  CUC_ListSetPropNum(pCOB->pLST, CUCP_ENABLED, TRUE);
  CUC_ListSetPropNum(pCOB->pLST, CUCP_AUTOREFRESH, TRUE);
  CUC_ListSetPropNum(pCOB->pLST, CUCP_COLUMNS, 0);
  CUC_ListSetPropNum(pCOB->pLST, CUCP_SORTED, TRUE);
  CUC_ListSetPropNum(pCOB->pLST, CUCP_TABSIZE, 8);
}

// Cr‚ation du contr“le ComboBox
struct CUC_ComboBox *CUC_ComboBoxCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))

{
  struct CUC_ComboBox *pCOB;

  pCOB = (struct CUC_ComboBox *)malloc(sizeof(struct CUC_ComboBox));

  if (pCOB==NULL)
  { aprintf("CUC: CUC_ComboBoxCreate", "Echec au malloc !");
	return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  strcpy(pCOB->szType, szNomType);
  
  pCOB->iEnabled = 1;
  pCOB->iVisible = 0;           // Cr‚‚ invisible
  pCOB->iHasFocus = 0;
  
  pCOB->iTop = 0;
  pCOB->iLeft = 0;
  pCOB->iWidth = 3;
  pCOB->iHeight = 3;

  pCOB->szTag = NULL;

  pCOB->iTabStop = 1;
  pCOB->wDisp = w;
  pCOB->iRaiseEvent = iRaiseEvent;
  pCOB->IdBack = pCOB;  // Par d‚faut IdBack est un ptr sur le contr“le
  pCOB->Parent = NULL;

  pCOB->iStyle = 0;

  CreateTXT(pCOB);
  CreateLST(pCOB);
	
  return pCOB;
}


/*====================================================================*/
// Destruction du contr“le
void CUC_ComboBoxDestruct(struct CUC_ComboBox *pCOB)
{ 
  if (iCtrlType(pCOB, "CUC_ComboBoxDestruct", szNomType)<0)
	return;
  
  CUC_TextEditDestruct(pCOB->pTXT);
  CUC_ListDestruct(pCOB->pLST);

  if (pCOB->szTag!=NULL) free(pCOB->szTag); // On d‚truit le tag...
  
  pCOB->szType[0] = 0;
  free((void *)pCOB);               // puis la structure
}


/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique
int CUC_ComboBoxSetPropNum(struct CUC_ComboBox *pCOB, int iProp, int iArg)
{
  int iWidth=0;

  if (iCtrlType(pCOB, "CUC_ComboBoxSetPropNum", szNomType)<0)
	return -1;

  // if(pCOB->iStyle==1)
  iWidth = CUC_ListGetPropNum(pCOB->pLST, CUCP_WIDTH);

  switch(iProp)
  {
	case CUCP_LEFT:
	  if (pCOB->iLeft!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pCOB->iVisible) Efface(pCOB);
		pCOB->iLeft = iArg;
		CUC_TextEditSetPropNum(pCOB->pTXT, iProp, pCOB->iLeft+1);

		// iStyle!=1 -> on est dans une sous fenˆtre !!!
		if(pCOB->iStyle!=1) CUC_ListSetPropNum(pCOB->pLST, iProp, 0);
		else CUC_ListSetPropNum(pCOB->pLST, iProp, pCOB->iLeft+1);

		if (pCOB->iVisible) Affiche(pCOB);
	  }
	  break;

	case CUCP_TOP:
	  if (pCOB->iTop!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pCOB->iVisible) Efface(pCOB);
		pCOB->iTop = iArg;
		CUC_TextEditSetPropNum(pCOB->pTXT, iProp, pCOB->iTop);
		if(pCOB->iStyle!=1) CUC_ListSetPropNum(pCOB->pLST, iProp, 0);
		else CUC_ListSetPropNum(pCOB->pLST, iProp, pCOB->iTop+1);
		if (pCOB->iVisible) Affiche(pCOB);
	  }
	  break;

	case CUCP_WIDTH:
	  if (pCOB->iWidth!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 3, 80)<0)
		  return -1;
		if (pCOB->iVisible) Efface(pCOB);
		pCOB->iWidth = iArg;
		CUC_TextEditSetPropNum(pCOB->pTXT, iProp , pCOB->iWidth-3);
		CUC_ListSetPropNum(pCOB->pLST, iProp, pCOB->iWidth);

		if (pCOB->iVisible) Affiche(pCOB);
	  }
	  break;

	case CUCP_HEIGHT:
	  if (pCOB->iHeight!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 3, 25)<0)
		  return -1;
		if (pCOB->iVisible) Efface(pCOB);
		pCOB->iHeight = iArg;
		CUC_TextEditSetPropNum(pCOB->pTXT, iProp, 1);
		CUC_ListSetPropNum(pCOB->pLST, iProp, pCOB->iHeight-1);
	
		if (pCOB->iVisible) Affiche(pCOB);
	  }
	  break;

	case CUCP_VISIBLE:
	  if (pCOB->iVisible!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
	
		pCOB->iVisible = iArg;
		CUC_TextEditSetPropNum(pCOB->pTXT, iProp, iArg);
		if(pCOB->iStyle==1)
		{
		  CUC_ListSetPropPtr(pCOB->pLST, CUCP_WDISP, pCOB->wDisp);
		  CUC_ListSetPropNum(pCOB->pLST, iProp, iArg);
		}
		if (iArg==0) Efface(pCOB);
		else Affiche(pCOB);
	  }
	  break;

	case CUCP_ENABLED:
	  if (pCOB->iEnabled!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		  
		pCOB->iEnabled = iArg;
		CUC_TextEditSetPropNum(pCOB->pTXT, iProp, iArg);
		CUC_ListSetPropNum(pCOB->pLST, iProp, iArg);
		if (pCOB->iVisible) Affiche(pCOB);
	  }
	  break;

	case CUCP_STYLE:
	  if (pCOB->iStyle!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 2)<0)
		  return -1;
		  
		if (pCOB->iVisible) Efface(pCOB);
		pCOB->iStyle = iArg;
		if(iArg==1)
		{
		  CUC_ListSetPropPtr(pCOB->pLST, CUCP_WDISP, pCOB->wDisp);
		  CUC_ListSetPropNum(pCOB->pLST, CUCP_TOP, pCOB->iTop+1);
		  CUC_ListSetPropNum(pCOB->pLST, CUCP_LEFT, pCOB->iLeft);
		  if(pCOB->iVisible)
			CUC_ListSetPropNum(pCOB->pLST, CUCP_VISIBLE, 1);
		}
		else 
		{ // iArg!=1 -> la liste n'est pas visible
		  CUC_ListSetPropNum(pCOB->pLST, CUCP_VISIBLE, 0);
		  CUC_ListSetPropPtr(pCOB->pLST, CUCP_WDISP, NULL);
		}
		if (pCOB->iVisible) Affiche(pCOB);
	  }
	  break;

	case CUCP_TABSTOP:
	  pCOB->iTabStop = iArg;
	  break;

	case CUCP_TABSIZE:
	  CUC_TextEditSetPropNum(pCOB->pTXT, iProp, iArg);
	  CUC_ListSetPropNum(pCOB->pLST, iProp, iArg);
	  break;

	  
	case CUCP_LISTINDEX:
	  {
		char szBuff[512];
		CUC_ListSetPropNum(pCOB->pLST, iProp, iArg);
		CUC_ListGetPropStr(pCOB->pLST, CUCP_TEXT, szBuff, 512);
		CUC_TextEditSetPropStr(pCOB->pTXT, CUCP_TEXT, szBuff);
		break;
	  }

	case CUCP_LISTWIDTH:
	  CUC_ListSetPropNum(pCOB->pLST, CUCP_WIDTH, iArg);
	  break;

	case CUCP_EOLCHAR:
	case CUCP_EOFCHAR:
	case CUCP_STDATTRIB:
	  CUC_TextEditSetPropNum(pCOB->pTXT, iProp, iArg);
	  break;

	case CUCP_FOCUS:
	case CUCP_LISTCOUNT:
	  ErrPropLectureSeule(szNomClasse, "SetPropNum", iProp);
	  return -1;

	default:
	  ErrPropNonGeree(szNomClasse, "SetPropNum", iProp);
	  return -1;
  }

  return 0; // Tout s'est bien pass‚
}


/*====================================================================*/
// Positionnement d'une propri‚t‚ texte
int CUC_ComboBoxSetPropStr(struct CUC_ComboBox *pCOB, int iProp, const char *szVal)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxSetPropStr", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_TAG:
	  if (pCOB->szTag!=NULL) free(pCOB->szTag);
	  if (szVal==NULL)
		pCOB->szTag = NULL;
	  else
		pCOB->szTag = strdup(szVal);
	  break;
	  
	case CUCP_TEXT:
	  if(pCOB->iVisible) Efface(pCOB);
// aprintf("cob","setproptexte %s",szVal);
	  CUC_TextEditSetPropStr(pCOB->pTXT, CUCP_TEXT, szVal);
	  // CUC_TextEditSetPropStr(pCOB->pTXT, CUCP_TEXT, "essai");
	  if(pCOB->iVisible) Affiche(pCOB);
	  break;

	case CUCP_TYPE:
	  ErrPropLectureSeule(szNomClasse, "SetPropStr", iProp);
	  return -1;

	default:
	  ErrPropNonGeree(szNomClasse, "SetPropStr", iProp);
	  return -1;
  }

  return 0; // Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ texte indic‚e
int CUC_ComboBoxSetPropStrInd(struct CUC_ComboBox *pCOB, int iProp, int iIndice, const char *szBuffer)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxSetPropStrInd", szNomType)<0)
	return -1;

  return(CUC_ListSetPropStrInd(pCOB->pLST, iProp, iIndice, szBuffer));
}


/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"
int CUC_ComboBoxSetPropPtr(struct CUC_ComboBox *pCOB, int iProp, void *pArg)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxSetPropPtr", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_PARENT: pCOB->Parent = pArg; break;
	case CUCP_IDBACK: pCOB->IdBack = pArg; break;
	case CUCP_WDISP:  
	  pCOB->wDisp = pArg;
	  CUC_TextEditSetPropPtr(pCOB->pTXT, CUCP_WDISP, pArg);
	  if(pCOB->iStyle==1)
		CUC_ListSetPropPtr(pCOB->pLST, CUCP_WDISP, pArg);
	  break;

	default:
	  ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
	  return -1;
  }

  return 0; // Tout s'est bien pass‚
}


/*====================================================================*/
// Lecture d'une propri‚t‚ num‚rique
int CUC_ComboBoxGetPropNum(struct CUC_ComboBox *pCOB, int iProp)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxGetPropNum", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_ENABLED:      return pCOB->iEnabled;
	case CUCP_STYLE:        return pCOB->iStyle;
	case CUCP_VISIBLE:      return pCOB->iVisible;
	case CUCP_FOCUS:        return pCOB->iHasFocus;

	case CUCP_LEFT:         return pCOB->iLeft;
	case CUCP_TOP:          return pCOB->iTop;
	case CUCP_WIDTH:        return pCOB->iWidth;
	case CUCP_HEIGHT:       return pCOB->iHeight;
	case CUCP_TABSIZE:      return CUC_TextEditGetPropNum(pCOB->pTXT, CUCP_TABSIZE);
	case CUCP_TABSTOP:      return pCOB->iTabStop;
	
	case CUCP_LISTINDEX:    return CUC_ListGetPropNum(pCOB->pLST, CUCP_LISTINDEX);
	case CUCP_LISTCOUNT:    return CUC_ListGetPropNum(pCOB->pLST,CUCP_LISTCOUNT);
	case CUCP_MULTILINE:	return 0;
	case CUCP_EXPAND:
	  if(pCOB->iStyle!=1)
		return(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE));
	  else return 1; // Liste d‚roul‚e en permanence

	default: ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}


/*====================================================================*/
// Lecture d'une propri‚t‚ texte
// On ne retourne pas un pointeur sur un champ de donn‚e priv‚,
// mais on copie la chaine … une adresse fournie par l'appellant.
// Routine s‚curis‚e: on gŠre la taille du buffer, et on garantit
// que le buffer se termine par 0.
// Une propri‚t‚ … NULL de fa‡on interne est retourn‚e comme chaŒne null
char *CUC_ComboBoxGetPropStr(struct CUC_ComboBox *pCOB, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxGetPropStr", szNomType)<0)
	return NULL;
  Assert(szBuffer!=NULL);

  switch(iProp)
  {
	case CUCP_TAG:
	  if (pCOB->szTag==NULL)
		szBuffer[0] = 0;
	  else
	    strncpy2(szBuffer, pCOB->szTag, iLBuf);
	  break;

	case CUCP_TYPE:
	  strncpy2(szBuffer, pCOB->szType, iLBuf);
	  break;

	case CUCP_TEXT:
	  // if (CUC_ListGetPropNum(pCOB->pLST, CUCP_LISTCOUNT)<=0 || 
	//    CUC_ListGetPropNum(pCOB->pLST, CUCP_LISTINDEX)<0    )
	//  szBuffer[0] = 0;
	//   else
	  { 
		CUC_TextEditGetPropStr(pCOB->pTXT, CUCP_TEXT, szBuffer, iLBuf);
	  }
	  break;

	default:
	  ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}



/*====================================================================*/
// Lecture d'une propri‚t‚ texte indic‚e
char *CUC_ComboBoxGetPropStrInd(struct CUC_ComboBox *pCOB, int iProp, int iIndice, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxGetPropStrInd", szNomType)<0)
	return NULL;
  Assert(szBuffer!=NULL);

  return(CUC_ListGetPropStrInd(pCOB->pLST, iProp, iIndice, szBuffer, iLBuf));
}




/*====================================================================*/
// Lecture d'une propri‚t‚ void *
void *CUC_ComboBoxGetPropPtr(struct CUC_ComboBox *pCOB, int iProp)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxGetPropPtr", szNomType)<0)
	return NULL;

  switch(iProp)
  {
	case CUCP_PARENT:   return pCOB->Parent;
	case CUCP_IDBACK:   return pCOB->IdBack;
	case CUCP_WDISP:    return pCOB->wDisp;
	default:
	  ErrPropNonGeree(szNomClasse, "GetPropPtr", iProp);
  }
  return 0;
}


/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY
static void DoEventKey(struct CUC_ComboBox *pCOB, int iKey)
{
  static int iOldIndex=-1;
  int v, vMax;
  char buff[1000];
  int i=0;
  int iEtatLst;

  v = CUC_ListGetPropNum(pCOB->pLST, CUCP_LISTINDEX);
  vMax = CUC_ListGetPropNum(pCOB->pLST, CUCP_LISTCOUNT);
  iEtatLst = CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE);
  
  switch(iKey)
  {
	case KEY_UP:
	  if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE))
	  { CUC_ListDoEvent(pCOB->pLST, CUCE_KEY, iKey);
		ListRefresh(pCOB->pLST);
	  }
	  else if(v) CUC_ListSetPropNum(pCOB->pLST, CUCP_LISTINDEX, v-1);
	  MajTextEdit(pCOB);
	  break;
	  
	case KEY_DOWN:
	  if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE))
	  {	CUC_ListDoEvent(pCOB->pLST, CUCE_KEY, iKey);
		ListRefresh(pCOB->pLST);
	  }
	  else if((v+1)<vMax)
		CUC_ListSetPropNum(pCOB->pLST, CUCP_LISTINDEX, v+1);
	  MajTextEdit(pCOB);
	  break;

	case KEY_PGUP:
	  if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE))
	  {	CUC_ListDoEvent(pCOB->pLST, CUCE_KEY, iKey);
		ListRefresh(pCOB->pLST);
	  }
	  MajTextEdit(pCOB);
	  break;

	case KEY_PGDN:
	  if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE))
	  {	CUC_ListDoEvent(pCOB->pLST, CUCE_KEY, iKey);
		ListRefresh(pCOB->pLST);
	  }
	  MajTextEdit(pCOB);
	  break;

	case KEY_HOME:
	  if(pCOB->iStyle!=2)
		CUC_TextEditDoEvent(pCOB->pTXT, CUCE_KEY, iKey);
	  break;

	case KEY_END:
	  if(pCOB->iStyle!=2)
		CUC_TextEditDoEvent(pCOB->pTXT, CUCE_KEY, iKey);
	  break;
	  
	case KEY_F(4):
	  // 0: liste modifiable et d‚roulante
	  // 1: liste modifiable d‚roul‚e en permanence
	  // 2: liste d‚roulante non modifiable (pas de saisie possible)
	  if(pCOB->iStyle!=1)
	  {
		iEtatLst ^= 1;
		if(!iEtatLst) CloseList(pCOB);
		if(iEtatLst)
		{
		  // PremiŠre ouverture de la liste d‚roulante
		  if(!v && CUC_ListGetPropStrInd(pCOB->pLST, CUCP_LIST, 0, buff, 1000)!=NULL)
		  {
			CUC_ListSetPropNum(pCOB->pLST, CUCP_LISTINDEX, 0);
			CUC_TextEditSetPropStr(pCOB->pTXT, CUCP_TEXT, buff);
		  }

		  CUC_ListSetPropPtr(pCOB->pLST, CUCP_WDISP, CreeFenetreCurses(pCOB));
		  if(pCOB->iRaiseEvent!=NULL)
			pCOB->iRaiseEvent(pCOB->IdBack, CUCE_DROPDOWN, 0);
		}
		CUC_ListSetPropNum(pCOB->pLST, CUCP_VISIBLE, iEtatLst);
		if(iEtatLst) ListRefresh(pCOB->pLST);
		CUC_TextEditRefresh(pCOB->pTXT);
	  }
	  break;
	  
	case KEY_ESC:
	  if(pCOB->iStyle!=1)
	  {
		if(iEtatLst)
		{
		  CloseList(pCOB);
		  iEtatLst = 0;
		}
	  }
	  break;
	  
	default:
	  v = CUC_ListGetPropNum(pCOB->pLST, CUCP_LISTCOUNT);
	  if(pCOB->iStyle!=2)
	  { // on peut saisir du texte
		CUC_TextEditDoEvent(pCOB->pTXT, CUCE_KEY, iKey);
		CUC_TextEditGetPropStr(pCOB->pTXT, CUCP_TEXT, buff, 1000);
		if(buff[0])
		{
		  char buff2[1000];

		  for(i=0; i<v; i++)
		  {
			if(CUC_ListGetPropStrInd(pCOB->pLST, CUCP_LIST, i, buff2, strlen(buff)+1)==NULL) break;
			if(!strcmp(buff,buff2)) break;
		  }
		}
		if(i>=v) CUC_ListSetPropNum(pCOB->pLST, CUCP_LISTINDEX, 0);
		else if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE))
		{
		  CUC_ListSetPropNum(pCOB->pLST, CUCP_LISTINDEX, i);
		  ListRefresh(pCOB->pLST);
		}
		CUC_TextEditRefresh(pCOB->pTXT);
	  }
	  else
	  {
		CUC_ListDoEvent(pCOB->pLST, CUCE_KEY, iKey);
		MajTextEdit(pCOB);
		if(CUC_ListGetPropNum(pCOB->pLST, CUCP_VISIBLE))
		  ListRefresh(pCOB->pLST);
	  }
	  break;  

  }
  v = CUC_ListGetPropNum(pCOB->pLST, CUCP_LISTINDEX);
// aprintf("cob","ioldindex=%d v=%d",iOldIndex, v);
  if(iOldIndex!=v)
  {
// aprintf("cob","ioldindex!=v");
	if(pCOB->iRaiseEvent!=NULL)
	  pCOB->iRaiseEvent(pCOB->IdBack, CUCE_CHANGE, 0);
	iOldIndex = v;
  }
}


/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le
int CUC_ComboBoxDoEvent(struct CUC_ComboBox *pCOB, int iEvent, int iArg)
{

  if (iCtrlType(pCOB, "CUC_ComboBoxDoEvent", szNomType)<0)
	return -1;

  switch(iEvent)
  {
	case CUCE_KEY:
	  if (pCOB->iVisible && pCOB->iEnabled)
		DoEventKey(pCOB, iArg);
	  break;

	case CUCE_GOTFOCUS:
	  if (pCOB->iVisible && pCOB->iEnabled)
	  { pCOB->iHasFocus = 1;
		CUC_TextEditDoEvent(pCOB->pTXT, CUCE_GOTFOCUS, 0);
		Affiche(pCOB);
	  }
	  break;

	case CUCE_LOSTFOCUS:
	  if (pCOB->iVisible && pCOB->iEnabled)
	  { pCOB->iHasFocus = 0;
		CUC_TextEditDoEvent(pCOB->pTXT, CUCE_LOSTFOCUS, 0);
		if(pCOB->iStyle!=1)
		  CUC_ListSetPropNum(pCOB->pLST, CUCP_VISIBLE, 0);
		Affiche(pCOB);
	  }
	  break;

	default:
	  aprintf("CUC: CUC_ComboBoxDoEvent", "Ev‚nement %d inconnu !", iEvent);
	  break;
  }

  return 0;
}


/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y
int CUC_ComboBoxMove(struct CUC_ComboBox *pCOB, int iTop, int iLeft)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxMove", szNomType)<0)
	return -1;

  if (pCOB->iLeft!=iLeft || pCOB->iTop!=iTop)
  { 
	if (pCOB->iVisible) Efface(pCOB);
	pCOB->iLeft = iLeft;
	pCOB->iTop = iTop;
	CUC_TextEditMove(pCOB->pTXT, iTop, iLeft+1);
	CUC_ListMove(pCOB->pLST, iTop+1, iLeft);
	if (pCOB->iVisible) Affiche(pCOB);
  }
  return 0;
}


/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur
int CUC_ComboBoxResize(struct CUC_ComboBox *pCOB, int iHeight, int iWidth)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxResize", szNomType)<0)
	return -1;

  if (pCOB->iWidth!=iWidth || pCOB->iHeight!=iHeight)
  { 
	if (pCOB->iVisible) Efface(pCOB);
	pCOB->iWidth = iWidth;
	pCOB->iHeight = iHeight;
	CUC_ListResize(pCOB->pLST, iHeight-1, iWidth);
	CUC_TextEditResize(pCOB->pTXT, 1, iWidth-3);
	if (pCOB->iVisible) Affiche(pCOB);
  }
  return 0;
}


/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine
// Ignore la propri‚t‚ visible !!!
int CUC_ComboBoxRefresh(struct CUC_ComboBox *pCOB)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxRefresh", szNomType)<0)
	return -1;

  Affiche(pCOB);
}


/*====================================================================*/
// M‚thode AddItem: Ajout d'un ‚l‚ment dans la liste
// Si iPos==-1, l'ajout a lieu en fin de liste
int CUC_ComboBoxAddItem(struct CUC_ComboBox *pCOB, const char *szElement, int iPos)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxAddItem", szNomType)<0)
	return -1;

  if(CUC_ListAddItem(pCOB->pLST, szElement, iPos)<0)
	return -1;
  else
  {
	if(pCOB->iVisible) { Efface(pCOB); Affiche(pCOB); }
	return 0;
  }
}


/*====================================================================*/
// M‚thode RemoveItem: Retrait d'un ‚l‚ment dans la liste
// Si iPos==-1, c'est l'‚l‚ment courant qui est retir‚
int CUC_ComboBoxRemoveItem(struct CUC_ComboBox *pCOB, int iPos)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxRemoveItem", szNomType)<0)
	return -1;

  if(CUC_ListRemoveItem(pCOB->pLST, iPos)<0)
	return -1;
  else
  {
	if(pCOB->iVisible) { Efface(pCOB); Affiche(pCOB); }
	return 0;
  }
}


/*====================================================================*/
// M‚thode Clear: Efface complŠtement la liste
int CUC_ComboBoxClear(struct CUC_ComboBox *pCOB)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxClear", szNomType)<0)
	return -1;
	
  if(CUC_ListClear(pCOB->pLST)<0)
	return -1;
  else
  {
	if(pCOB->iVisible) { Efface(pCOB); Affiche(pCOB); }
	return 0;
  }
}


/*====================================================================*/
// M‚thode CloseList: Ferme la liste de la combo box
int CUC_ComboBoxCloseList(struct CUC_ComboBox *pCOB)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxCloseList", szNomType)<0)
	return -1;

  CloseList(pCOB);
  return 0;
}


//====================================================================
// M‚thode DisplayCursor : R‚affiche le curseur dans le contr“le
int CUC_ComboBoxDisplayCursor(struct CUC_ComboBox *pCOB)
{
  if (iCtrlType(pCOB, "CUC_ComboBoxDisplayCursor", szNomType)<0)
	return -1;

  return(CUC_TextEditDisplayCursor(pCOB->pTXT));
}
