/* cucout.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le Outline
** P.VIOLENT 3/06/94
*/

struct CUC_Outline;	// d‚claration minimum
					// La d‚finition est dans cucout.c

// Fonctions de cr‚ation et de destruction
struct CUC_Outline *CUC_OutlineCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_OutlineDestruct(struct CUC_Outline *);

// Gestion des propri‚t‚s
int CUC_OutlineSetPropNum(struct CUC_Outline *, int iProp, int iVal);
int CUC_OutlineSetPropNumInd(struct CUC_Outline *, int iProp, int iInd, int iVal);
int CUC_OutlineSetPropStr(struct CUC_Outline *, int iProp, const char *szVal);
int CUC_OutlineSetPropStrInd(struct CUC_Outline *pLST, int iProp, int iIndice, const char *szVal);
int CUC_OutlineSetPropPtr(struct CUC_Outline *, int iProp, const void *pArg);

int CUC_OutlineGetPropNum(struct CUC_Outline *pLST, int iProp);
int CUC_OutlineGetPropNumInd(struct CUC_Outline *pLST, int iProp, int iInd);
char *CUC_OutlineGetPropStr(struct CUC_Outline *, int iProp, char *szBuffer, int iBufSize);
char *CUC_OutlineGetPropStrInd(struct CUC_Outline *, int iProp, int iIndice, char *szBuffer, int iBufSize);
void *CUC_OutlineGetPropPtr(struct CUC_Outline *pLST, int iProp);

// Gestion des ‚v‚nements
int CUC_OutlineDoEvent(struct CUC_Outline *, int, ...);

// Outlinee des m‚thodes support‚es par l'objet
int CUC_OutlineMove(struct CUC_Outline *pLST, int iTop, int iLeft);
int CUC_OutlineResize(struct CUC_Outline *pLST, int iHeight, int iWidth);
int CUC_OutlineRefresh(struct CUC_Outline *);
int CUC_OutlineAddItem(struct CUC_Outline *pLST, const char *szElement, int iPos);
int CUC_OutlineAddItemIndent(struct CUC_Outline *pLST, const char *szElement, int iPos, int iIndent);
int CUC_OutlineRemoveItem(struct CUC_Outline *pLST, int iPos);
int CUC_OutlineClear(struct CUC_Outline *pLST);
int CUC_OutlineDisplayCursor(struct CUC_Outline *pLST);

