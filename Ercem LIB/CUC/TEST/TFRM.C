// tfrm.c
// BibliothŠque CUC - Essai d'implantation d'une feuille de cont“les
// P.VIOLENT Juillet 94
//  4/12/94 PV  Version avec menus op‚rationnels

#include <stdio.h>
#include <curses.h>
#include <clib.ref>

#include <biberc.h>
#include "cuc.h"


// L'identification des contr“les de la feuille...
#define ESSAI           100
#define ID_HSB1         (ESSAI+1)
#define ID_VSB1         (ESSAI+2)  
#define ID_LBL1         (ESSAI+3)
#define ID_TXT1         (ESSAI+4)
#define ID_FRA1         (ESSAI+5)
#define optGauche       (ESSAI+6)
#define optCentre       (ESSAI+7)
#define optDroit        (ESSAI+8)
#define ID_FRM2         (ESSAI+9)
#define chbGras         (ESSAI+10)
#define chbSouligne     (ESSAI+11)
#define chbItalique     (ESSAI+12)
#define ID_LST1         (ESSAI+13)
#define ID_LBL2         (ESSAI+14)
#define ID_CBX1         (ESSAI+15)
#define ID_OK           (ESSAI+16)
#define ID_CANCEL       (ESSAI+17)
#define ID_G2           (ESSAI+18)
#define ID_TXT2         (ESSAI+19)
#define ID_LBL3         (ESSAI+20)

#define IDM_FICHIER     (ESSAI+30)
#define IDC_NOUVEAU     (ESSAI+31)
#define IDC_OUVRIR      (ESSAI+32)
#define IDC_ENREG       (ESSAI+33)
#define IDC_ENREGSOUS   (ESSAI+34)
#define IDC_IMPRIMER    (ESSAI+35)
#define IDC_OPTIMP      (ESSAI+36)
#define IDC_QUITTER     (ESSAI+37)

#define IDM_EDITION     (ESSAI+40)
#define IDC_ANNULER     (ESSAI+41)
#define IDC_COUPER      (ESSAI+42)
#define IDC_COPIER      (ESSAI+43)
#define IDC_COLLER      (ESSAI+44)
#define IDC_EFFACER     (ESSAI+45)
#define IDC_COLORIAGE   (ESSAI+46)

#define IDC_COLORC      (ESSAI+47)
#define IDC_COLORCPP    (ESSAI+48)
#define IDC_COLORAUCUN  (ESSAI+49)
#define IDC_COLORPERSO  (ESSAI+50)

#define IDC_CP1         (ESSAI+51)
#define IDC_CP2         (ESSAI+52)
#define IDC_CP3         (ESSAI+53)
#define IDC_CP4         (ESSAI+54)

#define IDM_RECHERCHER  (ESSAI+60)
#define IDC_RECHERCHER  (ESSAI+61)
#define IDC_REMPLACER   (ESSAI+62)

#define IDM_FORMAT      (ESSAI+70)
#define cmdGauche       (ESSAI+71)
#define cmdCentre       (ESSAI+72)
#define cmdDroit        (ESSAI+73)
#define cmdGras         (ESSAI+74)
#define cmdSouligne     (ESSAI+75)
#define cmdItalique     (ESSAI+76)

#define IDM_FENETRE     (ESSAI+100)
#define IDC_NOUVFEN     (ESSAI+99)
#define IDC_FIC1        (ESSAI+101)
#define IDC_FIC2        (ESSAI+102)
#define IDC_FIC3        (ESSAI+103)
#define IDC_FIC4        (ESSAI+104)
#define IDC_FIC5        (ESSAI+105)
#define IDC_FIC6        (ESSAI+106)
#define IDC_FIC7        (ESSAI+107)
#define IDC_FIC8        (ESSAI+108)
#define IDC_FIC9        (ESSAI+109)
#define IDC_FIC10       (ESSAI+110)
#define IDC_MOREFILE    (ESSAI+111)

#define IDM_AIDE        (ESSAI+80)
#define IDC_APROPOS     (ESSAI+81)
#define IDC_COMPTEUR    (ESSAI+82)


// La liste des contr“les
struct FormControl tEssaiControls[] =
{
  ESSAI,        CUCT_FORM,          2,  5,  17, 56, 0,       "Titre de la grille",
  ID_HSB1,      CUCT_HSCROLLBAR,    15, 1,  1,  54, ESSAI,   NULL,
  ID_VSB1,      CUCT_VSCROLLBAR,    2,  55, 13, 1,  ESSAI,   NULL,
  ID_LBL1,      CUCT_LABEL,         3,  2,  1,  15, ESSAI,   "&Nom du fichier:",
  ID_TXT1,      CUCT_TEXTEDIT,      2,  18, 3,  34, ESSAI,   "",
  ID_FRA1,      CUCT_FRAME,         5,  1,  5,  15, ESSAI,   "A&lignement",
  optGauche,    CUCT_OPTIONBUTTON,  1,  1,  1,  10, ID_FRA1, "&Gauche",
  optCentre,    CUCT_OPTIONBUTTON,  2,  1,  1,  10, ID_FRA1, "&Centr‚",
  optDroit,     CUCT_OPTIONBUTTON,  3,  1,  1,  10, ID_FRA1, "&Droit",
  ID_FRM2,      CUCT_FRAME,         5,  18, 5,  15, ESSAI,   "Forma&t",
  chbGras,      CUCT_CHECKBOX,      1,  1,  1,  13, ID_FRM2, "Gr&as",
  chbSouligne,  CUCT_CHECKBOX,      2,  1,  1,  13, ID_FRM2, "&Soulign‚",
  chbItalique,  CUCT_CHECKBOX,      3,  1,  1,  13, ID_FRM2, "&Italique",
  ID_LST1,      CUCT_LIST,          5,  35, 9,  17, ESSAI,   NULL,
  ID_LBL2,      CUCT_LABEL,         10, 2,  1,  6,  ESSAI,   "Ger&me:",
  ID_CBX1,      CUCT_COMBOBOX,      10, 9,  10, 6,  ESSAI,   "",
  ID_LBL3,      CUCT_LABEL,         10, 19, 1,  3,  ESSAI,   "N&o:",
  ID_TXT2,      CUCT_TEXTEDIT,      10, 23, 1,  5,  ESSAI,   "",
  ID_OK,        CUCT_COMMANDBUTTON, 13, 2,  1,  8,  ESSAI,   "O&k",
  ID_CANCEL,    CUCT_COMMANDBUTTON, 13, 11, 1,  11, ESSAI,   "Annule&r",
  ID_G2,        CUCT_COMMANDBUTTON, 13, 24, 1,  8,  ESSAI,   "G&2",
  -1
};


// La liste des menus
struct FormMenu tEssaiMenus[] =
{
  IDM_FICHIER,		"&Fichier",				0,          0,        0,
  IDC_NOUVEAU,		"&Nouveau",				0,          0,        IDM_FICHIER,
  IDC_OUVRIR,		"&Ouvrir...",			0,          0,        IDM_FICHIER,
  IDC_ENREG,		"&Enregistrer",			0,          0,        IDM_FICHIER,
  IDC_ENREGSOUS,	"En&registrer sous...",	0,          0,        IDM_FICHIER,
  0,				"",						0,          CUCM_SEP, IDM_FICHIER,
  IDC_IMPRIMER,		"&Imprimer",			KEY_CTRL_P, 0,        IDM_FICHIER,
  IDC_OPTIMP,		"&Options d'impression...", 0,      0,        IDM_FICHIER,
  0,				"",						0,          CUCM_SEP, IDM_FICHIER,
  IDC_QUITTER,		"&Quitter",             KEY_F(2),   0,        IDM_FICHIER,

  IDM_EDITION,		"&Edition",				0,          0,        0,
  IDC_ANNULER,		"&Annuler",				KEY_CTRL_Z, 0,        IDM_EDITION,
  0,				"",						0,          CUCM_SEP, IDM_EDITION,
  IDC_COUPER,		"&Couper",				KEY_CTRL_X, 0,        IDM_EDITION,
  IDC_COPIER,		"Copi&er",				KEY_CTRL_C, 0,        IDM_EDITION,
  IDC_COLLER,		"C&oller",				KEY_CTRL_V, 0,        IDM_EDITION,
  IDC_EFFACER,		"Ef&facer",				KEY_DELETE, 0,        IDM_EDITION,
  0,				"",						0,          CUCM_SEP, IDM_EDITION,
  IDC_COLORIAGE,	"Coloria&ge",			0,          0,        IDM_EDITION,
  
  IDC_COLORC,		"&C",					0,          0,        IDC_COLORIAGE,
  IDC_COLORCPP,		"C&++",					0,          0,        IDC_COLORIAGE,
  IDC_COLORAUCUN,	"&Aucun",				0,          0,        IDC_COLORIAGE,
  0,				"",						0,          CUCM_SEP, IDC_COLORIAGE,
  IDC_COLORPERSO,	"&Personnalis‚",		0,          0,        IDC_COLORIAGE,

  IDC_CP1,			"&1 Bleu",				0,          0,        IDC_COLORPERSO,
  IDC_CP2,			"&2 Vert",				0,          0,        IDC_COLORPERSO,
  IDC_CP3,			"&3 Rouge",				0,          0,        IDC_COLORPERSO,
  IDC_CP4,			"&4 Bariol‚ et de mauvais go–t", 0, 0,        IDC_COLORPERSO,
  
  IDM_FORMAT,		"Forma&t",				0,          0,        0,
  cmdGauche,		"&Gauche",				KEY_CTRL_G, 0,        IDM_FORMAT,
  cmdCentre,		"&Centre",				0,          0,        IDM_FORMAT,
  cmdDroit,			"&Droit",				0,          0,        IDM_FORMAT,
  0,				"",						0,          CUCM_SEP, IDM_FORMAT,
  cmdGras,			"Gr&as",				KEY_CTRL_A, 0,        IDM_FORMAT,
  cmdSouligne,		"&Soulign‚",			KEY_CTRL_U, 0,        IDM_FORMAT,
  cmdItalique,		"&Italique",			0,          0,        IDM_FORMAT,

  IDM_RECHERCHER,	"&Rechercher",			0,          0,        0,
  IDC_RECHERCHER,	"&Rechercher...",		KEY_CTRL_F, 0,        IDM_RECHERCHER,
  IDC_REMPLACER,	"&Remplacer...",		0,          0,        IDM_RECHERCHER,

  IDM_FENETRE,		"Fe&nˆtre",				0,          0,        0,
  IDC_NOUVFEN,		"&Nouvelle fenˆtre",    0,          0,        IDM_FENETRE,
  0,                "",						0,          CUCM_SEP, IDM_FENETRE,
  IDC_FIC1,			"&1  Nom document 1",	0,          0,        IDM_FENETRE,
  IDC_FIC2,			"&2  Nom document 2",	0,          0,        IDM_FENETRE,
  IDC_FIC3,			"&3  Nom document 3",	0,          0,        IDM_FENETRE,
  IDC_FIC4,			"&4  Nom document 4",	0,          0,        IDM_FENETRE,
  IDC_FIC5,			"&5  Nom document 5",	0,          0,        IDM_FENETRE,
  IDC_FIC6,			"&6  Nom document 6",	0,          0,        IDM_FENETRE,
  IDC_FIC7,			"&7  Nom document 7",	0,          0,        IDM_FENETRE,
  IDC_FIC8,			"&8  Nom document 8",	0,          0,        IDM_FENETRE,
  IDC_FIC9,			"&9  Nom document 9",	0,          0,        IDM_FENETRE,
  IDC_FIC10,		"1&0 Nom document 10",	0,          0,        IDM_FENETRE,
  IDC_MOREFILE,		"&Plus de fenêtres...",	0,          0,        IDM_FENETRE,
  
  IDM_AIDE,			"&Aide",				0,          0,        0,
  IDC_APROPOS,		"&A propos de...",		0,          0,        IDM_AIDE,
  IDC_COMPTEUR,		"",						0,          0,        IDM_AIDE,
  -1
};


// La feuille de test (pointeur d'accŠs)
struct CUC_Form         *fEssai;

// La structure de donn‚es pour le programme C d'application
struct DataEssai
{
  int   iHoriz;                 // Barre de d‚filement horizontale
  int   iVert;                  // Barre de d‚filement verticale
  char  szNomFic[60];           // TextEdit
  int   iAlignement;            // Cadre avec 3 options
  int   iGras;                  // Case … cocher
  int   iSouligne;              // "
  int   iItalique;              // "
  int   iProcesseur;            // Liste
  int   iGerme;                 // ComboBox
  int   iNo;                    // TextEdit num‚rique
} dEssai;


// La 2ème grille
#include "frm2.h"



//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
void EssaiDataExchange(int iUS, struct CUC_Form *f, struct DataEssai *d)
{
  DX_Value(iUS, f, ID_HSB1, &d->iHoriz);
  DX_Value(iUS, f, ID_VSB1, &d->iVert);
  DX_Text (iUS, f, ID_TXT1, d->szNomFic, sizeof(d->szNomFic));
  DX_Value(iUS, f, ID_FRA1, &d->iAlignement);
  DX_Value(iUS, f, chbGras, &d->iGras);
  DX_Value(iUS, f, chbSouligne, &d->iSouligne);
  DX_Value(iUS, f, chbItalique, &d->iItalique);
  DX_Value(iUS, f, ID_LST1, &d->iProcesseur);
  DX_Value(iUS, f, ID_CBX1, &d->iGerme);
  DX_Value(iUS, f, ID_TXT2, &d->iNo);
  
  // Menus
  if (iUS==0)
  { 
	CUC_FormSetPropNum(f, cmdGauche,   CUCP_CHECKED, d->iAlignement==optGauche);
	CUC_FormSetPropNum(f, cmdCentre,   CUCP_CHECKED, d->iAlignement==optCentre);
	CUC_FormSetPropNum(f, cmdDroit,    CUCP_CHECKED, d->iAlignement==optDroit);
	
	CUC_FormSetPropNum(f, cmdGras,     CUCP_CHECKED, d->iGras);
	CUC_FormSetPropNum(f, cmdSouligne, CUCP_CHECKED, d->iSouligne);
	CUC_FormSetPropNum(f, cmdItalique, CUCP_CHECKED, d->iItalique);
  }
}



// Proc‚dures d'‚v‚nements

// Sortie du programme, quel que soit le contr“le actif
void Essai_Key(int *piKey)
{
  if (KEY_F(1)==*piKey)
  { aprintf("Essai_Key", "F1");
	//CUC_FormDump(fEssai);
	*piKey = 0;
  }
  else if (KEY_CTRL_D==*piKey)
	CUC_FormExit(fEssai);      // Sortie de secours
}

// Saisie en majuscules pour TXT1
void TXT1_Key(int *piKey)
{
  if (*piKey>='a' && *piKey<='z') *piKey -= 32;
}

// S‚lection automatique quand le focus arrive sur TXT1
void TXT1_GotFocus()
{
  CUC_FormSetPropNum(fEssai, ID_TXT1, CUCP_SELSTART, 0);
  CUC_FormSetPropNum(fEssai, ID_TXT1, CUCP_SELLENGTH, 999);
}

// Pour afficher si le contr“le est en mode insertion ou non
void TXT1_InsModeChange(int iInsMode)
{
  aprintf("TXT_InsModeChange", "Mode insertion: %d", iInsMode);
}

// Saisie uniquement num‚rique
void TXT2_Key(int *piKey)
{
  if (*piKey>=32 && *piKey<=255 && *piKey!=127) // CaractŠre affichable
	if (*piKey<'0' || *piKey>'9') *piKey = 0;
}

// Clic sur bouton Ok
void OK_Clic()
{
  int iVal;

  aprintf("Bouton Ok", "Clic !");

  DX_Value(1, fEssai, ID_TXT2, &iVal);
  if (iVal>20)
  { aprintf("","Valeur de No (%d) incorrecte !|", iVal);
	CUC_FormSetActiveControl(fEssai, ID_TXT2);
	return;
  }

  CUC_FormExit(fEssai);

  // R‚cup‚ration des valeurs finales
  EssaiDataExchange(1, fEssai, &dEssai);
}

// Clic sur bouton annuler
void ANNULER_Clic()
{
  aprintf("Bouton Annuler", "Clic !");
  CUC_FormExit(fEssai);

  // On ne r‚cupŠre pas les valeurs des contr“les
}

// Initialisation des contr“les de la feuille
void Essai_Load()
{
  CUC_FormSetMinMax(fEssai, ID_HSB1, 0, 10, 2);
  CUC_FormSetMinMax(fEssai, ID_VSB1, optGauche, optDroit, 1);
  CUC_FormAddItem(fEssai, ID_LST1, "8088", -1);
  CUC_FormAddItem(fEssai, ID_LST1, "8086", -1);
  
  CUC_FormAddItem(fEssai, ID_LST1, "80186", -1);
  CUC_FormAddItem(fEssai, ID_LST1, "80286", -1);
  CUC_FormAddItem(fEssai, ID_LST1, "386", -1);
  CUC_FormAddItem(fEssai, ID_LST1, "486", -1);
  CUC_FormAddItem(fEssai, ID_LST1, "Pentium", -1);
  CUC_FormAddItem(fEssai, ID_LST1, "P6", -1);

  CUC_FormSetPropNum(fEssai, ID_CBX1, CUCP_STYLE, 2);   // Saisie limit‚e aux choix propos‚s
  CUC_FormSetPropNum(fEssai, ID_CBX1, CUCP_LISTWIDTH, 45);
  CUC_FormAddItem(fEssai, ID_CBX1, "GAM  Germes A‚robies M‚sophiles", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "C30  Coliformes 30ø (C.Totaux)", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "CTH  Coliformes Thermotol‚rants", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "SPP  Staphylocoques Pr‚sum‚s PathogŠnes", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "ASR  Ana‚robies Sulfito-r‚ducteurs (46ø)", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "ECO  Escherichia Coli", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "CF   Coliformes F‚caux", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "L+M  Levures et Moisissures", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "MOI  Moisissures", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "CPE  Clostidium perfrengens", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "ENT  Ent‚robact‚ries", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "SAL  Salmonelle", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "ASS  Ana‚robies Sulfito-r‚ducteurs sporul‚s", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "LEV  Levures", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "BCE  Bacilus Cereus", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "FTH  Flore Thermo", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "PSE  Pseudo", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "BHS  Staph sur BHS", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "SAB  Levures / moisissures sur SAB", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "STH  Str‚ptocoques h‚molytiques", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "SCP  Spores Clostridium Perfringens", -1);
  CUC_FormAddItem(fEssai, ID_CBX1, "STF  Streptocoques f‚caux", -1);

  CUC_FormSetPropNum(fEssai, ID_OK, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fEssai, ID_CANCEL, CUCP_CANCEL, 1);
}

// Synchronisation de la barre de d‚filement avec les options du cadre
// (pourquoi pas ?)
void VSB1_Change()
{
  CUC_FormSetPropNum(fEssai, ID_FRA1, CUCP_VALUE, CUC_FormGetPropNum(fEssai, ID_VSB1, CUCP_VALUE));
}

// Synchronisation du cadre avec les menus
void Alignement_Change()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  EssaiDataExchange(0, fEssai, &dEssai);
}


void cmdGauche_Command()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  dEssai.iAlignement = optGauche;
  EssaiDataExchange(0, fEssai, &dEssai);
}

void cmdCentre_Command()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  dEssai.iAlignement = optCentre;
  EssaiDataExchange(0, fEssai, &dEssai);
}

void cmdDroit_Command()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  dEssai.iAlignement = optDroit;
  EssaiDataExchange(0, fEssai, &dEssai);
}

void chbGras_Change()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  CUC_FormSetPropNum(fEssai, cmdGras, CUCP_CHECKED, dEssai.iGras);
}

void chbSouligne_Change()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  CUC_FormSetPropNum(fEssai, cmdSouligne, CUCP_CHECKED, dEssai.iSouligne);
}

void chbItalique_Change()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  CUC_FormSetPropNum(fEssai, cmdItalique, CUCP_CHECKED, dEssai.iItalique);
}

void cmdGras_Command()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  dEssai.iGras = !CUC_FormGetPropNum(fEssai, cmdGras, CUCP_CHECKED);
  EssaiDataExchange(0, fEssai, &dEssai);
}

void cmdSouligne_Command()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  dEssai.iSouligne =! CUC_FormGetPropNum(fEssai, cmdSouligne, CUCP_CHECKED);
  EssaiDataExchange(0, fEssai, &dEssai);
}

void cmdItalique_Command()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  dEssai.iItalique = !CUC_FormGetPropNum(fEssai, cmdItalique, CUCP_CHECKED);
  EssaiDataExchange(0, fEssai, &dEssai);
}

void G2_Clic()
{
  DoFormForm2();
}

void Quitter_Command()
{
  EssaiDataExchange(1, fEssai, &dEssai);
  CUC_FormExit(fEssai);
}


void Fenetre_DropDown()
{ 
  int i;
  
  EssaiDataExchange(1, fEssai, &dEssai);
  for (i=0 ; i<10 ; i++)
    CUC_FormSetPropNum(fEssai, IDC_FIC1+i, CUCP_VISIBLE, (i<dEssai.iNo));
  CUC_FormSetPropNum(fEssai, IDC_MOREFILE, CUCP_VISIBLE, (dEssai.iNo>10));
}

void Aide_DropDown()
{
  static int iNbOpenAide = 0;
  char szMenuItem[30];

  iNbOpenAide++;
  sprintf(szMenuItem, "Nb d'ouvertures: %d", iNbOpenAide);
  CUC_FormSetPropStr(fEssai, IDC_COMPTEUR, CUCP_CAPTION, szMenuItem);
}


void APropos_Command()
{
  aprintf("A propos de TFRM...", "|TFRM - Programme de test des formulaires|de la bibliothŠque CUC.|Version 1.1 du 4/12/94||(c) ERCEM, P.VIOLENT 1994|");
}



// Le tableau des ‚v‚nements et des proc‚dures d'‚v‚nements
// C'est plus commode de le placer aprŠs la liste des proc‚dures...
struct FormEvent tEssaiEvents[] =
{
  ESSAI,        CUCE_KEY,               Essai_Key,
  ESSAI,        CUCE_LOAD,              Essai_Load,

  ID_TXT1,      CUCE_KEY,               TXT1_Key,
  ID_TXT1,      CUCE_GOTFOCUS,          TXT1_GotFocus,
  ID_TXT1,      CUCE_INSMODECHANGE,     TXT1_InsModeChange,
  ID_TXT2,      CUCE_KEY,               TXT2_Key,
  ID_VSB1,      CUCE_CHANGE,            VSB1_Change,

  optGauche,    CUCE_CHANGE,            Alignement_Change,
  optCentre,    CUCE_CHANGE,            Alignement_Change,
  optDroit,     CUCE_CHANGE,            Alignement_Change,
  
  chbGras,      CUCE_CHANGE,            chbGras_Change,
  chbSouligne,  CUCE_CHANGE,            chbSouligne_Change,
  chbItalique,  CUCE_CHANGE,            chbItalique_Change,
  
  cmdGauche,    CUCE_COMMAND,           cmdGauche_Command,
  cmdCentre,    CUCE_COMMAND,           cmdCentre_Command,
  cmdDroit,     CUCE_COMMAND,           cmdDroit_Command,
  
  cmdGras,      CUCE_COMMAND,           cmdGras_Command,
  cmdSouligne,  CUCE_COMMAND,           cmdSouligne_Command,
  cmdItalique,  CUCE_COMMAND,           cmdItalique_Command,
  
  ID_OK,        CUCE_CLIC,              OK_Clic,
  ID_CANCEL,    CUCE_CLIC,              ANNULER_Clic,
  ID_G2,        CUCE_CHANGE,            G2_Clic,

  IDM_FENETRE,	CUCE_DROPDOWN,          Fenetre_DropDown,
  
  IDM_AIDE,     CUCE_DROPDOWN,          Aide_DropDown,
  IDC_APROPOS,  CUCE_COMMAND,           APropos_Command,
  IDC_QUITTER,  CUCE_COMMAND,           Quitter_Command,
  -1
};


// Test de la bonne gestion de la m‚moire...
// On ne compte pas les realloc, ils comptent pour rien dans le solde !
// Mais on définit quand même realloc, car dépend du modèle mémoire choisi !! (21/01/95 PV)

#ifndef UNIX

extern void *_fmalloc(size_t);
extern void *_frealloc(void *, size_t);
extern void _ffree(void *);

int sMalloc = 0;    // Solde d'allocations m‚moire

void *malloc(size_t size)
{
  sMalloc++;
  return _fmalloc(size);
}

void *realloc(void *p, size_t size)
{
  return _frealloc(p, size);
}

void free(void *m)
{
  sMalloc--;
  _ffree(m);
}

char *strdup(const char *s)
{
  sMalloc++;
  return _fstrdup(s);
}

#endif


int main()
{
  InitEcran();
  NoDelInterrupt();
//  signal(11,0);
  refresh();

  if (CUC_FormCreate(&fEssai,tEssaiControls,tEssaiEvents, tEssaiMenus)<0)
	aprintf("main", "Echec … la cr‚ation de la grille !");
  else
  {
	CUC_FormShow(fEssai);

	// Initialisation des valeurs via la structure et le DataExchange
	strcpy(dEssai.szNomFic, "NAVIRE.DOC");
	dEssai.iHoriz = 0;
	dEssai.iVert = optGauche;
	dEssai.iAlignement = optGauche;
	dEssai.iGras = 1;
	dEssai.iSouligne = 0;
	dEssai.iItalique = 0;
	dEssai.iProcesseur = 5;       // 486
	dEssai.iGerme = 0;            // GAM
	dEssai.iNo = 4;               // Pourquoi pas ?
	EssaiDataExchange(0, fEssai, &dEssai);
	
	// 'Fonctionnent' de la feuille
	CUC_FormExec(fEssai);
	
	CUC_FormDestruct(fEssai);
  }

  FinEcran();
  

  printf("Horizontal:     %d\n", dEssai.iHoriz);
  printf("Vertical:       %d\n", dEssai.iVert);
  printf("Nom de fichier: %s\n", dEssai.szNomFic);
  printf("Alignement:     %d (%s)\n", dEssai.iAlignement, dEssai.iAlignement==optGauche?"Gauche":dEssai.iAlignement==optCentre?"Droite":dEssai.iAlignement==optDroit?"Centre":"*** Iconnu !");
  printf("Gras:           %d\n", dEssai.iGras);
  printf("Soulign‚:       %d\n", dEssai.iSouligne);
  printf("Italique:       %d\n", dEssai.iItalique);
  printf("No processeur:  %d\n", dEssai.iProcesseur);
  printf("No germe:       %d\n", dEssai.iGerme);
  printf("No:             %d\n", dEssai.iNo);
  
#ifndef UNIX
  printf("\n\nSolde d'allocations m‚moire:  %d\n", sMalloc);
#endif
  
  return 0;
}
