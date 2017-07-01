// formhelp.h
// Interface de l'aide Ö l'utilisation des feuiles
// 17/11/94 PV

struct FormHelp
{
  int	iChamp;
  int	iFlags;
  int	iChampSuivant;		// Champ atteint avec fläche haute et entree
  int	iChampPrecedent;	// Champ atteint avec fläche haute
  char	*szAide;			// Texte d'aide
};

#define FH_SAISIE 1
#define FH_AUTOSELECT 2

int fh_iRegisterHelp(struct CUC_Form *f, struct FormHelp *pFH, void (*FF_GotFocus)());
int fh_iInitCtrl(struct CUC_Form *f, struct FormHelp *pFH);

int fh_iChampSuivant(struct FormHelp *pFH, int iChamp);
int fh_iChampPrecedent(struct FormHelp *pFH, int iChamp);
void fh_FiltreNum(int *piKey);
