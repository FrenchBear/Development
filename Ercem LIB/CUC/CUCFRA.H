/* cucfra.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le Frame
** 03/06/94 FG
*/

struct CUC_Frame;	// d‚claration minimum. La d‚finition est dans cuchsb.c

// Fonctions de cr‚ation et de destruction
struct CUC_Frame *CUC_FrameCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_FrameDestruct(struct CUC_Frame *);

// Gestion des propri‚t‚s
int CUC_FrameSetPropNum(struct CUC_Frame *, int , int);
int CUC_FrameSetPropPtr(struct CUC_Frame *pFRA, int , const void *);
int CUC_FrameSetPropStr(struct CUC_Frame *, int , const char *);
int CUC_FrameGetPropNum(struct CUC_Frame *, int);
void *CUC_FrameGetPropPtr(struct CUC_Frame *pFRA, int);
char *CUC_FrameGetPropStr(struct CUC_Frame *, int, char *, int);

// Gestion des ‚v‚nements
int CUC_FrameDoEvent(struct CUC_Frame *, int, ...);
int CUC_FrameRaiseEvent(struct CUC_Frame *, int, ...);

// Liste des m‚thodes support‚es par l'objet
int CUC_FrameMove(struct CUC_Frame *, int iTop, int iLeft);
int CUC_FrameResize(struct CUC_Frame *, int iHeight, int iWidth);
int CUC_FrameRefresh(struct CUC_Frame *);
