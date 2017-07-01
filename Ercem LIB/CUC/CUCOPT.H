/* cucopt.h
** Interface de la bibliothŠque des Controles Unix en mode CaractŠre
** Contr“le OptionButton
**  3/06/94
*/

struct CUC_OptionButton;	// d‚claration minimum
			// La d‚finition est dans cuchsb.c

// Fonctions de cr‚ation et de destruction
struct CUC_OptionButton *CUC_OptionButtonCreate(WINDOW *, int (*)(void *, int , int ));
void CUC_OptionButtonDestruct(struct CUC_OptionButton *);

// Gestion des propri‚t‚s
int CUC_OptionButtonSetPropNum(struct CUC_OptionButton *, int , int);
int CUC_OptionButtonSetPropStr(struct CUC_OptionButton *, int , const char *);
int CUC_OptionButtonSetPropPtr(struct CUC_OptionButton *pOPT, int iProp, const void *pArg);

void *CUC_OptionButtonGetPropPtr(struct CUC_OptionButton *pOPT, int iProp);
int	 CUC_OptionButtonGetPropNum(struct CUC_OptionButton *, int);
char *CUC_OptionButtonGetPropStr(struct CUC_OptionButton *, int, char *, int);

// Gestion des ‚v‚nements
int CUC_OptionButtonDoEvent(struct CUC_OptionButton *, int, ...);
int CUC_OptionButtonRaiseEvent(void *, int, ...);

// Liste des m‚thodes support‚es par l'objet
int CUC_OptionButtonMove(struct CUC_OptionButton *, int iTop, int iLeft);
int CUC_OptionButtonResize(struct CUC_OptionButton *, int iHeight, int iWidth);
int CUC_OptionButtonRefresh(struct CUC_OptionButton *);
int CUC_OptionButtonDisplayCursor(struct CUC_OptionButton *);
