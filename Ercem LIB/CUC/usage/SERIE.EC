// serie.ec
// Pr‚paration d'une s‚rie d'‚chantillons en vue de marquer les boŒtes
// 12/07/94 PV
// 27/09/94 PV	Utilisateurs dans la base de donn‚es
// 28/09/94 FG	Modif tables critere, criterel
// 26/10/94 PV	Observations
//
// @@TABLE(serielabo,seriedetail,serieboite,produit,etablissement)
// @@TABLE(critere,dilution,germelabo)

#include <stdio.h>
#include <ctype.h>
#include <time.h>
#include <clib.ref>

#include <cuc.h>

#include "serie.h"

//====================================================================

char szNomApp[] = "s‚rie 1.31";
char szTitreApp[] = "Marquage des boŒtes";

char	szSystemID[40], szNomOperateur[40];

#define CARTOUCHE Cartouche(szNomApp, szTitreApp, "")

int	iEch;	/* Echantillon courant, indice des tableaux suivants */
int	iBoite; /* BoŒte courante dans tBoites */

int iDirty;	// Donn‚es non imprim‚es

int iChargementValeurs;	// Enpˆcher le traitement des ‚v‚nements au moment du remplissage des contr“les

char	szTech[10];		// Initiales de la technicienne
int		iTech;

int		iNumSerie;		// No de la serie courante

#define MAXECH 20
struct ANALYSE
{
  char	szCodeBarre[19];
  char	szReference[12];
  char	szNumEtb[6];
  char	szPrefixe[11];
  char	szNomEtb[41];
  char	szCritere[5];
  char	szMethode[2];
  char	szNumPro[5];
  int	nbBoites;
  char	szObservations[251];
} tAnalyses[MAXECH];

#define	MAXBOITE 25
struct BOITE tBoites[MAXECH][MAXBOITE];


// Exemples
char	tszCodeBarreExemple[MAXECH][19] =
{ "016071005012555948",
  "016071005022555958",
  "016071005032555968",
  "016071005042555978",
  "016071012010058171",
  "016071013010058064",
  "016071014012960003",
  "016071009010057926",
  "016071010012959919",
};

char	tszCritereExemple[MAXECH][5] =
{ "A5", "A1", "Z5", "P7",
  "A1", "A1", "J1",
  "B2", "P4",
};

/*====================================================================*/

static void Info(char *szFormat, ...);

/*====================================================================*/

char *tszSansC30[] =
{
  "SFR", "SFS",			/* Sodexho */
  "EXP",				/* Expresself */
  "SOG",				/* Sogeres */
  "EUR",				/* Eurest */
  "ACC",				/* Accor */
  "REG",				/* Regiself */
  "LRP",				/* LRP */
  "MEL",				/* Melodine */
  "OR",					/* Orly */
  "CER",				/* Ceres */
  "MER",				/* Mercure */
  "SOF", "PUL", "ALT",	/* Sofitel, Pulmann, Altea */
  "NOV",				/* Novotel */
  "IBIS",				/* Ibis */
  "AUT",				/* Autoroutes */
  NULL
};

/*====================================================================*/
/* Structures d'interface avec la base de donn‚es */

#include "serieec.h"

//====================================================================
// Feuille principale
// Feuille CUC g‚n‚r‚e par VBDTOU le Mon Jul 11 18:40:06 1994

struct CUC_Form   *fSerie;			// Pointeur de feuille

#define SERIE            100		// Base des contr“les de la feuille
#define txtCB            (SERIE+1)
#define lblRef           (SERIE+2)
#define txtRef           (SERIE+3)
#define lblEtb           (SERIE+4)
#define txtNumEtb        (SERIE+5)
#define txtPrefixe       (SERIE+6)
#define txtNomEtb        (SERIE+7)
#define txtCritere       (SERIE+8)
#define lblTitCrit       (SERIE+9)
#define btnNouveau       (SERIE+10)
#define btnImprimer      (SERIE+11)
#define lblHelp          (SERIE+12)
#define lstBoites        (SERIE+13)
#define lblDetail        (SERIE+14)
#define lblAnalyses      (SERIE+15)
#define lstAnalyses      (SERIE+16)
#define lblCritere       (SERIE+17)
#define lblCB            (SERIE+18)
#define lblCompteur      (SERIE+19)
#define cbxTech          (SERIE+20)
#define lblTech          (SERIE+21)
#define lblBoites        (SERIE+22)
#define lblBoites2       (SERIE+23)
#define btnQuitter       (SERIE+24)
#define lblLegendeSerie  (SERIE+25)
#define lblNumSerie      (SERIE+26)
#define btnRecharger     (SERIE+27)
#define lblNumPro		 (SERIE+28)
#define txtNumPro		 (SERIE+29)
#define lblNomPro		 (SERIE+30)
#define btnObservations  (SERIE+31)
#define txtMethode       (SERIE+32)


struct FormControl tSerieControls[] =
{
  SERIE,           CUCT_FORM,          1 , 0 , 24, 80, 0,               "Pr‚paration d'une s‚rie",
  lblDetail,       CUCT_LABEL,         1 , 2 , 1 , 21, SERIE,           "D‚tail de l'analyse:",
  lblCB,           CUCT_LABEL,         2 , 3 , 1 , 12, SERIE,           "Code &Barre:",
  txtCB,           CUCT_TEXTEDIT,      2 , 18, 1 , 21, SERIE,           "",
  lblRef,          CUCT_LABEL,         3 , 3 , 1 , 11, SERIE,           "&R‚f‚rence:",
  txtRef,          CUCT_TEXTEDIT,      3 , 18, 1 , 14, SERIE,           "",
  lblEtb,          CUCT_LABEL,         4 , 3 , 1 , 14, SERIE,           "&Etablissement:",
  txtNumEtb,       CUCT_TEXTEDIT,      4 , 18, 1 , 8 , SERIE,           "",
  txtPrefixe,      CUCT_TEXTEDIT,      4 , 26, 1 , 12, SERIE,           "",
  txtNomEtb,       CUCT_TEXTEDIT,      4 , 38, 1 , 41, SERIE,           "",
  lblNumPro,       CUCT_LABEL,         5 , 3 , 1 , 12, SERIE,           "Num &Pro:",
  txtNumPro,       CUCT_TEXTEDIT,      5 , 18, 1 , 8 , SERIE,           "",
  lblNomPro,       CUCT_LABEL,         5 , 27, 1 , 52, SERIE,           "",
  lblCritere,      CUCT_LABEL,         6 , 3 , 1 , 12, SERIE,           "&CritŠre:",
  txtCritere,      CUCT_TEXTEDIT,      6 , 18, 1 , 6 , SERIE,           "",
  txtMethode,      CUCT_TEXTEDIT,      6 , 24, 1 , 4 , SERIE,           "",
  lblTitCrit,      CUCT_LABEL,         6 , 30, 1 , 49, SERIE,           "",
  lblAnalyses,     CUCT_LABEL,         8 , 2 , 1 , 9 , SERIE,           "&Analyses:",
  lblCompteur,     CUCT_LABEL,         8 , 12, 1 , 7 , SERIE,           "1",
  lstAnalyses,     CUCT_LIST,          9 , 1 , 14, 21, SERIE,           "",
  lblBoites,       CUCT_LABEL,         7 , 24, 1 , 10, SERIE,           "B&oites:",
  lblBoites2,      CUCT_LABEL,         8 , 24, 1 , 30, SERIE,           "Germe Dil  Qt‚   Nb Typ L‚g",
  lstBoites,       CUCT_LIST,          9 , 23, 14, 30, SERIE,           "",
  btnObservations, CUCT_COMMANDBUTTON, 7 , 56, 1 , 22, SERIE,           "F9: &Observations  ",
  btnNouveau,      CUCT_COMMANDBUTTON, 8 , 56, 1 , 22, SERIE,           "F3: &Nouveau       ",
  btnRecharger,    CUCT_COMMANDBUTTON, 9 , 56, 1 , 22, SERIE,           "F6: Rec&harger     ",
  btnImprimer,     CUCT_COMMANDBUTTON, 10, 56, 1 , 22, SERIE,           "F7: &Marquer       ",
  btnQuitter,      CUCT_COMMANDBUTTON, 11, 56, 1 , 22, SERIE,           "F2: &Quitter       ",
  lblHelp,         CUCT_LABEL,         13, 54, 9,  23, SERIE,           "",
  lblTech,         CUCT_LABEL,         1 , 28, 1 , 15, SERIE,           "&Technicien(ne):",
  cbxTech,         CUCT_COMBOBOX,      1 , 44, 14, 35, SERIE,           "",
  lblLegendeSerie, CUCT_LABEL,         2 , 45, 1 , 12, SERIE,           "No de s‚rie:",
  lblNumSerie,     CUCT_LABEL,		   2 , 59, 1,  5,  SERIE,           "",
  -1
};

// Configuration initiale des contr“les
void Serie_InitCtrl()
{
  CUC_FormSetPropNum(fSerie, lblCompteur, CUCP_ALIGNMENT, 1);
  CUC_FormSetPropNum(fSerie, cbxTech,	  CUCP_STYLE, 2);
  CUC_FormSetPropNum(fSerie, lstBoites,	  CUCP_TABSIZE, 5);
  // CUC_FormSetPropNum(fSerie, txtCritere,  CUCP_MAXLENGTH, 4);
  CUC_FormSetPropNum(fSerie, txtMethode,  CUCP_MAXLENGTH, 1);

  CUC_FormSetPropNum(fSerie, cbxTech,     CUCP_LISTWIDTH, 44);

#define ChampSaisie(c) CUC_FormSetPropNum(fSerie, c, CUCP_STDATTRIB, BRILLANT); CUC_FormSetPropNum(fSerie, c, CUCP_EOFCHAR, ' ');

  ChampSaisie(txtCB);
  ChampSaisie(txtRef);
  ChampSaisie(txtNumEtb);
  ChampSaisie(txtPrefixe);
  ChampSaisie(txtNomEtb);
  ChampSaisie(txtNumPro);
  ChampSaisie(txtCritere);
  ChampSaisie(txtMethode);
  ChampSaisie(cbxTech);
};

/*====================================================================*/
// Sous-programme utilitaire d'affichage et de consignage
// des erreurs SQL

void ErrSQL(char *szApp, char *szModule, char *szFormat, ...)
{
  char szMessage[500];
  static char szTitre[50] = "Erreur SQL !";

//printf("<%s><%s><%s>\n", szApp, szModule,szFormat);

  sprintf(szTitre, "%s: Erreur SQL !", szModule);
  vsprintf(szMessage, szFormat, (char *)((&szFormat)+1));
  sprintf(szMessage+strlen(szMessage), "||Code SQL: %d,  Code ISAM: %d|", 
    sqlca.sqlcode, sqlca.sqlerrd[2]);

  AlertOk(szTitre, szMessage);
  ErrorLog(szApp, szModule, szTitre, szMessage);
}

/*====================================================================*/
// Affichage d'un ‚chantillon

// Mise … jour de la liste des analyses
void AfficheOnglet()
{
  char szRefCritere[30];

  sprintf(szRefCritere, "%-11s %-4s %1s%c", tAnalyses[iEch].szReference, tAnalyses[iEch].szCritere, tAnalyses[iEch].szMethode, strlen(tAnalyses[iEch].szObservations)?'*':' ');
  CUC_FormSetPropNum(fSerie, lstAnalyses, CUCP_LISTINDEX, iEch);
  CUC_FormSetPropStr(fSerie, lstAnalyses, CUCP_TEXT, szRefCritere);
}


// R‚affichage de la liste des boŒtes
void AfficheBoites()
{
  int	iBoite;
  char	szLigne[60];

  CUC_FormClear(fSerie, lstBoites);

  for (iBoite=0 ; iBoite<tAnalyses[iEch].nbBoites ; iBoite++)
  {
	if (tBoites[iEch][iBoite].iGermel==-1)
	  sprintf(szLigne, "Sac de broyat     ");
	else
	{
	  sprintf(szLigne,    "%-3.3s ", tBoites[iEch][iBoite].szGermel);

	  if (tBoites[iEch][iBoite].iDilution==1)
		sprintf(szLigne+strlen(szLigne), "EP    ");
	  else if (tBoites[iEch][iBoite].iDilution==-32768)
		sprintf(szLigne+strlen(szLigne), "     ");
	  else
		sprintf(szLigne+strlen(szLigne),  " %2d  ",  tBoites[iEch][iBoite].iDilution);

	  if (tBoites[iEch][iBoite].iQuantite==-32768)
		sprintf(szLigne+strlen(szLigne), "         ");
	  else
		sprintf(szLigne+strlen(szLigne), "%4.1lf ml  ",    tBoites[iEch][iBoite].iQuantite/10.0);


	}
	sprintf(szLigne+strlen(szLigne), "%1d  ",  tBoites[iEch][iBoite].iNbBoites);
	sprintf(szLigne+strlen(szLigne), "%1d  ",  tBoites[iEch][iBoite].iTypeMarquage);
	sprintf(szLigne+strlen(szLigne), "%s",  tBoites[iEch][iBoite].szLegende);
	CUC_FormAddItem(fSerie, lstBoites, szLigne, -1);
  }
}


// R‚affichage complet d'un ‚chantillon et de ses boŒtes
void AfficheEchantillon()
{
  char szCompteur[3];

  iChargementValeurs = 1;

  CUC_FormSetPropStr(fSerie, txtCB, CUCP_TEXT, tAnalyses[iEch].szCodeBarre);
  CUC_FormSetPropStr(fSerie, txtRef, CUCP_TEXT, tAnalyses[iEch].szReference);
  CUC_FormSetPropStr(fSerie, txtNumEtb, CUCP_TEXT, tAnalyses[iEch].szNumEtb);
  CUC_FormSetPropStr(fSerie, txtPrefixe, CUCP_TEXT, tAnalyses[iEch].szPrefixe);
  CUC_FormSetPropStr(fSerie, txtNomEtb, CUCP_TEXT, tAnalyses[iEch].szNomEtb);
  CUC_FormSetPropStr(fSerie, txtNumPro, CUCP_TEXT, tAnalyses[iEch].szNumPro);
  CUC_FormSetPropStr(fSerie, txtCritere, CUCP_TEXT, tAnalyses[iEch].szCritere);
  CUC_FormSetPropStr(fSerie, txtMethode, CUCP_TEXT, tAnalyses[iEch].szMethode);

  sprintf(szCompteur, "%d", iEch+1);
  CUC_FormSetPropStr(fSerie, lblCompteur, CUCP_CAPTION, szCompteur);

  AfficheBoites();
  AfficheOnglet();
  CUC_FormDoEvents(fSerie);

  iChargementValeurs = 0;
}


static int compBAM(const struct BOITE **pp1, const struct BOITE **pp2)
{
  int iG1 = (*pp1)->iGermel;
  int iG2 = (*pp2)->iGermel;

  if (iG1==7) iG1 = 6;
  if (iG2==7) iG2 = 6;

  if (iG1!=iG2)
	return iG1 - iG2;
  else if ((*pp1)->iEch!=(*pp2)->iEch)
	return (*pp2)->iEch - (*pp1)->iEch;
  else
	return (*pp1)->iDilution-(*pp2)->iDilution;
}


static char *szNormRefBD(char *szRef)
{
  return szRef;
}

void PrepareImpression()
{
  int	i, j;
  FILE	*fSem;		// S‚maphore d'impression

  if (strlen(szTech)==0)
  { AlertOk("Impression impossible !","|Le technicien n'est pas d‚fini !|");
	CUC_FormSetActiveControl(fSerie, cbxTech);
	return;
  }

  // 1Šre passe: v‚rifications
  for (i=0 ; i<MAXECH ; i++)
  {
    if ((tAnalyses[i].szCritere[0] && tAnalyses[i].szReference[0]==0) ||
        (tAnalyses[i].szCritere[0]==0 && tAnalyses[i].szReference[0]))
    { 
      iEch = i;
      AfficheEchantillon();
      AlertOk("Impression impossible !","|La r‚f‚rence et le critŠre|doivent ˆtre saisis !|");
      return;
    }
    for (j=0 ; j<i ; j++)
      if (tAnalyses[i].szReference[0])
		if (strcmp(tAnalyses[i].szReference, tAnalyses[j].szReference)==0)
		{ 
		  iEch = i;
		  AfficheEchantillon();
		  AlertOk("Impression impossible !","|R‚f‚rence en double !|");
		  return;
		}
  }

  for (i=0 ; i<MAXECH ; i++)
  {
    if (tAnalyses[i].szReference[0] && tAnalyses[i].nbBoites<=1)
    { 
      iEch = i;
      AfficheEchantillon();
      AlertOk("Impression impossible !","|Aucune boŒte … imprimer pour cet|‚chantillon !||Le critŠre est-il correctement d‚fini ?|");
	  return;
	}

	// Recherche d'analyse d‚j… marqu‚e !
    strcpy(r_sd.sd_reference, tAnalyses[i].szReference);
	szNormRefBD(r_sd.sd_reference);

	$select sd_numserie, sd_numetb, sd_prefixe, sd_nometb
	  into $r_sd.sd_numserie, $r_sd.sd_numetb,
		   $r_sd.sd_prefixe, $r_sd.sd_nometb
	  from seriedetail
	  where sd_reference=$r_sd.sd_reference;

	if (sqlca.sqlcode!=100 && r_sd.sd_numserie!=iNumSerie)
	{
	  char szMessage[400];
	  int  iChoix;

	  $select ser_numserie, ser_numtech, ser_dh
		into $r_ser.ser_numserie, $r_ser.ser_numtech, $r_ser.ser_dh
		from serielabo
		where ser_numserie=$r_sd.sd_numserie;

      iEch = i;
      AfficheEchantillon();

      sprintf(szMessage, "Cette r‚f‚rence … d‚j… ‚t‚ marqu‚e dans|la s‚rie %d du %s|par %s (%d)|pour l'‚tablissement %d|%s %s||Il est actuellement possible d'ignorer|et de marquer la boŒte, mais cette|situation est anormale.|",
		r_ser.ser_numserie, r_ser.ser_dh, szIdToNom(r_ser.ser_numtech), r_ser.ser_numtech,
		r_sd.sd_numetb, szRTrim(r_sd.sd_prefixe), szRTrim(r_sd.sd_nometb));

	  iChoix = iAlert("ATTENTION - REFERENCE DEJA UTILISEE !", szMessage, 1, 1, "Corriger|Ignorer");

	  if (iChoix==1) return;
	}

  }

  // G‚n‚gartion de la liste en m‚moire pour pouvoir la trier
  nbBAM = 0;
  for (i=0 ; i<MAXECH ; i++)
	if (tAnalyses[i].szReference[0])
	  for (j=0 ; j<tAnalyses[i].nbBoites ; j++)
	  { strcpy(tBoites[i][j].szReference, tAnalyses[i].szReference);
		strcpy(tBoites[i][j].szCritere, tAnalyses[i].szCritere);
		strcpy(tBoites[i][j].szMethode, tAnalyses[i].szMethode);
		tBoites[i][j].iEch = i;
		tBAM[nbBAM++] = &tBoites[i][j];
	  }

  if (nbBAM==0)
  {
	AlertOk("Impression impossible !","|Rien … imprimer !|");
	return;
  }

  // On v‚rifie que personne d'autre n'imprime...
  fSem = fopen("cubitus.sem", "r");
  if (fSem!=NULL)
  {
	AlertOk("IMPRESSION IMPOSSIBLE !","|L'impression est en cours sur un autre ‚cran...|Attendez que l'autre ‚cran ait termin‚ avant d'imprimer !|");
	fclose(fSem);
	return;
  }

  fSem = fopen("cubitus.sem", "w");
  fprintf(fSem, "%u", getpid());
  fclose(fSem);

  // On trie les boŒtes par germe
  qsort(tBAM, nbBAM, sizeof(tBAM[0]), compBAM);

  CUC_FormDeactivate(fSerie);
  i = iImpression();
  CUC_FormActivate(fSerie);

  unlink("cubitus.sem");

  if (i>0)		// L'impression a eu lieu, on enregistre
  {
	r_ser.ser_numtech = iTech;
	UTtoYS(time(0L), r_ser.ser_dh);

	if (iNumSerie==0)	// 1Šre impression
	{ char szNumSerie[10];

	  r_ser.ser_numserie = 0;

	  $insert into serielabo(ser_numserie, ser_numtech, ser_dh)
		values($r_ser.ser_numserie, $r_ser.ser_numtech, $r_ser.ser_dh);
	  if (sqlca.sqlcode)
		ErrSQL(szNomApp, "serie.ec (PrepareImpression)", "Echec au insert serielabo !");
	  r_ser.ser_numserie = sqlca.sqlerrd[1];
	  sprintf(szNumSerie, "%d", r_ser.ser_numserie);
	  CUC_FormSetPropStr(fSerie, lblNumSerie, CUCP_CAPTION, szNumSerie);
	}
	else		// r‚impression
	{
	  r_ser.ser_numserie = iNumSerie;

	  // Mise … jour de l'enregistrement de serielabo
	  $update serielabo
		set
		  ser_numtech = $r_ser.ser_numtech,
		  ser_dh      = $r_ser.ser_dh
		where
		  ser_numserie = $r_ser.ser_numserie;
	  if (sqlca.sqlcode)
		ErrSQL(szNomApp, "serie.ec (PrepareImpression)", "Echec au update serielabo");
	  
	  // On parcourt les analyses correspondantes pour les effacer
	  $declare CEffSerie cursor for
		select sd_reference
		  into $r_sd.sd_reference
		  from seriedetail
		  where sd_numserie = $r_ser.ser_numserie
		for update;
	  if (sqlca.sqlcode)
		ErrSQL(szNomApp, "serie.ec (PrepareImpression)", "Echec au declare CEffSerie");
	  $open CEffSerie;
	  if (sqlca.sqlcode)
		ErrSQL(szNomApp, "serie.ec (PrepareImpression)", "Echec au open CEffSerie");
	  for(;;)
	  {
		$fetch CEffSerie;
		if (sqlca.sqlcode==100) break;

		if (sqlca.sqlcode)
		  ErrSQL(szNomApp, "serie.ec (PrepareImpression)", "Echec au fetch CEffSerie");

		$delete from serieboite where sb_reference = $r_sd.sd_reference;
		if (sqlca.sqlcode)
		  ErrSQL(szNomApp, "serie.ec (PrepareImpression)", "Echec au delete serieboite");
		$delete from seriedetail where current of CEffSerie;
		if (sqlca.sqlcode)
		  ErrSQL(szNomApp, "serie.ec (PrepareImpression)", "Echec au delete seriedetail");
	  }
	  $close CEffSerie;
	}

    iNumSerie = r_sd.sd_numserie = r_ser.ser_numserie;
	// On m‚morise la s‚rie des ‚chantillons
	for (i=0 ; i<MAXECH ; i++)
	  if (tAnalyses[i].szReference[0])
	  {
		r_sd.sd_numech = i+1;
		strcpy(r_sd.sd_codebarre, tAnalyses[i].szCodeBarre);
		strcpy(r_sd.sd_reference, tAnalyses[i].szReference);
		r_sd.sd_numetb = atoi(tAnalyses[i].szNumEtb);
		strcpy(r_sd.sd_prefixe, tAnalyses[i].szPrefixe);
		strcpy(r_sd.sd_nometb, tAnalyses[i].szNomEtb);
		strcpy(r_sd.sd_critere, tAnalyses[i].szCritere);
		strcpy(r_sd.sd_methode, tAnalyses[i].szMethode);
		strcpy(r_sd.sd_observations, tAnalyses[i].szObservations);

		$insert into seriedetail(sd_numserie, sd_numech,
			   sd_codebarre, sd_reference,
			   sd_numetb, sd_prefixe,
			   sd_nometb, sd_critere,
			   sd_observations)
		values($r_sd.sd_numserie, $r_sd.sd_numech,
			   $r_sd.sd_codebarre, $r_sd.sd_reference,
			   $r_sd.sd_numetb, $r_sd.sd_prefixe,
			   $r_sd.sd_nometb, $r_sd.sd_critere,
			   $r_sd.sd_observations);
		if (sqlca.sqlcode)
		  ErrSQL(szNomApp, "serie.ec (PrepareImpression)", "|Echec au insert seriedetail !||numserie:   %d|numech:     %d|code barre: %s|r‚f‚rence:  %s|num etb:    %d|prefixe+nom:%s %s|critŠre:    %s",
			  r_sd.sd_numserie, r_sd.sd_numech,
			  r_sd.sd_codebarre, r_sd.sd_reference,
			  r_sd.sd_numetb, r_sd.sd_prefixe,
			  r_sd.sd_nometb, r_sd.sd_critere);

		strcpy(r_sb.sb_reference, r_sd.sd_reference);
		strcpy(r_sb.sb_critere, r_sd.sd_critere);
		// Et pour chaque ‚chantillon, la s‚rie des boŒtes
		for (j=0 ; j<tAnalyses[i].nbBoites ; j++)
		{
		  r_sb.sb_igermel = tBoites[i][j].iGermel;
		  r_sb.sb_dilution = tBoites[i][j].iDilution;
		  r_sb.sb_quantite = tBoites[i][j].iQuantite;
		  r_sb.sb_nbboites = tBoites[i][j].iNbBoites;
		  r_sb.sb_typemarquage = tBoites[i][j].iTypeMarquage;
		  strcpy(r_sb.sb_legende, tBoites[i][j].szLegende);

		  $insert into serieboite(sb_reference, sb_critere,
				  sb_igermel, sb_dilution,
				  sb_quantite, sb_nbboites,
				  sb_typemarquage, sb_legende)
		   values($r_sb.sb_reference, $r_sb.sb_critere,
				  $r_sb.sb_igermel, $r_sb.sb_dilution,
				  $r_sb.sb_quantite, $r_sb.sb_nbboites,
				  $r_sb.sb_typemarquage, $r_sb.sb_legende);
		  if (sqlca.sqlcode)
			ErrSQL(szNomApp, "serie.ec (PrepareImpression)", "|Echec au insert serieboite !||R‚f‚rence:   %s|CritŠre:     %s|iGermel:     %d|dilution:    %d|Quantit‚:    %d|NbBoites:    %d|TypeMarquage:%d|L‚gende:     %s",
			  r_sb.sb_reference, r_sb.sb_critere, r_sb.sb_igermel, 
			  r_sb.sb_dilution, r_sb.sb_quantite, r_sb.sb_nbboites, 
			  r_sb.sb_typemarquage, r_sb.sb_legende);
		  
		} // Enregistrement des boŒtes dans serieboite
	  } // Enregistrement des ‚chantillons dans seriedetail
  } // L'impression a eu lieu, on enregistre
} // PrepareImpression

/*====================================================================*/
// Initialisation d'une nouvelle s‚rie

void EffaceAnalyse(int iAnalyse)
{
  tAnalyses[iAnalyse].szCodeBarre[0] = 0;
  tAnalyses[iAnalyse].szReference[0] = 0;
  tAnalyses[iAnalyse].szCritere[0] = 0;
  tAnalyses[iAnalyse].szMethode[0] = 0;
  tAnalyses[iAnalyse].szNumEtb[0] = 0;
  tAnalyses[iAnalyse].szPrefixe[0] = 0;
  tAnalyses[iAnalyse].szNomEtb[0] = 0;
  tAnalyses[iAnalyse].szNumPro[0] = 0;
  tAnalyses[iAnalyse].nbBoites = 0;
  tAnalyses[iAnalyse].szObservations[0] = 0;
}

void NouvelleSerie()
{
  iNumSerie = 0;
  CUC_FormSetPropStr(fSerie, lblNumSerie, CUCP_CAPTION, "");

  CUC_FormClear(fSerie, lstAnalyses);
  for (iEch=0 ; iEch<MAXECH ; iEch++)
  { EffaceAnalyse(iEch);
	CUC_FormAddItem(fSerie, lstAnalyses, "", -1);
  }

  iEch = 0;
  iDirty = 0;

  AfficheEchantillon();
  CUC_FormSetActiveControl(fSerie, cbxTech);
}

/*====================================================================*/
// Chargement d'une ancienne s‚rie

void RechargeSerie()
{
  $int	iserie;
  int	i, j;
  char	*p;

  CUC_FormDeactivate(fSerie);
  iserie = iOuvrir();
  CUC_FormActivate(fSerie);

  if (iserie)
  {
	char szNumSerie[10];

	// On efface tout
	NouvelleSerie();

	Info("Chargement de la s‚rie %d en cours...", iserie);
	CUC_FormRefresh(fSerie);

	iNumSerie = iserie;

	// On r‚cupŠre le nø de technicienne...
	$select ser_numtech into $r_ser.ser_numtech
	  from serielabo
	  where ser_numserie=$iserie;

	if (sqlca.sqlcode==100)
	{ aprintf("Echec au rechargement", "|S‚rie %d inconnue !|", iserie);
	  CUC_FormSetActiveControl(fSerie, txtCB);
	  return;
	}

	// On positionne le num‚ro de s‚rie … l'‚cran
	sprintf(szNumSerie, "%d", iNumSerie);
	CUC_FormSetPropStr(fSerie, lblNumSerie, CUCP_CAPTION, szNumSerie);

	// Et on affiche le nom correct dans la comboBox
	// Pas facile, il faut parcourir manuellement la liste...
	iTech = r_ser.ser_numtech;
	i = CUC_FormGetPropNum(fSerie, cbxTech, CUCP_LISTCOUNT);
	while (--i>=0)
	{ char szTechLong[60];
	  CUC_FormGetPropStrInd(fSerie, cbxTech, CUCP_LIST, i, szTechLong, sizeof(szTechLong));
	  p = strchr(szTechLong, '(');
	  if (p!=NULL) j = atoi(p+1);
	  if (j==iTech)
	  { CUC_FormSetPropNum(fSerie, cbxTech, CUCP_LISTINDEX, i);

		// On met … jour la variable globale szTech
		p = strchr(szTechLong, ' ');	// On tronque au 1er blanc
		if (p!=NULL)
		{ *p = 0;
		  strcpy(szTech, szTechLong);
		}
		else
		  szTech[0] = 0;
		break;
	  }
	}

	// On lit ensuite les analyses
	$declare CLitDetail cursor for
	  select sd_numech,
			 sd_codebarre, sd_reference,
			 sd_numetb, sd_prefixe,
			 sd_nometb, sd_critere,
			 sd_observations
		into $r_sd.sd_numech,
			 $r_sd.sd_codebarre, $r_sd.sd_reference,
			 $r_sd.sd_numetb, $r_sd.sd_prefixe,
			 $r_sd.sd_nometb, $r_sd.sd_critere,
			 $r_sd.sd_observations
		from seriedetail
		where sd_numserie=$iserie
		order by sd_numech;
	
	$open CLitDetail;
	if (sqlca.sqlcode)
	  ErrSQL(szNomApp, "RechargeSerie", "Echec au open CLitDetail.");
	for(iEch=0 ; ; iEch++)
	{
	  $char szgermel[4];

	  $fetch CLitDetail;
	  if (sqlca.sqlcode==100) break;
	  if (sqlca.sqlcode)
	    ErrSQL(szNomApp, "RechargeSerie", "Echec au fetch CLitDetail.");
	
	  strcpy(tAnalyses[iEch].szCodeBarre, szRTrim(r_sd.sd_codebarre));
	  strcpy(tAnalyses[iEch].szReference, szRTrim(r_sd.sd_reference));
	  sprintf(tAnalyses[iEch].szNumEtb, "%d", r_sd.sd_numetb);
	  strcpy(tAnalyses[iEch].szPrefixe, szRTrim(r_sd.sd_prefixe));
	  strcpy(tAnalyses[iEch].szNomEtb, szRTrim(r_sd.sd_nometb));
	  strcpy(tAnalyses[iEch].szCritere, szRTrim(r_sd.sd_critere));
	  strcpy(tAnalyses[iEch].szMethode, szRTrim(r_sd.sd_methode));
	  strcpy(tAnalyses[iEch].szObservations, szRTrim(r_sd.sd_observations));
	  tAnalyses[iEch].nbBoites = 0;

	  // Lecture des boŒtes
	  $declare CLitBoite cursor for
		select	sb_igermel, gl_germel,
				sb_dilution,
				sb_quantite, sb_nbboites,
				sb_typemarquage, sb_legende
		into	$r_sb.sb_igermel, $szgermel,
				$r_sb.sb_dilution,
				$r_sb.sb_quantite, $r_sb.sb_nbboites,
				$r_sb.sb_typemarquage, $r_sb.sb_legende
		from serieboite,outer germelabo
		where sb_reference=$r_sd.sd_reference and gl_ngermel=sb_igermel;

	  $open CLitBoite;
	  if (sqlca.sqlcode)
		ErrSQL(szNomApp, "RechargeSerie", "Echec au open CLitBoite.");
	  for(;;)
	  {
		$fetch CLitBoite;
		if (sqlca.sqlcode==100) break;
		if (sqlca.sqlcode)
		  ErrSQL(szNomApp, "RechargeSerie", "Echec au fetch CLitBoite.");

		tBoites[iEch][tAnalyses[iEch].nbBoites].iGermel = r_sb.sb_igermel;
		strcpy(tBoites[iEch][tAnalyses[iEch].nbBoites].szGermel, szRTrim(szgermel));
		tBoites[iEch][tAnalyses[iEch].nbBoites].iDilution = r_sb.sb_dilution;
		tBoites[iEch][tAnalyses[iEch].nbBoites].iQuantite = r_sb.sb_quantite;
		tBoites[iEch][tAnalyses[iEch].nbBoites].iNbBoites = r_sb.sb_nbboites;
		tBoites[iEch][tAnalyses[iEch].nbBoites].iTypeMarquage = r_sb.sb_typemarquage;
		strcpy(tBoites[iEch][tAnalyses[iEch].nbBoites].szLegende, szRTrim(r_sb.sb_legende));

		tAnalyses[iEch].nbBoites++;

	  }
	  $close CLitBoite;

	  AfficheOnglet();
	}
	$close CLitDetail;

	iEch = 0;
	AfficheEchantillon();

	CUC_FormSetActiveControl(fSerie, txtCB);
	iDirty = 0;
  }
}

/*====================================================================*/
// Proc‚dures d'‚v‚nement

void Serie_Load()
{
  int	i;
  char	szBuffer[50];

  Serie_InitCtrl();

  // Initialisation de la liste des techniciennes
  // Personnes autoris‚es … se connecter sur microbe, dont le nom ne
  // commence pas par ! (!MICROBE) ou par - (-DLM-)
  CUC_FormClear(fSerie, cbxTech);
  for (i=0 ; i<nbUtilisateur ; i++)
	if (strchr(tabUtilisateur[i].uti_systemes, 'R')!=NULL && tabUtilisateur[i].uti_nom[0]!='!' && tabUtilisateur[i].uti_nom[0]!='-')
	{ sprintf(szBuffer, "%-8s %-18s (%d)", tabUtilisateur[i].uti_bal, tabUtilisateur[i].uti_nom, tabUtilisateur[i].uti_numuti);
	  CUC_FormAddItem(fSerie, cbxTech, szBuffer, -1);
	}

  // Initialisation de la s‚rie
  NouvelleSerie();
}


static int iOkSuite()
{
  int iChoix;

  if (iDirty)
  {
	iChoix = iAlert("Attention !","|Les donn‚es ont ‚t‚ modifi‚es,|mais les boŒtes n'ont pas ‚t‚ marqu‚es.||Ok pour continuer ?|", 1, 2, "Ok|Annuler");
  }
	else iChoix = 1;

  // Test du flag Dirty
  if (iChoix==1)
	return 1;
  else
	return 0;
}


void btnNouveau_Clic()
{
  if (iOkSuite())
	NouvelleSerie();
}

void btnRecharger_Clic()
{
  if (iOkSuite())
	RechargeSerie();
}

void btnImprimer_Clic()
{
  PrepareImpression();
}

void btnQuitter_Clic()
{
  if (iOkSuite())
	CUC_FormExit(fSerie);
}

void btnObservations_Clic()
{
  char	szEchant[250];

  sprintf(szEchant, "Echantillon: %s\n             %s %s\n             %s %s",
	tAnalyses[iEch].szReference,
	tAnalyses[iEch].szCritere, tAnalyses[iEch].szMethode,
	tAnalyses[iEch].szPrefixe, tAnalyses[iEch].szNomEtb);

  CUC_FormDeactivate(fSerie);
  iObservations(szEchant, tAnalyses[iEch].szObservations,sizeof(tAnalyses[0].szObservations));
  CUC_FormActivate(fSerie);
  AfficheOnglet();
}

void Serie_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)
  {
	// Sortie de secours...
	CUC_FormExit(fSerie);
  }
  else if (*piKey==KEY_PGDN)
  {
	if (CUC_FormGetActiveControl(fSerie)!=cbxTech)
	  if (iEch<MAXECH-1)
	  { iEch++;
		AfficheEchantillon();
		CUC_FormSetActiveControl(fSerie, txtCB);
	  }
  }
  else if (*piKey==KEY_PGUP)
  {
	if (CUC_FormGetActiveControl(fSerie)!=cbxTech)
	  if (iEch>0)
	  { iEch--;
		AfficheEchantillon();
		CUC_FormSetActiveControl(fSerie, txtCB);
	  }
  }
  else if (*piKey==KEY_F(3))
	btnNouveau_Clic();
  else if (*piKey==KEY_F(6))
    btnRecharger_Clic();
  else if (*piKey==KEY_F(7))
    btnImprimer_Clic();
  else if (*piKey==KEY_F(9))
    btnObservations_Clic();
  else if (*piKey==KEY_F(2))	// Sortie
    btnQuitter_Clic();
}

// Filtrage de saisie num‚rique
void FiltreNum(int *piKey)
{
  if (*piKey>=32 && *piKey<=255 && *piKey!=127)	// CaractŠre affichable
	if (*piKey<'0' || *piKey>'9') *piKey = 0;
}


void txtCB_Change()
{
  int iErr = 0;

  if (iChargementValeurs) return;

  CUC_FormGetPropStr(fSerie, txtCB, CUCP_TEXT, tAnalyses[iEch].szCodeBarre, sizeof(tAnalyses[0].szCodeBarre));

  if (strlen(tAnalyses[iEch].szCodeBarre)==18)
  {
    int i, iCS, iCS2;
    int iSite, iPrest, iPrel, iIng, iEtb;
    static char cSite[] = "GAPMO";

    sscanf(tAnalyses[iEch].szCodeBarre, "%03d%06d%02d%05d%02d", &iSite, &iPrest, &iPrel, &iEtb, &iCS);

    iCS2 = 0;
    for (i=0 ; i<16 ; i++)
      iCS2 += (tAnalyses[iEch].szCodeBarre[i]-'0')*i;
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
      sprintf(tAnalyses[iEch].szReference, "%c%c%d.%02d", cSite[iSite], 'A'+iIng, iPrest, iPrel);
      sprintf(tAnalyses[iEch].szNumEtb, "%d", iEtb);

	  CUC_FormSetPropStr(fSerie, txtRef, CUCP_TEXT, tAnalyses[iEch].szReference);
	  CUC_FormSetPropStr(fSerie, txtNumEtb, CUCP_TEXT, tAnalyses[iEch].szNumEtb);
    }
  }
}

void txtCB_Key(int *piKey)
{ 
  if (*piKey==KEY_F(1))
  {
	if (tszCodeBarreExemple[iEch]!=NULL)
	{ strcpy(tAnalyses[iEch].szCodeBarre, tszCodeBarreExemple[iEch]);
	  CUC_FormSetPropStr(fSerie, txtCB, CUCP_TEXT, tAnalyses[iEch].szCodeBarre);
	  CUC_FormSetActiveControl(fSerie, txtCritere);
	}
  }
  else if (*piKey==KEY_RETURN)
  {
	if (tAnalyses[iEch].szCodeBarre!=NULL)
	  if (strlen(tAnalyses[iEch].szCodeBarre)==18)
	  { CUC_FormSetActiveControl(fSerie, txtCritere);
		*piKey = 0;			// Evite le beep
	  }
  }
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSerie, txtRef);
  else
	FiltreNum(piKey);
}

void txtNumEtb_Key(int *piKey)
{
  if (*piKey==KEY_F(5))
  { // Reprise automatique de l'‚tablissement pr‚c‚dent
    if (iEch>0)
	  CUC_FormSetPropStr(fSerie, txtNumEtb, CUCP_TEXT, tAnalyses[iEch-1].szNumEtb);
	*piKey = 0;
  }
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSerie, txtPrefixe);
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSerie, txtRef);
  else
	FiltreNum(piKey);
}

void txtNumEtb_Change()
{
  $char szprefixe[11], sznometb[41];
  $int ietb;

  if (iChargementValeurs) return;

  CUC_FormGetPropStr(fSerie, txtNumEtb, CUCP_TEXT, tAnalyses[iEch].szNumEtb, sizeof(tAnalyses[0].szNumEtb));

  ietb = atoi(tAnalyses[iEch].szNumEtb);
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

  CUC_FormSetPropStr(fSerie, txtPrefixe, CUCP_TEXT, szprefixe);
  CUC_FormSetPropStr(fSerie, txtNomEtb, CUCP_TEXT, sznometb);
}

static void PointeReference()
{
  char *szRef = tAnalyses[iEch].szReference;

  if ((strlen(szRef)==9 || strlen(szRef)==10) && strchr(szRef, '.')==NULL)
  {
	char szRefPointee[15];

	sprintf(szRefPointee, "%-.*s.%s", strlen(szRef)-2, szRef, szRef+strlen(szRef)-2);
	CUC_FormSetPropStr(fSerie, txtRef, CUCP_TEXT, szRefPointee);
	CUC_FormSetPropNum(fSerie, txtRef, CUCP_SELSTART, 99);
  }
}


// Filtrage de la r‚f‚rence en majuscules,
// en attendant un filtrage plus sophistiqu‚
void txtRef_Key(int *piKey)
{
  if (*piKey>='a' && *piKey<='z')
	*piKey -= 32;
  else if (*piKey==KEY_F(5))
  { // Incr‚mentation automatique de la r‚f‚rence pr‚c‚dente
    if (iEch>0)
	{
	  char szRef[20];

	  strcpy(szRef, tAnalyses[iEch-1].szReference);
	  if (strlen(szRef)>2)
		sprintf(szRef+strlen(szRef)-2, "%02d", 1+atoi(szRef+strlen(szRef)-2));
	  CUC_FormSetPropStr(fSerie, txtRef, CUCP_TEXT, szRef);
	}
	*piKey = 0;
  }
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSerie, txtNumEtb);
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSerie, txtCB);
  else if (*piKey==KEY_RETURN)
  { PointeReference();
	CUC_FormSetActiveControl(fSerie, txtCritere);
	*piKey = 0;
  }
}


void txtRef_Change()
{
  if (iChargementValeurs) return;

  CUC_FormGetPropStr(fSerie, txtRef, CUCP_TEXT, tAnalyses[iEch].szReference, sizeof(tAnalyses[0].szReference));
  AfficheOnglet();
  iDirty = 1;

}

void txtRef_LostFocus()
{
  PointeReference();
}

void txtPrefixe_Key(int *piKey)
{
  if (*piKey>='a' && *piKey<='z') *piKey -= 32;
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSerie, txtNomEtb);
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSerie, txtNumEtb);
}

void txtPrefixe_Change()
{
  if (iChargementValeurs) return;

  CUC_FormGetPropStr(fSerie, txtPrefixe, CUCP_TEXT, tAnalyses[iEch].szPrefixe, sizeof(tAnalyses[0].szPrefixe));
}

void txtNomEtb_Key(int *piKey)
{
  if (*piKey>='a' && *piKey<='z') *piKey -= 32;
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSerie, txtNumPro);
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSerie, txtPrefixe);
}

void txtNomEtb_Change()
{
  if (iChargementValeurs) return;

  CUC_FormGetPropStr(fSerie, txtNomEtb, CUCP_TEXT, tAnalyses[iEch].szNomEtb, sizeof(tAnalyses[0].szNomEtb));
}

void txtNumPro_Key(int *piKey)
{
  if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSerie, txtCritere);
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSerie, txtNomEtb);
  else
	FiltreNum(piKey);
}


void txtNumPro_Change()
{
  $int	inumpro;
  char	szNumPro[5];
  int	iOk = 0;
  int	n;
  int	i;

  CUC_FormGetPropStr(fSerie, txtNumPro, CUCP_TEXT, szNumPro, sizeof(szNumPro));
  inumpro = atoi(szNumPro);

  $select pro_nom, pro_critere
	into $r_pro.pro_nom, $r_pro.pro_critere
    from produit where pro_numpro=$inumpro;
  
  if (sqlca.sqlcode!=0)
    r_pro.pro_nom[0] = 0;
  else
  { iOk = 1;
	iDirty = 1;
  }
  CUC_FormSetPropStr(fSerie, lblNomPro, CUCP_CAPTION, r_pro.pro_nom);

  if (iChargementValeurs) return;

  CUC_FormSetPropStr(fSerie, txtCritere, CUCP_TEXT, szRTrim(r_pro.pro_critere));
  strcpy(tAnalyses[iEch].szNumPro, szNumPro);
}


void cbxTech_Key(int *piKey)
{
  if (*piKey==KEY_RETURN || *piKey==KEY_ESC)
  { CUC_FormCloseList(fSerie, cbxTech);
	CUC_FormSetActiveControl(fSerie, txtCB);
	*piKey = 0;			// Evite le beep
  }
}

void cbxTech_Change()
{
  char *p;
  char	szTechLong[60];

  CUC_FormGetPropStr(fSerie, cbxTech, CUCP_TEXT, szTechLong, sizeof(szTechLong));
  p = strchr(szTechLong, 40);	// Le nø est stock‚ entre parenthŠses
  if (p!=NULL)
	iTech = atoi(p+1);

  p = strchr(szTechLong, ' ');	// On tronque au 1er blanc
  if (p!=NULL)
  { *p = 0;
	strcpy(szTech, szTechLong);
  }
  else
	szTech[0] = 0;
}


// Saisie en majuscules
void txtCritere_Key(int *piKey)
{
  if (*piKey==KEY_F(1))
  {
    if (tszCritereExemple[iEch]!=NULL)
	  CUC_FormSetPropStr(fSerie, txtCritere, CUCP_TEXT, tszCritereExemple[iEch]);
  }
  else if (*piKey==KEY_RETURN)
  {
	if (iEch<MAXECH-1 && strlen(tAnalyses[iEch].szCritere))
	{ iEch++;
	  AfficheEchantillon();
	  CUC_FormSetActiveControl(fSerie, txtCB);
	}
	*piKey = 0;			// Evite le beep
  }
  else if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSerie, txtNumPro);
  else if (*piKey==KEY_DOWN)
	CUC_FormSetActiveControl(fSerie, txtMethode);
  else if (*piKey>='a' && *piKey<='z') *piKey -= 32;
}


void ApresModifCritere()
{
  $char	szcrit[5];
  $char	szmeth[2];
  int	iOk = 0;
  int	n;
  int	i;


  CUC_FormGetPropStr(fSerie, txtCritere, CUCP_TEXT, szcrit, sizeof(szcrit));
  CUC_FormGetPropStr(fSerie, txtMethode, CUCP_TEXT, szmeth, sizeof(szmeth));

  // Par d‚faut, m‚thode S
  if (szmeth[0]==0)
  { CUC_FormSetPropStr(fSerie, txtMethode, CUCP_TEXT, "S");
	strcpy(szmeth, "S");
  }

  $select cri_titre1 into $r_cri.cri_titre1
    from critere
	where cri_critere=$szcrit and
		  cri_version=1;
  
  if (sqlca.sqlcode!=0)
    r_cri.cri_titre1[0] = 0;
  else
  { iOk = 1;
	szRTrim(r_cri.cri_titre1);
	iDirty = 1;
  }

  CUC_FormSetPropStr(fSerie, lblTitCrit, CUCP_CAPTION, r_cri.cri_titre1);
  if (iChargementValeurs) return;

  strcpy(tAnalyses[iEch].szCritere, szcrit);
  strcpy(tAnalyses[iEch].szMethode, szmeth);
  AfficheOnglet();

  $declare cdil cursor for 
	select dil_germel, dil_dilution,
	   dil_quantite, dil_nbboites, dil_facteur,
	   dil_legende,
	   gl_ngermel, gl_typemarquage
	into $r_dil.dil_germel, $r_dil.dil_dilution,
	 $r_dil.dil_quantite, $r_dil.dil_nbboites, $r_dil.dil_facteur,
	 $r_dil.dil_legende,
	 $r_gl.gl_ngermel, $r_gl.gl_typemarquage
	from dilution,germelabo
	where dil_critere=$szcrit and dil_methode=$szmeth and gl_germel=dil_germel;
  if (sqlca.sqlcode<0)
  { ErrSQL(szNomApp, "ApresModifCritere", "Echec … la d‚claration du curseur SQL CDil.");
	return;
  }

  $open cdil;
  if (sqlca.sqlcode<0)
  { ErrSQL(szNomApp, "ApresModifCritere", "Echec … l'ouverture du curseur SQL CDil.");
	return;
  }

  tBoites[iEch][0].iGermel = -1;
  strcpy(tBoites[iEch][0].szGermel, "Bro");
  tBoites[iEch][0].iDilution = 0;
  tBoites[iEch][0].iQuantite = 0;
  tBoites[iEch][0].iNbBoites = 1;
  tBoites[iEch][0].iFacteur = 0;
  tBoites[iEch][0].iTypeMarquage = 4;
  strcpy(tBoites[iEch][0].szLegende, "");
  tAnalyses[iEch].nbBoites = 1;
  for(n=0 ; ; n++)
  {
	$fetch cdil;
	if (sqlca.sqlcode==100) break;

	if (n>=MAXBOITE)
	{ AlertOk("","25 boites maximum !");
	  break;
	}

	/* Exceptions pour les coliformes 30 */
	if (szcrit[0]!='O')		/* Pas d'exceptions pour les critŠres Ox */
	  for (i=0 ; tszSansC30[i]!=NULL ; i++)
		if (strncmp(tszSansC30[i], tAnalyses[iEch].szPrefixe, strlen(tszSansC30[i]))==0)
		  if (strcmp(r_dil.dil_germel, "C30")==0)
			{ i = -99;
			  break;
			}
		  if (i<0)
		continue;
	
	strcpy(tBoites[iEch][tAnalyses[iEch].nbBoites].szGermel, r_dil.dil_germel);
	tBoites[iEch][tAnalyses[iEch].nbBoites].iDilution = r_dil.dil_dilution;
	tBoites[iEch][tAnalyses[iEch].nbBoites].iQuantite = r_dil.dil_quantite;
	tBoites[iEch][tAnalyses[iEch].nbBoites].iNbBoites = r_dil.dil_nbboites;
	tBoites[iEch][tAnalyses[iEch].nbBoites].iFacteur = r_dil.dil_facteur;
	tBoites[iEch][tAnalyses[iEch].nbBoites].iGermel = r_gl.gl_ngermel;
	tBoites[iEch][tAnalyses[iEch].nbBoites].iTypeMarquage = r_gl.gl_typemarquage;
	strcpy(tBoites[iEch][tAnalyses[iEch].nbBoites].szLegende, r_dil.dil_legende);
	tAnalyses[iEch].nbBoites++;
  }
  $close cdil;

  AfficheBoites();
}

void txtCritere_Change()
{
  ApresModifCritere();
}

void txtMethode_Change()
{
  //aprintf("", "txtMethode_Change");
  ApresModifCritere();
}

// Filtre en acceptant uniquement S, J, A et E
void txtMethode_Key(int *piKey)
{
  if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fSerie, txtCritere);
  else if (*piKey>=32 && *piKey<=255)
  {
	if (*piKey>='a' && *piKey<='z')
	  *piKey -= 32;
	if (*piKey!='S' && *piKey!='J' && *piKey!='A' && *piKey!='E')
	  *piKey = 0;
  }
  //aprintf("", "*piKey: %d", *piKey);
}

void lstAnalyses_Change()
{
  if (iChargementValeurs) return;

  iEch = CUC_FormGetPropNum(fSerie, lstAnalyses, CUCP_LISTINDEX);
  AfficheEchantillon();
}

// Suppression/Insertion d'une analyse dans la liste
void lstAnalyses_Key(int *piKey)
{
  int	iAnalyse;
  int	i, j;

  switch(*piKey)
  {
	case '-':
	case KEY_DELETE:
	  iAnalyse = iEch;
	  CUC_FormRemoveItem(fSerie, lstAnalyses, -1);
	  CUC_FormAddItem(fSerie, lstAnalyses, "", -1);
	  while (++iAnalyse<MAXECH)
	  { tAnalyses[iAnalyse-1] = tAnalyses[iAnalyse];
		for (j=0 ; j<tAnalyses[iAnalyse].nbBoites ; j++)
		  tBoites[iAnalyse-1][j] = tBoites[iAnalyse][j];
	  }
	  EffaceAnalyse(MAXECH-1);
	  AfficheEchantillon();
	  break;

	case '+':
	case KEY_INSERT:
	  CUC_FormRemoveItem(fSerie, lstAnalyses, MAXECH-1);
	  CUC_FormAddItem(fSerie, lstAnalyses, "", iEch);
      iAnalyse = MAXECH-1;
	  while (--iAnalyse>=iEch)
	  { 
		tAnalyses[iAnalyse+1] = tAnalyses[iAnalyse];
		for (j=0 ; j<tAnalyses[iAnalyse].nbBoites ; j++)
		  tBoites[iAnalyse+1][j] = tBoites[iAnalyse][j];
	  }
	  EffaceAnalyse(iEch);
	  AfficheEchantillon();
	  break;
  }
}

void lstBoites_Key(int *piKey)
{
  int iBoite;

  switch(*piKey)
  {
	case '-':
	case KEY_DELETE:
	  if ((iBoite=CUC_FormGetPropNum(fSerie, lstBoites, CUCP_LISTINDEX))>=0)
	  {
		CUC_FormRemoveItem(fSerie, lstBoites, -1);
		while (++iBoite<tAnalyses[iEch].nbBoites)
		  tBoites[iEch][iBoite-1] = tBoites[iEch][iBoite];
		tAnalyses[iEch].nbBoites--;
	  }
	  break;

	case '+':
	case KEY_INSERT:
	  iAjoutBoite();
	  break;
  }
}

static void Info(char *szFormat, ...)
{
  char szBuffer[500];

  vsprintf(szBuffer, szFormat, (char *)((&szFormat)+1));
  CUC_FormSetPropStr(fSerie, lblHelp, CUCP_CAPTION, szBuffer);
}


void SelChamp(int c)
{
  CUC_FormSetPropNum(fSerie, c, CUCP_SELSTART, 0);
  CUC_FormSetPropNum(fSerie, c, CUCP_SELLENGTH, 99);
}

void txtCB_GotFocus() { SelChamp(txtCB); Info("Entrer ou scanner le code barre de la fiche de pr‚lŠvement."); }
void txtRef_GotFocus() { SelChamp(txtRef); Info("Entrer la r‚f‚rence de l'analyse.||F5 incr‚mente automatiquement la r‚f‚rence pr‚c‚dente."); }
void txtNumEtb_GotFocus() { SelChamp(txtNumEtb); Info("Entrer le nø d'‚tablissement.||F5 reprend le nø d'‚tablissement de l'analyse pr‚c‚dente."); }
void txtPrefixe_GotFocus() { SelChamp(txtPrefixe); Info("Entrer le pr‚fixe de l'‚tablissement."); }
void txtNomEtb_GotFocus() { SelChamp(txtNomEtb); Info("Entrer le nom de l'‚tablissement."); }
void txtNumPro_GotFocus() { SelChamp(txtNumPro); Info("Entrer le num‚ro de produit."); }
void txtCritere_GotFocus() { SelChamp(txtCritere); Info("Entrer le critŠre d'analyse mentionn‚ sur la fiche de pr‚lŠvement.||Entr‚e passe … l'analyse suivante aprŠs saisie."); }
void txtMethode_GotFocus() { SelChamp(txtMethode); Info("Entrer la m‚thode d'analyse.||S  Simplifi‚e|J  JO|A  AFNOR routine|E  AFNOR Expertise"); }
void lstAnalyses_GotFocus() { Info("S‚lectionner une analyse avec les touches de d‚placement.||+ insŠre une analyse.|- supprime une analyse."); }
void lstBoites_GotFocus() { Info("S‚lectionner la boŒte avec les flŠches.||+ Ajoute une boŒte.|- EnlŠve une boŒte.|Entr‚e modifie la boŒte."); }
void cbxTech_GotFocus() { Info("Taper la premiŠre lettre du pr‚nom et utiliser les flŠches pour s‚lectionner la personne qui traitera les analyses.||F4 d‚roule la liste."); }
void btnNouveau_GotFocus() { Info("Efface toutes les analyses et pr‚pare une nouvelle s‚rie."); }
void btnRecharger_GotFocus() { Info("Recharge les donn‚es d'une s‚rie pr‚c‚demment imprim‚e."); }
void btnImprimer_GotFocus() { Info("Lance la pr‚paration de l'impression."); }
void btnQuitter_GotFocus() { Info("Quitte ce programme."); }

//====================================================================
// Tableau des ‚v‚nements

struct FormEvent tSerieEvents[] =
{
  SERIE,			CUCE_LOAD,			Serie_Load,
  SERIE,			CUCE_KEY,			Serie_Key,
  txtCB,			CUCE_KEY,			txtCB_Key,
  txtCB,			CUCE_CHANGE,		txtCB_Change,
  txtRef,			CUCE_KEY,			txtRef_Key,
  txtRef,			CUCE_CHANGE,		txtRef_Change,
  txtRef,			CUCE_LOSTFOCUS,		txtRef_LostFocus,
  txtNumEtb,		CUCE_KEY,			txtNumEtb_Key,
  txtNumEtb,		CUCE_CHANGE,		txtNumEtb_Change,
  txtPrefixe,		CUCE_KEY,			txtPrefixe_Key,
  txtPrefixe,		CUCE_CHANGE,		txtPrefixe_Change,
  txtNomEtb,		CUCE_KEY,			txtNomEtb_Key,
  txtNomEtb,		CUCE_CHANGE,		txtNomEtb_Change,
  txtNumPro,		CUCE_KEY,			txtNumPro_Key,
  txtNumPro,		CUCE_CHANGE,		txtNumPro_Change,
  txtCritere,		CUCE_KEY,			txtCritere_Key,
  txtCritere,		CUCE_CHANGE,		txtCritere_Change,
  txtMethode,		CUCE_KEY,			txtMethode_Key,
  txtMethode,		CUCE_CHANGE,		txtMethode_Change,
  cbxTech,			CUCE_KEY,			cbxTech_Key,
  cbxTech,			CUCE_CHANGE,		cbxTech_Change,
  lstAnalyses,		CUCE_KEY,			lstAnalyses_Key,
  lstAnalyses,		CUCE_CHANGE,		lstAnalyses_Change,
  lstBoites,		CUCE_KEY,			lstBoites_Key,
  btnNouveau,		CUCE_CHANGE,		btnNouveau_Clic,
  btnRecharger,		CUCE_CHANGE,		btnRecharger_Clic,
  btnImprimer,		CUCE_CHANGE,		btnImprimer_Clic,
  btnQuitter,		CUCE_CHANGE,		btnQuitter_Clic,
  btnObservations,	CUCE_CHANGE,		btnObservations_Clic,
  txtCB,			CUCE_GOTFOCUS,		txtCB_GotFocus,
  txtRef,			CUCE_GOTFOCUS,		txtRef_GotFocus,
  txtNumEtb,		CUCE_GOTFOCUS,		txtNumEtb_GotFocus,
  txtPrefixe,		CUCE_GOTFOCUS,		txtPrefixe_GotFocus,
  txtNomEtb,		CUCE_GOTFOCUS,		txtNomEtb_GotFocus,
  txtNumPro,		CUCE_GOTFOCUS,		txtNumPro_GotFocus,
  txtCritere,		CUCE_GOTFOCUS,		txtCritere_GotFocus,
  txtMethode,		CUCE_GOTFOCUS,		txtMethode_GotFocus,
  lstAnalyses,		CUCE_GOTFOCUS,		lstAnalyses_GotFocus,
  lstBoites,		CUCE_GOTFOCUS,		lstBoites_GotFocus,
  btnNouveau,		CUCE_GOTFOCUS,		btnNouveau_GotFocus,
  btnRecharger,		CUCE_GOTFOCUS,		btnRecharger_GotFocus,
  btnImprimer,		CUCE_GOTFOCUS,		btnImprimer_GotFocus,
  btnQuitter,		CUCE_GOTFOCUS,		btnQuitter_GotFocus,
  cbxTech,			CUCE_GOTFOCUS,		cbxTech_GotFocus,
  -1
};

//====================================================================
// Exploitation de la feuille

void DoFormSerie()
{
  if (CUC_FormCreate(&fSerie,tSerieControls,tSerieEvents,NULL)<0)
	aprintf("DoFormSerie", "Echec … la cr‚ation de la grille !");
  else
  { CUC_FormShow(fSerie);
	CUC_FormExec(fSerie);
	CUC_FormDestruct(fSerie);
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


void main()
{
  InitSQL();
  InitEnv();
  InitEcran();
  NoDelInterrupt();
  signal(11,0);
  signal(3,0);
  CartoucheStd(szNomApp);
  refresh();

  DoFormSerie();

  FinEcran();
  exit(0);
}

