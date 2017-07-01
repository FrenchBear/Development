/* cuclst.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le List
** P.VIOLENT 3/06/94
*/

struct CUC_List;	// d‚claration minimum
					// La d‚finition est dans cuclst.c

// Fonctions de cr‚ation et de destruction
struct CUC_List *CUC_ListCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_ListDestruct(struct CUC_List *);

// Gestion des propri‚t‚s
int CUC_ListSetPropNum(struct CUC_List *, int iProp, int iVal);
int CUC_ListSetPropStr(struct CUC_List *, int iProp, const char *szVal);
int CUC_ListSetPropStrInd(struct CUC_List *pLST, int iProp, int iIndice, const char *szVal);
int CUC_ListSetPropPtr(struct CUC_List *, int iProp, const void *pArg);

int CUC_ListGetPropNum(struct CUC_List *pLST, int iProp);
char *CUC_ListGetPropStr(struct CUC_List *, int iProp, char *szBuffer, int iBufSize);
char *CUC_ListGetPropStrInd(struct CUC_List *, int iProp, int iIndice, char *szBuffer, int iBufSize);
void *CUC_ListGetPropPtr(struct CUC_List *pLST, int iProp);

// Gestion des ‚v‚nements
int CUC_ListDoEvent(struct CUC_List *, int, ...);

// Liste des m‚thodes support‚es par l'objet
int CUC_ListMove(struct CUC_List *pLST, int iTop, int iLeft);
int CUC_ListResize(struct CUC_List *pLST, int iHeight, int iWidth);
int CUC_ListRefresh(struct CUC_List *);
int CUC_ListAddItem(struct CUC_List *pLST, const char *szElement, int iPos);
int CUC_ListRemoveItem(struct CUC_List *pLST, int iPos);
int CUC_ListClear(struct CUC_List *pLST);
int CUC_ListDisplayCursor(struct CUC_List *pLST);
