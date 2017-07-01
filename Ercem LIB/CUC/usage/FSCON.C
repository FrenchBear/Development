// fscon.c
// Feuille de Saisie d'un CRItŠre
// 17/11/94 PV

#include <stdio.h>
#include <clib.ref>

#include <cuc.h>
#include "formhelp.h"

#include "fscral.h"			// Structure de donn‚es de la saisie CRA

#define NULL_INT -2147483648
#define NULL_SHORT -32768

#include "ds.h"				// SQL Dynamique

//======================================================================
// Donn‚es du module

#include "fscon.h"			// Structure de donn‚es de cette feuille
extern struct CUC_Form   *fScral;

//======================================================================

struct CUC_Form   *fScon;			// Pointeur de feuille

#define SCON             500		// Base des contr“les de la feuille
#define lblInfo			 (SCON+1)
#define lblConclInfo	 (SCON+2)
#define lblCPInfo		 (SCON+3)
#define lblEtiq          (SCON+4)
#define txtConclusion	 (SCON+5)
#define lblEtiq2		 (SCON+6)
#define txtCPrin		 (SCON+7)
#define lstConclusion	 (SCON+8)
#define btnOk            (SCON+9)
#define btnAnnuler       (SCON+10)
#define lblAide          (SCON+11)


struct FormControl tSconControls[] =
{
  SCON,				CUCT_FORM,			8 , 0 , 17, 71, 0,               "Saisie/modification de conclusion",
  lblInfo,			CUCT_LABEL,			1 , 2 , 1 , 8 , SCON,           "Calcul‚:",
  lblConclInfo,		CUCT_LABEL,			1 , 15, 1 , 6 , SCON,           "",
  lblCPInfo,		CUCT_LABEL,			1 , 43, 1 , 4 , SCON,           "",
  lblEtiq,			CUCT_LABEL,			2 , 2 , 1 , 11, SCON,           "&Conclusion:",
  txtConclusion,	CUCT_TEXTEDIT,		2 , 14, 1 , 6,  SCON,           "",
  lblEtiq2,			CUCT_LABEL,			2 , 23, 1 , 17, SCON,           "Concl &principale:",
  txtCPrin,			CUCT_TEXTEDIT,		2 , 42, 1 , 4,  SCON,           "",
  lstConclusion,	CUCT_LIST,			3 , 1,  10, 68, SCON,           "",

  btnOk,           CUCT_COMMANDBUTTON,	14, 2 , 1 , 10, SCON,           "F2: Ok",
  btnAnnuler,      CUCT_COMMANDBUTTON,	14, 13, 1 , 17, SCON,           "F3: Abandonne",
  lblAide,         CUCT_LABEL,			15, 2 , 1 , 58, SCON,           "",
  -1
};

//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
static void SconDataExchange(int iUS, struct CUC_Form *f, struct DataScon *d)
{
  DX_Value(iUS, f, txtConclusion, &d->iConclusion);
  DX_Value(iUS, f, txtCPrin, &d->iCPrin);
  if (iUS)
	CUC_FormGetPropStr(fScon, lstConclusion, CUCP_TEXT, d->szConclusion, sizeof(d->szConclusion));
  else
  {
	DX_Value(iUS, f, lblConclInfo, &d->iConclInfo);
	DX_Value(iUS, f, lblCPInfo, &d->iCPInfo);
  }
}

//======================================================================

struct FormHelp tFHScon[] =
{
  txtConclusion, FH_SAISIE|FH_AUTOSELECT, -1, -1, "Nø de la conclusion",
  txtCPrin,      FH_SAISIE|FH_AUTOSELECT, -1, -1, "Conclusion principale, de 1 … 7",
  lstConclusion, 0, -1,-1, "S‚lectionner la conclusion",

  btnOk,	  0,		 txtConclusion, btnAnnuler,  "Valider les changements et fermer le dialogue",
  btnAnnuler, 0,	     btnOk,		-1,           "Abandonner les changements et fermer le dialogue",
  -1
};

//======================================================================
// Configuration initiale des contr“les

void Scon_InitCtrl()
{
  CUC_FormSetPropNum(fScon, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fScon, btnAnnuler, CUCP_CANCEL, 1);
};

//======================================================================
// Proc‚dures g‚n‚rales

static void Sauve()
{
  SconDataExchange(1, fScon, &dScon);
  dScral.iConclusion = dScon.iConclusion;
  dScral.iCPrin = dScon.iCPrin;
  strncpy2(dScral.szConclusion, dScon.szConclusion, sizeof(dScral.szConclusion));
}

//======================================================================
// Proc‚dures d'‚v‚nement

void Scon_Load()
{
  Scon_InitCtrl();
  fh_iInitCtrl(fScon, tFHScon);
}

static void Charge()
{
  int	iConclusion;
  char	szLibelle[75], szConclusion[71];
  struct Dynaset *ds;

  // Chargement des conclusions
  CUC_FormAddItem(fScon, lstConclusion, "", -1);

  ds = ds_CreateDynaset("select con_indice, con_libelle from conclusion where con_langue='F' order by con_indice");
  while (!ds_iEOF(ds))
  { 
	iConclusion = ds_iGetFieldNum(ds, "con_indice");
	ds_szGetFieldStr(ds, "con_libelle", szConclusion, sizeof(szConclusion));
	sprintf(szLibelle, "%3d: %s", iConclusion, szRTrim(szConclusion));

	CUC_FormAddItem(fScon, lstConclusion, szLibelle, -1);
	ds_MoveNext(ds);
  }
  ds_CloseDynaset(ds);
}

//======================================================================

static void btnOk_Click()
{
  Sauve();
  CUC_FormExit(fScon);
}

static void btnAnnuler_Click()
{
  CUC_FormExit(fScon);
}

static void Scon_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
	CUC_FormExit(fScon);
  else if (*piKey==KEY_F(3))	// Sortie avec abandon
	btnAnnuler_Click();
  else if (*piKey==KEY_F(2))	// Sortie avec sauvegarde
	btnOk_Click();
  else if (*piKey==KEY_UP)
  { int i = fh_iChampPrecedent(tFHScon, CUC_FormGetActiveControl(fScon));
	if (i>=0)
	{ CUC_FormSetActiveControl(fScon, i);
	  *piKey = 0;
	}
  }
  else if (*piKey==KEY_DOWN)
  { int i = fh_iChampSuivant(tFHScon, CUC_FormGetActiveControl(fScon));
	if (i>=0)
	{ CUC_FormSetActiveControl(fScon, i);
	  *piKey = 0;
	}
  }
}

int iSousTraite;

static void txtConclusion_Key(int *piKey)
{
  iSousTraite = 0;
  // Les flŠches verticales sont sous-trait‚es … la liste
  if (*piKey==KEY_DOWN || *piKey==KEY_PGDN ||
	  *piKey==KEY_UP   || *piKey==KEY_PGUP)
  { 
	iSousTraite = 1;
	CUC_FormDoEvent(fScon, lstConclusion, CUCE_KEY, *piKey);
	*piKey = 0;
  }
  else
	fh_FiltreNum(piKey);
}

static void txtConclusion_LostFocus()
{
  iSousTraite = 0;
}


static void txtConclusion_Change()
{
  int n;

  SconDataExchange(1, fScon, &dScon);

  n = CUC_FormGetPropNum(fScon, lstConclusion, CUCP_LISTCOUNT);
  while (--n>0)
  { char szConcl[5];
	CUC_FormGetPropStrInd(fScon, lstConclusion, CUCP_LIST, n, szConcl, sizeof(szConcl));
	if (atoi(szConcl)==dScon.iConclusion)
	  break;
  }
  if (n>0)
	CUC_FormSetPropNum(fScon, btnOk, CUCP_ENABLED, 1);
  else
	CUC_FormSetPropNum(fScon, btnOk, CUCP_ENABLED, 0);

  CUC_FormSetPropNum(fScon, lstConclusion, CUCP_LISTINDEX, n);
}


static void lstConclusion_Change()
{
  char szConcl[5];

  if (iSousTraite || CUC_FormGetActiveControl(fScon)==lstConclusion)
  {
	CUC_FormGetPropStr(fScon, lstConclusion, CUCP_TEXT, szConcl, sizeof(szConcl));
	if (szConcl[0])
	  dScon.iConclusion = atoi(szConcl);
	else
	  dScon.iConclusion = NULL_INT;
	SconDataExchange(0, fScon, &dScon);

	CUC_FormSetPropNum(fScon, txtConclusion, CUCP_SELSTART, 0);
	CUC_FormSetPropNum(fScon, txtConclusion, CUCP_SELLENGTH, 99);
  }
}


void txtCPrin_Key(int *piKey)
{
  fh_FiltreNum(piKey);
}

//======================================================================

int iFFCtrl;

static void FFScon_GotFocus()
{
  int i;
  iFFCtrl = CUC_FormGetActiveControl(fScon);
  for (i=0 ; tFHScon[i].iChamp>=0 ; i++)
	if (tFHScon[i].iChamp==iFFCtrl)
	{ CUC_FormSetPropStr(fScon, lblAide, CUCP_CAPTION, tFHScon[i].szAide);
	  if (tFHScon[i].iFlags&FH_AUTOSELECT)
	  { CUC_FormSetPropNum(fScon, iFFCtrl, CUCP_SELSTART, 0);
		CUC_FormSetPropNum(fScon, iFFCtrl, CUCP_SELLENGTH, 99);
	  }
	  return;
	}

  // Pas trouv‚ le contr“le: on efface le label d'aide
  CUC_FormSetPropStr(fScon, lblAide, CUCP_CAPTION, "");
}


static struct FormEvent tSconEvents[] =
{
  SCON,				CUCE_LOAD,			Scon_Load,
  SCON,				CUCE_KEY,			Scon_Key,
  txtConclusion,	CUCE_KEY,			txtConclusion_Key,
  txtConclusion,	CUCE_CHANGE,		txtConclusion_Change,
  txtConclusion,	CUCE_LOSTFOCUS,		txtConclusion_LostFocus,
  txtCPrin,			CUCE_KEY,			txtCPrin_Key,
  lstConclusion,	CUCE_CHANGE,		lstConclusion_Change,
  btnOk,			CUCE_CLIC,			btnOk_Click,
  btnAnnuler,		CUCE_CLIC,			btnAnnuler_Click,
  -1
};


// Exploitation de la feuille
static void DoFormScon()
{

  if (CUC_FormCreate(&fScon, tSconControls, tSconEvents, NULL)<0)
	aprintf("DoFormScon", "Echec … la cr‚ation de la grille !");
  else
  {
	if (fh_iRegisterHelp(fScon, tFHScon, FFScon_GotFocus)>=0)
	{
	  CUC_FormDeactivate(fScral);
	  CUC_FormShow(fScon);
	  CUC_FormRefresh(fScon);
	  Charge();
	  SconDataExchange(0, fScon, &dScon);

	  CUC_FormExec(fScon);
	  CUC_FormDestruct(fScon);
	  CUC_FormActivate(fScral);
	}
  }
}

//======================================================================

void DoSaisieConclusion()
{
  // On remplit la structure de donn‚es d'E/S d'aprŠs le CRA courant
  dScon.iConclusion = dScral.iConclusion;
  dScon.iCPrin = dScral.iCPrin;
  dScon.iConclInfo = dScral.iConclInfo;
  dScon.iCPInfo = dScral.iCPInfo;

  // On r‚alise la saisie interactive
  DoFormScon();
}

