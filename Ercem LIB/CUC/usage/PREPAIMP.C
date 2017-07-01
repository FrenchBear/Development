// prepaimp.c
// Pr‚paration de l'impression

#include <stdio.h>
#include <ctype.h>
#include <clib.ref>

#include <cuc.h>

#include "serie.h"

//====================================================================

// Structures li‚es … l'impression
struct BOITE *tBAM[1000];
int nbBAM;		// Nb de boŒtes … marquer

/*====================================================================*/
// Impression
// Feuille d'impression

struct CUC_Form   *fBAM;		// Pointeur de feuille

#define FAM              300		// Base des contr“les de la feuille
#define lblLegende       (FAM+1)
#define lstBAM           (FAM+2)
#define btnOk            (FAM+3)
#define btnImp1          (FAM+4)
#define btnAnnuler       (FAM+5)
#define lblInfo          (FAM+6)

struct FormControl tAMarquerControls[] =
{
  FAM,             CUCT_FORM,          3,  10,  19, 65,  0,   "Liste des boŒtes … imprimer",
  lblLegende,      CUCT_LABEL,         1,  2,   1,  46,  FAM, "R‚f‚rence  Crit Germe/Dil Quant  NbBoi TypeB",
  lstBAM,          CUCT_LIST,          2,  1,   13, 46,  FAM, "",
  btnOk,           CUCT_COMMANDBUTTON, 2,  48,  3,  12,  FAM, "F&7: Ok",
  btnImp1,         CUCT_COMMANDBUTTON, 6,  48,  3,  12,  FAM, "F&8: Impr 1",
  btnAnnuler,      CUCT_COMMANDBUTTON, 10, 48,  3,  12,  FAM, "Annuler",
  lblInfo,         CUCT_LABEL,         15,  2,  3,  60,  FAM, "",
  -1
};

// Configuration initiale des contr“les
void AMarquer_InitCtrl()
{
  CUC_FormSetPropNum(fBAM, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fBAM, btnAnnuler, CUCP_CANCEL, 1);
  CUC_FormSetPropNum(fBAM, lstBAM, CUCP_TABSIZE, 5);
}


char *szLigneAM(struct BOITE *b)
{
  static char szBuffer[40];

  sprintf(szBuffer, "%-11.11s %-4.4s %-3s", b->szReference, b->szCritere, b->szGermel);

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

  if (b->iNbBoites!=7)
	sprintf(szBuffer+strlen(szBuffer), "  %2d", b->iNbBoites);
  else
	sprintf(szBuffer+strlen(szBuffer), "    ");

  sprintf(szBuffer+strlen(szBuffer), "     %d", b->iTypeMarquage);

  return szBuffer;
}

static void InfoMarquage(char *szMessage, int iRefresh)
{
  CUC_FormSetPropStr(fBAM, lblInfo, CUCP_CAPTION, szMessage);
  if (iRefresh)
	CUC_FormRefresh(fBAM);
}

void FAM_Load()
{
  int	i;

  AMarquer_InitCtrl();

  for (i=0 ; i<nbBAM ; i++)
	CUC_FormAddItem(fBAM, lstBAM, szLigneAM(tBAM[i]), 1);

  InfoMarquage("F7 imprime l'ensemble des boŒtes|F8 imprime la boŒte s‚lectionn‚e|Suppr efface une boŒte de la liste", 0);
}

static void UneBoite(int i, int iFin)
{
  char	szBuffer[50];
  char	szMessage[100];

  CUC_FormSetPropNum(fBAM, lstBAM, CUCP_LISTINDEX, i);
  CUC_FormGetPropStr(fBAM, lstBAM, CUCP_TEXT, szBuffer, sizeof(szBuffer));
  sprintf(szMessage, "Marquage de %s", szBuffer);
  InfoMarquage(szMessage, 1);

  Imp1Boite(tBAM[i], iFin);
}

void btnImp1_Clic()
{
  int i = CUC_FormGetPropNum(fBAM, lstBAM, CUCP_LISTINDEX);

  if (i>=0)
  {
	InfoMarquage("Initialisation des communications avec l'automate de d‚pose d'‚tiquettes...", 1);
    ImpInit(szTech);

    UneBoite(i, 1);

    ImpFin();
    InfoMarquage("Le programme a termin‚ d'envoyer les donn‚es … l'automate|de pose d'‚tiquettes.|F2 ou Esc pour revenir … la liste des analyses.", 1);
  }
}


void btnOk_Clic()
{
  int i;

  InfoMarquage("Initialisation des communications avec l'automate de d‚pose d'‚tiquettes...", 1);
  ImpInit(szTech);

  for (i=nbBAM ; --i>=0 ; i--)
    UneBoite(i, i==nbBAM-1 || tBAM[i]->iGermel!=tBAM[i+1]->iGermel);

  ImpFin();
  InfoMarquage("Le programme a termin‚ d'envoyer les donn‚es … l'automate|de pose d'‚tiquettes.|F2 ou Esc pour revenir … la liste des analyses.", 1);

  iDirty = 0;
}


void FAM_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
	CUC_FormExit(fBAM);
  else if (*piKey==KEY_F(2))	// Sortie g‚n‚rale pour ce programme
	CUC_FormExit(fBAM);
  else if (*piKey==KEY_F(7))	// Impression de toutes les boŒtes
    btnOk_Clic();
  else if (*piKey==KEY_F(8))	// Impression d'une boŒte
    btnImp1_Clic();
}

// Sortie simple par annulation
void btnAnnuler_Clic()
{
  CUC_FormExit(fBAM);
}


void lstBAM_Key(int *piKey)
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


struct FormEvent tAMarquerEvents[] =
{
  FAM,           CUCE_LOAD,            FAM_Load,
  FAM,           CUCE_KEY,             FAM_Key,
  btnOk,         CUCE_CHANGE,          btnOk_Clic,
  btnImp1,       CUCE_CHANGE,          btnImp1_Clic,
  btnAnnuler,    CUCE_CHANGE,          btnAnnuler_Clic,
  lstBAM,        CUCE_KEY,             lstBAM_Key,
  -1
};

//====================================================================

void Impression()
{
  // On lance la feuille d'impression
  if (CUC_FormCreate(&fBAM,tAMarquerControls,tAMarquerEvents)<0)
	aprintf("Impression", "Echec … la cr‚ation de la grille !");
  else
  { CUC_FormShow(fBAM);
	CUC_FormExec(fBAM);
	CUC_FormDestruct(fBAM);
  }
}
