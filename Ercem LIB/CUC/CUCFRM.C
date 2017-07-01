// cucfrm.c
// BibliothŠque CUC - Implantation d'une feuille de contr“les
// et d'un scheduler g‚n‚rique
// P.VIOLENT Juillet 94
// 11/09/94 PV  CUC_FormDoEvent g‚n‚rique pour sous-classement
//              M‚canisme iLoading pour SetActiveControl lors de LOAD
// 15/11/94 PV  Gestion dynamique de la liste des ‚v‚nements
//              DataExchange pour les labels. NULL_INT pour champs vides
// 18/11/94 PV  Le mˆme ‚v‚nement peut ˆtre d‚fini plusieurs fois
//              pour un contr“le !!
//  4/12/94 PV  Int‚gration des menus sur les feuilles
// 13/12/94 PV  DX_Double
// 16/12/94 PV  CUC_FormSetPropStrInd
// 26/12/94 PV  Outline; Get/SetPropNumInd; AddItemIndent
//  4/01/95 PV  Ev‚nements SHOW et HIDE pour les feuilles
// 18/01/95 PV  G‚n‚ration des ALT() correcte
// 20/01/95 PV  Flags
// 21/01/95 PV	Ev‚nements g‚n‚r‚s directement par les menus (DROPDOWN)
// 10/02/95 PV	Feuille de base parente de tous les boutons
//
// Ce n'est pas un contr“le au sens CUC classique, mais un support sur
// lequel il est possible de cr‚er autant de contr“les que n‚cessaire.
// L'affichage de la feuille est sous-trait‚ au contr“le CUC_Window
// Les contr“les sont rep‚r‚s sur la feuille avec un identifiant
// num‚rique entier unique (iId).
//
// Am‚liorations … ajouter:
// - Donner accŠs … l'ext‚rieur au contr“le CUC_Window d'affichage
//   mais en principe les fonctions de manipulations ‚quivalentes
//   sont fournies directement (CUC_FormXXX)
// - En cas de masquage et de r‚affichage de la feuille, tous les
//   contr“les sont rendus invisibles/visibles. Cela empˆche
//   l'utilisation de contr“les invisibles de fa‡on simple.
//

#include <stdio.h>
#include <curses.h>
#include <memory.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

#include "cucgctl.h"        // AccŠs g‚n‚rique aux contr“les

static char szTypeForm[]  = "FRM";
static char szTypePLC[]   = "PLC";
static char szTypeEvent[] = "EVT";

// LCtl sert … g‚rer la liste des contr“les attach‚s … une feuille
// La liste est doublement chaŒn‚e pour la navigation du focus
struct LCtl
{
  char              szType[4];          // Pour des contr“les internes de validit‚ de pointeur
  int               iType;              // CUCT_xxx
  int               iId;                // Identificateur
  void              *pCTL;              // Pointeur vers un contr“le quelconque
  struct CUC_Form   *pFRM;              // Pour remonter … la feuille … partir de la fonction de rappel d'un ‚v‚nement
  struct LCtl       *plcPrec;           // Contr“le pr‚c‚dent
  struct LCtl       *plcSuiv;           // Contr“le suivant
};


// La structure ‚v‚nement. Cette liste chaŒn‚e … partir de la struct CUC_Form
// m‚morise tous les ‚v‚nements g‚n‚r‚s par les contr“les de la feuille,
// puisque le traitement est diff‚r‚.
struct CtrlEvent
{
  char              szType[4];          // Pour des contr“les internes de validit‚ de pointeur
  int               iEvent;
  int               iArg;               // ParamŠtre compl‚mentaire
  struct LCtl       *plcCTL;            // Le contr“le ayant g‚n‚r‚ l'‚v‚nement
  struct CtrlEvent  *suiv;
};


// La structure de la feuille elle-mˆme
struct CUC_Form
{
  char              szType[4];          // Pour des contr“les internes de validit‚ de pointeur
  struct CUC_Window *pWIN;              // GŠre l'affichage de la feuille
  struct LCtl       *plcControles;      // Liste chaŒn‚e des contr“les de la feuille
  struct LCtl       *plcLastCtl;        // Dernier contr“le cr‚‚
  struct LCtl       *plcActif;          // Le contr“le actif
  int               iId;                // Identification en pseudo-contr“le
  int               iNbCtl;             // Nb de contr“les attach‚s
  struct CtrlEvent  *peBackEvent;       // Ev‚nement en retour g‚n‚r‚ par le contr“le
  int               iExit;              // Sortir de la boucle DoEvents dŠs que possible
  struct FormEvent  *tEvts;             // Table des proc‚dures d'‚v‚nements
  int               nbEvts;             // Nb d'‚v‚nements stock‚s
  struct CUC_Menu   *pmMenu;            // Menu de la feuille
  int               iLoading;           // En cours de chargement
  struct LCtl       *plcFirstActive;    // 1er contr“le actif
  int				iFlags;				// Options diverses
};

// Quelques prototypes priv‚s...
struct LCtl *plcFindControl(char *szRoutine, struct CUC_Form *pFRM, int iId);

static void FormLoad(struct CUC_Form *pFRM);
static void FormUnload(struct CUC_Form *pFRM);
static void ExecFormEvent(struct FormEvent *tEvts, int iId, int iEvent, void *pArg);

//======================================================================
// Dump: affiche l'‚tat complet d'une feuille
// A des fins de debogage...

#ifdef _DEBUG

void CUC_FormDump(struct CUC_Form *pFRM)
{
  int i;
  struct LCtl *plc;
  FILE *f = fopen("cucdump.txt", "a");
  
  if (iCtrlType(pFRM, "CUC_FormDump", szTypeForm)<0) return;
  fprintf(f, "Dump form @:%p\n", pFRM);
  fprintf(f, "Type:%s\n", pFRM->szType);
  fprintf(f, "pWin:%p\n", pFRM->pWIN);
  fprintf(f, "plcControles:%p\n", pFRM->plcControles);
  fprintf(f, "plcLastCtl:%p\n", pFRM->plcLastCtl);
  fprintf(f, "plcActif:%p\n", pFRM->plcActif);
  fprintf(f, "iId:%d\n", pFRM->iId);
  fprintf(f, "iNbCtl:%d\n", pFRM->iNbCtl);
  fprintf(f, "peBackEvent:%p\n", pFRM->peBackEvent);
  fprintf(f, "iExit:%d\n", pFRM->iExit);
  fprintf(f, "tEvts:%p\n", pFRM->tEvts);
  for (i=0,plc=pFRM->plcControles ; plc ; i++,plc=plc->plcSuiv)
	fprintf(f, "Ctl %2d: @=%p Ty=%2d Id=%3d  pCTL:%p (%s)\n", i, plc, plc->iType, plc->iId, plc->pCTL, plc->pCTL);
  fprintf(f, "\n\n");
  fclose(f);
}

#endif

//======================================================================
// Fonction de rappel pour les ‚v‚nements g‚n‚r‚s par les menus
// Ces ‚l‚ments sont trait‚s imm‚diatement, de fa‡on asynchrone
// de fa‡on … ce que le traitement d'un ‚v‚nement DROPDOWN soit
// effectu‚ avant que le menu soit affich‚

static int MenuRaiseEvent(struct CUC_Form *pFRM, int iEvent, int iArg)
{
  if (iCtrlType(pFRM, "MenuraiseEvent", szTypeForm)<0) return 0;
  ExecFormEvent(pFRM->tEvts, iArg, iEvent, 0);
  return 0;
}

//======================================================================
// Cr‚ation / Destruction

int CUC_FormCreate(struct CUC_Form **ppFRM, struct FormControl *tFC, struct FormEvent *tFE, struct FormMenu *tFM)
{
  int   i;
  int   nbE;                // Nb d'‚v‚nements dans le tableau des evts
  struct CUC_Form   *pFRM;
  struct FormEvent  *pFE;   // Copie du tableau tFE

  if (tFE==NULL)
  { aprintf("CUC_FormCreate", "|La table des ‚v‚nements doit ˆtre d‚finie !|");
	return -1;
  }
  if (tFC==NULL)
  { aprintf("CUC_FormCreate", "|La table des contr“les doit ˆtre d‚finie !|");
	return -1;
  }

  if (tFC[0].iType!=CUCT_FORM)
  { aprintf("CUC_FormCreate", "|La table des contr“les doit commencer|par la d‚finition de la feuille !|");
	return -1;
  }
  
  pFRM = (struct CUC_Form *)malloc(sizeof(struct CUC_Form));

  if (pFRM==NULL)
  { aprintf("CUC: CUC_FormCreate", "Echec au malloc (structure Form interne) !");
	return -1;
  }

  // La structure des ‚v‚nements est g‚r‚e en m‚moire dynamique de fa‡on
  // priv‚e par la bibliothŠque...
  for (nbE=0 ; tFE[nbE++].iId>=0 ; ) ;
  pFE = malloc(nbE*sizeof(struct FormEvent));
  if (pFE==NULL)
  { aprintf("CUC: CUC_FormCreate", "Echec au malloc (tableau des ‚v‚nements) !");
	return -1;
  }
  memcpy(pFE, tFE, nbE*sizeof(struct FormEvent));

  strcpy(pFRM->szType, szTypeForm);     // Pour contr“ler le type ult‚rieurement
  
  pFRM->plcControles = NULL;            // ChaŒnage des postes
  pFRM->plcLastCtl = NULL;
  pFRM->tEvts = pFE;
  pFRM->nbEvts = nbE;
  pFRM->iNbCtl = 0;
  pFRM->peBackEvent = NULL;
  pFRM->iFlags = 0;
  
  if (tFM!=NULL)
	pFRM->pmMenu = CUC_MenuCreateAssist(tFM, NULL, MenuRaiseEvent, pFRM);
  else
	pFRM->pmMenu = NULL;
  
  pFRM->pWIN = CUC_WindowCreate(NULL, NULL);
  CUC_WindowSetPropNum(pFRM->pWIN, CUCP_TOP, tFC[0].iTop);
  CUC_WindowSetPropNum(pFRM->pWIN, CUCP_LEFT, tFC[0].iLeft);
  CUC_WindowSetPropNum(pFRM->pWIN, CUCP_WIDTH, tFC[0].iWidth);
  CUC_WindowSetPropNum(pFRM->pWIN, CUCP_HEIGHT, tFC[0].iHeight);
  CUC_WindowSetPropStr(pFRM->pWIN, CUCP_CAPTION, tFC[0].pArg);
  pFRM->iId = tFC[0].iId;

  for (i=1 ; tFC[i].iId>=0 ; i++)
	CUC_FormAddCtl(pFRM, tFC[i].iId, tFC[i].iType, tFC[i].iTop, tFC[i].iLeft, tFC[i].iHeight, tFC[i].iWidth, tFC[i].iParent, tFC[i].pArg);
  
  *ppFRM = pFRM;
  pFRM->iLoading = 1;
  pFRM->plcFirstActive = NULL;
  FormLoad(pFRM);
  pFRM->iLoading = 0;
  
  return 0;
}


void CUC_FormDestruct(struct CUC_Form *pFRM)
{
  struct LCtl *p, *q;
  struct CtrlEvent *e, *f;
  
  if (iCtrlType(pFRM, "CUC_FormDestruct", szTypeForm)<0) return;
  
  // On le signale … l'application
  FormUnload(pFRM);
  
  // On libŠre le menu
  if (pFRM->pmMenu!=NULL)
	CUC_MenuDestruct(pFRM->pmMenu);
	
  // On libŠre la m‚moire utilis‚e par la liste des contr“les...
  p = pFRM->plcControles;
  while (p!=NULL)
  { 
	// On d‚truit d'abord le contr“le...
	CUC_ControlDestruct(p->pCTL, p->iType);
	
	q = p->plcSuiv;
	free(p);
	p = q;
  }

  // On libŠre la liste des ‚v‚nements
  free(pFRM->tEvts);
  
  // On libŠre le presse-papiers du contr“le TXT
  CUC_TextEditFreeClipBoard();
  
  // Puis la fenˆtre d'affichage...
  CUC_WindowDestruct(pFRM->pWIN);
  
  // On libère la file des ‚v‚nements ‚ventuellements g‚n‚r‚s lors de la destruction
  // qui sont simplement ignor‚s...
  e = pFRM->peBackEvent;
  while (e!=NULL)
  { f = e->suiv;
	free((char *)e);
	e = f;
  }

  // Puis la feuille pour terminer
  pFRM->szType[0] = 0;          // S‚curit‚ pour d‚tecter un usage erronn‚ aprŠs destruction
  free(pFRM);
}


//======================================================================

int CUC_FormSetFlags(struct CUC_Form *pFRM, int iFlags)
{
  if (iCtrlType(pFRM, "CUC_FormSetFlags", szTypeForm)<0) return -1;
  
  pFRM->iFlags |= iFlags;
  return pFRM->iFlags;
}

int CUC_FormResetFlags(struct CUC_Form *pFRM, int iFlags)
{
  if (iCtrlType(pFRM, "CUC_FormResetFlags", szTypeForm)<0) return -1;
  
  pFRM->iFlags &= ~iFlags;
  return pFRM->iFlags;
}

int CUC_FormGetFlags(struct CUC_Form *pFRM)
{
  if (iCtrlType(pFRM, "CUC_FormSetFlags", szTypeForm)<0) return -1;
  
  return pFRM->iFlags;
}

//======================================================================
// ControlRaiseEvent est la proc‚dure de signalisation d'‚v‚nements
// appel‚e par tous les contr“les
// Elle 'enregistre' l'appel, qui sera trait‚ ailleurs
static int ControlRaiseEvent(struct LCtl *plcCTL, int iEvent, int iArg)
{
  struct CtrlEvent *e, *p;
  
  if (plcCTL->pCTL==NULL) return 0;     // En cours de cr‚ation on ignore les ‚v‚nements
  if (iCtrlType(plcCTL->pFRM, "CUC Form: ControlRaiseEvent", szTypeForm)<0) return 0;

// aprintf("ControlRaiseEvent", "Id: %d|iEvent: %d|iArg: %d", plcCTL->iId, iEvent, iArg);

  e = (struct CtrlEvent *)malloc(sizeof(struct CtrlEvent));
  strcpy(e->szType, szTypeEvent);       // Pour contr“ler le type ult‚rieurement
  e->iEvent = iEvent;
  e->iArg = iArg;
  e->plcCTL = plcCTL;
  e->suiv = NULL;

  if (plcCTL->pFRM->peBackEvent==NULL)
	plcCTL->pFRM->peBackEvent = e;
  else
  { for (p=plcCTL->pFRM->peBackEvent ; p->suiv!=NULL ; p=p->suiv);
	p->suiv = e;
  }
  return 0;
}


// Cr‚ation dynamique d'un ‚v‚nement
int CUC_FormAddEvt(struct CUC_Form *pFRM, int iId, int iEvent, void (*pProc)())
{
  struct FormEvent  *pFE;

  if (iCtrlType(pFRM, "CUC_FormAddEvt", szTypeForm)<0) return -1;

  pFE = realloc(pFRM->tEvts, (pFRM->nbEvts+1)*sizeof(struct FormEvent));
  if (pFE==NULL)
  { aprintf("CUC: CUC_FormAddEvt", "Echec au realloc !");
	return -1;
  }

  pFE[pFRM->nbEvts-1].iId = iId;
  pFE[pFRM->nbEvts-1].iEvent = iEvent;
  pFE[pFRM->nbEvts-1].pProc = pProc;
  pFE[pFRM->nbEvts].iId = -1;

  pFRM->tEvts = pFE;
  pFRM->nbEvts++;

  return 0;
}


// Cr‚ation d'un contr“le dynamique sur la feuille
void *CUC_FormAddCtl(struct CUC_Form *pFRM, int iId, int iType, int iTop, int iLeft, int iHeight, int iWidth, int iParent, char *szCaption)
{
  void *pCTL;
  struct LCtl *plc;
  
  if (iCtrlType(pFRM, "CUC_FormAddCtl", szTypeForm)<0) return NULL;
  
  // On v‚rifie que l'identificateur est unique, au moins dans la feuille
  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
	if (plc->iId==iId)
	{ aprintf("CUC: CUC_FormAddCtl", "|Double utilisation d'un Id:|le contr“le %d existe d‚j… !|", iId);
	  return NULL;
	}
  
  plc = (struct LCtl *)malloc(sizeof(struct LCtl));
  if (plc==NULL)
  { aprintf("CUC: CUC_FormAddCtl", "|Echec au malloc !|");
	return NULL;
  }
  
  strcpy(plc->szType, szTypePLC);       // Pour contr“ler le type ult‚rieurement
  plc->pCTL = NULL;                     // Pour ignorer les ‚v‚nements g‚n‚r‚s par le contr“le avant la fin de la cr‚ation
  
  // Traitement des coordonn‚es relatives au parent
  // On les transforme en coordonn‚es absolues sur la feuille
  if (iParent>0 && iParent!=pFRM->iId)
  {
	struct LCtl *plc;
	
	plc = plcFindControl("CUC_FormAddCtl", pFRM, iParent);
	if (plc==NULL)
	{ aprintf("CUC: CUC_FormAddCtl", "|Contr“le parent %d|du contr“le %d inexistant !|", iParent, iId);
	  return NULL;
	}
	
	iTop    += CUC_ControlGetPropNum(plc->pCTL, plc->iType, CUCP_TOP);
	iLeft   += CUC_ControlGetPropNum(plc->pCTL, plc->iType, CUCP_LEFT);
  }
  
  switch(iType)
  {
	case CUCT_HSCROLLBAR:
	  pCTL = CUC_HScrollBarCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_HScrollBarSetPropPtr(pCTL, CUCP_IDBACK,   plc);
	  CUC_HScrollBarSetPropNum(pCTL, CUCP_LEFT,     iLeft);
	  CUC_HScrollBarSetPropNum(pCTL, CUCP_TOP,      iTop);
	  CUC_HScrollBarSetPropNum(pCTL, CUCP_WIDTH,    iWidth);
	  CUC_HScrollBarSetPropNum(pCTL, CUCP_HEIGHT,   iHeight);
	  CUC_HScrollBarSetPropNum(pCTL, CUCP_CSIZE,    2);
	  break;

	case CUCT_VSCROLLBAR:
	  pCTL = CUC_VScrollBarCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_VScrollBarSetPropPtr(pCTL, CUCP_IDBACK,   plc);
	  CUC_VScrollBarSetPropNum(pCTL, CUCP_LEFT,     iLeft);
	  CUC_VScrollBarSetPropNum(pCTL, CUCP_TOP,      iTop);
	  CUC_VScrollBarSetPropNum(pCTL, CUCP_WIDTH,    iWidth);
	  CUC_VScrollBarSetPropNum(pCTL, CUCP_HEIGHT,   iHeight);
	  break;

	case CUCT_LABEL:
	  pCTL = CUC_LabelCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_LabelSetPropPtr(pCTL, CUCP_IDBACK,        plc);
	  CUC_LabelSetPropNum(pCTL, CUCP_LEFT,          iLeft);
	  CUC_LabelSetPropNum(pCTL, CUCP_TOP,           iTop);
	  CUC_LabelSetPropNum(pCTL, CUCP_WIDTH,         iWidth);
	  CUC_LabelSetPropNum(pCTL, CUCP_HEIGHT,        iHeight);
	  CUC_LabelSetPropStr(pCTL, CUCP_CAPTION,       szCaption);
	  break;

	case CUCT_TEXTEDIT:
	  pCTL = CUC_TextEditCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_TextEditSetPropPtr(pCTL, CUCP_IDBACK,     plc);
	  CUC_TextEditSetPropNum(pCTL, CUCP_LEFT,       iLeft);
	  CUC_TextEditSetPropNum(pCTL, CUCP_TOP,        iTop);
	  CUC_TextEditSetPropNum(pCTL, CUCP_WIDTH,      iWidth);
	  CUC_TextEditSetPropNum(pCTL, CUCP_HEIGHT,     iHeight);
	  CUC_TextEditSetPropStr(pCTL, CUCP_TEXT,       szCaption);
	  CUC_TextEditSetPropNum(pCTL, CUCP_BORDERSTYLE, 1);
	  break;

	case CUCT_FRAME:
	  pCTL = CUC_FrameCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_FrameSetPropPtr(pCTL, CUCP_IDBACK,        plc);
	  CUC_FrameSetPropNum(pCTL, CUCP_LEFT,          iLeft);
	  CUC_FrameSetPropNum(pCTL, CUCP_TOP,           iTop);
	  CUC_FrameSetPropNum(pCTL, CUCP_WIDTH,         iWidth);
	  CUC_FrameSetPropNum(pCTL, CUCP_HEIGHT,        iHeight);
	  CUC_FrameSetPropStr(pCTL, CUCP_CAPTION,       szCaption);
	  CUC_FrameSetPropNum(pCTL, CUCP_BORDERSTYLE,   1);
	  break;

	case CUCT_OPTIONBUTTON:
	  pCTL = CUC_OptionButtonCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_OptionButtonSetPropPtr(pCTL, CUCP_IDBACK, plc);
	  CUC_OptionButtonSetPropNum(pCTL, CUCP_LEFT,   iLeft);
	  CUC_OptionButtonSetPropNum(pCTL, CUCP_TOP,    iTop);
	  CUC_OptionButtonSetPropNum(pCTL, CUCP_WIDTH,  iWidth);
	  CUC_OptionButtonSetPropNum(pCTL, CUCP_HEIGHT, iHeight);
	  CUC_OptionButtonSetPropStr(pCTL, CUCP_CAPTION,szCaption);
	  CUC_OptionButtonSetPropPtr(pCTL, CUCP_PARENT, (void *)iParent);
	  break;

	case CUCT_CHECKBOX:
	  pCTL = CUC_CheckBoxCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_CheckBoxSetPropPtr(pCTL, CUCP_IDBACK,     plc);
	  CUC_CheckBoxSetPropNum(pCTL, CUCP_LEFT,       iLeft);
	  CUC_CheckBoxSetPropNum(pCTL, CUCP_TOP,        iTop);
	  CUC_CheckBoxSetPropNum(pCTL, CUCP_WIDTH,      iWidth);
	  CUC_CheckBoxSetPropNum(pCTL, CUCP_HEIGHT,     iHeight);
	  CUC_CheckBoxSetPropStr(pCTL, CUCP_CAPTION,    szCaption);
	  CUC_CheckBoxSetPropPtr(pCTL, CUCP_PARENT,     (void *)iParent);
	  break;

	case CUCT_LIST:
	  pCTL = CUC_ListCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_ListSetPropPtr(pCTL, CUCP_IDBACK,         plc);
	  CUC_ListSetPropNum(pCTL, CUCP_LEFT,           iLeft);
	  CUC_ListSetPropNum(pCTL, CUCP_TOP,            iTop);
	  CUC_ListSetPropNum(pCTL, CUCP_WIDTH,          iWidth);
	  CUC_ListSetPropNum(pCTL, CUCP_HEIGHT,         iHeight);
	  CUC_ListSetPropPtr(pCTL, CUCP_PARENT,         (void *)iParent);
	  break;

	case CUCT_FILELISTBOX:
	  pCTL = CUC_FileListBoxCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_FileListBoxSetPropPtr(pCTL, CUCP_IDBACK,  plc);
	  CUC_FileListBoxSetPropNum(pCTL, CUCP_LEFT,    iLeft);
	  CUC_FileListBoxSetPropNum(pCTL, CUCP_TOP,     iTop);
	  CUC_FileListBoxSetPropNum(pCTL, CUCP_WIDTH,   iWidth);
	  CUC_FileListBoxSetPropNum(pCTL, CUCP_HEIGHT,  iHeight);
	  CUC_FileListBoxSetPropPtr(pCTL, CUCP_PARENT,  (void *)iParent);
	  break;

	case CUCT_DIRLISTBOX:
	  pCTL = CUC_DirListBoxCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_DirListBoxSetPropPtr(pCTL, CUCP_IDBACK,   plc);
	  CUC_DirListBoxSetPropNum(pCTL, CUCP_LEFT,     iLeft);
	  CUC_DirListBoxSetPropNum(pCTL, CUCP_TOP,      iTop);
	  CUC_DirListBoxSetPropNum(pCTL, CUCP_WIDTH,    iWidth);
	  CUC_DirListBoxSetPropNum(pCTL, CUCP_HEIGHT,   iHeight);
	  CUC_DirListBoxSetPropPtr(pCTL, CUCP_PARENT,   (void *)iParent);
	  break;

	case CUCT_COMMANDBUTTON:
	  pCTL = CUC_CommandButtonCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_CommandButtonSetPropPtr(pCTL, CUCP_IDBACK, plc);
	  if (iHeight>2)
		CUC_CommandButtonSetPropNum(pCTL, CUCP_BORDERSTYLE, 0);
	  else
		CUC_CommandButtonSetPropNum(pCTL, CUCP_BORDERSTYLE, 1);
	  CUC_CommandButtonSetPropNum(pCTL, CUCP_LEFT,   iLeft);
	  CUC_CommandButtonSetPropNum(pCTL, CUCP_TOP,    iTop);
	  CUC_CommandButtonSetPropNum(pCTL, CUCP_WIDTH,  iWidth);
	  CUC_CommandButtonSetPropNum(pCTL, CUCP_HEIGHT, iHeight);
	  CUC_CommandButtonSetPropStr(pCTL, CUCP_CAPTION,szCaption);
	  //CUC_CommandButtonSetPropPtr(pCTL, CUCP_PARENT, (void *)iParent);
	  CUC_CommandButtonSetPropPtr(pCTL, CUCP_PARENT, (void *)(pFRM->iId));
	  break;

	case CUCT_COMBOBOX:
	  pCTL = CUC_ComboBoxCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_ComboBoxSetPropPtr(pCTL, CUCP_IDBACK,     plc);
	  CUC_ComboBoxSetPropNum(pCTL, CUCP_LEFT,       iLeft);
	  CUC_ComboBoxSetPropNum(pCTL, CUCP_TOP,        iTop);
	  CUC_ComboBoxSetPropNum(pCTL, CUCP_WIDTH,      iWidth);
	  CUC_ComboBoxSetPropNum(pCTL, CUCP_HEIGHT,     iHeight);
	  CUC_ComboBoxSetPropStr(pCTL, CUCP_TEXT,       szCaption);
	  CUC_ComboBoxSetPropNum(pCTL, CUCP_STYLE,      0);
	  break;

	case CUCT_OUTLINE:
	  pCTL = CUC_OutlineCreate(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP), ControlRaiseEvent);
	  CUC_OutlineSetPropPtr(pCTL, CUCP_IDBACK,      plc);
	  CUC_OutlineSetPropNum(pCTL, CUCP_LEFT,        iLeft);
	  CUC_OutlineSetPropNum(pCTL, CUCP_TOP,         iTop);
	  CUC_OutlineSetPropNum(pCTL, CUCP_WIDTH,       iWidth);
	  CUC_OutlineSetPropNum(pCTL, CUCP_HEIGHT,      iHeight);
	  CUC_OutlineSetPropPtr(pCTL, CUCP_PARENT,      (void *)iParent);
	  break;
  }

  // Remplissage du poste LCtl
  plc->pCTL = pCTL;
  plc->pFRM = pFRM;
  plc->iId = iId;
  plc->iType = iType;
  plc->plcSuiv = NULL;
  plc->plcPrec = pFRM->plcLastCtl;
  
  // ChaŒnage du poste en fin de liste
  if (pFRM->plcControles==NULL)
	pFRM->plcControles = plc;
  else
	pFRM->plcLastCtl->plcSuiv = plc;
  pFRM->plcLastCtl = plc;
  
  pFRM->iNbCtl++;
  
  return pCTL;      // Ok
}


//======================================================================
// Fonctions utilitaires de manipulation, puisque la feuille
// n'implante pas de propri‚t‚s

int CUC_FormShow(struct CUC_Form *pFRM)
{
  WINDOW *w;
  struct LCtl *plc;

  if (iCtrlType(pFRM, "CUC_FormShow", szTypeForm)<0) return -1;

  CUC_WindowSetPropNum(pFRM->pWIN, CUCP_VISIBLE, 1);
  w = CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP);
  
  // Affichage du menu en premier
  if (pFRM->pmMenu!=NULL)
  { CUC_MenuSetPropPtr(pFRM->pmMenu, CUCP_WDISP, w);
	CUC_MenuShow(pFRM->pmMenu);
  }

  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
  { CUC_ControlSetPropPtr(plc->pCTL, plc->iType, CUCP_WDISP, w);
	CUC_ControlSetPropNum(plc->pCTL, plc->iType, CUCP_VISIBLE, 1);
  }

  // On g‚nŠre l'‚v‚nement SHOW pour la feuille
  ExecFormEvent(pFRM->tEvts, pFRM->iId, CUCE_SHOW, 0);
  // Et il serait bien de le g‚n‚rer pour chacun des contr“les...
  
  return 0;
}


int CUC_FormHide(struct CUC_Form *pFRM)
{
  struct LCtl *plc;

  ExecFormEvent(pFRM->tEvts, pFRM->iId, CUCE_HIDE, 0);

  if (iCtrlType(pFRM, "CUC_FormHide", szTypeForm)<0) return -1;
  CUC_WindowSetPropNum(pFRM->pWIN, CUCP_VISIBLE, 0);
  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
  { CUC_ControlSetPropNum(plc->pCTL, plc->iType, CUCP_VISIBLE, 0);
	CUC_ControlSetPropPtr(plc->pCTL, plc->iType, CUCP_WDISP, NULL);
  }
}

int CUC_FormMove(struct CUC_Form *pFRM, int iTop, int iLeft)
{
  if (iCtrlType(pFRM, "CUC_FormMove", szTypeForm)<0) return -1;
  return CUC_WindowMove(pFRM->pWIN, iTop, iLeft);
}

int CUC_FormResize(struct CUC_Form *pFRM, int iHeight, int iWidth)
{
  struct LCtl *plc;

  if (iCtrlType(pFRM, "CUC_FormResize", szTypeForm)<0) return -1;
  CUC_WindowResize(pFRM->pWIN, iHeight, iWidth);

  // Et la liste des contr“les
  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
	CUC_ControlRefresh(plc->pCTL, plc->iType);
  // On rafraŒchit la fenˆtre
  //wrefresh(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP));
}

int CUC_FormRefresh(struct CUC_Form *pFRM)
{
  if (iCtrlType(pFRM, "CUC_FormRefresh", szTypeForm)<0) return -1;
  wrefresh(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP));
}

int CUC_FormSetCaption(struct CUC_Form *pFRM, char *szCaption)
{
  if (iCtrlType(pFRM, "CUC_FormSetCaption", szTypeForm)<0) return -1;
  return CUC_WindowSetPropStr(pFRM->pWIN, CUCP_CAPTION, szCaption);
}

char *CUC_FormGetCaption(struct CUC_Form *pFRM, char *szBuffer, int iTailleBuff)
{
  if (iCtrlType(pFRM, "CUC_FormGetCaption", szTypeForm)<0) return NULL;
  return CUC_WindowGetPropStr(pFRM->pWIN, CUCP_CAPTION, szBuffer, iTailleBuff);
}


int CUC_FormActivate(struct CUC_Form *pFRM)
{
  if (iCtrlType(pFRM, "CUC_FormActivate", szTypeForm)<0) return -1;

  CUC_WindowSetPropNum(pFRM->pWIN, CUCP_ENABLED, 1);
  wrefresh(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP));
  return 0;
}

int CUC_FormDeactivate(struct CUC_Form *pFRM)
{
  if (iCtrlType(pFRM, "CUC_FormDeactivate", szTypeForm)<0) return -1;

  CUC_WindowSetPropNum(pFRM->pWIN, CUCP_ENABLED, 0);
  wrefresh(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP));
  return 0;
}

//======================================================================
// Echange de donn‚es entre les contr“les et des variables C
// Data eXchange, bas‚ sur un m‚canisme similaire … celui des MFC

// Echange de donn‚es de type char[]
void DX_Text(int iUS, struct CUC_Form *f, int iId, char *szBuffer, int iLgBuffer)
{
  struct LCtl *plc;
  
  for (plc=f->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
	if (plc->iId==iId)
	{
	  if (iUS)
	  {
		switch(plc->iType)    // Remplissage de la structure de donn‚es
		{
		  case CUCT_TEXTEDIT:   CUC_TextEditGetPropStr(plc->pCTL, CUCP_TEXT, szBuffer, iLgBuffer);    break;
		  case CUCT_LABEL:      CUC_LabelGetPropStr(plc->pCTL, CUCP_CAPTION, szBuffer, iLgBuffer);    break;
		  case CUCT_COMBOBOX:   CUC_ComboBoxGetPropStr(plc->pCTL, CUCP_TEXT, szBuffer, iLgBuffer);    break;
		}
	  }
	  else                  // Remplissage des contr“les
	  {
		switch(plc->iType)
		{
		  case CUCT_TEXTEDIT:   CUC_TextEditSetPropStr(plc->pCTL, CUCP_TEXT, szBuffer); break;
		  case CUCT_LABEL:      CUC_LabelSetPropStr(plc->pCTL, CUCP_CAPTION, szBuffer); break;
		  case CUCT_COMBOBOX:   CUC_ComboBoxSetPropStr(plc->pCTL, CUCP_TEXT, szBuffer); break;
		}
	  }
	  break;
	}

}

// Implantation de la propri‚t‚ valeur d'un contr“le de type Frame
// La valeur du contr“le est ‚gale … l'Id de l'OptionButton s‚lectionn‚
// inclus dans ce frame
static void FrameSetValue(struct CUC_Form *pFRM, struct LCtl *plcFRA, int iValue)
{
  struct LCtl *plc;

  if (plcFRA->iType!=CUCT_FRAME)
  { aprintf("CUC Form", "|FrameSetValue:|Controle %d pas de type Frame !|", plcFRA->iId);
	return;
  }

  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
  {
	if (plc->iType==CUCT_OPTIONBUTTON && plcFRA->iId==(int)CUC_OptionButtonGetPropPtr(plc->pCTL, CUCP_PARENT) && plc->iId==iValue)
	{ CUC_OptionButtonDoEvent(plc->pCTL, CUCE_KEY, ' ');
	  return;
	}
  }

  aprintf("CUC Form", "|FrameSetValue:|Le contr“le %d n'est pas un fils du frame %d !|", iValue, plcFRA->iId);
}

static int iFrameGetValue(struct CUC_Form *pFRM, struct LCtl *plcFRA)
{
  struct LCtl *plc;

  if (plcFRA->iType!=CUCT_FRAME)
  { aprintf("CUC Form", "|FrameSetValue:|Controle %d pas de type Frame !|", plcFRA->iId);
	return -1;
  }

  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
	if (plc->iType==CUCT_OPTIONBUTTON && plcFRA->iId==(int)CUC_OptionButtonGetPropPtr(plc->pCTL, CUCP_PARENT))
	  if (CUC_OptionButtonGetPropNum(plc->pCTL, CUCP_VALUE))
		return plc->iId;
  return -1;
}


// Echange de donn‚es num‚riques
// Les listes sont g‚r‚es en num‚rique (ListIndex)
// Les boutons d'option n'on pas de valeur propre; c'est le cadre
// parent qui a une valeur.
// Pour les contr“les TextEdit et Label, NULL_INT et NULL_SHORT
// sont convertis en valeur vide. En retour, NULL_INT est retourn‚
// pour la valeur vide.

void DX_Value(int iUS, struct CUC_Form *pFRM, int iId, int *piVal)
{
  struct LCtl *plc;
  char  szBuffer[15];
  
  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
	if (plc->iId==iId)
	{
	  if (iUS)
	  {
		switch(plc->iType)
		{
		  case CUCT_HSCROLLBAR: *piVal = CUC_HScrollBarGetPropNum(plc->pCTL, CUCP_VALUE); break;
		  case CUCT_VSCROLLBAR: *piVal = CUC_VScrollBarGetPropNum(plc->pCTL, CUCP_VALUE); break;
		  case CUCT_CHECKBOX:   *piVal = CUC_CheckBoxGetPropNum(plc->pCTL, CUCP_VALUE);   break;
		  case CUCT_LIST:       *piVal = CUC_ListGetPropNum(plc->pCTL, CUCP_LISTINDEX);   break;
		  case CUCT_OUTLINE:    *piVal = CUC_OutlineGetPropNum(plc->pCTL, CUCP_LISTINDEX);   break;
		  case CUCT_FILELISTBOX:*piVal = CUC_FileListBoxGetPropNum(plc->pCTL, CUCP_LISTINDEX);    break;
		  case CUCT_DIRLISTBOX: *piVal = CUC_DirListBoxGetPropNum(plc->pCTL, CUCP_LISTINDEX); break;
		  case CUCT_COMBOBOX:   *piVal = CUC_ComboBoxGetPropNum(plc->pCTL, CUCP_LISTINDEX);   break;
		  case CUCT_TEXTEDIT:   CUC_TextEditGetPropStr(plc->pCTL, CUCP_TEXT, szBuffer, sizeof(szBuffer));
								if (szBuffer[0]==0)
								  *piVal = NULL_INT;
								else
								  *piVal = atoi(szBuffer);
								break;
		  case CUCT_LABEL:      CUC_LabelGetPropStr(plc->pCTL, CUCP_CAPTION, szBuffer, sizeof(szBuffer));
								if (szBuffer[0]==0)
								  *piVal = NULL_INT;
								else
								  *piVal = atoi(szBuffer);
								break;
		  case CUCT_FRAME:      *piVal = iFrameGetValue(pFRM, plc); break;
		}
	  }
	  else
	  {
		switch(plc->iType)
		{
		  case CUCT_HSCROLLBAR: CUC_HScrollBarSetPropNum(plc->pCTL, CUCP_VALUE, *piVal);  break;
		  case CUCT_VSCROLLBAR: CUC_VScrollBarSetPropNum(plc->pCTL, CUCP_VALUE, *piVal);  break;
		  case CUCT_CHECKBOX:   CUC_CheckBoxSetPropNum(plc->pCTL, CUCP_VALUE, *piVal);    break;
		  case CUCT_LIST:       CUC_ListSetPropNum(plc->pCTL, CUCP_LISTINDEX, *piVal);    break;
		  case CUCT_OUTLINE:    CUC_OutlineSetPropNum(plc->pCTL, CUCP_LISTINDEX, *piVal);    break;
		  case CUCT_FILELISTBOX:CUC_FileListBoxSetPropNum(plc->pCTL, CUCP_LISTINDEX, *piVal); break;
		  case CUCT_DIRLISTBOX: CUC_DirListBoxSetPropNum(plc->pCTL, CUCP_LISTINDEX, *piVal);  break;
		  case CUCT_COMBOBOX:   CUC_ComboBoxSetPropNum(plc->pCTL, CUCP_LISTINDEX, *piVal);    break;
		  case CUCT_TEXTEDIT:   if (*piVal==NULL_INT || *piVal==NULL_SHORT)
								  szBuffer[0] = 0;
								else
								  sprintf(szBuffer, "%d", *piVal);
								CUC_TextEditSetPropStr(plc->pCTL, CUCP_TEXT, szBuffer);
								break;
		  case CUCT_LABEL:      if (*piVal==NULL_INT || *piVal==NULL_SHORT)
								  szBuffer[0] = 0;
								else
								  sprintf(szBuffer, "%d", *piVal);
								CUC_LabelSetPropStr(plc->pCTL, CUCP_CAPTION, szBuffer);
								break;
		  case CUCT_FRAME:      FrameSetValue(pFRM, plc, *piVal); break;
		  default:
			aprintf("CUC_Form","DX_Value: Ne sait pas comment traiter|un contr“le de type %d", plc->iType);
		}
	  }
	  break;
	}
} // DX_Value


void DX_Double(int iUS, struct CUC_Form *pFRM, int iId, double *pdVal)
{
  struct LCtl *plc;
  char  szBuffer[15];
  
  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
	if (plc->iId==iId)
	{
	  if (iUS)
	  {
		switch(plc->iType)
		{
		  case CUCT_TEXTEDIT:   CUC_TextEditGetPropStr(plc->pCTL, CUCP_TEXT, szBuffer, sizeof(szBuffer));
								if (szBuffer[0]==0)
								  setnand(*pdVal);
								else
								  *pdVal = atof(szBuffer);
								break;
		  case CUCT_LABEL:      CUC_LabelGetPropStr(plc->pCTL, CUCP_CAPTION, szBuffer, sizeof(szBuffer));
								if (szBuffer[0]==0)
								  setnand(*pdVal);
								else
								  *pdVal = atof(szBuffer);
								break;
		  default:
			aprintf("CUC_Form","DX_Double: Ne sait pas comment traiter|un contr“le de type %d", plc->iType);
		}
	  }
	  else
	  {
		switch(plc->iType)
		{
		  case CUCT_TEXTEDIT:   if (isnand(*pdVal))
								  szBuffer[0] = 0;
								else
								  sprintf(szBuffer, "%g", *pdVal);
								CUC_TextEditSetPropStr(plc->pCTL, CUCP_TEXT, szBuffer);
								break;
		  case CUCT_LABEL:      if (isnand(*pdVal))
								  szBuffer[0] = 0;
								else
								  sprintf(szBuffer, "%g", *pdVal);
								CUC_LabelSetPropStr(plc->pCTL, CUCP_CAPTION, szBuffer);
								break;
		  default:
			aprintf("CUC_Form","DX_Double: Ne sait pas comment traiter|un contr“le de type %d", plc->iType);
		}
	  }
	  break;
	}
} // DX_Double



// Gestion des ‚v‚nements

// Recherche une fonction pour un ‚v‚nement et un identificateur donn‚s
// Si cette fonction n'existe pas, retourne -1
// Le mˆme ‚v‚nement peut ˆtre d‚fini plusieurs fois !!
static void ExecFormEvent(struct FormEvent *tEvts, int iId, int iEvent, void *pArg)
{
  struct FormEvent *e;

  for (e=tEvts ; e->iId>=0 ; e++)
	if (e->iId==iId && e->iEvent==iEvent)
	  e->pProc(pArg);
}


//======================================================================
// AccŠs aux propri‚t‚s via Id
// Routines en CUC_FormXXX, appel‚es depuis l'ext‚rieur
// V‚rifient la validit‚ des paramŠtres et recherchent le pointeur de
// contr“le et le type avant d'appeler la routine en CUC_ControlXXX
// qui agit sur le contr“le.

// Recherche d'un contr“le … partir de son Id
// Faut-il exporter cette fonction ?
static struct LCtl *plcFindControl(char *szRoutine, struct CUC_Form *pFRM, int iId)
{
  static char _f_[] = "plcFindControl";
  struct LCtl *plc;

  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
	if (plc->iId==iId)
	{ if (iCtrlType(plc, "CUC Form (plcFindControl)", szTypePLC)<0) return NULL;
	  return plc;
	}
  
  aprintf(szRoutine, "|%s:|Controle %d inconnu !|", _f_, iId);
  return NULL;
}

// Recherche d'un pointeur de menu … partir de son Id
// En cas d'‚chec, retourne simplement NULL
struct CUC_MenuElement *pelFindMenuElement(char *szRoutine, struct CUC_Form *pFRM, int iId)
{
  static char _f_[] = "pelFindMenuElement";
  
  if (pFRM->pmMenu==NULL) return NULL;
  return CUC_MenuGetElementById(pFRM->pmMenu, iId);
}

int CUC_FormSetPropNum(struct CUC_Form *pFRM, int iId, int iProp, int iArg)
{
  static char _f_[] = "CUC_FormSetPropNum";
  struct LCtl *plc;
  struct CUC_MenuElement *pel;

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  // On cherche d'abord dans les menus
  if (pel = pelFindMenuElement(_f_, pFRM, iId))
	return CUC_MenuElementSetPropNum(pel, iProp, iArg);
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	if (plc->iType==CUCT_FRAME && iProp==CUCP_VALUE)
	  FrameSetValue(pFRM, plc, iArg);
	else
	  return CUC_ControlSetPropNum(plc->pCTL, plc->iType, iProp, iArg);
  else
	return -1;
  return 0;
}

int CUC_FormGetPropNum(struct CUC_Form *pFRM, int iId, int iProp)
{
  static char _f_[] = "CUC_FormGetPropNum";
  struct LCtl *plc; 
  struct CUC_MenuElement *pel;

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  // On cherche d'abord dans les menus
  if (pel = pelFindMenuElement(_f_, pFRM, iId))
	return CUC_MenuElementGetPropNum(pel, iProp);
	
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	if (plc->iType==CUCT_FRAME && iProp==CUCP_VALUE)
	  return iFrameGetValue(pFRM, plc);
	else
	  return CUC_ControlGetPropNum(plc->pCTL, plc->iType, iProp);
  else
	return -1;
}


int CUC_FormGetPropNumInd(struct CUC_Form *pFRM, int iId, int iProp, int iInd)
{
  static char _f_[] = "CUC_FormGetPropNumInd";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlGetPropNumInd(plc->pCTL, plc->iType, iProp, iInd);
  else
	return -1;
}

int CUC_FormSetPropNumInd(struct CUC_Form *pFRM, int iId, int iProp, int iInd, int iArg)
{
  static char _f_[] = "CUC_FormSetPropNumInd";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlSetPropNumInd(plc->pCTL, plc->iType, iProp, iInd, iArg);
  else
	return -1;
}


int CUC_FormSetPropStr(struct CUC_Form *pFRM, int iId, int iProp, char *szText)
{
  static char _f_[] = "CUC_FormSetPropStr";
  struct LCtl *plc; 
  struct CUC_MenuElement *pel;

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  // On cherche d'abord dans les menus
  if (pel = pelFindMenuElement(_f_, pFRM, iId))
	return CUC_MenuElementSetPropStr(pel, iProp, szText);

  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlSetPropStr(plc->pCTL, plc->iType, iProp, szText);
  else
	return -1;
}

char *CUC_FormGetPropStr(struct CUC_Form *pFRM, int iId, int iProp, char *szBuffer, int iLen)
{
  static char _f_[] = "CUC_FormGetPropStr";
  struct LCtl *plc; 
  struct CUC_MenuElement *pel;

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return NULL;
  
  // On cherche d'abord dans les menus
  if (pel = pelFindMenuElement(_f_, pFRM, iId))
	return CUC_MenuElementGetPropStr(pel, iProp, szBuffer, iLen);
	
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlGetPropStr(plc->pCTL, plc->iType, iProp, szBuffer, iLen);
  else
	return NULL;
}


char *CUC_FormGetPropStrInd(struct CUC_Form *pFRM, int iId, int iProp, int iInd, char *szBuffer, int iLen)
{
  static char _f_[] = "CUC_FormGetPropStrInd";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return NULL;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlGetPropStrInd(plc->pCTL, plc->iType, iProp, iInd, szBuffer, iLen);
  else
	return NULL;
}


int CUC_FormSetPropStrInd(struct CUC_Form *pFRM, int iId, int iProp, int iInd, char *szBuffer)
{
  static char _f_[] = "CUC_FormSetPropStrInd";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlSetPropStrInd(plc->pCTL, plc->iType, iProp, iInd, szBuffer);
  else
	return -1;
}


// Remplissage de List et de ComboBox
int CUC_FormAddItem(struct CUC_Form *pFRM, int iId, char *szVal, int iPos)
{
  static char _f_[] = "CUC_FormAddItem";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlAddItem(plc->pCTL, plc->iType, szVal, iPos);
  else
	return -1;
}


// Remplissage de Outline
int CUC_FormAddItemIndent(struct CUC_Form *pFRM, int iId, char *szVal, int iPos, int iIndent)
{
  static char _f_[] = "CUC_FormAddItemIndent";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlAddItemIndent(plc->pCTL, plc->iType, szVal, iPos, iIndent);
  else
	return -1;
}


// Effacement d'un ‚l‚ment de List et de ComboBox
int CUC_FormRemoveItem(struct CUC_Form *pFRM, int iId, int iPos)
{
  static char _f_[] = "CUC_FormRemoveItem";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlRemoveItem(plc->pCTL, plc->iType, iPos);
  else
	return -1;
}


// Effacement du contenu de List et de ComboBox
int CUC_FormClear(struct CUC_Form *pFRM, int iId)
{
  static char _f_[] = "CUC_FormClear";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlClear(plc->pCTL, plc->iType);
  else
	return -1;
}


// Fermeture de ComboBox
int CUC_FormCloseList(struct CUC_Form *pFRM, int iId)
{
  static char _f_[] = "CUC_FormCloseList";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlCloseList(plc->pCTL, plc->iType);
  else
	return -1;
}

// Initialisation des barres de d‚filement
int CUC_FormSetMinMax(struct CUC_Form *pFRM, int iId, int iMin, int iMax, int iCSize)
{
  static char _f_[] = "CUC_FormSetMinMax";
  struct LCtl *plc;

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlSetMinMax(plc->pCTL, plc->iType, iMin, iMax, iCSize);
  else
	return -1;
}


// Sous-classement d'‚v‚nements
int CUC_FormDoEvent(struct CUC_Form *pFRM, int iId, int iEvent, int iParam)
{
  static char _f_[] = "CUC_FormDoEvent";
  struct LCtl *plc; 

  if (iCtrlType(pFRM, _f_, szTypeForm)<0) return -1;
  
  plc = plcFindControl(_f_, pFRM, iId);
  if (plc!=NULL)
	return CUC_ControlDoEvent(plc->pCTL, plc->iType, iEvent, iParam);
  else
	return -1;
}


//======================================================================
// Coeur du fonctionnement de la feuille

static void MoveFocus(struct CUC_Form *pFRM, struct LCtl *plc)
{
  struct LCtl *plcActifPrec = pFRM->plcActif;
  
  if (iCtrlType(plc, "CUC Form (MoveFocus)", szTypePLC)<0) return;

  // On gŠre la passation du focus, et l'activation des
  // proc‚dures d'‚v‚nement concern‚es.
  if (plcActifPrec!=plc && plcActifPrec!=NULL)
  { CUC_ControlDoEvent(plcActifPrec->pCTL, plcActifPrec->iType, CUCE_LOSTFOCUS, 0);
	ExecFormEvent(pFRM->tEvts, plcActifPrec->iId, CUCE_LOSTFOCUS, 0);
  }
	
  pFRM->plcActif = plc;
	
  if (pFRM->plcActif!= plcActifPrec && pFRM->plcActif!=NULL)
  { CUC_ControlDoEvent(pFRM->plcActif->pCTL, pFRM->plcActif->iType, CUCE_GOTFOCUS, 0);
	ExecFormEvent(pFRM->tEvts, pFRM->plcActif->iId, CUCE_GOTFOCUS, 0);
  }

}


// NextFocus d‚place le focus sur la feuille
// Ne peut s'arrˆter que sur un contr“le susceptible de recevoir
// le focus, et qui soit … la fois visible et enabled.
// Si iOpt==0 s‚lectionne le contr“le suivant
// Si iOpt<0  s‚lectionne le contr“le pr‚c‚dent
// Si iOpt>0  s‚lectionne le contr“le ayant pour raccourci iOpt

static int NextFocus(struct CUC_Form *pFRM, int iOpt)
{
  int   i = 0;
  struct LCtl *plc = pFRM->plcActif;
  int   iType;
  int   iStop;      // Sortir de la boucle dŠs que possible
  
  // On d‚termine le contr“le qui doit recevoir le focus
  iStop = 0;
  for(;;)
  {
	i++;
	
	if (plc==NULL)          // 1Šre prise de focus
	  if (iOpt>=0)
		plc = pFRM->plcControles;
	  else
		plc = pFRM->plcLastCtl;
	else
	{
	  if (iOpt>=0)
		plc = plc->plcSuiv;
	  else
		plc = plc->plcPrec;

	  if (plc==NULL)
		if (iOpt>=0)
		  plc = pFRM->plcControles;
		else
		  plc = pFRM->plcLastCtl;
	}
	
	iType = plc->iType;

	if (i>pFRM->iNbCtl)
	  plc = NULL;           // Evite de boucler plus d'un tour si on ne tombe pas sur une condition d'arrˆt
	if (plc==NULL) break;   // Aucun contr“le activable ou fin de boucle !!!
	
	// On ignore les contr“les invisibles...
	if (CUC_ControlGetPropNum(plc->pCTL, iType, CUCP_VISIBLE)==0)
	  continue;

	// les contr“les non enabled...
	if (CUC_ControlGetPropNum(plc->pCTL, iType, CUCP_ENABLED)==0)
	  continue;

	// et les contr“les n'ayant pas le tabstop
	if (CUC_ControlGetPropNum(plc->pCTL, iType, CUCP_TABSTOP)==0)
	  continue;

	// Si on est en navigation s‚quentielle, on peut sortir dŠs que
	// possible, sinon il faut que l'acc‚l‚rateur co‹ncide
	if (iOpt<=0)
	  iStop = 1;

	if (iType==CUCT_LABEL || iType==CUCT_FRAME || iType==CUCT_CHECKBOX || iType==CUCT_OPTIONBUTTON || iType==CUCT_COMMANDBUTTON)
	  if (iOpt>0 && toupper(CUC_ControlGetPropNum(plc->pCTL, iType, CUCP_ACCELERATOR))==toupper(iOpt))
		iStop = 1;

	// On ne peut pas donner le focus … un Label ou un Frame
	if (iType==CUCT_LABEL || iType==CUCT_FRAME)
	  continue;

	// Et enfin on peut sortir !
	if (iStop) break;
  }

  if (plc==NULL) return -1;

  MoveFocus(pFRM, plc);
  return 0;
}


// Traitement d'‚v‚nement en retour g‚n‚r‚ par un contr“le
int CUC_FormDoEvents(struct CUC_Form *pFRM)
{
  int iNbEvents = 0;
  struct CtrlEvent *e;
  
  if (iCtrlType(pFRM, "CUC_FormDoEvents", szTypeForm)<0) return -1;

  while ((e=pFRM->peBackEvent)!=NULL)
  {
	if (iCtrlType(e, "CUC_FormDoEvents", szTypeEvent)<0) return -1;
	
//    aprintf("CUC_FormDoEvents", "Id: %d|Event: %d", e->plcCTL->iId, e->iEvent);
	pFRM->peBackEvent = e->suiv;    // Sorti de la liste
	ExecFormEvent(pFRM->tEvts, e->plcCTL->iId, e->iEvent, (void *)e->iArg);
	iNbEvents++;
	e->szType[0] = 0;
	free((char *)e);
  }
  
  return iNbEvents;
}


// Fonction principale de "fonctionnement" de la feuille
// Scheduler d'‚v‚nements
void CUC_FormExec(struct CUC_Form *pFRM)
{
  int   iKey;
  int   iRet;
  
  if (iCtrlType(pFRM, "CUC_FormExec", szTypeForm)<0) return;
  
  // pFRM->peBackEvent = NULL;
  pFRM->iExit = 0;
  pFRM->plcActif = NULL;
  
  // Affecte le focus au prochain contr“le concern‚
  if (pFRM->plcFirstActive==NULL)
	NextFocus(pFRM, 0);
  else
	MoveFocus(pFRM, pFRM->plcFirstActive);

  for(;;)
  {
	if (pFRM->iExit) break;

	// Tant qu'on a des ‚v‚nements on recommence
	// au test de sortie
	if (CUC_FormDoEvents(pFRM)>0)
	  continue;

	CUC_ControlDisplayCursor(pFRM->plcActif->pCTL, pFRM->plcActif->iType);
	iKey = wgetch2(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP));
	
#if !defined(UNIX) && defined(_DEBUG)
	if (iKey==KEY_CTRL_V)
	  _asm int 3;       // Appel du debugger "propre"...
#endif

	if (iKey==KEY_F(10))
	{ // beep();        // Faute de meilleure signalisation, mais … changer
	  iKey = wgetch2(CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP));
	  if (iKey>=32 && iKey<=255) iKey = majAZ((UC)iKey);
	  iKey = ALT(iKey);
	}

	// Gestion de la navigation du focus en priorit‚

	// Tabulation
	if ((pFRM->iFlags&CUCF_TABTRANSMISE)==0)
	  if (iKey==KEY_TAB || iKey==ALT(KEY_TAB))
	  { NextFocus(pFRM, -(iKey==ALT(KEY_TAB)));
		continue;
	  }

	// Touche Entr‚e: s'il existe un bouton avec l'attribut d‚faut
	// Ne s'applique pas si le contr“le actif est un bouton
	if (iKey==KEY_RETURN && pFRM->plcActif->iType!=CUCT_COMMANDBUTTON)
	{
	  struct LCtl *plc;

	  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
		if (plc->iType==CUCT_COMMANDBUTTON && CUC_CommandButtonGetPropNum(plc->pCTL, CUCP_DEFAULT))
		  break;

	  if (plc!=NULL)
	  { 
		// On ferme la combo si n‚cessaire
		if (pFRM->plcActif->iType==CUCT_COMBOBOX)
		  CUC_ComboBoxCloseList(pFRM->plcActif->pCTL);
		CUC_CommandButtonDoEvent(plc->pCTL, CUCE_KEY, iKey);
		continue;
	  }

	  // S'il n'existe aucun bouton ayant la propri‚t‚ DEFAULT,
	  // on continue en s‚quence et on fait traiter la touche Entr‚e
	  // par le contr“le actif.
	}

	// Touche Echap s'il existe un bouton avec l'attribut Cancel
	if (iKey==KEY_ESCAPE)
	{
	  struct LCtl *plc;

	  for (plc=pFRM->plcControles ; plc!=NULL ; plc=plc->plcSuiv)
		if (plc->iType==CUCT_COMMANDBUTTON && CUC_CommandButtonGetPropNum(plc->pCTL, CUCP_CANCEL))
		  break;

	  if (plc!=NULL)
	  {
		// On ferme la combo si n‚cessaire
		if (pFRM->plcActif->iType==CUCT_COMBOBOX)
		  CUC_ComboBoxCloseList(pFRM->plcActif->pCTL);
		CUC_CommandButtonDoEvent(plc->pCTL, CUCE_KEY, iKey);
		continue;
	  }

	  // S'il n'existe aucun bouton ayant la propri‚t‚ CANCEL,
	  // on continue en s‚quence et on fait traiter la touche Escape
	  // par le contr“le actif.
	}
	
	// Touche d'ouverture de menu
	if (pFRM->pmMenu!=NULL && CUC_MenuIsOpenKey(pFRM->pmMenu, iKey))
	{
	  int iRet = CUC_MenuExec(pFRM->pmMenu, iKey, CUC_WindowGetPropPtr(pFRM->pWIN, CUCP_WDISP));
	  if (iRet>0)
		ExecFormEvent(pFRM->tEvts, iRet, CUCE_COMMAND, 0);
	  continue;
	}
	
	// Acc‚l‚rateur de menu
	if (pFRM->pmMenu!=NULL && (iRet=CUC_MenuIsAccelKey(pFRM->pmMenu, iKey))>=0)
	{
	  ExecFormEvent(pFRM->tEvts, iRet, CUCE_COMMAND, 0);
	  continue;
	}

	// Acc‚l‚rateur
	if (iKey>=ALT_OFFSET)
	  if (NextFocus(pFRM, iKey-ALT_OFFSET)>=0)
	  { // Dans le cas d'un bouton de commande, bouton d'option ou
		// une case … cocher, on simule l'applui avec l'espace
		if (pFRM->plcActif->iType==CUCT_COMMANDBUTTON ||
			pFRM->plcActif->iType==CUCT_OPTIONBUTTON ||
			pFRM->plcActif->iType==CUCT_CHECKBOX)
		  CUC_ControlDoEvent(pFRM->plcActif->pCTL, pFRM->plcActif->iType, CUCE_KEY, ' ');
		continue;
	  }

	// Ex‚cution de la proc‚dure d'‚v‚nement Key pour la feuille
	ExecFormEvent(pFRM->tEvts, pFRM->iId, CUCE_KEY, &iKey);
	if (iKey==0) continue;
	
	// Ex‚cution de la proc‚dure d'‚v‚nement Key pour le contr“le actif
	if (pFRM->plcActif!=NULL)
	{ ExecFormEvent(pFRM->tEvts, pFRM->plcActif->iId, CUCE_KEY, &iKey);
	  if (iKey==0) continue;
	}
	
	// Ex‚cution de l'‚v‚nement Key par le contr“le actif
	if (pFRM->plcActif!=NULL)
	  CUC_ControlDoEvent(pFRM->plcActif->pCTL, pFRM->plcActif->iType, CUCE_KEY, iKey);
	
  } // Boucle principale de traitement des ‚v‚nements

  // Avant de terminer, on retire le focus du contr“le actif
  if (pFRM->plcActif!=NULL)
  { CUC_ControlDoEvent(pFRM->plcActif->pCTL, pFRM->plcActif->iType, CUCE_LOSTFOCUS, 0);
	ExecFormEvent(pFRM->tEvts, pFRM->plcActif->iId, CUCE_LOSTFOCUS, 0);
  }
}

// Fonction permettant de sortir de la boucle de traitement de
// la feuille depuis l'ext‚rieur (proc‚dure d'‚v‚nement par exemple
void CUC_FormExit(struct CUC_Form *pFRM)
{
  if (iCtrlType(pFRM, "CUC_FormExit", szTypeForm)<0) return;

  pFRM->iExit = 1;
}


//=====================================================================
// Appel des proc‚dures d'‚v‚nement pour la feuille aprŠs cr‚ation
// et avant destruction

// Appelle la proc‚dure d'‚v‚nement LOAD pour la feuille aprŠs
// la fin des cr‚ations de contr“les sur la feuille
static void FormLoad(struct CUC_Form *pFRM)
{
  ExecFormEvent(pFRM->tEvts, pFRM->iId, CUCE_LOAD, 0);
}

// Appelle la proc‚dure d'‚v‚nement UNLOAD de la feuille
static void FormUnload(struct CUC_Form *pFRM)
{
  if (iCtrlType(pFRM, "CUC_FormUnload", szTypeForm)<0) return;

  ExecFormEvent(pFRM->tEvts, pFRM->iId, CUCE_UNLOAD, 0);
}


//=====================================================================
// Contr“le du focus par l'application

int CUC_FormGetActiveControl(struct CUC_Form *pFRM)
{
  if (iCtrlType(pFRM, "CUC_FormGetActiveControl", szTypeForm)<0) return -1;

  if (pFRM->plcActif!=NULL)
	return pFRM->plcActif->iId;
  else
	return 0;
}

int CUC_FormSetActiveControl(struct CUC_Form *pFRM, int iId)
{
  struct LCtl *plc;

  if (iCtrlType(pFRM, "CUC_FormSetActiveControl", szTypeForm)<0) return -1;

  plc = plcFindControl("CUC_FormSetActiveControl", pFRM, iId);
  if (plc==NULL) return -1;

  // En cours de chargement, on se contente de m‚moriser l'info
  if (pFRM->iLoading)
  { pFRM->plcFirstActive = plc;
	return 0;
  }

  if (plc!=pFRM->plcActif)
	MoveFocus(pFRM, plc);
  else  // On lui redonne le focus sans g‚n‚rer d'‚v‚nement pour afficher le curseur
	CUC_ControlDoEvent(pFRM->plcActif->pCTL, pFRM->plcActif->iType, CUCE_GOTFOCUS, 0);

  return 0;
}
