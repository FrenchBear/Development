/* cucchb.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le CheckBox
**  3/06/94
*/

struct CUC_CheckBox;	// d‚claration minimum

// Fonctions de cr‚ation et de destruction
struct CUC_CheckBox *CUC_CheckBoxCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_CheckBoxDestruct(struct CUC_CheckBox *);

// Gestion des propri‚t‚s
int CUC_CheckBoxSetPropNum(struct CUC_CheckBox *, int , int);
int CUC_CheckBoxSetPropPtr(struct CUC_CheckBox *, int , const void *);
int CUC_CheckBoxSetPropStr(struct CUC_CheckBox *, int , const char *);
int CUC_CheckBoxGetPropNum(struct CUC_CheckBox *, int);
void *CUC_CheckBoxGetPropPtr(struct CUC_CheckBox *, int);
char *CUC_CheckBoxGetPropStr(struct CUC_CheckBox *, int, char *, int);

// Gestion des ‚v‚nements
int CUC_CheckBoxDoEvent(struct CUC_CheckBox *, int, ...);
int CUC_CheckBoxRaiseEvent(void *, int, ...);

// Liste des m‚thodes support‚es par l'objet
int CUC_CheckBoxMove(struct CUC_CheckBox *, int iTop, int iLeft);
int CUC_CheckBoxResize(struct CUC_CheckBox *, int iHeight, int iWidth);
int CUC_CheckBoxRefresh(struct CUC_CheckBox *);
int CUC_CheckBoxDisplayCursor(struct CUC_CheckBox *);
