// sres.ec
// Saisie des r‚sultats au labo
//
// 29/10/94 PV
//

#include <stdio.h>
#include <ctype.h>
#include <time.h>
#include <clib.ref>

#include <cuc.h>
#include "formhelp.h"

#include <identif.h>		// Gestion des utilisateurs
#include <sqlplus.h>		// Compl‚ments pour le ESQLC

//====================================================================
// IDENTIFICATION DIVISION. (!)

char szNomApp[] = "sres 1.00";
static char szTitreApp[] = "Saisie des r‚sultats";

char	szSystemID[40], szNomOperateur[40];

#define CARTOUCHE Cartouche(szNomApp, szTitreApp, "")

//======================================================================
// Interface base de donn‚es

#include <esqlc.h>
#include <datetime.h>

#include <t_labcrat.h>
#include <t_seriedetail.h>

$struct T_LABCRAT r_lct;
$struct T_SERIEDETAIL r_sd;

//======================================================================
// Variables priv‚es

struct RECH
{
  char	szCB[19];				// Code Barre de la Fiche de Pr‚lŠvement
  char	szReference[12];		// R‚f‚rence d'analyse
  char	szNumEtb[6];			// Nø d'‚tablissement
  char	szPrefixe[11];
  char	szNomEtb[41];
  char	szDateDebAna[20];		// Date de d‚but d'analyse
};

struct RECH rech;

#define fin(s) (s+strlen(s))

// Nb maximum de r‚f‚rences lues par une recherche
#define MAXREF 100
struct REF
{
  char	szReference[12];
  char	szCritere[5];
  char	cEtat;
} tRef[MAXREF];

int iNbRef;

//======================================================================
// Feuille CUC g‚n‚r‚e par VBDTOU le Fri Oct 28 09:36:24 1994

struct CUC_Form   *fSRES;			// Pointeur de feuille

#define SRES             100		// Base des contr“les de la feuille
#define lblIdentif       (SRES+10)
#define lblCB            (SRES+11)
#define txtCB            (SRES+12)
#define lblReference     (SRES+13)
#define txtReference     (SRES+14)
#define lblEtablissement (SRES+15)
#define txtNumEtb        (SRES+16)
#define txtPrefixe       (SRES+17)
#define txtNomEtb        (SRES+18)
#define lblDateDebAna    (SRES+19)
#define txtDateDebAna    (SRES+20)
#define btnEffaceTout    (SRES+21)
#define btnRecherche     (SRES+22)
#define btnSuivant       (SRES+23)
#define lblAnalyses      (SRES+24)
#define lblNbAnalyses    (SRES+25)
#define lstAnalyses      (SRES+26)
#define lblHelp          (SRES+27)
#define lblLegende		 (SRES+28)


struct FormControl tSRESControls[] =
{
  SRES,            CUCT_FORM,           1,  0, 24, 80, 0,               "Saisie/Visualisation des r‚sultats",
  lblIdentif,      CUCT_LABEL,          1,  1,  1, 25, SRES,            "Identification du CRA:",
  lblCB,           CUCT_LABEL,          2,  3,  1, 14, SRES,            "&Code barre FP:",
  txtCB,           CUCT_TEXTEDIT,       2, 21,  1, 21, SRES,            "",
  lblReference,    CUCT_LABEL,          3,  3,  1, 19, SRES,            "&R‚f‚rence analyse:",
  txtReference,    CUCT_TEXTEDIT,       3, 21,  1, 14, SRES,            "",
  lblEtablissement,CUCT_LABEL,          4,  3,  1, 15, SRES,            "&Etablissement:",
  txtNumEtb,       CUCT_TEXTEDIT,       4, 21,  1,  8, SRES,            "",
  txtPrefixe,      CUCT_TEXTEDIT,       4, 28,  1, 12, SRES,            "",
  txtNomEtb,       CUCT_TEXTEDIT,       4, 40,  1, 39, SRES,            "",
  lblDateDebAna,   CUCT_LABEL,          5,  3,  1, 18, SRES,            "&Date analyse:",
  txtDateDebAna,   CUCT_TEXTEDIT,       5, 21,  1, 12, SRES,            "",
  btnEffaceTout,   CUCT_COMMANDBUTTON,  7,  1,  1, 20, SRES,            "F3: Effacer tout",
  btnRecherche,    CUCT_COMMANDBUTTON,  8,  1,  1, 17, SRES,            "F6: Recherche",
  btnSuivant,      CUCT_COMMANDBUTTON,  8, 21,  1, 41, SRES,            "F5: Recherche suivant: GK123456.02",
  lblNbAnalyses,   CUCT_LABEL,         10, 54,  1, 12, SRES,            "",
  lblAnalyses,     CUCT_LABEL,         10,  1,  1, 29, SRES,            "&R‚sultat de la recherche:",
  lblLegende,      CUCT_LABEL,         11,  3,  1, 64, SRES,            "R‚f‚rence   Crit Etat",
  lstAnalyses,     CUCT_LIST,          12,  2,  8, 64, SRES,            "",
  lblHelp,         CUCT_LABEL,         20,  1,  2, 65, SRES,            "Aide",
  -1
};

// Configuration initiale des contr“les
void SRES_InitCtrl()
{
#define ChampSaisie(c) CUC_FormSetPropNum(fSRES, c, CUCP_STDATTRIB, BRILLANT); CUC_FormSetPropNum(fSRES, c, CUCP_EOFCHAR, ' ');

  ChampSaisie(txtCB);
  ChampSaisie(txtReference);
  ChampSaisie(txtNumEtb);
  ChampSaisie(txtPrefixe);
  ChampSaisie(txtNomEtb);
  ChampSaisie(txtDateDebAna);
};

//======================================================================

void NouvelleRecherche()
{
  rech.szCB[0] = 0;
  rech.szReference[0] = 0;
  rech.szNumEtb[0] = 0;
  rech.szPrefixe[0] = 0;
  rech.szNomEtb[0] = 0;
  rech.szDateDebAna[0] = 0;

  CUC_FormSetPropStr(fSRES, txtCB, CUCP_TEXT, rech.szCB);
  CUC_FormSetPropStr(fSRES, txtReference, CUCP_TEXT, rech.szReference);
  CUC_FormSetPropStr(fSRES, txtNumEtb, CUCP_TEXT, rech.szNumEtb);
  CUC_FormSetPropStr(fSRES, txtPrefixe, CUCP_TEXT, rech.szPrefixe);
  CUC_FormSetPropStr(fSRES, txtNomEtb, CUCP_TEXT, rech.szNomEtb);
  CUC_FormSetPropStr(fSRES, txtDateDebAna, CUCP_TEXT, rech.szDateDebAna);
  CUC_FormSetPropStr(fSRES, lblNbAnalyses, CUCP_CAPTION, "");

  CUC_FormClear(fSRES, lstAnalyses);
  CUC_FormSetActiveControl(fSRES, txtCB);
}

//======================================================================

void DoRecherche()
{
  $char szsql[1000];
  char	szWP[1000];
  char	szTmp[500];
  int	bAnd;
  int	i;

  iNbRef = 0;

  // 1er temps: on cherche les infos dans seriedetail
  // Where-part de recherche dans seriedetail
  bAnd = 0;
  szWP[0] = 0;

  if (strlen(rech.szReference))
  { sqp_iQueryToSQL("sd_reference", rech.szReference, 'A', szTmp, sizeof(szTmp));
	strcat(szWP, szTmp);
	strcat(szWP, " ");
	bAnd = 1;
  }
  if (strlen(rech.szNumEtb))
  { if (bAnd) strcat(szWP, "and ");
	sqp_iQueryToSQL("sd_numetb", rech.szNumEtb, 'N', szTmp, sizeof(szTmp));
	strcat(szWP, szTmp);
	strcat(szWP, " ");
	bAnd = 1;
  }

  strcpy(szsql, "select sd_reference, sd_critere from seriedetail where ");
  strcat(szsql, szWP);

  $prepare PRech1 from $szsql;
  CTRLSQL;
  $declare CRech1 cursor for PRech1;
  CTRLSQL;
  $open CRech1;
  CTRLSQL;
  for(;;)
  {
	$fetch CRech1
	  into $r_sd.sd_reference, $r_sd.sd_critere;
	if (sqlca.sqlcode==100) break;
	CTRLSQL;

	strcpy(tRef[iNbRef].szReference, szRTrim(r_sd.sd_reference));
	strcpy(tRef[iNbRef].szCritere, szRTrim(r_sd.sd_critere));
	tRef[iNbRef].cEtat = '0';
	if (++iNbRef==MAXREF) break;
  }
  $close CRech1;
  CTRLSQL;
  $free CRech1;
  CTRLSQL;
  $free PRech1;
  CTRLSQL;

  // 2Šme temps: on cherche les infos dans labcrat
  // Where-part de recherche dans labcrat
  bAnd = 0;
  szWP[0] = 0;

  if (strlen(rech.szReference))
  { 
	sqp_iQueryToSQL("lct_ref", rech.szReference, 'A', szTmp, sizeof(szTmp));
	strcat(szWP, szTmp);
	strcat(szWP, " ");
	bAnd = 1;
  }
  if (strlen(rech.szNumEtb))
  { if (bAnd) strcat(szWP, "and ");
	sqp_iQueryToSQL("lct_numetb", rech.szNumEtb, 'N', szTmp, sizeof(szTmp));
	strcat(szWP, szTmp);
	strcat(szWP, " ");
	bAnd = 1;
  }

  strcpy(szsql, "select \
lct_ref, lct_datedebana, lct_codetech, \
lct_serieanalyse, lct_numetb, lct_critere, \
lct_vercrit, lct_commlabo, lct_classe, \
lct_daterecept, lct_temprecept, lct_etat, \
lct_validepar, lct_validele, lct_conclusion, \
lct_commconclusion \
from labcrat where ");
  strcat(szsql, szWP);

  $prepare PRech2 from $szsql;
  CTRLSQL;
  $declare CRech2 cursor for PRech2;
  CTRLSQL;
  $open CRech2;
  CTRLSQL;
  for(;;)
  {
	$fetch CRech2
	  into
		$r_lct.lct_ref, $r_lct.lct_datedebana, $r_lct.lct_codetech,
		$r_lct.lct_serieanalyse, $r_lct.lct_numetb, $r_lct.lct_critere,
		$r_lct.lct_vercrit, $r_lct.lct_commlabo, $r_lct.lct_classe,
		$r_lct.lct_daterecept, $r_lct.lct_temprecept, $r_lct.lct_etat,
		$r_lct.lct_validepar, $r_lct.lct_validele, $r_lct.lct_conclusion,
		$r_lct.lct_commconclusion;
	if (sqlca.sqlcode==100) break;
	CTRLSQL;

	if (iNbRef==MAXREF) break;

	strcpy(tRef[iNbRef].szReference, szRTrim(r_lct.lct_ref));
	strcpy(tRef[iNbRef].szCritere, szRTrim(r_lct.lct_critere));
	tRef[iNbRef].cEtat = r_lct.lct_etat[0];
	++iNbRef;
  }
  $close CRech2;
  CTRLSQL;
  $free CRech2;
  CTRLSQL;
  $free PRech2;
  CTRLSQL;

  CUC_FormClear(fSRES, lstAnalyses);
  for (i=0 ; i<iNbRef ; i++)
  {
	sprintf(szTmp, "%-11.11s  %-4.4s  %c", tRef[i].szReference, tRef[i].szCritere, tRef[i].cEtat);
    CUC_FormAddItem(fSRES, lstAnalyses, szTmp, -1);
  }
  if (iNbRef>0)
	CUC_FormSetActiveControl(fSRES, lstAnalyses);
}

//======================================================================
// Proc‚dures d'‚v‚nement

void SRES_Load()
{
  SRES_InitCtrl();
}

// Sortie de secours...
void SRES_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D || *piKey==KEY_F(2))
	CUC_FormExit(fSRES);
  else if (*piKey==KEY_F(3))
	NouvelleRecherche();
  else if (*piKey==KEY_F(6))
	DoRecherche();
}

void txtCB_Change()
{
  int iErr = 0;

  CUC_FormGetPropStr(fSRES, txtCB, CUCP_TEXT, rech.szCB, sizeof(rech.szCB));

  if (strlen(rech.szCB)==18)
  {
    int i, iCS, iCS2;
    int iSite, iPrest, iPrel, iIng, iEtb;
    static char cSite[] = "GAPMO";

    sscanf(rech.szCB, "%03d%06d%02d%05d%02d", &iSite, &iPrest, &iPrel, &iEtb, &iCS);

    iCS2 = 0;
    for (i=0 ; i<16 ; i++)
      iCS2 += (rech.szCB[i]-'0')*i;
    iCS2 %= 100;
    if (iCS!=iCS2)
    {
      aprintf("Code barre","Erreur de check-sum: lue: %d  recalcul‚e: %d", iCS, iCS2);
      iErr = 1;
    }
    else
    {
      iIng = iSite % 26;
      iSite /= 26;
      sprintf(rech.szReference, "%c%c%d.%02d", cSite[iSite], 'A'+iIng, iPrest, iPrel);
      sprintf(rech.szNumEtb, "%d", iEtb);

	  CUC_FormSetPropStr(fSRES, txtReference, CUCP_TEXT, rech.szReference);
	  CUC_FormSetPropStr(fSRES, txtNumEtb, CUCP_TEXT, rech.szNumEtb);
    }
  }
}

void txtCB_Key(int *piKey)
{ 
  if (*piKey==KEY_F(1))
  { strcpy(rech.szCB, "016071005012555948");
	CUC_FormSetPropStr(fSRES, txtCB, CUCP_TEXT, rech.szCB);
  }
  else if (*piKey==KEY_RETURN)
  {
	if (rech.szCB!=NULL)
	  if (strlen(rech.szCB)==18)
	  { DoRecherche();
		*piKey = 0;			// Evite le beep
	  }
  }
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSRES, txtReference);
  else
	fh_FiltreNum(piKey);
}

// Filtrage de la r‚f‚rence en majuscules,
// en attendant un filtrage plus sophistiqu‚
void txtReference_Key(int *piKey)
{
  if (*piKey>='a' && *piKey<='z')
	*piKey -= 32;
  else if (*piKey==KEY_F(5))	// A implanter
  { 
	aprintf("", "A implanter");
	*piKey = 0;
  }
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSRES, txtNumEtb);
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSRES, txtCB);
}


void txtReference_Change()
{
  CUC_FormGetPropStr(fSRES, txtReference, CUCP_TEXT, rech.szReference, sizeof(rech.szReference));
}


void txtNumEtb_Key(int *piKey)
{
  if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSRES, txtPrefixe);
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSRES, txtReference);
  else
	fh_FiltreNum(piKey);
}


void txtNumEtb_Change()
{
  $char szprefixe[11], sznometb[41];
  $int ietb;

  CUC_FormGetPropStr(fSRES, txtNumEtb, CUCP_TEXT, rech.szNumEtb, sizeof(rech.szNumEtb));
  if (rech.szNumEtb[0]==0) return;

  ietb = atoi(rech.szNumEtb);
  $select etb_prefixe, etb_nom
    into $szprefixe, $sznometb
    from etablissement
    where etb_numetb=$ietb;

  if (sqlca.sqlcode == 100)
  { strcpy(szprefixe, "***");
    strcpy(sznometb, "*** Etablissement inexistant !");
  }
  else
  { szRTrim(szprefixe);
    szRTrim(sznometb);
  }

  CUC_FormSetPropStr(fSRES, txtPrefixe, CUCP_TEXT, szprefixe);
  CUC_FormSetPropStr(fSRES, txtNomEtb, CUCP_TEXT, sznometb);
}


void txtPrefixe_Key(int *piKey)
{
  if (*piKey>='a' && *piKey<='z') *piKey -= 32;
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSRES, txtNomEtb);
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSRES, txtNumEtb);
}


void txtPrefixe_Change()
{
  CUC_FormGetPropStr(fSRES, txtPrefixe, CUCP_TEXT, rech.szPrefixe, sizeof(rech.szPrefixe));
}

void txtNomEtb_Key(int *piKey)
{
  if (*piKey>='a' && *piKey<='z') *piKey -= 32;
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSRES, txtDateDebAna);
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSRES, txtPrefixe);
}

void txtNomEtb_Change()
{
  CUC_FormGetPropStr(fSRES, txtNomEtb, CUCP_TEXT, rech.szNomEtb, sizeof(rech.szNomEtb));
}

void txtDateDebAna_Key(int *piKey)
{
  if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSRES, txtNomEtb);
  else if (*piKey!='/')
	fh_FiltreNum(piKey);
}


void lstAnalyses_Key(int *piKey)
{
  int iLigne;

  if (KEY_RETURN==*piKey)
  { char szRef[11], *p;
	iLigne = CUC_FormGetPropNum(fSRES, lstAnalyses, CUCP_LISTINDEX);
	CUC_FormGetPropStrInd(fSRES, lstAnalyses, CUCP_LIST, iLigne, szRef, sizeof(szRef));
    if (p=strchr(szRef, ' '))
	  *p = 0;
    if (p=strchr(szRef, '.'))
	  strdelnc(p, 1);
	DoSaisana(szRef);
	*piKey = 0;
  }

}

void SelChamp(int c)
{
  CUC_FormSetPropNum(fSRES, c, CUCP_SELSTART, 0);
  CUC_FormSetPropNum(fSRES, c, CUCP_SELLENGTH, 99);
}

void Info(char *szMessage)
{
  CUC_FormSetPropStr(fSRES, lblHelp, CUCP_CAPTION, szMessage);
}

void txtCB_GotFocus() { SelChamp(txtCB); Info("Entrer ou scanner le code barre de la fiche de pr‚lŠvement."); }
void txtReference_GotFocus() { SelChamp(txtReference); Info("Entrer la r‚f‚rence de l'analyse.|F5 incr‚mente automatiquement la r‚f‚rence pr‚c‚dente."); }
void txtNumEtb_GotFocus() { SelChamp(txtNumEtb); Info("Entrer le nø d'‚tablissement.|F5 reprend le nø d'‚tablissement de l'analyse pr‚c‚dente."); }
void txtPrefixe_GotFocus() { SelChamp(txtPrefixe); Info("Entrer le pr‚fixe de l'‚tablissement."); }
void txtNomEtb_GotFocus() { SelChamp(txtNomEtb); Info("Entrer le nom de l'‚tablissement."); }
void txtDateDebAna_GotFocus() { SelChamp(txtDateDebAna); Info("Entrer la date de d‚but d'analyse."); }

struct FormEvent tSRESEvents[] =
{
  SRES,           CUCE_LOAD,            SRES_Load,
  SRES,           CUCE_KEY,             SRES_Key,
  txtCB,          CUCE_KEY,             txtCB_Key,
  txtCB,          CUCE_CHANGE,          txtCB_Change,
  txtReference,   CUCE_KEY,             txtReference_Key,
  txtReference,   CUCE_CHANGE,          txtReference_Change,
  txtNumEtb,      CUCE_KEY,             txtNumEtb_Key,
  txtNumEtb,      CUCE_CHANGE,          txtNumEtb_Change,
  txtPrefixe,	  CUCE_KEY,				txtPrefixe_Key,
  txtPrefixe,	  CUCE_CHANGE,			txtPrefixe_Change,
  txtNomEtb,	  CUCE_KEY,				txtNomEtb_Key,
  txtNomEtb,	  CUCE_CHANGE,			txtNomEtb_Change,
  txtDateDebAna,  CUCE_KEY,             txtDateDebAna_Key,
  lstAnalyses,    CUCE_KEY,             lstAnalyses_Key,

  txtCB,          CUCE_GOTFOCUS,        txtCB_GotFocus,
  txtReference,   CUCE_GOTFOCUS,        txtReference_GotFocus,
  txtNumEtb,      CUCE_GOTFOCUS,        txtNumEtb_GotFocus,
  txtPrefixe,     CUCE_GOTFOCUS,		txtPrefixe_GotFocus,
  txtNomEtb,      CUCE_GOTFOCUS,		txtNomEtb_GotFocus,
  txtDateDebAna,  CUCE_GOTFOCUS,        txtDateDebAna_GotFocus,
  -1
};


// Exploitation de la feuille

void DoFormSRES()
{
  if (CUC_FormCreate(&fSRES,tSRESControls,tSRESEvents,NULL)<0)
	aprintf("DoFormSRES", "Echec … la cr‚ation de la grille !");
  else
  {
	// CUC_FormDeactivate(feuille_inferieure);
	CUC_FormShow(fSRES);

	CUC_FormExec(fSRES);
	CUC_FormDestruct(fSRES);
	// CUC_FormActivate(feuille_inferieure);
  }
}

/*====================================================================*/
/* Initialisations */

void InitEnv()
{
  GetEnvString("SYSTEMID", szSystemID, "(systŠme inconnu)");
  GetEnvString("TRA_NOM", szNomOperateur, "(sans nom)");

  id_LitUtilisateur();
}

void InitSQL()
{
  $database ercem;

  if (sqlca.sqlcode!=0)
  { char szMessage[200];

    sprintf(szMessage, "|PROBLEME GRAVE !||AccŠs … la base impossible.|Code erreur: %d|", sqlca.sqlerrd);
    fprintf(stderr, "%s: %s\n", szNomApp, szMessage);
    exit(1);
  }
}

//======================================================================

void main(int argc, char **argv)
{
  InitSQL();
  InitEnv();
  InitEcran();
  NoDelInterrupt();
  signal(11,0);
  signal(3,0);
  CartoucheStd(szNomApp);
  refresh();

  if (argc>1)
	DoSaisTest(argv[1]);
  else
	DoFormSRES();

  FinEcran();
  exit(0);
}

