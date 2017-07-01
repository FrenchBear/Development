// ibox.c
// BoŒte de saisie simplifi‚e - Implantation
// 22/11/94 PV
//  5/12/94 PV	Flags CUCP_IF_MONOLIGNE et CUCP_IF_AUTOSELECT

#include <stdio.h>
#include <clib.ref>

#include "biberc.h"

#include <cuc.h>
#include "cucplus.h"

//======================================================================
// Donn‚es du module

// copies globales priv‚es des paramŠtres d'appel
static char *szMessageG;
static char *szBufferG;
static int iTailleG;
static int iFlagsG;

static int iRet;

//======================================================================

static struct CUC_Form   *fIbox;	// Pointeur de feuille

#define IBOX             30000		// Base des contr“les de la feuille
#define lblEtiq          (IBOX+1)
#define txtSaisie		 (IBOX+2)
#define btnOk            (IBOX+3)
#define btnAnnuler       (IBOX+4)


static struct FormControl tIboxControls[] =
{
  IBOX,				CUCT_FORM,			7 , 15, 15, 50, 0,    "BoŒte de saisie",
  lblEtiq,			CUCT_LABEL,			2 , 2 , 3 , 35, IBOX, "",
  txtSaisie,		CUCT_TEXTEDIT,		5 , 2 , 9 , 46, IBOX, "",

  btnOk,			CUCT_COMMANDBUTTON,	2 , 37, 1 , 11, IBOX, "Ok",
  btnAnnuler,		CUCT_COMMANDBUTTON,	3 , 37, 1 , 11, IBOX, "Annuler",
  -1
};

//======================================================================

// Configuration initiale des contr“les
static void Ibox_InitCtrl()
{
  if (iFlagsG&CUCP_IF_MONOLIGNE)
	CUC_FormSetPropNum(fIbox, btnOk, CUCP_DEFAULT, 1);

  CUC_FormSetPropNum(fIbox, btnAnnuler, CUCP_CANCEL, 1);

  if ((iFlagsG&CUCP_IF_MONOLIGNE)==0)
  {
	CUC_FormSetPropNum(fIbox, txtSaisie, CUCP_MULTILINE, 1);
	CUC_FormSetPropNum(fIbox, txtSaisie, CUCP_SCROLLBARS, 2);
  }

  fh_ChampSaisie(fIbox, txtSaisie);

  CUC_FormSetPropStr(fIbox, lblEtiq, CUCP_CAPTION, szMessageG);
};

//======================================================================
// Proc‚dures d'‚v‚nement

static void Ibox_Load()
{
  Ibox_InitCtrl();
}

//======================================================================

static void btnOk_Click()
{
  iRet = 1;
  // On r‚cupŠre le texte
  DX_Text(1, fIbox, txtSaisie, szBufferG, iTailleG);
  CUC_FormExit(fIbox);
}


static void btnAnnuler_Click()
{
  iRet = 0;
  CUC_FormExit(fIbox);
}


static void Ibox_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
  { iRet = 0;
	CUC_FormExit(fIbox);
  }
  else if (*piKey==KEY_F(3))	// Sortie avec abandon
	btnAnnuler_Click();
  else if (*piKey==KEY_F(2))	// Sortie avec sauvegarde
	btnOk_Click();
}

static struct FormEvent tIboxEvents[] =
{
  IBOX,				CUCE_LOAD,			Ibox_Load,
  IBOX,				CUCE_KEY,			Ibox_Key,
  btnOk,			CUCE_CLIC,			btnOk_Click,
  btnAnnuler,		CUCE_CLIC,			btnAnnuler_Click,
  -1
};


// Exploitation de la feuille
char *cucp_szInputBox(char *szMessage, char *szTitre, char *szBuffer, int iTailleBuffer, int iFlags)
{
  szMessageG = szMessage;
  szBufferG = szBuffer;
  iTailleG = iTailleBuffer;
  iFlagsG = iFlags;

  if (iFlags&CUCP_IF_MONOLIGNE)
  { tIboxControls[0].iHeight = 9;
	tIboxControls[2].iHeight = 3;
  }

  if (CUC_FormCreate(&fIbox, tIboxControls, tIboxEvents, NULL)<0)
	aprintf("DoFormIbox", "Echec … la cr‚ation de la grille !");
  else
  {
    // On remplit le dialogue
	if (szTitre!=NULL && szTitre[0]!=0)
	  CUC_FormSetCaption(fIbox, szTitre);
	DX_Text(0, fIbox, txtSaisie, szBufferG, iTailleG);
	if (iFlagsG&CUCP_IF_AUTOSELECT)
	{ CUC_FormSetPropNum(fIbox, txtSaisie, CUCP_SELSTART, 0);
	  CUC_FormSetPropNum(fIbox, txtSaisie, CUCP_SELLENGTH, 9999);
	}
	else
	  CUC_FormSetPropNum(fIbox, txtSaisie, CUCP_SELSTART, 9999);

	CUC_FormShow(fIbox);
	CUC_FormExec(fIbox);
	CUC_FormDestruct(fIbox);
	if (iRet)
	  return szBuffer;
	else
	  return NULL;
  }
  return NULL;
}

