/* cuchsb.c - CUC: Barre de défilement horizontale
** Impl‚mentation du contr“le HScrollBar de la bibliothŠque CUC
** Premier contr“le !
** 30/04/94 PV
** 26/12/94 PV  CUC_EffaceRectangle; strncpy2; Assert
** 17/01/95 PV  Rien n'est recalcul‚ sur modification de MAX ou MIN
**
** Les fonctions et variables non d‚clar‚es dans l'interface
** doivent imp‚rativement ˆtre d‚clar‚es et static
*/

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

static char szNomClasse[] = "CUC HScrollBar";
static char szNomType[]   = "HSB";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_HScrollBar
{
  char  szType[4];      // Pour des contr“les internes (HSB)

  int   iEnabled;       // Vrai si le contr“le doit r‚agir
  int   iVisible;       // Vrai si le contr“le est affich‚
  int   iHasFocus;      // Vrai si le contr“le a le focus

  int   iTop;           // Nø de ligne … l'‚cran, base 0
  int   iLeft;          // Nø de colonne … l'‚cran, base 0
  int   iWidth;         // Largeur du contr“le en colonnes
  int   iHeight;        // Hauteur du contr“le en lignes

  char  *szTag;         // Tag du contr“le
  int   iTabStop;       // Arrˆt sur tabulation
  WINDOW *wDisp;        // Fenˆtre (curses) d'affichage du contr“le
  void  *IdBack;        // Identificateur de retour
  int   (*iRaiseEvent)(void *, int , int ); // Messages en retour
  void  *Parent;        // Pointeur sur un contr“le parent

  int   iMin;           // Valeur minimum (… gauche)
  int   iMax;           // Valeur maximum (… droite)
  int   iCSize;         // Taille du curseur en colonnes
  int   iSmallChange;   // Petit incr‚ment (flŠches)
  int   iLargeChange;   // Grand incr‚ment (PageSuiv, PagePr‚c)

  int   iValue;         // Valeur actuelle du curseur
};


/*====================================================================*/
// Efface completement le contr“le de l'‚cran (affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver deriŠre

static void Efface(struct CUC_HScrollBar *pHSB)
{
  if (iOkWDisp(pHSB->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pHSB->wDisp, pHSB->iTop, pHSB->iLeft, pHSB->iHeight, pHSB->iWidth);
}

/*====================================================================*/
// Affiche le curseur clignotant au bon endoit
// (au début du curseur défilant)

static void AfficheCurseur(struct CUC_HScrollBar *pHSB)
{
  int hPos;

  if (iOkWDisp(pHSB->wDisp, szNomClasse, "AfficheCurseur")<0) return;
  
  // Calcul de la position o— doit apparaŒtre le curseur
  if (pHSB->iMax-pHSB->iMin)
	hPos = (int)(pHSB->iLeft + 1 + (pHSB->iValue - pHSB->iMin + 0.0) / (pHSB->iMax - pHSB->iMin)*(pHSB->iWidth - pHSB->iCSize - 2.0));
  else
	hPos = pHSB->iLeft + 1;

  wmove(pHSB->wDisp, pHSB->iTop, hPos);
}

/*====================================================================*/
// Redessine le contr“le aprŠs un changement de valeur
// Les extr‚mit‚s (flŠches) ne sont pas dessin‚es

static void AfficheValeur(struct CUC_HScrollBar *pHSB)
{
  int i, j;
  int hPos;
  int cCurs, cFond;

  if (iOkWDisp(pHSB->wDisp, szNomClasse, "AfficheValeur")<0) return;
  
  if (strncmp(ttytype, "ansi", 4)==0)
  { cFond = 176;
	cCurs = 177;
  }
  else
  { cFond = 177;
	cCurs = 219;
  }

  if (!pHSB->iEnabled) wattron(pHSB->wDisp, DIMINUE);

  // Calcul de la position o— doit apparaŒtre le curseur
  if (pHSB->iMax-pHSB->iMin)
	hPos = (int)(pHSB->iLeft + 1 + (pHSB->iValue - pHSB->iMin + 0.0) / (pHSB->iMax - pHSB->iMin)*(pHSB->iWidth - pHSB->iCSize - 2.0));
  else
	hPos = pHSB->iLeft + 1;

  for (i=0 ; i < pHSB->iHeight ; i++)
  {
	for (j=0 ; j < pHSB->iWidth-2 ; j++)
	  cmvwaddch(pHSB->wDisp, pHSB->iTop+i, pHSB->iLeft+1+j, cFond);
	 
	if (pHSB->iHasFocus) wattron(pHSB->wDisp, INVERSE);
	for (j=0 ; j < pHSB->iCSize ; j++)
	  cmvwaddch(pHSB->wDisp, pHSB->iTop+i, hPos+j, cCurs);
	if (pHSB->iHasFocus) wattroff(pHSB->wDisp, INVERSE);
  }

  wmove(pHSB->wDisp, pHSB->iTop, hPos);

  if (!pHSB->iEnabled) wattroff(pHSB->wDisp, DIMINUE);
}

/*====================================================================*/
// Redessine complŠtement le contr“le

static void Affiche(struct CUC_HScrollBar *pHSB)
{
  int i;

  if (iOkWDisp(pHSB->wDisp, szNomClasse, "Affiche")<0) return;

  if (!pHSB->iEnabled) wattron(pHSB->wDisp, DIMINUE);
  for (i=0 ; i<pHSB->iHeight ; i++)
  {
	cmvwaddch(pHSB->wDisp, pHSB->iTop+i, pHSB->iLeft, '<');
	cmvwaddch(pHSB->wDisp, pHSB->iTop+i, pHSB->iLeft+pHSB->iWidth-1, '>');
  }
  AfficheValeur(pHSB);
}

/*====================================================================*/
// Cr‚ation de la barre de d‚filement

struct CUC_HScrollBar *CUC_HScrollBarCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))

{
  struct CUC_HScrollBar *pHSB;

  pHSB = (struct CUC_HScrollBar *)malloc(sizeof(struct CUC_HScrollBar));

  if (pHSB==NULL)
  { aprintf("CUC: CUC_HScrollBarCreate", "Echec au malloc !");
	return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  strcpy(pHSB->szType, szNomType);  // Pour reconnaître le type
  pHSB->wDisp = w;
  pHSB->iRaiseEvent = iRaiseEvent;
  pHSB->IdBack = pHSB;  // Par d‚faut IdBack est un ptr sur le contr“le
  pHSB->iHasFocus = 0;
  pHSB->iTop = 0;
  pHSB->iLeft = 0;
  pHSB->iWidth = 10;
  pHSB->iHeight = 1;
  pHSB->iMin = 0;
  pHSB->iMax = 100;
  pHSB->iSmallChange = 1;
  pHSB->iLargeChange = 1;
  pHSB->iValue = 0;
  pHSB->iCSize = 1;
  pHSB->szTag = 0;
  pHSB->iEnabled = 1;
  pHSB->iVisible = 0;           // Créé invisible
  pHSB->Parent = NULL;
  pHSB->iTabStop = 1;

  return pHSB;
}

/*====================================================================*/
// Destruction d'une barre de d‚filement

void CUC_HScrollBarDestruct(struct CUC_HScrollBar *pHSB)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarDestruct", szNomType)<0)
	return;

  if (pHSB->szTag!=NULL) free(pHSB->szTag); // On d‚truit le tag...
  pHSB->szType[0] = 0;
  free((void *)pHSB);                       // puis la structure
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_HScrollBarSetPropNum(struct CUC_HScrollBar *pHSB, int iProp, int iArg)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarSetPropNum", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_LEFT:
	  if (pHSB->iLeft!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pHSB->iVisible) Efface(pHSB);
		pHSB->iLeft = iArg;
		if (pHSB->iVisible) Affiche(pHSB);
	  }
	  break;

	case CUCP_TOP:
	  if (pHSB->iTop!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pHSB->iVisible) Efface(pHSB);
		pHSB->iTop = iArg;
		if (pHSB->iVisible) Affiche(pHSB);
	  }
	  break;

	case CUCP_WIDTH:
	  if (pHSB->iWidth!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 80)<0)
		  return -1;
		if (pHSB->iVisible) Efface(pHSB);
		pHSB->iWidth = iArg;
		if (pHSB->iVisible) Affiche(pHSB);
	  }
	  break;

	case CUCP_HEIGHT:
	  if (pHSB->iHeight!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 8)<0)
		  return -1;
		if (pHSB->iVisible) Efface(pHSB);
		pHSB->iHeight = iArg;
		if (pHSB->iVisible) Affiche(pHSB);
	  }
	  break;

	case CUCP_MIN:
	  pHSB->iMin = iArg;
#ifdef COMPLIQUE
	  if (pHSB->iMin!=iArg)
	  { 
		pHSB->iMin = iArg;
		if (pHSB->iMax-pHSB->iMin)
		  pHSB->iValue = pHSB->iMin+(pHSB->iValue-pHSB->iMin)/(pHSB->iMax-pHSB->iMin);
		else 
		  pHSB->iValue = pHSB->iMin;
		if (pHSB->iVisible) AfficheValeur(pHSB);
	  }
#endif
	  break;

	case CUCP_MAX:
		pHSB->iMax = iArg;
#ifdef COMPLIQUE
	  if (pHSB->iMax!=iArg)
	  { 
		pHSB->iMax = iArg;
		if (pHSB->iMax-pHSB->iMin)
		  pHSB->iValue = pHSB->iMin+(pHSB->iValue-pHSB->iMin)/(pHSB->iMax-pHSB->iMin);
		else 
		  pHSB->iValue = pHSB->iMin;
		if (pHSB->iVisible) AfficheValeur(pHSB);
	  }
#endif
	  break;

	case CUCP_SMALLCHANGE:
	  if (iCtrlBornes(szNomClasse, iProp, iArg, 0, INFINI)<0)
		return -1;
	  pHSB->iSmallChange = iArg;
	  break;

	case CUCP_LARGECHANGE:
	  if (iCtrlBornes(szNomClasse, iProp, iArg, 0, INFINI)<0)
		return -1;
	  pHSB->iLargeChange = iArg;
	  break;

	case CUCP_VALUE:
	  if (pHSB->iValue!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, pHSB->iMin, pHSB->iMax)<0)
		  return -1;
		pHSB->iValue = iArg;
		if (pHSB->iVisible) AfficheValeur(pHSB);
		if (pHSB->iRaiseEvent != NULL)
		  pHSB->iRaiseEvent(pHSB->IdBack, CUCE_CHANGE, 0);
	  }
	  break;

	case CUCP_CSIZE:
	  if (pHSB->iCSize!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, pHSB->iWidth-2)<0)
		  return -1;
		pHSB->iCSize = iArg;
		if (pHSB->iVisible) AfficheValeur(pHSB);
	  }
	  break;

	case CUCP_VISIBLE:
	  if (pHSB->iVisible!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		  
		if (pHSB->iVisible)
		{ Efface(pHSB);
		  if (pHSB->iRaiseEvent != NULL)
			pHSB->iRaiseEvent(pHSB->IdBack, CUCE_HIDE, 0);
		}
		else
		{ if (pHSB->iRaiseEvent != NULL)
			pHSB->iRaiseEvent(pHSB->IdBack, CUCE_SHOW, 0);
		  Affiche(pHSB);
		}
		pHSB->iVisible = iArg;
	  }
	  break;

	case CUCP_ENABLED:
	  if (pHSB->iEnabled!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		  
		pHSB->iEnabled = iArg;
		if (pHSB->iVisible)
		  Affiche(pHSB);
	  }
	  break;

	case CUCP_TABSTOP:
	  pHSB->iTabStop = iArg;
	  break;

	case CUCP_FOCUS:
	  ErrPropLectureSeule(szNomClasse, "SetPropNum", iProp);
	  return -1;

	default:
	  ErrPropNonGeree(szNomClasse, "SetPropNum", iProp);
	  return -1;
  }

  return 0; // Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"

int CUC_HScrollBarSetPropPtr(struct CUC_HScrollBar *pHSB, int iProp, void *pArg)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarSetPropPtr", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_PARENT:   pHSB->Parent = pArg;    break;
	case CUCP_IDBACK:   pHSB->IdBack = pArg;    break;
	case CUCP_WDISP:    pHSB->wDisp = pArg;     break;

	default:
	  ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
	  return -1;
  }

  return 0; // Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_HScrollBarSetPropStr(struct CUC_HScrollBar *pHSB, int iProp, const char *szVal)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarSetPropStr", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_TAG:
	  if (pHSB->szTag!=NULL) free(pHSB->szTag);
	  if (szVal==NULL)
		pHSB->szTag = NULL;
	  else
		pHSB->szTag = strdup(szVal);
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
// Lecture d'une propri‚t‚ num‚rique

int CUC_HScrollBarGetPropNum(struct CUC_HScrollBar *pHSB, int iProp)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarGetPropNum", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_LEFT:         return pHSB->iLeft;
	case CUCP_TOP:          return pHSB->iTop;
	case CUCP_WIDTH:        return pHSB->iWidth;
	case CUCP_HEIGHT:       return pHSB->iHeight;
	case CUCP_MIN:          return pHSB->iMin;
	case CUCP_MAX:          return pHSB->iMax;
	case CUCP_SMALLCHANGE:  return pHSB->iSmallChange;
	case CUCP_LARGECHANGE:  return pHSB->iLargeChange;
	case CUCP_VALUE:        return pHSB->iValue;
	case CUCP_CSIZE:        return pHSB->iCSize;
	case CUCP_VISIBLE:      return pHSB->iVisible;
	case CUCP_ENABLED:      return pHSB->iEnabled;
	case CUCP_TABSTOP:      return pHSB->iTabStop;
	case CUCP_FOCUS:        return pHSB->iHasFocus;
	default:
	  ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_HScrollBarGetPropPtr(struct CUC_HScrollBar *pHSB, int iProp)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarGetPropPtr", szNomType)<0)
	return NULL;

  switch(iProp)
  {
	case CUCP_PARENT:       return pHSB->Parent;
	case CUCP_IDBACK:       return pHSB->IdBack;
	case CUCP_WDISP:        return pHSB->wDisp;
	default:
	  ErrPropNonGeree(szNomClasse, "GetPropPtr", iProp);
  }
  return 0;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ texte
// On ne retourne pas un pointeur sur un champ de donn‚e priv‚,
// mais on copie la chaine … une adresse fournie par l'appellant.
// Routine s‚curis‚e: on gŠre la taille du buffer, et on garantit
// que le buffer se termine par 0.
// Une propri‚t‚ … NULL de fa‡on interne est rtourn‚e comme chaŒne nulle.

char *CUC_HScrollBarGetPropStr(struct CUC_HScrollBar *pHSB, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarGetPropStr", szNomType)<0)
	return NULL;
  Assert(szBuffer!=NULL);

  switch(iProp)
  {
	case CUCP_TAG:
	  if (pHSB->szTag==NULL)
		szBuffer[0] = 0;
	  else
		strncpy2(szBuffer, pHSB->szTag, iLBuf);
	  break;

	case CUCP_TYPE:
	  strncpy2(szBuffer, pHSB->szType, iLBuf);
	  break;

	default:
	  ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

static void DoEventKey(struct CUC_HScrollBar *pHSB, int iKey)
{
  int iOldValue = pHSB->iValue;
  
  switch(iKey)
  {
	case KEY_LEFT:
	  pHSB->iValue -= pHSB->iSmallChange;
	  if (pHSB->iValue<pHSB->iMin) pHSB->iValue = pHSB->iMin;
	  break;

	case KEY_PGUP:
	  pHSB->iValue -= pHSB->iLargeChange;
	  if (pHSB->iValue<pHSB->iMin) pHSB->iValue = pHSB->iMin;
	  break;

	case KEY_RIGHT:
	  pHSB->iValue += pHSB->iSmallChange;
	  if (pHSB->iValue>pHSB->iMax) pHSB->iValue = pHSB->iMax;
	  break;

	case KEY_PGDN:
	  pHSB->iValue += pHSB->iLargeChange;
	  if (pHSB->iValue>pHSB->iMax) pHSB->iValue = pHSB->iMax;
	  break;

	case KEY_HOME:
	  pHSB->iValue = pHSB->iMin;
	  break;

	case KEY_END:
	  pHSB->iValue = pHSB->iMax;
	  break;
  }
	
  if (pHSB->iValue!=iOldValue)
  { AfficheValeur(pHSB);
	if (pHSB->iRaiseEvent != NULL)
	  pHSB->iRaiseEvent(pHSB->IdBack, CUCE_CHANGE, 0);
  }
}

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_HScrollBarDoEvent(struct CUC_HScrollBar *pHSB, int iEvent, int iArg)
{

  if (iCtrlType(pHSB, "CUC_HScrollBarDoEvent", szNomType)<0)
	return -1;

  switch(iEvent)
  {
	case CUCE_KEY:
	  if (pHSB->iVisible && pHSB->iEnabled)
		DoEventKey(pHSB, iArg);
	  break;

	case CUCE_GOTFOCUS:
	  if (pHSB->iVisible && pHSB->iEnabled)
	  { pHSB->iHasFocus = 1;
		Affiche(pHSB);
	  }
	  break;

	case CUCE_LOSTFOCUS:
	  if (pHSB->iVisible && pHSB->iEnabled)
	  { pHSB->iHasFocus = 0;
		Affiche(pHSB);
	  }
	  break;

	default:
	  aprintf("CUC: CUC_HScrollBarDoEvent", "Ev‚nement %d inconnu !", iEvent);
	  break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_HScrollBarMove(struct CUC_HScrollBar *pHSB, int iTop, int iLeft)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarMove", szNomType)<0)
	return -1;

  if (pHSB->iLeft!=iLeft || pHSB->iTop!=iTop)
  { 
	if (pHSB->iVisible) Efface(pHSB);
	pHSB->iLeft = iLeft;
	pHSB->iTop = iTop;
	if (pHSB->iVisible) Affiche(pHSB);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_HScrollBarResize(struct CUC_HScrollBar *pHSB, int iHeight, int iWidth)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarResize", szNomType)<0)
	return -1;

  if (pHSB->iWidth!=iWidth || pHSB->iHeight!=iHeight)
  { 
	if (pHSB->iVisible) Efface(pHSB);
	pHSB->iWidth = iWidth;
	pHSB->iHeight = iHeight;
	if (pHSB->iVisible) Affiche(pHSB);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine
// Ignore la propri‚t‚ visible !!!

int CUC_HScrollBarRefresh(struct CUC_HScrollBar *pHSB)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarResize", szNomType)<0)
	return -1;

  Affiche(pHSB);
}

/*====================================================================*/
// M‚thode DisplayCursor: le contr“le affiche le curseur clignotant

int CUC_HScrollBarDisplayCursor(struct CUC_HScrollBar *pHSB)
{
  if (iCtrlType(pHSB, "CUC_HScrollBarDisplayCursor", szNomType)<0)
	return -1;

  AfficheCurseur(pHSB);
}
