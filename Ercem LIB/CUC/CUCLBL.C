/* cuclbl.c
** Impl‚mentation du contr“le Label de la bibliothŠque CUC
** 03/06/94 FG
** 26/12/94 PV	CUC_EffaceRectangle; strncpy2; Assert
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

static char szNomClasse[] = "CUC Label";
static char szNomType[]   = "LBL";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_Label
{
  char	szType[4];				// Pour des contr“les internes (LBL)
  
  int	iEnabled;				// Vrai si le contr“le doit r‚agir
  int	iVisible;				// Vrai si le contr“le est affich‚
  int	iHasFocus;				// Vrai si le contr“le a le focus

  int	iTop;					// Nø de ligne … l'‚cran, base 0
  int	iLeft;					// Nø de colonne … l'‚cran, base 0
  int	iWidth;					// Largeur du contr“le en colonnes
  int	iHeight;				// Hauteur du contr“le en lignes

  int	iTabStop;				// Arrˆt sur tabulation
  WINDOW *wDisp;				// Fenˆtre d'affichage du contr“le
  void	*IdBack;				// Identificateur de retour
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour

  int	iAlignment;				// 0: gauche, 1: droite, 2: centr‚
  int	iAutoSize;				// taille ajust‚e … szCaption
  int	iBorderStyle;			// 0: non encadr‚, 1: encadr‚ simple, 2: double
								// !! encadr‚ si iHeight >= 3
  int	iTabSize;				// Valeur en nb d'espaces de la tab
  unsigned char	*szCaption;		// Texte du label
  char	*szTag;					// Tag du contr“le
  void	*Parent;				// Pointeur sur un contr“le parent
  int	iAccelerator;			// CaractŠre de raccourci
};


/*====================================================================*/
// Efface completement le contr“le de l'‚cran (affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver derriŠre (en dessous)

static void Efface(struct CUC_Label *pLBL)
{
  if (iOkWDisp(pLBL->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pLBL->wDisp, pLBL->iTop, pLBL->iLeft, pLBL->iHeight, pLBL->iWidth);
}

/*====================================================================*/
// Redessine le contr“le aprŠs un changement de valeur
// Les extr‚mit‚s (flŠches) ne sont pas dessin‚es

static void AfficheTexte(struct CUC_Label *pLBL)
{
  int i, j=0, k, l;
  unsigned char szLigne[81];
  unsigned char szLigne2[81];
  unsigned char *p;
  int iNbMots=0;
  int iSoul=0;

  if (iOkWDisp(pLBL->wDisp, szNomClasse, "AfficheTexte")<0) return;
  
  if(pLBL->iHeight<=(pLBL->iBorderStyle?2:0) || 
     pLBL->iWidth <=(pLBL->iBorderStyle?2:0) ||
     pLBL->szCaption==NULL                     )
    return;
  if (!pLBL->iEnabled) wattron(pLBL->wDisp, DIMINUE);
  p = pLBL->szCaption;
  /* On est en multi-lignes et on fait du Word Wrap... */
  l = p!=NULL?strlen(p):0;
  for(i=0; i<=l; i++)
  {
    /* Lecture ligne par ligne */
    for(k=0; (i+k)<=(l+iSoul) ; k++)
    { if(k<=80) szLigne[k] = p[i+k];
	  if(szLigne[k]=='\t') szLigne[k] = ' ';
      if(szLigne[k]==' ') iNbMots++;
      if(szLigne[k]=='&') iSoul=1;
      if(szLigne[k]==0 || szLigne[k] == '\n' || szLigne[k]=='|' || (iNbMots && ((k+(pLBL->iBorderStyle?2:0)-iSoul)>=pLBL->iWidth)) ) break;
    }
    if(szLigne[k]=='\n' || szLigne[k]=='|') { szLigne[k] = 0; i += k; }
    else if(iNbMots && szLigne[k]!=0)
    { 
      for(k; k>=0 ; k--)
	if(szLigne[k]==' ') {szLigne[k]=0; i+= k; break;}
    }
    else i=l;
    iNbMots = 0;
    if( szLigne[0] && ((int)strlen(szLigne)+(pLBL->iBorderStyle?2:0)-iSoul) > pLBL->iWidth)
      szLigne[pLBL->iWidth>2?pLBL->iWidth-(pLBL->iBorderStyle?2:0)+iSoul:pLBL->iWidth+iSoul] = 0;

    szLigne2[0] = 0;
    if(pLBL->iAlignment==1) /* Alignement … droite */
    {
      if(szLigne[0] && pLBL->iWidth>((int)strlen(szLigne)+(pLBL->iBorderStyle?2:0)))
		sprintf(szLigne2,"%*c",pLBL->iWidth-(pLBL->iBorderStyle?2:0)-(int)strlen(szLigne),' ');
    }
    else if(pLBL->iAlignment==2) /* centr‚ */
    {
      if(szLigne[0] && pLBL->iWidth>((int)strlen(szLigne)+(pLBL->iBorderStyle?2:0)))
	sprintf(szLigne2,"%*c",(pLBL->iWidth-(pLBL->iBorderStyle?2:0)-strlen(szLigne))/2,' ');
    }

    strcat(szLigne2,szLigne);

    if(iSoul)
    {
      int pos=0;

      for(k=0;szLigne2[k];k++)
      {
		if(szLigne2[k]=='&' && szLigne2[k+1]!='&' &&
		   ((k && szLigne2[k-1]!='&')||(!k && szLigne2[k])))
			wattron(pLBL->wDisp,SOULIGNE);
		else if(szLigne2[k]=='&' && szLigne2[k+1]=='&')
		  /* on passe le premier & */;
		else
		{
		  cmvwaddch(pLBL->wDisp,pLBL->iTop+(pLBL->iBorderStyle?1:0) + j,
					pLBL->iLeft + (pLBL->iBorderStyle?1:0) + pos++,
					szLigne2[k]);
		  if(k && szLigne2[k-1]=='&')
		  {
			wattroff(pLBL->wDisp,SOULIGNE);
			if(szLigne[k] != '&') pLBL->iAccelerator = szLigne2[k];
		  }
		}
      }
      wattroff(pLBL->wDisp,SOULIGNE);
    }
    else
      cmvwaddstr(pLBL->wDisp,
		 pLBL->iTop + (pLBL->iBorderStyle?1:0) + j,
		 pLBL->iLeft + (pLBL->iBorderStyle?1:0),
		 szLigne2);
    iSoul=0;
    j++;
    if((j+(pLBL->iBorderStyle?2:0))>=pLBL->iHeight) break;
  } /* for */
  if (!pLBL->iEnabled) wattroff(pLBL->wDisp, DIMINUE);
}


/*====================================================================*/
// Redessine complŠtement le contr“le

static void Affiche(struct CUC_Label *pLBL)
{
  int i;

  if (iOkWDisp(pLBL->wDisp, szNomClasse, "Affiche")<0) return;
  
  if (!pLBL->iEnabled) wattron(pLBL->wDisp, DIMINUE);
  if(pLBL->iHeight>1 && pLBL->iWidth>1 && pLBL->iBorderStyle)
  {
    unsigned char *pszG;

    pszG = pLBL->iBorderStyle==1?szBoxs:szBoxd;
    cmvwaddch(pLBL->wDisp, pLBL->iTop, pLBL->iLeft, pszG[0]);
    for (i=1; i<=pLBL->iWidth-2 ; i++ )
      cmvwaddch(pLBL->wDisp, pLBL->iTop, pLBL->iLeft+i, pszG[1]);
    cmvwaddch(pLBL->wDisp, pLBL->iTop, pLBL->iLeft+pLBL->iWidth-1, pszG[2]);

    for (i=1 ; i<pLBL->iHeight ; i++)
    { cmvwaddch(pLBL->wDisp, pLBL->iTop+i, pLBL->iLeft, pszG[3]);
      cmvwaddch(pLBL->wDisp, pLBL->iTop+i, pLBL->iLeft+pLBL->iWidth-1, pszG[4]);
    }
    cmvwaddch(pLBL->wDisp, pLBL->iTop+pLBL->iHeight-1, pLBL->iLeft, pszG[5]);
    for (i=1; i<=pLBL->iWidth-2 ; i++ )
      cmvwaddch(pLBL->wDisp, pLBL->iTop+pLBL->iHeight-1, pLBL->iLeft+i, pszG[6]);
    cmvwaddch(pLBL->wDisp, pLBL->iTop+pLBL->iHeight-1, pLBL->iLeft+pLBL->iWidth-1, pszG[7]);
  }
  AfficheTexte(pLBL);
  if (!pLBL->iEnabled) wattroff(pLBL->wDisp, DIMINUE);
}

/*====================================================================*/
// Cr‚ation de la barre de d‚filement

struct CUC_Label *CUC_LabelCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))

{
  struct CUC_Label *pLBL;

  pLBL = (struct CUC_Label *)malloc(sizeof(struct CUC_Label));

  if (pLBL==NULL)
  { aprintf("CUC: CUC_LabelCreate", "Echec au malloc !");
    return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pLBL->wDisp = w;
  pLBL->iRaiseEvent = iRaiseEvent;
  pLBL->IdBack = pLBL;
  pLBL->iHasFocus = 0;
  pLBL->iTop = 0;
  pLBL->iLeft = 0;
  pLBL->iWidth = 10;
  pLBL->iHeight = 1;
  pLBL->szTag = 0;
  pLBL->iEnabled = 1;
  pLBL->iVisible = 0;					// Cr‚‚ invisible
  pLBL->Parent = NULL;
  pLBL->iTabStop = 1;					// Par d‚faut a le TabStop
  strcpy(pLBL->szType, szNomType);		// Choix conventionnel
  pLBL->iAlignment = 0;
  pLBL->iAutoSize = 0;
  pLBL->iBorderStyle = 0;
  pLBL->iTabSize = 8;
  pLBL->szCaption = 0;

  return pLBL;
}

//====================================================================
// Destruction du contr“le label

void CUC_LabelDestruct(struct CUC_Label *pLBL)
{
  if (iCtrlType(pLBL, "CUC_LabelDestruct", szNomType)<0)
    return;

  if (pLBL->szTag!=NULL) free(pLBL->szTag);	// On d‚truit le tag...
  if (pLBL->szCaption!=NULL) free(pLBL->szCaption);
  pLBL->szType[0] = 0;
  free((void *)pLBL);			// puis la structure
}


/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_LabelSetPropNum(struct CUC_Label *pLBL, int iProp, int iArg)
{
  if (iCtrlType(pLBL, "CUC_LabelSetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:
      if (pLBL->iLeft!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pLBL->iVisible) Efface(pLBL);
		pLBL->iLeft = iArg;
		if (pLBL->iVisible) Affiche(pLBL);
      }
      break;

    case CUCP_TOP:
      if (pLBL->iTop!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pLBL->iVisible) Efface(pLBL);
		pLBL->iTop = iArg;
		if (pLBL->iVisible) Affiche(pLBL);
      }
      break;

    case CUCP_WIDTH:
      if(pLBL->iAutoSize) return -1;
      if (pLBL->iWidth!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, pLBL->iBorderStyle?2:1, 80)<0)
		  return -1;
		if (pLBL->iVisible) Efface(pLBL);
		pLBL->iWidth = iArg;
		if (pLBL->iVisible) Affiche(pLBL);
      }
      break;

    case CUCP_HEIGHT:
      if(pLBL->iAutoSize) return -1;
      if (pLBL->iHeight!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, pLBL->iBorderStyle?2:1, 25)<0)
		  return -1;
		if (pLBL->iVisible) Efface(pLBL);
		pLBL->iHeight = iArg;
		if (pLBL->iVisible) Affiche(pLBL);
      }
      break;

    case CUCP_ALIGNMENT:
      if (pLBL->iAlignment!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 2)<0)
		  return -1;
		if (pLBL->iVisible) Efface(pLBL);
		pLBL->iAlignment = iArg;
		if (pLBL->iVisible) Affiche(pLBL);
      }
      break;

    case CUCP_AUTOSIZE:
      if (pLBL->iAutoSize!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		if (pLBL->iVisible) Efface(pLBL);
		pLBL->iAutoSize = iArg;
		if(pLBL->szCaption!=NULL && pLBL->iAutoSize)
		{ int l=0, lMax=0, i, nbL=1;
		  int iWidth, iHeight;
		  for(i=0; i<(int)strlen(pLBL->szCaption); i++)
		  { l++;
			if(pLBL->szCaption[i]=='\n' || pLBL->szCaption[i]=='|')
			{ if(l>lMax) lMax = l;
			  nbL++; l = 0;
			}
		  }
		  iWidth = (lMax + (pLBL->iBorderStyle?2:0))<80?(lMax+(pLBL->iBorderStyle?2:0)):80;
		  iHeight = (nbL + (pLBL->iBorderStyle?2:0))<25?(nbL+(pLBL->iBorderStyle?2:0)):25;
		  if(pLBL->iHeight!=iHeight || pLBL->iWidth!=iWidth)
			if (pLBL->iRaiseEvent != NULL)
			  pLBL->iRaiseEvent(pLBL->IdBack, CUCE_SIZECHANGE, 0);
		  pLBL->iWidth = iWidth;
		  pLBL->iHeight = iHeight;
		}
		if (pLBL->iVisible) Affiche(pLBL);
      }
      break;

    case CUCP_BORDERSTYLE:
      if (pLBL->iBorderStyle!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 2)<0)
		  return -1;
		if (pLBL->iVisible) Efface(pLBL);
		pLBL->iBorderStyle = iArg;
		if (pLBL->iVisible) Affiche(pLBL);
      }
      break;

    case CUCP_TABSIZE:
      if (pLBL->iTabSize!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 20)<0)
		  return -1;
		if (pLBL->iVisible) Efface(pLBL);
		pLBL->iTabSize = iArg;
		if (pLBL->iVisible) Affiche(pLBL);
      }
      break;

    case CUCP_VISIBLE:
      if (pLBL->iVisible!=iArg)
      {
		if (pLBL->iVisible) Efface(pLBL);
		else Affiche(pLBL);
		pLBL->iVisible = iArg;
      }
      break;

    case CUCP_ENABLED:
      if (pLBL->iEnabled!=iArg)
      {
		pLBL->iEnabled = iArg;
		if (pLBL->iVisible) Affiche(pLBL);
      }
      break;

    case CUCP_PARENT:
      pLBL->Parent = (void *)iArg;
      break;

    case CUCP_TABSTOP:
      pLBL->iTabStop = iArg;
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

int CUC_LabelSetPropPtr(struct CUC_Label *pLBL, int iProp, void *pArg)
{
  if (iCtrlType(pLBL, "CUC_LabelSetPropPtr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_PARENT: pLBL->Parent = pArg; break;
    case CUCP_IDBACK: pLBL->IdBack = pArg; break;
	case CUCP_WDISP:  pLBL->wDisp = pArg; break;

    default:
      ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_LabelSetPropStr(struct CUC_Label *pLBL, int iProp, const char *szVal)
{
  if (iCtrlType(pLBL, "CUC_LabelSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pLBL->szTag!=NULL) free(pLBL->szTag);
      if (szVal==NULL)
	pLBL->szTag = NULL;
      else
	pLBL->szTag = strdup(szVal);
      break;

    case CUCP_CAPTION:
      if (pLBL->szCaption!=NULL) free(pLBL->szCaption);
      if (szVal==NULL) pLBL->szCaption = NULL;
      else pLBL->szCaption = strdup(szVal);

      if (pLBL->iVisible) Efface(pLBL);
      if(pLBL->szCaption && pLBL->iAutoSize)
      { int l=0, lMax=0, i, nbL=1;
		int iWidth, iHeight;
		for(i=0; i<(int)strlen(pLBL->szCaption); i++)
		{ l++;
		  if(pLBL->szCaption[i]=='\n' || pLBL->szCaption[i]=='|')
		  { if(l>lMax) lMax = l;
			nbL++; l = 0;
		  }
		}
		iWidth = (lMax + (pLBL->iBorderStyle?2:0))<80?(lMax+(pLBL->iBorderStyle?2:0)):80;
		iHeight = (nbL + (pLBL->iBorderStyle?2:0))<25?(nbL+(pLBL->iBorderStyle?2:0)):25;
		if(pLBL->iHeight!=iHeight || pLBL->iWidth!=iWidth)
		  if (pLBL->iRaiseEvent != NULL)
			pLBL->iRaiseEvent(pLBL->IdBack, CUCE_SIZECHANGE, 0);
		pLBL->iWidth = iWidth;
		pLBL->iHeight = iHeight;
	  }
      if (pLBL->iVisible) Affiche(pLBL);
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

int CUC_LabelGetPropNum(struct CUC_Label *pLBL, int iProp)
{
  if (iCtrlType(pLBL, "CUC_LabelGetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:			return pLBL->iLeft;
    case CUCP_TOP:			return pLBL->iTop;
    case CUCP_WIDTH:		return pLBL->iWidth;
    case CUCP_HEIGHT:		return pLBL->iHeight;
    case CUCP_VISIBLE:		return pLBL->iVisible;
    case CUCP_ENABLED:		return pLBL->iEnabled;
    case CUCP_ALIGNMENT:	return pLBL->iAlignment;
    case CUCP_AUTOSIZE: 	return pLBL->iAutoSize;
    case CUCP_BORDERSTYLE:	return pLBL->iBorderStyle;
    case CUCP_TABSTOP:		return pLBL->iTabStop;
    case CUCP_FOCUS:		return pLBL->iHasFocus;
	case CUCP_ACCELERATOR: 	return pLBL->iAccelerator;
    default:
      ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}


/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_LabelGetPropPtr(struct CUC_Label *pLBL, int iProp)
{
  if (iCtrlType(pLBL, "CUC_LabelGetPropPtr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PARENT:	return pLBL->Parent;
    case CUCP_IDBACK:	return pLBL->IdBack;
	case CUCP_WDISP:  	return pLBL->wDisp;
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

char *CUC_LabelGetPropStr(struct CUC_Label *pLBL, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pLBL, "CUC_LabelGetPropStr", szNomType)<0)
    return NULL;
  Assert(szBuffer!=NULL);

  switch(iProp)
  {
    case CUCP_TAG:
      if (pLBL->szTag==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pLBL->szTag, iLBuf);
      break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pLBL->szType, iLBuf);
      break;

    case CUCP_CAPTION:
      if (pLBL->szCaption==NULL)
	szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pLBL->szCaption, iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

/*
static void DoEventKey(struct CUC_Label *pLBL, int iKey)
{
}
*/

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_LabelDoEvent(struct CUC_Label *pLBL, int iEvent, int iArg)
{

  if (iCtrlType(pLBL, "CUC_LabelDoEvent", szNomType)<0)
    return -1;

  iArg = 0;

  switch(iEvent)
  {
    case CUCE_GOTFOCUS:
      if (pLBL->iVisible && pLBL->iEnabled)
      { pLBL->iHasFocus = 1;
		Affiche(pLBL);
      }
      break;

    case CUCE_LOSTFOCUS:
      if (pLBL->iVisible && pLBL->iEnabled)
      { pLBL->iHasFocus = 0;
		Affiche(pLBL);
      }
      break;

    case CUCE_KEY:
    default:
      aprintf("CUC: CUC_LabelDoEvent", "Ev‚nement %d inconnu pour ce contrôle !", iEvent);
      break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_LabelMove(struct CUC_Label *pLBL, int iTop, int iLeft)
{
  if (iCtrlType(pLBL, "CUC_LabelMove", szNomType)<0)
    return -1;

  if (pLBL->iLeft!=iLeft || pLBL->iTop!=iTop)
  { 
    if (pLBL->iVisible) Efface(pLBL);
    pLBL->iLeft = iLeft;
    pLBL->iTop = iTop;
    if (pLBL->iVisible) Affiche(pLBL);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_LabelResize(struct CUC_Label *pLBL, int iHeight, int iWidth)
{
  if (iCtrlType(pLBL, "CUC_LabelResize", szNomType)<0)
    return -1;

  if (pLBL->iWidth!=iWidth || pLBL->iHeight!=iHeight)
  { 
    if (pLBL->iVisible) Efface(pLBL);
    pLBL->iWidth = iWidth;
    pLBL->iHeight = iHeight;
    if (pLBL->iVisible) Affiche(pLBL);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine

int CUC_LabelRefresh(struct CUC_Label *pLBL)
{
  if (iCtrlType(pLBL, "CUC_LabelResize", szNomType)<0)
    return -1;

  Efface(pLBL);
  Affiche(pLBL);
}
