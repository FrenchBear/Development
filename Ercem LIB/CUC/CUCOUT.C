/* cucout.c
** Impl‚mentation du contr“le Outline de la bibliothŠque CUC
** 26/12/94 PV	Cr‚ation
**  4/01/95 PV	Synchronisation correcte de la liste d'affichage
**  5/01/95 PV	RemoveItem ote une branche complete
*/

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

//static UC szBoxsAnsi[] = "ÚÄ¿³³ÀÄÙ";

static char szNomClasse[] = "CUC Outline";
static char szNomType[]   = "OUT";

struct OutItem
{
  char	*szLibelle;
  short	hIndent;
  short	hExpand;
  short	hVisible;
  int	iIndexAff;
};

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_Outline
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
  struct OutItem *pItems;	// Tableau des items

  int	iStyle;			// 0:Sans traits ni +-  1:traits 2:+- 3:traits+-
  int	iAutoRefresh;	// Si vrai, le contr“le se redessine seul
  int	iListCount;		// Nb d'‚l‚ments dans la liste
  int	iListIndex;		// Item actuellement s‚lectionn‚

  int	iAffCount;		// Nb de lignes affich‚es
  int	iAffIndex;		// Index de l'item s‚lectionn‚
  int	iAffItem0;		// No de la premiŠre ligne affich‚e

  char	cSeparator;		// S‚parateur pour r‚cup‚rer FULLPATH

  // Champs priv‚s
  int	iPosX;
  int	iPosY;
  struct CUC_VScrollBar *pVSB;	// Barre de d‚filement verticale
};

// Jeu de macros pour d‚duire 2 propri‚t‚s qui ne sont pas stock‚es
// directement
#define Calcul_CUCP_LINE(pOUT)        (pOUT->iListIndex)
#define Calcul_CUCP_STARTLINE(pOUT)   (pOUT->iAffItem0)

/*====================================================================*/
// Contr“le de type "pouss‚" pour aider le d‚bogage...

#define iCtrlTypeOUT(p, f, n) iCtrlType(p,f,n)

/*====================================================================*/
// Convertit un indice de liste d'affichage en indice de liste

//#define iAffToList(pOUT, iInd) pOUT->pItems[iInd].iIndexAff
int iAffToList(struct CUC_Outline *pOUT, int iInd)
{
  int iIxAff;

  //Assert((iInd>=0 && iInd<pOUT->iAffCount);
  if (!(iInd>=0 && iInd<pOUT->iAffCount))
	aprintf("", "iInd:%d  pOUT->iAffCount:%d", iInd, pOUT->iAffCount);
  iIxAff = pOUT->pItems[iInd].iIndexAff;
  //Assert(iIxAff>=0 && iIxAff<pOUT->iAffCount);
  if (!(iIxAff>=0 && iIxAff<pOUT->iListCount))
    aprintf("", "iInd:%d iIxAff:%d iAffCount:%d\r\n", iInd, iIxAff, pOUT->iAffCount);
  return iIxAff;
}

// Macro retournant vrai si des items subordonn‚s sont rattach‚s
// … l'item de rang de liste iInd

#define HasSubItems(pOUT, iInd) ((iInd==pOUT->iListCount-1) ? 0 : (pOUT->pItems[iInd+1].hIndent>pOUT->pItems[iInd].hIndent))

/*====================================================================*/
// Efface completement le contr“le de l'‚cran (affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver derriŠre (en dessous)

static void Efface(struct CUC_Outline *pOUT)
{
  if (iOkWDisp(pOUT->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pOUT->wDisp, pOUT->iTop, pOUT->iLeft, pOUT->iHeight, pOUT->iWidth);
}

/*====================================================================*/

// Retourne l'indice (sur la liste complŠte) du parent de niveau
// iNiv de l'item d'indice iRang
static int Parent(struct CUC_Outline *pOUT, int iRang, int iNiv)
{
  while (iRang>0 && pOUT->pItems[iRang].hIndent!=(short)iNiv)
	iRang--;
  return iRang;
}

static int DernierFils(struct CUC_Outline *pOUT, int iRang)
{
  int iNiv = pOUT->pItems[iRang].hIndent;
  int iFils = -1;

  iRang++;
  while (iRang<pOUT->iListCount && pOUT->pItems[iRang].hIndent>(short)iNiv)
  { if (pOUT->pItems[iRang].hIndent==(short)(iNiv+1))
	  iFils = iRang;
	iRang++;
  }
  return iFils;
}

/*====================================================================*/
// Redessine le contr“le aprŠs un changement de valeur
// Si bOkScroll est vrai, la liste est 'scroll‚e' de fa‡on … ce
// que la s‚lection soit visible

static void AfficheOutlineScroll(struct CUC_Outline *pOUT, int bOkScroll)
{
  int	i, j;                         
  UC	*p;
  int	iLg;
  int	nbItAff;	// Nb d'items affich‚s dans le controle
  int	iCol;		// Colonne d'affichage de l'item
  int	iNbCol;		// Largeur d'affichage d'un item
  char	szLigne[81];

  if (iOkWDisp(pOUT->wDisp, szNomClasse, "AfficheOutline")<0) return;

  // Calcul du nombre d'items affich‚s par le contr“le
  nbItAff = pOUT->iHeight-2;

  // Recalage du 1er item affich‚ de la liste
  if (bOkScroll)
  {
	if (pOUT->iAffIndex < pOUT->iAffItem0)
	{ pOUT->iAffItem0 = pOUT->iAffIndex-pOUT->iHeight/2+1;
	  if (pOUT->iAffItem0 < 0) pOUT->iAffItem0 = 0;
	}
	else if (pOUT->iAffIndex >= pOUT->iAffItem0+pOUT->iHeight-2)
	{ pOUT->iAffItem0 = pOUT->iAffIndex-pOUT->iHeight/2+1;
	  if (pOUT->iAffItem0 < 0) pOUT->iAffItem0 = 0;
	}
  }
  
  if (!pOUT->iEnabled) wattron(pOUT->wDisp, DIMINUE);

  pOUT->iPosY = pOUT->iPosX = -1;

  // Affichage de l'ensemble des items potentiellement affich‚s dans la liste
  for (i=0 ; i<nbItAff ; i++)
  {
	int iLigAff, iColAff;
	int iP, iGP;
	int car;
	int iNiv;
	int	iOffSize;
	int iOffset;

    // Calcul de la position (caractŠre) de la colonne d'affichage dans
    // la liste, et la taille en caractŠres de la colonne
	iNbCol = pOUT->iWidth-2;

    iLigAff = pOUT->iTop+i+1;
	iColAff = pOUT->iLeft+1;

    if (i+pOUT->iAffItem0 < pOUT->iAffCount)
    {
	  int iList = iAffToList(pOUT, i+pOUT->iAffItem0);

      if (iList==pOUT->iListIndex)
	  { wattron(pOUT->wDisp, INVERSE);
		pOUT->iPosY = iLigAff;
		pOUT->iPosX = iColAff;
	  }

      // Affichage du texte de l'item
      p = pOUT->pItems[iList].szLibelle ? pOUT->pItems[iList].szLibelle : "";

	  switch (pOUT->iStyle)
	  {
		case 0:
		  iOffSize = 0;
		  iOffset = 0;
		  break;
		case 1:
		  iOffSize = 2;
		  iOffset = 0;
		  break;
		case 2:
		  iOffSize = 0;
		  iOffset = 1;
		  break;
		case 3:
		  iOffSize = 3;
		  iOffset = 1;
		  break;
	  }

	  iNiv = pOUT->pItems[iList].hIndent;
	  iCol = iOffSize*iNiv + iOffset;
	  for (j=0 ; j<iCol ; j++)
		szLigne[j] = ' ';

	  if (iOffSize)		// Arbre
	  {
		if (iNiv>0)
		{
		  for (j=1 ; j<iNiv ; j++)
		  {
			iP = Parent(pOUT, iList, j);
			iGP = Parent(pOUT, iList, j-1);

			if (iP==DernierFils(pOUT, iGP))
			  car = ' ';
			else
			  car = '³';
			szLigne[iOffSize*(j-1)+iOffset] = (char)car;
		  }
		  iP = Parent(pOUT, iList, iNiv-1);
		  if (iList==DernierFils(pOUT, iP))
			car = 'À';
		  else
			car = 195;	// T couch‚
		  szLigne[iOffSize*(iNiv-1)+iOffset] = (char)car;
		}
	  }

	  if (iOffset)		// + et -
	  {
		szLigne[iOffSize*iNiv] = (char)(HasSubItems(pOUT, iList) ?
		  (pOUT->pItems[iList].hExpand ? '-' : '+') : ' ');
	  }

      iLg = iCol;
      while (iLg<iNbCol && *p && *p!='\n' && *p!='\r')
	  {
		if (*p!='\t')
		{ szLigne[iCol] = *p;
		  iCol++;
		  iLg++;
		}
		else	// Expansion des tabs en espaces
		  do
		  { szLigne[iCol] = ' ';
			iCol++;
			iLg++;
		  }
		  while (iLg%pOUT->iTabSize && iLg<iNbCol);
		  p++;
	  }
      
      // On complŠte avec des espaces
      while(iLg < iNbCol)
      { szLigne[iCol] = ' ';
		iCol++;
		iLg++;
      }
	  szLigne[iCol] = 0;

	  cmvwaddstr(pOUT->wDisp, iLigAff, iColAff, szLigne);
      if (iList==pOUT->iListIndex) wattroff(pOUT->wDisp, INVERSE);
    }
    else	// On efface aprŠs le dernier item
      for (j=0 ; j<iNbCol ; j++)
        cmvwaddch(pOUT->wDisp, iLigAff, iColAff++, ' ');
  }
  
  // Dessin ou effacement des barres de d‚filement
  if (pOUT->iHeight>4 && (pOUT->iAffCount>pOUT->iHeight-2 || pOUT->iAffItem0>0))
  {
	if (pOUT->iAffCount>0)
	{
	  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_VALUE, pOUT->iAffIndex);
	  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_MAX, pOUT->iAffCount-1);
	  CUC_VScrollBarRefresh(pOUT->pVSB);
	}
  }
  else
	for (i=1 ; i<pOUT->iHeight-1 ; i++)
	  cmvwaddch(pOUT->wDisp, pOUT->iTop+i, pOUT->iLeft+pOUT->iWidth-1, szBoxs[4]);


  if (!pOUT->iEnabled) wattroff(pOUT->wDisp, DIMINUE);

  if (pOUT->iPosY>=0) wmove(pOUT->wDisp, pOUT->iPosY, pOUT->iPosX);
}

static void AfficheOutline(struct CUC_Outline *pOUT)
{
  AfficheOutlineScroll(pOUT, 1);
}

/*====================================================================*/
// Redessine complŠtement le contr“le

static void Affiche(struct CUC_Outline *pOUT)
{
  int i;

  if (iOkWDisp(pOUT->wDisp, szNomClasse, "Affiche")<0) return;

  if (!pOUT->iEnabled) wattron(pOUT->wDisp, DIMINUE);

  // Dessin du cadre
  cmvwaddch(pOUT->wDisp, pOUT->iTop, pOUT->iLeft, szBoxs[0]);
  for (i=1 ; i<pOUT->iWidth-1 ; i++ )
	cmvwaddch(pOUT->wDisp, pOUT->iTop, pOUT->iLeft+i, szBoxs[1]);
  cmvwaddch(pOUT->wDisp, pOUT->iTop, pOUT->iLeft+pOUT->iWidth-1, szBoxs[2]);

  for (i=1 ; i<pOUT->iHeight-1 ; i++)
  { cmvwaddch(pOUT->wDisp, pOUT->iTop+i, pOUT->iLeft, szBoxs[3]);
    cmvwaddch(pOUT->wDisp, pOUT->iTop+i, pOUT->iLeft+pOUT->iWidth-1, szBoxs[4]);
  }
  cmvwaddch(pOUT->wDisp, pOUT->iTop+pOUT->iHeight-1, pOUT->iLeft, szBoxs[5]);
  for (i=1 ; i<pOUT->iWidth-1 ; i++ )
	cmvwaddch(pOUT->wDisp, pOUT->iTop+pOUT->iHeight-1, pOUT->iLeft+i, szBoxs[6]);
  cmvwaddch(pOUT->wDisp, pOUT->iTop+pOUT->iHeight-1, pOUT->iLeft+pOUT->iWidth-1, szBoxs[7]);
  
  // Dessin du contenu de la liste
  AfficheOutline(pOUT);
}

/*====================================================================*/
// SynchroAff
// Suite … une modification de la liste, resynchronise la table
// des index d'affichage

static void SynchroAff(struct CUC_Outline *pOUT)
{
  int	i;
  int	iLigne = 0;

  for (i=0 ; i<pOUT->iListCount ; i++)
  {
	if (pOUT->iListIndex==i)
	{ Assert(pOUT->pItems[i].hVisible);
	  pOUT->iAffIndex = iLigne;
	}
	if (pOUT->pItems[i].hVisible)
	  pOUT->pItems[iLigne++].iIndexAff = i;
  }
  pOUT->iAffCount = iLigne;
}

/*====================================================================*/
// Positionne ListIndex, suite … un changement de propri‚t‚
// LISTINDEX ou LINE

static int iSetListIndex(struct CUC_Outline *pOUT, int iProp, int iArg)
{
  if (pOUT->iListIndex!=iArg)
  { 
    // Le positionnement de LISTINDEX … -1 efface la s‚lection
	if (iCtrlBornes(szNomClasse, iProp, iArg, -1, pOUT->iListCount-1)<0)
	  return -1;
	  
	pOUT->iListIndex = iArg;

	// Synchronisation de la liste d'affichage
	SynchroAff(pOUT);
	  	  
    if (pOUT->iVisible)
    {
	  AfficheOutline(pOUT);			// R‚affichage de la liste
		  
	  if (pOUT->iRaiseEvent != NULL)
	    pOUT->iRaiseEvent(pOUT->IdBack, CUCE_CHANGE, 0);
	 }
  }
}

/*====================================================================*/
// Cr‚ation du contr“le

// Cr‚ation de la barre de d‚filement verticale
static void CreateVSB(struct CUC_Outline *pOUT)
{
  pOUT->pVSB = CUC_VScrollBarCreate(pOUT->wDisp, NULL);  
  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_LEFT, pOUT->iLeft+pOUT->iWidth-1);
  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_TOP, pOUT->iTop+1);
  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_WIDTH, 1);
  if (pOUT->iHeight>4)
    CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_HEIGHT, pOUT->iHeight-2);
  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_MIN, 0);
  if (pOUT->iListCount>0)
    CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_MAX, pOUT->iListCount-1);
  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_SMALLCHANGE, 1);
  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_VALUE, 0);
  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_CSIZE, 1);
  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_VISIBLE, FALSE);
  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_ENABLED, TRUE);
}


struct CUC_Outline *CUC_OutlineCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))

{
  struct CUC_Outline *pOUT;

  pOUT = (struct CUC_Outline *)malloc(sizeof(struct CUC_Outline));

  if (pOUT==NULL)
  { aprintf("CUC: CUC_OutlineCreate", "Echec au malloc !");
    return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  strcpy(pOUT->szType, szNomType);
  
  pOUT->iEnabled = 1;
  pOUT->iVisible = 0;			// Cr‚‚ invisible
  pOUT->iHasFocus = 0;
  
  pOUT->iTop = 0;
  pOUT->iLeft = 0;
  pOUT->iWidth = 3;
  pOUT->iHeight = 3;

  pOUT->szTag = NULL;
  pOUT->iTabSize = 8;

  pOUT->iTabStop = 1;
  pOUT->wDisp = w;
  pOUT->iRaiseEvent = iRaiseEvent;
  pOUT->IdBack = pOUT;	// Par d‚faut IdBack est un ptr sur le contr“le
  pOUT->Parent = NULL;

  pOUT->iStyle = 3;
  pOUT->iAutoRefresh = 1;
  
  pOUT->pItems = NULL;

  pOUT->iListCount = 0;
  pOUT->iListIndex = 0;
  pOUT->iAffCount = 0;
  pOUT->iAffIndex = 0;
  pOUT->iAffItem0 = 0;

  pOUT->cSeparator = '\\';
  
  CreateVSB(pOUT);
    
  return pOUT;
}

/*====================================================================*/
// Destruction du contr“le

void CUC_OutlineDestruct(struct CUC_Outline *pOUT)
{ 
  int i;
  
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineDestruct", szNomType)<0)
    return;
    
  CUC_VScrollBarDestruct(pOUT->pVSB);

  if (pOUT->szTag!=NULL) free(pOUT->szTag);	// On d‚truit le tag...
  
  // Puis la liste des items...
  for (i=0 ; i<pOUT->iListCount ; i++)
    free(pOUT->pItems[i].szLibelle);
  if (pOUT->iListCount>0)
    free((char *)pOUT->pItems);
  
  pOUT->szType[0] = 0;
  free((void *)pOUT);				// puis la structure
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_OutlineSetPropNum(struct CUC_Outline *pOUT, int iProp, int iArg)
{
  static char _f_[] = "CUC_OutlineSetPropNum";
  
  if (iCtrlTypeOUT(pOUT, _f_, szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:
      if (pOUT->iLeft!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pOUT->iVisible) Efface(pOUT);
		pOUT->iLeft = iArg;
		CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_LEFT, pOUT->iLeft+pOUT->iWidth-1);
		if (pOUT->iVisible) Affiche(pOUT);
      }
      break;

    case CUCP_TOP:
      if (pOUT->iTop!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pOUT->iVisible) Efface(pOUT);
		pOUT->iTop = iArg;
	
		CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_TOP, pOUT->iTop+1);

       	if (pOUT->iVisible) Affiche(pOUT);
      }
      break;

    case CUCP_WIDTH:
      if (pOUT->iWidth!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 2, 80)<0)
		  return -1;
		if (pOUT->iVisible) Efface(pOUT);
		pOUT->iWidth = iArg;
	
		CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_LEFT, pOUT->iLeft+pOUT->iWidth-1);

        if (pOUT->iVisible) Affiche(pOUT);
      }
      break;

    case CUCP_HEIGHT:
      if (pOUT->iHeight!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 3, 25)<0)
		  return -1;
		if (pOUT->iVisible) Efface(pOUT);
		pOUT->iHeight = iArg;
	
		if (pOUT->iHeight>4)
		  CUC_VScrollBarSetPropNum(pOUT->pVSB, CUCP_HEIGHT, pOUT->iHeight-2);
	
		if (pOUT->iVisible) Affiche(pOUT);
      }
      break;

    case CUCP_VISIBLE:
      if (pOUT->iVisible!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
	
		pOUT->iVisible = iArg;
	  
        if (iArg==0)
          Efface(pOUT);
        else
        {
		  // On r‚g‚nŠre la liste d'affichage
		  SynchroAff(pOUT);
          Affiche(pOUT);
        }
      }
      break;

    case CUCP_ENABLED:
      if (pOUT->iEnabled!=iArg)
      {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		  
		pOUT->iEnabled = iArg;
		
		if (pOUT->iVisible) Affiche(pOUT);
      }
      break;

    case CUCP_TABSTOP:
      pOUT->iTabStop = iArg;
      break;

    case CUCP_TABSIZE:
      if (pOUT->iTabSize!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 20)<0)
		  return -1;
		pOUT->iTabSize = iArg;
		if (pOUT->iVisible) AfficheOutline(pOUT);
      }
      break;

    case CUCP_AUTOREFRESH:
      if (pOUT->iAutoRefresh!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		pOUT->iAutoRefresh = iArg;
		if (pOUT->iVisible && pOUT->iAutoRefresh)
		  Affiche(pOUT);
      }
      break;

    case CUCP_STYLE:
      if (pOUT->iStyle!=iArg)
      { 
		pOUT->iStyle = iArg;
		AfficheOutline(pOUT);
	  }
	  break;
    
    case CUCP_LISTINDEX:
 	  return iSetListIndex(pOUT, iProp, iArg);
    
    case CUCP_LINE:
	  return iSetListIndex(pOUT, iProp, iArg);
      
    case CUCP_STARTLINE:
	  if (iCtrlBornes(szNomClasse, iProp, iArg, 0, pOUT->iListCount-1)<0)
		return -1;
	  pOUT->iAffItem0 = iArg;
	  AfficheOutlineScroll(pOUT, 0);
      break;

	case CUCP_AFFINDEX:
	  if (iCtrlBornes(szNomClasse, iProp, iArg, 0, pOUT->iAffCount-1)<0)
		return -1;
 	  return iSetListIndex(pOUT, iProp, iAffToList(pOUT, iArg));

	case CUCP_SEPARATOR:
	  if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 255)<0)
		return -1;
	  pOUT->cSeparator = (char)iArg;
	  break;
      
    case CUCP_FOCUS:
    case CUCP_LISTCOUNT:
    case CUCP_AFFCOUNT:
      ErrPropLectureSeule(szNomClasse, _f_, iProp);
      return -1;

    default:
      ErrPropNonGeree(szNomClasse, _f_, iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Traite le r‚sultat d'une expansion ou d'une fermeture
// Met … jour les propri‚t‚s EXPAND et ISITEMVISIBLE des items
// subordon‚s

static void DoExpand(struct CUC_Outline *pOUT, int iInd)
{
  short hExpand = pOUT->pItems[iInd].hExpand;
  short hIndent = pOUT->pItems[iInd].hIndent;

  iInd++;
  while (iInd<pOUT->iListCount && pOUT->pItems[iInd].hIndent>hIndent)
  { 
	if (0==hExpand)
	{
	  pOUT->pItems[iInd].hExpand = 0;
	  pOUT->pItems[iInd].hVisible = 0;
	}
	else
	{
	  if (pOUT->pItems[iInd].hIndent == (short)(hIndent+1))
		pOUT->pItems[iInd].hVisible = 1;
	}
	iInd++;
  }
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique indic‚e

int CUC_OutlineSetPropNumInd(struct CUC_Outline *pOUT, int iProp, int iInd, int iVal)
{
  static char _f_[] = "CUC_OutlineSetPropNumInd";

  if (iCtrlTypeOUT(pOUT, _f_, szNomType)<0)
    return -1;

  // On v‚rifie que l'indice est correct...
  if (iCtrlBornes(szNomClasse, iProp, iInd, 0, pOUT->iListCount-1)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_INDENT:
	  if (pOUT->pItems[iInd].hIndent != (short)iVal)
	  {
		if (0==iInd)
		{ if (iCtrlBornes(szNomClasse, iProp, iVal, 0, 1)<0)
			return -1;
		}
		else
		{ if (iCtrlBornes(szNomClasse, iProp, iInd, 0, pOUT->pItems[iInd-1].hIndent+1)<0)
			return -1;
		}

		pOUT->pItems[iInd].hIndent = (short)iVal;

		// R‚affichage ‚ventuel
		if (pOUT->iVisible && pOUT->iAutoRefresh)
		  AfficheOutline(pOUT);
	  }
	  break;

	case CUCP_EXPAND:
	  if (pOUT->pItems[iInd].hExpand != (short)iVal)
	  { if (iCtrlBornes(szNomClasse, iProp, iVal, 0, 1)<0)
		  return -1;
		pOUT->pItems[iInd].hExpand = (short)iVal;

		// Mise … jour de la propri‚t‚ IsItemVisible des items
		// subordon‚s
		DoExpand(pOUT, iInd);

		// On r‚g‚nŠre la liste d'affichage
		SynchroAff(pOUT);

		// r‚affichage
		if (pOUT->iVisible && pOUT->iAutoRefresh)
		  AfficheOutline(pOUT);
	  }
	  break;

	case CUCP_HASSUBITEMS:
	case CUCP_ISITEMVISIBLE:
      ErrPropLectureSeule(szNomClasse, _f_, iProp);
	  return -1;

    default:
      ErrPropNonGeree(szNomClasse, _f_, iProp);
  }
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_OutlineSetPropStr(struct CUC_Outline *pOUT, int iProp, const char *szVal)
{
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pOUT->szTag!=NULL) free(pOUT->szTag);
      if (szVal==NULL)
		pOUT->szTag = NULL;
      else
		pOUT->szTag = strdup(szVal);
      break;
      
    case CUCP_TEXT:
      {
        int iIndice = pOUT->iListIndex;
        
        if (pOUT->iListCount<=0 || pOUT->iListIndex<0)
          return -1;
        
        if (pOUT->pItems[iIndice].szLibelle!=NULL)
		  free(pOUT->pItems[iIndice].szLibelle);
        if (szVal==NULL)
          pOUT->pItems[iIndice].szLibelle = NULL;
        else
        {
          pOUT->pItems[iIndice].szLibelle = strdup(szVal);
          if (pOUT->pItems[iIndice].szLibelle==NULL)
          { aprintf(szNomClasse, "Echec lors de l'allocation m‚moire|pour stocker l'item !");
            return -1;
          }
        }
		if (pOUT->iVisible)
		  AfficheOutline(pOUT);
      }
      break;

    case CUCP_TYPE:
    case CUCP_FULLPATH:
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

int CUC_OutlineSetPropStrInd(struct CUC_Outline *pOUT, int iProp, int iIndice, const char *szVal)
{
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineSetPropStrInd", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LIST:
      if (iCtrlBornes(szNomClasse, iProp, iIndice, 0, pOUT->iListCount-1)<0)
        return -1;
	  
      if (pOUT->pItems[iIndice].szLibelle!=NULL)
		free(pOUT->pItems[iIndice].szLibelle);
      if (szVal==NULL)
        pOUT->pItems[iIndice].szLibelle = NULL;
      else
      {
        pOUT->pItems[iIndice].szLibelle = strdup(szVal);
        if (pOUT->pItems[iIndice].szLibelle==NULL)
        { aprintf(szNomClasse, "Echec lors de l'allocation m‚moire|pour stocker l'item !");
          return -1;
        }
      }
	
      AfficheOutline(pOUT);
      break;
	
    default:
      ErrPropNonGeree(szNomClasse, "SetPropStrInd", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"

int CUC_OutlineSetPropPtr(struct CUC_Outline *pOUT, int iProp, void *pArg)
{
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineSetPropPtr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_PARENT: pOUT->Parent = pArg; break;
    case CUCP_IDBACK: pOUT->IdBack = pArg; break;
	case CUCP_WDISP:
	  pOUT->wDisp = pArg;
	  CUC_VScrollBarSetPropPtr(pOUT->pVSB, CUCP_WDISP, pArg);
	  break;

    default:
      ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Lecture d'une propri‚t‚ num‚rique

int CUC_OutlineGetPropNum(struct CUC_Outline *pOUT, int iProp)
{
  static char _f_[] = "CUC_OutlineGetPropNum";
  int iInd;

  if (iCtrlTypeOUT(pOUT, _f_, szNomType)<0)
    return -1;
  iInd = pOUT->iListIndex;

  switch(iProp)
  {
    case CUCP_ENABLED:		return pOUT->iEnabled;
    case CUCP_VISIBLE:		return pOUT->iVisible && pOUT->iAutoRefresh;
    case CUCP_FOCUS:		return pOUT->iHasFocus;

    case CUCP_LEFT:			return pOUT->iLeft;
    case CUCP_TOP:			return pOUT->iTop;
    case CUCP_WIDTH:		return pOUT->iWidth;
    case CUCP_HEIGHT:		return pOUT->iHeight;

    case CUCP_TABSIZE:		return pOUT->iTabSize;
    case CUCP_TABSTOP:		return pOUT->iTabStop;
    
    case CUCP_AUTOREFRESH:	return pOUT->iAutoRefresh;
    case CUCP_STYLE:		return pOUT->iStyle;

    case CUCP_LISTINDEX:	return pOUT->iListIndex;
    case CUCP_LISTCOUNT:	return pOUT->iListCount;
    case CUCP_AFFINDEX:		return pOUT->iAffIndex;
    case CUCP_AFFCOUNT:		return pOUT->iAffCount;

    case CUCP_ACCELERATOR:	return 0;	// pour simplifier le scheduler

    case CUCP_LINE:			return Calcul_CUCP_LINE(pOUT);
    case CUCP_STARTLINE:	return Calcul_CUCP_STARTLINE(pOUT);

	case CUCP_SEPARATOR:	return pOUT->cSeparator;

	case CUCP_INDENT:		return pOUT->pItems[iInd].hIndent;
	case CUCP_EXPAND:		return pOUT->pItems[iInd].hExpand;
	case CUCP_HASSUBITEMS:	return HasSubItems(pOUT, iInd);
	case CUCP_ISITEMVISIBLE:return pOUT->pItems[iInd].hVisible;
    
    default:
      ErrPropNonGeree(szNomClasse, _f_, iProp);
  }
  return 0;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ num‚rique indic‚e

int CUC_OutlineGetPropNumInd(struct CUC_Outline *pOUT, int iProp, int iInd)
{
  static char _f_[] = "CUC_OutlineGetPropNumInd";

  if (iCtrlTypeOUT(pOUT, _f_, szNomType)<0)
    return -1;

  // On v‚rifie que l'indice est correct...
  if (iCtrlBornes(szNomClasse, iProp, iInd, 0, pOUT->iListCount-1)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_INDENT:		return pOUT->pItems[iInd].hIndent;
	case CUCP_EXPAND:		return pOUT->pItems[iInd].hExpand;
	case CUCP_HASSUBITEMS:	return HasSubItems(pOUT, iInd);
	case CUCP_ISITEMVISIBLE:return pOUT->pItems[iInd].hVisible;

    default:
      ErrPropNonGeree(szNomClasse, _f_, iProp);
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

char *CUC_OutlineGetPropStr(struct CUC_Outline *pOUT, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineGetPropStr", szNomType)<0)
    return NULL;
  Assert(szBuffer!=NULL);

  switch(iProp)
  {
    case CUCP_TAG:
      if (pOUT->szTag==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pOUT->szTag, iLBuf);
      break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pOUT->szType, iLBuf);
      break;

    case CUCP_TEXT:
      if (pOUT->iListCount<=0 || pOUT->iListIndex<0)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pOUT->pItems[pOUT->iListIndex].szLibelle, iLBuf);
      break;
	
	case CUCP_FULLPATH:
	  {
		int   i;
		int   iIndex = pOUT->iListIndex;
		short hIndent = pOUT->pItems[iIndex].hIndent;
		char  szSeparator[2];

		szSeparator[0] = pOUT->cSeparator;
		szSeparator[1] = 0;
		szBuffer[0] = 0;
		for (i=0 ; i<hIndent ; i++)
		{
		  int iP = Parent(pOUT, iIndex, i);
		  if (i!=0)
			strncat2(szBuffer, szSeparator, iLBuf);
		  strncat2(szBuffer, pOUT->pItems[iP].szLibelle ? pOUT->pItems[iP].szLibelle : "", iLBuf);
		}
		if (hIndent!=0)
		  strncat2(szBuffer, szSeparator, iLBuf);
		strncat2(szBuffer, pOUT->pItems[iIndex].szLibelle ? pOUT->pItems[iIndex].szLibelle : "", iLBuf);
	  }
	  break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ texte indic‚e

char *CUC_OutlineGetPropStrInd(struct CUC_Outline *pOUT, int iProp, int iIndice, char *szBuffer, int iLBuf)
{
  static char _f_[] ="CUC_OutlineGetPropStrInd";

  if (iCtrlTypeOUT(pOUT, _f_, szNomType)<0)
    return NULL;
  Assert(szBuffer!=NULL);

  if (iCtrlBornes(szNomClasse, iProp, iIndice, 0, pOUT->iListCount-1)<0)
	return NULL;

  switch(iProp)
  {
    case CUCP_LIST:
      if (pOUT->pItems[iIndice].szLibelle==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pOUT->pItems[iIndice].szLibelle, iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, _f_, iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_OutlineGetPropPtr(struct CUC_Outline *pOUT, int iProp)
{
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineGetPropPtr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PARENT:	return pOUT->Parent;
    case CUCP_IDBACK:	return pOUT->IdBack;
	case CUCP_WDISP:  	return pOUT->wDisp;
    default:
      ErrPropNonGeree(szNomClasse, "GetPropPtr", iProp);
  }
  return 0;
}

/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

static void DoEventKey(struct CUC_Outline *pOUT, int iKey)
{
  int iOldAffIndex = pOUT->iAffIndex;
  int iNb, iPosAff, iPosListe;
  
  switch(iKey)
  {
	case '+':
	  if (0==pOUT->pItems[pOUT->iListIndex].hExpand)
	  { pOUT->pItems[pOUT->iListIndex].hExpand = 1;
		DoExpand(pOUT, pOUT->iListIndex);

		// On r‚g‚nŠre la liste d'affichage
		SynchroAff(pOUT);

		// R‚affichage
		if (pOUT->iVisible && pOUT->iAutoRefresh)
		  AfficheOutline(pOUT);

		pOUT->iRaiseEvent(pOUT->IdBack, CUCE_EXPAND, 0);
	  }
	  return;
	
	case '-':
	  if (pOUT->pItems[pOUT->iListIndex].hExpand)
	  { pOUT->pItems[pOUT->iListIndex].hExpand = 0;
		DoExpand(pOUT, pOUT->iListIndex);

		// On r‚g‚nŠre la liste d'affichage
		SynchroAff(pOUT);

		// R‚affichage
		if (pOUT->iVisible && pOUT->iAutoRefresh)
		  AfficheOutline(pOUT);

		pOUT->iRaiseEvent(pOUT->IdBack, CUCE_COLLAPSE, 0);
	  }
	  return;

    case KEY_UP:
      if (pOUT->iAffIndex>0)
	    pOUT->iAffIndex--;
      break;
      
	case KEY_RIGHT:
    case KEY_DOWN:
      if (pOUT->iAffIndex+1<pOUT->iAffCount)
	    pOUT->iAffIndex++;
      break;

	case KEY_LEFT:
	  pOUT->iAffIndex -= pOUT->iHeight-2;
      if (pOUT->iAffIndex<0)
		pOUT->iAffIndex = 0;
	  break;

    case KEY_PGUP:
      pOUT->iAffIndex -= pOUT->iHeight-2;
      if (pOUT->iAffIndex<0) pOUT->iAffIndex = 0;
      break;

    case KEY_PGDN:
      pOUT->iAffIndex += pOUT->iHeight-2;
      if (pOUT->iAffIndex>=pOUT->iAffCount)
		pOUT->iAffIndex = pOUT->iAffCount-1;
      break;

    case KEY_HOME:
      pOUT->iAffIndex = 0;
      break;

    case KEY_END:
      pOUT->iAffIndex = pOUT->iAffCount-1;
      break;
      
    default:
      if (pOUT->pItems==NULL)
        break;
      iNb = 0;
      iPosAff = pOUT->iAffIndex;
      for(; ;)
      {
        iNb++;
        if (iNb>pOUT->iAffCount) break;
        iPosAff = (iPosAff+1)%pOUT->iAffCount;
		iPosListe = iAffToList(pOUT, iPosAff);

        if (pOUT->pItems[iPosListe].szLibelle!=NULL)
		{
		  int j;
		  for(j=0 ; pOUT->pItems[iPosListe].szLibelle[j] ; j++) 
			if(pOUT->pItems[iPosListe].szLibelle[j]!='\t' && 
			   pOUT->pItems[iPosListe].szLibelle[j]!=' ') break;
          if (toupper(pOUT->pItems[iPosListe].szLibelle[j])==toupper(iKey))
          { pOUT->iAffIndex = iPosAff;
            break;
		  }
		}
      }
      break;  
  }
    
  if (pOUT->iAffIndex!=iOldAffIndex)
  { 
	pOUT->iListIndex = iAffToList(pOUT, pOUT->iAffIndex);
	if (pOUT->iVisible)
	  AfficheOutline(pOUT);
    if (pOUT->iRaiseEvent != NULL)
      pOUT->iRaiseEvent(pOUT->IdBack, CUCE_CHANGE, 0);
  }
}

/*====================================================================*/
// DoEventDump: traite l'‚v‚nement CUCE_DUMP

static void DoEventDump(struct CUC_Outline *pOUT)
{
  char szTitre[60];
  
  sprintf(szTitre, "DUMP CUC_Outline @%p", pOUT);
  aprintf(szTitre,
    "szType:       %-3s        iTop:       %-3d|"
    "iEnabled:     %-3d        iLeft:      %-3d|"
    "iVisible:     %-3d        iWidth:     %-3d|"
    "iHasFocus:    %-3d        iHeight:    %-3d|"
    "wDisp:        %-9p  IdBack:     %-9p|"
#ifdef UNIX
    "iRaiseEvent:  %-9p  Parent:     %-9p|"
#else
    "iRaiseEvent:  %-9Fp  Parent:     %-9p|"
#endif
    "pVSB:         %-9p|"
    "iTabSize:     %-3d        iTabStop:   %-3d|"
    "iAutoRefresh: %-3d        iAffItem0:  %-3d|"
    "iListCount:   %-3d        iListIndex: %-3d|"
    "iPosX:        %-3d        iPosY:      %-3d|"
    "Line:         %-3d        StartLine:  %-3d|"
    "pItems:       %-9p  Tag:        %.10s",
    pOUT->szType,			pOUT->iTop,
    pOUT->iEnabled,			pOUT->iLeft,
    pOUT->iVisible,			pOUT->iWidth,
    pOUT->iHasFocus,		pOUT->iHeight,
    pOUT->wDisp,			pOUT->IdBack,
    pOUT->iRaiseEvent,		pOUT->Parent,
    pOUT->pVSB,
    pOUT->iTabSize,			pOUT->iTabStop,
    pOUT->iAutoRefresh,		pOUT->iAffItem0,
    pOUT->iListCount,		pOUT->iListIndex,
    pOUT->iPosX,			pOUT->iPosY,
    Calcul_CUCP_LINE(pOUT),	Calcul_CUCP_STARTLINE(pOUT),
    pOUT->pItems,           pOUT->szTag);
}

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_OutlineDoEvent(struct CUC_Outline *pOUT, int iEvent, int iArg)
{

  if (iCtrlTypeOUT(pOUT, "CUC_OutlineDoEvent", szNomType)<0)
    return -1;

  switch(iEvent)
  {
    case CUCE_KEY:
      if (pOUT->iEnabled)
		DoEventKey(pOUT, iArg);
      break;

    case CUCE_DUMP:
	  DoEventDump(pOUT);
      break;

    case CUCE_GOTFOCUS:
      if (pOUT->iVisible && pOUT->iEnabled)
      { pOUT->iHasFocus = 1;
		Affiche(pOUT);
      }
      break;

    case CUCE_LOSTFOCUS:
      if (pOUT->iVisible && pOUT->iEnabled)
      { pOUT->iHasFocus = 0;
		Affiche(pOUT);
      }
      break;

    default:
      aprintf("CUC: CUC_OutlineDoEvent", "Ev‚nement %d inconnu !", iEvent);
      break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_OutlineMove(struct CUC_Outline *pOUT, int iTop, int iLeft)
{
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineMove", szNomType)<0)
    return -1;

  if (pOUT->iLeft!=iLeft || pOUT->iTop!=iTop)
  { 
    if (pOUT->iVisible) Efface(pOUT);
    pOUT->iLeft = iLeft;
    pOUT->iTop = iTop;
    if (pOUT->iVisible) Affiche(pOUT);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_OutlineResize(struct CUC_Outline *pOUT, int iHeight, int iWidth)
{
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineResize", szNomType)<0)
    return -1;

  if (pOUT->iWidth!=iWidth || pOUT->iHeight!=iHeight)
  { 
    if (pOUT->iVisible) Efface(pOUT);
    pOUT->iWidth = iWidth;
    pOUT->iHeight = iHeight;
    if (pOUT->iVisible) Affiche(pOUT);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine
// Ignore la propri‚t‚ visible !!!

int CUC_OutlineRefresh(struct CUC_Outline *pOUT)
{
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineRefresh", szNomType)<0)
    return -1;

  Affiche(pOUT);
}

/*====================================================================*/
// M‚thode AddItem: Ajout d'un ‚l‚ment dans la liste
// Si iPos==-1, l'ajout a lieu en fin de liste

int CUC_OutlineAddItemIndent(struct CUC_Outline *pOUT, const char *szElement, int iPos, int iIndent)
{
  static char _f_[] = "CUC_OutlineAddItemIndent";
  struct OutItem *p;
  int	i;
  short	hExpParent;
  
  if (iCtrlTypeOUT(pOUT, _f_, szNomType)<0)
    return -1;

  // Calcul de la position d'insertion
  if (iPos<0 || iPos>=pOUT->iListCount)
	iPos = pOUT->iListCount;

  // Allocation de la m‚moire pour la liste des pointeurs d'items
  if (pOUT->iListCount==0)
    p = (struct OutItem *)malloc((pOUT->iListCount+1)*sizeof(struct OutItem));
  else
    p = (struct OutItem *)realloc(pOUT->pItems, (pOUT->iListCount+1)*sizeof(struct OutItem));
  
  if (p==NULL)
  { aprintf(szNomClasse, "M‚thode AddItem:|Echec lors de l'allocation de m‚moire|pour stocker la liste des items");
    return -1;
  }
  pOUT->pItems = p;
  
  // D‚calage des ‚l‚ments de la liste pour ins‚rer le nouveau
  for (i=pOUT->iListCount-1 ; i>=iPos ; i--)
    pOUT->pItems[i+1] = pOUT->pItems[i];
  
  // Stockage de l'‚l‚ment … ajouter
  p[iPos].hIndent = (short)iIndent;

  // Par convention, seul un item de niveau 0 est ouvert par d‚faut,
  // de fa‡on … ce que seuls les items de niveau <=1 soient visibles
  p[iPos].hExpand = (short)(iIndent==0);

  // L'item est visible si le parent est ouvert
  if (iIndent==0)
	hExpParent = 1;
  else
  { int iP = Parent(pOUT, iPos, iIndent-1);
	hExpParent = p[iP].hExpand;
  }
  p[iPos].hVisible = hExpParent;

  if (szElement==NULL)
    p[iPos].szLibelle = NULL;
  else
    p[iPos].szLibelle = strdup(szElement);
    if (p[iPos].szLibelle==NULL)
    { aprintf(szNomClasse, "M‚thode AddItem:|Echec lors de l'allocation m‚moire|pour stocker l'item !");
      return -1;
    }
  pOUT->iListCount++;
  if (pOUT->iListIndex<0) pOUT->iListIndex = 0;
  
  // On synchronise la liste d'affichage
  SynchroAff(pOUT);
  
  // Et r‚affichage ‚ventuel
  if (pOUT->iVisible && pOUT->iAutoRefresh)
    AfficheOutline(pOUT);
  
  return 0;
}

int CUC_OutlineAddItem(struct CUC_Outline *pOUT, const char *szElement, int iPos)
{
  return CUC_OutlineAddItemIndent(pOUT, szElement, iPos, 1);
}

/*====================================================================*/

// M‚thode RemoveItem: Retrait d'un ‚l‚ment dans la liste
// Si iPos==-1, c'est l'‚l‚ment courant qui est retir‚
// Tous les items qui suivent et d'indentation sup‚rieure …
// celle de l'item courant sont ‚galement supprim‚s

int CUC_OutlineRemoveItem(struct CUC_Outline *pOUT, int iPos)
{
  struct OutItem *p;
  int	i;
  int	iNb;
  short	hIndent;
  
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineRemoveItem", szNomType)<0)
    return -1;

  if (pOUT->iListCount==0)
  { aprintf(szNomClasse, "M‚thode RemoveItem:|La liste est d‚j… vide !");
    return -1;
  }

  if (iPos<0) iPos = pOUT->iListIndex;

  // On calcule le nombre d'items … supprimer
  iNb = 1;
  hIndent = pOUT->pItems[iPos].hIndent;
  while (iPos+iNb<pOUT->iListCount && pOUT->pItems[iPos+iNb].hIndent>hIndent)
	iNb++;
  
  for (i=0 ; i<iNb ; i++)
	if (pOUT->pItems[iPos+i].szLibelle!=NULL)
	  free(pOUT->pItems[iPos+i].szLibelle);		// Lib‚ration du texte
    
  for (i=iPos+iNb ; i<pOUT->iListCount ; i++)	// D‚calage les pointeurs
    pOUT->pItems[i-iNb] = pOUT->pItems[i];
  
  pOUT->iListCount -= iNb;
  if (pOUT->iListIndex>=pOUT->iListCount)
    pOUT->iListIndex = pOUT->iListCount-1;

  if (pOUT->iListCount==0)
  { free(pOUT->pItems);
    p = NULL;
  }
  else
  {
    p = (struct OutItem *)realloc(pOUT->pItems, (pOUT->iListCount)*sizeof(struct OutItem));
    if (p==NULL)
    { aprintf(szNomClasse, "M‚thode RemoveItem:|Echec lors de l'allocation de m‚moire|pour stocker la liste des items");
      return -1;
    }
  }
  pOUT->pItems = p;
  
  // On synchronise la liste d'affichage
  SynchroAff(pOUT);

  // Et r‚affichage final
  if (pOUT->iVisible && pOUT->iAutoRefresh)
    AfficheOutline(pOUT);
  
  return 0;
}

/*====================================================================*/
// M‚thode Clear: Efface complŠtement la liste

int CUC_OutlineClear(struct CUC_Outline *pOUT)
{
  int i;
  
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineClear", szNomType)<0)
    return -1;
    
  if (pOUT->iListCount>0)
  {
    for (i=0 ; i<pOUT->iListCount ; i++)
    if (pOUT->pItems[i].szLibelle!=NULL)
      free(pOUT->pItems[i].szLibelle);	// Lib‚ration du texte

    free(pOUT->pItems);
    pOUT->pItems = NULL;
    pOUT->iListCount = 0;
    pOUT->iListIndex = 0;
    pOUT->iAffItem0 = 0;
	pOUT->iAffIndex = 0;
	pOUT->iAffCount = 0;
  }
  
  if (pOUT->iVisible && pOUT->iAutoRefresh)
    AfficheOutline(pOUT);
  
  return 0;
}

//====================================================================
// M‚thode DisplayCursor : R‚affiche le curseur
int CUC_OutlineDisplayCursor(struct CUC_Outline *pOUT)
{
  if (iCtrlTypeOUT(pOUT, "CUC_OutlineDisplayCursor", szNomType)<0)
    return -1;

  wmove(pOUT->wDisp, pOUT->iPosY, pOUT->iPosX);
  return 0;
}

