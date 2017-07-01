/* cuccob.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le ComboBox
** P.VIOLENT 3/06/94
*/

struct CUC_ComboBox;	// d‚claration minimum
			// La d‚finition est dans cuchsb.c

// Fonctions de cr‚ation et de destruction
struct CUC_ComboBox *CUC_ComboBoxCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_ComboBoxDestruct(struct CUC_ComboBox *);

// Gestion des propri‚t‚s
int CUC_ComboBoxSetPropNum(struct CUC_ComboBox *, int iProp, int iVal);
int CUC_ComboBoxSetPropStr(struct CUC_ComboBox *, int iProp, const char *szVal);
int CUC_ComboBoxSetPropStrInd(struct CUC_ComboBox *pCOB, int iProp, int iIndice, const char *szVal);
int CUC_ComboBoxSetPropPtr(struct CUC_ComboBox *, int iProp, const void *pArg);

int CUC_ComboBoxGetPropNum(struct CUC_ComboBox *pCOB, int iProp);
char *CUC_ComboBoxGetPropStr(struct CUC_ComboBox *, int iProp, char *szBuffer, int iBufSize);
char *CUC_ComboBoxGetPropStrInd(struct CUC_ComboBox *, int iProp, int iIndice, char *szBuffer, int iBufSize);
void *CUC_ComboBoxGetPropPtr(struct CUC_ComboBox *pCOB, int iProp);

// Gestion des ‚v‚nements
int CUC_ComboBoxDoEvent(struct CUC_ComboBox *, int, ...);

// Liste des m‚thodes support‚es par l'objet
int CUC_ComboBoxMove(struct CUC_ComboBox *pCOB, int iTop, int iLeft);
int CUC_ComboBoxResize(struct CUC_ComboBox *pCOB, int iHeight, int iWidth);
int CUC_ComboBoxRefresh(struct CUC_ComboBox *);
int CUC_ComboBoxAddItem(struct CUC_ComboBox *pLBL, const char *szElement, int iPos);
int CUC_ComboBoxRemoveItem(struct CUC_ComboBox *pLBL, int iPos);
int CUC_ComboBoxClear(struct CUC_ComboBox *pLBL);
int CUC_ComboBoxCloseList(struct CUC_ComboBox *pCOB);
int CUC_ComboBoxDisplayCursor(struct CUC_ComboBox *pCOB);
