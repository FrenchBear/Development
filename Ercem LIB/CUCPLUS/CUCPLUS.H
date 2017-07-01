// cucplus.c
// Services de haut niveau basÇs sur la biblio CUC
// 17/12/94 PV	Ajout de formhelp
// 10/02/94 PV	fImpr

// ibox.c
char *cucp_szInputBox(char *szMessage, char *szTitre, char *szBuffer, int iTailleBuffer, int iFlags);

#define CUCP_IF_MONOLIGNE	1
#define CUCP_IF_AUTOSELECT	2

// formhelp
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
void fh_ChampSaisie(struct CUC_Form *f, int iChamp);

int fh_iChampSuivant(struct FormHelp *pFH, int iChamp);
int fh_iChampPrecedent(struct FormHelp *pFH, int iChamp);
void fh_FiltreNum(int *piKey);
void fh_FiltreMaj(int *piKey);


// fimpr
// Interface de la feuille de configuration d'impression
// 20/01/95 PV

struct DataImpr				// Struct d'E/S pour la grille
{
  int	bDansFichier;
  char	szImpr[21];
  char	szNomfic[255];
  char	szDest[64];
  int	iNbEx;
  int	iClasse;			// Classe d'imprimante
};

// Flags des types d'imprimante
#define FI_HP3		2
#define FI_HP3SI	4
#define FI_KYOCERA	8
#define FI_FUJITSU	16
#define FI_PHILIPS	32
#define FI_UNITE	64

int bDoFormImpression(struct DataImpr *, int iFlags);

