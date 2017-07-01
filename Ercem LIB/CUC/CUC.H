// cuc.h
// Interface de la bibliothŠque des Contr“les Unix en mode CaractŠre
// P.VIOLENT 31/05/94
// 14/11/94 PV	Form_AddEvent
// 18/11/94 PV	Form_SetCaption et Form_GetCaption
//  2/12/94 PV	Ev‚nement CUCE_DUMP, propri‚t‚s CUCP_LINE, CUCP_COLUMN,
//				CUCP_STARTLINE, CUCP_STARTCOLUMN
//  4/12/94 PV	Implantation des commandes
//  5/12/94 PV	CUCP_LENGTH
//  6/12/94 PV	CUCP_LINES
// 16/12/94 PV	CUC_FormSetPropStrInd
// 26/12/94 PV	Outline; Get/SetPropNumInd; AddItemIndent
// 20/01/95 PV	CUCP_TABCHAR; Flags; CUCE_SELCGHANGE

#ifndef _INC_CUC
#define _INC_CUC

#include <curses.h>
#include <biberc.h>

#ifdef __cplusplus
extern "C" {
#endif 

// Partie "visible" de la bibliothŠque CUC

//======================================================================
// cucfrm.h
// Interface des feuille, seule partie visible de la bibliothŠque
// P.VIOLENT 2/07/94

struct CUC_Form;			// D‚claration minimum, mais suffisante pour l'ext‚rieur de la bibliothŠque

// Gestion des ‚v‚nements
struct FormEvent
{
  int   iId;				// Contr“le concern‚ par l'‚v‚nement
  int   iEvent;				// Ev‚nement en CUCE_xxx
  void  (*pProc)();			// Proc‚dure de traitement
};

// Tableaux de contr“les
struct FormControl
{
  int	iId;				// Identificateur conventionnel, unique pour l'ensemble des feuilles cr‚‚es
  int	iType;				// Type du contr“le en CUCT_xxx
  int	iTop, iLeft;		// Coordonn‚es initiales
  int	iHeight, iWidth;	// Taille initiale
  int	iParent;			// Pour les boutons de commande et d'option
  void	*pArg;				// Valeur initiale de Caption ou Text
};

// Menus
struct FormMenu
{
  int	iId;				// Idem que pour les contrôles
  char	*szCaption;			// Libell‚ du menu
  int	iAccel;				// Acc‚l‚rateur clavier, ou 0 si non concern‚
  int	iFlags;				// Etat initial, type s‚parateur...
  int	iParent;			// Id hi‚rarchique, 0 pour les menus principaux
};

// Fonctions de cr‚ation et de destruction
int CUC_FormCreate(struct CUC_Form **ppFRM, struct FormControl *tFC, struct FormEvent *tFE, struct FormMenu *tME);
void CUC_FormDestruct(struct CUC_Form *pFRM);

// Fonctions de manipulation
int CUC_FormShow(struct CUC_Form *pFRM);
int CUC_FormHide(struct CUC_Form *pFRM);
int CUC_FormDeactivate(struct CUC_Form *pFRM);
int CUC_FormActivate(struct CUC_Form *pFRM);
int CUC_FormMove(struct CUC_Form *pFRM, int iTop, int iLeft);
int CUC_FormResize(struct CUC_Form *pFRM, int iHeight, int iWidth);
int CUC_FormRefresh(struct CUC_Form *pFRM);
int CUC_FormSetCaption(struct CUC_Form *pFRM, char *szCaption);
char *CUC_FormGetCaption(struct CUC_Form *pFRM, char *szBuffer, int iTailleBuff);
int CUC_FormSetFlags(struct CUC_Form *pFRM, int iFlags);
int CUC_FormResetFlags(struct CUC_Form *pFRM, int iFlags);
int CUC_FormGetFlags(struct CUC_Form *pFRM);

// Fonctions de trace
void CUC_FormDump(struct CUC_Form *pFRM);

// Cr‚ation de contr“les
void *CUC_FormAddCtl(struct CUC_Form *pFRM, int iId, int iType, int iTop, int iLeft, int iWidth, int iHeight, int iParent, char *szCaption);

// Cr‚ation des ‚v‚nements
int CUC_FormAddEvt(struct CUC_Form *pFRM, int iId, int iEvent, void (*pProc)());

// Echanges de donn‚es
void DX_Text(int iUS, struct CUC_Form *f, int iId, char *szBuffer, int iLgBuffer);
void DX_Value(int iUS, struct CUC_Form *f, int iId, int *piVal);
void DX_Double(int iUS, struct CUC_Form *f, int iId, double *pdVal);

void CUC_FormExec(struct CUC_Form *pFRM);
int	 CUC_FormDoEvents(struct CUC_Form *pFRM);
void CUC_FormExit(struct CUC_Form *pFRM);
int  CUC_FormGetActiveControl(struct CUC_Form *pFRM);
int  CUC_FormSetActiveControl(struct CUC_Form *pFRM, int iId);

// AccŠs aux contr“les via Id
int CUC_FormGetPropNum(struct CUC_Form *pFRM, int iId, int iProp);
int CUC_FormSetPropNum(struct CUC_Form *pFRM, int iId, int iProp, int iArg);
int CUC_FormGetPropNumInd(struct CUC_Form *pFRM, int iId, int iProp, int iInd);
int CUC_FormSetPropNumInd(struct CUC_Form *pFRM, int iId, int iProp, int iInd, int iArg);

char *CUC_FormGetPropStr(struct CUC_Form *pFRM, int iId, int iProp, char *szBuffer, int iLen);
int CUC_FormSetPropStr(struct CUC_Form *pFRM, int iId, int iProp, char *szVal);
char *CUC_FormGetPropStrInd(struct CUC_Form *pFRM, int iId, int iProp, int iInd, char *szBuffer, int iLen);
int CUC_FormSetPropStrInd(struct CUC_Form *pFRM, int iId, int iProp, int iInd, char *szBuffer);

int CUC_FormAddItem(struct CUC_Form *pFRM, int iId, char *szVal, int iPos);
int CUC_FormAddItemIndent(struct CUC_Form *pFRM, int iId, char *szVal, int iPos, int iIndent);
int CUC_FormRemoveItem(struct CUC_Form *pFRM, int iId, int iPos);
int CUC_FormClear(struct CUC_Form *pFRM, int iId);
int CUC_FormCloseList(struct CUC_Form *pFRM, int iId);
int CUC_FormSetMinMax(struct CUC_Form *pFRM, int iId, int iMin, int iMax, int iCSize);
int CUC_FormDoEvent(struct CUC_Form *pFRM, int iId, int iEvent, int iParam);

// Offset ajout‚ aux touches pr‚fix‚es par F10
#define ALT_OFFSET	0x200
#define ALT(iKey)	(iKey+ALT_OFFSET)

//======================================================================

#ifdef __cplusplus
}
#endif 

// Num‚rotation des types de contr“les
#define CUCT_HSCROLLBAR		1
#define CUCT_VSCROLLBAR		2
#define CUCT_LIST			3
#define CUCT_CHECKBOX		4
#define CUCT_OPTIONBUTTON	5
#define CUCT_LABEL			6
#define CUCT_TEXTEDIT		7
#define CUCT_FRAME			8
#define CUCT_COMMANDBUTTON	9
#define CUCT_COMBOBOX		10
#define CUCT_FILELISTBOX	11
#define CUCT_DIRLISTBOX		12
#define CUCT_WINDOW			13
#define CUCT_FORM			14
#define CUCT_MENU			15	// Pas d'int‚rˆt actuellement, le menu n'‚tant pas un contr“le...
#define CUCT_OUTLINE		16



// D‚finitions communes … l'ensemble des contr“les

// Liste des ‚v‚nements de l'environnement
#define CUCE_KEY			1
#define CUCE_GOTFOCUS		2
#define CUCE_LOSTFOCUS		3
#define CUCE_DUMP			4	// Demande de dump de l'‚tat du contr“le
#define CUCE_COMMAND		5	// Choix d'une commande dans un menu

// Liste des ‚v‚nements g‚n‚r‚s par les contr“les et/ou par cucfrm
#define CUCE_CHANGE			11	// La valeur a chang‚, ou le contr“le a ‚t‚ s‚lectionn‚ ou activ‚, ou la commande du menu choisie
#define CUCE_CLIC			11	// Synonyme
#define CUCE_INSMODECHANGE	12	// Changement du mode insertion/remplacement pour un TextEdit ou une ComboBox
#define CUCE_SIZECHANGE		13	// Pour les contr“les ayant la propri‚t‚ autosize, aprŠs que la taille ait chang‚
#define CUCE_LOAD			14	// Chargement initial de la feuille. La feuille est invisible
#define CUCE_UNLOAD			15	// D‚chargement final de la feuille
#define CUCE_DROPDOWN		16	// Juste avant qu'une combo ouvre la liste ou qu'un menu s'affiche
#define CUCE_SHOW			17	// Juste avant de devenir visible
#define CUCE_HIDE			18	// AprŠs ˆtre masqu‚
#define CUCE_EXPAND			19	// Ouverture d'un outline
#define CUCE_COLLAPSE		20	// Fermeture d'un outline ou d'une combo
#define CUCE_SELCHANGE		21	// La s‚lection a ‚t‚ modifi‚e


// Liste des propri‚t‚s.
// Tous les objets n'implantent pas l'ensemble des propri‚t‚s

#define CUCP_LEFT			0
#define CUCP_TOP			1
#define CUCP_WIDTH			2
#define CUCP_HEIGHT			3
#define CUCP_MIN			4
#define CUCP_MAX			5
#define CUCP_SMALLCHANGE	6
#define CUCP_LARGECHANGE	7
#define CUCP_VALUE 			8
#define CUCP_CSIZE 			9
#define CUCP_VISIBLE 		10
#define CUCP_ENABLED 		11
#define CUCP_PARENT 		12
#define CUCP_TABSTOP 		13
#define CUCP_TYPE 			14
#define CUCP_TAG 			15
#define CUCP_FOCUS 			16
#define CUCP_ALIGNMENT 		17
#define CUCP_BORDERSTYLE 	18
#define CUCP_AUTOSIZE		19
#define CUCP_CAPTION		20
#define CUCP_TRISTATE 		21
#define CUCP_DEFAULT 		22
#define CUCP_CANCEL 		23
#define CUCP_COLUMNS 		24
#define CUCP_AUTOREFRESH	25
#define CUCP_SORTED			26
#define CUCP_LISTCOUNT		27
#define CUCP_LISTINDEX		28
#define CUCP_LIST			29
#define CUCP_MULTILINE		30
#define CUCP_SCROLLBARS		31
#define CUCP_TEXT			32
#define CUCP_SELLENGTH		33
#define CUCP_SELSTART		34
#define CUCP_SELTEXT		35
#define CUCP_PATTERN		36
#define CUCP_PATH			37
#define CUCP_DRIVE			38
#define CUCP_CHECKED		39
#define CUCP_SEPARATOR		40
#define CUCP_INSMODE		41
#define CUCP_MAXLENGTH		42
#define CUCP_TABSIZE		43
#define CUCP_IDBACK			44
#define CUCP_ACCELERATOR	45
#define CUCP_STYLE		 	46
#define CUCP_WDISP		 	47
#define CUCP_FLAGS			48
#define CUCP_EOLCHAR		49
#define CUCP_EOFCHAR		50
#define CUCP_LISTWIDTH		51
#define CUCP_FILENAME		52
#define CUCP_FULLPATH		53
#define CUCP_STDATTRIB		54
#define CUCP_LINE			55
#define CUCP_COLUMN			56
#define CUCP_STARTLINE		57
#define CUCP_STARTCOLUMN	58
#define CUCP_LENGTH			59
#define CUCP_LINES			60
#define CUCP_PATHSEPARATOR	61
#define CUCP_HASSUBITEMS	62
#define CUCP_ISITEMVISIBLE	63
#define CUCP_INDENT			64
#define CUCP_EXPAND			65
#define CUCP_AFFCOUNT		66
#define CUCP_AFFINDEX		67
#define CUCP_TABCHAR		68


// Flags des menus
#define CUCM_SEP			1	// S‚parateur de menus
#define CUCM_CHECKED		2	// Coch‚
#define CUCM_DISABLED		4	// D‚sactiv‚
#define CUCM_INVISIBLE		8	// Non affich‚


// Flags des feuilles
#define CUCF_TABTRANSMISE	1


#define INFINI 32000

#endif						// ifndef _INC_CUC

