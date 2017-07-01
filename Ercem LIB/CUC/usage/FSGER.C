// fsger.c
// Feuille de Saisie d'un GERme
// 17/11/94 PV

#include <stdio.h>
#include <clib.ref>

#include <cuc.h>
#include "formhelp.h"

#include "fscral.h"			// Structure de donnÇes de la saisie CRA

#define NULL_INT -2147483648
#define NULL_SHORT -32768

#include "ds.h"				// SQL Dynamique

//======================================================================
// DonnÇes du module

#include "fsger.h"			// Structure de donnÇes de cette feuille
extern struct CUC_Form   *fScral;

//======================================================================

struct CUC_Form   *fSger;			// Pointeur de feuille

#define SGER             300		// Base des contrìles de la feuille
#define lblTitre         (SGER+1)
#define btnOk            (SGER+2)
#define btnAnnuler       (SGER+3)
#define lblAide          (SGER+5)
#define cbxGerme0		 (SGER+10)
#define cbxGerme1		 (SGER+11)
#define cbxGerme2		 (SGER+12)
#define cbxGerme3		 (SGER+13)
#define cbxGerme4		 (SGER+14)
#define cbxGerme5		 (SGER+15)
#define cbxGerme6		 (SGER+16)
#define cbxGerme7		 (SGER+17)
#define cbxGerme8		 (SGER+18)
#define cbxGerme9		 (SGER+19)
#define txtUnite0        (SGER+30)
#define txtUnite1        (SGER+31)
#define txtUnite2        (SGER+32)
#define txtUnite3        (SGER+33)
#define txtUnite4        (SGER+34)
#define txtUnite5        (SGER+35)
#define txtUnite6        (SGER+36)
#define txtUnite7        (SGER+37)
#define txtUnite8        (SGER+38)
#define txtUnite9        (SGER+39)


struct FormControl tSgerControls[] =
{
  SGER,            CUCT_FORM,          3 , 0 , 16, 61, 0,               "Saisie/modification des germes",
  lblTitre,        CUCT_LABEL,         1 , 2 , 1 , 50, SGER,           "N¯  Germe                                        UnitÇ",
  cbxGerme0,	   CUCT_COMBOBOX,      2 , 1 , 12, 48 , SGER,           "",
  txtUnite0,	   CUCT_TEXTEDIT,      2 , 50, 1 , 10, SGER,           "",

  cbxGerme1,	   CUCT_COMBOBOX,      3 , 1 , 12, 48, SGER,           "",
  txtUnite1,	   CUCT_TEXTEDIT,      3 , 50, 1 , 10, SGER,           "",

  cbxGerme2,	   CUCT_COMBOBOX,      4 , 1 , 12, 48, SGER,           "",
  txtUnite2,	   CUCT_TEXTEDIT,      4 , 50, 1 , 10, SGER,           "",

  cbxGerme3,	   CUCT_COMBOBOX,      5 , 1 , 12, 48, SGER,           "",
  txtUnite3,	   CUCT_TEXTEDIT,      5 , 50, 1 , 10, SGER,           "",

  cbxGerme4,	   CUCT_COMBOBOX,      6 , 1 , 12, 48, SGER,           "",
  txtUnite4,	   CUCT_TEXTEDIT,      6 , 50, 1 , 10, SGER,           "",

  cbxGerme5,	   CUCT_COMBOBOX,      7 , 1 , 12, 48, SGER,           "",
  txtUnite5,	   CUCT_TEXTEDIT,      7 , 50, 1 , 10, SGER,           "",

  cbxGerme6,	   CUCT_COMBOBOX,      8 , 1 , 12, 48, SGER,           "",
  txtUnite6,	   CUCT_TEXTEDIT,      8 , 50, 1 , 10, SGER,           "",

  cbxGerme7,	   CUCT_COMBOBOX,      9 , 1 , 12, 48, SGER,           "",
  txtUnite7,	   CUCT_TEXTEDIT,      9 , 50, 1 , 10, SGER,           "",

  cbxGerme8,	   CUCT_COMBOBOX,      10, 1 , 12, 48, SGER,           "",
  txtUnite8,	   CUCT_TEXTEDIT,      10, 50, 1 , 10, SGER,           "",

  cbxGerme9,	   CUCT_COMBOBOX,      11, 1 , 11, 48, SGER,           "",
  txtUnite9,	   CUCT_TEXTEDIT,      11, 50, 1 , 10, SGER,           "",

  btnOk,           CUCT_COMMANDBUTTON, 13, 1 , 1 , 10, SGER,           "F2: Ok",
  btnAnnuler,      CUCT_COMMANDBUTTON, 13, 12, 1 , 17, SGER,           "F3: Abandonne",
  lblAide,         CUCT_LABEL,         14, 1 , 1 , 50, SGER,           "",
  -1
};

//======================================================================
// êchange des donnÇes dans les deux sens entre la structure et les contrìles
// si iUS est vrai, la structure est mise Ö jour Ö partir des contrìles
// Si iUS est faux, les contrìles sont mis Ö jour Ö partir de la structure
static void SgerDataExchange(int iUS, struct CUC_Form *f, struct DataSger *d)
{ int i;
  for (i=0 ; i<10 ; i++)
  {
	if (iUS)	// Lecture de la clÇ de la combo box
	{
	  char szGerme[60];
	  CUC_FormGetPropStr(f, cbxGerme0+i, CUCP_TEXT, szGerme, sizeof(szGerme));
	  if (szGerme[0]==0)
	  { d->iNumGer[i] = NULL_INT;
		d->szGerme[i][0] = 0;
	  }
	  else
	  { d->iNumGer[i] = atoi(szGerme);
		strncpy2(d->szGerme[i], szGerme+4, sizeof(d->szGerme[0]));
	  }
	}
	else
	{
	  if (d->iNumGer[i]==NULL_INT)
		CUC_FormSetPropNum(f, cbxGerme0+i, CUCP_LISTINDEX, 0);
	  else
	  {
		int n;

		n = CUC_FormGetPropNum(f, cbxGerme0+i, CUCP_LISTCOUNT);
		while (--n>0)
		{ char szBuff[5];
		  CUC_FormGetPropStrInd(f, cbxGerme0+i, CUCP_LIST, n, szBuff, sizeof(szBuff));
  //aprintf("", "ligne %d: %s == %d ?", n, szBuff, d->iNumGer[i]);
		  if (atoi(szBuff)==d->iNumGer[i])
			break;
		}
		CUC_FormSetPropNum(f, cbxGerme0+i, CUCP_LISTINDEX, n);
	  }
	}

	DX_Text (iUS, f, txtUnite0+i, d->szUnite[i], sizeof(d->szUnite[0]));
  }
}

//======================================================================

struct FormHelp tFHSger[] =
{
  cbxGerme0, FH_SAISIE, -1, -1, "Code du 1er germe",
  cbxGerme1, FH_SAISIE, -1, -1, "Code du 2äme germe",
  cbxGerme2, FH_SAISIE, -1, -1, "Code du 3äme germe",
  cbxGerme3, FH_SAISIE, -1, -1, "Code du 4äme germe",
  cbxGerme4, FH_SAISIE, -1, -1, "Code du 5äme germe",
  cbxGerme5, FH_SAISIE, -1, -1, "Code du 6äme germe",
  cbxGerme6, FH_SAISIE, -1, -1, "Code du 7äme germe",
  cbxGerme7, FH_SAISIE, -1, -1, "Code du 8äme germe",
  cbxGerme8, FH_SAISIE, -1, -1, "Code du 9äme germe",
  cbxGerme9, FH_SAISIE, -1,	-1, "Code du 10äme germe",

  txtUnite0,  FH_SAISIE, txtUnite1, -1,          "UnitÇ 1er germe",
  txtUnite1,  FH_SAISIE, txtUnite2, txtUnite0,   "UnitÇ 2äme germe",
  txtUnite2,  FH_SAISIE, txtUnite3, txtUnite1,   "UnitÇ 3äme germe",
  txtUnite3,  FH_SAISIE, txtUnite4, txtUnite2,   "UnitÇ 4äme germe",
  txtUnite4,  FH_SAISIE, txtUnite5, txtUnite3,   "UnitÇ 5äme germe",
  txtUnite5,  FH_SAISIE, txtUnite6, txtUnite4,   "UnitÇ 6äme germe",
  txtUnite6,  FH_SAISIE, txtUnite7, txtUnite5,   "UnitÇ 7äme germe",
  txtUnite7,  FH_SAISIE, txtUnite8, txtUnite6,   "UnitÇ 8äme germe",
  txtUnite8,  FH_SAISIE, txtUnite9, txtUnite7,   "UnitÇ 9äme germe",
  txtUnite9,  FH_SAISIE, btnOk,     txtUnite8,   "UnitÇ 10äme germe",

  btnOk,	  0,		 cbxGerme9,btnAnnuler,  "Valider les changements et fermer le dialogue",
  btnAnnuler, 0,	     btnOk,		-1,         "Abandonner les changements et fermer le dialogue",
  -1
};

//======================================================================

// Configuration initiale des contrìles
void Sger_InitCtrl()
{
  int i;

  CUC_FormSetPropNum(fSger, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fSger, btnAnnuler, CUCP_CANCEL, 1);

  for (i=0 ; i<10 ; i++)
  { CUC_FormSetPropNum(fSger, cbxGerme0+i,  CUCP_LISTWIDTH, 59);
	CUC_FormSetPropNum(fSger, cbxGerme0+i,  CUCP_STYLE, 2);
  }
};

//======================================================================
// ProcÇdures d'ÇvÇnement

void Sger_Load()
{
  int	i;
  struct Dynaset *ds;

  Sger_InitCtrl();
  fh_iInitCtrl(fSger, tFHSger);

  for (i=0 ; i<10 ; i++)
	CUC_FormAddItem(fSger, cbxGerme0+i, "", -1);

  ds = ds_CreateDynaset("select ger_indice, ger_libelle from germe where ger_langue='F' order by ger_indice");
  while (!ds_iEOF(ds))
  { 
	int	 iGerme;
	char szGerme[50];
	char szLigne[60];

	iGerme = ds_iGetFieldNum(ds, "ger_indice");
	ds_szGetFieldStr(ds, "ger_libelle", szGerme, sizeof(szGerme));
	sprintf(szLigne, "%2d: %s", iGerme, szRTrim(szGerme));
	for (i=0 ; i<10 ; i++)
	  CUC_FormAddItem(fSger, cbxGerme0+i, szLigne, -1);
	ds_MoveNext(ds);
  }
  ds_CloseDynaset(ds);
}

//======================================================================

static void Sauve()
{
  int i;

  SgerDataExchange(1, fSger, &dSger);
  for (i=0 ; i<10 ; i++)
  { dScral.res[i].iNumGer = dSger.iNumGer[i];
	strcpy(dScral.res[i].szGerme, dSger.szGerme[i]);
	strcpy(dScral.res[i].szUnite, dSger.szUnite[i]);
  }
}

//======================================================================

static void btnOk_Click()
{
  Sauve();
  CUC_FormExit(fSger);
}

static void btnAnnuler_Click()
{
  CUC_FormExit(fSger);
}

static void Sger_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
	CUC_FormExit(fSger);
  else if (*piKey==KEY_F(3))	// Sortie avec abandon
	btnAnnuler_Click();
  else if (*piKey==KEY_F(2))	// Sortie avec sauvegarde
	btnOk_Click();
  else if (*piKey==KEY_UP)
  { int i = fh_iChampPrecedent(tFHSger, CUC_FormGetActiveControl(fSger));
	if (i>=0)
	{ CUC_FormSetActiveControl(fSger, i);
	  *piKey = 0;
	}
  }
  else if (*piKey==KEY_DOWN || *piKey==KEY_RETURN)
  { int i = fh_iChampSuivant(tFHSger, CUC_FormGetActiveControl(fSger));
	if (i>=0)
	{ CUC_FormSetActiveControl(fSger, i);
	  *piKey = 0;
	}
  }
}

//======================================================================

int iFFCtrl;

static void FFSger_GotFocus()
{
  int i;
  iFFCtrl = CUC_FormGetActiveControl(fSger);
  for (i=0 ; tFHSger[i].iChamp>=0 ; i++)
	if (tFHSger[i].iChamp==iFFCtrl)
	{ CUC_FormSetPropStr(fSger, lblAide, CUCP_CAPTION, tFHSger[i].szAide);
	  return;
	}

  // Pas trouvÇ le contrìle: on efface le label d'aide
  CUC_FormSetPropStr(fSger, lblAide, CUCP_CAPTION, "");
}


static struct FormEvent tSgerEvents[] =
{
  SGER,				CUCE_LOAD,			Sger_Load,
  SGER,				CUCE_KEY,			Sger_Key,
  btnOk,			CUCE_CLIC,			btnOk_Click,
  btnAnnuler,		CUCE_CLIC,			btnAnnuler_Click,
  -1
};


// Exploitation de la feuille
static void DoFormSger()
{

  if (CUC_FormCreate(&fSger, tSgerControls, tSgerEvents, NULL)<0)
	aprintf("DoFormSger", "Echec Ö la crÇation de la grille !");
  else
  {
	if (fh_iRegisterHelp(fSger, tFHSger, FFSger_GotFocus)>=0)
	{
	  CUC_FormDeactivate(fScral);
	  SgerDataExchange(0, fSger, &dSger);
	  CUC_FormShow(fSger);

	  CUC_FormExec(fSger);
	  CUC_FormDestruct(fSger);
	  CUC_FormActivate(fScral);
	}
  }
}

//======================================================================

void DoEditeGermes()
{
  int i;

  // On remplit la structure de donnÇes d'E/S d'apräs le CRA courant
  for (i=0 ; i<10 ; i++)
  {
    dSger.iNumGer[i] = dScral.res[i].iNumGer;
	strcpy(dSger.szGerme[i], dScral.res[i].szGerme);
	strcpy(dSger.szUnite[i], dScral.res[i].szUnite);
  }

  // On rÇalise la saisie interactive
  DoFormSger();
}
