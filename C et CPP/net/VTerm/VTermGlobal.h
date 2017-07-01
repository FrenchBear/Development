// VTermGlobal.h
// Définitions publiques
// Voir VTermGlobal pour les commentaires
//  1/11/96 PV	OPT_ANSI, OPT_NOESCV, szMonAdresseIP
//  9/11/96 PV	OPT_IDMAN
// 15/10/96 PV	OPT_128128
// 16/07/99 PV  OPT_POINTPN
// 31/10/00 PV	iLignesDefautOptions/iColonnesDefautOptions

enum
{
  OPT_RENDUBRILLANT=1,
  OPT_RENDUGRAS=2,
  OPT_INVERSE=4,
  OPT_ANSI=8,
  OPT_NOESCV=16,
  OPT_IDMAN=32,
  OPT_128128=64,
  OPT_POINTPN=128
};

extern int iOptions;
extern int iLignesDefautOptions, iColonnesDefautOptions;
extern char szFont[];
extern int bCouleursModifiees;
extern COLORREF tcolCouleurs[16];
extern COLORREF tcolCouleursDefaut[16];
extern int iOptions;
extern char szFont[31];
extern ConnexionRecente CR;

extern int bAvecPalette;
extern CPalette *pCPal;
extern LOGPALETTE *pLogPalette;

extern BOOL bModeSelection;
extern BOOL bOptDebug;

extern int iNbConnexionsActives;
extern char szMonAdresseIP[16];

void ReaffichageComplet(BOOL bChangePolice = FALSE);
void GenerePalette(COLORREF [16]);

