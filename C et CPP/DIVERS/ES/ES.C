// es.c
// Editeur Simple - Exemple d'application de la biblio CUC
//
//  5/12/94 PV  PremiŠre version
// 11/04/95 PV  Aide au d‚marrage, impression

#include <stdio.h>
#ifndef UNIX
#include <io.h>
#endif
#include <fcntl.h>
#include <curses.h>
#include <errno.h>
#include <clib.ref>

#include <biberc.h>
#include <cuc.h>
#include <cucplus.h>

#include "ffind.h"              // Feuille de la commande chercher
#include "frepl.h"              // Feuille de la commande remplacer
#include "fopt.h"               // Feuille des options
#include "fhelp.h"              // Aide g‚n‚rale

//======================================================================
// Variables priv‚es

// Etat de recherche/remplacement
char    szFind[61];
char    szRepl[61];
int     bDiffMajMin;

int     bAffEOL = 0;            // Affichage des fins de ligne
int     bAffTab = 1;            // Affichage des tabulations
int     bWordWrap = 0;          // Passage … la ligne automatique
int     bVScroll = 1;           // Barre de d‚filement verticale
int     bAffLC = 0;             // Affichage d'une ligne d'‚tat
int     iTabSize = 4;           // Taille d'une tabulation

struct DataImpr dImpr;			// Options d'impression

// La feuille de l'‚diteur (pointeur d'accŠs)
struct CUC_Form         *fES;

// La structure de donn‚es
struct DataES
{
  char  *szEdit;            // Texte courant
  size_t iTailleEdit;       // Taille de la zone m‚moire
  char  szPath[128];        // Chemin du fichier
  char  szJoliNom[128];     // Nom ajout‚ au titre
  int   bDirty;             // Vrai si fichier … enregistrer
} dES;


//======================================================================
// L'identification des contr“les de la feuille...

#define ES              100
#define txtEdit         (ES+1)
#define lblInsMode		(ES+2)
#define lblLigne        (ES+3)
#define lblNumLig       (ES+4)
#define lblColonne      (ES+5)
#define lblNumCol       (ES+6)
#define lblHelp         (ES+7)

#define mnuFichier      (ES+30)
#define cmdNouveau      (ES+31)
#define cmdOuvrir       (ES+32)
#define cmdEnreg        (ES+33)
#define cmdEnregSous    (ES+34)
#define cmdFermer		(ES+35)
#define cmdImprimer     (ES+36)
#define cmdOptImp       (ES+37)
#define cmdQuitter      (ES+38)

#define mnuEdition      (ES+40)
#define cmdAnnuler      (ES+41)
#define cmdCouper       (ES+42)
#define cmdCopier       (ES+43)
#define cmdColler       (ES+44)
#define cmdEffacer      (ES+45)
#define cmdAtteindre    (ES+46)
#define cmdDump         (ES+49)
#define cmdProprietes   (ES+50)

#define mnuRechercher	(ES+60)
#define cmdChercher		(ES+61)
#define cmdSuivant		(ES+62)
#define cmdRemplacer	(ES+63)

#define mnuEcran		(ES+70)
#define cmdWordWrap		(ES+82)
#define cmdOptions		(ES+83)
#define cmdFic1			(ES+71)
#define cmdFic2			(ES+72)
#define cmdFic3			(ES+73)
#define cmdFic4			(ES+74)
#define cmdFic5			(ES+75)
#define cmdFic6			(ES+76)
#define cmdFic7			(ES+77)
#define cmdFic8			(ES+78)
#define cmdFic9			(ES+79)
#define cmdFic10		(ES+80)
#define cmdMoreFile		(ES+81)

#define mnuAide         (ES+90)
#define cmdCommandes    (ES+91)
#define cmdAPropos      (ES+92)


// La liste des contr“les
struct FormControl tESControls[] =
{
  ES,			CUCT_FORM,        0,  0,  25, 80, 0,  "Editeur Simple",
  txtEdit,		CUCT_TEXTEDIT,    2,  1,  21, 78, ES, "",
  lblHelp,	    CUCT_LABEL,       23, 1,  1 , 78, ES, "F1: Aide    F2: Quitter    F10: Menus",
  lblInsMode,	CUCT_LABEL,       23, 46, 1 , 3 , ES, "",
  lblLigne,		CUCT_LABEL,       23, 52, 1 , 6 , ES, "Ligne:",
  lblNumLig,	CUCT_LABEL,       23, 59, 1 , 4 , ES, "",
  lblColonne,	CUCT_LABEL,       23, 65, 1 , 9 , ES, "Colonne:",
  lblNumCol,	CUCT_LABEL,       23, 74, 1 , 4 , ES, "",
  -1
};


// La liste des menus
struct FormMenu tSEMenus[] =
{
  mnuFichier,   "&Fichier",             0,          0,        0,
  cmdNouveau,   "&Nouveau",             0,          0,        mnuFichier,
  cmdOuvrir,    "&Ouvrir...",           0,          0,        mnuFichier,
  cmdEnreg,     "&Enregistrer",         0,          0,        mnuFichier,
  cmdEnregSous, "En&registrer sous...", 0,          0,        mnuFichier,
  cmdFermer,	"&Fermer",				0,          0,        mnuFichier,
  0,            "",                     0,          CUCM_SEP, mnuFichier,
  cmdImprimer,  "&Imprimer...",			KEY_CTRL_P, 0,        mnuFichier,
//  cmdOptImp,    "&Configuration de l'impression...",0,  0,    mnuFichier,
  0,            "",                     0,          CUCM_SEP, mnuFichier,
  cmdQuitter,   "&Quitter",             KEY_F(2),   0,        mnuFichier,

  mnuEdition,   "&Edition",             0,          0,        0,
  cmdAnnuler,   "&Annuler",             KEY_CTRL_Z, 0,        mnuEdition,
  0,            "",                     0,          CUCM_SEP, mnuEdition,
  cmdCouper,    "&Couper",              KEY_CTRL_X, 0,        mnuEdition,
  cmdCopier,    "Copi&er",              KEY_CTRL_C, 0,        mnuEdition,
  cmdColler,    "C&oller",              KEY_CTRL_V, 0,        mnuEdition,
  cmdEffacer,   "Ef&facer",             KEY_DELETE, 0,        mnuEdition,
  0,            "",                     0,          CUCM_SEP, mnuEdition,
  cmdAtteindre, "&Atteindre",           KEY_F(5),   0,        mnuEdition,
  0,            "",                     0,          CUCM_SEP, mnuEdition,
  cmdDump,      "&Dump",                KEY_CTRL_U, 0,        mnuEdition,
  cmdProprietes,"P&ropri‚t‚s",          KEY_CTRL_O, 0,        mnuEdition,
  
  mnuRechercher,"&Recherche",           0,          0,        0,
  cmdChercher,  "&Chercher...",         KEY_CTRL_F, 0,        mnuRechercher,
  cmdSuivant,   "&Poursuivre la recherche", KEY_F(3),0,       mnuRechercher,
  cmdRemplacer, "&Remplacer...",        0,          0,        mnuRechercher,
  
  mnuEcran,		"E&cran",				0,          0,        0,
  cmdWordWrap,  "&Passer … la ligne",   0,          0,        mnuEcran,
  cmdOptions,   "Op&tions...",          0,          0,        mnuEcran,
  0,            "",                     0,          CUCM_SEP, mnuEcran,
  cmdFic1,		"",						0,          0,        mnuEcran,
  cmdFic2,		"",						0,          0,        mnuEcran,
  cmdFic3,		"",						0,          0,        mnuEcran,
  cmdFic4,		"",						0,          0,        mnuEcran,
  cmdFic5,		"",						0,          0,        mnuEcran,
  cmdFic6,		"",						0,          0,        mnuEcran,
  cmdFic7,		"",						0,          0,        mnuEcran,
  cmdFic8,		"",						0,          0,        mnuEcran,
  cmdFic9,		"",						0,          0,        mnuEcran,
  cmdFic10,		"",						0,          0,        mnuEcran,
  cmdMoreFile,	"&Plus de fenˆtres...",	0,          0,        mnuEcran,

  mnuAide,		"&Aide",				0,          0,        0,
  cmdCommandes,	"&Commandes...",		KEY_F(1),   0,        mnuAide,
  cmdAPropos,	"&A propos de...",		0,          0,        mnuAide,
  -1
};

//======================================================================

// change des donn‚es dans les deux sens entre la structure et les contr“les
void AfficheTitre()
{
  char szTitre[80];

  strcpy(szTitre, "Editeur Simple - ");
  strncat2(szTitre, dES.szJoliNom, sizeof(szTitre));
  if (dES.bDirty)
	strncat2(szTitre, " *", sizeof(szTitre));
  CUC_FormSetCaption(fES, szTitre);
}


static void AffichePosition()
{
  int iLigne, iColonne;
  int iInsMode;
  char  szText[10];

  iLigne = CUC_FormGetPropNum(fES, txtEdit, CUCP_LINE);
  iColonne = CUC_FormGetPropNum(fES, txtEdit, CUCP_COLUMN);
  iInsMode = CUC_FormGetPropNum(fES, txtEdit, CUCP_INSMODE);

  sprintf(szText, "%d", iLigne+1);
  CUC_FormSetPropStr(fES, lblNumLig, CUCP_CAPTION, szText);
  sprintf(szText, "%d", iColonne+1);
  CUC_FormSetPropStr(fES, lblNumCol, CUCP_CAPTION, szText);

  CUC_FormSetPropStr(fES, lblInsMode, CUCP_CAPTION, iInsMode ? "Ins":"Rep");
}


// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
void ESDataExchange(int iUS, struct CUC_Form *f, struct DataES *d)
{
  if (iUS)
  { size_t iLen = CUC_FormGetPropNum(f, txtEdit, CUCP_LENGTH);
	if (iLen+1>dES.iTailleEdit)
	{
	  char *p = realloc(dES.szEdit, iLen+1);
	  if (NULL==p)
	  { aprintf("ECHEC A L'ALLOCATION MEMOIRE", "|Impossible d'allouer %d octets de m‚moire:|%s|", iLen+1, sys_errlist[errno]);
		return;
	  }
	  dES.szEdit = p;
	  dES.iTailleEdit = iLen+1;
	}
  }
  
  DX_Text(iUS, f, txtEdit, d->szEdit, d->iTailleEdit);
}

//======================================================================
// Proc‚dures g‚n‚rales

static void CreeDocVierge()
{
  dES.szEdit[0] = 0;
  dES.szPath[0] = 0;
  strcpy(dES.szJoliNom, "(Sans titre)");
  ESDataExchange(0, fES, &dES);
  CUC_FormDoEvents(fES);
  dES.bDirty = 0;
  AfficheTitre();
  AffichePosition();
}

static int bCreeDocFichier(char *szNomFic)
{
  long   lPos;
  size_t lRead;
  UC     *p;

  int h = open(szNomFic, O_RDONLY);
  if (h<0)
  { aprintf("ECHEC A L'OUVERTURE DU FICHIER", "|Impossible d'ouvrir le fichier %s:|%s|", szNomFic, sys_errlist[errno]);
	return 0;
  }

  lPos = lseek(h, 0, SEEK_END);
  if (lPos<0)
  { aprintf("ECHEC A LA LECTURE DU FICHIER", "|Echec au lseek(SEEK_END) du fichier %s:|%s|", szNomFic, sys_errlist[errno]);
	close(h);
	return 0;
  }

#ifdef UNIX
#define MAX 10000000L       // 10 Mo
#else
#define MAX 64000L
#endif

  if (lPos>=MAX)
  { aprintf("FICHIER TROP GROS", "|Inpossible de lire un fichier|de plus de %ld octets !|", MAX);
	close(h);
	return 0;
  }

  if ((size_t)(lPos+1)>dES.iTailleEdit)
  {
	char *p = realloc(dES.szEdit, (size_t)(lPos+1));
	if (NULL==p)
	{ aprintf("ECHEC A L'ALLOCATION MEMOIRE", "|Echec … la lecture du ficheir %s|Impossible d'allouer %d octets de m‚moire:|%s|", szNomFic, lPos+1, sys_errlist[errno]);
	  close(h);
	  return 0;
	}
	dES.szEdit = p;
	dES.iTailleEdit = (size_t)(lPos+1);
  }

  lseek(h, 0, SEEK_SET);
  lRead = read(h, dES.szEdit, (size_t)lPos);
  dES.szEdit[lRead] = 0;
  close(h);
  
  // On contr“le s'il n'y a pas de caractŠres sp‚ciaux
  p = dES.szEdit;  
  while (*p)
  {
	if (*p<32 && *p!='\r' && *p!='\n' && *p!='\t')
	{
	  aprintf("FICHIER NON EDITABLE","|Ce fichier ne peut ˆtre visualis‚|avec cet ‚diteur puisqu'il contient|des caractŠres sp‚ciaux !||Trouv‚ le caractŠre %d … l'offset %d|", *p, p-dES.szEdit);
	  dES.szEdit[0] = 0;
	  return 0;
	}
	p++;
  }
  
  strcpy(dES.szPath, szNomFic);
  strcpy(dES.szJoliNom, szNomFic);

  ESDataExchange(0, fES, &dES);
  CUC_FormDoEvents(fES);
  dES.bDirty = 0;
  AfficheTitre();
  AffichePosition();
  return 1;
}


static void AppliqueOptions()
{
  static int bDejaPasse = 0;

  CUC_FormSetPropNum(fES, txtEdit, CUCP_EOLCHAR, bAffEOL ? 0 : 32);
  CUC_FormSetPropNum(fES, txtEdit, CUCP_TABCHAR, bAffTab ? 0 : 32);
  CUC_FormSetPropNum(fES, txtEdit, CUCP_TABSIZE, iTabSize);

  if (bWordWrap)
  { CUC_FormSetPropNum(fES, cmdWordWrap, CUCP_CHECKED, 1);
	CUC_FormSetPropNum(fES, txtEdit, CUCP_SCROLLBARS, 2*bVScroll);
  }
  else
  { CUC_FormSetPropNum(fES, cmdWordWrap, CUCP_CHECKED, 0);
	CUC_FormSetPropNum(fES, txtEdit, CUCP_SCROLLBARS, 1+2*bVScroll);
  }

  if (!bDejaPasse)
  {
	bDejaPasse = 1;
	CUC_FormSetPropNum(fES, txtEdit,    CUCP_HEIGHT, 21);
	if (CUC_FormGetPropNum(fES, txtEdit, CUCP_VISIBLE))
	{
	  CUC_FormSetPropNum(fES, lblHelp,    CUCP_VISIBLE, 1);
	  CUC_FormSetPropNum(fES, lblInsMode, CUCP_VISIBLE, 0);
	  CUC_FormSetPropNum(fES, lblLigne,   CUCP_VISIBLE, 0);
	  CUC_FormSetPropNum(fES, lblNumLig,  CUCP_VISIBLE, 0);
	  CUC_FormSetPropNum(fES, lblColonne, CUCP_VISIBLE, 0);
	  CUC_FormSetPropNum(fES, lblNumCol,  CUCP_VISIBLE, 0);
	}
  }
  else
  if (bAffLC)
  {
	CUC_FormSetPropNum(fES, lblHelp,    CUCP_VISIBLE, 0);
	CUC_FormSetPropNum(fES, txtEdit,    CUCP_HEIGHT, 21);
	if (CUC_FormGetPropNum(fES, txtEdit, CUCP_VISIBLE))
	{ 
	  CUC_FormSetPropNum(fES, lblInsMode, CUCP_VISIBLE, 1);
	  CUC_FormSetPropNum(fES, lblLigne,   CUCP_VISIBLE, 1);
	  CUC_FormSetPropNum(fES, lblNumLig,  CUCP_VISIBLE, 1);
	  CUC_FormSetPropNum(fES, lblColonne, CUCP_VISIBLE, 1);
	  CUC_FormSetPropNum(fES, lblNumCol,  CUCP_VISIBLE, 1);
	}
  }
  else
  {
	CUC_FormSetPropNum(fES, lblInsMode, CUCP_VISIBLE, 0);
	CUC_FormSetPropNum(fES, lblLigne,   CUCP_VISIBLE, 0);
	CUC_FormSetPropNum(fES, lblNumLig,  CUCP_VISIBLE, 0);
	CUC_FormSetPropNum(fES, lblColonne, CUCP_VISIBLE, 0);
	CUC_FormSetPropNum(fES, lblNumCol,  CUCP_VISIBLE, 0);
	CUC_FormSetPropNum(fES, txtEdit,    CUCP_HEIGHT, 22);
  }
}

static int bEnregistrer()
{
  char  szNomBak[128];
  int   h;

  strcat(strcpy(szNomBak, dES.szPath), ".bak");
  unlink(szNomBak);
  if (exist(dES.szPath))
  {
#ifdef UNIX
	if (link(dES.szPath, szNomBak)<0)
	{ aprintf("ECHEC AU LINK", "|Impossible de renommer %s en %s:|%s|", dES.szPath, szNomBak, sys_errlist[errno]);
	  return 0;
	}
	unlink(dES.szPath);
#else
	if (rename(dES.szPath, szNomBak)<0)
	{ aprintf("ECHEC AU RENAME", "|Impossible de renommer %s en %s:|%s|", dES.szPath, szNomBak, sys_errlist[errno]);
	  return 0;
	}
#endif
  }

  h = open(dES.szPath, O_WRONLY|O_CREAT, 0666);
  if (h<0)
  { aprintf("ECHEC A L'OUVERTURE DU FICHIER", "|Impossible d'ouvrir le fichier %s en ‚criture:|%s|", dES.szPath, sys_errlist[errno]);
	return 0;
  }
  write(h, dES.szEdit, strlen(dES.szEdit));
  close(h);
  dES.bDirty = 0;
  AfficheTitre();
  return 1;
}


static int bEnregistrerSous()
{
  char szNomFic[128];

  strcpy(szNomFic, dES.szPath);
  if (cucp_szInputBox("Entrez le nom du fichier … sauvegarder:", "Enregistrer sous", szNomFic, sizeof(szNomFic), CUCP_IF_MONOLIGNE|CUCP_IF_AUTOSELECT)==NULL)
	return 0;
  
  strcpy(dES.szPath, szNomFic);
  strcpy(dES.szJoliNom, szNomFic);
  return bEnregistrer();
}

// Retour vrai si on peut fermer le document courant, ou en ouvrir
// un autre … la place
static int bOkSuite()
{
  if (dES.bDirty)
  {
	char szMessage[300];
	int  iRep;

	ESDataExchange(1, fES, &dES);
	sprintf(szMessage, "|Le texte du fichier %s a ‚t‚ modifi‚.||Voulez-vous enregistrer les modifications ?|", dES.szJoliNom);
	iRep = iAlert("", szMessage, 1, 3, "&Oui|&Non|&Annuler");
	if (3==iRep) return 0;
	if (1==iRep)
	{
	  if (dES.szPath[0])
	  {
		if (!bEnregistrer())
		  return 0;
	  }
	  else
	  {
		if (!bEnregistrerSous())
		  return 0;
	  }
	}
  }
  return 1;
}

//======================================================================
// Proc‚dures d'‚v‚nements

// Initialisation des contr“les de la feuille
void ES_Load()
{
  CUC_FormSetPropNum(fES, txtEdit, CUCP_MULTILINE, 1);
  CUC_FormSetPropNum(fES, txtEdit, CUCP_SCROLLBARS, 3);
}

void ES_Show()
{
  AppliqueOptions();
}

void ES_Key(int *piKey)
{
  if (KEY_CTRL_D==*piKey)
	CUC_FormExit(fES);      // Sortie de secours
}

// Pour afficher si le contr“le est en mode insertion ou non
void txtEdit_InsModeChange(int iInsMode)
{
  if (bAffLC)
	AffichePosition();
}

void txtEdit_SelChange()
{
  if (bAffLC)
	AffichePosition();
}

void txtEdit_Change()
{
  if (dES.bDirty==0)
  { dES.bDirty = 1;
	AfficheTitre();
  }
}

//======================================================================
// Proc‚dures d'‚v‚nements de menus

void Nouveau_Command()
{
  if (bOkSuite())
	CreeDocVierge();
}

void Ouvrir_Command()
{
  if (bOkSuite())
  {
	char szNomFic[128];

	szNomFic[0] = 0;
	if (cucp_szInputBox("Entrez le nom du fichier … ouvrir:", "Ouvrir", szNomFic, sizeof(szNomFic), CUCP_IF_MONOLIGNE|CUCP_IF_AUTOSELECT)==NULL)
	  return;
	if (!bCreeDocFichier(szNomFic))
	  CreeDocVierge();
  }
}

void Enregistrer_Command()
{
  ESDataExchange(1, fES, &dES);
  if (dES.szPath[0])
	bEnregistrer();
  else
	bEnregistrerSous();
}

void EnregistrerSous_Command()
{
  ESDataExchange(1, fES, &dES);
  bEnregistrerSous();
}


void Fermer_Command()
{
  if (bOkSuite())
	CUC_FormExit(fES);
}

void Imprimer_Command()
{
  static int bDejaInitialise = 0;

  ESDataExchange(1, fES, &dES);
  if (0==dES.szEdit[0])
  { aprintf("IMPRESSION IMPOSSIBLE", "|Il n'y a rien … imprimer...|");
	return;
  }

  if (!bDejaInitialise)
  { dImpr.bDansFichier = 0;
	dImpr.szImpr[0] = 0;
	dImpr.szNomfic[0] = 0;
	dImpr.szDest[0] = 0;
	dImpr.iNbEx = 1;
	dImpr.iClasse = 0;
	bDejaInitialise = 1;
  }

  if (bDoFormImpression(&dImpr, 0))
  {
	FILE *fImp;

//	aprintf("", "Impression:|bDansFichier: %d|szImpr: \"%s\"|szNomfic: \"%s\"|szDest: \"%s\"|iNbEx: %d|Classe: %d",
//	  dImpr.bDansFichier, dImpr.szImpr, dImpr.szNomfic, dImpr.szDest, dImpr.iNbEx, dImpr.iClasse);

	if (dImpr.bDansFichier)
	{
	  fImp = fopen(dImpr.szNomfic, "w");
	  if (fImp==NULL)
	  { aprintf("ERREUR D'OUVERTURE FICHIER", "|Echec … l'ouverture du fichier d'impression \"%s\"|%d: %s|", dImpr.szNomfic, errno, sys_errlist[errno]);
		return;
	  }
	}
	else
	{
	  char szCommande[128];

	  sprintf(szCommande, "lpr -s -d%s -onbex%d", dImpr.szImpr, dImpr.iNbEx);
//aprintf("Commande d'impression", szCommande);
	  fImp = popen(szCommande, "w");
	  if (fImp==NULL)
	  { aprintf("ERREUR D'OUVERTURE IMPRIMANTE", "|Echec … l'ouverture de la commande d'impression \"%s\"|%d: %s|", szCommande, errno, sys_errlist[errno]);
		return;
	  }
	}

	fputs(dES.szEdit, fImp);

	if (dImpr.bDansFichier)
	  fclose(fImp);
	else
	  pclose(fImp);

  }
}

void OptImp_Command()
{
  aprintf("Configuration de l'impression", "En cours d'implantation");
}

void Quitter_Command()
{
  if (bOkSuite())
	CUC_FormExit(fES);
}

//======================================================================
// Menu Edition

void Annuler_Command()
{
  CUC_FormDoEvent(fES, txtEdit, CUCE_KEY, KEY_CTRL_Z);
}

void Couper_Command()
{
  CUC_FormDoEvent(fES, txtEdit, CUCE_KEY, KEY_CTRL_X);
}

void Copier_Command()
{
  CUC_FormDoEvent(fES, txtEdit, CUCE_KEY, KEY_CTRL_C);
}

void Coller_Command()
{
  CUC_FormDoEvent(fES, txtEdit, CUCE_KEY, KEY_CTRL_V);
}

void Effacer_Command()
{
  CUC_FormDoEvent(fES, txtEdit, CUCE_KEY, KEY_DELETE);
}

void Atteindre_Command()
{
  char  szLigne[10];
  char  szMessage[100];
  int   l, lMax;

  sprintf(szMessage, "Entrer le nø de ligne … atteindre, de 1 … %d:", 
	lMax = CUC_FormGetPropNum(fES, txtEdit, CUCP_LINES));
  for(;;)
  {
	sprintf(szLigne, "%d", CUC_FormGetPropNum(fES, txtEdit, CUCP_LINE)+1);
	if (cucp_szInputBox(szMessage, "Atteindre", szLigne, sizeof(szLigne), CUCP_IF_MONOLIGNE|CUCP_IF_AUTOSELECT)==NULL)
	  return;
	l = atoi(szLigne);
	if (l>=1 && l<=lMax)
	  break;
	aprintf("", "|Num‚ro de ligne incorrect !|");
  }
  CUC_FormSetPropNum(fES, txtEdit, CUCP_LINE, l-1);
}

void WordWrap_Command()
{
  bWordWrap = !bWordWrap;
  AppliqueOptions();
}


void Options_Command()
{
  dOpt.bAffEOL = bAffEOL;
  dOpt.bAffTab = bAffTab;
  dOpt.iTabSize = iTabSize;
  dOpt.bVScroll = bVScroll;
  dOpt.bAffLC = bAffLC;
  dOpt.bWordWrap = bWordWrap;
  CUC_FormDeactivate(fES);
  if (bDoFormOptions())
  { 
	bAffEOL = dOpt.bAffEOL;
	bAffTab = dOpt.bAffTab;
	iTabSize = dOpt.iTabSize;
	bVScroll = dOpt.bVScroll;
	bAffLC = dOpt.bAffLC;
	bWordWrap = dOpt.bWordWrap;
	AppliqueOptions();
  }
  CUC_FormActivate(fES);
}


void Dump_Command()
{
  CUC_FormDoEvent(fES, txtEdit, CUCE_DUMP, 0);
}

void Proprietes_Command()
{
  aprintf("Propri‚t‚s de txtEdit",
	"CUCP_TOP:         %5d     CUCP_LEFT:        %5d|"
	"CUCP_HEIGHT:      %5d     CUCP_WIDTH:       %5d|"
	"CUCP_SELSTART:    %5d     CUCP_SELLENGTH:   %5d|"
	"CUCP_LINE:        %5d     CUCP_COLUMN:      %5d|"
	"CUCP_STARTLINE:   %5d     CUCP_STARTCOLUMN: %5d|"
	"CUCP_LENGTH:      %5d     CUCP_LINES:       %5d|"
	"CUCP_INSMODE:     %5d     CUCP_SCROLLBARS:  %5d|"
	"CUCP_MULTILINE:   %5d     CUCP_TABSIZE:     %5d|",
	CUC_FormGetPropNum(fES, txtEdit, CUCP_TOP),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_LEFT),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_HEIGHT),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_WIDTH),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_SELSTART),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_SELLENGTH),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_LINE),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_COLUMN),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_STARTLINE),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_STARTCOLUMN),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_LENGTH),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_LINES),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_INSMODE),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_SCROLLBARS),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_MULTILINE),
	CUC_FormGetPropNum(fES, txtEdit, CUCP_TABSIZE)
	);
}

//======================================================================
// Menu Recherche

// Recherche d'une sous-chaŒne c dans une chaŒne s en ignorant
// les diff‚rences MAJ/min
char *stristr(UC *s, UC *c)
{
  int l = strlen(c);        // Longueur cherch‚e
  while (*s)
	if (strnicmp(s, c, l)==0)
	  return s;
	else
	  s++;
  return NULL;
}

// Retour vrai si l'‚l‚ment cherch‚ a ‚t‚ trouv‚, faux sinon
int bDoCherche(int bSansMessage)
{
  int iLen = strlen(dES.szEdit);
  int iPos = CUC_FormGetPropNum(fES, txtEdit, CUCP_SELSTART);
  char *p;

  // On commence … chercher aprŠs la position courante
  if (iPos+1<iLen)
  {
	if (bDiffMajMin)
	  p = strstr(dES.szEdit+iPos+1, szFind);
	else
	  p = stristr(dES.szEdit+iPos+1, szFind);
	if (p!=NULL)
	{ CUC_FormSetPropNum(fES, txtEdit, CUCP_SELSTART, p-dES.szEdit);
	  CUC_FormSetPropNum(fES, txtEdit, CUCP_SELLENGTH, strlen(szFind));
	  return 1;
	}
  }

  // Recherche … partir du d‚but
  if (bDiffMajMin)
	p = strstr(dES.szEdit, szFind);
  else
	p = stristr(dES.szEdit, szFind);
  if (p!=NULL)
  {
	if (p-dES.szEdit<iPos)
	{ CUC_FormSetPropNum(fES, txtEdit, CUCP_SELSTART, p-dES.szEdit);
	  CUC_FormSetPropNum(fES, txtEdit, CUCP_SELLENGTH, strlen(szFind));
	  return 1;
	}
  }

  if (!bSansMessage)
	aprintf("", "|Le texte cherch‚ n'a pas ‚t‚ trouv‚.|");
  return 0;
}


// si iType==1 pose la question avant chaque remplacement
// si iType==2 remplace tout sans questions
int bDoRemplace(int iType)
{
  int   iChoix;
  int   iNbRempl = 0;

  for(;;)
  {  
	if (!bDoCherche(iType==2))
	{
	  if (iType==2)
		if (iNbRempl==0)
		  aprintf("", "|Aucun remplacement effectu‚.|");
		else
		  aprintf("", "|%d remplacement(s) effectu‚(s).|", iNbRempl);
	  return 0;
	}
	
	if (2==iType)
	  iChoix = 1;
	else
	{
	  CUC_FormRefresh(fES);
	  iChoix = iAlert("", "", 1,3,"Remplacer|Passser|Annuler");
	}
	  
	if (3==iChoix)
	  return 0;
	if (1==iChoix)
	{ 
	  CUC_FormSetPropStr(fES, txtEdit, CUCP_SELTEXT, szRepl);
	  iNbRempl++;
	  ESDataExchange(1, fES, &dES);
	  if (1==iType)
		CUC_FormRefresh(fES);
	}
  }
}


void Chercher_Command()
{
  strcpy(dFind.szFind, szFind);
  dFind.bDiffMajMin = bDiffMajMin;
  CUC_FormDeactivate(fES);
  if (bDoFormFind())
  { strcpy(szFind, dFind.szFind);
	bDiffMajMin = dFind.bDiffMajMin;
	ESDataExchange(1, fES, &dES);
	bDoCherche(0);
  }
  CUC_FormActivate(fES);
}

void Suivant_Command()
{
  ESDataExchange(1, fES, &dES);
  bDoCherche(0);
}

void Remplacer_Command()
{
  int iRep;
  
  strcpy(dRepl.szFind, szFind);
  strcpy(dRepl.szRepl, szRepl);
  dRepl.bDiffMajMin = bDiffMajMin;
  CUC_FormDeactivate(fES);
  if (iRep = iDoFormRepl())
  { strcpy(szFind, dRepl.szFind);
	strcpy(szRepl, dRepl.szRepl);
	bDiffMajMin = dRepl.bDiffMajMin;
	ESDataExchange(1, fES, &dES);
	bDoRemplace(iRep);
  }
  CUC_FormActivate(fES);
}

//======================================================================
// Menu ecran

void Ecran_DropDown()
{ 
  int	iNbFic = 1;
  int	i;
  char	szNomFic[32];
  
  for (i=0 ; i<10 ; i++)
    CUC_FormSetPropNum(fES, cmdFic1+i, CUCP_VISIBLE, (i<iNbFic));
  CUC_FormSetPropNum(fES, cmdMoreFile, CUCP_VISIBLE, (iNbFic>10));

  sprintf(szNomFic, "&1  %-.27s", dES.szJoliNom);
  CUC_FormSetPropStr(fES, cmdFic1, CUCP_CAPTION, szNomFic);
}
  
//======================================================================
// Menu aide
  
static char *tszHelp[] =
{
  "Utilisation de l'‚diteur simple :",
  "",
  "- Pour activer la barre de menus de l'‚diteur simple,",
  "  appuyez sur F10.",
  "- Pour activer les menus et commandes, appuyez sur la",
  "  lettre en surbrillance.",
  "- Pour vous d‚placer parmi les menus et commandes,",
  "  utilisez les touches de DIRECTION.",
  "- Pour quitter l'aide, appuyez sur ECHAP.",
  "",
  "",
  "                        Commandes d'‚dition",
  "",
  "Mouvements du curseur",
  "---------------------",
  "FlŠche gauche      CaractŠre vers la gauche",
  "F10,FlŠche gauche  Mot vers la gauche",
  "FlŠche droite      CaractŠre vers la droite",
  "F10,FlŠche droite  Mot vers la droite",
  "FlŠche haute       Ligne pr‚c‚dente",
  "FlŠche base        Ligne suivante",
  "Origine            D‚but de la ligne",
  "Fin                Fin de la ligne",
  "F10,Origine        D‚but du document",
  "F10,Fin            Fin du document",
  "",
  "Commandes d'‚dition",
  "-------------------",
  "Entr‚e             InsŠre une nouvelle ligne",
  "Suppr              Efface le caractŠre sous le curseur",
  "Backspace          Efface le caractŠre … gauche du curseur",
  "Tab                Positionne le curseur sur le prochain taquet",
  "Insertion          Bascule entre mode insertion et remplacement",
  "Ctrl+Y             Efface la ligne courante",
  "Ctrl+V             Colle le buffer dans le document",
  "",
  "Commandes de s‚lection",
  "----------------------",
  "F8                 D‚bute/Termine le mode s‚lection",
  "Ctrl+X             Supprime la s‚lection, la copie dans le buffer",
  "Suppr et Backspace Supprime la s‚lection",             
  "",
  "Commandes de recherche et de remplacement",
  "-----------------------------------------",
  "Ctrl+F             Recherche un texte",
  "F3                 R‚pŠte la derniŠre recherche",
  "",
  "Commandes de gestion des documents",
  "----------------------------------",
  "F6                 Passe au document suivant",
  NULL,
};

void Commandes_Command()
{
  DoFormHelp(tszHelp);
}

void APropos_Command()
{
  aprintf("A propos de ES...", "|ES - Editeur Simple.|Version 1.1 du 20/01/95||P.VIOLENT|");
}

//======================================================================

// Le tableau des ‚v‚nements et des proc‚dures d'‚v‚nements
// C'est plus commode de le placer aprŠs la liste des proc‚dures...
struct FormEvent tSEEvents[] =
{
  ES,           CUCE_KEY,               ES_Key,
  ES,           CUCE_LOAD,              ES_Load,
  ES,           CUCE_SHOW,              ES_Show,
  txtEdit,      CUCE_CHANGE,            txtEdit_Change,
  txtEdit,      CUCE_INSMODECHANGE,     txtEdit_InsModeChange,
  txtEdit,      CUCE_SELCHANGE,         txtEdit_SelChange,

  cmdNouveau,   CUCE_COMMAND,           Nouveau_Command,
  cmdOuvrir,    CUCE_COMMAND,           Ouvrir_Command,
  cmdEnreg,     CUCE_COMMAND,           Enregistrer_Command,
  cmdEnregSous, CUCE_COMMAND,           EnregistrerSous_Command,
  cmdFermer,	CUCE_COMMAND,           Fermer_Command,
  cmdImprimer,  CUCE_COMMAND,           Imprimer_Command,
  cmdOptImp,    CUCE_COMMAND,           OptImp_Command,
  cmdQuitter,   CUCE_COMMAND,           Quitter_Command,

  cmdAnnuler,   CUCE_COMMAND,           Annuler_Command,
  cmdCouper,    CUCE_COMMAND,           Couper_Command,
  cmdCopier,    CUCE_COMMAND,           Copier_Command,
  cmdColler,    CUCE_COMMAND,           Coller_Command,
  cmdEffacer,   CUCE_COMMAND,           Effacer_Command,
  cmdAtteindre, CUCE_COMMAND,           Atteindre_Command,
  cmdWordWrap,  CUCE_COMMAND,           WordWrap_Command,
  cmdOptions,   CUCE_COMMAND,           Options_Command,
  cmdDump,      CUCE_COMMAND,           Dump_Command,
  cmdProprietes,CUCE_COMMAND,           Proprietes_Command,

  cmdChercher,  CUCE_COMMAND,           Chercher_Command,
  cmdSuivant,   CUCE_COMMAND,           Suivant_Command,
  cmdRemplacer, CUCE_COMMAND,           Remplacer_Command,

  mnuEcran,		CUCE_DROPDOWN,          Ecran_DropDown,

  cmdCommandes, CUCE_COMMAND,           Commandes_Command,
  cmdAPropos,   CUCE_COMMAND,           APropos_Command,
  -1
};


void ChargeFichier(int argc, char **argv)
{
  if (1==argc)
	CreeDocVierge();
  else
	if (!bCreeDocFichier(argv[1]))
	  CreeDocVierge();
}


int main(int argc, char **argv)
{
  InitEcran();
  NoDelInterrupt();
  refresh();

  // Comme ‡a !
  dES.szEdit = malloc(10);
  dES.iTailleEdit = 10;

  if (CUC_FormCreate(&fES,tESControls,tSEEvents, tSEMenus)<0)
	aprintf("main", "Echec … la cr‚ation de la grille !");
  else
  {
	CUC_FormShow(fES);

	// Initialisation des valeurs via la structure et le DataExchange
	ChargeFichier(argc, argv);
	
	// 'Fonctionnent' de la feuille
	CUC_FormSetFlags(fES, CUCF_TABTRANSMISE);
	CUC_FormExec(fES);
	
	CUC_FormDestruct(fES);
  }

  FinEcran();

  return 0;
}
