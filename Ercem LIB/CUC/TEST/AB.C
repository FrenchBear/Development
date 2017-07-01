
#include <stdio.h>
#include <clib.ref>

#include <biberc.h>
#include <cuc.h>

// L'identification des contr“les de la feuille...
#define ID_LBL1         1
#define ID_LBL2         2  
#define ID_LBL3         3
#define ID_LBL4         4
#define ID_LBL5         5
#define ID_GERME        6
#define ID_DILUTION     7
#define ID_QTE          8
#define ID_NBBOITES     9
#define ID_TYPE         10

#define	ID_OK			20
#define	ID_CANCEL		21

// La liste des contr“les
struct FormControl tAjoutControls[] =
{
  ID_LBL1,		CUCT_LABEL,			2,	2,	1,	6,	0,	"&Germe:",
  ID_GERME,		CUCT_COMBOBOX,		3,	2,	10,	6,	0,	"",
  ID_DILUTION,	CUCT_TEXTEDIT,		3,	9,	1,	4,	0,	"",
  ID_OK,		CUCT_COMMANDBUTTON,	5,	23,	1,	8,	0,	"Ok",
  ID_CANCEL,	CUCT_COMMANDBUTTON,	5,	32,	1,	11,	0,	"Annuler",
  -1
};


// La feuille
struct CUC_Form         *fAjout;


// La structure de donn‚es pour le programme C d'application
struct DataAjout
{
  char	szGermel[4];
  int	iDilution;
} dAjout;


//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
void AjoutDataExchange(int iUS, struct CUC_Form *f, struct DataAjout *d)
{
  DX_Text (iUS, f, ID_GERME,    d->szGermel, sizeof(d->szGermel));
  DX_Value(iUS, f, ID_DILUTION, &d->iDilution);
}



// Proc‚dures d'‚v‚nements

// Clic sur bouton Ok
void OK_Clic()
{
  CUC_FormExitDoEvents(fAjout);

  // R‚cup‚ration des valeurs finales
  AjoutDataExchange(1, fAjout, &dAjout);
}

// Clic sur bouton annuler
void ANNULER_Clic()
{
  CUC_FormExitDoEvents(fAjout);

  // On ne r‚cupŠre pas les valeurs des contr“les
}


// Initialisation des contr“les de la feuille
void Ajout_Load()
{
  CUC_FormSetPropNum(fAjout, ID_GERME, CUCP_STYLE, 2);   // Saisie limit‚e aux choix propos‚s
  CUC_FormSetPropNum(fAjout, ID_GERME, CUCP_LISTWIDTH, 45);
  CUC_FormAddItem(fAjout, ID_GERME, "GAM  Germes A‚robies M‚sophiles", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "C30  Coliformes 30ø (C.Totaux)", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "CTH  Coliformes Thermotol‚rants", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "SPP  Staphylocoques Pr‚sum‚s PathogŠnes", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "ASR  Ana‚robies Sulfito-r‚ducteurs (46ø)", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "ECO  Escherichia Coli", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "CF   Coliformes F‚caux", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "L+M  Levures et Moisissures", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "MOI  Moisissures", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "CPE  Clostidium perfrengens", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "ENT  Ent‚robact‚ries", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "SAL  Salmonelle", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "ASS  Ana‚robies Sulfito-r‚ducteurs sporul‚s", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "LEV  Levures", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "BCE  Bacilus Cereus", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "FTH  Flore Thermo", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "PSE  Pseudo", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "BHS  Staph sur BHS", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "SAB  Levures / moisissures sur SAB", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "STH  Str‚pto. h‚molytique", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "SCP  Spores Clostridium Perfringens", -1);
  CUC_FormAddItem(fAjout, ID_GERME, "STF  Streptocoques f‚caux", -1);

  CUC_FormSetPropNum(fAjout, ID_OK, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fAjout, ID_CANCEL, CUCP_CANCEL, 1);
}


// Le tableau des ‚v‚nements et des proc‚dures d'‚v‚nements
// C'est plus commode de le placer aprŠs la liste des proc‚dures...
struct FormEvent tAjoutEvents[] =
{
  0,            CUCE_LOAD,              Ajout_Load,
  ID_OK,        CUCE_CHANGE,            OK_Clic,
  ID_CANCEL,    CUCE_CHANGE,            ANNULER_Clic,
  -1
};


int AjoutBoite()
{
  // Initialisation des donn‚es
  strcpy(dAjout.szGermel, "GAM");
  dAjout.iDilution = 0;

  if (CUC_FormCreate(&fAjout,5,5,6,45,"Titre",tAjoutControls,tAjoutEvents)<0)
	aprintf("AjoutBoite", "Echec … la cr‚ation de la grille !");
  else
  {
	CUC_FormShow(fAjout);

	// Initialisation des valeurs via la structure et le DataExchange
	AjoutDataExchange(0, fAjout, &dAjout);
	
	// 'Fonctionnent' de la feuille
	CUC_FormDoEvents(fAjout);
	
	CUC_FormDestruct(fAjout);
  }
  
  aprintf("","Germe:   %s|Dilution:   %d", dAjout.szGermel, dAjout.iDilution);

  return 0;
}

void main()
{
  InitEcran();
  NoDelInterrupt();
//  signal(11,0);
//  signal(3,0);

  AjoutBoite();

  FinEcran();
  exit(0);
}
