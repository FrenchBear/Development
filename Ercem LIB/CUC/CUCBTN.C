/* cucbtn.c
** Impl‚mentation du contr“le CommandButton de la bibliothŠque CUC
** 13/06/94 CR 
** 26/12/94 PV	CUC_EffaceRectangle; strncpy2; Assert
** 10/02/95 PV	Pas d'affichage dans AfficheTout si btn invisible
*/

#include <stdio.h>
#include <curses.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"

#include "import.h"

static char szNomClasse[] = "CUC CommandButton";
static char szNomType[]   = "BTN";

// Cette d‚finition n'est connue que pour les fonctions de ce fichier
struct CUC_CommandButton
{
  char	szType[4];				// Pour des contr“les internes (BTN)
  
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
  char	*szTag;					// Tag du contr“le
  void	*Parent;				// Pointeur sur un contr“le parent

  unsigned char	*szCaption;		// Texte du contr“le
  int   iDefault;				// bouton r‚agissant … Return
  int   iCancel;				// Bouton r‚agissant … Escape
  int 	iValue;					// 0:bouton relƒch‚, 1:bouton cliqu‚
  int   iAccelerator;			// Touche de racourci
  int   iBorderStyle;			// Type de cadre
								//0:encadr‚, 1:entre < et >, 2:entre [ et ]
  struct CUC_CommandButton *suiv; //pointe le bouton suivant 
  int	iLStart, iCStart;		// Position du curseur
};

static struct CUC_CommandButton *pBTNFirst = NULL;	// pointeur de début de chaîne

/*====================================================================*/
// Efface completement le contr“le de l'‚cran (affiche des espaces)
// Ne gŠre pas le r‚affichage des ‚l‚ments qui pourraient se
// trouver derriŠre (en dessous)

static void Efface(struct CUC_CommandButton *pBTN)
{
  if (iOkWDisp(pBTN->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pBTN->wDisp, pBTN->iTop, pBTN->iLeft, pBTN->iHeight, pBTN->iWidth);
}

/*====================================================================*/
// Affiche le curseur clignotant au bon endroit

static void AfficheCurseur(struct CUC_CommandButton *pBTN)
{
  if (iOkWDisp(pBTN->wDisp, szNomClasse, "AfficheCurseur")<0) return;
  
  wmove(pBTN->wDisp, pBTN->iLStart, pBTN->iCStart);
}

/*====================================================================*/
// Redessine le contr“le aprŠs un changement de valeur

static void AfficheTexte(struct CUC_CommandButton *pBTN)
{
  int def,i,m=1,fi=2, j=0, k, l,li;
  unsigned char szLigne[81];	// fi=2 si defaut=faux
  unsigned char szLigne2[81];	// fi=4 si defaux=vrai
  unsigned char *p;				// utiliser pour tronquer en colonne 
  int iNbMots=0;				// li decalage ,top m  decalage  ,left selon height
  int iSoul=0;

  if (iOkWDisp(pBTN->wDisp, szNomClasse, "AfficheTexte")<0) return;

  pBTN->iLStart = -1;
  if(pBTN->szCaption==NULL) return;

  if( (!pBTN->iBorderStyle && (pBTN->iWidth<=2 || pBTN->iHeight<=2)) ||
	  (pBTN->iBorderStyle && (pBTN->iHeight<1 || pBTN->iWidth <5)) )
	   return; 

  if(pBTN->iHeight<2) li=0;
  else li=1;

  def=(pBTN->iBorderStyle!=0 &&(pBTN->iDefault || pBTN->iHasFocus))?2:1; 
  if(pBTN->iBorderStyle!=0 ) 
  { m=2; fi=4; 
  }
  else { fi=2; m=1;} 
  
  if (!pBTN->iEnabled) wattron(pBTN->wDisp, DIMINUE);
  else
	if(pBTN->iHasFocus)
	{
	  wattron(pBTN->wDisp,INVERSE);
	  for (i=1 ; i<(pBTN->iHeight-1) ; i++)
		for (j=def ; j<(pBTN->iWidth-def ); j++)
		  cmvwaddch(pBTN->wDisp, pBTN->iTop+i, pBTN->iLeft+j, ' ');
	}	

  p = pBTN->szCaption;
  if(pBTN->iWidth==fi)
  { wattroff(pBTN->wDisp,INVERSE); 
	return;
  }

  /* On est en multi-lignes et on fait du Word Wrap... */
  l = p!=NULL?(int)strlen(p):0;
  j=0;
  for(i=0; i<=l; i++)
  { /* Lecture ligne par ligne */
    for(k=0; (i+k)<=(l+iSoul) ; k++)
    { if(k<80) szLigne[k] = p[i+k];
      if(szLigne[k]==' ') iNbMots++;
      if(szLigne[k]=='&') iSoul=1;
      if(szLigne[k]==0 || szLigne[k] == '\n' || (iNbMots && ((k+fi)-iSoul)>=pBTN->iWidth))break;
    }
    if(szLigne[k]=='\n') { szLigne[k] = 0; i += k; }
    else if(iNbMots && szLigne[k]!=0)
    { 
      for(k; k>=0 ; k--)
		if(szLigne[k]==' ') {szLigne[k]=0; i+= k; break;}
    }
    else i=l;
    szLigne[80] = 0;
    iNbMots = 0;
    if( szLigne[0] && ((int)strlen(szLigne)+fi-iSoul) > pBTN->iWidth)
      szLigne[pBTN->iWidth>2?pBTN->iWidth-fi+iSoul:pBTN->iWidth+iSoul] = 0;
    szLigne2[0] = 0;
    if(szLigne[0] && pBTN->iWidth>((int)strlen(szLigne)+fi-iSoul))
      sprintf(szLigne2,"%*c",(pBTN->iWidth-fi-strlen(szLigne)+iSoul)/2,' ');

	// On sauve la position d'affichage du 1er caractŠre, qui
	// sera la position du curseur clignotant.
	// La valeur est m‚moris‚e pour simplifier le traitement
	// de AfficheCurseur
    if (pBTN->iLStart<0)
	{ pBTN->iLStart = pBTN->iTop+li+j;
	  pBTN->iCStart = pBTN->iLeft+m;
	}

    strcat(szLigne2,szLigne);
    if (iSoul)
    {
      int pos=0;

      for(k=0;szLigne2[k];k++)
      {
		if(szLigne2[k]=='&' && szLigne2[k+1]!='&' &&
		   ((k && szLigne2[k-1]!='&')||(!k && szLigne2[k])))
		{
		  wattron(pBTN->wDisp,SOULIGNE);
		}
		else if(szLigne2[k]=='&' && szLigne2[k+1]=='&')
		  // on passe le premier &
		  ;
		else
		  cmvwaddch(pBTN->wDisp, pBTN->iTop+li+j, pBTN->iLeft+m+pos++,szLigne2[k]);
		if(k && szLigne2[k-1]=='&')
		{
		  pBTN->iAccelerator = szLigne2[k];
		  //if(pBTN->iHasFocus) wattroff(pBTN->wDisp,INVERSE);
		  wattroff(pBTN->wDisp,SOULIGNE);
		  //if(pBTN->iHasFocus) wattron(pBTN->wDisp,INVERSE);
		}
      }
      wattroff(pBTN->wDisp,SOULIGNE);
    }
    else
      cmvwaddstr(pBTN->wDisp, pBTN->iTop+li+j, pBTN->iLeft+m,szLigne2);
	iSoul=0;
    j++;
    if((j+2)>=pBTN->iHeight) break;
  } /* for */
  if (!pBTN->iEnabled) wattroff(pBTN->wDisp, DIMINUE);
  wattroff(pBTN->wDisp,INVERSE);
  AfficheCurseur(pBTN);
}


/*====================================================================*/
// Redessine complŠtement le contr“le

static void Affiche(struct CUC_CommandButton *pBTN, int iBordDouble)
{
  int i;

  if (iOkWDisp(pBTN->wDisp, szNomClasse, "Affiche")<0) return;
  
  if(pBTN->iVisible) 
  {
	if(pBTN->iHasFocus)
	  { wattron(pBTN->wDisp,INVERSE);
		Efface(pBTN);
		wattroff(pBTN->wDisp,INVERSE);
      }
	else Efface(pBTN);
  }

  if (!pBTN->iEnabled) wattron(pBTN->wDisp, DIMINUE);
  
  // choix du cadre simple ligne ou double ligne
	
  //test les condition du bord .
  if(pBTN->iBorderStyle==0)				// bord de style encadrement
  {
	unsigned char *pszG;

	pszG = iBordDouble?szBoxd:szBoxs;
	cmvwaddch(pBTN->wDisp, pBTN->iTop, pBTN->iLeft, pszG[0]);
	for (i=1; i<=pBTN->iWidth-2 ; i++ )
	  cmvwaddch(pBTN->wDisp, pBTN->iTop, pBTN->iLeft+i, pszG[1]);
	cmvwaddch(pBTN->wDisp, pBTN->iTop, pBTN->iLeft+pBTN->iWidth-1, pszG[2]);
	for (i=1 ; i<pBTN->iHeight ; i++)
	{ cmvwaddch(pBTN->wDisp, pBTN->iTop+i, pBTN->iLeft, pszG[3]);
	  cmvwaddch(pBTN->wDisp, pBTN->iTop+i, pBTN->iLeft+pBTN->iWidth-1, pszG[4]);
	}
	cmvwaddch(pBTN->wDisp, pBTN->iTop+pBTN->iHeight-1, pBTN->iLeft, pszG[5]);
	for (i=1; i<=pBTN->iWidth-2 ; i++ )
	  cmvwaddch(pBTN->wDisp, pBTN->iTop+pBTN->iHeight-1, pBTN->iLeft+i, pszG[6]);
	cmvwaddch(pBTN->wDisp, pBTN->iTop+pBTN->iHeight-1, pBTN->iLeft+pBTN->iWidth-1, pszG[7]);
  }
  else if(pBTN->iBorderStyle==1)		// <   >
  {
	if(iBordDouble==0)
	{
	  for(i=0;i<pBTN->iHeight;i++)
	  {
		cmvwaddch(pBTN->wDisp,pBTN->iTop+i,pBTN->iLeft,'<');
		cmvwaddch(pBTN->wDisp,pBTN->iTop+i,pBTN->iLeft+pBTN->iWidth-1,'>');
	  }
	}
	else
	{  
	  for(i=0;i<pBTN->iHeight;i++)
	  {
		cmvwaddstr(pBTN->wDisp,pBTN->iTop+i,pBTN->iLeft,"<<");
		cmvwaddstr(pBTN->wDisp,pBTN->iTop+i,pBTN->iLeft-2+pBTN->iWidth,">>");
	  }
	}
  }
  else if(pBTN->iBorderStyle==2)		// [  ]
  { 
	if(iBordDouble==0)
	{
	  for(i=0;i<pBTN->iHeight;i++)
	  { 
		cmvwaddch(pBTN->wDisp,pBTN->iTop+i,pBTN->iLeft,'[');
		cmvwaddch(pBTN->wDisp,pBTN->iTop+i,pBTN->iLeft+pBTN->iWidth-1,']');
	  }	
	}
	else
	{  
	  for(i=0;i<pBTN->iHeight;i++)
	  {
		cmvwaddstr(pBTN->wDisp,pBTN->iTop+i,pBTN->iLeft,"[[");
		cmvwaddstr(pBTN->wDisp,pBTN->iTop+i,pBTN->iLeft-2+pBTN->iWidth,"]]");
	  } 
	} 
  }
  if (!pBTN->iEnabled) wattroff(pBTN->wDisp, DIMINUE);
  AfficheTexte(pBTN);
  if (!pBTN->iEnabled) wattroff(pBTN->wDisp, DIMINUE);
} 


//====================================================================
static void AfficheTout(struct CUC_CommandButton *pBTN)
{
  struct CUC_CommandButton *p;
  int iFocusSurAutreBouton = 0;

  // On recherche un bouton par d‚faut de mˆme parent
  for (p=pBTNFirst ; p!=NULL ; p=p->suiv)
	if (p->iVisible && p!=pBTN && p->iDefault && p->Parent==pBTN->Parent)
	{
	  if (pBTN->iHasFocus)
	  { Affiche(p, 0);
	    iFocusSurAutreBouton = 1;
	  }
	  else
	    Affiche(p, 1);
	}

  // Puis le bouton courant
  if (pBTN->iVisible)
	if (pBTN->iHasFocus)
	  Affiche(pBTN, 1);
	else
	  Affiche(pBTN, iFocusSurAutreBouton ? 0 : pBTN->iDefault);
}

/*====================================================================*/
// Cr‚ation d'un bouton de commande

struct CUC_CommandButton *CUC_CommandButtonCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))

{
  struct CUC_CommandButton *pBTN;

  pBTN = (struct CUC_CommandButton *)malloc(sizeof(struct CUC_CommandButton));

  if (pBTN==NULL)
  { aprintf("CUC: CUC_CommandButtonCreate", "Echec au malloc !");
    return NULL;
  }

  // chaŒnage des boutons
  pBTN->suiv = pBTNFirst;
  pBTNFirst = pBTN;   
  
  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pBTN->wDisp = w;
  pBTN->iRaiseEvent = iRaiseEvent;
  pBTN->IdBack = pBTN;
  pBTN->iHasFocus = 0;
  pBTN->iTop = 0;
  pBTN->iLeft = 0;
  pBTN->iWidth = 10;
  pBTN->iHeight = 1;
  pBTN->szTag = NULL;
  pBTN->iEnabled = 1;
  pBTN->iVisible = 0;					// Cr‚‚ invisible
  pBTN->Parent = NULL;
  pBTN->iTabStop = 1;
  strcpy(pBTN->szType, szNomType);		// Choix conventionnel
  pBTN->szCaption = NULL;
  pBTN->iBorderStyle = 0;
  pBTN->iDefault = 0;
  pBTN->iCancel = 0;
  pBTN->iValue = 0;
  pBTN->iAccelerator = 0;
  return pBTN;
}

/*====================================================================*/
// Destruction d'un bouton
void CUC_CommandButtonDestruct(struct CUC_CommandButton *pBTN)
{
  struct CUC_CommandButton *sup1, *var;
  
  if (iCtrlType(pBTN, "CUC_CommandButtonDestruct", szNomType)<0)
    return;
  
  if (pBTN->szTag!=NULL) free(pBTN->szTag);	// On d‚truit le tag...
  if (pBTN->szCaption!=NULL) free(pBTN->szCaption); // et la caption

  sup1 = pBTNFirst;
  var = pBTNFirst->suiv;
  
  if (pBTN==pBTNFirst)
  {		  
	pBTNFirst = var;
  }
  else while(var!=NULL)
  {
	if (var==pBTN)
	{ sup1->suiv = var->suiv;
	  break;
	}
	else						// recherche sur le bloc suivant 
	{ sup1 = sup1->suiv;
	  var = var->suiv;
	}
  }

  free((void*)pBTN);	// Pour finir, lib‚ration de la structure
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_CommandButtonSetPropNum(struct CUC_CommandButton *pBTN, int iProp, int iArg)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonSetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:
      if (pBTN->iLeft!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pBTN->iVisible) Efface(pBTN);
		pBTN->iLeft = iArg;
		if (pBTN->iVisible) AfficheTout(pBTN);
      }
      break;

    case CUCP_TOP:
      if (pBTN->iTop!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pBTN->iVisible) Efface(pBTN);
		pBTN->iTop = iArg;
		if (pBTN->iVisible) AfficheTout(pBTN);
      }
      break;

    case CUCP_WIDTH:
      if (pBTN->iWidth!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg,((pBTN->iBorderStyle!=0))?4:2, 80)<0)
		  return -1;
		if (pBTN->iVisible) Efface(pBTN);
		pBTN->iWidth = iArg;
		if (pBTN->iVisible) AfficheTout(pBTN);
      }
      break;

    case CUCP_HEIGHT:
	  if (iCtrlBornes(szNomClasse, iProp, iArg,1,10)<0)
		return -1;
	  if (pBTN->iHeight!=iArg)
	  { 
		if (pBTN->iVisible) Efface(pBTN);
		pBTN->iHeight = iArg;
		if (pBTN->iVisible) AfficheTout(pBTN);
	  }
	  break;
       
    case CUCP_VALUE:
    {
      if (pBTN->iValue!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg,0, 1)<0)
		  return -1;
		if (iArg)
		{
		  pBTN->iValue = 1;
		  if (pBTN->iRaiseEvent != NULL)
			pBTN->iRaiseEvent(pBTN->IdBack, CUCE_CHANGE, 0);
		}
		if (pBTN->iVisible) Efface(pBTN);
		pBTN->iValue = 0 ;
		if (pBTN->iVisible) AfficheTout(pBTN);
      }
      break;
    }

    case CUCP_DEFAULT:
      if (pBTN->iDefault!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg,0,1 )<0)
		  return -1;
		if (pBTN->iVisible) Efface(pBTN);
		pBTN->iDefault = iArg;
		if (pBTN->iVisible) AfficheTout(pBTN);
      }
      break;

    case CUCP_CANCEL:
      if (pBTN->iCancel!=iArg)
      { 
		if (iCtrlBornes(szNomClasse, iProp, iArg,0,1 )<0)
		  return -1;
		if (pBTN->iVisible) Efface(pBTN);
		pBTN->iCancel = iArg;
		if (pBTN->iVisible) AfficheTout(pBTN);
      }
      break;
    
    case CUCP_BORDERSTYLE:
      {
		if (pBTN->iBorderStyle!=iArg)
		{ 
		  if (pBTN->iVisible) Efface(pBTN);
		  pBTN->iBorderStyle = iArg;
		  if (pBTN->iVisible) AfficheTout(pBTN);
		}
      break;
      }
    
	case CUCP_VISIBLE:
      if (pBTN->iVisible!=iArg)
      {
		pBTN->iVisible = iArg;
		if (pBTN->iVisible) AfficheTout(pBTN);
		else Efface(pBTN);
      }
      break;

    case CUCP_ENABLED:
      if (pBTN->iEnabled!=iArg)
      {
		pBTN->iEnabled = iArg;
		if (pBTN->iVisible) AfficheTout(pBTN);
      }
      break;

    case CUCP_PARENT:
      pBTN->Parent = (void *)iArg;
      break;

    case CUCP_TABSTOP:
      pBTN->iTabStop = iArg;
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

int CUC_CommandButtonSetPropPtr(struct CUC_CommandButton *pBTN, int iProp, void *pArg)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonSetPropPtr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_PARENT: pBTN->Parent = pArg; break;
	case CUCP_IDBACK: pBTN->IdBack = pArg; break;
	case CUCP_WDISP:  pBTN->wDisp = pArg; break;
    default:
      ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
      return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ texte

int CUC_CommandButtonSetPropStr(struct CUC_CommandButton *pBTN, int iProp, const char *szVal)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonSetPropStr", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_TAG:
      if (pBTN->szTag!=NULL) free(pBTN->szTag);
      if (szVal==NULL)
		pBTN->szTag = NULL;
      else
		pBTN->szTag = strdup(szVal);
      break;

    case CUCP_CAPTION:
      if (pBTN->szCaption!=NULL) free(pBTN->szCaption);
      if (szVal==NULL)
	  {	
		pBTN->szCaption = NULL;
	    break;
      }
	  else
	  {
		pBTN->szCaption = malloc(strlen(szVal)+1);
		strcpy(pBTN->szCaption,szVal);
	  }
      if (pBTN->iVisible) Efface(pBTN);
      if (pBTN->iVisible) AfficheTout(pBTN);
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

int CUC_CommandButtonGetPropNum(struct CUC_CommandButton *pBTN, int iProp)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonGetPropNum", szNomType)<0)
    return -1;

  switch(iProp)
  {
    case CUCP_LEFT:			return pBTN->iLeft;
    case CUCP_TOP:			return pBTN->iTop;
    case CUCP_WIDTH:		return pBTN->iWidth;
    case CUCP_HEIGHT:		return pBTN->iHeight;
    case CUCP_VISIBLE:		return pBTN->iVisible;
    case CUCP_ENABLED:		return pBTN->iEnabled;
    case CUCP_DEFAULT:		return pBTN->iDefault;
    case CUCP_CANCEL:   	return pBTN->iCancel;
    case CUCP_TABSTOP:		return pBTN->iTabStop;
    case CUCP_FOCUS:		return pBTN->iHasFocus;
    case CUCP_BORDERSTYLE:	return pBTN->iBorderStyle;
    case CUCP_VALUE:		return pBTN->iValue;
    case CUCP_ACCELERATOR:	return pBTN->iAccelerator;
	default:
      ErrPropNonGeree(szNomClasse, "GetPropNum", iProp);
  }
  return 0;
}


/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_CommandButtonGetPropPtr(struct CUC_CommandButton *pBTN, int iProp)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonGetPropPtr", szNomType)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_PARENT:	return pBTN->Parent;
    case CUCP_IDBACK:	return pBTN->IdBack;
	case CUCP_WDISP:  	return pBTN->wDisp;
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

char *CUC_CommandButtonGetPropStr(struct CUC_CommandButton *pBTN, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonGetPropStr", szNomType)<0)
    return NULL;
  Assert(szBuffer!=NULL);

  switch(iProp)
  {
    case CUCP_TAG:
      if (pBTN->szTag==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pBTN->szTag, iLBuf);
      break;

    case CUCP_TYPE:
      strncpy2(szBuffer, pBTN->szType, iLBuf);
      break;

    case CUCP_CAPTION:
      if (pBTN->szCaption==NULL)
		szBuffer[0] = 0;
      else
        strncpy2(szBuffer, pBTN->szCaption, iLBuf);
      break;

    default:
      ErrPropNonGeree(szNomClasse, "GetPropStr", iProp);
  }

  return szBuffer;
}

/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

static void DoEventKey(struct CUC_CommandButton *pBTN, int iKey)
{
  int iOldValue = pBTN->iValue;

  switch(iKey)
  {
	case KEY_RETURN:
	case KEY_ESPACE:
	case KEY_ESCAPE:
	  pBTN->iValue = 1;
  }

  if (pBTN->iValue!=iOldValue)
  { //AfficheTout(pBTN);	// N'a pas besoin d'ˆtre r‚affich‚
    if (pBTN->iRaiseEvent != NULL)
      pBTN->iRaiseEvent(pBTN->IdBack, CUCE_CHANGE, 0);
  }
  pBTN->iValue = 0;
}


/*====================================================================*/
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_CommandButtonDoEvent(struct CUC_CommandButton *pBTN, int iEvent, int iArg)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonDoEvent", szNomType)<0)
    return -1;

  switch(iEvent)
  {
    case CUCE_KEY:
      if (pBTN->iVisible && pBTN->iEnabled)
		DoEventKey(pBTN, iArg);
      break;

    case CUCE_GOTFOCUS:
      if (pBTN->iVisible && pBTN->iEnabled)
      { pBTN->iHasFocus = 1;
		AfficheTout(pBTN);
      }
      break;

    case CUCE_LOSTFOCUS:
      if (pBTN->iVisible && pBTN->iEnabled)
      { pBTN->iHasFocus = 0;
		AfficheTout(pBTN);
      }
      break;

    default:
      aprintf("CUC: CUC_CommandButtonDoEvent", "Ev‚nement %d inconnu !", iEvent);
      break;
  }

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_CommandButtonMove(struct CUC_CommandButton *pBTN, int iTop, int iLeft)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonMove", szNomType)<0)
    return -1;

  if (pBTN->iLeft!=iLeft || pBTN->iTop!=iTop)
  { 
    if (pBTN->iVisible) Efface(pBTN);
    pBTN->iLeft = iLeft;
    pBTN->iTop = iTop;
    if (pBTN->iVisible) AfficheTout(pBTN);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_CommandButtonResize(struct CUC_CommandButton *pBTN, int iHeight, int iWidth)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonResize", szNomType)<0)
    return -1;

  if (pBTN->iWidth!=iWidth || pBTN->iHeight!=iHeight)
  { 
    if (pBTN->iVisible) Efface(pBTN);
    pBTN->iWidth = iWidth;
    pBTN->iHeight = iHeight;
    if (pBTN->iVisible) AfficheTout(pBTN);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine

int CUC_CommandButtonRefresh(struct CUC_CommandButton *pBTN)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonResize", szNomType)<0)
    return -1;

  AfficheTout(pBTN);
}

/*====================================================================*/
// M‚thode DisplayCursor: le contr“le affiche le curseur clignotant

int CUC_CommandButtonDisplayCursor(struct CUC_CommandButton *pBTN)
{
  if (iCtrlType(pBTN, "CUC_CommandButtonDisplayCursor", szNomType)<0)
    return -1;

  AfficheCurseur(pBTN);
}

