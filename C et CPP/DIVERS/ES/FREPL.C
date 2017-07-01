// frepl.c
// Feuille de reemplacement g‚n‚rale
//  5/12/94 PV

#include <stdio.h>
#include <clib.ref>

#include <cuc.h>

//======================================================================
// Donn‚es du module

#include "frepl.h"					// Struct de donn‚es de la feuille

static int iRet;					// Code de retour: 0=Annuler, 1=Ok

//======================================================================

static struct CUC_Form   *fRepl;	// Pointeur de feuille

#define REPL             30150		// Base des contr“les de la feuille
#define lblEtiq1         (REPL+1)
#define txtFind			 (REPL+2)
#define lblEtiq2         (REPL+3)
#define txtRepl			 (REPL+4)
#define chbDiffMM		 (REPL+5)
#define btnChercher      (REPL+6)
#define btnToutRemp      (REPL+7)
#define btnAnnuler       (REPL+8)


static struct FormControl tReplControls[] =
{
  REPL,				CUCT_FORM,			6 , 5 , 14, 70, 0,    "Remplacer",
  lblEtiq1,			CUCT_LABEL,			2 , 2 , 2 , 18, REPL, "&Texte … chercher:",
  txtFind,			CUCT_TEXTEDIT,		1 , 20, 3 , 48, REPL, "",
  lblEtiq2,			CUCT_LABEL,			5 , 2 , 2 , 19, REPL, "&Remplacer par:",
  txtRepl,			CUCT_TEXTEDIT,		4 , 20, 3 , 48, REPL, "",
  chbDiffMM,		CUCT_CHECKBOX,		8 , 2 , 1,  40, REPL, "&Diff‚rencier Majuscules/minuscules",

  btnChercher,		CUCT_COMMANDBUTTON,	10, 14, 3 , 12, REPL, "&Chercher",
  btnToutRemp,		CUCT_COMMANDBUTTON,	10, 27, 3 , 18, REPL, "T&out remplacer",
  btnAnnuler,		CUCT_COMMANDBUTTON,	10, 47, 3 , 11, REPL, "Annuler",
  -1
};

//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
static void ReplDataExchange(int iUS, struct CUC_Form *f, struct DataRepl *d)
{
  DX_Text(iUS, f, txtFind, d->szFind, sizeof(d->szFind));
  DX_Text(iUS, f, txtRepl, d->szRepl, sizeof(d->szRepl));
  DX_Value(iUS, f, chbDiffMM, &d->bDiffMajMin);
}

//======================================================================

// Configuration initiale des contr“les
static void Repl_InitCtrl()
{
  CUC_FormSetPropNum(fRepl, btnChercher, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fRepl, btnAnnuler, CUCP_CANCEL, 1);

  CUC_FormSetPropNum(fRepl, txtFind, CUCP_MAXLENGTH, sizeof(dRepl.szFind)-1);
  CUC_FormSetPropNum(fRepl, txtRepl, CUCP_MAXLENGTH, sizeof(dRepl.szRepl)-1);
};

//======================================================================
// Proc‚dures d'‚v‚nement

static void Repl_Load()
{
  Repl_InitCtrl();
}

//======================================================================

static void btnChercher_Click()
{
  ReplDataExchange(1, fRepl, &dRepl);
  iRet = 1;
  CUC_FormExit(fRepl);
}

static void btnToutRemp_Click()
{
  ReplDataExchange(1, fRepl, &dRepl);
  iRet = 2;
  CUC_FormExit(fRepl);
}

static void btnAnnuler_Click()
{
  iRet = 0;
  CUC_FormExit(fRepl);
}

static void Repl_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
  { iRet = 0;
	CUC_FormExit(fRepl);
  }
  else if (*piKey==KEY_F(3))	// Sortie avec abandon
	btnAnnuler_Click();
  else if (*piKey==KEY_F(2))	// Sortie avec sauvegarde
	btnChercher_Click();
}


static void txtFind_Change()
{
  ReplDataExchange(1, fRepl, &dRepl);
  if (dRepl.szFind[0])
  {
	CUC_FormSetPropNum(fRepl, btnChercher, CUCP_ENABLED, 1);
	CUC_FormSetPropNum(fRepl, btnToutRemp, CUCP_ENABLED, 1);
  }
  else
  {
	CUC_FormSetPropNum(fRepl, btnChercher, CUCP_ENABLED, 0);
	CUC_FormSetPropNum(fRepl, btnToutRemp, CUCP_ENABLED, 0);
  }
}

static void txtFind_GotFocus()
{
  CUC_FormSetPropNum(fRepl, txtFind, CUCP_SELSTART, 0);
  CUC_FormSetPropNum(fRepl, txtFind, CUCP_SELLENGTH, 999);
}

static void txtRepl_GotFocus()
{
  CUC_FormSetPropNum(fRepl, txtRepl, CUCP_SELSTART, 0);
  CUC_FormSetPropNum(fRepl, txtRepl, CUCP_SELLENGTH, 999);
}


static struct FormEvent tReplEvents[] =
{
  REPL,				CUCE_LOAD,			Repl_Load,
  REPL,				CUCE_KEY,			Repl_Key,
  txtFind,			CUCE_CHANGE,		txtFind_Change,
  txtFind,			CUCE_GOTFOCUS,		txtFind_GotFocus,
  txtRepl,			CUCE_GOTFOCUS,		txtRepl_GotFocus,
  btnChercher,		CUCE_CLIC,			btnChercher_Click,
  btnToutRemp,		CUCE_CLIC,			btnToutRemp_Click,
  btnAnnuler,		CUCE_CLIC,			btnAnnuler_Click,
  -1
};


// Exploitation de la feuille
int iDoFormRepl()
{

  if (CUC_FormCreate(&fRepl, tReplControls, tReplEvents, NULL)<0)
	aprintf("DoFormRepl", "Echec … la cr‚ation de la grille !");
  else
  {
	ReplDataExchange(0, fRepl, &dRepl);
	CUC_FormShow(fRepl);
	txtFind_Change();		// Autorise ou non le bouton Ok
	CUC_FormExec(fRepl);
	CUC_FormDestruct(fRepl);
	return iRet;
  }
  return 0;
}
