/* cuchsb.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le HScrollBar
** P.VIOLENT 31/05/94
*/

struct CUC_HScrollBar;	// d‚claration minimum
						// La d‚finition est dans cuchsb.c

// Fonctions de cr‚ation et de destruction
struct CUC_HScrollBar *CUC_HScrollBarCreate(WINDOW *wDisp, int (*iBack)(void *, int , int ));
void CUC_HScrollBarDestruct(struct CUC_HScrollBar *pHSB);

// Gestion des propri‚t‚s
int CUC_HScrollBarSetPropNum(struct CUC_HScrollBar *pHSB, int iProp, int iVal);
int CUC_HScrollBarSetPropStr(struct CUC_HScrollBar *pHSB, int iProp, const char *szVal);
int CUC_HScrollBarSetPropPtr(struct CUC_HScrollBar *pHSB, int iProp, const void *pArg);
int CUC_HScrollBarGetPropNum(struct CUC_HScrollBar *pHSB, int iProp);
char *CUC_HScrollBarGetPropStr(struct CUC_HScrollBar *pHSB, int iProp, char *szBuffer, int iBufSize);
void *CUC_HScrollBarGetPropPtr(struct CUC_HScrollBar *pHSB, int iProp);

// Gestion des ‚v‚nements
int CUC_HScrollBarDoEvent(struct CUC_HScrollBar *pHSB, int iEvent, int iArg);

// Liste des m‚thodes support‚es par l'objet
int CUC_HScrollBarMove(struct CUC_HScrollBar *pHSB, int iTop, int iLeft);
int CUC_HScrollBarResize(struct CUC_HScrollBar *pHSB, int iHeight, int iWidth);
int CUC_HScrollBarRefresh(struct CUC_HScrollBar *pHSB);
int CUC_HScrollBarDisplayCursor(struct CUC_HScrollBar *pHSB);
