// ffind.c
// Feuille de recherche g‚n‚rale
//  5/12/94 PV

#include <stdio.h>
#include <clib.ref>

#include <cuc.h>

//======================================================================
// Donn‚es du module

#include "ffind.h"					// Struct de donn‚es de la feuille

static int iRet;					// Code de retour: 0=Annuler, 1=Ok

//======================================================================

static struct CUC_Form   *fFind;	// Pointeur de feuille

#define FIND             30100		// Base des contr“les de la feuille
#define lblEtiq          (FIND+1)
#define txtFind			 (FIND+2)
#define chbDiffMM		 (FIND+3)
#define btnOk            (FIND+4)
#define btnAnnuler       (FIND+5)


static struct FormControl tFindControls[] =
{
  FIND,				CUCT_FORM,			6 , 5 , 11, 70, 0,    "Chercher",
  lblEtiq,			CUCT_LABEL,			2 , 2 , 2 , 18, FIND, "&Texte … chercher:",
  txtFind,			CUCT_TEXTEDIT,		1 , 20, 3 , 48, FIND, "",
  chbDiffMM,		CUCT_CHECKBOX,		5 , 2 , 1,  40, FIND, "&Diff‚rencier Majuscules/minuscules",

  btnOk,			CUCT_COMMANDBUTTON,	7,  24, 3 , 10, FIND, "Ok",
  btnAnnuler,		CUCT_COMMANDBUTTON,	7,  35, 3 , 11, FIND, "Annuler",
  -1
};

//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
static void FindDataExchange(int iUS, struct CUC_Form *f, struct DataFind *d)
{
  DX_Text(iUS, f, txtFind, d->szFind, sizeof(d->szFind));
  DX_Value(iUS, f, chbDiffMM, &d->bDiffMajMin);
}

//======================================================================

// Configuration initiale des contr“les
static void Find_InitCtrl()
{
  CUC_FormSetPropNum(fFind, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fFind, btnAnnuler, CUCP_CANCEL, 1);

  CUC_FormSetPropNum(fFind, txtFind, CUCP_MAXLENGTH, sizeof(dFind.szFind)-1);
};

//======================================================================
// Proc‚dures d'‚v‚nement

static void Find_Load()
{
  Find_InitCtrl();
}

//======================================================================

static void btnOk_Click()
{
  FindDataExchange(1, fFind, &dFind);
  iRet = 1;
  CUC_FormExit(fFind);
}

static void btnAnnuler_Click()
{
  iRet = 0;
  CUC_FormExit(fFind);
}

static void Find_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
  { iRet = 0;
	CUC_FormExit(fFind);
  }
  else if (*piKey==KEY_F(3))	// Sortie avec abandon
	btnAnnuler_Click();
  else if (*piKey==KEY_F(2))	// Sortie avec sauvegarde
	btnOk_Click();
}


static void txtFind_Change()
{
  FindDataExchange(1, fFind, &dFind);
  if (dFind.szFind[0])
	CUC_FormSetPropNum(fFind, btnOk, CUCP_ENABLED, 1);
  else
	CUC_FormSetPropNum(fFind, btnOk, CUCP_ENABLED, 0);
}

static void txtFind_GotFocus()
{
  CUC_FormSetPropNum(fFind, txtFind, CUCP_SELSTART, 0);
  CUC_FormSetPropNum(fFind, txtFind, CUCP_SELLENGTH, 999);
}


static struct FormEvent tFindEvents[] =
{
  FIND,				CUCE_LOAD,			Find_Load,
  FIND,				CUCE_KEY,			Find_Key,
  txtFind,			CUCE_CHANGE,		txtFind_Change,
  txtFind,			CUCE_GOTFOCUS,		txtFind_GotFocus,
  btnOk,			CUCE_CLIC,			btnOk_Click,
  btnAnnuler,		CUCE_CLIC,			btnAnnuler_Click,
  -1
};


// Exploitation de la feuille
int bDoFormFind()
{

  if (CUC_FormCreate(&fFind, tFindControls, tFindEvents, NULL)<0)
	aprintf("DoFormFind", "Echec … la cr‚ation de la grille !");
  else
  {
	FindDataExchange(0, fFind, &dFind);
	CUC_FormShow(fFind);
	txtFind_Change();		// Autorise ou non le bouton Ok
	CUC_FormExec(fFind);
	CUC_FormDestruct(fFind);
	return iRet;
  }
  return 0;
}

