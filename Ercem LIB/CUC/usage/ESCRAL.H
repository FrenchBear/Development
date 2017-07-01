// escral.h
// Interface publique du module d'E/S des CRA du labo
// 02/11/94	PV

#define STRUCT_CRAL	\
{ char	szReference[12];	\
  char	szCritere[5];	\
  char	szMethode[2];	\
  int	iVerCrit;	\
  int	iNumEtb;	\
  char	szDateDebAna[20];	\
  struct	\
  {	\
	int		iNumGer; \
	char	szUnite[11]; \
	char	szResultat[11];	\
	char	szCritere[11];	\
	char	szInterp[5];	\
	short	hInterp;	\
  } res[10];	\
  int	iConclusion; \
  int	iCPrin; \
  char	szObservations[251]; \
}

struct CRAL STRUCT_CRAL;

// Flags
#define CRAL_TETESEULE	1
#define CRAL_CORPSSEUL	2

// Fonctions
int cral_iRechCRALt(int iNbCol, char **tszCol, char **tszQuery, int iFlags, int (*iEnum)(char *szRef));
int cral_iRechCRAL1(char *szCol, char *szQuery, int iFlags, int (*iEnum)(char *szRef));
int cral_iLitCRAL(char *szRef, char cLangue, struct CRAL *pCRAL, int iFlags);
int cral_iEcritCRAL(char *szRef, struct CRAL *pCRAL, int iFlags);

