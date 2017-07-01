/* cucvsb.c - CUC: Barre de défilement verticale
** Impl‚mentation du contr“le VScrollBar de la bibliothŠque CUC
**  1/06/94 Christophe R., PV
** 27/10/94 FG  Bug affichage ^
** 26/12/94 PV  CUC_EffaceRectangle; strncpy2; Assert
**  5/01/95 PV  Recalcul de value aprŠs un changement de max ou de min
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

static char szNomClasse[] = "CUC VScrollBar";
static char szNomType[]   = "VSB";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_VScrollBar
{
  char  szType[4];      // Pour des contr“les internes (VSB)
  
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
// Efface completement le contr“le de l'‚cran (Affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver deriŠre

static void Efface(struct CUC_VScrollBar *pVSB)
{
  if (iOkWDisp(pVSB->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pVSB->wDisp, pVSB->iTop, pVSB->iLeft, pVSB->iHeight, pVSB->iWidth);
}

/*====================================================================*/
// Affiche le curseur clignotant au bon endoit
// (au début du curseur défilant)

static void AfficheCurseur(struct CUC_VScrollBar *pVSB)
{
  int vPos;

  if (iOkWDisp(pVSB->wDisp, szNomClasse, "AfficheCurseur")<0) return;
  
  // Calcul de la position o— doit apparaŒtre le curseur
  if (pVSB->iMax - pVSB->iMin)
	vPos = (int)(pVSB->iTop + 1 + (pVSB->iValue - pVSB->iMin + 0.0) / (pVSB->iMax - pVSB->iMin)*(pVSB->iHeight - pVSB->iCSize - 2.0));
  else
	vPos = pVSB->iTop;

  wmove(pVSB->wDisp, vPos, pVSB->iLeft);
}

/*====================================================================*/
// Redessine le contr“le aprŠs un changement de valeur
// Les extr‚mit‚s (flŠches) ne sont pas dessin‚es

static void AfficheValeur(struct CUC_VScrollBar *pVSB)
{
  int i, j;
  int vPos;
  int cCurs, cFond;

  if (iOkWDisp(pVSB->wDisp, szNomClasse, "AfficheValeur")<0) return;
  
  if (strncmp(ttytype, "ansi", 4)==0)
  { cFond = 176;
	cCurs = 177;
  }
  else
  { cFond = 177;
	cCurs = 219;
  }

  if (!pVSB->iEnabled) wattron(pVSB->wDisp, DIMINUE);
  
  // Calcul de la position o— doit apparaŒtre le curseur
  
  if (pVSB->iMax - pVSB->iMin)
	vPos = (int)(pVSB->iTop + 1 + (pVSB->iValue - pVSB->iMin + 0.0) / (pVSB->iMax - pVSB->iMin)*(pVSB->iHeight - pVSB->iCSize - 2.0));
  else
	vPos = pVSB->iTop+1;

  for(j=0 ; j<pVSB->iWidth ; j++)
  {    
	cmvwaddch(pVSB->wDisp, pVSB->iTop, pVSB->iLeft+j,'^');

	// Dessin du corps en gris clair
	for (i=pVSB->iTop+1 ; i<pVSB->iTop+pVSB->iHeight-1 ; i++)
	  cmvwaddch(pVSB->wDisp, i, pVSB->iLeft+j, cFond); 
	cmvwaddch(pVSB->wDisp, pVSB->iTop+pVSB->iHeight-1, pVSB->iLeft+j,'v');
	// Dessin du curseur d‚filant
	if (pVSB->iHasFocus) wattron(pVSB->wDisp, INVERSE);
	for (i=0 ; i < pVSB->iCSize ; i++)
	  cmvwaddch(pVSB->wDisp, vPos+i, pVSB->iLeft+j, cCurs);
	if (pVSB->iHasFocus) wattroff(pVSB->wDisp, INVERSE);
   } 

  wmove(pVSB->wDisp, vPos, pVSB->iLeft);

  if (!pVSB->iEnabled) wattroff(pVSB->wDisp, DIMINUE);
}

/*====================================================================*/
// Cr‚ation de la barre de d‚filement

struct CUC_VScrollBar *CUC_VScrollBarCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))

{
  struct CUC_VScrollBar *pVSB;

  pVSB = (struct CUC_VScrollBar *)malloc(sizeof(struct CUC_VScrollBar));

  if (pVSB==NULL)
  { aprintf("CUC: CUC_VScrollBarCreate", "Echec au malloc !");
	return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pVSB->wDisp = w;
  pVSB->iRaiseEvent = iRaiseEvent;
  pVSB->IdBack = pVSB;   //Par defaut IdBack est un ptr sur le block 
  pVSB->iHasFocus = 0;
  pVSB->iTop = 0;
  pVSB->iLeft = 0;
  pVSB->iWidth = 1;
  pVSB->iHeight = 1;
  pVSB->iMin = 0;
  pVSB->iMax = 100;
  pVSB->iSmallChange = 1;
  pVSB->iLargeChange = 1;
  pVSB->iValue = 0;
  pVSB->iCSize = 1;
  pVSB->szTag = 0;
  pVSB->iEnabled = 1;
  pVSB->iVisible = 0;           // Le contr“le cr‚‚ est invisible
  pVSB->Parent = NULL;
  pVSB->iTabStop = 1;
  strcpy(pVSB->szType, szNomType);      // Choix conventionnel

  return pVSB;
}

/*====================================================================*/
// Destruction d'une barre de d‚filement

void CUC_VScrollBarDestruct(struct CUC_VScrollBar *pVSB)
{
  if (iCtrlType(pVSB, "CUC_VScrollBarDestruct", szNomType)<0)
	return;

  if (pVSB->szTag!=NULL) free(pVSB->szTag); // On d‚truit le tag...
  pVSB->szType[0] = 0;
  free((void *)pVSB);           // puis la structure
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_VScrollBarSetPropNum(struct CUC_VScrollBar *pVSB, int iProp, int iArg)
{
  if (iCtrlType(pVSB, "CUC_VScrollBarSetPropNum", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_LEFT:
	  if (pVSB->iLeft!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pVSB->iVisible) Efface(pVSB);
		pVSB->iLeft = iArg;
		if (pVSB->iVisible) AfficheValeur(pVSB);
	  }
	  break;

	case CUCP_TOP:
	  if (pVSB->iTop!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pVSB->iVisible) Efface(pVSB);
		pVSB->iTop = iArg;
		if (pVSB->iVisible) AfficheValeur(pVSB);
	  }
	  break;

	case CUCP_WIDTH:
	  if (pVSB->iWidth!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 8)<0)
		  return -1;
		if (pVSB->iVisible) Efface(pVSB);
		pVSB->iWidth = iArg;
		if (pVSB->iVisible) AfficheValeur(pVSB);
	  }
	  break;

	case CUCP_HEIGHT:
	  if (pVSB->iHeight!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 80)<0)
		  return -1;
		if (pVSB->iVisible) Efface(pVSB);
		pVSB->iHeight = iArg;
		if (pVSB->iVisible) AfficheValeur(pVSB);
	  }
	  break;

	case CUCP_MIN:
	  pVSB->iMin = iArg;
#ifdef COMPIQUE
	  if (pVSB->iMin!=iArg)
	  { 
		int iOldMin = pVSB->iMin;

		pVSB->iMin = iArg;
		if (pVSB->iMax - pVSB->iMin)
		  pVSB->iValue = (int)(pVSB->iMin+(pVSB->iMax-pVSB->iMin)*(pVSB->iValue-iOldMin)/(pVSB->iMax-iOldMin+0.0));
		else
		  pVSB->iValue = pVSB->iMin;
		if (pVSB->iVisible) AfficheValeur(pVSB);
	  }
#endif
	  break;

	case CUCP_MAX:
	  pVSB->iMax = iArg;
#ifdef COMPIQUE
	  if (pVSB->iMax!=iArg)
	  { 
		int iOldMax = pVSB->iMax;

		pVSB->iMax = iArg;
		if (pVSB->iMax-pVSB->iMin)
		  pVSB->iValue = (int)(pVSB->iMin+(pVSB->iMax-pVSB->iMin)*(pVSB->iValue-pVSB->iMin)/(iOldMax-pVSB->iMin+0.0));
		else
		  pVSB->iValue = pVSB->iMin;
		if (pVSB->iVisible) AfficheValeur(pVSB);
	  }
#endif
	  break;

	case CUCP_SMALLCHANGE:
	  if (iCtrlBornes(szNomClasse, iProp, iArg, 0, INFINI)<0)
		return -1;
	  pVSB->iSmallChange = iArg;
	  break;

	case CUCP_LARGECHANGE:
	  if (iCtrlBornes(szNomClasse, iProp, iArg, 0, INFINI)<0)
		return -1;
	  pVSB->iLargeChange = iArg;
	  break;

	case CUCP_VALUE:
	  if (pVSB->iValue!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, pVSB->iMin, pVSB->iMax)<0)
		  return -1;
		pVSB->iValue = iArg;
//aprintf("VSB", "Val: %d|Max: %d|Visible:%d", pVSB->iValue, pVSB->iMax, pVSB->iVisible);
		if (pVSB->iVisible) AfficheValeur(pVSB);
		if (pVSB->iRaiseEvent != NULL)
		  pVSB->iRaiseEvent(pVSB->IdBack, CUCE_CHANGE, 0);
	  }
	  break;

	case CUCP_CSIZE:
	  if (pVSB->iCSize!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, pVSB->iHeight-2)<0)
		  return -1;
		pVSB->iCSize = iArg;
		if (pVSB->iVisible) AfficheValeur(pVSB);
	  }
	  break;

	case CUCP_VISIBLE:
	  if (pVSB->iVisible!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
	  
		if (pVSB->iVisible)
		{ Efface(pVSB);
		  if (pVSB->iRaiseEvent != NULL)
			pVSB->iRaiseEvent(pVSB->IdBack, CUCE_HIDE, 0);
		}
		else
		{ if (pVSB->iRaiseEvent != NULL)
			pVSB->iRaiseEvent(pVSB->IdBack, CUCE_SHOW, 0);
		  AfficheValeur(pVSB);
		}
		pVSB->iVisible = iArg;
	  }
	  break;

	case CUCP_ENABLED:
	  if (pVSB->iEnabled!=iArg)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
	  
		pVSB->iEnabled = iArg;
		if (pVSB->iVisible)
		  AfficheValeur(pVSB);
	  }
	  break;

	case CUCP_TABSTOP:
	  pVSB->iTabStop = iArg;
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
// Positionnement d'une propri‚t‚ "void" 
int CUC_VScrollBarSetPropPtr(struct CUC_VScrollBar *pVSB, int iProp,void *pArg)
{
  if(iCtrlType(pVSB, "CUC_VScrollBarSetPropPtr",szNomType)<0)
	return -1;
	
  switch(iProp)
  {
	case CUCP_PARENT:   pVSB->Parent = pArg;    break;
	case CUCP_IDBACK:   pVSB->IdBack = pArg;    break;
	case CUCP_WDISP:    pVSB->wDisp = pArg;     break;

	default:
	  ErrPropNonGeree(szNomClasse, "SetPropPtr",iProp);
	  return -1;
  }
  return 0;     // tout va bien
}
	  
/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_VScrollBarSetPropStr(struct CUC_VScrollBar *pVSB, int iProp, const char *szVal)
{
  if (iCtrlType(pVSB, "CUC_VScrollBarSetPropStr", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_TAG:
	  if (pVSB->szTag!=NULL) free(pVSB->szTag);
	  if (szVal==NULL)
		pVSB->szTag = NULL;
	  else
		pVSB->szTag = strdup(szVal);
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

int CUC_VScrollBarGetPropNum(struct CUC_VScrollBar *pVSB, int iProp)
{
  if (iCtrlType(pVSB, "CUC_VScrollBarGetPropNum", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_LEFT:         return pVSB->iLeft;
	case CUCP_TOP:          return pVSB->iTop;
	case CUCP_WIDTH:        return pVSB->iWidth;
	case CUCP_HEIGHT:       return pVSB->iHeight;
	case CUCP_MIN:          return pVSB->iMin;
	case CUCP_MAX:          return pVSB->iMax;
	case CUCP_SMALLCHANGE:  return pVSB->iSmallChange;
	case CUCP_LARGECHANGE:  return pVSB->iLargeChange;
	case CUCP_VALUE:        return pVSB->iValue;
	case CUCP_CSIZE:        return pVSB->iCSize;
	case CUCP_VISIBLE:      return pVSB->iVisible;
	case CUCP_ENABLED:      return pVSB->iEnabled;
	case CUCP_TABSTOP:      return pVSB->iTabStop;
	case CUCP_FOCUS:        return pVSB->iHasFocus;
	default:
	  ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}


/*====================================================================*/
//Lecture d'une propri‚t‚ void*
void *CUC_VScrollBarGetPropPtr(struct CUC_VScrollBar *pVSB,int iProp)
{
  if(iCtrlType(pVSB,"CUC_VScrollBarGetPropPtr",szNomType)<0)
	return NULL;
  switch(iProp)
  {
	case CUCP_PARENT:   return pVSB->Parent;
	case CUCP_IDBACK:   return pVSB->IdBack;
	case CUCP_WDISP:    return pVSB->wDisp;
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
// Une propri‚t‚ … NULL de fa‡on interne est retourn‚e comme chaŒne nulle.

char *CUC_VScrollBarGetPropStr(struct CUC_VScrollBar *pVSB, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pVSB, "CUC_VScrollBarGetPropStr", szNomType)<0)
	return NULL;
  Assert(szBuffer!=NULL);

  switch(iProp)
  {
	case CUCP_TAG:
	  if (pVSB->szTag==NULL)
		szBuffer[0] = 0;
	  else
		strncpy2(szBuffer, pVSB->szTag, iLBuf);
	  break;

	case CUCP_TYPE:
	  strncpy2(szBuffer, pVSB->szType, iLBuf);
	  break;

	default:
	  ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

static void DoEventKey(struct CUC_VScrollBar *pVSB, int iKey)
{
  int iOldValue = pVSB->iValue;

  switch(iKey)
  {
	case KEY_UP:
	case KEY_LEFT:
	  pVSB->iValue -= pVSB->iSmallChange;
	  if (pVSB->iValue<pVSB->iMin) pVSB->iValue = pVSB->iMin;
	  break;

	case KEY_PGUP:
	  pVSB->iValue -= pVSB->iLargeChange;
	  if (pVSB->iValue<pVSB->iMin) pVSB->iValue = pVSB->iMin;
	  break;

	case KEY_DOWN:
	case KEY_RIGHT:
	  pVSB->iValue += pVSB->iSmallChange;
	  if (pVSB->iValue>pVSB->iMax) pVSB->iValue = pVSB->iMax;
	  break;

	case KEY_PGDN:
	  pVSB->iValue += pVSB->iLargeChange;
	  if (pVSB->iValue>pVSB->iMax) pVSB->iValue = pVSB->iMax;
	  break;

	case KEY_HOME:
	  pVSB->iValue = pVSB->iMin;
	  break;

	case KEY_END:
	  pVSB->iValue = pVSB->iMax;
	  break;
  }
	
  if (pVSB->iValue!=iOldValue)
  { AfficheValeur(pVSB);
	if (pVSB->iRaiseEvent != NULL)
	  pVSB->iRaiseEvent(pVSB->IdBack, CUCE_CHANGE, 0);
  }
}

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_VScrollBarDoEvent(struct CUC_VScrollBar *pVSB, int iEvent, int iArg)
{

  if (iCtrlType(pVSB, "CUC_VScrollBarDoEvent", szNomType)<0)
	return -1;

  switch(iEvent)
  {
	case CUCE_KEY:
	  if (pVSB->iVisible && pVSB->iEnabled)
		DoEventKey(pVSB, iArg);
	  break;

	case CUCE_GOTFOCUS:
	  if (pVSB->iVisible && pVSB->iEnabled)
	  { pVSB->iHasFocus = 1;
		AfficheValeur(pVSB);
	  }
	  break;

	case CUCE_LOSTFOCUS:
	  if (pVSB->iVisible && pVSB->iEnabled)
	  { pVSB->iHasFocus = 0;
		AfficheValeur(pVSB);
	  }
	  break;

	default:
	  aprintf("CUC: CUC_VScrollBarDoEvent", "Ev‚nement %d inconnu !", iEvent);
	  break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_VScrollBarMove(struct CUC_VScrollBar *pVSB, int iLeft, int iTop)
{
  if (iCtrlType(pVSB, "CUC_VScrollBarMove", szNomType)<0)
	return -1;

  if (pVSB->iLeft!=iLeft || pVSB->iTop!=iTop)
  { 
	if (pVSB->iVisible) Efface(pVSB);
	pVSB->iLeft = iLeft;
	pVSB->iTop = iTop;
	if (pVSB->iVisible) AfficheValeur(pVSB);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_VScrollBarResize(struct CUC_VScrollBar *pVSB, int iWidth, int iHeight)
{
  if (iCtrlType(pVSB, "CUC_VScrollBarResize", szNomType)<0)
	return -1;

  if (pVSB->iWidth!=iWidth || pVSB->iHeight!=iHeight)
  { 
	if (pVSB->iVisible) Efface(pVSB);
	pVSB->iWidth = iWidth;
	pVSB->iHeight = iHeight;
	if (pVSB->iVisible) AfficheValeur(pVSB);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine
// Redessine toujours, que le contr“le soit visible ou non

int CUC_VScrollBarRefresh(struct CUC_VScrollBar *pVSB)
{
  if (iCtrlType(pVSB, "CUC_VScrollBarResize", szNomType)<0)
	return -1;

  AfficheValeur(pVSB);
}

/*====================================================================*/
// M‚thode DisplayCursor: le contr“le affiche le curseur clignotant

int CUC_VScrollBarDisplayCursor(struct CUC_VScrollBar *pVSB)
{
  if (iCtrlType(pVSB, "CUC_VScrollBarDisplayCursor", szNomType)<0)
	return -1;

  AfficheCurseur(pVSB);
}
