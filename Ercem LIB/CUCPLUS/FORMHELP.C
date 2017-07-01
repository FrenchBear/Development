// formhelp.c
// Aide … l'utilisation des feuilles CUC
// 17/11/94 PV
// 17/12/94 PV	Mise en biblio cucplus

#include <stdio.h>
#include <clib.ref>

#include <cuc.h>
#include "cucplus.h"

int fh_iRegisterHelp(struct CUC_Form *f, struct FormHelp *pFH, void (*FF_GotFocus)())
{
  int	i;
  int	iPb = 0;

  for (i=0 ; pFH[i].iChamp>=0 ; i++)
  { 
	if (CUC_FormAddEvt(f, pFH[i].iChamp, CUCE_GOTFOCUS, FF_GotFocus)<0)
	{ aprintf("fh_iRegisterHelp", "Echec … l'enregistrement dynamique de l'‚venement CUCE_GOTFOCUS !");
	  return -1;
	}
  }

  return 0;
}

void fh_ChampSaisie(struct CUC_Form *f, int iChamp)
{
  CUC_FormSetPropNum(f, iChamp, CUCP_STDATTRIB, BRILLANT);
  if (!CUC_FormGetPropNum(f, iChamp, CUCP_MULTILINE))
	CUC_FormSetPropNum(f, iChamp, CUCP_EOFCHAR, ' ');
}

int fh_iInitCtrl(struct CUC_Form *f, struct FormHelp *pFH)
{
  int i;

  // Formatage en brillant des champs de saisie
  for (i=0 ; pFH[i].iChamp>=0 ; i++)
	if (pFH[i].iFlags&FH_SAISIE)
	  fh_ChampSaisie(f, pFH[i].iChamp);
  return 0;
}

int fh_iChampSuivant(struct FormHelp *pFH, int iChamp)
{
  int i;

  for (i=0 ; pFH[i].iChamp>=0 ; i++)
	if (pFH[i].iChamp==iChamp)
	  return pFH[i].iChampSuivant;
  return -1;
}

int fh_iChampPrecedent(struct FormHelp *pFH, int iChamp)
{
  int i;

  for (i=0 ; pFH[i].iChamp>=0 ; i++)
	if (pFH[i].iChamp==iChamp)
	  return pFH[i].iChampPrecedent;
  return -1;
}


// Filtrage de saisie num‚rique
void fh_FiltreNum(int *piKey)
{
  if (*piKey>=32 && *piKey<=255 && *piKey!=127)	// CaractŠre affichable
	if (*piKey<'0' || *piKey>'9') *piKey = 0;
}

// Filtrage en majuscules
void fh_FiltreMaj(int *piKey)
{
  if (*piKey>=0 && *piKey<=255)
	*piKey = majAZ((char)*piKey);
}
