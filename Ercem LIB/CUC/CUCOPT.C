/* cucopt.c 
** Impl‚mentation du contr“le case … options de la bibliothŠque CUC
**  7/06/94 Christophe R.
** 11/09/94 PV	Traitement de l'evt KEY mˆme invisible
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

static char szNomClasse[] = "CUC OptionButton";
static char szNomType[]   = "OPT";


// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_OptionButton
{
  char	szType[4];				// Pour des contr“les internes (OPT)

  int	iEnabled;				// Vrai si le contr“le doit r‚agir
  int	iVisible;				// Vrai si le contr“le est affich‚
  int	iHasFocus;				// Vrai si le contr“le a le focus

  int	iTop;					// Nø de ligne … l'‚cran, base 0
  int	iLeft;					// Nø de colonne … l'‚cran, base 0
  int	iWidth;					// Largeur du contr“le en colonnes
  int	iHeight;				// Hauteur du contr“le en lignes

  int	iTabStop;				// Arrˆt sur tabulation
  WINDOW *wDisp;				// Fenˆtre d'affichage du contr“le
  void  *IdBack;				// Identificateur de retour 
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour
  char	*szTag;					// Tag du contr“le
  void	*Parent;				// pointeur sur un contr“le parent

  unsigned char *szCaption;		// Texte de la case
  int   iAlign;					// 0: alignement … gauche, 1 … droite
  int	iAccelerator;			// CaractŠre de raccourci 

  int	iValue;					// Valeur actuelle de la case

  struct CUC_OptionButton *suiv; // pointe le bouton suivant
};

/*====================================================================*/
// Liste chaŒn‚e priv‚e des contr“les

static struct CUC_OptionButton *pOPTFirst = NULL;   // D‚but de chaŒne

/*====================================================================*/
// Efface completement le contr“le de l'‚cran (Affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver derriŠre

static void Efface(struct CUC_OptionButton  *pOPT)
{
  if (iOkWDisp(pOPT->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pOPT->wDisp, pOPT->iTop, pOPT->iLeft, pOPT->iHeight, pOPT->iWidth);
}

/*====================================================================*/
// Affiche le curseur clignotant au bon endroit

static void AfficheCurseur(struct CUC_OptionButton *pOPT)
{
  if (iOkWDisp(pOPT->wDisp, szNomClasse, "AfficheCurseur")<0) return;
  
  if (pOPT->iAlign==0)
    wmove(pOPT->wDisp,pOPT->iTop,pOPT->iLeft+1);
  else
    wmove(pOPT->wDisp,pOPT->iTop,pOPT->iWidth+pOPT->iLeft);
}

/*====================================================================*/
//affiche les valeurs dans les parenthŠses 

static void AfficheValeur(struct CUC_OptionButton *pOPT)
{
  int C;

  if (iOkWDisp(pOPT->wDisp, szNomClasse, "AfficheValeur")<0) return;

  switch(pOPT->iValue)
  {
	case 0:
	{
	  if(pOPT->iEnabled==TRUE)
		if(pOPT->iHasFocus==TRUE) C=INVERSE;
		else C=0;
	  else
		C=BRILLANT;
	  wattron(pOPT->wDisp,C);
	  if (pOPT->iAlign==0)
		cmvwaddstr(pOPT->wDisp,pOPT->iTop,pOPT->iLeft,"( )");
	  if (pOPT->iAlign==1)
		cmvwaddstr(pOPT->wDisp,pOPT->iTop,pOPT->iLeft-3+pOPT->iWidth,"( )");
	  wattroff(pOPT->wDisp,C);

	  break;
	}

	case 1:  
	{
	  if(pOPT->iEnabled==TRUE)
	    if(pOPT->iHasFocus==TRUE)C=INVERSE;
		else C=0; 
	  else 
		C=BRILLANT;
	  wattron(pOPT->wDisp,C);
	  if(pOPT->iAlign==0)
	    cmvwaddstr(pOPT->wDisp,pOPT->iTop,pOPT->iLeft,"(o)");
	  if(pOPT->iAlign==1)
	    cmvwaddstr(pOPT->wDisp,pOPT->iTop,pOPT->iLeft-3+pOPT->iWidth,"(o)");
	  wattroff(pOPT->wDisp,C);
	 
	  break;
    }

	default:
	  aprintf("CUC OptionButton: AfficheValeur", "Propri‚t‚ texte %d inconnue !", pOPT->iValue);
  }

  AfficheCurseur(pOPT);

}

/*====================================================================*/
// Redessine le contr“le aprŠs un changement de valeur

static void Affiche(struct CUC_OptionButton *pOPT)
{
   int i,K=0,fin,Li=0,j=0,Borne,lszCaption;
   char c;
   
   Efface(pOPT); 					// Vérifie la validité de wDisp
   AfficheValeur(pOPT);
   if(pOPT->iEnabled==FALSE)
   { wattron(pOPT->wDisp,BRILLANT);
	 j=1;							// test du gris‚
   }

   if(pOPT->iAlign==1)				// alignement … droite
	 Borne=0;
   else 							// alignement … gauche
	 Borne=4;
  
  i = 0;
  fin = 0;
  lszCaption = pOPT->szCaption!=NULL?(int)strlen(pOPT->szCaption):0;

  while(i<lszCaption)
  {   
	if (pOPT->szCaption==0)return;
	if (fin>=(pOPT->iWidth-4+K))break; 
	c = pOPT->szCaption[i];
	if(c=='\t')						// test tabulation
	{
	  c=' '; 
	  pOPT->szCaption[i]=c;
	}
	if(c=='\n' || c=='|')			// test nouvelle ligne 
	{ 	
	  if(pOPT->iHeight>1)
	  {
		Li++; fin=-1; K=0;
	  }
	  else break;
	  i++;
	  fin++;	
	}
	if(pOPT->szCaption[i]=='&')		// test touche de raccourci
	{
	 i++;
	 fin++;
	 K=1;
	 if(pOPT->szCaption[i]=='&')	// si vrai affichage du &
		cmvwaddch(pOPT->wDisp,pOPT->iTop+Li,pOPT->iLeft+Borne+fin-K,pOPT->szCaption[i]);
	 else
	 {
		wattron(pOPT->wDisp,SOULIGNE);
		if(pOPT->szCaption[i])
		{
		  pOPT->iAccelerator = pOPT->szCaption[i];
		  cmvwaddch(pOPT->wDisp,pOPT->iTop+Li,pOPT->iLeft+fin-K+Borne,pOPT->szCaption[i]);
		}
		wattroff(pOPT->wDisp,SOULIGNE);
	 }
	}
	else
	{
	 if(pOPT->szCaption[i]==0)break;
	   cmvwaddch(pOPT->wDisp,pOPT->iTop+Li,pOPT->iLeft-K+fin+Borne,pOPT->szCaption[i]);
	}
	i++; fin++;

  } //fin bouche affichage      	

  if(j=1)	wattroff(pOPT->wDisp,BRILLANT);
  AfficheValeur(pOPT);
  return;
}

/*====================================================================*/
// Cr‚ation de la case … cocher

struct CUC_OptionButton *CUC_OptionButtonCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))
{
  struct  CUC_OptionButton *pOPT;

  pOPT = (struct  CUC_OptionButton *)malloc(sizeof(struct CUC_OptionButton));

  if (pOPT==NULL)
  { aprintf("CUC: CUC_OptionButtonCreate", "Echec au malloc !");
    return NULL;
  }
  
  // chaŒnage des blocs
  pOPT->suiv = pOPTFirst;
  pOPTFirst = pOPT;

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pOPT->wDisp = w;
  pOPT->iRaiseEvent = iRaiseEvent;
  pOPT->iHasFocus = 0;
  pOPT->iTop = 0;
  pOPT->iLeft = 0;
  pOPT->iWidth = 1;
  pOPT->iHeight = 1;
  pOPT->iValue = 0;
  pOPT->szTag = 0;
  pOPT->iEnabled = 1;
  pOPT->iVisible = 0;			// Le contr“le cr‚‚ est invisible
  pOPT->Parent = NULL;
  pOPT->iTabStop = 1;
  pOPT->iAlign = 0;
  pOPT->szCaption = NULL;
  strcpy(pOPT->szType, szNomType);		// Choix conventionnel

  return pOPT;
}

/*====================================================================*/
//MAJGroupe: met … jour les cases … option d'un groupe (mˆme parent)

static void MAJGroupe(struct CUC_OptionButton *pOPT)
{
  struct CUC_OptionButton *p;

  p=pOPTFirst;
  do
  {	
	if (pOPT!=p)
	  if (pOPT->Parent==p->Parent) 
	  {   
	    p->iValue=0;
		if (p->iVisible) 
		  AfficheValeur(p);
	  }
	p = p->suiv;
  }
  while(p!=NULL); 
}

/*====================================================================*/
// Destruction d'une case … cocher
void CUC_OptionButtonDestruct(struct CUC_OptionButton *pOPT)
{
  struct CUC_OptionButton *sup1,*var;

  if (iCtrlType(pOPT, "CUC_OptionButtonDestruct", szNomType)<0)
    return;
  
  if (pOPT->szTag!=NULL) free(pOPT->szTag);	// On d‚truit le tag
  if (pOPT->szCaption!=NULL) free(pOPT->szCaption);// et la caption...

  // Mise … jour du chaŒnage
  sup1 = pOPTFirst;
  var = pOPTFirst->suiv;
  
  if (pOPT==pOPTFirst)
  { // Destruction en d‚but de chaŒne
	pOPTFirst = var;
  }
  else while(var!=NULL)
  {
	if (var==pOPT)
	{ sup1->suiv = var->suiv;
	  break;
	}
	else		// recherche sur le bloc suivant 
	{
	  sup1 = sup1->suiv;
	  var = var->suiv;
	}
  }

  // Pour terminer, on libŠre la m‚moire utilis‚e par l'objet lui mˆme
  pOPT->szType[0] = 0;
  free((void*)pOPT);	//puis la structure..
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_OptionButtonSetPropNum(struct CUC_OptionButton *pOPT, int iProp, int iArg)

{
  if (iCtrlType(pOPT, "CUC_OptionButtonSetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_ALIGNMENT:
      if (pOPT->iAlign!=iArg)
      { if (iCtrlBornes(szNomClasse, iProp, iArg, 0,1 )<0)
		  return -1;
		if (pOPT->iVisible) Efface(pOPT);
		pOPT->iAlign = iArg;
		if (pOPT->iVisible) Affiche(pOPT);
      }
      break;
    
    case CUCP_VALUE:
      if (pOPT->iValue!=iArg)
	  { if(pOPT->iValue==1)
			iArg=1;
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		if(iArg==1)
			MAJGroupe(pOPT);
		if (pOPT->iVisible) Efface(pOPT);
		pOPT->iValue = iArg;
		if (pOPT->iVisible) Affiche(pOPT);
	  }
      break;

    case CUCP_LEFT:
	  if (pOPT->iLeft!=iArg)
      { if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pOPT->iVisible) Efface(pOPT);
		pOPT->iLeft = iArg;
		if (pOPT->iVisible) Affiche(pOPT);
      }
      break;

    case CUCP_TOP:
      if (pOPT->iTop!=iArg)
      { if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pOPT->iVisible) Efface(pOPT);
		pOPT->iTop = iArg;
		if (pOPT->iVisible) Affiche(pOPT);
      }
      break;

    case CUCP_WIDTH:
      if (pOPT->iWidth!=iArg)
      { if (iCtrlBornes(szNomClasse, iProp, iArg, 4, 80)<0)
		  return -1;
		if (pOPT->iVisible) Efface(pOPT);
		pOPT->iWidth = iArg;
		if (pOPT->iVisible) Affiche(pOPT);
      }
      break;

    case CUCP_HEIGHT:
      if (pOPT->iHeight!=iArg)
      { if (iCtrlBornes(szNomClasse, iProp, iArg, 1, 80)<0)
		  return -1;
		if (pOPT->iVisible) Efface(pOPT);
		pOPT->iHeight = iArg;
		if (pOPT->iVisible) Affiche(pOPT);
      }
      break;

    case CUCP_VISIBLE:
      if (pOPT->iVisible!=iArg)
      { if (pOPT->iVisible)
		  Efface(pOPT);
		else
		  Affiche(pOPT);
		pOPT->iVisible = iArg;
      }
      break;

    case CUCP_ENABLED:
      if (pOPT->iEnabled!=iArg)
      { pOPT->iEnabled = iArg;
		if (pOPT->iVisible)
		  Affiche(pOPT);
      }
      break;

    case CUCP_TABSTOP:
      pOPT->iTabStop = iArg;
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

int CUC_OptionButtonSetPropPtr(struct CUC_OptionButton *pOPT, int iProp, void *pArg)
{
  if (iCtrlType(pOPT, "CUC_OptionButtonSetPropPtr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_PARENT:	pOPT->Parent = pArg;	break;
    case CUCP_IDBACK:	pOPT->IdBack = pArg;	break;
    case CUCP_WDISP:	pOPT->wDisp = pArg;		break;

    default:
      ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_OptionButtonSetPropStr(struct CUC_OptionButton *pOPT, int iProp, const char *szVal)
{
  if (iCtrlType(pOPT, "CUC_OptionButtonSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_CAPTION:
      if(pOPT->szCaption!=NULL) free(pOPT->szCaption);
      if(szVal==NULL)
      { pOPT->szCaption = NULL;
		break;
      }
	  else
	  { pOPT->szCaption = malloc(strlen(szVal)+1);
		strcpy(pOPT->szCaption,szVal);
	  }
	  if (pOPT->iVisible) Affiche(pOPT);
      break;

    case CUCP_TAG:
      if (pOPT->szTag!=NULL) free(pOPT->szTag);
      if (szVal==NULL)
		pOPT->szTag = NULL;
      else
		pOPT->szTag = strdup(szVal);
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

int CUC_OptionButtonGetPropNum(struct CUC_OptionButton *pOPT, int iProp)
{
  if (iCtrlType(pOPT, "CUC_OptionButtonGetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:			return pOPT->iLeft;
    case CUCP_TOP:			return pOPT->iTop;
    case CUCP_WIDTH:		return pOPT->iWidth;
    case CUCP_HEIGHT:		return pOPT->iHeight;
    case CUCP_VALUE:		return pOPT->iValue;
    case CUCP_VISIBLE:		return pOPT->iVisible;
    case CUCP_ENABLED:		return pOPT->iEnabled;
    case CUCP_TABSTOP:		return pOPT->iTabStop;
    case CUCP_FOCUS:		return pOPT->iHasFocus;
	case CUCP_ALIGNMENT:	return pOPT->iAlign;
    case CUCP_ACCELERATOR:	return pOPT->iAccelerator;
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

char *CUC_OptionButtonGetPropStr(struct CUC_OptionButton *pOPT, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pOPT, "CUC_OptionButtonGetPropStr", szNomType)<0)
    return NULL;
  Assert(szBuffer!=NULL);

  switch(iProp)
  {
	case CUCP_CAPTION:  
	  if(pOPT->szCaption==NULL)
		szBuffer[0]=0;
	  else
        strncpy2(szBuffer,pOPT->szCaption,iLBuf);
	  break;
    
	case CUCP_TAG:
      if (pOPT->szTag==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pOPT->szTag, iLBuf);
      break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pOPT->szType, iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_OptionButtonGetPropPtr(struct CUC_OptionButton *pOPT, int iProp)
{
  if (iCtrlType(pOPT, "CUC_OptionButtonGetPropPtr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PARENT:	return pOPT->Parent;
    case CUCP_IDBACK:	return pOPT->IdBack;
    case CUCP_WDISP:	return pOPT->wDisp;
    default:
      ErrPropNonGeree(szNomClasse, "GetPropPtr", iProp);
  }
  return 0;
}

/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

static void DoEventKey(struct CUC_OptionButton  *pOPT, int iKey)
{
  int iOldValue = pOPT->iValue;
  switch(iKey)
  {
    case ' ':
	  if (pOPT->iValue==0)
	  {	pOPT->iValue=1;
		MAJGroupe(pOPT);	
		if (pOPT->iVisible)
		  AfficheValeur(pOPT);
		if (pOPT->iRaiseEvent != NULL)
		  pOPT->iRaiseEvent(pOPT->IdBack, CUCE_CHANGE, 0);
	  }
   } // switch
}

/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_OptionButtonDoEvent(struct CUC_OptionButton *pOPT, int iEvent, int iArg)
{

  if (iCtrlType(pOPT, "CUC_OptionButtonDoEvent", szNomType)<0)
    return -1;

  switch(iEvent)
  {
    case CUCE_KEY:
      if (pOPT->iEnabled)
		DoEventKey(pOPT, iArg);
      break;

    case CUCE_GOTFOCUS:
      if (pOPT->iVisible && pOPT->iEnabled)
      { pOPT->iHasFocus = 1;
		AfficheValeur(pOPT);
      }
      break;

    case CUCE_LOSTFOCUS:
      if (pOPT->iVisible && pOPT->iEnabled)
      { pOPT->iHasFocus = 0;
		AfficheValeur(pOPT);
      }
      break;

    default:
      aprintf("CUC: CUC_OptionButtonDoEvent", "Ev‚nement %d inconnu !", iEvent);
      break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_OptionButtonMove(struct CUC_OptionButton *pOPT, int iTop, int iLeft)
{
  if (iCtrlType(pOPT, "CUC_OptionButtonMove", szNomType)<0)
    return -1;

  if (pOPT->iLeft!=iLeft || pOPT->iTop!=iTop)
  { 
    if (pOPT->iVisible) Efface(pOPT);
    pOPT->iLeft = iLeft;
    pOPT->iTop = iTop;
    if (pOPT->iVisible) Affiche(pOPT);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_OptionButtonResize(struct CUC_OptionButton *pOPT, int iHeight, int iWidth)
{
  if (iCtrlType(pOPT, "CUC_OptionButtonResize", szNomType)<0)
    return -1;

  if (pOPT->iWidth!=iWidth || pOPT->iHeight!=iHeight)
  { 
    if (pOPT->iVisible) Efface(pOPT);
    pOPT->iWidth = iWidth;
    pOPT->iHeight = iHeight;
    if (pOPT->iVisible) Affiche(pOPT);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine

int CUC_OptionButtonRefresh(struct CUC_OptionButton *pOPT)
{
  if (iCtrlType(pOPT, "CUC_OptionButtonResize", szNomType)<0)
    return -1;

  if (pOPT->iVisible) Affiche(pOPT);
}

/*====================================================================*/
// M‚thode DisplayCursor: le contr“le affiche le curseur clignotant

int CUC_OptionButtonDisplayCursor(struct CUC_OptionButton *pOPT)
{
  if (iCtrlType(pOPT, "CUC_OptionButtonDisplayCursor", szNomType)<0)
    return -1;

  AfficheCurseur(pOPT);
}
