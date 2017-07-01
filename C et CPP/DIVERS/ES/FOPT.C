// fopt.c
// Feuille des options
// 20/01/95 PV

#include <stdio.h>
#include <clib.ref>

#include <cuc.h>
#include <cucplus.h>

//======================================================================
// Donn‚es du module

#include "fopt.h"                   // Struct de donn‚es de la feuille

static int iRet;                    // Code de retour: 0=Annuler, 1=Ok

//======================================================================

static struct CUC_Form  *fOpt;     // Pointeur de feuille

#define OPT             30300      // Base des contr“les de la feuille
#define chbAffEOL       (OPT+1)
#define chbAffTab       (OPT+2)
#define chbWordWrap     (OPT+3)
#define chbVScroll      (OPT+4)
#define chbAffLC        (OPT+5)
#define lblTabSize      (OPT+6)
#define txtTabSize      (OPT+7)
#define btnOk           (OPT+10)
#define btnAnnuler      (OPT+11)


static struct FormControl tOptControls[] =
{
  OPT,              CUCT_FORM,          6 , 20, 14, 38, 0,   "Options d'affichage",
  chbAffEOL,        CUCT_CHECKBOX,      2 , 2 , 1,  35, OPT, "Affichage des fins de &lignes",
  chbAffTab,        CUCT_CHECKBOX,      3 , 2 , 1,  35, OPT, "Affichage des t&abulations",
  chbWordWrap,      CUCT_CHECKBOX,      4 , 2 , 1,  35, OPT, "&Passer … la ligne",
  chbVScroll,       CUCT_CHECKBOX,      5 , 2 , 1,  35, OPT, "&Barre de d‚filement verticale",
  chbAffLC,         CUCT_CHECKBOX,      6 , 2 , 1,  35, OPT, "Affichage d'une &ligne d'‚tat",
  lblTabSize,       CUCT_LABEL,         8 , 2 , 1,  24, OPT, "&Taille d'une tabulation:",
  txtTabSize,       CUCT_TEXTEDIT,      8 , 26, 1,  5 , OPT, "",

  btnOk,            CUCT_COMMANDBUTTON, 10, 9 , 3 , 10, OPT, "Ok",
  btnAnnuler,       CUCT_COMMANDBUTTON, 10, 20, 3 , 11, OPT, "Annuler",
  -1
};

//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
static void OptDataExchange(int iUS, struct CUC_Form *f, struct DataOpt *d)
{
  DX_Value(iUS, f, chbAffEOL, &d->bAffEOL);
  DX_Value(iUS, f, chbAffTab, &d->bAffTab);
  DX_Value(iUS, f, chbWordWrap, &d->bWordWrap);
  DX_Value(iUS, f, chbVScroll, &d->bVScroll);
  DX_Value(iUS, f, chbAffLC, &d->bAffLC);
  DX_Value(iUS, f, txtTabSize, &d->iTabSize);
}

//======================================================================

// Configuration initiale des contr“les
static void OPT_InitCtrl()
{
  CUC_FormSetPropNum(fOpt, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fOpt, btnAnnuler, CUCP_CANCEL, 1);

  CUC_FormSetPropNum(fOpt, txtTabSize, CUCP_MAXLENGTH, 2);

  fh_ChampSaisie(fOpt, txtTabSize);
};

//======================================================================
// Proc‚dures d'‚v‚nement

static void OPT_Load()
{
  OPT_InitCtrl();
}

static void txtTabSize_GotFocus()
{
  CUC_FormSetPropNum(fOpt, txtTabSize, CUCP_SELSTART, 0);
  CUC_FormSetPropNum(fOpt, txtTabSize, CUCP_SELLENGTH, 99);
}

static void btnOk_Click()
{
  OptDataExchange(1, fOpt, &dOpt);
  if (dOpt.iTabSize<2 || dOpt.iTabSize>40)
  {
	aprintf("VALEUR INTERDITE !", "|La taille d'une tabulation|doit ˆtre comprise entre 2 et 40|caractŠres.|");
	return;
  }
  iRet = 1;
  CUC_FormExit(fOpt);
}

static void btnAnnuler_Click()
{
  iRet = 0;
  CUC_FormExit(fOpt);
}

static void OPT_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)       // Sortie de secours...
  { iRet = 0;
	CUC_FormExit(fOpt);
  }
  else if (*piKey==KEY_F(3))    // Sortie avec abandon
	btnAnnuler_Click();
  else if (*piKey==KEY_F(2))    // Sortie avec sauvegarde
	btnOk_Click();
}


static struct FormEvent tOptEvents[] =
{
  OPT,              CUCE_LOAD,          OPT_Load,
  OPT,              CUCE_KEY,           OPT_Key,
  txtTabSize,       CUCE_GOTFOCUS,      txtTabSize_GotFocus,
  btnOk,            CUCE_CLIC,          btnOk_Click,
  btnAnnuler,       CUCE_CLIC,          btnAnnuler_Click,
  -1
};


// Exploitation de la feuille
int bDoFormOptions()
{

  if (CUC_FormCreate(&fOpt, tOptControls, tOptEvents, NULL)<0)
	aprintf("DoFormOptions", "Echec … la cr‚ation de la grille !");
  else
  {
	OptDataExchange(0, fOpt, &dOpt);
	CUC_FormShow(fOpt);
	CUC_FormExec(fOpt);
	CUC_FormDestruct(fOpt);
	return iRet;
  }
  return 0;
}

