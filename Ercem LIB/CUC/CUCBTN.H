/* cucbtn.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le CommandButton
** 13/06/94 CR

*/

struct CUC_CommandButton;

// Fonctions de cr‚ation et de destruction
struct CUC_CommandButton *CUC_CommandButtonCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_CommandButtonDestruct(struct CUC_CommandButton *pCOB);

// Gestion des propri‚t‚s
int CUC_CommandButtonSetPropNum(struct CUC_CommandButton *pCOB, int , int);
int CUC_CommandButtonSetPropPtr(struct CUC_CommandButton *pCOB, int , const void *);
int CUC_CommandButtonSetPropStr(struct CUC_CommandButton *pCOB, int , const char *);
int CUC_CommandButtonGetPropNum(struct CUC_CommandButton *pCOB, int);
void *CUC_CommandButtonGetPropPtr(struct CUC_CommandButton *pCOB, int);
char *CUC_CommandButtonGetPropStr(struct CUC_CommandButton *pCOB, int, char *, int);

// Gestion des ‚v‚nements
int CUC_CommandButtonDoEvent(struct CUC_CommandButton *pCOB, int, ...);
int CUC_CommandButtonRaiseEvent(struct CUC_CommandButton *pCOB, int, ...);

// Liste des m‚thodes support‚es par l'objet
int CUC_CommandButtonMove(struct CUC_CommandButton *pCOB, int iTop, int iLeft);
int CUC_CommandButtonResize(struct CUC_CommandButton *pCOB, int iHeight, int iWidth);
int CUC_CommandButtonRefresh(struct CUC_CommandButton *pCOB);
int CUC_CommandButtonDisplayCursor(struct CUC_CommandButton *pCOB);
