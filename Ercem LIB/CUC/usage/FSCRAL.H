// fscral.h
// Structure de donn‚es de la feuille fScral

struct DataScral			// Struct d'E/S pour la grille
{
  char	szReference[12];
  char	szCritere[5];
  char	szMethode[2];
  int	iVerCrit;
  int	iNumEtb;
  char	szPrefixe[11];
  char	szDateDebAna[11];
  struct
  { int 	iNumGer;
	char	szGerme[50];
	char	szUnite[11];
	char	szResultat[11];
	int		iCPar;
	char	szCPar[5];
	int		im;					// m du plan … 3 classes
	char	szSpecifCli[2];		// Interpr‚tation sp‚cifique du client
  } res[10];
  int	iConclusion;			// nø de conclusion client
  char	szConclusion[65];		// Libell‚ de conclusion
  int	iCPrin;					// nø conclusion ‚chelle 1-7
  int	iConclInfo;				// nø de conclusion calcul‚
  int	iCPInfo;				// CP calcul‚e
  char	szCTrafiquee[2];		// Conclusion modifi‚e
  char	szObservations[251];
} dScral;

