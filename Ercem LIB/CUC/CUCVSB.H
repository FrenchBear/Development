/* cucvsb.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le VScrollBar
** Christophe R. 01/06/94 
*/

struct CUC_VScrollBar;	// d‚claration minimum. La d‚finition est dans cucvsb.c

// Fonctions de cr‚ation et de destruction
struct CUC_VScrollBar *CUC_VScrollBarCreate(WINDOW *wDisp, int (*iBack)(void *, int , int ));
void CUC_VScrollBarDestruct(struct CUC_VScrollBar *pVSB);

// Gestion des propri‚t‚s
int CUC_VScrollBarSetPropNum(struct CUC_VScrollBar *pVSB, int iProp, int iVal);
int CUC_VScrollBarSetPropStr(struct CUC_VScrollBar *pVSB, int iProp, const char *szVal);
int CUC_VScrollBarSetPropPtr(struct CUC_VScrollBar *pVSB, int iProp, const void *pArg);
int CUC_VScrollBarGetPropNum(struct CUC_VScrollBar *pVSB, int iProp);
char *CUC_VScrollBarGetPropStr(struct CUC_VScrollBar *pVSB, int iProp, char *szBuffer, int iBufSize);
void *CUC_VScrollBarGetPropPtr(struct CUC_VScrollBar *pVSB, int iProp);

// Gestion des ‚v‚nements
int CUC_VScrollBarDoEvent(struct CUC_VScrollBar *pVSB, int iEvent, int iArg);

// Liste des m‚thodes support‚es par l'objet
int CUC_VScrollBarMove(struct CUC_VScrollBar *pVSB, int iTop, int iLeft);
int CUC_VScrollBarResize(struct CUC_VScrollBar *pVSB, int iHeight, int iWidth);
int CUC_VScrollBarRefresh(struct CUC_VScrollBar *pVSB);
int CUC_VScrollBarDisplayCursor(struct CUC_VScrollBar *pVSB);
