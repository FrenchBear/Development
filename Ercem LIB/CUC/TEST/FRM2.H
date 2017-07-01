// frm2.h
// Feuille CUC g‚n‚r‚e par VBDTOU le Sun Jul 10 15:18:47 1994

struct CUC_Form   *fForm2;			// Pointeur de feuille

#define FORM2            200		// Base des contr“les de la feuille
#define lblPolice        (FORM2+1)
#define txtPolice        (FORM2+2)
#define lstPolice        (FORM2+3)
#define lblStyle         (FORM2+4)
#define fraStyle         (FORM2+5)
#define optNormal        (FORM2+6)
#define optGras          (FORM2+7)
#define optItalique      (FORM2+8)
#define optGrasIt        (FORM2+9)
#define lblTaille        (FORM2+10)
#define cbxTaille        (FORM2+11)
#define fraEffets        (FORM2+12)
#define chb2Souligne      (FORM2+13)
#define chbBarre         (FORM2+14)
#define lblCouleur       (FORM2+15)
#define cbxCouleur       (FORM2+16)
#define btnOk            (FORM2+17)
#define btnAnnuler       (FORM2+18)
#define HSB              (FORM2+19)
#define VSB              (FORM2+20)


struct FormControl tForm2Controls[] =
{
  FORM2,           CUCT_FORM,          5 , 21, 17, 57, 0,               "Feuille cr‚‚e sous VB Dos",
  lblPolice,       CUCT_LABEL,         2 , 2 , 1 , 12, FORM2,           "&Police",
  txtPolice,       CUCT_TEXTEDIT,      3 , 2 , 1 , 18, FORM2,           "Arial",
  lstPolice,       CUCT_LIST,          4 , 2 , 5 , 18, FORM2,           "",
  lblStyle,        CUCT_LABEL,         2 , 22, 1 , 12, FORM2,           "St&yle",
  fraStyle,        CUCT_FRAME,         3 , 22, 6 , 19, FORM2,           "",
  optNormal,       CUCT_OPTIONBUTTON,  1 , 1 , 1 , 13, fraStyle,        "&Normal",
  optGras,         CUCT_OPTIONBUTTON,  2 , 1 , 1 , 13, fraStyle,        "&Gras",
  optItalique,     CUCT_OPTIONBUTTON,  3 , 1 , 1 , 13, fraStyle,        "&Italique",
  optGrasIt,       CUCT_OPTIONBUTTON,  4 , 1 , 1 , 17, fraStyle,        "G&ras Italique",
  lblTaille,       CUCT_LABEL,         2 , 43, 1 , 12, FORM2,           "&Taille",
  cbxTaille,       CUCT_COMBOBOX,      3 , 43, 6 , 10, FORM2,           "",
  fraEffets,       CUCT_FRAME,         9 , 2 , 4 , 18, FORM2,           "Effets",
  chb2Souligne,     CUCT_CHECKBOX,      1 , 1 , 1 , 14, fraEffets,       "&Soulign‚",
  chbBarre,        CUCT_CHECKBOX,      2 , 1 , 1 , 15, fraEffets,       "&Barr‚",
  lblCouleur,      CUCT_LABEL,         13, 2 , 1 , 18, FORM2,           "&Couleur",
  cbxCouleur,      CUCT_COMBOBOX,      14, 2 , 8 , 18, FORM2,           "",
  btnOk,           CUCT_COMMANDBUTTON, 12, 27, 3 , 12, FORM2,           "&Ok",
  btnAnnuler,      CUCT_COMMANDBUTTON, 12, 41, 3 , 12, FORM2,           "&Annuler",
  HSB,             CUCT_HSCROLLBAR,    15, 1 , 1 , 54, FORM2,           "",
  VSB,             CUCT_VSCROLLBAR,    1 , 54, 14, 2 , FORM2,           "",
  -1
};

// Configuration initiale des contr“les
void Form2_InitCtrl()
{
  CUC_FormSetPropNum(fForm2, btnOk, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fForm2, btnAnnuler, CUCP_CANCEL, 1);
  CUC_FormSetPropNum(fForm2, lblCouleur, CUCP_ALIGNMENT, 2);
  CUC_FormSetMinMax(fForm2, HSB, 0, 20, 1);
  CUC_FormSetPropNum(fForm2, HSB, CUCP_SMALLCHANGE, 1);
  CUC_FormSetPropNum(fForm2, HSB, CUCP_LARGECHANGE, 5);
  CUC_FormSetMinMax(fForm2, VSB, 10, 100, 1);
  CUC_FormSetPropNum(fForm2, VSB, CUCP_SMALLCHANGE, 1);
  CUC_FormSetPropNum(fForm2, VSB, CUCP_LARGECHANGE, 10);
};


// Proc‚dures d'‚v‚nement

void Form2_Load()
{
  Form2_InitCtrl();

  // Initialisations diverses

}

// Sortie de secours...
void Form2_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)
	CUC_FormExit(fForm2);
}

void Clic2()
{
  CUC_FormExit(fForm2);
}

struct FormEvent tForm2Events[] =
{
  FORM2,           CUCE_LOAD,            Form2_Load,
  FORM2,           CUCE_KEY,             Form2_Key,
  btnOk,           CUCE_CHANGE,          Clic2,
  btnAnnuler,      CUCE_CHANGE,          Clic2,
  -1
};




// Exploitation de la feuille

void DoFormForm2()
{
  if (CUC_FormCreate(&fForm2,tForm2Controls,tForm2Events,NULL)<0)
	aprintf("DoFormForm2", "Echec … la cr‚ation de la grille !");
  else
  { 
    CUC_FormDeactivate(fEssai);
    CUC_FormShow(fForm2);
	CUC_FormExec(fForm2);
	CUC_FormDestruct(fForm2);
	CUC_FormActivate(fEssai);
  }
}
