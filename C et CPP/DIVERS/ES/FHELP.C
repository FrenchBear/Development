// fhelp.c
// Feuille d'aide g‚n‚rale
// 21/01/95 PV

#include <stdio.h>
#include <clib.ref>

#include <cuc.h>

//======================================================================
// Donn‚es du module

#include "fhelp.h"                  // Struct de donn‚es de la feuille

static char **tszLignes;			// Tableau des lignes d'aide
static int iNbLignes;				// Nb de lignes d'aide
static int iL0;						// 1ère ligne affichée

//======================================================================

static struct CUC_Form   *fHelp;    // Pointeur de feuille

#define HELP             30500      // Base des contr“les de la feuille
#define lstHelp          (HELP+1)
#define btnOk            (HELP+2)


static struct FormControl tHelpControls[] =
{
  HELP,             CUCT_FORM,          5 , 5 , 16, 70, 0,    "Aide",
  lstHelp,          CUCT_LIST,          1 , 2 , 13, 66, HELP, "",
  btnOk,            CUCT_COMMANDBUTTON, 14, 30, 1 , 10, HELP, "Ok",
  -1
};

//======================================================================
// Proc‚dures d'‚v‚nement

static void Help_Load()
{
  CUC_FormSetPropNum(fHelp, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fHelp, lstHelp, CUCP_TABSTOP, 0);
  for (iNbLignes=0 ; tszLignes[iNbLignes]!=NULL ; iNbLignes++)
    CUC_FormAddItem(fHelp, lstHelp, tszLignes[iNbLignes], -1);
  iL0 = 0;
  CUC_FormSetPropNum(fHelp, lstHelp, CUCP_LISTINDEX, -1);
}

//======================================================================

static void btnOk_Click()
{
  CUC_FormExit(fHelp);
}

static void Help_Key(int *piKey)
{
  int iLastL0 = iL0;
  
  switch(*piKey)
  {
    case KEY_CTRL_D:       // Sortie de secours...
	  CUC_FormExit(fHelp);
	  break;
	
	case KEY_UP:   iL0--;      break;
    case KEY_DOWN: iL0++;      break;
    case KEY_PGUP: iL0 -= 10;  break;
    case KEY_PGDN: iL0 += 10;  break;
    case KEY_HOME: iL0 = 0;    break;
    case KEY_END:  iL0 = 9999; break;
  }

  if (iL0<0) iL0 = 0;
  else if (iL0>=iNbLignes) iL0 = iNbLignes-1;
    
  if (iL0!=iLastL0)    
    CUC_FormSetPropNum(fHelp, lstHelp, CUCP_STARTLINE, iL0);
}

static struct FormEvent tHelpEvents[] =
{
  HELP,             CUCE_LOAD,          Help_Load,
  HELP,             CUCE_KEY,           Help_Key,
  btnOk,            CUCE_CLIC,          btnOk_Click,
  -1
};


// Exploitation de la feuille
void DoFormHelp(char **tszLignesAide)
{
  tszLignes = tszLignesAide;

  if (CUC_FormCreate(&fHelp, tHelpControls, tHelpEvents, NULL)<0)
	aprintf("DoFormHelp", "Echec … la cr‚ation de la grille !");
  else
  {
	CUC_FormShow(fHelp);
	CUC_FormExec(fHelp);
	CUC_FormDestruct(fHelp);
  }
}
