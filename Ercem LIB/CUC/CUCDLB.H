/* cucdlb.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le DirDirListBoxBox
** P.VIOLENT 3/06/94
*/

struct CUC_DirListBox;	// d‚claration minimum
			// La d‚finition est dans cucflb.c

#define LGPATH		  512
#define LGPATTERN	  16
#define LGDIRNAME	  24


// Fonctions de cr‚ation et de destruction
struct CUC_DirListBox *CUC_DirListBoxCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_DirListBoxDestruct(struct CUC_DirListBox *);

// Gestion des propri‚t‚s
int CUC_DirListBoxSetPropNum(struct CUC_DirListBox *, int iProp, int iVal);
int CUC_DirListBoxSetPropStr(struct CUC_DirListBox *, int iProp, const char *szVal);
// int CUC_DirListBoxSetPropStrInd(struct CUC_DirListBox *pFLB, int iProp, int iIndice, const char *szVal);
int CUC_DirListBoxSetPropPtr(struct CUC_DirListBox *, int iProp, const void *pArg);

int CUC_DirListBoxGetPropNum(struct CUC_DirListBox *pFLB, int iProp);
char *CUC_DirListBoxGetPropStr(struct CUC_DirListBox *, int iProp, char *szBuffer, int iBufSize);
char *CUC_DirListBoxGetPropStrInd(struct CUC_DirListBox *, int iProp, int iIndice, char *szBuffer, int iBufSize);
void *CUC_DirListBoxGetPropPtr(struct CUC_DirListBox *pFLB, int iProp);

// Gestion des ‚v‚nements
int CUC_DirListBoxDoEvent(struct CUC_DirListBox *, int, ...);

// DirListBoxe des m‚thodes support‚es par l'objet
int CUC_DirListBoxMove(struct CUC_DirListBox *pFLB, int iTop, int iLeft);
int CUC_DirListBoxResize(struct CUC_DirListBox *pFLB, int iHeight, int iWidth);
int CUC_DirListBoxRefresh(struct CUC_DirListBox *);
// char *CUC_DirListBoxName(struct CUC_DirListBox *pDLB,char *dirName,int lDirName);
int CUC_DirListBoxDisplayCursor(struct CUC_DirListBox *pDLB);
