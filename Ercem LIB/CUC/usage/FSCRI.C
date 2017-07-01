// fscri.c
// Feuille de Saisie d'un CRItŠre
// 17/11/94 PV

#include <stdio.h>
#include <clib.ref>

#include <cuc.h>
#include "formhelp.h"

#include "fscral.h"			// Structure de donn‚es de la saisie CRA

#define NULL_INT -2147483648
#define NULL_SHORT -32768

//======================================================================
// Donn‚es du module

#include "fscri.h"			// Structure de donn‚es de cette feuille
extern struct CUC_Form   *fScral;

//======================================================================

struct CUC_Form   *fScri;			// Pointeur de feuille

#define SCRI             400		// Base des contr“les de la feuille
#define lblEtiq          (SCRI+1)
#define txtCritere		 (SCRI+2)
#define lblTitCrit		 (SCRI+6)
#define btnOk            (SCRI+3)
#define btnAnnuler       (SCRI+4)
#define lblAide          (SCRI+5)


struct FormControl tScriControls[] =
{
  SCRI,            CUCT_FORM,          3 , 0 , 8 , 61, 0,               "Saisie/modification du critŠre",
  lblEtiq,         CUCT_LABEL,         2 , 2 , 1 , 8 , SCRI,           "&CritŠre:",
  txtCritere,	   CUCT_TEXTEDIT,      2 , 10, 1 , 6,  SCRI,           "",

  lblTitCrit,	   CUCT_LABEL,         2 , 20, 1 , 39, SCRI,           "",

  btnOk,           CUCT_COMMANDBUTTON, 4 , 2 , 1 , 10, SCRI,           "F2: Ok",
  btnAnnuler,      CUCT_COMMANDBUTTON, 4 , 13, 1 , 17, SCRI,           "F3: Abandonne",
  lblAide,         CUCT_LABEL,         6 , 2 , 1 , 58, SCRI,           "",
  -1
};

//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
static void ScriDataExchange(int iUS, struct CUC_Form *f, struct DataScri *d)
{
  DX_Text (iUS, f, txtCritere, d->szCritere, sizeof(d->szCritere));
}

//======================================================================

struct FormHelp tFHScri[] =
{
  txtCritere, FH_SAISIE|FH_AUTOSELECT, btnOk, -1, "Nom du critŠre",

  btnOk,	  0,		 txtCritere, btnAnnuler,  "Valider les changements et fermer le dialogue",
  btnAnnuler, 0,	     btnOk,		-1,           "Abandonner les changements et fermer le dialogue",
  -1
};

//======================================================================

// Configuration initiale des contr“les
void Scri_InitCtrl()
{
  CUC_FormSetPropNum(fScri, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fScri, btnAnnuler, CUCP_CANCEL, 1);

  CUC_FormSetPropNum(fScri, txtCritere, CUCP_MAXLENGTH, 4);
};

//======================================================================
// Proc‚dures d'‚v‚nement

void Scri_Load()
{
  Scri_InitCtrl();
  fh_iInitCtrl(fScri, tFHScri);
}

//======================================================================

static void Sauve()
{
  ScriDataExchange(1, fScri, &dScri);
  strcpy(dScral.szCritere, dScri.szCritere);
}

//======================================================================

static void btnOk_Click()
{
  Sauve();
  CUC_FormExit(fScri);
}

static void btnAnnuler_Click()
{
  CUC_FormExit(fScri);
}

static void Scri_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
	CUC_FormExit(fScri);
  else if (*piKey==KEY_F(3))	// Sortie avec abandon
	btnAnnuler_Click();
  else if (*piKey==KEY_F(2))	// Sortie avec sauvegarde
	btnOk_Click();
  else if (*piKey==KEY_UP)
  { int i = fh_iChampPrecedent(tFHScri, CUC_FormGetActiveControl(fScri));
	if (i>=0)
	{ CUC_FormSetActiveControl(fScri, i);
	  *piKey = 0;
	}
  }
  else if (*piKey==KEY_DOWN)
  { int i = fh_iChampSuivant(tFHScri, CUC_FormGetActiveControl(fScri));
	if (i>=0)
	{ CUC_FormSetActiveControl(fScri, i);
	  *piKey = 0;
	}
  }
}

static void txtCritere_Key(int *piKey)
{
  if (*piKey>=' ' && *piKey<=255)
  {
	if (*piKey>='a' && *piKey<='z')
	  *piKey -= 32;
	if ((*piKey>='A' && *piKey<='Z') || (*piKey>='0' && *piKey<='9'))
	  ;
	else
	  *piKey = 0;
  }
}

//======================================================================

int iFFCtrl;

static void FFScri_GotFocus()
{
  int i;
  iFFCtrl = CUC_FormGetActiveControl(fScri);
  for (i=0 ; tFHScri[i].iChamp>=0 ; i++)
	if (tFHScri[i].iChamp==iFFCtrl)
	{ CUC_FormSetPropStr(fScri, lblAide, CUCP_CAPTION, tFHScri[i].szAide);
	  if (tFHScri[i].iFlags&FH_AUTOSELECT)
	  { CUC_FormSetPropNum(fScri, iFFCtrl, CUCP_SELSTART, 0);
		CUC_FormSetPropNum(fScri, iFFCtrl, CUCP_SELLENGTH, 99);
	  }
	  return;
	}

  // Pas trouv‚ le contr“le: on efface le label d'aide
  CUC_FormSetPropStr(fScri, lblAide, CUCP_CAPTION, "");
}


static struct FormEvent tScriEvents[] =
{
  SCRI,				CUCE_LOAD,			Scri_Load,
  SCRI,				CUCE_KEY,			Scri_Key,
  txtCritere,		CUCE_KEY,			txtCritere_Key,
  btnOk,			CUCE_CLIC,			btnOk_Click,
  btnAnnuler,		CUCE_CLIC,			btnAnnuler_Click,
  -1
};


// Exploitation de la feuille
static void DoFormScri()
{

  if (CUC_FormCreate(&fScri, tScriControls, tScriEvents, NULL)<0)
	aprintf("DoFormScri", "Echec … la cr‚ation de la grille !");
  else
  {
	if (fh_iRegisterHelp(fScri, tFHScri, FFScri_GotFocus)>=0)
	{
	  CUC_FormDeactivate(fScral);
	  ScriDataExchange(0, fScri, &dScri);
	  CUC_FormShow(fScri);

	  CUC_FormExec(fScri);
	  CUC_FormDestruct(fScri);
	  CUC_FormActivate(fScral);
	}
  }
}

//======================================================================

void DoSaisieCritere()
{
  // On remplit la structure de donn‚es d'E/S d'aprŠs le CRA courant
  strcpy(dScri.szCritere, dScral.szCritere);

  // On r‚alise la saisie interactive
  DoFormScri();
}

