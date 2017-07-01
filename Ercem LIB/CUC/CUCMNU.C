// cucmnu.c
// BibliothŠque CUC - Menus d‚roulants
// P.VIOLENT 16/07/94
//  3/12/94 PV	Version op‚rationnelle
// 21/01/95 PV	Evénement DROPDOWN; IdBack traité
//
// Eventuellement ajouter une ligne d'aide par menu


#include <stdio.h>
#include <curses.h>
#include <memory.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

static char szNomClasse[]			= "CUC Menu";
static char szNomTypeMenu[]			= "MNU";
static char szNomTypeMenuElement[]	= "MEL";

//=====================================================================

// Version de MAJ fournissant un r‚sultat entier pour ‚viter
// les warnings p‚nibles...
#define iMaj(c)  ((int)(maj((UC)c)))

struct CUC_MenuElement
{
  char	szType[4];		// Pour des contr“les internes (MEL)
  
  int	iId;
  int	iFlags;
  int	iRaccourci;		// Acc‚l‚rateur inclus dans szCaption aprŠs &
  int	iAccel;			// Acc‚l‚rateur compl‚mentaire
  int	iLeft;			// Position gauche d'affichage
  int	iTop;
  char	*szCaption;
  struct CUC_MenuElement	*pmeSousMenu;
  struct CUC_MenuElement	*pmeSuiv;
};

struct CUC_Menu
{
  char	szType[4];		// Pour des contr“les internes (MNU)
  
  WINDOW *wDisp;		// Fenˆtre (curses) d'affichage du contr“le
  void	*IdBack;		// Identificateur de retour
  int	(*iRaiseEvent)(void *, int , int );	// Messages en retour

  struct CUC_MenuElement	*pmeFirst;
};


//=====================================================================
// Cr‚ation de la structure de base du menu
struct CUC_Menu *CUC_MenuCreate(WINDOW *wDisp, int (*iBack)(void *, int , int ), void *IdBack)
{
  struct CUC_Menu *pMNU;

  pMNU = (struct CUC_Menu *)malloc(sizeof(struct CUC_Menu));

  if (pMNU==NULL)
  { aprintf("CUC: CUC_MenuCreate", "Echec au malloc !");
	return NULL;
  }

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  strcpy(pMNU->szType, szNomTypeMenu);	// Pour reconnaître le type
  pMNU->wDisp = wDisp;
  pMNU->iRaiseEvent = iBack;
  pMNU->IdBack = IdBack;
  
  pMNU->pmeFirst = NULL;				// Menu vide !

  return pMNU;
}

//=====================================================================
// Version "assist‚e" de la cr‚ation de menus, … partir d'un tableau de struct FormMenu
// C'est nettement plus simple qu'avec l'appel direct aux fonctionc de CUC_Menu, la
// structure hi‚rarchique ‚tant bas‚e sur le rep‚rage des ‚l‚ments par des entiers et
// non des pointeurs
struct CUC_Menu *CUC_MenuCreateAssist(struct FormMenu *tFM, WINDOW *wDisp, int (*iBack)(void *, int , int ), void *IdBack)
{
  int i, j, iNbEl;
  struct CUC_Menu *pmMenu;
  struct CUC_MenuElement *p, *q;
  
  struct  IDPME
  { int iId;
	struct CUC_MenuElement *pme;
  } *tIdPme;

  // Comptage du nombre d'‚l‚ments de menu … cr‚er, pour m‚moriser les pointeurs
  // correspondant aux Id
  for (iNbEl=0 ; tFM[iNbEl].iId>=0 ; iNbEl++) ;
  tIdPme = malloc(iNbEl*sizeof(struct IDPME));
  if (tIdPme==NULL)
  { aprintf("CUC Form: FormMenuCreate", "Echec au malloc !");
	return NULL;
  }

  pmMenu = CUC_MenuCreate(wDisp, iBack, IdBack);
  for (i=0 ; tFM[i].iId>=0 ; i++)
  {
	if (tFM[i].iParent==0)
	  p = NULL;
	else
	{
	  for (j=0 ; j<i ; j++)
		if (tIdPme[j].iId==tFM[i].iParent)
		{ p = tIdPme[j].pme;
		  break;
		}
	  if (j==i)
	  { aprintf("CUC Form: FormMenuCreate", "|Pas trouv‚ l'‚l‚ment de menu parent %d|lors de la cr‚ation de l'‚l‚ment %d \"%s\" !|", tFM[i].iParent, tFM[i].iId, tFM[i].szCaption);
		return NULL;
	  }
	}
	q = CUC_MenuAddElement(pmMenu, p, tFM[i].iId, tFM[i].szCaption, tFM[i].iAccel, tFM[i].iFlags);
	
	tIdPme[i].iId = tFM[i].iId;
	tIdPme[i].pme = q;
  }

  free(tIdPme);			// La structure est provisoire
  return pmMenu;
}

//=====================================================================

// Destruction r‚cursive de la chaîne des sous-menus
// De touts façon cette fonction sera typiquement appell‚e une fois,
// … la fin du programme; donc les questions de performance...
// Le test de type est une s‚curit‚, pour voir si la structure
// n'a pas ‚t‚ alt‚r‚e pendant le d‚roulement du programme.
static void MenuElementDestruct(struct CUC_MenuElement *pme)
{
  if (iCtrlType(pme, "MenuElementDestruct", szNomTypeMenuElement)<0) return;

  if (pme->pmeSuiv!=NULL) MenuElementDestruct(pme->pmeSuiv);
  if (pme->pmeSousMenu!=NULL) MenuElementDestruct(pme->pmeSousMenu);

  if (pme->szCaption!=NULL) free(pme->szCaption);
  pme->szType[0] = 0;  
  free(pme);
}


void CUC_MenuDestruct(struct CUC_Menu *pMNU)
{
  if (iCtrlType(pMNU, "CUC_MenuDestruct", szNomTypeMenu)<0) return;

  // Lib‚ration des ‚l‚ments de menu...
  if (pMNU->pmeFirst!=NULL) MenuElementDestruct(pMNU->pmeFirst);
  
  // Puis de la structure de base
  pMNU->szType[0] = 0;				// s‚curit‚
  free(pMNU);
}

//=====================================================================
// Ajoute un menu ou une commande
// L'‚l‚ment est rattach‚ … pmeMEL. Si pmeMEL vaut NULL, l'‚l‚ment
// est rattach‚ … la barre de menu principale,
// sinon si pmeMEL est le ptr d'un menu principal c'est une commande,
// et si c'est un ptr d'‚l‚ment de menu, ‡a devient un ‚l‚ment
// de sous-menu.

struct CUC_MenuElement *CUC_MenuAddElement(struct CUC_Menu *pMNU, struct CUC_MenuElement *pmeMEL, int iId, char *szCaption, int iAccel, int iFlags)
{
  struct CUC_MenuElement *pme;

  if (iCtrlType(pMNU, "CUC_MenuAddElement(1)", szNomTypeMenu)<0) return NULL;
  if (pmeMEL!=NULL && iCtrlType(pmeMEL, "CUC_MenuAddElement(2)", szNomTypeMenuElement)<0) return NULL;

  pme = (struct CUC_MenuElement *)malloc(sizeof(struct CUC_MenuElement));
  if (pme==NULL)
  { aprintf("CUC: CUC_MenuAddElement", "Echec au malloc !");
	return NULL;
  }

  strcpy(pme->szType, szNomTypeMenuElement);	// Pour reconnaŒtre le type
  
  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pme->iId = iId;
  pme->iAccel = iAccel;
  pme->iRaccourci = 0;		// Sera d‚termin‚ lors de l'affichage
  pme->iFlags = iFlags;
  if (szCaption==NULL)
	pme->szCaption = NULL;
  else
	pme->szCaption = strdup(szCaption);
  
  pme->pmeSousMenu = NULL;
  pme->pmeSuiv = NULL;
  
  // Chaînage dans la structure des menus
  if (pmeMEL==NULL)					// ChaŒnage dans les menus principaux
  {
	if (pMNU->pmeFirst==NULL)		// 1er menu: chaŒn‚ dans la structure CUC_Menu
	  pMNU->pmeFirst = pme;
	else							// autre ‚l‚ment: chaŒnage "classique"
	{
	  struct CUC_MenuElement *p;
	  
	  p = pMNU->pmeFirst;
	  while (p->pmeSuiv!=NULL) p = p->pmeSuiv;
	  p->pmeSuiv = pme;
	}
  }
  else								// Commande ou sous-menu
  {
	if (pmeMEL->pmeSousMenu==NULL)	// 1er ‚l‚ment: accŠs via pmeSousMenu
	  pmeMEL->pmeSousMenu = pme;
	else							// autre ‚l‚ment: en fin de chaŒne de pmeSuiv d‚marrant … pmeSousMenu
	{ 
	  struct CUC_MenuElement *p;
	  
	  p = pmeMEL->pmeSousMenu;
	  while (p->pmeSuiv!=NULL) p = p->pmeSuiv;
	  p->pmeSuiv = pme;
	}
  }
  
  return pme;
}

//=====================================================================
// Attributs d'affichage des menus

static int	iAtMenu;			// Titre de menu
static int	iAtMenuAc;			// Acc‚l‚rateur de titre
static int	iAtMenuElement;		// Ligne de menu
static int	iAtMenuElementAc;	// Acc‚l‚rateur de ligne de menu

// Attributs quand s‚lectionn‚
static int	iAtSelMenu;
static int	iAtSelMenuAc;
static int	iAtSelMenuElement;
static int	iAtSelMenuElementAc;

static UC cSepHz;				// S‚parateur horizontal


static void SetAttrib()
{
  // On d‚termine les attributs d'affichage des ‚l‚ments de menu en fonction
  // du type de terminal
  if (strncmp(ttytype, "ansipc", 6)==0)
  {
	iAtMenu				= INVERSE;
	iAtMenuAc			= BRILLANT;
	iAtMenuElement		= INVERSE;
	iAtMenuElementAc	= 0;

	iAtSelMenu			= 0;
	iAtSelMenuAc		= 0;
	iAtSelMenuElement	= 0;
	iAtSelMenuElementAc	= INVERSE;

	cSepHz = szBoxs[1];
  }
  else if (strncmp(ttytype, "ansi", 4)==0)
  {
	iAtMenu				= INVERSE;
	iAtMenuAc			= BRILLANT;
	iAtMenuElement		= BRILLANT;
	iAtMenuElementAc	= 0;

	iAtSelMenu			= SOULIGNE;
	iAtSelMenuAc		= SOULIGNE;
	iAtSelMenuElement	= INVERSE;
	iAtSelMenuElementAc	= BRILLANT;

	cSepHz = szBoxs[1];
  }
  else
  {
	iAtMenu				= DIMINUE;
	iAtMenuAc			= DIMINUE|SOULIGNE;
	iAtMenuElement		= BRILLANT;
	iAtMenuElementAc	= BRILLANT|SOULIGNE;

	iAtSelMenu			= BRILLANT;
	iAtSelMenuAc		= BRILLANT|SOULIGNE;
	iAtSelMenuElement	= INVERSE;
	iAtSelMenuElementAc	= SOULIGNE;

	cSepHz = '-';
  }
}


void CUC_MenuShow(struct CUC_Menu *pMNU)
{
  int	maxx, maxy;		// Dimensions de la fenˆtre
  int	iCol;			// Colonne d'affichage courante
  struct CUC_MenuElement *pme;
  WINDOW *w;
  
  if (iCtrlType(pMNU, "CUC_MenuShow", szNomTypeMenu)<0)		return;
  if (iOkWDisp(pMNU->wDisp, szNomClasse, "CUC_MenuShow")<0) return;
  
  SetAttrib();

  w = pMNU->wDisp;
  getmaxyx(w, maxy, maxx);
  
  // Effacement de la barre
  wattrset(w, iAtMenu);
  for (iCol=maxx-1 ; --iCol>0 ; )
	cmvwaddch(w, 1, iCol, ' ');

  // Et affichage des menus  
  iCol = 1;
  for (pme=pMNU->pmeFirst ; pme!=NULL ; pme=pme->pmeSuiv)
  { UC c, *p = pme->szCaption;

	pme->iLeft = iCol;
	iCol++;
	while (c=*p++)
	  if (c=='&')
	  { c = *p++;
		pme->iRaccourci = ALT(maj(c));
		if (c==0) break;
		if (c!='&') wattrset(w, iAtMenuAc);  // Acc‚l‚rateur
		cmvwaddch(w, 1, iCol++, c);
		if (c!='&') wattrset(w, iAtMenu);
	  }
	  else
		cmvwaddch(w, 1, iCol++, c);

	iCol++;
  }
  wattrset(w, 0);
}

static void AfficheTitreMenu(WINDOW *wDisp, struct CUC_MenuElement *pme, int iSelect)
{ UC c, *p = pme->szCaption;
  int iCol = pme->iLeft;

  wattrset(wDisp, iSelect ? iAtSelMenu : iAtMenu);
  cmvwaddch(wDisp, 1, iCol++, ' ');

  while (c=*p++)
	if (c=='&')
	{ c = *p++;
	  if (c!='&') wattrset(wDisp, iSelect ? iAtSelMenuAc : iAtMenuAc);
	  cmvwaddch(wDisp, 1, iCol++, c);
	  if (c!='&') wattrset(wDisp, iSelect ? iAtSelMenu : iAtMenu);
	}
	else
	  cmvwaddch(wDisp, 1, iCol++, c);

  cmvwaddch(wDisp, 1, iCol++, ' ');
  wattrset(wDisp, 0);
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_MenuElementSetPropNum(struct CUC_MenuElement *pel, int iProp, int iArg)
{
  if (iCtrlType(pel, "CUC_MenuElementSetPropNum", szNomTypeMenuElement)<0)
	return -1;

  switch(iProp)
  {
    case CUCP_CHECKED:
      if (iArg)
        pel->iFlags |= CUCM_CHECKED;
      else
        pel->iFlags &= ~CUCM_CHECKED;
      break;
    case CUCP_ENABLED:
      if (iArg)
        pel->iFlags &= ~CUCM_DISABLED;
      else
        pel->iFlags |= CUCM_DISABLED;
      break;
    case CUCP_VISIBLE:
      if (iArg)
        pel->iFlags &= ~CUCM_INVISIBLE;
      else
        pel->iFlags |= CUCM_INVISIBLE;
      break;
    case CUCP_FLAGS:
      pel->iFlags = iArg;
  }
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ "char *"

int CUC_MenuElementSetPropStr(struct CUC_MenuElement *pel, int iProp, const char *szVal)
{
  if (iCtrlType(pel, "CUC_MenuElementSetPropStr", szNomTypeMenuElement)<0)
	return -1;

  switch(iProp)
  {
    case CUCP_CAPTION:
      if (pel->szCaption!=NULL) free(pel->szCaption);
      if (szVal==NULL)
        pel->szCaption = strdup("");
      else
		pel->szCaption = strdup(szVal);
      break;
  }
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"

int CUC_MenuSetPropPtr(struct CUC_Menu *pMNU, int iProp, void *pArg)
{
  if (iCtrlType(pMNU, "CUC_MenuSetPropPtr", szNomTypeMenu)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_IDBACK:	pMNU->IdBack = pArg;	break;
	case CUCP_WDISP:	pMNU->wDisp = pArg;		break;

	default:
	  ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
	  return -1;
  }

  return 0;	// Tout s'est bien pass‚
}

/*====================================================================*/
// Lecture d'une propri‚t‚ num‚rique

int CUC_MenuElementGetPropNum(struct CUC_MenuElement *pel, int iProp)
{
  if (iCtrlType(pel, "CUC_MenuElementGetPropNum", szNomTypeMenuElement)<0)
	return -1;

  switch(iProp)
  {
    case CUCP_CHECKED: return (pel->iFlags&CUCM_CHECKED)!=0;
    case CUCP_ENABLED: return (pel->iFlags&CUCM_DISABLED)==0;
    case CUCP_VISIBLE: return (pel->iFlags&CUCM_INVISIBLE)==0;
    case CUCP_FLAGS:   return pel->iFlags;
  }
}

/*====================================================================*/
// Lecture d'une propri‚t‚ char *

char *CUC_MenuElementGetPropStr(struct CUC_MenuElement *pel, int iProp, char *szBuffer, int iLBuf)
{
  if (iCtrlType(pel, "CUC_MenuElementGetPropStr", szNomTypeMenuElement)<0)
    return NULL;

  switch(iProp)
  {
    case CUCP_CAPTION:  
	  if (pel->szCaption==NULL)
		szBuffer[0]=0;
	  else
        strncpy2(szBuffer, pel->szCaption, iLBuf);
	  break;
  }
}

/*====================================================================*/
// Retourne le libell‚ d'un acc‚l‚rateur … partir de son code de touche
// A compl‚ter au fur et … mesure des besoins...

static char *szAccelText(int iAccel)
{
  static char szText[16];
  
  if (0==iAccel)
	szText[0] = 0;
  else if (iAccel>=KEY_F(1) && iAccel<=KEY_F(40))
	sprintf(szText, "F%d", iAccel-KEY_F(1)+1);
  else if (iAccel>=1 && iAccel<=26)
	sprintf(szText, "Ctrl+%c", iAccel+'A'-1);
  else if (KEY_DELETE==iAccel)
	strcpy(szText, "Suppr");
  else
	sprintf(szText, "? %d", iAccel);
	
  return szText;
}
                                       
                                       
// Retourne la longueur du libell‚ d'un acc‚l‚rateur
// … partir de son code pour calculer la largeur d'un menu

static int iLongueurAccelText(int iAccel)
{
  return strlen(szAccelText(iAccel));
}

/*====================================================================*/
// Retourne la longueur d'une chaŒne sans tenir compte des &

static int iLongueurSansEt(char *s)
{
  int l = 0;
  char c;
  
  Assert(s!=NULL);
  
  while (c=*s++)
	if (c!='&')
	  l++;
  return l;
}

/*====================================================================*/
// Comme son nom l'indique, affiche une ligne de menu

static void AfficheUneLigneDeMenu(WINDOW *wDisp, struct CUC_MenuElement *pit, int iLargText, int iLargAccel, int iSelect)
{
  int	col;
  char	c, *s;
	
  if (pit->iFlags&CUCM_INVISIBLE) return;
  
  wmove(wDisp, pit->iTop, 1);
  wattrset(wDisp, iSelect ? iAtSelMenuElement : iAtMenuElement);
  
  if (pit->iFlags&CUCM_SEP)
  {
	int i;
	
	for (i=0 ; i<iLargText+iLargAccel+3 ; i++)
	  waddch(wDisp, cSepHz);
	wattrset(wDisp, 0);
	return;
  }
  
  waddch(wDisp, (char)(pit->iFlags&CUCM_CHECKED?'X':' '));
  waddch(wDisp, ' ');
  col = 0;
  s = pit->szCaption;
  while (c=*s++)
	if (c!='&')
	{ waddch(wDisp, c);
	  col++;
	}
	else
	{ 
	  wattrset(wDisp, iSelect ? iAtSelMenuElementAc : iAtMenuElementAc);
	  if (c=*s) s++;
	  if (c)
	  { waddch(wDisp, c);
		col++;
		pit->iRaccourci = maj(c);
	  }
	  wattrset(wDisp, iSelect ? iAtSelMenuElement : iAtMenuElement);
	}
	
  while (col<iLargText)
  { waddch(wDisp, ' ');
	col++;
  }

  // On ajoute le libell‚ de l'acc‚l‚rateur   
  s = szAccelText(pit->iAccel);
  waddstr(wDisp, s);
  col = strlen(s);
  while (col<iLargAccel)
  { waddch(wDisp, ' ');
	col++;
  }
  
  // Et ‚ventuellement un chevron pour sous-menu
  waddch(wDisp, (char)(pit->pmeSousMenu==NULL?' ':175));
  
  wattrset(wDisp, 0);
	
  // On positionne le curseur sur le d‚but du texte
  wmove(wDisp, pit->iTop, 3);
}

/*====================================================================*/

// Retourne l'‚l‚ment suivant dans un menu
static struct CUC_MenuElement *pmeNext(struct CUC_MenuElement *pmeStart, struct CUC_MenuElement *pmeActuel)
{
  struct CUC_MenuElement *pme;
  
  pme = pmeActuel->pmeSuiv;
  if (pme==NULL) pme = pmeStart;
  return pme;
}

// Retourne l'‚l‚ment pr‚c‚dent dans un menu
// Puisqu'il n'y a pas de pointeur sur le pr‚c‚dent,
// il faut se d‚brouiller.
// On parcourt en avant jusqu'on retombe sur le point de d‚part,
// on en d‚duit le pr‚c‚dent...
static struct CUC_MenuElement *pmePrevious(struct CUC_MenuElement *pmeStart, struct CUC_MenuElement *pmeActuel)
{
  struct CUC_MenuElement *pme, *pmePrec;
  pme = pmeActuel;
  
  for(;;)
  {
	pmePrec = pme;
	pme = pme->pmeSuiv;
	if (pme==NULL) pme = pmeStart;
	if (pme==pmeActuel) break;
  }
  return pmePrec;
}

/*====================================================================*/
// Routine r‚cursive de traitement du menu (affichage, navigation)

static int iTraiteMenu(struct CUC_MenuElement *pmeTete, int iTopOrigin, int iLeftOrigin, int iTopAff)
{
  struct CUC_MenuElement *pit, *pmeSel, *pmeNouvSel;
  int	iNbLig;						// Nb de lignes
  int	iNbCol;						// Nb de colonnes
  int	iTop;
  int	iLeft;
  int	l;
  int	iWidth;						// Largeur menu hors-hout
  int	iHeight;					// Hauteur menu hors-tout
  int	iNbColAccel;
  int	iRet;						// Valeur de retour
  int	bAutoReturn;				// Simule l'appui de return
  WINDOW *wDisp;
  
  Assert(pmeTete!=NULL);
  
  // On calcule les dimensions externes du menu
  iNbLig = iNbCol = iNbColAccel = 0;
  for (pit=pmeTete->pmeSousMenu ; pit!=NULL ; pit=pit->pmeSuiv)
  {
	if (pit->iFlags&CUCM_INVISIBLE) continue;
  
	l = iLongueurSansEt(pit->szCaption);
	if (l>iNbCol) iNbCol = l;
	l = iLongueurAccelText(pit->iAccel);
	if (l>iNbColAccel) iNbColAccel = l;
	iNbLig++;
  }
  iTop = iTopOrigin+iTopAff+1;
  iLeft = iLeftOrigin+pmeTete->iLeft;
  
  iNbCol++;
  if (iNbColAccel>0) iNbColAccel++;

  // |X Texte_du_menu Ctrl+PageSuivante >|
  // 12 \iNbCol      /\iNbColAcc       /11
  iWidth = 1+2+iNbCol+iNbColAccel+1+1;
  iHeight = iNbLig+2;
  // R‚ajuster Top et Left de façon … ce que le menu ne sorte pas de l'‚cran...
  if (iLeft+iWidth>=COLS) iLeft = COLS-1-iWidth;
  if (iTop+iHeight>=LINES) iTop = LINES-1-iHeight;
  
  wDisp = newwin2(iHeight, iWidth, iTop, iLeft);
  
  if (wDisp==(WINDOW *)ERR || wDisp==NULL)
  { stopcurses();
	printf("cucmnu.c (iTraiteMenu): Echec … la cr‚ation de la fenˆtre !\n");
	exit(1);
  }
  InitWin(wDisp);
  
  // Affichage
  wattron(wDisp, iAtMenuElement);
  wdrawbox(wDisp, szBoxs, 0, 0, iHeight, iWidth);
  l = 1;
  for (pit=pmeTete->pmeSousMenu ; pit!=NULL ; pit=pit->pmeSuiv)
  { 
	if (pit->iFlags&CUCM_INVISIBLE) continue;
	pit->iTop = l++;
	pit->iLeft = iLeft+iWidth-2;
	AfficheUneLigneDeMenu(wDisp, pit, iNbCol, iNbColAccel, 0);
  }

  // Gestion de la navigation
  iRet = -999;					// On sort quand iRet change de valeur
  pmeSel = pmeTete->pmeSousMenu;
  bAutoReturn = 0;
  for (;;)
  {
	int c;
	
	AfficheUneLigneDeMenu(wDisp, pmeSel, iNbCol, iNbColAccel, 1);
	if (bAutoReturn)
	{ c = KEY_RETURN;
	  bAutoReturn = 0;
	  wnoutrefresh(wDisp);
	}
	else
	  c = wgetch2(wDisp);
	
	pmeNouvSel = pmeSel;
	if (c==KEY_DOWN)
	{
	  for(;;)
	  { pmeNouvSel = pmeNext(pmeTete->pmeSousMenu, pmeNouvSel);
		if (pmeNouvSel==pmeSel) break;
		if (pmeNouvSel->iFlags&CUCM_SEP) continue;
		if (pmeNouvSel->iFlags&CUCM_INVISIBLE) continue;
		if (pmeNouvSel->iFlags&CUCM_DISABLED) continue;
		// Les conditions d'arrˆt sont remplies !
		break;
	  }
	}
	else if (c==KEY_UP)
	{
	  for(;;)
	  { pmeNouvSel = pmePrevious(pmeTete->pmeSousMenu, pmeNouvSel);
		if (pmeNouvSel==pmeSel) break;
		if (pmeNouvSel->iFlags&CUCM_SEP) continue;
		if (pmeNouvSel->iFlags&CUCM_INVISIBLE) continue;
		if (pmeNouvSel->iFlags&CUCM_DISABLED) continue;
		break;
	  }
	}
	else if (c==KEY_LEFT)
	{
	  iRet = -2;
	  // Valeur conventionnelle, qui fait simplement s'arrˆter
	  // sur le niveau pr‚c‚dent dans le cas d'un sous-menu,
	  // ou qui pusse au menu … gauche
	  // si on est dans un menu de 1er niveau
	}
	else if (c==KEY_RIGHT)
	{
	  // La fleche … droite a un traitement un peu diff‚rent.
	  // Si l'item est simple, on retourne la valeur conventionnelle -3
	  // qui ferme tous les sous-menus ouverts et passe au menu
	  // de niveau principal de droite.
	  if (pmeSel->pmeSousMenu==NULL)
		iRet = -3;
	  else
	  // Par contre, si l'item est un sous-menu, on ouvre ce sous-menu,
	  // exactement comme dans le cas de la touche Return.
		bAutoReturn = 1;
	}
	else if (c==KEY_RETURN)
	{
	  if (pmeSel->pmeSousMenu==NULL)
		// Si c'est un simple item, on sort en retournant l'Id
		// de l'item s‚lectionn‚,
		iRet = pmeSel->iId;
	  else
	  {
		// Sinon on affiche le sous-menu      	
		int i = iTraiteMenu(pmeSel, 0, 0, iTop+pmeSel->iTop-2);
		if (i>0)					// S‚lection normale
		  iRet = i;
		else if (-1==i)				// Effacement Ctrl+D
		  iRet = -1;
		else if (-3==i)				// Sortie flŠche … droite
		  iRet = -3;				// On remonte
		
		// Un retour de 0 signifie une simple fermeture de sous-menu
		// par ESC, on ne fait rien dans ce cas.
		// Une remont‚e par la flŠche gauche (-2) est ‚galement
		// non propag‚e.
	  }
	}
	else if (c==KEY_ESCAPE)
	{
	  iRet = 0;
	}
	else if (c==KEY_CTRL_D)
	{
	  iRet = -1;
	}
	else
	{ 
	  int trouve = 0;
	
	  for(;;)
	  { pmeNouvSel = pmeNext(pmeTete->pmeSousMenu, pmeNouvSel);
		if (iMaj(c)==pmeNouvSel->iRaccourci && ((pmeNouvSel->iFlags&CUCM_INVISIBLE)==0) && ((pmeNouvSel->iFlags&CUCM_DISABLED)==0))
		{ trouve = 1;
		  break;
		}
		if (pmeNouvSel==pmeSel) break;
	  }
	  if (!trouve)
		beep();
	  else
	  {
		// Une fois qu'on a trouv‚ un acc‚l‚rateur satisfaisant,
		// si celui-ci est unique on sort du menu,
		// sinon on attend simplement.
		struct CUC_MenuElement *pmeNouvSel2;
		pmeNouvSel2 = pmeNouvSel;           
		trouve = 0;
		for(;;)
		{
		  pmeNouvSel2 = pmeNext(pmeTete->pmeSousMenu, pmeNouvSel2);
		  if (pmeNouvSel2==pmeNouvSel) break;
		  if (pmeNouvSel->iFlags&CUCM_SEP) continue;
		  if (pmeNouvSel->iFlags&CUCM_INVISIBLE) continue;
		  if (pmeNouvSel->iFlags&CUCM_DISABLED) continue;
		  if (iMaj(c)==pmeNouvSel2->iRaccourci)
		  { trouve = 1;
			break;
		  }
		}
		
		// Si trouve est vrai, il y a deux items avec le mˆme
		// acc‚l‚rateur, on ne fait rien.
		// Si trouve est faux, on laisse placer la s‚lection dessus,
		// et le bool‚en bAutoReturn permet de simuler ensuite
		// l'appui sur return...
		if (!trouve)
		  bAutoReturn = 1;
	  }
	}

	// Sortie finale    
	if (iRet!=-999) break;
	
	// Navigation
	if (pmeSel!=pmeNouvSel)
	{ AfficheUneLigneDeMenu(wDisp, pmeSel, iNbCol, iNbColAccel, 0);
	  pmeSel = pmeNouvSel;
	}
  }
  
  delwin2(wDisp);

  return iRet;
}

/*====================================================================*/
// Lance le fonctionnement du menu pass‚ en paramŠtre avec la touche
// d'ouverture iKey. Garde le contr“le du clavier jusqu'… ce qu'une
// condition de sortie 'normale' soit atteinte (s‚lection d'un
// item simple, sortie par ESC ou Ctrl+D)
// wDisp est la fenˆtre sur laquelle est affich‚e la barre de menu,
// utilis‚e pour connaŒtre sa position … l'‚cran de fa‡on … afficher
// les menus au bon endroit

int CUC_MenuExec(struct CUC_Menu *pMNU, int iKey, WINDOW *wDisp)
{
  int	iCol;			// Colonne d'affichage courante
  struct CUC_MenuElement *pme;
  int	iRet;
  int	x, y;
  
  if (iCtrlType(pMNU, "CUC_MenuExec", szNomTypeMenu)<0)		return 0;
  if (iOkWDisp(pMNU->wDisp, szNomClasse, "CUC_MenuExec")<0) return 0;

  iCol = 1;
  for (pme=pMNU->pmeFirst ; pme!=NULL ; pme=pme->pmeSuiv)
  {
	if (pme->iAccel==iKey || pme->iRaccourci==iKey)
	  break;
  }
  
  if (pme==NULL)
  { aprintf("CUC_MenuExec", "Pas trouv‚ l'acc‚l‚rateur %d !", iKey);
	return 0;
  }

  getbegyx(wDisp, y, x);
  for (;;)
  {
	AfficheTitreMenu(wDisp, pme, 1);
	wnoutrefresh(wDisp);

	if (pMNU->iRaiseEvent != NULL)
	  pMNU->iRaiseEvent(pMNU->IdBack, CUCE_DROPDOWN, pme->iId);
	
	iRet = iTraiteMenu(pme, y, x, 1);
	AfficheTitreMenu(wDisp, pme, 0);
	
	if (-2==iRet)	// FlŠche gauche
	{ pme = pmePrevious(pMNU->pmeFirst, pme);
	  continue;
	}
	if (-3==iRet)	// FlŠche droite
	{ pme = pmeNext(pMNU->pmeFirst, pme);
	  continue;
	}
	break;
  }
  return iRet;
}

/*====================================================================*/
// D‚termine si la touche pass‚e en paramŠtre est une touche d'ouveture
// du menu. Si c'est le cas, la fonction CUC_MenuExec peut prendre
// le relais. La touche doit ˆtre de la forme ALT(xx), puisque les
// titres des menus principaux sont m‚moris‚s en ALT(x), ou x est le
// caractŠre qui suit le & dans la propri‚t‚ Caption.

int CUC_MenuIsOpenKey(struct CUC_Menu *pMNU, int iKey)
{
  struct CUC_MenuElement *pme;
  
  if (iCtrlType(pMNU, "CUC_MenuExec", szNomTypeMenu)<0)		return 0;
  if (iOkWDisp(pMNU->wDisp, szNomClasse, "CUC_MenuExec")<0) return 0;

  for (pme=pMNU->pmeFirst ; pme!=NULL ; pme=pme->pmeSuiv)
  {
	if (pme->iAccel==iKey || pme->iRaccourci==iKey)
	  return 1;
  }
  
  return 0;
}

/*====================================================================*/
// Parcours r‚cursif interne de l'arbre d'un menu pour vidage

static void Dump(struct CUC_MenuElement *pme, int iCol)
{
  while (pme!=NULL)
  {
	printf("%*cItem @%p %3d %s\n", iCol, ' ', pme, pme->iFlags, pme->szCaption);
	if (pme->pmeSousMenu!=NULL)
	  Dump(pme->pmeSousMenu, iCol+2);
	pme = pme->pmeSuiv;
  }
}


// Affiche sur la sortie standard la structure d'un menu

void CUC_MenuDump(struct CUC_Menu *pMNU)
{
  if (iCtrlType(pMNU, "CUC_MenuDump", szNomTypeMenu)<0)		return;

  printf("CUC_Menu @%p\n", pMNU);
  Dump(pMNU->pmeFirst, 2);
}

/*====================================================================*/
// Parcours r‚cursif de la structure d'un menu … la recherche d'un
// acc‚l‚rateur valant iKey

static int iIdAccel(struct CUC_MenuElement *pme, int iKey)
{
  int iRet;
  
  while (pme!=NULL)
  {
	if ((pme->iAccel==iKey) && ((pme->iFlags&CUCM_INVISIBLE)==0) && ((pme->iFlags&CUCM_DISABLED)==0))
	  return pme->iId;
	if (pme->pmeSousMenu!=NULL)
	{ iRet = iIdAccel(pme->pmeSousMenu, iKey);
	  if (iRet>=0)
	    return iRet;
	}
	pme = pme->pmeSuiv;
  }
  return -1;
}


// Retourne l'Id du controle dont l'acc‚l‚rateur est iKey, ou -1
// si aucun ne correspond … iKey (ou qu'il est d‚sactiv‚ ou invisible)
            
int CUC_MenuIsAccelKey(struct CUC_Menu *pMNU, int iKey)
{
  if (iCtrlType(pMNU, "CUC_MenuIsAccelKey", szNomTypeMenu)<0)
	return -1;

  return iIdAccel(pMNU->pmeFirst, iKey);
}

/*====================================================================*/
// Parcours r‚cursif de la structure d'un menu … la recherche d'un
// ‚l‚ment de menu ayant iId comme Id

static struct CUC_MenuElement *pmeGetElementById(struct CUC_MenuElement *pme, int iId)
{
  while (pme!=NULL)
  {
	if (pme->iId==iId)
	  return pme;
	if (pme->pmeSousMenu!=NULL)
	{ struct CUC_MenuElement *pmeRet = pmeGetElementById(pme->pmeSousMenu, iId);
	  if (pmeRet!=NULL)
	    return pmeRet;
	}
	pme = pme->pmeSuiv;
  }
  return NULL;
}


// Recherche d'un ‚l‚ment de menu … partir du menu
// et de son identificateur

struct CUC_MenuElement *CUC_MenuGetElementById(struct CUC_Menu *pMNU, int iId)
{
  if (iCtrlType(pMNU, "CUC_MenuGetElementById", szNomTypeMenu)<0)	return NULL;
  
  return pmeGetElementById(pMNU->pmeFirst, iId);
}

