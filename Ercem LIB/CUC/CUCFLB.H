/* cucflb.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le FileFileListBoxBox
** P.VIOLENT 3/06/94
*/

struct CUC_FileListBox;	// d‚claration minimum
			// La d‚finition est dans cucflb.c

#define LGPATH		  512
#define LGPATTERN	  16


// Fonctions de cr‚ation et de destruction
struct CUC_FileListBox *CUC_FileListBoxCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_FileListBoxDestruct(struct CUC_FileListBox *);

// Gestion des propri‚t‚s
int CUC_FileListBoxSetPropNum(struct CUC_FileListBox *, int iProp, int iVal);
int CUC_FileListBoxSetPropStr(struct CUC_FileListBox *, int iProp, const char *szVal);
int CUC_FileListBoxSetPropStrInd(struct CUC_FileListBox *pFLB, int iProp, int iIndice, const char *szVal);
int CUC_FileListBoxSetPropPtr(struct CUC_FileListBox *, int iProp, const void *pArg);

int CUC_FileListBoxGetPropNum(struct CUC_FileListBox *pFLB, int iProp);
char *CUC_FileListBoxGetPropStr(struct CUC_FileListBox *, int iProp, char *szBuffer, int iBufSize);
char *CUC_FileListBoxGetPropStrInd(struct CUC_FileListBox *, int iProp, int iIndice, char *szBuffer, int iBufSize);
void *CUC_FileListBoxGetPropPtr(struct CUC_FileListBox *pFLB, int iProp);
// Gestion des ‚v‚nements
int CUC_FileListBoxDoEvent(struct CUC_FileListBox *, int, ...);

// FileListBoxe des m‚thodes support‚es par l'objet
int CUC_FileListBoxMove(struct CUC_FileListBox *pFLB, int iTop, int iLeft);
int CUC_FileListBoxResize(struct CUC_FileListBox *pFLB, int iHeight, int iWidth);
int CUC_FileListBoxRefresh(struct CUC_FileListBox *);
int CUC_FileListBoxDisplayCursor(struct CUC_FileListBox *pFLB);
