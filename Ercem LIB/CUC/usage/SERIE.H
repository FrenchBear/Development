// serie.h
// D‚finitions communes de l'application serie

extern char szNomApp[];

struct BOITE
{
  char	szReference[12];
  char	szCritere[5];
  char	szMethode[2];
  char	szGermel[4];
  int	iGermel;
  int	iDilution;
  int	iQuantite;
  int	iNbBoites;
  int	iFacteur;
  int	iTypeMarquage;
  int	iEch;			// Nø d'‚chantillon
  char	szLegende[21];
};

#define MAXBAM 1000
extern struct BOITE *tBAM[MAXBAM];
extern int nbBAM;		// Nb de boŒtes … marquer

extern int iDirty;

extern char szTech[];	// Initiales de la technicienne
extern int  iTech;		// Nø de la technicienne

// Fonctions de communication avec l'automate (impr.c)
void ImpInit(void);
void Imp1Boite(struct BOITE *b, int iFin);
void ImpFin(void);

// Fonctions de pr‚paration de l'impression (prepimpr.c)
int iImpression(void);

// Fonctions d'impression du ruban (ruban.c)
void RubanInit(void);
void Ruban1Etiq(struct BOITE *b);
void RubanFin(void);

//======================================================================
// Fonctions de serutil.c

#include <identif.h>

void UTtoYS(unsigned t, char szBuffer[20]);
void LitEtc();

char *szIdToNom(int iId);
char *szIdToInit(int iId);
