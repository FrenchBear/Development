// fimpr.c
// Feuille g‚n‚rale de choix de destination d'impression
// 20/01/95 PV	Version Editeur Simple
//  9/02/95 PV	Mise en bibliothŠque CUCPlus; classes

#include <stdio.h>
#include <clib.ref>

#include <cuc.h>

#include "cucplus.h"

//======================================================================
// Donn‚es du module

static int iRet;					// Code de retour: 0=Annuler, 1=Ok
static int iIndexDefaut;			// Index de l'imprimante par d‚faut
static struct DataImpr *pdImpr;		// Structure-paramŠtre
static int iFlags;					// ParamŠtre d'appel

//======================================================================

static struct CUC_Form	*fImpr;		// Pointeur de feuille

#define IMPR			30400		// Base des contr“les de la feuille
#define fraDest			(IMPR+1)
#define optImpr			(IMPR+2)
#define optFichier		(IMPR+3)
#define lstImpr			(IMPR+4)
#define txtNomfic		(IMPR+5)
#define lblDest			(IMPR+6)
#define txtDest			(IMPR+7)
#define lblNbEx			(IMPR+8)
#define txtNbEx			(IMPR+9)
#define btnOk           (IMPR+10)
#define btnAnnuler      (IMPR+11)
#define lblAide			(IMPR+12)


static struct FormControl tImprControls[] =
{
  IMPR,				CUCT_FORM,			3 , 13, 20, 56, 0,       "Impression",
  fraDest,			CUCT_FRAME,			1 , 2 , 11, 52, IMPR,    "Destination",
  optImpr,			CUCT_OPTIONBUTTON,	1 , 2 , 1,  30, fraDest, "&Imprimante:",
  lstImpr,			CUCT_LIST,			2 , 5 , 7,  45, fraDest, "",
  optFichier,		CUCT_OPTIONBUTTON,	9 , 2 , 1,  35, fraDest, "&Fichier:",
  txtNomfic,		CUCT_TEXTEDIT,		9 , 17, 1,  33, fraDest, "",
  lblDest,			CUCT_LABEL,			13, 2 , 1,  13, IMPR,    "&Destinataire:",
  txtDest,			CUCT_TEXTEDIT,		13, 19, 1,  33, IMPR,    "",
  lblNbEx,			CUCT_LABEL,			14, 2 , 1,  17, IMPR,    "&Nb d'exemplaires:",
  txtNbEx,			CUCT_TEXTEDIT,		14, 19, 1,  5,  IMPR,    "",

  btnOk,			CUCT_COMMANDBUTTON,	16, 16, 1 , 10, IMPR,    "Ok",
  btnAnnuler,		CUCT_COMMANDBUTTON,	16, 28, 1 , 11, IMPR,    "Annuler",
  lblAide,			CUCT_LABEL,			18, 2 , 1 , 52, IMPR,   "",
  -1
};


// Structure pour l'assistance … l'utilisation des contr“les
static struct FormHelp tFHImpr[] =
{
  optImpr,			0,
	optFichier,		-1,
	"Option pour ‚diter sur une imprimante",
  lstImpr,			0,
	-1,				-1,
	"S‚lectionner une imprimante",
  optFichier,		0,
	txtDest,		optImpr,
	"Option pour imprimer dans un fichier",
  txtNomfic,		FH_SAISIE|FH_AUTOSELECT,
	txtDest,		-1,
	"Nom du fichier d'impression",
  txtDest,			FH_SAISIE|FH_AUTOSELECT,
	txtNbEx,		optFichier,
	"Texte de la page de garde",
  txtNbEx,			FH_SAISIE|FH_AUTOSELECT,
	btnOk,			txtDest,
	"Nombre d'exemplaires",
  btnOk,			0,
	btnAnnuler,		txtNbEx,
	"Valider et lancer l'impression",
  btnAnnuler,		0,
	-1,				btnOk,
	"Annuler la demande d'impression",
  -1,
};

//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
static void ImprDataExchange(int iUS, struct CUC_Form *f, struct DataImpr *d)
{
  int	iFrame;
  char	szNom[13];

  // Bouton d'option
  if (iUS)
  { DX_Value(iUS, f, fraDest, &iFrame);
	d->bDansFichier = iFrame==optFichier;
  }
  else
  { iFrame = d->bDansFichier ? optFichier : optImpr;
	DX_Value(iUS, f, fraDest, &iFrame);
  }

  // Liste des imprimantes
  if (iUS)
  {
	int iSel = CUC_FormGetPropNum(f, lstImpr, CUCP_LISTINDEX);
	if (iSel<0)
	{
	  d->szImpr[0] = 0;
	  d->iClasse = 0;		// Classe de l'impression fichier
	}
	else
	{
	  char szLigne[100], *p;

	  // On r‚cupŠre le nom dans un buffer court
	  CUC_FormGetPropStr(f, lstImpr, CUCP_TEXT, szNom, sizeof(szNom));
	  szRTrim(szNom);
	  sstrcpy(d->szImpr, szNom);

	  // Et la ligne complŠte dans un buffer long pour r‚cup‚r‚r
	  // la classe
	  CUC_FormGetPropStr(f, lstImpr, CUCP_TEXT, szLigne, sizeof(szLigne));
	  p = strchr(szLigne, '\n');
	  if (p!=NULL)
		d->iClasse = atoi(p+1);
	  else
		d->iClasse = 0;
	}
  }
  else
  {
	int i, iNb;
	int iTrouve = 0;
	
	iNb = CUC_FormGetPropNum(f, lstImpr, CUCP_LISTCOUNT);
	CUC_FormSetPropNum(f, lstImpr, CUCP_LISTINDEX, -1);
	for (i=0 ; i<iNb ; i++)
	{
	  CUC_FormGetPropStrInd(f, lstImpr, CUCP_LIST, i, szNom, sizeof(szNom));
	  szRTrim(szNom);
	  if (strcmp(szNom, d->szImpr)==0)
	  { CUC_FormSetPropNum(f, lstImpr, CUCP_LISTINDEX, i);
		iTrouve = 1;
		break;
	  }
	}

	// Si on n'a pas trouv‚ l'imprimante par nom, on s‚lectionne
	// l'imprimante par d‚faut
	if (!iTrouve)
	  CUC_FormSetPropNum(f, lstImpr, CUCP_LISTINDEX, iIndexDefaut);
  }
	
  DX_Text(iUS, f, txtNomfic, d->szNomfic, sizeof(d->szNomfic));
  DX_Text(iUS, f, txtDest, d->szDest, sizeof(d->szDest));
  DX_Value(iUS, f, txtNbEx, &d->iNbEx);
}

//======================================================================

#ifdef UNIX
struct IMPRMEM
{
  char *szNomImpr;
  char *szDescr;
  int iClasse;
  int bDefaut;
};

static int triImpr(const struct IMPRMEM *p1, const struct IMPRMEM *p2)
{
  return strcmp(p1->szNomImpr, p2->szNomImpr);
}
#endif

static void RemplissageListeImprimantes()
{
#ifdef UNIX
  FILE *f;
  char	szBuffer[100], szDefault[16], szPrinter[16];
  char	szDescription[64];
  int	iIndex = 0;

  // Variables statiques pour acc‚l‚rer le r‚affichage de la boite
  static int bDejaListe = 0;
  static struct IMPRMEM *tImprMem;
  static int iNbImprMem;

  struct IMPRMEM *t2;

  // Lors du premier passage, on consulte le systŠme pour construire
  // la liste en m‚moire qui servira ensuite … remplir la liste

  if (!bDejaListe)
  {
	iNbImprMem = 0;
	tImprMem = NULL;

	szDefault[0] = 0;
	f = popen("lpstat -d -p -D", "r");
	while (fgets(szBuffer, 100, f)!=NULL)
	{
restart:
	  if (strncmp(szBuffer, "system default", 14)==0)
		sscanf(szBuffer, "%*s %*s %*s %s", szDefault);
	  else if (strncmp(szBuffer, "printer", 7)==0)
	  {
		char *p;
		int	 iClasse;

		sscanf(szBuffer, "%*s %s", szPrinter);
		while (fgets(szBuffer, 100, f)!=NULL)
		{
		  if (szBuffer[0]!='\t') goto restart;
		  if (strstr(szBuffer, "Description:")!=NULL)
		  { sscanf(szBuffer, " %*s %[^\n]", szDescription);
			break;
		  }
		}

		// On extrait la classe de la description
		p = strchr(szDescription, '|');
		if (p!=NULL)
		{ iClasse = atoi(p+1);
		  *p = 0;
		}
		else
		  iClasse = 0;

		t2 = realloc(tImprMem, (iNbImprMem+1)*sizeof(struct IMPRMEM));
		if (t2==NULL) break;	// echec au malloc
		tImprMem = t2;

		tImprMem[iNbImprMem].szNomImpr = strdup(szPrinter);
		tImprMem[iNbImprMem].szDescr = strdup(szDescription);
		tImprMem[iNbImprMem].bDefaut = strcmp(szDefault, szPrinter)==0;
		tImprMem[iNbImprMem].iClasse = iClasse;
		iNbImprMem++;
	  }
	}
	pclose(f);
	bDejaListe = 1;

	// On remet la liste des imprimantes par ordre alpha
	qsort(tImprMem, iNbImprMem, sizeof(tImprMem[0]), triImpr);
  }

  for (iIndex=0 ; iIndex<iNbImprMem ; iIndex++)
  {
	char szLigne[100];

    if (iFlags==0 || ((1<<tImprMem[iIndex].iClasse)&iFlags)!=0)
	{
	  sprintf(szLigne, "%-12.12s %c%s\n%d",
		tImprMem[iIndex].szNomImpr,
		tImprMem[iIndex].bDefaut ? '*' : ' ',
		tImprMem[iIndex].szDescr,
		tImprMem[iIndex].iClasse);
	  CUC_FormAddItem(fImpr, lstImpr, szLigne, -1);
	  if (tImprMem[iIndex].bDefaut)
		iIndexDefaut = iIndex;
	}
  }

#else	// MS-Dos

  CUC_FormAddItem(fImpr, lstImpr, "LPT1:", -1);
  CUC_FormAddItem(fImpr, lstImpr, "LPT2:", -1);
  CUC_FormAddItem(fImpr, lstImpr, "LPT3:", -1);
  iIndexDefaut = 0;

#endif
}

//======================================================================

// Configuration initiale des contr“les
static void Impr_InitCtrl()
{
  CUC_FormSetPropNum(fImpr, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fImpr, btnAnnuler, CUCP_CANCEL, 1);

  CUC_FormSetPropNum(fImpr, txtNbEx, CUCP_MAXLENGTH, 2);
  CUC_FormSetPropNum(fImpr, txtDest, CUCP_MAXLENGTH, sizeof(pdImpr->szDest)-1);
  CUC_FormSetPropNum(fImpr, txtNomfic, CUCP_MAXLENGTH, sizeof(pdImpr->szNomfic)-1);

  fh_iInitCtrl(fImpr, tFHImpr);
};

//======================================================================
// Proc‚dures d'‚v‚nement

static void Impr_Load()
{
  Impr_InitCtrl();
}

static void Impr_Show()
{
  CUC_FormSetPropStr(fImpr, lblAide, CUCP_CAPTION, "Construction de la liste, patientez...");
  CUC_FormRefresh(fImpr);
  RemplissageListeImprimantes();
}

static void btnOk_Click()
{
  ImprDataExchange(1, fImpr, pdImpr);
  if (pdImpr->iNbEx<1 || pdImpr->iNbEx>40)
  {
	aprintf("NOMBRE D'EXEMPLAIRES INCORRECT !", "|Le nombre d'exemplaires doit ˆtre|compris entre 2 et 40.|");
	CUC_FormSetActiveControl(fImpr, txtNbEx);
	return;
  }

  if (pdImpr->bDansFichier && pdImpr->szNomfic[0]==0)
  {
	aprintf("NOM DE FICHIER INCORRECT !", "|Quand la destination s‚lectionn‚e est 'Fichier',|le nom de fichier doit ˆtre d‚fini.|");
	CUC_FormSetActiveControl(fImpr, txtNomfic);
	return;
  }
  iRet = 1;
  CUC_FormExit(fImpr);
}

static void btnAnnuler_Click()
{
  iRet = 0;
  CUC_FormExit(fImpr);
}

static void Impr_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
  { iRet = 0;
	CUC_FormExit(fImpr);
  }
  else if (*piKey==KEY_F(3))	// Sortie avec abandon
	btnAnnuler_Click();
  else if (*piKey==KEY_F(2))	// Sortie avec sauvegarde
	btnOk_Click();
  else if (*piKey==KEY_UP)
  { int i = fh_iChampPrecedent(tFHImpr, CUC_FormGetActiveControl(fImpr));
	if (i>=0)
	{ CUC_FormSetActiveControl(fImpr, i);
	  *piKey = 0;
	}
  }
  else if (*piKey==KEY_DOWN)
  { int i = fh_iChampSuivant(tFHImpr, CUC_FormGetActiveControl(fImpr));
	if (i>=0)
	{ CUC_FormSetActiveControl(fImpr, i);
	  *piKey = 0;
	}
  }
}


static void optImpr_Change()
{
  if (CUC_FormGetPropNum(fImpr, optImpr, CUCP_VALUE))
	CUC_FormSetActiveControl(fImpr, lstImpr);
}

static void optFichier_Change()
{
  if (CUC_FormGetPropNum(fImpr, optFichier, CUCP_VALUE))
	CUC_FormSetActiveControl(fImpr, txtNomfic);
}


static void FHImpr_GotFocus()
{
  int i;
  int iFFCtrl = CUC_FormGetActiveControl(fImpr);

  for (i=0 ; i<tFHImpr[i].iChamp>=0 ; i++)
	if (tFHImpr[i].iChamp==iFFCtrl)
	{ CUC_FormSetPropStr(fImpr, lblAide, CUCP_CAPTION, tFHImpr[i].szAide);
	  if (tFHImpr[i].iFlags&FH_AUTOSELECT)
	  { CUC_FormSetPropNum(fImpr, iFFCtrl, CUCP_SELSTART, 0);
		CUC_FormSetPropNum(fImpr, iFFCtrl, CUCP_SELLENGTH, 99);
	  }
	  return;
	}

  // Pas trouv‚ le contr“le: on efface le label d'aide
  CUC_FormSetPropStr(fImpr, lblAide, CUCP_CAPTION, "");
}


static struct FormEvent tImprEvents[] =
{
  IMPR,				CUCE_LOAD,			Impr_Load,
  IMPR,				CUCE_SHOW,			Impr_Show,
  IMPR,				CUCE_KEY,			Impr_Key,
  optImpr,			CUCE_CHANGE,		optImpr_Change,
  optFichier,		CUCE_CHANGE,		optFichier_Change,
  btnOk,			CUCE_CLIC,			btnOk_Click,
  btnAnnuler,		CUCE_CLIC,			btnAnnuler_Click,
  -1
};


// Exploitation de la feuille
int bDoFormImpression(struct DataImpr *pDatImp, int iFl)
{
  pdImpr = pDatImp;
  iFlags = iFl;

  if (CUC_FormCreate(&fImpr, tImprControls, tImprEvents, NULL)<0)
  { aprintf("DoFormImpression", "Echec … la cr‚ation de la grille !");
	return 0;
  }

  if (fh_iRegisterHelp(fImpr, tFHImpr, FHImpr_GotFocus)>=0)
  {
	CUC_FormShow(fImpr);
	ImprDataExchange(0, fImpr, pdImpr);
	CUC_FormExec(fImpr);
	CUC_FormDestruct(fImpr);
	return iRet;
  }
  return 0;
}

