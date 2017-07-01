// Essai.h
// Feuille CUC g‚n‚r‚e par VBDTOU le Thu Jul 14 15:01:45 1994

struct CUC_Form   *fEssai;			// Pointeur de feuille

#define ESSAI            100		// Base des contr“les de la feuille
#define lblPolice        (ESSAI+1)
#define txtPolice        (ESSAI+2)
#define lstPolice        (ESSAI+3)
#define lblStyle         (ESSAI+4)
#define frmStyle         (ESSAI+5)
#define optNormal        (ESSAI+6)
#define optGras          (ESSAI+7)
#define optItalique      (ESSAI+8)
#define optGrasIt        (ESSAI+9)
#define lblTaille        (ESSAI+10)
#define cbxTaille        (ESSAI+11)
#define fraEffets        (ESSAI+12)
#define chbSouligne      (ESSAI+13)
#define chbBarre         (ESSAI+14)
#define lblCouleur       (ESSAI+15)
#define cbxCouleur       (ESSAI+16)
#define btnOk            (ESSAI+17)
#define btnAnnuler       (ESSAI+18)
#define HSB              (ESSAI+19)
#define VSB              (ESSAI+20)


struct FormControl tEssaiControls[] =
{
  ESSAI,           CUCT_FORM,          4 , 21, 17, 57, 0,               "Feuille cr‚‚e sous VB Dos",
  lblPolice,       CUCT_LABEL,         2 , 2 , 1 , 12, ESSAI,           "&Police",
  txtPolice,       CUCT_TEXTEDIT,      3 , 2 , 1 , 18, ESSAI,           "Arial",
  lstPolice,       CUCT_LIST,          4 , 2 , 5 , 18, ESSAI,           "",
  lblStyle,        CUCT_LABEL,         2 , 22, 1 , 12, ESSAI,           "&Style",
  frmStyle,        CUCT_FRAME,         3 , 22, 6 , 19, ESSAI,           "",
  optNormal,       CUCT_OPTIONBUTTON,  1 , 1 , 1 , 13, frmStyle,        "&Normal",
  optGras,         CUCT_OPTIONBUTTON,  2 , 1 , 1 , 13, frmStyle,        "&Gras",
  optItalique,     CUCT_OPTIONBUTTON,  3 , 1 , 1 , 13, frmStyle,        "&Italique",
  optGrasIt,       CUCT_OPTIONBUTTON,  4 , 1 , 1 , 17, frmStyle,        "G&ras Italique",
  lblTaille,       CUCT_LABEL,         2 , 43, 1 , 12, ESSAI,           "&Taille",
  cbxTaille,       CUCT_COMBOBOX,      3 , 43, 6 , 10, ESSAI,           "",
  fraEffets,       CUCT_FRAME,         9 , 2 , 4 , 18, ESSAI,           "Effets",
  chbSouligne,     CUCT_CHECKBOX,      1 , 1 , 1 , 14, fraEffets,       "&Soulign‚",
  chbBarre,        CUCT_CHECKBOX,      2 , 1 , 1 , 15, fraEffets,       "&Barr‚",
  lblCouleur,      CUCT_LABEL,         13, 2 , 1 , 18, ESSAI,           "&Couleur",
  cbxCouleur,      CUCT_COMBOBOX,      14, 2 , 8 , 18, ESSAI,           "",
  btnOk,           CUCT_COMMANDBUTTON, 12, 27, 3 , 12, ESSAI,           "&Ok",
  btnAnnuler,      CUCT_COMMANDBUTTON, 12, 41, 3 , 12, ESSAI,           "&Annuler",
  HSB,             CUCT_HSCROLLBAR,    15, 1 , 1 , 54, ESSAI,           "",
  VSB,             CUCT_VSCROLLBAR,    1 , 54, 14, 2 , ESSAI,           "",
  -1
};

// Configuration initiale des contr“les
void Essai_InitCtrl()
{
  CUC_FormSetPropNum(fEssai, lblCouleur, CUCP_ALIGNMENT, 2);
  CUC_FormSetPropNum(fEssai, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fEssai, btnAnnuler, CUCP_CANCEL, 1);
  CUC_FormSetMinMax(fEssai, HSB, 0, 20, 1);
  CUC_FormSetPropNum(fEssai, HSB, CUCP_SMALLCHANGE, 1);
  CUC_FormSetPropNum(fEssai, HSB, CUCP_LARGECHANGE, 5);
  CUC_FormSetMinMax(fEssai, VSB, 10, 100, 1);
  CUC_FormSetPropNum(fEssai, VSB, CUCP_SMALLCHANGE, 1);
  CUC_FormSetPropNum(fEssai, VSB, CUCP_LARGECHANGE, 10);
};


// Proc‚dures d'‚v‚nement

void Essai_Load()
{
  Essai_InitCtrl();

  // Initialisations diverses

}

// Sortie de secours...
void Essai_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)
	CUC_FormExit(fEssai);
}

struct FormEvent tEssaiEvents[] =
{
  ESSAI,           CUCE_LOAD,            Essai_Load,
  ESSAI,           CUCE_KEY,             Essai_Key,
  -1
};



// Exploitation de la feuille

void DoFormEssai()
{
  if (CUC_FormCreate(&fEssai,tEssaiControls,tEssaiEvents)<0)
	aprintf("DoFormEssai", "Echec … la cr‚ation de la grille !");
  else
  {
	// CUC_FormDeactivate(feuille_inferieure);
	CUC_FormShow(fEssai);

	CUC_FormExec(fEssai);
	CUC_FormDestruct(fEssai);
	// CUC_FormActivate(feuille_inferieure);
  }
}
