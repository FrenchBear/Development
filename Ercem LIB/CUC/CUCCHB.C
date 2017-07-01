/* cucchb.c 
** Impl‚mentation du contr“le case … cocher de la bibliothŠque CUC
** 3/06/94	Christophe R.
** 19/11/94	PV	Largeur minimum … 3 et non … 4 (sans texte)
** 26/12/94 PV	CUC_EffaceRectangle; strncpy2; Assert
** 16/02/95 FG	Curseur correct si case … droite du texte
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

static char szNomClasse[] = "CUC CheckBox";
static char szNomType[]   = "CHB";

// prototype
static void AfficheValeur(struct CUC_CheckBox *pCHB);

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_CheckBox
{
  char	szType[4];	// Pour des contr“les internes (CHB)

  int	iEnabled;	// Vrai si le contr“le doit r‚agir
  int	iVisible;	// Vrai si le contr“le est affich‚
  int	iHasFocus;	// Vrai si le contr“le a le focus

  int	iTop;		// Nø de ligne … l'‚cran, base 0
  int	iLeft;		// Nø de colonne … l'‚cran, base 0
  int	iWidth;		// Largeur du contr“le en colonnes
  int	iHeight;	// Hauteur du contr“le en lignes

  int	iTabStop;	// Arrˆt sur tabulation

  WINDOW *wDisp;	// Fenˆtre (curses) d'affichage du contr“le
  void  *IdBack	;	//Identificateur de retour
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour
  char	*szTag;		// Tag du contr“le
  void	*Parent;	// Pointeur sur un contr“le parent

  int	iValue;		// Valeur actuelle du curseur
  unsigned char  *szCaption;	// poiteur du texte a placer a cote 
					// de la case … cocher
  int   iTriState;	// vrai: 3 etats; faux: 2 etats
  int   iAlign 	;	// 0: croix a gauche du texte
					// 1: croix a droit du texte	
  int   iAccelerator; // touche de racourcie
};

/*====================================================================*/
// Efface completement le contr“le de l'‚cran (Affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver derriŠre

static void Efface(struct CUC_CheckBox  *pCHB)
{
  if (iOkWDisp(pCHB->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pCHB->wDisp, pCHB->iTop, pCHB->iLeft, pCHB->iHeight, pCHB->iWidth);
}

/*====================================================================*/
// Affiche le curseur clignotant au bon endroit

static void AfficheCurseur(struct CUC_CheckBox *pCHB)
{
  if (iOkWDisp(pCHB->wDisp, szNomClasse, "AfficheCurseur")<0) return;
  
  if(pCHB->iAlign==0)
	wmove(pCHB->wDisp, pCHB->iTop, pCHB->iLeft+1);
  else
	wmove(pCHB->wDisp, pCHB->iTop, pCHB->iWidth+pCHB->iLeft-2);
}

/*====================================================================*/
// Affiche les valeurs dans les crochets

static void AfficheValeur(struct CUC_CheckBox *pCHB)
{
  int C;
  
  if (iOkWDisp(pCHB->wDisp, szNomClasse, "AfficheValeur")<0) return;
  
  switch(pCHB->iValue)
  {
	case -1:
	{
	  if(pCHB->iEnabled==TRUE)
	    if(pCHB->iHasFocus==TRUE)
		  C=INVERSE;
	    else C=0;
	  else 
	    C=BRILLANT;
	  wattron(pCHB->wDisp,C);
	  if(pCHB->iAlign==0)
		cmvwaddstr(pCHB->wDisp,pCHB->iTop,pCHB->iLeft,"[-]");
	  if(pCHB->iAlign==1)
		  cmvwaddstr(pCHB->wDisp,pCHB->iTop,pCHB->iLeft-3+pCHB->iWidth,"[-]");
	  wattroff(pCHB->wDisp,C);
	  break;
    }
    
    case 0:
	{
	   if(pCHB->iEnabled==TRUE)
	       if(pCHB->iHasFocus==TRUE)C=INVERSE;
	       else C=0;
	   else
	       C=BRILLANT;
	   wattron(pCHB->wDisp,C);
	   if(pCHB->iAlign==0)
		cmvwaddstr(pCHB->wDisp,pCHB->iTop,pCHB->iLeft,"[ ]");
	   if(pCHB->iAlign==1)
		cmvwaddstr(pCHB->wDisp,pCHB->iTop,pCHB->iLeft-3+pCHB->iWidth,"[ ]");
	   wattroff(pCHB->wDisp,C);
	   
	   break;
	}
	
	case 1:  
	{
	   if(pCHB->iEnabled==TRUE)
	       if(pCHB->iHasFocus==TRUE)C=INVERSE;
	       else C=0; 
	   else 
	       C=BRILLANT;
	   wattron(pCHB->wDisp,C);
	   if(pCHB->iAlign==0)
		cmvwaddstr(pCHB->wDisp,pCHB->iTop,pCHB->iLeft,"[x]");
	   if(pCHB->iAlign==1)
		  cmvwaddstr(pCHB->wDisp,pCHB->iTop,pCHB->iLeft-3+pCHB->iWidth,"[x]");
	   wattroff(pCHB->wDisp,C);
	   
	   break;
	}
    default:
      aprintf("CUC CheckBox: AfficheValeur", "Valeur %d incorrecte pour iValue !", pCHB->iValue);
  }

  AfficheCurseur(pCHB);
}

/*====================================================================*/
// Redessine le contr“le aprŠs un changement de valeur

static void Affiche(struct CUC_CheckBox *pCHB)
{
  int	i, K=0, fin, Li=0, j=0, Borne, lszCaption;
  char	c;
     
  Efface(pCHB);			// Le test de validité d'affichage sera fait dans Efface
  AfficheValeur(pCHB);
  if(pCHB->iEnabled==FALSE)
  {
    wattron(pCHB->wDisp,BRILLANT);
    j=1;				//test du griser 
  }

  if(pCHB->iAlign==1)  	// alignement a droite
    Borne=0;
  else 					// alignement a gauche
	Borne=4;
	
  i=0;
  fin=0;
  lszCaption = pCHB->szCaption!=NULL?(int)strlen(pCHB->szCaption):0;
					// Calcule longueur Caption
  while(i<lszCaption)     	//debut boucle
  {   
    if (pCHB->szCaption==0) return;
    if (fin==(pCHB->iWidth-4+K)) break; 
	c=pCHB->szCaption[i];
	if(c=='\t')    		//test tabulation
	{
	  c=' '; 
	  pCHB->szCaption[i]=c;
    }
	if((c=='\n')||(c=='|'))               //test nouvelle ligne 
	{ 	
	  if(pCHB->iHeight>1)
	  {
		Li++;
		fin=-1;
		K=0;
	  }
	  else
	    break;
	  i++;
	  fin++;	
	}
	if (pCHB->szCaption[i]=='&')  //test touche de racourci
	{
	  i++;
	  fin++;
	  K=1;
	  if (pCHB->szCaption[i]=='&')  //si vrai affichage du &
		cmvwaddch(pCHB->wDisp,pCHB->iTop+Li,pCHB->iLeft+Borne+fin-K,pCHB->szCaption[i]);
	  else
	  {
		wattron(pCHB->wDisp,SOULIGNE);
		if (pCHB->szCaption[i]) 
		{
		  pCHB->iAccelerator = pCHB->szCaption[i];
		  cmvwaddch(pCHB->wDisp,pCHB->iTop+Li,pCHB->iLeft+fin-K+Borne,pCHB->szCaption[i]);
		}
		wattroff(pCHB->wDisp,SOULIGNE);
	  }
	}
	else
	{
	  if (pCHB->szCaption[i]==0) break;
	  cmvwaddch(pCHB->wDisp,pCHB->iTop+Li,pCHB->iLeft-K+fin+Borne,pCHB->szCaption[i]);
	}
	i++;
	fin++;
  }
  //fin bouche affichage      	

  if(j=1)	wattroff(pCHB->wDisp,BRILLANT);
  AfficheValeur(pCHB);
  return;
}

/*====================================================================*/
// Cr‚ation de la case … cocher

struct CUC_CheckBox *CUC_CheckBoxCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))
{
  struct  CUC_CheckBox *pCHB;

  pCHB = (struct  CUC_CheckBox *)malloc(sizeof(struct CUC_CheckBox));

  if (pCHB==NULL)
  { aprintf("CUC: CUC_CheckBoxCreate", "Echec au malloc !");
    return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pCHB->wDisp = w;
  pCHB->iRaiseEvent = iRaiseEvent;
  pCHB->iHasFocus = 0;
  pCHB->iTop = 0;
  pCHB->iLeft = 0;
  pCHB->iWidth = 1;
  pCHB->iHeight = 1;
  pCHB->iValue = 0;
  pCHB->szTag = 0;
  pCHB->iEnabled = 1;
  pCHB->iVisible = 0;			// Le contr“le cr‚‚ est invisible
  pCHB->Parent = NULL;
  pCHB->iTabStop = 1;
  pCHB->iTriState = 0;
  pCHB->iAlign = 0;
  pCHB->szCaption = NULL;
  strcpy(pCHB->szType, szNomType);		// Choix conventionnel

  return pCHB;
}

/*====================================================================*/
// Destruction d'une case … cocher

void CUC_CheckBoxDestruct(struct CUC_CheckBox *pCHB)
{
  if (iCtrlType(pCHB, "CUC_CheckBoxDestruct", szNomType)<0)
    return;

  if (pCHB->szTag!=NULL) free(pCHB->szTag);	// On d‚truit le tag...
  if (pCHB->szCaption!=NULL) free(pCHB->szCaption);
  pCHB->szType[0] = 0;
  free((void *)pCHB);			// puis la structure
}


/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_CheckBoxSetPropNum(struct CUC_CheckBox *pCHB, int iProp, int iArg)

{
  if (iCtrlType(pCHB, "CUC_CheckBoxSetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_ALIGNMENT:
    {
      if (pCHB->iAlign!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0,1 )<0)
		  return -1;
		if (pCHB->iVisible) Efface(pCHB);
		pCHB->iAlign = iArg;
		if (pCHB->iVisible) Affiche(pCHB);
      }
      break;
    }
    case CUCP_TRISTATE:
    {
      if (pCHB->iTriState!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0,1 )<0)
		  return -1;
		if (pCHB->iVisible) Efface(pCHB);
		pCHB->iTriState = iArg;
		if (pCHB->iVisible) Affiche(pCHB);
      }
      break;
    }
    case CUCP_VALUE:
    {
      if (pCHB->iValue!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, -1, 1)<0)
		  return -1;
		if (pCHB->iVisible) Efface(pCHB);
		pCHB->iValue = iArg;
		if (pCHB->iVisible) Affiche(pCHB);
      }
      break;
    }

    case CUCP_LEFT:
    {
    if (pCHB->iLeft!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pCHB->iVisible) Efface(pCHB);
		pCHB->iLeft = iArg;
		if (pCHB->iVisible) Affiche(pCHB);
      }
      break;
    } 	
    case CUCP_TOP:
      if (pCHB->iTop!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pCHB->iVisible) Efface(pCHB);
		  pCHB->iTop = iArg;
		if (pCHB->iVisible) Affiche(pCHB);
      }
      break;

    case CUCP_WIDTH:
      if (pCHB->iWidth!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 3, 79)<0)
		  return -1;
		if (pCHB->iVisible) Efface(pCHB);
		pCHB->iWidth = iArg;
		if (pCHB->iVisible) Affiche(pCHB);
      }
      break;

    case CUCP_HEIGHT:
      if (pCHB->iHeight!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 80)<0)
		  return -1;
		if (pCHB->iVisible) Efface(pCHB);
		pCHB->iHeight = iArg;
		if (pCHB->iVisible) Affiche(pCHB);
      }
      break;

    case CUCP_VISIBLE:
      if (pCHB->iVisible!=iArg)
      {
		if (pCHB->iVisible)
		  Efface(pCHB);
		else
		  Affiche(pCHB);
		pCHB->iVisible = iArg;
      }
      break;

    case CUCP_ENABLED:
      if (pCHB->iEnabled!=iArg)
      {
		pCHB->iEnabled = iArg;
		if (pCHB->iVisible)
		  Affiche(pCHB);
      }
      break;

    case CUCP_TABSTOP:
      pCHB->iTabStop = iArg;
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
// Positionnement d'une propri‚t‚ "void" 
int CUC_CheckBoxSetPropPtr(struct CUC_CheckBox *pCHB, int iProp,void *pArg)
{
 if(iCtrlType(pCHB, "CUC_CheckBoxSetPropPtr",szNomType)<0)
	return -1;

  switch(iProp)
  {
    case CUCP_PARENT:	pCHB->Parent = pArg;	break;
    case CUCP_IDBACK:	pCHB->IdBack = pArg;	break;
    case CUCP_WDISP:	pCHB->wDisp = pArg;		break;
    default:
      ErrPropNonGeree(szNomClasse, "SetPropPtr",iProp);
      return -1;
  }
  return 0;	// tout va bien!!!!
}
/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_CheckBoxSetPropStr(struct CUC_CheckBox *pCHB, int iProp, const char *szVal)
{
  if (iCtrlType(pCHB, "CUC_CheckBoxSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_CAPTION:
      if(pCHB->szCaption!=NULL) free(pCHB->szCaption);

      if(szVal==NULL) strcpy(pCHB->szCaption," ");
      else
	  {
		pCHB->szCaption = malloc(strlen(szVal)+1);
		strcpy(pCHB->szCaption,szVal);
	  }
	  if (pCHB->iVisible) Affiche(pCHB);
      break;

    case CUCP_TAG:
      if (pCHB->szTag!=NULL) free(pCHB->szTag);
      if (szVal==NULL) pCHB->szTag = NULL;
      else pCHB->szTag = strdup(szVal);
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

int CUC_CheckBoxGetPropNum(struct CUC_CheckBox *pCHB, int iProp)
{
  if (iCtrlType(pCHB, "CUC_CheckBoxGetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:		return pCHB->iLeft;
    case CUCP_TOP:		return pCHB->iTop;
    case CUCP_WIDTH:	return pCHB->iWidth;
    case CUCP_HEIGHT:	return pCHB->iHeight;
    case CUCP_VALUE:	return pCHB->iValue;
    case CUCP_VISIBLE:	return pCHB->iVisible;
    case CUCP_ENABLED:	return pCHB->iEnabled;
    case CUCP_TABSTOP:	return pCHB->iTabStop;
    case CUCP_FOCUS:	return pCHB->iHasFocus;
    case CUCP_ALIGNMENT:return pCHB->iAlign;
    case CUCP_TRISTATE: return pCHB->iTriState;
	case CUCP_ACCELERATOR: return pCHB->iAccelerator; 
	default:
      ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_CheckBoxGetPropPtr(struct CUC_CheckBox *pCHB, int iProp)
{
  if (iCtrlType(pCHB, "CUC_CheckBoxGetPropPtr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PARENT:	return pCHB->Parent;
    case CUCP_IDBACK:	return pCHB->IdBack;
    case CUCP_WDISP:	return pCHB->wDisp;
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

char *CUC_CheckBoxGetPropStr(struct CUC_CheckBox *pCHB, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pCHB, "CUC_CheckBoxGetPropStr", szNomType)<0)
    return NULL;
  Assert(szBuffer!=NULL);

  switch(iProp)
  {
    case CUCP_CAPTION:  
	   if(pCHB->szCaption==NULL)
		 szBuffer[0]=0;
	   else
		 strncpy2(szBuffer,pCHB->szCaption,iLBuf);
	   break;
	
	case CUCP_TAG:
      if (pCHB->szTag==NULL)
		szBuffer[0] = 0;
      else
		strncpy2(szBuffer, pCHB->szTag, iLBuf);
      break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pCHB->szType, iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}
/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

static void DoEventKey(struct CUC_CheckBox  *pCHB, int iKey)
{
  int iOldValue = pCHB->iValue;

  switch(iKey)
  {
   case ' ':
	if(pCHB->iTriState==1)
	{
	  if(pCHB->iValue==-1)
		pCHB->iValue=0;
	  else 
		if(pCHB->iValue==0)
		  pCHB->iValue=1;
		else 
		  pCHB->iValue=-1;
	}
	if(pCHB->iTriState==0)
	{
	  if(pCHB->iValue==0)
		pCHB->iValue=1;
	  else 
		pCHB->iValue=0;
	}
	
	if (pCHB->iValue!=iOldValue)
	{ AfficheValeur(pCHB);
	  if (pCHB->iRaiseEvent != NULL)
	    pCHB->iRaiseEvent(pCHB->IdBack, CUCE_CHANGE, 0);
	}
  } // switch iKey
}

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_CheckBoxDoEvent(struct CUC_CheckBox *pCHB, int iEvent, int iArg)
{

  if (iCtrlType(pCHB, "CUC_CheckBoxDoEvent", szNomType)<0)
    return -1;

  switch(iEvent)
  {
    case CUCE_KEY:
      if (pCHB->iVisible && pCHB->iEnabled)
		DoEventKey(pCHB, iArg);
      break;

    case CUCE_GOTFOCUS:
      if (pCHB->iVisible && pCHB->iEnabled)
      { pCHB->iHasFocus = 1;
		AfficheValeur(pCHB);
      }
      break;

    case CUCE_LOSTFOCUS:
      if (pCHB->iVisible && pCHB->iEnabled)
      { pCHB->iHasFocus = 0;
		AfficheValeur(pCHB);
      }
      break;

    default:
      aprintf("CUC: CUC_CheckBoxDoEvent", "Ev‚nement %d inconnu !", iEvent);
      break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_CheckBoxMove(struct CUC_CheckBox *pCHB, int iTop, int iLeft)
{
  if (iCtrlType(pCHB, "CUC_CheckBoxMove", szNomType)<0)
    return -1;

  if (pCHB->iLeft!=iLeft || pCHB->iTop!=iTop)
  { 
    if (pCHB->iVisible) Efface(pCHB);
    pCHB->iLeft = iLeft;
    pCHB->iTop = iTop;
    if (pCHB->iVisible) Affiche(pCHB);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_CheckBoxResize(struct CUC_CheckBox *pCHB, int iHeight, int iWidth)
{
  if (iCtrlType(pCHB, "CUC_CheckBoxResize", szNomType)<0)
    return -1;

  if (pCHB->iWidth!=iWidth || pCHB->iHeight!=iHeight)
  { 
    if (pCHB->iVisible) Efface(pCHB);
    pCHB->iWidth = iWidth;
    pCHB->iHeight = iHeight;
    if (pCHB->iVisible) Affiche(pCHB);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine

int CUC_CheckBoxRefresh(struct CUC_CheckBox *pCHB)
{
  if (iCtrlType(pCHB, "CUC_CheckBoxResize", szNomType)<0)
    return -1;

  if (pCHB->iVisible) Affiche(pCHB);
}

/*====================================================================*/
// M‚thode DisplayCursor: le contr“le affiche le curseur clignotant

int CUC_CheckBoxDisplayCursor(struct CUC_CheckBox *pCHB)
{
  if (iCtrlType(pCHB, "CUC_CheckBoxDisplayCursor", szNomType)<0)
    return -1;

  AfficheCurseur(pCHB);
}

