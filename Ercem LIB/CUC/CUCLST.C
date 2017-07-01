/* cuclst.c
** Impl‚mentation du contr“le List de la bibliothŠque CUC
** 04/06/94 PV
** 26/08/94 PV	D‚placement avec flŠches G&D dans une liste multicolonne
**  2/12/94 PV	Propri‚t‚s LINE, COLUMN, STARTLINE, STARTCOLUMN
**				Synchro correcte d'item 0 lors du passage en multicol
** 26/12/94 PV	EffaceRectangle; strncpy2
** 14/02/95 PV	Remise … zero de la position l'ascenseur lors d'un clear
*/

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

static char szNomClasse[] = "CUC List";
static char szNomType[]   = "LST";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_List
{
  char	szType[4];		// Pour des contr“les internes

  int	iEnabled;		// Vrai si le contr“le doit r‚agir
  int	iVisible;		// Vrai si le contr“le est affich‚
  int	iHasFocus;		// Vrai si le contr“le a le focus

  int	iTop;			// No de ligne … l'‚cran, base 0
  int	iLeft;			// No de colonne … l'‚cran, base 0
  int	iWidth;			// Largeur du contr“le en colonnes
  int	iHeight;		// Hauteur du contr“le en lignes

  char	*szTag;			// Tag du contr“le
  int	iTabSize;		// Largeur d'une tabulation

  int	iTabStop;		// Arrˆt sur tabulation
  WINDOW *wDisp;		// Fenˆtre (curses) d'affichage du contr“le
  void	*IdBack;		// Identificateur de retour
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour
  void	*Parent;		// Pointeur sur un contr“le parent
  
  // Sp‚cifique
  int	iColumns;		// 0: D‚filement vertical, 1 colonne; >1: d‚filement horizontal
  int	iSorted;		// Si vrai, liste tri‚e
  int	iAutoRefresh;	// Si vrai, le contr“le se redessine seul
  char	**pszItems;		// Tableau des items
  int	iListCount;		// Nb d'‚l‚ments dans la liste
  int	iListIndex;		// Item actuellement s‚lectionn‚
  
  // Champs priv‚s
  int	iItem0;			// No de la premiŠre ligne affich‚e (monocolonne), ou du
  						// 1er item affiche (multicolonne)
  int	iPosX;
  int	iPosY;
  struct CUC_VScrollBar *pVSB;	// Barre de d‚filement verticale
  struct CUC_HScrollBar *pHSB;	// Barre de d‚filement horizontale
};

// Jeu de macros pour d‚duire 4 propri‚t‚s qui ne sont pas stock‚es directement
#define Calcul_CUCP_LINE(pLST)        ((0==pLST->iColumns) ? pLST->iListIndex : pLST->iListIndex%(pLST->iHeight-2))
#define Calcul_CUCP_COLUMN(pLST)      ((0==pLST->iColumns) ? 0 : pLST->iListIndex/(pLST->iHeight-2))
#define Calcul_CUCP_STARTLINE(pLST)   ((0==pLST->iColumns) ? pLST->iItem0 : 0)
#define Calcul_CUCP_STARTCOLUMN(pLST) ((0==pLST->iColumns) ? 0 : pLST->iItem0/(pLST->iHeight-2))

/*====================================================================*/
// Contr“le de type "pouss‚" pour aider le d‚bogage...
// V‚rifie que le pointeur est bon, et que les valeurs
// de la structure sont vraisemblables...
// En version release, on ne v‚rifie que si le pointeur
// est NULL ou non

#ifndef _DEBUG

#define iCtrlTypeLST(p, f, n) iCtrlType(p,f,n)

#else

int iCtrlTypeLST(struct CUC_List *p, char *szFonc, char *szNomType)
{
  int iOk = 0;
  
  if (iCtrlType(p, "CUC_ListSetPropNum", szNomType)<0)
    iOk=-1;
  else
  {
    if (iCtrlBornes(szNomClasse, CUCP_ENABLED,		p->iEnabled, 0, 1)<0) iOk=-1;
    if (iCtrlBornes(szNomClasse, CUCP_VISIBLE,		p->iVisible, 0, 1)<0) iOk=-1;
    if (iCtrlBornes(szNomClasse, CUCP_FOCUS,		p->iHasFocus, 0, 1)<0) iOk=-1;
    
    if (iCtrlBornes(szNomClasse, CUCP_TOP,			p->iTop, 0, 25)<0) iOk=-1;
    if (iCtrlBornes(szNomClasse, CUCP_LEFT,			p->iLeft, 0, 79)<0) iOk=-1;
    if (iCtrlBornes(szNomClasse, CUCP_HEIGHT,		p->iHeight, 2, 25)<0) iOk=-1;
    if (iCtrlBornes(szNomClasse, CUCP_WIDTH,		p->iWidth, 2, 79)<0) iOk=-1;
  
    if (iCtrlBornes(szNomClasse, CUCP_TABSIZE,		p->iHeight, 1, 50)<0) iOk=-1;
    if (iCtrlBornes(szNomClasse, CUCP_TABSTOP,		p->iTabStop, 0, 1)<0) iOk=-1;

    if (iCtrlBornes(szNomClasse, CUCP_COLUMNS,		p->iColumns, 0, 10)<0) iOk=-1;
    if (iCtrlBornes(szNomClasse, CUCP_SORTED,		p->iSorted, 0, 1)<0) iOk=-1;
    if (iCtrlBornes(szNomClasse, CUCP_AUTOREFRESH,	p->iAutoRefresh, 0, 1)<0) iOk=-1;

    if (iCtrlBornes(szNomClasse, CUCP_LISTCOUNT,	p->iListCount, 0, INFINI)<0) iOk=-1;
    if (iCtrlBornes(szNomClasse, CUCP_LISTINDEX,	p->iListIndex, -1, INFINI)<0) iOk=-1;
  }
  
  if (iOk<0)
  { aprintf(szNomClasse, "%s:|iCtrlTypeLST: La structure de la liste|a vraisemblablement ‚t‚ alt‚r‚e !", szFonc);
#ifndef UNIX
    _asm int 3;		// Appel du debugger
#endif
    stopcurses();
    exit(1);
  }
    
  return 0;  
}
#endif

/*====================================================================*/
// Efface completement le contr“le de l'‚cran (affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver derriŠre (en dessous)

static void Efface(struct CUC_List *pLST)
{
  if (iOkWDisp(pLST->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pLST->wDisp, pLST->iTop, pLST->iLeft, pLST->iHeight, pLST->iWidth);
}

/*====================================================================*/
// Redessine le contr“le aprŠs un changement de valeur
// Si bOkScroll est vrai, la liste est 'scroll‚e' de fa‡on … ce
// que la s‚lection soit visible

static void AfficheListeScroll(struct CUC_List *pLST, int bOkScroll)
{
  int	i, j;                         
  UC	*p;
  int	iLg;
  int	nbItAff;	// Nb d'items affich‚s dans le controle
  int	iCol;		// Colonne d'affichage de l'item
  int	iNbCol;		// Largeur d'affichage d'un item

  if (iOkWDisp(pLST->wDisp, szNomClasse, "AfficheListe")<0) return;
  
  // Calcul du nombre d'items affich‚s par le contr“le
  if (pLST->iColumns==0)
    nbItAff = pLST->iHeight-2;
  else
    nbItAff = pLST->iColumns*(pLST->iHeight-2);

  // Recalage du 1er item affich‚ de la liste
  if (pLST->iColumns==0)	// D‚filement vertical
  {
    if (bOkScroll)
    {
	  if (pLST->iListIndex < pLST->iItem0)
	  { pLST->iItem0 = pLST->iListIndex-pLST->iHeight/2+1;
	    if (pLST->iItem0 < 0) pLST->iItem0 = 0;
	  }
	  else if (pLST->iListIndex >= pLST->iItem0+pLST->iHeight-2)
	  { pLST->iItem0 = pLST->iListIndex-pLST->iHeight/2+1;
	    if (pLST->iItem0 < 0) pLST->iItem0 = 0;
	  }
	}
  }
  else				// D‚filement horizontal
  {
    // Si on est en multicolonne, et que iItem0 n'est pas un multiple de iHeight-2,
    // on aligne iItem 0 sur un multiple, de facon a ce qu'en scrollant vers la
    // colonne 0 ce soit bien l'item 0 qui s'affiche en haut de la colonne 0...
	// Ce test est important; il est effectu‚ que l'on ait autoris‚ ou non
	// le scroll lors de l'affichage.
	
    if (pLST->iItem0 % (pLST->iHeight-2))
      pLST->iItem0 -= pLST->iItem0 % (pLST->iHeight-2);
    
	if (bOkScroll)
	{    
      while (pLST->iListIndex < pLST->iItem0  &&  pLST->iItem0 > 0)
        pLST->iItem0 -= pLST->iHeight-2;

      while (pLST->iListIndex >= pLST->iItem0+nbItAff)
        pLST->iItem0 += pLST->iHeight-2;
    }
  }
  
  if (!pLST->iEnabled) wattron(pLST->wDisp, DIMINUE);

  pLST->iPosY = pLST->iPosX = -1;

  // Affichage de l'ensemble des items potentiellement affich‚s dans la liste
  for (i=0 ; i<nbItAff ; i++)
  {
	int iLigAff, iColAff;

    // Calcul de la position (caractŠre) de la colonne d'affichage dans
    // la liste, et la taille en caractŠres de la colonne
    if (pLST->iColumns==0)
    {
      iCol = 0;
      iNbCol = pLST->iWidth-2;
    }

    else
    {
      int iCol2;

      iCol = ((i/(pLST->iHeight-2))*(pLST->iWidth-2)) / pLST->iColumns;
      iCol2 = ((i/(pLST->iHeight-2)+1)*(pLST->iWidth-2)) / pLST->iColumns;
      iNbCol = iCol2-iCol;
    }

    iLigAff = pLST->iTop+i%(pLST->iHeight-2)+1;
	iColAff = pLST->iLeft+1+iCol;

    if (i+pLST->iItem0 < pLST->iListCount)
    {
      if (i+pLST->iItem0==pLST->iListIndex)
	  { wattron(pLST->wDisp, INVERSE);
		pLST->iPosY = iLigAff;
		pLST->iPosX = iColAff;
	  }

      // Affichage du texte de l'item
      p = pLST->pszItems[i+pLST->iItem0] ? pLST->pszItems[i+pLST->iItem0] : "";
      iLg = 0;
      while (iLg<iNbCol && *p && *p!='\n' && *p!='\r')
	  {
		if (*p!='\t')
		{ cmvwaddch(pLST->wDisp, iLigAff, iColAff++, *p);
		  iLg++;
		}
		else	// Expansion des tabs en espaces
		  do
		  { cmvwaddch(pLST->wDisp, iLigAff, iColAff++, ' ');
			iLg++;
		  }
		  while (iLg%pLST->iTabSize && iLg<iNbCol);
		  p++;
	  }
      
      // On complŠte avec des espaces
      while(iLg < iNbCol)
      { cmvwaddch(pLST->wDisp, iLigAff, iColAff++, ' ');
		iLg++;
      }

      if (i+pLST->iItem0==pLST->iListIndex) wattroff(pLST->wDisp, INVERSE);
    }
    else	// On efface aprŠs le dernier item
      for (j=0 ; j<iNbCol ; j++)
        cmvwaddch(pLST->wDisp, iLigAff, iColAff++, ' ');
  }
  
  // Dessin ou effacement des barres de d‚filement
  if (pLST->iColumns==0)	// Liste verticale
  {
    if (pLST->iHeight>4 && pLST->iListCount>pLST->iHeight-2)
      CUC_VScrollBarRefresh(pLST->pVSB);
    else
      for (i=1 ; i<pLST->iHeight-1 ; i++)
		cmvwaddch(pLST->wDisp, pLST->iTop+i, pLST->iLeft+pLST->iWidth-1, szBoxs[4]);
  }
  else				// Liste horizontale
  {
    if (pLST->iWidth>4 && pLST->iListCount > pLST->iColumns*(pLST->iHeight-2))
    {
      CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_MAX, (pLST->iListCount-1)/(pLST->iHeight-2));
      CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_VALUE, pLST->iListIndex/(pLST->iHeight-2));
      CUC_HScrollBarRefresh(pLST->pHSB);
    }
    else
      for (i=1 ; i<pLST->iWidth-1 ; i++)
		cmvwaddch(pLST->wDisp, pLST->iTop+pLST->iHeight-1, pLST->iLeft+i, szBoxs[1]);
  }

  if (!pLST->iEnabled) wattroff(pLST->wDisp, DIMINUE);

  if (pLST->iPosY>=0) wmove(pLST->wDisp, pLST->iPosY, pLST->iPosX);
}

static void AfficheListe(struct CUC_List *pLST)
{
  AfficheListeScroll(pLST, 1);
}

/*====================================================================*/
// Redessine complŠtement le contr“le

static void Affiche(struct CUC_List *pLST)
{
  int i;

  if (iOkWDisp(pLST->wDisp, szNomClasse, "Affiche")<0) return;
  
  if (!pLST->iEnabled) wattron(pLST->wDisp, DIMINUE);

  // Dessin du cadre
  cmvwaddch(pLST->wDisp, pLST->iTop, pLST->iLeft, szBoxs[0]);
  for (i=1 ; i<pLST->iWidth-1 ; i++ )
	cmvwaddch(pLST->wDisp, pLST->iTop, pLST->iLeft+i, szBoxs[1]);
  cmvwaddch(pLST->wDisp, pLST->iTop, pLST->iLeft+pLST->iWidth-1, szBoxs[2]);

  for (i=1 ; i<pLST->iHeight-1 ; i++)
  { cmvwaddch(pLST->wDisp, pLST->iTop+i, pLST->iLeft, szBoxs[3]);
    cmvwaddch(pLST->wDisp, pLST->iTop+i, pLST->iLeft+pLST->iWidth-1, szBoxs[4]);
  }
  cmvwaddch(pLST->wDisp, pLST->iTop+pLST->iHeight-1, pLST->iLeft, szBoxs[5]);
  for (i=1 ; i<pLST->iWidth-1 ; i++ )
	cmvwaddch(pLST->wDisp, pLST->iTop+pLST->iHeight-1, pLST->iLeft+i, szBoxs[6]);
  cmvwaddch(pLST->wDisp, pLST->iTop+pLST->iHeight-1, pLST->iLeft+pLST->iWidth-1, szBoxs[7]);
  
  // Dessin du contenu de la liste
  AfficheListe(pLST);
}

/*====================================================================*/
// Positionne ListIndex, suite … un changement de propri‚t‚ LISTINDEX,
// LINE ou COLUMN

static int  iSetListIndex(struct CUC_List *pLST, int iProp, int iArg)
{
  if (pLST->iListIndex!=iArg)
  { 
    // Le positionnement de LISTINDEX … -1 efface la s‚lection
	if (iCtrlBornes(szNomClasse, iProp, iArg, -1, pLST->iListCount-1)<0)
	  return -1;
	  
	pLST->iListIndex = iArg;
	  	  
    // Synchronisation de la barre de d‚filement verticale
    if (pLST->iColumns==0 && iArg>=0)
	  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_VALUE, pLST->iListIndex);
	
    if (pLST->iVisible)
    {
	  AfficheListe(pLST);			// R‚affichage de la liste
		  
	  if (pLST->iRaiseEvent != NULL)
	    pLST->iRaiseEvent(pLST->IdBack, CUCE_CHANGE, 0);
	 }
  }
}

/*====================================================================*/
// Cr‚ation du contr“le

// Cr‚ation de la barre de d‚filement verticale
static void CreateVSB(struct CUC_List *pLST)
{
  pLST->pVSB = CUC_VScrollBarCreate(pLST->wDisp, NULL);  
  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_LEFT, pLST->iLeft+pLST->iWidth-1);
  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_TOP, pLST->iTop+1);
  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_WIDTH, 1);
  if (pLST->iHeight>4)
    CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_HEIGHT, pLST->iHeight-2);
  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_MIN, 0);
  if (pLST->iListCount>0)
    CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_MAX, pLST->iListCount-1);
  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_SMALLCHANGE, 1);
  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_VALUE, 0);
  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_CSIZE, 1);
  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_VISIBLE, FALSE);
  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_ENABLED, TRUE);
}

// Cr‚ation de la barre de d‚filement horizontale
static void CreateHSB(struct CUC_List *pLST)
{
  pLST->pHSB = CUC_HScrollBarCreate(pLST->wDisp, NULL);  
  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_LEFT, pLST->iLeft+1);
  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_TOP, pLST->iTop+pLST->iHeight-1);
  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_HEIGHT, 1);
  if (pLST->iWidth>4)
    CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_WIDTH, pLST->iWidth-2);
  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_MIN, 0);
  if (pLST->iListCount>0)
    CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_MAX, (pLST->iListCount-1)/(pLST->iHeight-2));
  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_SMALLCHANGE, 1);
  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_VALUE, 0);
  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_CSIZE, 1);
  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_VISIBLE, FALSE);
  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_ENABLED, TRUE);
}


struct CUC_List *CUC_ListCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))

{
  struct CUC_List *pLST;

  pLST = (struct CUC_List *)malloc(sizeof(struct CUC_List));

  if (pLST==NULL)
  { aprintf("CUC: CUC_ListCreate", "Echec au malloc !");
    return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  strcpy(pLST->szType, szNomType);
  
  pLST->iEnabled = 1;
  pLST->iVisible = 0;			// Cr‚‚ invisible
  pLST->iHasFocus = 0;
  
  pLST->iTop = 0;
  pLST->iLeft = 0;
  pLST->iWidth = 3;
  pLST->iHeight = 3;

  pLST->szTag = NULL;
  pLST->iTabSize = 8;

  pLST->iTabStop = 1;
  pLST->wDisp = w;
  pLST->iRaiseEvent = iRaiseEvent;
  pLST->IdBack = pLST;	// Par d‚faut IdBack est un ptr sur le contr“le
  pLST->Parent = NULL;

  pLST->iColumns = 0;
  pLST->iSorted = 0;
  pLST->iAutoRefresh = 1;
  
  pLST->iListCount = 0;
  pLST->iListIndex = 0;
  pLST->pszItems = NULL;
  
  pLST->iItem0 = 0;
  
  if (pLST->iColumns==0)
    CreateVSB(pLST);
  else
    CreateHSB(pLST);
    
  return pLST;
}

/*====================================================================*/
// Destruction du contr“le

void CUC_ListDestruct(struct CUC_List *pLST)
{ 
  int i;
  
  if (iCtrlTypeLST(pLST, "CUC_ListDestruct", szNomType)<0)
    return;
    
  if (pLST->iColumns==0)
    CUC_VScrollBarDestruct(pLST->pVSB);
  else
    CUC_HScrollBarDestruct(pLST->pHSB);

  if (pLST->szTag!=NULL) free(pLST->szTag);	// On d‚truit le tag...
  
  // Puis la liste des items...
  for (i=0 ; i<pLST->iListCount ; i++)
    free(pLST->pszItems[i]);
  if (pLST->iListCount>0)
    free((char *)pLST->pszItems);
  
  pLST->szType[0] = 0;
  free((void *)pLST);				// puis la structure
}


/*====================================================================*/
// strcmp sur pointeurs de char *

static int pstrcmp(const void *p1, const void *p2)
{
  return strcmp(*(char **)p1, *(char **)p2);
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_ListSetPropNum(struct CUC_List *pLST, int iProp, int iArg)
{
  if (iCtrlTypeLST(pLST, "CUC_ListSetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:
      if (pLST->iLeft!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pLST->iVisible) Efface(pLST);
		pLST->iLeft = iArg;
		if (pLST->iColumns==0)
		  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_LEFT, pLST->iLeft+pLST->iWidth-1);
		else
		  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_LEFT, pLST->iLeft+1);
		if (pLST->iVisible) Affiche(pLST);
      }
      break;

    case CUCP_TOP:
      if (pLST->iTop!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pLST->iVisible) Efface(pLST);
		pLST->iTop = iArg;
	
		if (pLST->iColumns==0)
		  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_TOP, pLST->iTop+1);
		else
		  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_TOP, pLST->iTop+pLST->iHeight-1);

       	if (pLST->iVisible) Affiche(pLST);
      }
      break;

    case CUCP_WIDTH:
      if (pLST->iWidth!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 2, 80)<0)
		  return -1;
		if (pLST->iVisible) Efface(pLST);
		pLST->iWidth = iArg;
	
		if (pLST->iColumns==0)
		  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_LEFT, pLST->iLeft+pLST->iWidth-1);
		else
		  if (pLST->iWidth>4)
		    CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_WIDTH, pLST->iWidth-2);

        if (pLST->iVisible) Affiche(pLST);
      }
      break;

    case CUCP_HEIGHT:
      if (pLST->iHeight!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 3, 25)<0)
		  return -1;
		if (pLST->iVisible) Efface(pLST);
		pLST->iHeight = iArg;
	
		if (pLST->iColumns==0)
		{
		  if (pLST->iHeight>4)
		    CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_HEIGHT, pLST->iHeight-2);
		}
		else
		  CUC_HScrollBarSetPropNum(pLST->pHSB, CUCP_TOP, pLST->iTop+pLST->iHeight-1);
	
		if (pLST->iVisible) Affiche(pLST);
      }
      break;

    case CUCP_VISIBLE:
      if (pLST->iVisible!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
	
		pLST->iVisible = iArg;
	  
        if (iArg==0)
          Efface(pLST);
        else
        {
		  if (pLST->iColumns==0)
		  { 
		    if (pLST->iListCount>0)
		      CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_MAX, pLST->iListCount-1);
		    if (pLST->iListIndex>=0)
			  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_VALUE, pLST->iListIndex);
		  }
          Affiche(pLST);
        }
      }
      break;

    case CUCP_ENABLED:
      if (pLST->iEnabled!=iArg)
      {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		  
		pLST->iEnabled = iArg;
		
		if (pLST->iVisible) Affiche(pLST);
      }
      break;

    case CUCP_TABSTOP:
      pLST->iTabStop = iArg;
      break;

    case CUCP_TABSIZE:
      if (pLST->iTabSize!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 20)<0)
		  return -1;
		pLST->iTabSize = iArg;
		if (pLST->iVisible) AfficheListe(pLST);
      }
      break;

      
    case CUCP_COLUMNS:
      if (pLST->iColumns!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 10)<0)
		  return -1;
	
		// Si on change de type de liste, on cr‚e le contr“le de
		// d‚filement appropri‚
		if ((pLST->iColumns && iArg==0) ||
		    (pLST->iColumns==0 && iArg))
		{
		  if (pLST->iColumns==0)
		  { CUC_VScrollBarDestruct(pLST->pVSB);
		    pLST->pVSB = NULL;
		    CreateHSB(pLST);
		  }
		  else
		  { CUC_HScrollBarDestruct(pLST->pHSB);
		    pLST->pHSB = NULL;
		    CreateVSB(pLST);
		  }
		}
	
		if (pLST->iVisible) Efface(pLST);
		pLST->iColumns = iArg;
		if (pLST->iVisible) Affiche(pLST);
      }
      break;

    case CUCP_SORTED:
      if (pLST->iSorted!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		pLST->iSorted = iArg;
		if (pLST->iSorted)
		{
		  qsort(pLST->pszItems, pLST->iListCount, sizeof(pLST->pszItems[0]), pstrcmp);
		}
		if (pLST->iVisible)
		  AfficheListe(pLST);
      }
      break;

    case CUCP_AUTOREFRESH:
      if (pLST->iAutoRefresh!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		pLST->iAutoRefresh = iArg;
		if (pLST->iVisible && pLST->iAutoRefresh)
		  Affiche(pLST);
      }
      break;
    
    case CUCP_LISTINDEX:
 	  return iSetListIndex(pLST, iProp, iArg);
    
    case CUCP_LINE:
      if (0==pLST->iColumns)
        return iSetListIndex(pLST, iProp, iArg);
	  else      
      { 
        int iNouvListIndex;
        int iValMax;
        
		iNouvListIndex = pLST->iListIndex - pLST->iListIndex%(pLST->iHeight-2) + iArg;
		if (iNouvListIndex>=pLST->iListCount)
		  iValMax = pLST->iListIndex%(pLST->iHeight-2);
		else
		  iValMax = pLST->iHeight-3;
        
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, iValMax)<0)
		  return -1;
		
        return iSetListIndex(pLST, iProp, iNouvListIndex);
	  }
	  break;
      
    case CUCP_COLUMN:
      if (0==pLST->iColumns)
      {
        if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 0)<0)
          return -1;
        // Si on positionne COLUMN … 0, c'est inutile en monocolonne mais
        // on ne dit rien...
      }
      else
      {
        int iNouvListIndex;
        int iValMax;
        
		iNouvListIndex = iArg*(pLST->iHeight-2) + pLST->iListIndex%(pLST->iHeight-2);
		if (iNouvListIndex>=pLST->iListCount)
		  iValMax = pLST->iListCount/(pLST->iHeight-2)-1;
		else
		  iValMax = pLST->iListCount/(pLST->iHeight-2);
		
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, iValMax)<0)
		  return -1;
		
        return iSetListIndex(pLST, iProp, iNouvListIndex);
      }
      break;

    case CUCP_STARTLINE:
      if (0==pLST->iColumns)
      {
        if (iCtrlBornes(szNomClasse, iProp, iArg, 0, pLST->iListCount-1)<0)
          return -1;
        pLST->iItem0 = iArg;
		AfficheListeScroll(pLST, 0);
      }
      else
      {
        if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 0)<0)
          return -1;
      }
      break;
      
    case CUCP_STARTCOLUMN:
      if (0==pLST->iColumns)
      {
        if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 0)<0)
          return -1;
      }
      else
      {
        int iValMax = pLST->iListCount/(pLST->iHeight-2);
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, iValMax)<0)
		  return -1;
		
		pLST->iItem0 = iArg*(pLST->iHeight-2);
		AfficheListeScroll(pLST, 0);
      }
      break;

    case CUCP_FOCUS:
    case CUCP_LISTCOUNT:
      ErrPropLectureSeule(szNomClasse, "SetPropNum", iProp);
      return -1;

    default:
      ErrPropNonGeree(szNomClasse, "SetPropNum", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_ListSetPropStr(struct CUC_List *pLST, int iProp, const char *szVal)
{
  if (iCtrlTypeLST(pLST, "CUC_ListSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pLST->szTag!=NULL) free(pLST->szTag);
      if (szVal==NULL)
		pLST->szTag = NULL;
      else
		pLST->szTag = strdup(szVal);
      break;
      
    case CUCP_TEXT:
      {
        int iIndice = pLST->iListIndex;
        
        if (pLST->iListCount<=0 || pLST->iListIndex<0)
          return -1;
        
        if (pLST->pszItems[iIndice]!=NULL) free(pLST->pszItems[iIndice]);
        if (szVal==NULL)
          pLST->pszItems[iIndice] = NULL;
        else
        {
          pLST->pszItems[iIndice] = strdup(szVal);
          if (pLST->pszItems[iIndice]==NULL)
          { aprintf(szNomClasse, "Echec lors de l'allocation m‚moire|pour stocker l'item !");
            return -1;
          }
        }
		if (pLST->iVisible)
		  AfficheListe(pLST);
      }
      break;

    case CUCP_TYPE:
      ErrPropLectureSeule(szNomClasse, "SetPropStr", iProp);
      return -1;

    default:
      ErrPropNonGeree(szNomClasse, "SetPropStr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}


/*====================================================================*/
// Positionnement d'une propri‚t‚ texte indic‚e

int CUC_ListSetPropStrInd(struct CUC_List *pLST, int iProp, int iIndice, const char *szVal)
{
  if (iCtrlTypeLST(pLST, "CUC_ListSetPropStrInd", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LIST:
      if (iCtrlBornes(szNomClasse, iProp, iIndice, 0, pLST->iListCount-1)<0)
        return -1;
	  
      if (pLST->pszItems[iIndice]!=NULL) free(pLST->pszItems[iIndice]);
      if (szVal==NULL)
        pLST->pszItems[iIndice] = NULL;
      else
      {
        pLST->pszItems[iIndice] = strdup(szVal);
        if (pLST->pszItems[iIndice]==NULL)
        { aprintf(szNomClasse, "Echec lors de l'allocation m‚moire|pour stocker l'item !");
          return -1;
        }
      }
	
      AfficheListe(pLST);
      break;
	
    default:
      ErrPropNonGeree(szNomClasse, "SetPropStrInd", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"

int CUC_ListSetPropPtr(struct CUC_List *pLST, int iProp, void *pArg)
{
  if (iCtrlTypeLST(pLST, "CUC_ListSetPropPtr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_PARENT: pLST->Parent = pArg; break;
    case CUCP_IDBACK: pLST->IdBack = pArg; break;
	case CUCP_WDISP:
	  pLST->wDisp = pArg;
	  if (pLST->iColumns==0)
		CUC_VScrollBarSetPropPtr(pLST->pVSB, CUCP_WDISP, pArg);
	  else
		CUC_HScrollBarSetPropPtr(pLST->pHSB, CUCP_WDISP, pArg);
	  break;

    default:
      ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Lecture d'une propri‚t‚ num‚rique

int CUC_ListGetPropNum(struct CUC_List *pLST, int iProp)
{
  if (iCtrlTypeLST(pLST, "CUC_ListGetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_ENABLED:		return pLST->iEnabled;
    case CUCP_VISIBLE:		return pLST->iVisible && pLST->iAutoRefresh;
    case CUCP_FOCUS:		return pLST->iHasFocus;

    case CUCP_LEFT:			return pLST->iLeft;
    case CUCP_TOP:			return pLST->iTop;
    case CUCP_WIDTH:		return pLST->iWidth;
    case CUCP_HEIGHT:		return pLST->iHeight;

    case CUCP_TABSIZE:		return pLST->iTabSize;

    case CUCP_TABSTOP:		return pLST->iTabStop;
    
    case CUCP_COLUMNS:		return pLST->iColumns;
    case CUCP_SORTED:		return pLST->iSorted;
    case CUCP_AUTOREFRESH:	return pLST->iAutoRefresh;
    case CUCP_LISTINDEX:	return pLST->iListIndex;
    case CUCP_LISTCOUNT:	return pLST->iListCount;

    case CUCP_ACCELERATOR:	return 0;	// pour simplifier le scheduler

    case CUCP_LINE:			return Calcul_CUCP_LINE(pLST);
    case CUCP_COLUMN:		return Calcul_CUCP_COLUMN(pLST);
    case CUCP_STARTLINE:	return Calcul_CUCP_STARTLINE(pLST);
    case CUCP_STARTCOLUMN:	return Calcul_CUCP_STARTCOLUMN(pLST);
    
    default:
      ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}


/*====================================================================*/
// Lecture d'une propri‚t‚ texte
// On ne retourne pas un pointeur sur un champ de donn‚e priv‚,
// mais on copie la chaine … une adresse fournie par l'appellant.
// Routine s‚curis‚e: on gŠre la taille du buffer, et on garantit
// que le buffer se termine par 0.
// Une propri‚t‚ … NULL de fa‡on interne est retourn‚e comme chaŒne nulle.

char *CUC_ListGetPropStr(struct CUC_List *pLST, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlTypeLST(pLST, "CUC_ListGetPropStr", szNomType)<0)
    return NULL;
  Assert(szBuffer!=NULL);

  switch(iProp)
  {
    case CUCP_TAG:
      if (pLST->szTag==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pLST->szTag, iLBuf);
      break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pLST->szType, iLBuf);
      break;

    case CUCP_TEXT:
      if (pLST->iListCount<=0 || pLST->iListIndex<0)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pLST->pszItems[pLST->iListIndex], iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ texte indic‚e

char *CUC_ListGetPropStrInd(struct CUC_List *pLST, int iProp, int iIndice, char *szBuffer, int iLBuf)
{
  if (iCtrlTypeLST(pLST, "CUC_ListGetPropStrInd", szNomType)<0)
    return NULL;
  Assert(szBuffer!=NULL);

  if (iCtrlBornes(szNomClasse, iProp, iIndice, 0, pLST->iListCount-1)<0)
	return NULL;

  switch(iProp)
  {
    case CUCP_LIST:
      if (iCtrlBornes(szNomClasse, iProp, iIndice, 0, pLST->iListCount-1)<0)
        return NULL;
	  
      if (pLST->pszItems[iIndice]==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pLST->pszItems[iIndice], iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_ListGetPropPtr(struct CUC_List *pLST, int iProp)
{
  if (iCtrlTypeLST(pLST, "CUC_ListGetPropPtr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PARENT:	return pLST->Parent;
    case CUCP_IDBACK:	return pLST->IdBack;
	case CUCP_WDISP:  	return pLST->wDisp;
    default:
      ErrPropNonGeree(szNomClasse, "GetPropPtr", iProp);
  }
  return 0;
}

/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

static void DoEventKey(struct CUC_List *pLST, int iKey)
{
  int iOldIndex = pLST->iListIndex;
  int iNb, iPos;
  
  switch(iKey)
  {
    case KEY_UP:
      if (pLST->iListIndex>0)
        pLST->iListIndex--;
      break;
      
    case KEY_DOWN:
      if (pLST->iListIndex+1<pLST->iListCount)
        pLST->iListIndex++;
      break;

	case KEY_RIGHT:
	  pLST->iListIndex += pLST->iHeight-2;
      if (pLST->iListIndex>=pLST->iListCount)
		pLST->iListIndex = pLST->iListCount-1;
	  break;
	
	case KEY_LEFT:
	  pLST->iListIndex -= pLST->iHeight-2;
      if (pLST->iListIndex<0)
		pLST->iListIndex = 0;
	  break;

    case KEY_PGUP:
      pLST->iListIndex -= pLST->iColumns==0 ? pLST->iHeight-2 : pLST->iColumns*(pLST->iHeight-2);
      if (pLST->iListIndex<0) pLST->iListIndex = 0;
      break;

    case KEY_PGDN:
      pLST->iListIndex += pLST->iColumns==0 ? pLST->iHeight-2 : pLST->iColumns*(pLST->iHeight-2);
      if (pLST->iListIndex>=pLST->iListCount) pLST->iListIndex = pLST->iListCount-1;
      break;

    case KEY_HOME:
      pLST->iListIndex = 0;
      break;

    case KEY_END:
      pLST->iListIndex = pLST->iListCount-1;
      break;
      
    default:
      if (pLST->pszItems==NULL)
        break;
      iNb = 0;
      iPos = pLST->iListIndex;
      for(; ;)
      {
        iNb++;
        if (iNb>pLST->iListCount) break;
        iPos = (iPos+1)%pLST->iListCount;

        if (pLST->pszItems[iPos]!=NULL)
		{
		  int j;
		  for(j=0;pLST->pszItems[iPos][j]; j++) 
			if(pLST->pszItems[iPos][j]!='\t' && 
			   pLST->pszItems[iPos][j]!=' ') break;
          if (toupper(pLST->pszItems[iPos][j])==toupper(iKey))
          { pLST->iListIndex = iPos;
            break;
		  }
		}
      }
      break;  
  }
    
  if (pLST->iListIndex!=iOldIndex)
  { 
    if (pLST->iColumns==0 && pLST->iListIndex>=0)
      CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_VALUE, pLST->iListIndex);
	if (pLST->iVisible)
	  AfficheListe(pLST);
    if (pLST->iRaiseEvent != NULL)
      pLST->iRaiseEvent(pLST->IdBack, CUCE_CHANGE, 0);
  }
}

/*====================================================================*/
// DoEventDump: traite l'‚v‚nement CUCE_DUMP

static void DoEventDump(struct CUC_List *pLST)
{
  char szTitre[60];
  
  sprintf(szTitre, "DUMP CUC_List @%p", pLST);
  aprintf(szTitre,
    "szType:       %-3s        iTop:       %-3d|"
    "iEnabled:     %-3d        iLeft:      %-3d|"
    "iVisible:     %-3d        iWidth:     %-3d|"
    "iHasFocus:    %-3d        iHeight:    %-3d|"
    "wDisp:        %-9p  IdBack:     %-9p|"
#ifdef unix
    "iRaiseEvent:  %-9p  Parent:     %-9p|"
#else
    "iRaiseEvent:  %Fp  Parent:     %-9p|"
#endif
    "pHSB:         %-9p  pVSB:       %-9p|"
    "iTabSize:     %-3d        iTabStop:   %-3d|"
    "iColumns:     %-3d        iSorted:    %-3d|"
    "iAutoRefresh: %-3d        iItem0:     %-3d|"
    "iListCount:   %-3d        iListIndex: %-3d|"
    "iPosX:        %-3d        iPosY:      %-3d|"
    "Column:       %-3d        Line:       %-3d|"
    "StartColumn:  %-3d        StartLine:  %-3d|"
    "pszItems:     %-9p  Tag:        %.10s",
    pLST->szType,			pLST->iTop,
    pLST->iEnabled,			pLST->iLeft,
    pLST->iVisible,			pLST->iWidth,
    pLST->iHasFocus,		pLST->iHeight,
    pLST->wDisp,			pLST->IdBack,
    pLST->iRaiseEvent,		pLST->Parent,
    pLST->pHSB,				pLST->pVSB,
    pLST->iTabSize,			pLST->iTabStop,
    pLST->iColumns,			pLST->iSorted,
    pLST->iAutoRefresh,		pLST->iItem0,
    pLST->iListCount,		pLST->iListIndex,
    pLST->iPosX,			pLST->iPosY,
    Calcul_CUCP_COLUMN(pLST), Calcul_CUCP_LINE(pLST),
    Calcul_CUCP_STARTCOLUMN(pLST), Calcul_CUCP_STARTLINE(pLST),
    pLST->pszItems,         pLST->szTag);
}

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_ListDoEvent(struct CUC_List *pLST, int iEvent, int iArg)
{

  if (iCtrlTypeLST(pLST, "CUC_ListDoEvent", szNomType)<0)
    return -1;

  switch(iEvent)
  {
    case CUCE_KEY:
      if (pLST->iEnabled)
		DoEventKey(pLST, iArg);
      break;

    case CUCE_DUMP:
	  DoEventDump(pLST);
      break;

    case CUCE_GOTFOCUS:
      if (pLST->iVisible && pLST->iEnabled)
      { pLST->iHasFocus = 1;
		Affiche(pLST);
      }
      break;

    case CUCE_LOSTFOCUS:
      if (pLST->iVisible && pLST->iEnabled)
      { pLST->iHasFocus = 0;
		Affiche(pLST);
      }
      break;

    default:
      aprintf("CUC: CUC_ListDoEvent", "Ev‚nement %d inconnu !", iEvent);
      break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_ListMove(struct CUC_List *pLST, int iTop, int iLeft)
{
  if (iCtrlTypeLST(pLST, "CUC_ListMove", szNomType)<0)
    return -1;

  if (pLST->iLeft!=iLeft || pLST->iTop!=iTop)
  { 
    if (pLST->iVisible) Efface(pLST);
    pLST->iLeft = iLeft;
    pLST->iTop = iTop;
    if (pLST->iVisible) Affiche(pLST);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_ListResize(struct CUC_List *pLST, int iHeight, int iWidth)
{
  if (iCtrlTypeLST(pLST, "CUC_ListResize", szNomType)<0)
    return -1;

  if (pLST->iWidth!=iWidth || pLST->iHeight!=iHeight)
  { 
    if (pLST->iVisible) Efface(pLST);
    pLST->iWidth = iWidth;
    pLST->iHeight = iHeight;
    if (pLST->iVisible) Affiche(pLST);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine
// Ignore la propri‚t‚ visible !!!

int CUC_ListRefresh(struct CUC_List *pLST)
{
  if (iCtrlTypeLST(pLST, "CUC_ListRefresh", szNomType)<0)
    return -1;

  Affiche(pLST);
}

/*====================================================================*/
// M‚thode AddItem: Ajout d'un ‚l‚ment dans la liste
// Si iPos==-1, l'ajout a lieu en fin de liste

int CUC_ListAddItem(struct CUC_List *pLST, const char *szElement, int iPos)
{
  char	**p;
  int	i;
  
  if (iCtrlTypeLST(pLST, "CUC_ListAddItem", szNomType)<0)
    return -1;

  // Calcul de la position d'insertion
  if (iPos<0 || iPos>=pLST->iListCount)
  {
    if (pLST->iSorted)
    {
      iPos = 0;
      while (iPos < pLST->iListCount && strcmp(szElement, pLST->pszItems[iPos] ? pLST->pszItems[iPos] : "")>0)
	iPos++;
    }
    else
      iPos = pLST->iListCount;
  }

  // Allocation de la m‚moire pour la liste des pointeurs d'items
  if (pLST->iListCount==0)
    p = (char **)malloc((pLST->iListCount+1)*sizeof(char *));
  else
    p = (char **)realloc(pLST->pszItems, (pLST->iListCount+1)*sizeof(char *));
  
  if (p==NULL)
  { aprintf(szNomClasse, "M‚thode AddItem:|Echec lors de l'allocation de m‚moire|pour stocker la liste des items");
    return -1;
  }
  pLST->pszItems = p;
  
  // D‚calage des ‚l‚ments de la liste pour ins‚rer le nouveau
  for (i=pLST->iListCount-1 ; i>=iPos ; i--)
    pLST->pszItems[i+1] = pLST->pszItems[i];
  
  // Stockage de l'‚l‚ment … ajouter
  if (szElement==NULL)
    p[iPos] = NULL;
  else
    p[iPos] = strdup(szElement);
    if (p[iPos]==NULL)
    { aprintf(szNomClasse, "M‚thode AddItem:|Echec lors de l'allocation m‚moire|pour stocker l'item !");
      return -1;
    }
  pLST->iListCount++;
  if (pLST->iListIndex<0) pLST->iListIndex = 0;
  
  // Mise … jour de la barre de d‚filement
  if (pLST->iColumns==0)
  {
    if (pLST->iListCount>1)
      CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_MAX, pLST->iListCount-1);
  }
  
  // Et r‚affichage ‚ventuel
  if (pLST->iVisible && pLST->iAutoRefresh)
    AfficheListe(pLST);
  
  return 0;
}

/*====================================================================*/
// M‚thode RemoveItem: Retrait d'un ‚l‚ment dans la liste
// Si iPos==-1, c'est l'‚l‚ment courant qui est retir‚

int CUC_ListRemoveItem(struct CUC_List *pLST, int iPos)
{
  char **p;
  int i;
  
  if (iCtrlTypeLST(pLST, "CUC_ListRemoveItem", szNomType)<0)
    return -1;

  if (pLST->iListCount==0)
  { aprintf(szNomClasse, "M‚thode RemoveItem:|La liste est d‚j… vide !");
    return -1;
  }

  if (iPos<0) iPos = pLST->iListIndex;
      
  if (pLST->pszItems[iPos]!=NULL)
    free(pLST->pszItems[iPos]);			// Lib‚ration de l'item
    
  for (i=iPos+1 ; i<pLST->iListCount ; i++)	// D‚calage les pointeurs
    pLST->pszItems[i-1] = pLST->pszItems[i];
  
  pLST->iListCount--;
  if (pLST->iListIndex>=pLST->iListCount)
    pLST->iListIndex = pLST->iListCount-1;
  
  if (pLST->iListCount==0)
  { free(pLST->pszItems);
    p = NULL;
  }
  else
  {
    p = (char **)realloc(pLST->pszItems, (pLST->iListCount)*sizeof(char *));
    if (p==NULL)
    { aprintf(szNomClasse, "M‚thode RemoveItem:|Echec lors de l'allocation de m‚moire|pour stocker la liste des items");
      return -1;
    }
  }
  pLST->pszItems = p;
  
  // Mise … jour de la barre de d‚filement
  if (pLST->iColumns==0)
  {
    if (pLST->iListCount>1)
      CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_MAX, pLST->iListCount-1);
  }

  if (pLST->iVisible && pLST->iAutoRefresh)
    AfficheListe(pLST);
  
  return 0;
}


/*====================================================================*/
// M‚thode Clear: Efface complŠtement la liste

int CUC_ListClear(struct CUC_List *pLST)
{
  int i;
  
  if (iCtrlTypeLST(pLST, "CUC_ListClear", szNomType)<0)
    return -1;
    
  if (pLST->iListCount>0)
  {
    for (i=0 ; i<pLST->iListCount ; i++)
    if (pLST->pszItems[i]!=NULL)
      free(pLST->pszItems[i]);		// Lib‚ration de l'item

    free(pLST->pszItems);
    pLST->pszItems = NULL;
    pLST->iListCount = 0;
    pLST->iListIndex = 0;
    pLST->iItem0 = 0;

	if (pLST->iColumns==0)
	{
	  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_VALUE, 0);
	  CUC_VScrollBarSetPropNum(pLST->pVSB, CUCP_MAX, 1);
	}
  }

  if (pLST->iVisible && pLST->iAutoRefresh)
    AfficheListe(pLST);
  
  return 0;
}

//====================================================================
// M‚thode DisplayCursor : R‚affiche le curseur clignotant

int CUC_ListDisplayCursor(struct CUC_List *pLST)
{
  if (iCtrlTypeLST(pLST, "CUC_ListDisplayCursor", szNomType)<0)
    return -1;

  wmove(pLST->wDisp, pLST->iPosY, pLST->iPosX);
  return 0;
}

