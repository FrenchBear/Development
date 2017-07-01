// prepimpr.c
// Pr‚paration de l'impression
//
// 26/10/94 PV	Message en cas de double impression (F7, F7)

#include <stdio.h>
#include <ctype.h>
#include <clib.ref>

#include <cuc.h>

#include "serie.h"

//====================================================================

// Structures li‚es … l'impression
struct BOITE *tBAM[1000];		// tableau des boŒtes … marquer
int nbBAM;						// Nb de boŒtes … marquer

static int iImprimeBoites;		// Vrai quand l'impression est r‚alis‚e
static int iImprimeRuban;		// Vrai quand l'impression est r‚alis‚e

/*====================================================================*/
// Impression
// Feuille d'impression

static struct CUC_Form   *fBAM;		// Pointeur de feuille

#define FAM              300		// Base des contr“les de la feuille
#define lblLegende       (FAM+1)
#define lstBAM           (FAM+2)
#define btnImpTout       (FAM+3)
#define btnImp1          (FAM+4)
#define btnRubBroyat     (FAM+5)
#define btnAnnuler       (FAM+6)
#define lblInfo          (FAM+7)
#define lblMarquage      (FAM+8)
#define lblRuban         (FAM+9)
#define btnRubSecours    (FAM+10)
#define btnRub1          (FAM+11)

static struct FormControl tAMarquerControls[] =
{
  FAM,             CUCT_FORM,          3,  3,   19, 75,  0,   "Liste des boŒtes … imprimer",
  lblLegende,      CUCT_LABEL,         1,  2,   1,  46,  FAM, "R‚f‚rence  Crit Germe/Dil Quant  NbBoi TypeB",
  lstBAM,          CUCT_LIST,          2,  1,   13, 46,  FAM, "",

  lblMarquage,	   CUCT_LABEL,		   2,  48,  1,  25,  FAM, "Marquage des boŒtes:",
  btnImpTout,      CUCT_COMMANDBUTTON, 3,  48,  1,  25,  FAM, "F&7: Tout             ",
  btnImp1,         CUCT_COMMANDBUTTON, 4,  48,  1,  25,  FAM, "F&8: 1 boŒte          ",

  lblRuban,	       CUCT_LABEL,		   6,  48,  1,  25,  FAM, "Ruban 2Šme imprimante:",
  btnRubBroyat,    CUCT_COMMANDBUTTON, 7,  48,  1,  25,  FAM, "F&9: Sacs de broyat   ",
  btnRub1,         CUCT_COMMANDBUTTON, 8,  48,  1,  25,  FAM, "1 &‚tiquette          ",
  btnRubSecours,   CUCT_COMMANDBUTTON, 9,  48,  1,  25,  FAM, "Etiquettes de &secours",

  btnAnnuler,      CUCT_COMMANDBUTTON, 14, 48,  1,  25,  FAM, "Annuler              ",
  lblInfo,         CUCT_LABEL,         15,  2,  3,  60,  FAM, "",
  -1
};

// Configuration initiale des contr“les
static void AMarquer_InitCtrl()
{
//  CUC_FormSetPropNum(fBAM, btnImpTout, CUCP_DEFAULT, 1);
//  CUC_FormSetPropNum(fBAM, btnImp1, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fBAM, btnAnnuler, CUCP_CANCEL, 1);
  CUC_FormSetPropNum(fBAM, lstBAM, CUCP_TABSIZE, 5);
}


static char *szLigneAM(struct BOITE *b)
{
  static char szBuffer[40];

  sprintf(szBuffer, "%-11.11s %-4.4s ", b->szReference, b->szCritere);

  if (b->iGermel==-1)		// Sac de broyat
  {
	sprintf(szBuffer+strlen(szBuffer), "Sac de broyat  ");
  }
  else
  {
	sprintf(szBuffer+strlen(szBuffer), "%-3s",b->szGermel);

	if (b->iDilution==1)
	  sprintf(szBuffer+strlen(szBuffer), "(EP)");
	else if (b->iDilution!=-32768)
	  sprintf(szBuffer+strlen(szBuffer), " %2d ", b->iDilution);
	else
	  sprintf(szBuffer+strlen(szBuffer), "    ");

	if (b->iQuantite!=-32768)
	  sprintf(szBuffer+strlen(szBuffer), " %4.1f ml", b->iQuantite/10.0);
	else
	  sprintf(szBuffer+strlen(szBuffer), "        ");
  }

  if (b->iNbBoites!=7)
	sprintf(szBuffer+strlen(szBuffer), "  %2d", b->iNbBoites);
  else
	sprintf(szBuffer+strlen(szBuffer), "    ");

  sprintf(szBuffer+strlen(szBuffer), "     %d", b->iTypeMarquage);

  return szBuffer;
}

static char szB1[200], szB2[200], szB3[200];

void InfoMarquage(char *szMessage, int iRefresh, int iInit)
{
  char szBuffer[600];

  switch(iInit)
  {
	case 1:
	  szB2[0] = szB3[0] = 0;
	  strcpy(szB1, szMessage);
	  break;

    case 0:
	  strcpy(szB3, szB2);
	  strcpy(szB2, szB1);

	case -1:
	  strcpy(szB1, szMessage);
  }

  sprintf(szBuffer, "%s|%s|%s", szB1, szB2, szB3);
  CUC_FormSetPropStr(fBAM, lblInfo, CUCP_CAPTION, szBuffer);
  if (iRefresh)
	CUC_FormRefresh(fBAM);
}

static void FAM_Load()
{
  int	i;

  AMarquer_InitCtrl();

  for (i=0 ; i<nbBAM ; i++)
	CUC_FormAddItem(fBAM, lstBAM, szLigneAM(tBAM[i]), -1);

  InfoMarquage("F7 imprime l'ensemble des boŒtes|F8 imprime la boŒte s‚lectionn‚e|Suppr efface une boŒte de la liste", 0, 1);
}

static void UneBoite(int i, int iFin)
{
  char	szBuffer[50];

  CUC_FormSetPropNum(fBAM, lstBAM, CUCP_LISTINDEX, i);
  CUC_FormGetPropStr(fBAM, lstBAM, CUCP_TEXT, szBuffer, sizeof(szBuffer));

  Imp1Boite(tBAM[i], iFin);
}

static void btnImp1_Clic()
{
  int i = CUC_FormGetPropNum(fBAM, lstBAM, CUCP_LISTINDEX);

  if (i>=0)
  {
	InfoMarquage("Initialisation des communications avec l'automate de d‚pose d'‚tiquettes...", 1, 1);
    ImpInit();

    UneBoite(i, 1);

    ImpFin();
    InfoMarquage("Le programme a termin‚ d'envoyer les donn‚es … l'automate|de pose d'‚tiquettes.|F2 ou Esc pour revenir … la liste des analyses.", 1, 1);
  }
}


static void btnImpTout_Clic()
{
  int i;

  if (iImprimeBoites)
  {
	i = iAlert("ATTENTION !","|Cette s‚rie a d‚j… ‚t‚ marqu‚e.|Voulez-vous r‚ellement relancer l'impression ?|",2,2,"Ok|Annuler");
	if (i==2) return;
  }

  InfoMarquage("Initialisation des communications avec l'automate de d‚pose d'‚tiquettes...", 1, 1);
  ImpInit();

  for (i=nbBAM ; --i>=0 ; )
    UneBoite(i, i==0 || tBAM[i]->iGermel!=tBAM[i-1]->iGermel);

  ImpFin();
  InfoMarquage("Le programme a termin‚ d'envoyer les donn‚es … l'automate|de pose d'‚tiquettes.|F2 ou Esc pour revenir … la liste des analyses.", 1, 1);

  iDirty = 0;
  iImprimeBoites = 1;
}


static void btnRubBroyat_Clic()
{
  int i;

  if (iImprimeRuban)
  {
	i = iAlert("ATTENTION !","Ce ruban a d‚j… ‚t‚ imprim‚.|Voulez-vous r‚ellement relancer l'impression ?|",1,2,"Ok|Annuler");
	if (i==2) return;
  }

  InfoMarquage("Initialisation des communications avec l'imprimante...", 1, 1);
  RubanInit();

  for (i=nbBAM ; --i>=0 ; )
    Ruban1Etiq(tBAM[i]);

  RubanFin();
  InfoMarquage("Le programme a termin‚ d'imprimer le ruban.|F2 ou Esc pour revenir … la liste des analyses.", 1, 1);

  iImprimeRuban = 1;
}


static void btnRubSecours_Clic()
{
  AlertOk("", "En cours de mise au point...");
}


static void btnRub1_Clic()
{
  AlertOk("", "En cours de mise au point...");
}


static void FAM_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
  { iImprimeBoites = 0;
	CUC_FormExit(fBAM);
  }
  else if (*piKey==KEY_F(2))	// Sortie g‚n‚rale pour ce programme
	CUC_FormExit(fBAM);
  else if (*piKey==KEY_F(7))	// Impression de toutes les boŒtes
    btnImpTout_Clic();
  else if (*piKey==KEY_F(8))	// Impression d'une boŒte
    btnImp1_Clic();
  else if (*piKey==KEY_F(9))	// Impression du ruban
    btnRubBroyat_Clic();
}


static void lstBAM_Key(int *piKey)
{
  int i;

  switch(*piKey)
  {
	case '-':
	case KEY_DELETE:
	  if ((i=CUC_FormGetPropNum(fBAM, lstBAM, CUCP_LISTINDEX))>=0)
	  { CUC_FormRemoveItem(fBAM, lstBAM, -1);
		while (++i<nbBAM)
		  tBAM[i-1] = tBAM[i];
		nbBAM--;
		if (nbBAM==0)
		  CUC_FormExit(fBAM);
	  }
	  break;
  }

}

// Sortie simple par annulation
static void btnAnnuler_Clic()
{
  CUC_FormExit(fBAM);
}


static struct FormEvent tAMarquerEvents[] =
{
  FAM,           CUCE_LOAD,            FAM_Load,
  FAM,           CUCE_KEY,             FAM_Key,
  btnImpTout,    CUCE_CLIC,            btnImpTout_Clic,
  btnImp1,       CUCE_CLIC,            btnImp1_Clic,
  btnRub1,       CUCE_CLIC,            btnRub1_Clic,
  btnRubBroyat,  CUCE_CLIC,            btnRubBroyat_Clic,
  btnRubSecours, CUCE_CLIC,            btnRubSecours_Clic,
  btnAnnuler,    CUCE_CLIC,            btnAnnuler_Clic,
  lstBAM,        CUCE_KEY,             lstBAM_Key,
  -1
};

//====================================================================

int iImpression()
{
  iImprimeBoites = iImprimeRuban = 0;

  // On lance la feuille d'impression
  if (CUC_FormCreate(&fBAM,tAMarquerControls,tAMarquerEvents,NULL)<0)
	aprintf("Impression", "Echec … la cr‚ation de la grille !");
  else
  { 
	CUC_FormShow(fBAM);
	CUC_FormExec(fBAM);
	CUC_FormDestruct(fBAM);
  }

  return iImprimeBoites;
}
