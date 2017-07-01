/* cuctxt.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le TextEdit
** 03/06/94 FG
*/

struct CUC_TextEdit;	// d‚claration minimum. La d‚finition est dans cuchsb.c

// Fonctions de cr‚ation et de destruction
struct CUC_TextEdit *CUC_TextEditCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_TextEditDestruct(struct CUC_TextEdit *);

// Gestion des propri‚t‚s
int CUC_TextEditSetPropNum(struct CUC_TextEdit *, int , int);
int CUC_TextEditSetPropPtr(struct CUC_TextEdit *pTXT, int , const void *);
int CUC_TextEditSetPropStr(struct CUC_TextEdit *, int , const char *);
int CUC_TextEditGetPropNum(struct CUC_TextEdit *, int);
void *CUC_TextEditGetPropPtr(struct CUC_TextEdit *pTXT, int);
char *CUC_TextEditGetPropStr(struct CUC_TextEdit *, int, char *, size_t);

// Gestion des ‚v‚nements
int CUC_TextEditDoEvent(struct CUC_TextEdit *, int, ...);
int CUC_TextEditRaiseEvent(struct CUC_TextEdit *, int, ...);

// Liste des m‚thodes support‚es par l'objet
int CUC_TextEditMove(struct CUC_TextEdit *, int iTop, int iLeft);
int CUC_TextEditResize(struct CUC_TextEdit *, int iHeight, int iWidth);
int CUC_TextEditRefresh(struct CUC_TextEdit *);
int CUC_TextEditDisplayCursor(struct CUC_TextEdit *);
void CUC_TextEditFreeClipBoard(void);
