/* cucwin.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le Window
** P.VIOLENT 2/07/94
*/

struct CUC_Window;	// d‚claration minimum

// Fonctions de cr‚ation et de destruction
struct CUC_Window *CUC_WindowCreate(WINDOW *wDisp, int (*iBack)(void *, int , int ));
void CUC_WindowDestruct(struct CUC_Window *pWIN);

// Gestion des propri‚t‚s
int CUC_WindowSetPropNum(struct CUC_Window *pWIN, int iProp, int iVal);
int CUC_WindowSetPropStr(struct CUC_Window *pWIN, int iProp, const char *szVal);
int CUC_WindowSetPropPtr(struct CUC_Window *pWIN, int iProp, const void *pArg);
int CUC_WindowGetPropNum(struct CUC_Window *pWIN, int iProp);
char *CUC_WindowGetPropStr(struct CUC_Window *pWIN, int iProp, char *szBuffer, int iBufSize);
void *CUC_WindowGetPropPtr(struct CUC_Window *pWIN, int iProp);

// Gestion des ‚v‚nements
int CUC_WindowDoEvent(struct CUC_Window *pWIN, int iEvent, int iArg);

// Liste des m‚thodes support‚es par l'objet
int CUC_WindowMove(struct CUC_Window *pWIN, int iTop, int iLeft);
int CUC_WindowResize(struct CUC_Window *pWIN, int iHeight, int iWidth);
int CUC_WindowRefresh(struct CUC_Window *pWIN);
