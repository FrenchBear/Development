/* cucfra.c
** Impl‚mentation du contr“le Frame de la bibliothŠque CUC
** 10/06/94 CR
** 26/12/94 PV	CUC_EffaceRectangle; strncpy2
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

static char szNomClasse[] = "CUC Frame";
static char szNomType[]   = "FRA";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_Frame
{
  char	szType[4];				// Pour des contr“les internes (FRA)
  
  int	iEnabled;				// Vrai si le contr“le doit r‚agir
  int	iVisible;				// Vrai si le contr“le est affich‚
  int	iHasFocus;				// Vrai si le contr“le a le focus

  int	iTop;					// Nø de ligne … l'‚cran, base 0
  int	iLeft;					// Nø de colonne … l'‚cran, base 0
  int	iWidth;					// Largeur du contr“le en colonnes
  int	iHeight;				// Hauteur du contr“le en lignes

  int	iTabStop;				// Arrˆt sur tabulation
  WINDOW *wDisp;				// Fenˆtre (curses) d'affichage du contr“le
  void	*IdBack;				// Identificateur de retour
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour
  char	*szTag;					// Tag du contr“le
  void	*Parent;				// Pointeur sur un contr“le parent

  int	iBorderStyle;			// 0: non encadr‚, 1: encadr‚ simple, 2: double
  unsigned char	*szCaption;		// Texte du contr“le
  int	iAccelerator;			// Touche de racourci
};


/*====================================================================*/
// Efface completement le contr“le de l'‚cran (affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver derriŠre (en dessous)

static void Efface(struct CUC_Frame *pFRA)
{
  if (iOkWDisp(pFRA->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pFRA->wDisp, pFRA->iTop, pFRA->iLeft, pFRA->iHeight, pFRA->iWidth);
}

/*====================================================================*/
// Redessine le contr“le aprŠs un changement de valeur

static void AfficheTexte(struct CUC_Frame *pFRA)
{
  int li=0,i=0,lszCaption;

  if (iOkWDisp(pFRA->wDisp, szNomClasse, "AfficheTexte")<0) return;
  
  if(pFRA->iWidth<=(pFRA->iBorderStyle?3:1)) return;

  lszCaption = (int)strlen(pFRA->szCaption); // Calcule longueur Caption
  while(i<lszCaption)
  {
	if(pFRA->szCaption==NULL)break;
	if(pFRA->szCaption[i]=='&')
	{
       i++;
	   if(pFRA->szCaption[i]=='&')
		  cmvwaddch(pFRA->wDisp,pFRA->iTop,pFRA->iLeft+i+1,pFRA->szCaption[i]);
	   else
	   {
	      wattron(pFRA->wDisp,SOULIGNE);
		  if(pFRA->szCaption[i])
		  {
		    pFRA->iAccelerator = pFRA->szCaption[i];	  
			cmvwaddch(pFRA->wDisp,pFRA->iTop,pFRA->iLeft+i+1,pFRA->szCaption[i]);
		   } 
		  wattroff(pFRA->wDisp,SOULIGNE);
		}  
		li=-1;
    }
	else
	     cmvwaddch(pFRA->wDisp,pFRA->iTop,pFRA->iLeft+i+2+li,pFRA->szCaption[i]);
	if(i==(pFRA->iWidth-4))break;
	i++;
   }
  wmove(pFRA->wDisp,pFRA->iTop,pFRA->iLeft+2); 
}

/*====================================================================*/
// Redessine complŠtement le contr“le

static void Affiche(struct CUC_Frame *pFRA)
{
  int i;

  if (iOkWDisp(pFRA->wDisp, szNomClasse, "Affiche")<0) return;
  
  if (!pFRA->iEnabled) wattron(pFRA->wDisp, DIMINUE);
  if(pFRA->iHeight>1 && pFRA->iWidth>1 && pFRA->iBorderStyle)
  {
    unsigned char *pszG;

    pszG = pFRA->iBorderStyle==1?szBoxs:szBoxd;
    cmvwaddch(pFRA->wDisp, pFRA->iTop, pFRA->iLeft, pszG[0]);
    for (i=1; i<=pFRA->iWidth-2 ; i++ )
      cmvwaddch(pFRA->wDisp, pFRA->iTop, pFRA->iLeft+i, pszG[1]);
    cmvwaddch(pFRA->wDisp, pFRA->iTop, pFRA->iLeft+pFRA->iWidth-1, pszG[2]);

    for (i=1 ; i<pFRA->iHeight ; i++)
    { cmvwaddch(pFRA->wDisp, pFRA->iTop+i, pFRA->iLeft, pszG[3]);
      cmvwaddch(pFRA->wDisp, pFRA->iTop+i, pFRA->iLeft+pFRA->iWidth-1, pszG[4]);
    }
    cmvwaddch(pFRA->wDisp, pFRA->iTop+pFRA->iHeight-1, pFRA->iLeft, pszG[5]);
    for (i=1; i<=pFRA->iWidth-2 ; i++ )
      cmvwaddch(pFRA->wDisp, pFRA->iTop+pFRA->iHeight-1, pFRA->iLeft+i, pszG[6]);
    cmvwaddch(pFRA->wDisp, pFRA->iTop+pFRA->iHeight-1, pFRA->iLeft+pFRA->iWidth-1, pszG[7]);

    AfficheTexte(pFRA);
  }
  if (!pFRA->iEnabled) wattroff(pFRA->wDisp, DIMINUE);
}


/*====================================================================*/
// Cr‚ation de la Frame 

struct CUC_Frame *CUC_FrameCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))

{
  struct CUC_Frame *pFRA;

  pFRA = (struct CUC_Frame *)malloc(sizeof(struct CUC_Frame));

  if (pFRA==NULL)
  { aprintf("CUC: CUC_FrameCreate", "Echec au malloc !");
    return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pFRA->wDisp = w;
  pFRA->iRaiseEvent = iRaiseEvent;
  pFRA->IdBack = pFRA;
  pFRA->iHasFocus = 0;
  pFRA->iTop = 0;
  pFRA->iLeft = 0;
  pFRA->iWidth = 10;
  pFRA->iHeight = 1;
  pFRA->szTag = 0;
  pFRA->iEnabled = 1;
  pFRA->iVisible = 0;			// Cr‚‚ invisible
  pFRA->Parent = NULL;
  pFRA->iTabStop = 1;
  strcpy(pFRA->szType, szNomType);		// Choix conventionnel
  pFRA->iBorderStyle = 1;
  pFRA->szCaption = NULL;

  return pFRA;
}

/*====================================================================*/
// Destruction d'une barre de d‚filement

void CUC_FrameDestruct(struct CUC_Frame *pFRA)
{
  if (iCtrlType(pFRA, "CUC_FrameDestruct", szNomType)<0)
    return;

  if (pFRA->szTag!=NULL) free(pFRA->szTag);			// On d‚truit le tag...
  if (pFRA->szCaption!=NULL) free(pFRA->szCaption);	// Puis la caption  PV 14/7/94...
  pFRA->szType[0] = 0;
  free((void *)pFRA);								// Puis la structure
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_FrameSetPropNum(struct CUC_Frame *pFRA, int iProp, int iArg)
{
  if (iCtrlType(pFRA, "CUC_FrameSetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:
      if (pFRA->iLeft!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pFRA->iVisible) Efface(pFRA);
		pFRA->iLeft = iArg;
		if (pFRA->iVisible) Affiche(pFRA);
      }
      break;

    case CUCP_TOP:
      if (pFRA->iTop!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pFRA->iVisible) Efface(pFRA);
		pFRA->iTop = iArg;
		if (pFRA->iVisible) Affiche(pFRA);
      }
      break;

    case CUCP_WIDTH:
      if (pFRA->iWidth!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, pFRA->iBorderStyle?2:1, 80)<0)
		  return -1;
		if (pFRA->iVisible) Efface(pFRA);
		pFRA->iWidth = iArg;
		if (pFRA->iVisible) Affiche(pFRA);
      }
      break;

    case CUCP_HEIGHT:
      if (pFRA->iHeight!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, pFRA->iBorderStyle?2:1, 25)<0)
		  return -1;
		if (pFRA->iVisible) Efface(pFRA);
		pFRA->iHeight = iArg;
		if (pFRA->iVisible) Affiche(pFRA);
      }
      break;

    case CUCP_BORDERSTYLE:
      if (pFRA->iBorderStyle!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 2)<0)
		  return -1;
		if (pFRA->iVisible) Efface(pFRA);
		pFRA->iBorderStyle = iArg;
		if (pFRA->iVisible) Affiche(pFRA);
      }
      break;

    case CUCP_VISIBLE:
      if (pFRA->iVisible!=iArg)
      {
		if (pFRA->iVisible)
		  Efface(pFRA);
		else
		  Affiche(pFRA);
		pFRA->iVisible = iArg;
      }
      break;

    case CUCP_ENABLED:
      if (pFRA->iEnabled!=iArg)
      {
		pFRA->iEnabled = iArg;
		if (pFRA->iVisible)
		  Affiche(pFRA);
      }
      break;

    case CUCP_TABSTOP:
      pFRA->iTabStop = iArg;
      break;

    case CUCP_FOCUS:
      ErrPropLectureSeule(szNomClasse, "SetPropNum", iProp);
      return -1;

    default:
      ErrPropNonGeree(szNomClasse, "SetPropNum", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}



/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"

int CUC_FrameSetPropPtr(struct CUC_Frame *pFRA, int iProp, void *pArg)
{
  if (iCtrlType(pFRA, "CUC_FrameSetPropPtr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_PARENT:	pFRA->Parent = pArg;	break;
    case CUCP_IDBACK:	pFRA->IdBack = pArg;	break;
    case CUCP_WDISP:	pFRA->wDisp = pArg;		break;
    default:
      ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_FrameSetPropStr(struct CUC_Frame *pFRA, int iProp, const char *szVal)
{
  if (iCtrlType(pFRA, "CUC_FrameSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pFRA->szTag!=NULL) free(pFRA->szTag);
      if (szVal==NULL)
		pFRA->szTag = NULL;
      else
		pFRA->szTag = strdup(szVal);
      break;

    case CUCP_CAPTION:
      if (pFRA->iVisible) Efface(pFRA);
      if (pFRA->szCaption!=NULL) free(pFRA->szCaption);
      if (szVal==NULL)
		pFRA->szCaption = NULL;
      else
		pFRA->szCaption = strdup(szVal);
      if (pFRA->iVisible) Affiche(pFRA);
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
// Lecture d'une propri‚t‚ num‚rique

int CUC_FrameGetPropNum(struct CUC_Frame *pFRA, int iProp)
{
  if (iCtrlType(pFRA, "CUC_FrameGetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:			return pFRA->iLeft;
    case CUCP_TOP:			return pFRA->iTop;
    case CUCP_WIDTH:		return pFRA->iWidth;
    case CUCP_HEIGHT:		return pFRA->iHeight;
    case CUCP_VISIBLE:		return pFRA->iVisible;
    case CUCP_ENABLED:		return pFRA->iEnabled;
    case CUCP_BORDERSTYLE:	return pFRA->iBorderStyle;
    case CUCP_TABSTOP:		return pFRA->iTabStop;
    case CUCP_FOCUS:		return pFRA->iHasFocus;
    case CUCP_ACCELERATOR:	return pFRA->iAccelerator;
	default:
      ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}


/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_FrameGetPropPtr(struct CUC_Frame *pFRA, int iProp)
{
  if (iCtrlType(pFRA, "CUC_FrameGetPropPtr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PARENT:		return pFRA->Parent;
    case CUCP_IDBACK:		return pFRA->IdBack;
    case CUCP_WDISP:		return pFRA->wDisp;
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

char *CUC_FrameGetPropStr(struct CUC_Frame *pFRA, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pFRA, "CUC_FrameGetPropStr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pFRA->szTag==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pFRA->szTag, iLBuf);
      break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pFRA->szType, iLBuf);
      break;

    case CUCP_CAPTION:
      if (pFRA->szCaption==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pFRA->szCaption, iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_FrameDoEvent(struct CUC_Frame *pFRA, int iEvent, int iArg)
{

  if (iCtrlType(pFRA, "CUC_FrameDoEvent", szNomType)<0)
    return -1;

  iArg = 0;

  switch(iEvent)
  {
    case CUCE_GOTFOCUS:
      if (pFRA->iVisible && pFRA->iEnabled)
      { pFRA->iHasFocus = 1;
		Affiche(pFRA);
      }
      break;

    case CUCE_LOSTFOCUS:
      if (pFRA->iVisible && pFRA->iEnabled)
      { pFRA->iHasFocus = 0;
		Affiche(pFRA);
      }
      break;

    case CUCE_KEY:
    default:
      aprintf("CUC: CUC_FrameDoEvent", "Ev‚nement %d inconnu de ce contrôle !", iEvent);
      break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_FrameMove(struct CUC_Frame *pFRA, int iTop, int iLeft)
{
  if (iCtrlType(pFRA, "CUC_FrameMove", szNomType)<0)
    return -1;

  if (pFRA->iLeft!=iLeft || pFRA->iTop!=iTop)
  { 
    if (pFRA->iVisible) Efface(pFRA);
    pFRA->iLeft = iLeft;
    pFRA->iTop = iTop;
    if (pFRA->iVisible) Affiche(pFRA);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_FrameResize(struct CUC_Frame *pFRA, int iHeight, int iWidth)
{
  if (iCtrlType(pFRA, "CUC_FrameResize", szNomType)<0)
    return -1;

  if (pFRA->iWidth!=iWidth || pFRA->iHeight!=iHeight)
  { 
    if (pFRA->iVisible) Efface(pFRA);
    pFRA->iWidth = iWidth;
    pFRA->iHeight = iHeight;
    if (pFRA->iVisible) Affiche(pFRA);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine

int CUC_FrameRefresh(struct CUC_Frame *pFRA)
{
  if (iCtrlType(pFRA, "CUC_FrameResize", szNomType)<0)
    return -1;

  Affiche(pFRA);
}
