// ajoutboite.c
// Marquage des boŒtes - Ajout d'une boite
// P.VIOLENT Juillet 94

#include <stdio.h>
#include <ctype.h>
#include <clib.ref>

#include <cuc.h>

#include "serie.h"		// Interface publique C
#include "serieec.h"	// Interface publique E-SQL/C

//====================================================================
// Donn‚es priv‚es

struct BOITE b;

//====================================================================

// L'identification des contr“les de la feuille...
#define AJB				500
#define ID_LBL1         (AJB+1)
#define ID_LBL2         (AJB+2)
#define ID_LBL3         (AJB+3)
#define ID_LBL4         (AJB+4)
#define ID_LBL5         (AJB+5)
#define ID_GERME        (AJB+6)
#define ID_DILUTION     (AJB+7)
#define ID_QTE          (AJB+8)
#define ID_NBBOITES     (AJB+9)
#define ID_TYPE         (AJB+10)
#define	ID_OK			(AJB+11)
#define	ID_CANCEL		(AJB+12)

// La liste des contr“les
struct FormControl tAjoutControls[] =
{
  AJB,			CUCT_FORM,			5,  5,  7,  52, 0,"Ajout de boŒtes",

  ID_LBL1,		CUCT_LABEL,			2,	2,	1,	6,	AJB, "&Germe:",
  ID_GERME,		CUCT_COMBOBOX,		3,	2,	10,	6,	AJB, "",

  ID_LBL2,		CUCT_LABEL,			2,	10,	1,	9,	AJB, "&Dilution:",
  ID_DILUTION,	CUCT_TEXTEDIT,		3,	10,	1,	6,	AJB, "",

  ID_LBL3,		CUCT_LABEL,			2,	21,	1,	9,	AJB, "&Qt‚ (ml):",
  ID_QTE,		CUCT_TEXTEDIT,		3,	21,	1,	5,	AJB, "",

  ID_LBL4,		CUCT_LABEL,			2,	32,	1,	10,	AJB, "&Nb boŒtes:",
  ID_NBBOITES,	CUCT_TEXTEDIT,		3,	32,	1,	5,	AJB, "",

  ID_LBL5,		CUCT_LABEL,			2,	44,	1,	5,	AJB, "&Type:",
  ID_TYPE,	    CUCT_TEXTEDIT,		3,	44,	1,	5,	AJB, "",

  ID_OK,		CUCT_COMMANDBUTTON,	5,	30,	1,	8,	AJB, "Ok",
  ID_CANCEL,	CUCT_COMMANDBUTTON,	5,	39,	1,	11,	AJB, "Annuler",

  -1
};


// La feuille
struct CUC_Form         *fAjout;

//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
void AjoutDataExchange(int iUS, struct CUC_Form *f, struct BOITE *d)
{
  DX_Text (iUS, f, ID_GERME,    d->szGermel, sizeof(d->szGermel));
  DX_Value(iUS, f, ID_DILUTION, &d->iDilution);
  DX_Value(iUS, f, ID_QTE,      &d->iQuantite);
  DX_Value(iUS, f, ID_NBBOITES, &d->iNbBoites);
  DX_Value(iUS, f, ID_TYPE,     &d->iTypeMarquage);
}


// Proc‚dures d'‚v‚nements

// Clic sur bouton Ok
void OK_Clic()
{
  int iVal;

  CUC_FormExit(fAjout);

  // R‚cup‚ration des valeurs finales
  AjoutDataExchange(1, fAjout, &b);
}

// Clic sur bouton annuler
void ANNULER_Clic()
{
  CUC_FormExit(fAjout);

  // On ne r‚cupŠre pas les valeurs des contr“les
}


// Initialisation des contr“les de la feuille
void Ajout_InitCtrl()
{
  CUC_FormSetPropNum(fAjout, ID_GERME, CUCP_STYLE, 2);   // Saisie limit‚e aux choix propos‚s
  CUC_FormSetPropNum(fAjout, ID_GERME, CUCP_LISTWIDTH, 45);
  CUC_FormSetPropNum(fAjout, ID_OK, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fAjout, ID_CANCEL, CUCP_CANCEL, 1);
}

void Ajout_Load()
{
  Ajout_InitCtrl();

  $declare CGerme cursor for
	select gl_ngermel, gl_germel, gl_libelle
	into $r_gl.gl_ngermel, $r_gl.gl_germel, $r_gl.gl_libelle
	from germelabo
	order by gl_ngermel;

  $open CGerme;
  for(;;)
  {
	char szLigne[60];

	$fetch CGerme;
	if (sqlca.sqlcode==100) break;

	sprintf(szLigne, "%s %s", r_gl.gl_germel, szRTrim(r_gl.gl_libelle));
	CUC_FormAddItem(fAjout, ID_GERME, szLigne, -1);
  }
  $close CGerme;
}

// Le tableau des ‚v‚nements et des proc‚dures d'‚v‚nements
struct FormEvent tAjoutEvents[] =
{
  AJB,          CUCE_LOAD,              Ajout_Load,
  ID_OK,        CUCE_CHANGE,            OK_Clic,
  ID_CANCEL,    CUCE_CHANGE,            ANNULER_Clic,
  -1
};


int iAjoutBoite()
{
  if (CUC_FormCreate(&fAjout,tAjoutControls,tAjoutEvents,NULL)<0)
	aprintf("AjoutBoite", "Echec … la cr‚ation de la grille !");
  else
  {
	// Initialisation des valeurs via la structure et le DataExchange
	strcpy(b.szGermel, "GAM");
	b.iDilution = 0;
	b.iQuantite = 1;
	b.iNbBoites  = 1;
	b.iTypeMarquage = 0;
	AjoutDataExchange(0, fAjout, &b);
	
	CUC_FormShow(fAjout);
	CUC_FormExec(fAjout);
	CUC_FormDestruct(fAjout);
  }
  
  aprintf("","Germe:     %s|Dilution:  %d|Quantit‚:  %d|Nb boŒtes: %d|Type:      %d", b.szGermel, b.iDilution, b.iQuantite, b.iNbBoites, b.iTypeMarquage);

  return 0;
}

