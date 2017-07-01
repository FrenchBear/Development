/* cucwin.c
** Impl‚mentation de la fenˆtre de la bibliothŠque CUC
**  2/07/94 PV
** 26/12/94 PV	strncpy2
*/

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

static char szNomClasse[] = "CUC Window";
static char szNomType[]   = "WIN";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_Window
{
  char	szType[4];		// Pour des contr“les internes

  int	iVisible;		// Vrai si le contr“le est affich‚
  int	iEnabled;		// Détermine l'affichage activé ou non de la barre de titre

  int	iTop;			// Nø de ligne … l'‚cran, base 0
  int	iLeft;			// Nø de colonne … l'‚cran, base 0
  int	iWidth;			// Largeur du contr“le en colonnes
  int	iHeight;		// Hauteur du contr“le en lignes
  
  int	iTopOffset;		// D‚calage de l'origine
  int	iLeftOffset;

  char	*szTag;			// Tag du contr“le
  
  WINDOW *wDisp;		// Fenˆtre (curses) d'affichage
  int	iFenetreImposee;// wDisp fourni à la cr‚ation de la fenˆtre
  
  void	*IdBack;		// Identificateur de retour
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour
  void	*Parent;		// Pointeur sur un contr“le parent
  
  char	*szCaption;		// Titre
  int	iFlags;			// Options diverses
};


/*====================================================================*/
// Efface completement la fenˆtre de l'‚cran (affiche des espaces)

static void Efface(struct CUC_Window *pWIN)
{
  int i, j;

  if (iOkWDisp(pWIN->wDisp, szNomClasse, "Efface")<0) return;
  
  for (i=0 ; i<pWIN->iHeight ; i++)
    for (j=0 ; j<pWIN->iWidth ; j++)
      cmvwaddch(pWIN->wDisp, pWIN->iTop+i, pWIN->iLeft+j, ' ');
}

/*====================================================================*/
// Redessine la fenˆtre aprŠs un changement de titre

static void AfficheCaption(struct CUC_Window *pWIN)
{ 
  int i;
  UC *p, cFond;
  
  if (iOkWDisp(pWIN->wDisp, szNomClasse, "AfficheCaption")<0) return;

  if (pWIN->iEnabled)
  {
    if (strncmp(ttytype, "znsi", 4)==0)
    {
      cFond = szBoxd[6];		// Sur console ansi, la barre de titre n'est pas affichée en inverse
    }							// à cause de la barre de menus qui est affichée en inverse...
    else
    {
      wattron(pWIN->wDisp, INVERSE);
      cFond = ' ';
    }
  }
  else	// D‚sactiv‚: barre de titre gris‚e
  {
    if (strncmp(ttytype, "ansi", 4)==0)
  	  cFond = 176;
  	else
	  cFond = 177;
  }
  
  // On dessine tout le trait horizontal, en cas de r‚duction de la longueur du titre
  for (i=1 ; i<pWIN->iWidth-1 ; i++ )
	cmvwaddch(pWIN->wDisp, pWIN->iTopOffset, pWIN->iLeftOffset+i, cFond);
	
  if (pWIN->szCaption!=NULL)
  {
	i = (pWIN->iWidth-(int)strlen(pWIN->szCaption))/2;
	if (i<1) i=1;
  
	p = pWIN->szCaption;
	while(*p && i<pWIN->iWidth-1)
	{
      cmvwaddch(pWIN->wDisp, pWIN->iTopOffset, pWIN->iLeftOffset+i, *p);
	  p++;
	  i++;
	}
  }
  
  if (pWIN->iEnabled)
	wattroff(pWIN->wDisp, INVERSE);
}

/*====================================================================*/
// Redessine complŠtement le contr“le

static void Affiche(struct CUC_Window *pWIN)
{
  int i;

  if (iOkWDisp(pWIN->wDisp, szNomClasse, "Affiche")<0) return;
  
  cmvwaddch(pWIN->wDisp, pWIN->iTopOffset, pWIN->iLeftOffset, szBoxd[0]);
  cmvwaddch(pWIN->wDisp, pWIN->iTopOffset, pWIN->iLeftOffset+pWIN->iWidth-1, szBoxd[2]);
  
  // Dessin du cadre
  for (i=1 ; i<pWIN->iHeight-1 ; i++)
  { cmvwaddch(pWIN->wDisp, pWIN->iTopOffset+i, pWIN->iLeftOffset, szBoxd[3]);
    cmvwaddch(pWIN->wDisp, pWIN->iTopOffset+i, pWIN->iLeftOffset+pWIN->iWidth-1, szBoxd[4]);
  }
  cmvwaddch(pWIN->wDisp, pWIN->iTopOffset+pWIN->iHeight-1, pWIN->iLeftOffset, szBoxd[5]);
  for (i=1 ; i<pWIN->iWidth-1 ; i++ )
	cmvwaddch(pWIN->wDisp, pWIN->iTopOffset+pWIN->iHeight-1, pWIN->iLeftOffset+i, szBoxd[6]);
  cmvwaddch(pWIN->wDisp, pWIN->iTopOffset+pWIN->iHeight-1, pWIN->iLeftOffset+pWIN->iWidth-1, szBoxd[7]);
  
  // Dessin du titre
  AfficheCaption(pWIN);
}

/*====================================================================*/
// Cr‚ation de la fenˆtre d'affichage des curses

static void CreeFenetreCurses(struct CUC_Window *pWIN)
{
  if (pWIN->iFenetreImposee==0)
  {
    if (pWIN->wDisp!=NULL) delwin2(pWIN->wDisp);
    pWIN->wDisp = newwin2(pWIN->iHeight, pWIN->iWidth, pWIN->iTop, pWIN->iLeft);
    if (pWIN->wDisp==(WINDOW *)ERR || pWIN->wDisp==NULL)
    { stopcurses();
      printf("cucwin.c (CreeFenetreCurses): Echec … la cr‚ation de la fenˆtre !\n");
      exit(1);
    }
    InitWin(pWIN->wDisp);
  }
}

/*====================================================================*/
// Cr‚ation de la fenˆtre

struct CUC_Window *CUC_WindowCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))
{
  struct CUC_Window *pWIN;

  pWIN = (struct CUC_Window *)malloc(sizeof(struct CUC_Window));

  if (pWIN==NULL)
  { aprintf("CUC: CUC_WindowCreate", "Echec au malloc !");
    return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  strcpy(pWIN->szType, szNomType);	// Pour reconnaître le type
  pWIN->iRaiseEvent = iRaiseEvent;
  pWIN->IdBack = pWIN;	// Par d‚faut IdBack est un ptr sur le contr“le
  pWIN->iTop = 0;
  pWIN->iLeft = 0;
  pWIN->iTopOffset = 0;
  pWIN->iLeftOffset = 0;
  pWIN->iWidth = 10;
  pWIN->iHeight = 10;
  pWIN->szTag = NULL;
  pWIN->szCaption = NULL;
  pWIN->iEnabled = 1;
  pWIN->iVisible = 0;			// Cr‚‚ invisible
  pWIN->Parent = NULL;
  pWIN->iFlags = 0;
  
  if (w!=NULL)
  {
    pWIN->wDisp = w;
    pWIN->iFenetreImposee = 1;
  }
  else
  {
    pWIN->wDisp = NULL;
    pWIN->iFenetreImposee = 0;  // On ne cr‚e pas wDisp tant que la fenˆtre est invisible
  }

  return pWIN;
}

/*====================================================================*/
// Destruction de la fenˆtre

void CUC_WindowDestruct(struct CUC_Window *pWIN)
{
  if (iCtrlType(pWIN, "CUC_WindowDestruct", szNomType)<0)
    return;

  if (pWIN->szTag!=NULL) free(pWIN->szTag);			// On d‚truit le tag...
  if (pWIN->szCaption!=NULL) free(pWIN->szCaption);	// le titre...
  if (pWIN->iFenetreImposee==0 && pWIN->wDisp!=NULL)
    delwin2(pWIN->wDisp);							// la fenˆtre d'affichage...
  pWIN->szType[0] = 0;
  free((void *)pWIN);								// puis la structure
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_WindowSetPropNum(struct CUC_Window *pWIN, int iProp, int iArg)
{
  if (iCtrlType(pWIN, "CUC_WindowSetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:
      if (pWIN->iLeft!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pWIN->iVisible) Efface(pWIN);
		pWIN->iLeft = iArg;
		if (pWIN->iVisible)
		{ CreeFenetreCurses(pWIN);
		  Affiche(pWIN);
		}
      }
      break;

    case CUCP_TOP:
      if (pWIN->iTop!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pWIN->iVisible) Efface(pWIN);
		pWIN->iTop = iArg;
		if (pWIN->iVisible)
		{ CreeFenetreCurses(pWIN);
		  Affiche(pWIN);
		}
      }
      break;

    case CUCP_WIDTH:
      if (pWIN->iWidth!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 80)<0)
		  return -1;
		if (pWIN->iVisible) Efface(pWIN);
		pWIN->iWidth = iArg;
		if (pWIN->iVisible)
		{ CreeFenetreCurses(pWIN);
		  Affiche(pWIN);
		}
      }
      break;

    case CUCP_HEIGHT:
      if (pWIN->iHeight!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 25)<0)
		  return -1;
		if (pWIN->iVisible) Efface(pWIN);
		pWIN->iHeight = iArg;
		if (pWIN->iVisible)
		{ CreeFenetreCurses(pWIN);
		  Affiche(pWIN);
		}
      }
      break;

    case CUCP_VISIBLE:
      if (pWIN->iVisible!=iArg)
      {
		if (pWIN->iVisible)
		{
		  Efface(pWIN);
		  if (pWIN->iFenetreImposee==0 && pWIN->wDisp!=NULL)
		  { delwin2(pWIN->wDisp);
		    pWIN->wDisp = NULL;
		  }
		}
		else
		{ CreeFenetreCurses(pWIN);
		  Affiche(pWIN);
		}
		pWIN->iVisible = iArg;
      }
      break;

    case CUCP_ENABLED:
      if (pWIN->iEnabled!=iArg)
      {
		pWIN->iEnabled = iArg;
		if (pWIN->iVisible)
		  AfficheCaption(pWIN);
      }
      break;

    case CUCP_FLAGS:
      if (pWIN->iFlags!=iArg)
        pWIN->iFlags = iArg;
      break;
      
    default:
      ErrPropNonGeree(szNomClasse, "SetPropNum", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"

int CUC_WindowSetPropPtr(struct CUC_Window *pWIN, int iProp, void *pArg)
{
  if (iCtrlType(pWIN, "CUC_WindowSetPropPtr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_PARENT:	pWIN->Parent = pArg;	break;
    case CUCP_IDBACK:	pWIN->IdBack = pArg;	break;
    case CUCP_WDISP:	pWIN->wDisp = pArg;		break;
    default:
      ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_WindowSetPropStr(struct CUC_Window *pWIN, int iProp, const char *szVal)
{
  if (iCtrlType(pWIN, "CUC_WindowSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pWIN->szTag!=NULL) free(pWIN->szTag);
      if (szVal==NULL)
		pWIN->szTag = NULL;
      else
		pWIN->szTag = strdup(szVal);
      break;

    case CUCP_CAPTION:
      if (pWIN->szCaption!=NULL) free(pWIN->szCaption);
      if (szVal==NULL)
		pWIN->szCaption = NULL;
      else
		pWIN->szCaption = strdup(szVal);
	  if (pWIN->iVisible)
	    AfficheCaption(pWIN);
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

int CUC_WindowGetPropNum(struct CUC_Window *pWIN, int iProp)
{
  if (iCtrlType(pWIN, "CUC_WindowGetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:			return pWIN->iLeft;
    case CUCP_TOP:			return pWIN->iTop;
    case CUCP_WIDTH:		return pWIN->iWidth;
    case CUCP_HEIGHT:		return pWIN->iHeight;
    case CUCP_VISIBLE:		return pWIN->iVisible;
    case CUCP_ENABLED:		return pWIN->iEnabled;
    case CUCP_FLAGS:		return pWIN->iFlags;
    default:
      ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_WindowGetPropPtr(struct CUC_Window *pWIN, int iProp)
{
  if (iCtrlType(pWIN, "CUC_WindowGetPropPtr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PARENT:		return pWIN->Parent;
    case CUCP_IDBACK:		return pWIN->IdBack;
    case CUCP_WDISP:		return pWIN->wDisp;
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

char *CUC_WindowGetPropStr(struct CUC_Window *pWIN, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pWIN, "CUC_WindowGetPropStr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pWIN->szTag==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pWIN->szTag, iLBuf);
      break;

    case CUCP_CAPTION:
      if (pWIN->szCaption==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pWIN->szCaption, iLBuf);
      break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pWIN->szType, iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par la fenˆtre
// Ne traite que l'‚v‚nement clavier, qui ne g‚nŠre aucun traitement !!!!
// (pour simplifier le code du scheduler)

int CUC_WindowDoEvent(struct CUC_Window *pWIN, int iEvent, int iArg)
{

  if (iCtrlType(pWIN, "CUC_WindowDoEvent", szNomType)<0)
    return -1;

  switch(iEvent)
  {
    case CUCE_KEY:
      break;

    default:
      aprintf("CUC: CUC_WindowDoEvent", "Ev‚nement %d inconnu !", iEvent);
      break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_WindowMove(struct CUC_Window *pWIN, int iTop, int iLeft)
{
  if (iCtrlType(pWIN, "CUC_WindowMove", szNomType)<0)
    return -1;

  if (pWIN->iLeft!=iLeft || pWIN->iTop!=iTop)
  { 
    if (pWIN->iVisible) Efface(pWIN);
    pWIN->iLeft = iLeft;
    pWIN->iTop = iTop;
	if (pWIN->iVisible)
	{ CreeFenetreCurses(pWIN);
	  Affiche(pWIN);
	}
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_WindowResize(struct CUC_Window *pWIN, int iHeight, int iWidth)
{
  if (iCtrlType(pWIN, "CUC_WindowResize", szNomType)<0)
    return -1;

  if (pWIN->iWidth!=iWidth || pWIN->iHeight!=iHeight)
  { 
    if (pWIN->iVisible) Efface(pWIN);
    pWIN->iWidth = iWidth;
    pWIN->iHeight = iHeight;
	if (pWIN->iVisible)
	{ CreeFenetreCurses(pWIN);
	  Affiche(pWIN);
	}
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: redessine la fenˆtre

int CUC_WindowRefresh(struct CUC_Window *pWIN)
{
  if (iCtrlType(pWIN, "CUC_WindowResize", szNomType)<0)
    return -1;

  if (pWIN->wDisp!=NULL)
  { Affiche(pWIN);
    wrefresh(pWIN->wDisp);
  }
}
