// observ.c
// Gestion des observations sur un ‚chantillon
//
// 26/10/94 PV	Cr‚ation

#include <stdio.h>
#include <ctype.h>
#include <clib.ref>

#include <cuc.h>

#include "serie.h"

//====================================================================
// Variables globales priv‚es

static char *szObsG, *szLegendeG;
static int iTailleObsG;

//====================================================================
// Feuille d'observations

static struct CUC_Form   *fOBS;		// Pointeur de feuille

#define OBS              200		// Base des contr“les de la feuille
#define lblEchantillon   (OBS+10)
#define lblObservations  (OBS+11)
#define txtObservations  (OBS+12)
#define btnOk            (OBS+1)
#define btnAnnuler       (OBS+2)

static struct FormControl tObservationsControls[] =
{
  OBS,             CUCT_FORM,          3,  13, 17,  55,  0,   "Observations",
  lblEchantillon,  CUCT_LABEL,         2,  2,   3,  46,  OBS, "Echantillon",
  lblObservations, CUCT_LABEL,         6,  2,   1,  50,  OBS, "Observations:",

  txtObservations, CUCT_TEXTEDIT,	   7,  2,   6,  50,  OBS, "",

  btnOk, 	       CUCT_COMMANDBUTTON, 13, 15,  3,  11,  OBS, "Ok",
  btnAnnuler,      CUCT_COMMANDBUTTON, 13, 30,  3,  11,  OBS, "Annuler",
  -1
};

// Configuration initiale des contr“les
static void Observations_InitCtrl()
{
  CUC_FormSetPropNum(fOBS, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fOBS, btnAnnuler, CUCP_CANCEL, 1);
  CUC_FormSetPropNum(fOBS, txtObservations, CUCP_MULTILINE, 1);
  CUC_FormSetPropNum(fOBS, txtObservations, CUCP_SCROLLBARS, 2);
}



static void OBS_Load()
{
  int	i;

  Observations_InitCtrl();

  CUC_FormSetPropStr(fOBS, lblEchantillon, CUCP_CAPTION, szLegendeG);
  CUC_FormSetPropStr(fOBS, txtObservations, CUCP_TEXT, szObsG);
}


static void OBS_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
  { CUC_FormExit(fOBS);
  }
  else if (*piKey==KEY_F(2))	// Sortie g‚n‚rale pour ce programme
	CUC_FormExit(fOBS);
}

static void btnOk_Clic()
{
  CUC_FormGetPropStr(fOBS, txtObservations, CUCP_TEXT, szObsG, iTailleObsG);
  CUC_FormExit(fOBS);
}

// Sortie simple par annulation
static void btnAnnuler_Clic()
{
  CUC_FormExit(fOBS);
}


static struct FormEvent tObservationsEvents[] =
{
  OBS,           CUCE_LOAD,            OBS_Load,
  OBS,           CUCE_KEY,             OBS_Key,
  btnOk,         CUCE_CLIC,            btnOk_Clic,
  btnAnnuler,    CUCE_CLIC,            btnAnnuler_Clic,
  -1
};

//====================================================================

int iObservations(char *szLegende, char *szObs, int iTailleObs)
{
  szLegendeG = szLegende;
  szObsG = szObs;
  iTailleObsG = iTailleObs;

  // On lance la feuille d'impression
  if (CUC_FormCreate(&fOBS,tObservationsControls,tObservationsEvents,NULL)<0)
	aprintf("iObservations", "Echec … la cr‚ation de la grille !");
  else
  { 
	CUC_FormShow(fOBS);
	CUC_FormExec(fOBS);
	CUC_FormDestruct(fOBS);
  }

  return 0;
}
