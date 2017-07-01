/* cuclbl.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le Label
** 03/06/94 FG
*/

struct CUC_Label;	// d‚claration minimum. La d‚finition est dans cuchsb.c

// Fonctions de cr‚ation et de destruction
struct CUC_Label *CUC_LabelCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_LabelDestruct(struct CUC_Label *);

// Gestion des propri‚t‚s
int CUC_LabelSetPropNum(struct CUC_Label *, int , int);
int CUC_LabelSetPropPtr(struct CUC_Label *pLBL, int , const void *);
int CUC_LabelSetPropStr(struct CUC_Label *, int , const char *);
int CUC_LabelGetPropNum(struct CUC_Label *, int);
void *CUC_LabelGetPropPtr(struct CUC_Label *pLBL, int);
char *CUC_LabelGetPropStr(struct CUC_Label *, int, char *, int);

// Gestion des ‚v‚nements
int CUC_LabelDoEvent(struct CUC_Label *, int, ...);
int CUC_LabelRaiseEvent(struct CUC_Label *, int, ...);

// Liste des m‚thodes support‚es par l'objet
int CUC_LabelMove(struct CUC_Label *, int iTop, int iLeft);
int CUC_LabelResize(struct CUC_Label *, int iHeight, int iWidth);
int CUC_LabelRefresh(struct CUC_Label *);
