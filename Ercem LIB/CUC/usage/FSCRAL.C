// fscral.c
// Feuille de Saisie d'un CRA Labo
// 02/11/94 PV

#include <stdio.h>
#include <clib.ref>

#include <biberc.h>
#include <cuc.h>
#include "formhelp.h"

#include "escral.h"
#include <t_seriedetail.h>
extern struct T_SERIEDETAIL r_sd;

#include <crit.h>						// BibliothŠque des critŠres

#define NULL_INT -2147483648
#define NULL_SHORT -32768

//======================================================================
// Donn‚es priv‚es

static struct CRAL c;			// Record de travail: CRALabo id‚al
static struct CRIT *pCrit;		// Structure de donn‚es d'un critŠre

struct FormHelp tFHScral[];

#include "fscral.h"

//======================================================================

extern void DoEditeGermes();
extern void DoSaisieCritere();
extern void DoSaisieConclusion();

//======================================================================
// Feuille CUC g‚n‚r‚e par VBDTOU le Wed Nov 02 07:46:07 1994

struct CUC_Form   *fScral;			// Pointeur de feuille

#define SCRAL            200		// Base des contr“les de la feuille
#define lblEtiqReference (SCRAL+1)
#define lblReference     (SCRAL+2)
#define lblCritere       (SCRAL+3)
#define txtCritere       (SCRAL+4)
#define txtMethode       (SCRAL+5)
#define lblVerCrit       (SCRAL+68)
#define lblTitCrit       (SCRAL+6)
#define lblEtablissement (SCRAL+7)
#define txtNumEtb        (SCRAL+8)
#define lblNomEtb        (SCRAL+9)
#define lblPrefixe       (SCRAL+10)
#define lblDateDebAna    (SCRAL+11)
#define txtDateDebAna    (SCRAL+12)
#define lblResultats     (SCRAL+13)
#define lblNumGer0		 (SCRAL+70)
#define lblNumGer1		 (SCRAL+71)
#define lblNumGer2		 (SCRAL+72)
#define lblNumGer3		 (SCRAL+73)
#define lblNumGer4		 (SCRAL+74)
#define lblNumGer5		 (SCRAL+75)
#define lblNumGer6		 (SCRAL+76)
#define lblNumGer7		 (SCRAL+77)
#define lblNumGer8		 (SCRAL+78)
#define lblNumGer9		 (SCRAL+79)
#define lblGerme0        (SCRAL+20)
#define lblGerme1        (SCRAL+21)
#define lblGerme2        (SCRAL+22)
#define lblGerme3        (SCRAL+23)
#define lblGerme4        (SCRAL+24)
#define lblGerme5        (SCRAL+25)
#define lblGerme6        (SCRAL+26)
#define lblGerme7        (SCRAL+27)
#define lblGerme8        (SCRAL+28)
#define lblGerme9        (SCRAL+29)
#define txtResultat0     (SCRAL+30)
#define txtResultat1     (SCRAL+31)
#define txtResultat2     (SCRAL+32)
#define txtResultat3     (SCRAL+33)
#define txtResultat4     (SCRAL+34)
#define txtResultat5     (SCRAL+35)
#define txtResultat6     (SCRAL+36)
#define txtResultat7     (SCRAL+37)
#define txtResultat8     (SCRAL+38)
#define txtResultat9     (SCRAL+39)
#define lblCritere0      (SCRAL+40)
#define lblCritere1      (SCRAL+41)
#define lblCritere2      (SCRAL+42)
#define lblCritere3      (SCRAL+43)
#define lblCritere4      (SCRAL+44)
#define lblCritere5      (SCRAL+45)
#define lblCritere6      (SCRAL+46)
#define lblCritere7      (SCRAL+47)
#define lblCritere8      (SCRAL+48)
#define lblCritere9      (SCRAL+49)
#define lblCPar0         (SCRAL+50)
#define lblCPar1         (SCRAL+51)
#define lblCPar2         (SCRAL+52)
#define lblCPar3         (SCRAL+53)
#define lblCPar4         (SCRAL+54)
#define lblCPar5         (SCRAL+55)
#define lblCPar6         (SCRAL+56)
#define lblCPar7         (SCRAL+57)
#define lblCPar8         (SCRAL+58)
#define lblCPar9         (SCRAL+59)
#define lblSpecifCli0	 (SCRAL+80)
#define lblSpecifCli1	 (SCRAL+81)
#define lblSpecifCli2	 (SCRAL+82)
#define lblSpecifCli3	 (SCRAL+83)
#define lblSpecifCli4	 (SCRAL+84)
#define lblSpecifCli5	 (SCRAL+85)
#define lblSpecifCli6	 (SCRAL+86)
#define lblSpecifCli7	 (SCRAL+87)
#define lblSpecifCli8	 (SCRAL+88)
#define lblSpecifCli9	 (SCRAL+89)
#define lblConclusion    (SCRAL+60)
#define txtConclusion    (SCRAL+61)
#define lblEtiqCPrin     (SCRAL+90)
#define lblCTrafiquee    (SCRAL+91)
#define lblCPrin         (SCRAL+92)
#define lblObservations  (SCRAL+62)
#define txtObservations  (SCRAL+63)
#define btnOk            (SCRAL+64)
#define btnAnnuler       (SCRAL+65)
#define btnEditeGermes   (SCRAL+66)
#define btnInterprete    (SCRAL+69)
#define lblAide          (SCRAL+67)


struct FormControl tScralControls[] =
{
  SCRAL,			CUCT_FORM,			1 , 0 , 24, 80, 0,     "Saisie/modification d'un CRA",
  lblEtiqReference,	CUCT_LABEL,			1 , 1 , 1 , 12, SCRAL, "&R‚f‚rence:",
  lblReference,		CUCT_LABEL,			1 , 17, 1 , 11, SCRAL, "",
  lblCritere,		CUCT_LABEL,			2 , 1 , 1 , 12, SCRAL, "Cr&itŠre:",
  txtCritere,		CUCT_TEXTEDIT,      2 , 17, 1 , 7 , SCRAL, "",
  txtMethode,		CUCT_TEXTEDIT,      2 , 24, 1 , 4 , SCRAL, "",
  lblVerCrit,		CUCT_LABEL,			2 , 29, 1 , 3 , SCRAL, "",
  lblTitCrit,		CUCT_LABEL,			2 , 32, 1 , 40, SCRAL, "",
  lblEtablissement,	CUCT_LABEL,			3 , 1 , 1 , 14, SCRAL, "&Etablissement:",
  txtNumEtb,		CUCT_TEXTEDIT,      3 , 17, 1 , 7 , SCRAL, "",
  lblNomEtb,		CUCT_LABEL,			3 , 39, 1 , 33, SCRAL, "",
  lblPrefixe,		CUCT_LABEL,			3 , 29, 1 , 10, SCRAL, "",
  lblDateDebAna,	CUCT_LABEL,			4 , 1 , 1 , 15, SCRAL, "&Date d'analyse:",
  txtDateDebAna,	CUCT_TEXTEDIT,      4 , 17, 1 , 13, SCRAL, "",
  lblResultats,		CUCT_LABEL,			5 , 1 , 1 , 76, SCRAL, "R‚&sultats:                              R‚sultat     CritŠre    CPar  Spec",
  lblNumGer0,		CUCT_LABEL,			6 , 1 , 1 , 3 , SCRAL, "",
  lblNumGer1,		CUCT_LABEL,			7 , 1 , 1 , 3 , SCRAL, "",
  lblNumGer2,		CUCT_LABEL,			8 , 1 , 1 , 3 , SCRAL, "",
  lblNumGer3,		CUCT_LABEL,			9 , 1 , 1 , 3 , SCRAL, "",
  lblNumGer4,		CUCT_LABEL,			10, 1 , 1 , 3 , SCRAL, "",
  lblNumGer5,		CUCT_LABEL,			11, 1 , 1 , 3 , SCRAL, "",
  lblNumGer6,		CUCT_LABEL,			12, 1 , 1 , 3 , SCRAL, "",
  lblNumGer7,		CUCT_LABEL,			13, 1 , 1 , 3 , SCRAL, "",
  lblNumGer8,		CUCT_LABEL,			14, 1 , 1 , 3 , SCRAL, "",
  lblNumGer9,		CUCT_LABEL,			15, 1 , 1 , 3 , SCRAL, "",
  lblGerme0,		CUCT_LABEL,			6 , 4 , 1 , 34, SCRAL, "",
  lblGerme1,		CUCT_LABEL,			7 , 4 , 1 , 34, SCRAL, "",
  lblGerme2,		CUCT_LABEL,			8 , 4 , 1 , 34, SCRAL, "",
  lblGerme3,		CUCT_LABEL,			9 , 4 , 1 , 34, SCRAL, "",
  lblGerme4,		CUCT_LABEL,			10, 4 , 1 , 34, SCRAL, "",
  lblGerme5,		CUCT_LABEL,			11, 4 , 1 , 34, SCRAL, "",
  lblGerme6,		CUCT_LABEL,			12, 4 , 1 , 34, SCRAL, "",
  lblGerme7,		CUCT_LABEL,			13, 4 , 1 , 34, SCRAL, "",
  lblGerme8,		CUCT_LABEL,			14, 4 , 1 , 34, SCRAL, "",
  lblGerme9,		CUCT_LABEL,			15, 4 , 1 , 34, SCRAL, "",
  txtResultat0,		CUCT_TEXTEDIT,      6 , 39, 1 , 12, SCRAL, "",
  txtResultat1,		CUCT_TEXTEDIT,      7 , 39, 1 , 12, SCRAL, "",
  txtResultat2,		CUCT_TEXTEDIT,      8 , 39, 1 , 12, SCRAL, "",
  txtResultat3,		CUCT_TEXTEDIT,      9 , 39, 1 , 12, SCRAL, "",
  txtResultat4,		CUCT_TEXTEDIT,      10, 39, 1 , 12, SCRAL, "",
  txtResultat5,		CUCT_TEXTEDIT,      11, 39, 1 , 12, SCRAL, "",
  txtResultat6,		CUCT_TEXTEDIT,      12, 39, 1 , 12, SCRAL, "",
  txtResultat7,		CUCT_TEXTEDIT,      13, 39, 1 , 12, SCRAL, "",
  txtResultat8,		CUCT_TEXTEDIT,      14, 39, 1 , 12, SCRAL, "",
  txtResultat9,		CUCT_TEXTEDIT,      15, 39, 1 , 12, SCRAL, "",
  lblCritere0,		CUCT_LABEL,			6 , 52, 1 , 10, SCRAL, "",
  lblCritere1,		CUCT_LABEL,			7 , 52, 1 , 10, SCRAL, "",
  lblCritere2,		CUCT_LABEL,			8 , 52, 1 , 10, SCRAL, "",
  lblCritere3,		CUCT_LABEL,			9 , 52, 1 , 10, SCRAL, "",
  lblCritere4,		CUCT_LABEL,			10, 52, 1 , 10, SCRAL, "",
  lblCritere5,		CUCT_LABEL,			11, 52, 1 , 10, SCRAL, "",
  lblCritere6,		CUCT_LABEL,			12, 52, 1 , 10, SCRAL, "",
  lblCritere7,		CUCT_LABEL,			13, 52, 1 , 10, SCRAL, "",
  lblCritere8,		CUCT_LABEL,			14, 52, 1 , 10, SCRAL, "",
  lblCritere9,		CUCT_LABEL,			15, 52, 1 , 10, SCRAL, "",
  lblCPar0,			CUCT_LABEL,			6 , 65, 1 , 6 , SCRAL, "",
  lblCPar1,			CUCT_LABEL,			7 , 65, 1 , 6 , SCRAL, "",
  lblCPar2,			CUCT_LABEL,			8 , 65, 1 , 6 , SCRAL, "",
  lblCPar3,			CUCT_LABEL,			9 , 65, 1 , 6 , SCRAL, "",
  lblCPar4,			CUCT_LABEL,			10, 65, 1 , 6 , SCRAL, "",
  lblCPar5,			CUCT_LABEL,			11, 65, 1 , 6 , SCRAL, "",
  lblCPar6,			CUCT_LABEL,			12, 65, 1 , 6 , SCRAL, "",
  lblCPar7,			CUCT_LABEL,			13, 65, 1 , 6 , SCRAL, "",
  lblCPar8,			CUCT_LABEL,			14, 65, 1 , 6 , SCRAL, "",
  lblCPar9,			CUCT_LABEL,			15, 65, 1 , 6 , SCRAL, "",
  lblSpecifCli0,	CUCT_LABEL,			6 , 72, 1 , 3 , SCRAL, "",
  lblSpecifCli1,	CUCT_LABEL,	        7 , 72, 1 , 3 , SCRAL, "",
  lblSpecifCli2,	CUCT_LABEL,	        8 , 72, 1 , 3 , SCRAL, "",
  lblSpecifCli3,	CUCT_LABEL,	        9 , 72, 1 , 3 , SCRAL, "",
  lblSpecifCli4,	CUCT_LABEL,	        10, 72, 1 , 3 , SCRAL, "",
  lblSpecifCli5,	CUCT_LABEL,	        11, 72, 1 , 3 , SCRAL, "",
  lblSpecifCli6,	CUCT_LABEL,	        12, 72, 1 , 3 , SCRAL, "",
  lblSpecifCli7,	CUCT_LABEL,	        13, 72, 1 , 3 , SCRAL, "",
  lblSpecifCli8,	CUCT_LABEL,	        14, 72, 1 , 3 , SCRAL, "",
  lblSpecifCli9,	CUCT_LABEL,	        15, 72, 1 , 3 , SCRAL, "",
  lblConclusion,	CUCT_LABEL,			16, 1 , 1 , 13, SCRAL, "&Conclusion:",
  lblEtiqCPrin,		CUCT_LABEL,			17, 1 , 1 , 6,  SCRAL, "CPrin:",
  lblCPrin,			CUCT_LABEL,			17, 7 , 1 , 2,  SCRAL, "",
  lblCTrafiquee,	CUCT_LABEL,			17, 10, 1 , 1,  SCRAL, "",
  txtConclusion,	CUCT_TEXTEDIT,      16, 14, 1 , 63, SCRAL, "",
  lblObservations,	CUCT_LABEL,			18, 1 , 1 , 13, SCRAL, "&Observations:",
  txtObservations,	CUCT_TEXTEDIT,      17, 14, 4 , 63, SCRAL, "",
  btnOk,			CUCT_COMMANDBUTTON, 21, 1 , 1 , 20, SCRAL, "F2: Sauve+Quitte",
  btnAnnuler,		CUCT_COMMANDBUTTON, 21, 22, 1 , 17, SCRAL, "F3: Abandonne",
  btnEditeGermes,	CUCT_COMMANDBUTTON, 21, 40, 1 , 14, SCRAL, "F5: Germes",
  btnInterprete,	CUCT_COMMANDBUTTON, 21, 55, 1 , 22, SCRAL, "F9: Interpretation",
  lblAide,			CUCT_LABEL,			22, 1 , 1 , 75, SCRAL, "",
  -1
};

//======================================================================
// change des donn‚es dans les deux sens entre la structure et les contr“les
// si iUS est vrai, la structure est mise … jour … partir des contr“les
// Si iUS est faux, les contr“les sont mis … jour … partir de la structure
static void ScralDataExchange(int iUS, struct CUC_Form *f, struct DataScral *d)
{ int i;

  DX_Text(iUS, f, lblReference, d->szReference, sizeof(d->szReference));
  DX_Text(iUS, f, txtCritere, d->szCritere, sizeof(d->szCritere));
  //aprintf("DX_Text", "iUS: %d|szCrit: %s", iUS, d->szCritere);
  DX_Text(iUS, f, txtMethode, d->szMethode, sizeof(d->szMethode));
  DX_Value(iUS, f, lblVerCrit, &d->iVerCrit);
  DX_Value(iUS, f, txtNumEtb, &d->iNumEtb);
  DX_Text(iUS, f, txtDateDebAna, d->szDateDebAna, sizeof(d->szDateDebAna));
  for (i=0 ; i<10 ; i++)
  {
	if (!iUS)	// Etiquettes non modifiables
	{ char szTexte[100];
	  DX_Value(iUS, f, lblNumGer0+i, &d->res[i].iNumGer);
	  if (d->res[i].iNumGer>0)
	  {
		sprintf(szTexte, "%s %s", d->res[i].szGerme, d->res[i].szUnite);
		DX_Text(iUS, f, lblGerme0+i, szTexte, sizeof(szTexte));
		if (d->res[i].im>0)
		  DX_Value(iUS, f, lblCritere0+i, &d->res[i].im);
		else if (d->res[i].im==0)
		  DX_Text(iUS, f, lblCritere0+i, "ABSENCE", 1);
		else
		  DX_Text(iUS, f, lblCritere0+i, "", 1);

		if (d->res[i].iCPar>0)
		  sprintf(szTexte, "%d %s", d->res[i].iCPar, d->res[i].szCPar);
		else
		  szTexte[0] = 0;
		DX_Text(iUS, f, lblCPar0+i, szTexte, sizeof(szTexte));
		DX_Text(iUS, f, lblSpecifCli0+i, d->res[i].szSpecifCli, sizeof(d->res[i].szSpecifCli));
	  }
	  else
	  { 
		DX_Text(iUS, f, lblGerme0+i, "", 1);
		DX_Text(iUS, f, lblCritere0+i, "", 1);
		DX_Text(iUS, f, lblCPar0+i, "", 1);
		DX_Text(iUS, f, lblSpecifCli0+i, "", 1);
	  }
	}
	DX_Text(iUS, f, txtResultat0+i, d->res[i].szResultat, sizeof(d->res[0].szResultat));
  }

  if (!iUS)	// Etiquettes non modifiables
  { 
	// Conclusion
	DX_Text(iUS, f, txtConclusion, d->szConclusion, sizeof(d->szConclusion));
	DX_Text(iUS, f, lblCTrafiquee, d->szCTrafiquee, sizeof(d->szCTrafiquee));
	DX_Value(iUS, f, lblCPrin, &d->iCPrin);
  }
  DX_Text(iUS, f, txtObservations, d->szObservations, sizeof(d->szObservations));
}

// Configuration initiale des contr“les
void Scral_InitCtrl()
{
  int i;

  CUC_FormSetPropNum(fScral, txtCritere, CUCP_MAXLENGTH, 4);
  CUC_FormSetPropNum(fScral, txtMethode, CUCP_MAXLENGTH, 1);
  CUC_FormSetPropNum(fScral, lblCPrin,  CUCP_ALIGNMENT, 2);

  for (i=0 ; i<10 ; i++)
  { // CritŠres cadr‚s … droite
	CUC_FormSetPropNum(fScral, lblCritere0+i, CUCP_ALIGNMENT, 1);
  }
};

//======================================================================
// Proc‚dures g‚n‚rales

int iLitCritere(int bForce)
{
  static char szOldCritere[5], szOldMethode[2];
  static int  iOldVerCrit;
  int	iNbGer;
  int	i;

  // R‚cup des champs
  //ScralDataExchange(1, fScral, &dScral);

  //aprintf("", "test critŠre|%s / %s|%s / %s|%d / %d", dScral.szCritere, szOldCritere, dScral.szMethode, szOldMethode, dScral.iVerCrit, iOldVerCrit);

  if (!bForce &&
	  strcmp(szOldCritere, dScral.szCritere)==0 &&
      strcmp(szOldMethode, dScral.szMethode)==0 &&
	  iOldVerCrit==dScral.iVerCrit)
	return 0;

  // Lecture du critŠre
  // aprintf("", "Lecture du critŠre %s %s %d", dScral.szCritere, dScral.szMethode, dScral.iVerCrit);
  if( (pCrit=cri_LitCritere(dScral.szCritere, dScral.iVerCrit, 0, 'F', &iNbGer))==NULL )
  { aprintf("", "|Attention !|CritŠre \"%s\" inconnu !|", dScral.szCritere);
	return -1;
  }

  if (iNbGer>10) iNbGer = 10;
  for (i=0 ; i<iNbGer ; i++)
  {
	int    iGerme;
	char   szLibGer[40], szUnite[11];
	double m, s;
	
	iGerme = cri_iGetGermeCritInd(pCrit, i, szLibGer, sizeof(szLibGer), szUnite, sizeof(szUnite), &m, &s);
	dScral.res[i].iNumGer = iGerme;
	strcpy(dScral.res[i].szUnite, szUnite);
	dScral.res[i].im = (int)m;
	strncpy2(dScral.res[i].szGerme, szLibGer, sizeof(dScral.res[0].szGerme));
	if (m>0)
	  sprintf(dScral.res[i].szResultat, "<%d", (int)s);
	else if (m==0.0)
	  sprintf(dScral.res[i].szResultat, "ABSENCE");
	else
	  dScral.res[i].szResultat[0] = 0;
  }
  for ( ; i<10 ; i++)
  {
	dScral.res[i].iNumGer = NULL_INT;
	dScral.res[i].szUnite[0] = 0;
	dScral.res[i].im = NULL_INT;
	dScral.res[i].szGerme[0] = 0;
  }

  strcpy(szOldCritere, dScral.szCritere);
  strcpy(szOldMethode, dScral.szMethode);
  iOldVerCrit = dScral.iVerCrit;

  //ScralDataExchange(0, fScral, &dScral);
  return 0;
}

//======================================================================
// Proc‚dures d'‚v‚nement

void Scral_Load()
{ 
  Scral_InitCtrl();
  fh_iInitCtrl(fScral, tFHScral);
}

//======================================================================

static void Sauve()
{
  ScralDataExchange(1, fScral, &dScral);

  if (dScral.szReference[0]==0)
	aprintf("MODE TEST DES CRITERES","Vous ne pouvez pas sauvegarder !");
  else
	aprintf("Sauve","A sauvegarder dans labcra:|ref: %s|crit: %s %s|etb: %d",
	  dScral.szReference, dScral.szCritere, dScral.szMethode, dScral.iNumEtb);
}


static void DoInterpretation(int iAfficheDetail)
{
  char	szMessage[2000];
  int	iClasseMax;
  int	iConclusion;		// Conclusion client (1..110+)
  int	iCPrin;				// Conclusion principale (1..7)
  char	szConclusion[80];
  int	i;

  strcpy(szMessage, "Germe                             R‚sultat   : Cl : CP Cpar Ret|");
  iClasseMax = 0;
  for (i=0 ; i<10 ; i++)
  {
	int  iRet;
	int  iClasse;
	int  iCPar;
	char szCPar[5];

	if (dScral.res[i].iNumGer>=0)
	{
	  iRet = cri_iConcPar(pCrit, dScral.res[i].iNumGer, dScral.res[i].szResultat, dScral.szPrefixe, &iClasse, &iCPar, szCPar, sizeof(szCPar));
	  sprintf(szMessage+strlen(szMessage), "%2d %-30.30s %-10.10s : %2d : %2d %-4.4s %2d|",
		dScral.res[i].iNumGer, 
		dScral.res[i].szGerme, 
		dScral.res[i].szResultat, 
		iClasse,
		iCPar,
		szCPar,
		iRet);
	  if (iClasse>iClasseMax) iClasseMax = iClasse;

	  dScral.res[i].iCPar = iCPar;
	  strcpy(dScral.res[i].szCPar, szCPar);

	  // On signale une interpr‚tation sp‚cifique client
	  if (0)	// … compl‚ter
		strcpy(dScral.res[i].szSpecifCli, "S");
	  else
		dScral.res[i].szSpecifCli[0] = 0;
	}
  }

  szConclusion[0] = 0;		// par s‚curit‚
  iConclusion = cri_iConcFinale(pCrit, iClasseMax, dScral.szPrefixe, 'F', &iCPrin, szConclusion, sizeof(szConclusion));
  sprintf(szMessage+strlen(szMessage), "|ClasseMax: %d  -> Conclusion principale: %d|Conclusion: %d: %s", iClasseMax, iCPrin, iConclusion, szConclusion);

  dScral.iConclInfo = dScral.iConclusion = iConclusion;
  dScral.iCPInfo = dScral.iCPrin = iCPrin;
  dScral.szCTrafiquee[0] = 0;
  strncpy2(dScral.szConclusion, szConclusion, sizeof(dScral.szConclusion));

  if (iAfficheDetail)
	aprintf("Interpr‚tation", szMessage);
}

//======================================================================

static void btnOk_Clic()
{
  Sauve();
  CUC_FormExit(fScral);
}

static void btnAnnuler_Clic()
{
  CUC_FormExit(fScral);
}

static void btnEditeGermes_Clic()
{
  ScralDataExchange(1, fScral, &dScral);
  DoEditeGermes();
  ScralDataExchange(0, fScral, &dScral);
}

static void btnInterprete_Clic()
{
  ScralDataExchange(1, fScral, &dScral);
  DoInterpretation(1);
  ScralDataExchange(0, fScral, &dScral);
}

static void Scral_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
	CUC_FormExit(fScral);
  else if (*piKey==KEY_F(3))	// Sortie avec abandon
	btnAnnuler_Clic();
  else if (*piKey==KEY_F(2))	// Sortie avec sauvegarde
	btnOk_Clic();
  else if (*piKey==KEY_F(5))	// Edition des germes
	btnEditeGermes_Clic();
  else if (*piKey==KEY_F(9))	// Calcul de la conclusion
	btnInterprete_Clic();
  else if (*piKey==KEY_UP)
  { int i = fh_iChampPrecedent(tFHScral, CUC_FormGetActiveControl(fScral));
	if (i>=0)
	{ CUC_FormSetActiveControl(fScral, i);
	  *piKey = 0;
	}
  }
  else if (*piKey==KEY_DOWN || *piKey==KEY_RETURN)
  { int i = fh_iChampSuivant(tFHScral, CUC_FormGetActiveControl(fScral));
	if (i>=0)
	{ CUC_FormSetActiveControl(fScral, i);
	  *piKey = 0;
	}
  }
}


static void txtCritere_LostFocus()
{
  ScralDataExchange(1, fScral, &dScral);
  if (iLitCritere(0)<0)
	CUC_FormSetActiveControl(fScral, txtCritere);
  else
	ScralDataExchange(0, fScral, &dScral);
}

// Chiffres et lettres autoris‚s, saisie en majuscules
void txtCritere_Key(int *piKey)
{
  if (*piKey>=' ' && *piKey<=255 || *piKey==8 || *piKey==KEY_CTRL_V || *piKey==KEY_CTRL_X)
  {
	aprintf("", "Vous ne pouvez pas modifier directement le critŠre.|Utiliser F4 pour pouvoir le modifier.");
	*piKey = 0;
  }
  else if (*piKey==KEY_F(4))
  {
	char szOldCritere[5];
	ScralDataExchange(1, fScral, &dScral);
	strncpy2(szOldCritere, dScral.szCritere, sizeof(szOldCritere));
	DoSaisieCritere();
	if (strcmp(dScral.szCritere, szOldCritere))
	{ iLitCritere(0);
	  ScralDataExchange(0, fScral, &dScral);
	}
  }
}

static void txtMethode_LostFocus()
{
  ScralDataExchange(1, fScral, &dScral);
  iLitCritere(0);
  ScralDataExchange(0, fScral, &dScral);
}

// Filtre en acceptant uniquement S, J, A et E
void txtMethode_Key(int *piKey)
{
  if (*piKey==KEY_UP)
	CUC_FormSetActiveControl(fScral, txtCritere);
  else if (*piKey>=32 && *piKey<=255)
  {
	if (*piKey>='a' && *piKey<='z')
	  *piKey -= 32;
	if (*piKey!='S' && *piKey!='J' && *piKey!='A' && *piKey!='E')
	  *piKey = 0;
  }
}

//======================================================================

static void txtNumEtb_Key(int *piKey)
{
  fh_FiltreNum(piKey);
}

//======================================================================

static void txtConclusion_Key(int *piKey)
{
  if (*piKey>=' ' && *piKey<=255 || *piKey==8 || *piKey==KEY_CTRL_V || *piKey==KEY_CTRL_X)
  {
	aprintf("", "Vous ne pouvez pas modifier directement la conclusion.|Utiliser F4 pour pouvoir la modifier.");
	*piKey = 0;
  }
  else if (*piKey==KEY_F(4))
  {
	int iOldConclusion, iOldCPrin;

	ScralDataExchange(1, fScral, &dScral);
	iOldConclusion = dScral.iConclusion;
	iOldCPrin = dScral.iCPrin;
	DoSaisieConclusion();
	if (dScral.iConclusion!=iOldConclusion || dScral.iCPrin!=iOldCPrin)
	{ 
	  if (dScral.iConclusion!=dScral.iConclInfo || dScral.iCPrin!=dScral.iCPInfo)
	    strcpy(dScral.szCTrafiquee, "T");
	  else
		dScral.szCTrafiquee[0] = 0;
	  ScralDataExchange(0, fScral, &dScral);
	}
  }
}

//======================================================================

#define szR dScral.res[iLigne].szResultat

static int iCalibreResultat(int iLigne, char *szTexte)
{
  if (strnicmp(szR, szTexte, strlen(szR))==0)
  { strncpy2(szR, szTexte, sizeof(szR));
	return 1;
  }
  return 0;
}

static int iss, isl;

static int iFillChamp(char *szNouvTxt, int iLigne, char *szTexte)
{
  char t2[50];

  if (strnicmp(szNouvTxt, szTexte, strlen(szNouvTxt))==0)
  { strcpy(t2, szNouvTxt);
	strcat(t2, szTexte+strlen(szNouvTxt));
	strcpy(szR, t2);
//aprintf("", "szNouvtxt: %s|szTexte: %s|t2: %s", szNouvTxt, szTexte, t2);
	iss = strlen(szNouvTxt);
	isl = strlen(szNouvTxt);
	return 1;
  }
  return 0;
}

static int iOkValeur(char *szTexte)
{
  int i = 0;
  if (szTexte[i]=='<') i++;
  while (szTexte[i]>='0' && szTexte[i]<='9') i++;
  if (szTexte[i])
	return 0;
  else
	return 1;
}


static void txtResultat_Key(int *piKey)
{
  int	iCtrl = CUC_FormGetActiveControl(fScral);
  int	iLigne = iCtrl-txtResultat0;
  char	szNouvRes[50], t[50];
  int	l, ss, sl;

  Assert(iLigne>=0 && iLigne<=9);

  if (*piKey>=32 && *piKey<=255 && *piKey!=127)
  {
	DX_Text(1, fScral, txtResultat0+iLigne, szR, sizeof(dScral.res[0].szResultat));

	strncpy2(t, szR, sizeof(t));
	ss = CUC_FormGetPropNum(fScral, txtResultat0+iLigne, CUCP_SELSTART);
	sl = CUC_FormGetPropNum(fScral, txtResultat0+iLigne, CUCP_SELLENGTH);
	szNouvRes[0] = 0;
	if (ss>0)
	{ strcpy(szNouvRes, t);
	  szNouvRes[ss] = 0;
	}
	sprintf(szNouvRes+strlen(szNouvRes), "%c", *piKey);
	l = ss+sl+1;
	if (l>0)
	  strcat(szNouvRes, t+l-1);


    iss = isl = -1;
	if (strlen(szNouvRes))
	{
	  if (iFillChamp(szNouvRes, iLigne, "ABSENCE"))
		*piKey = 0;
	  else if (iFillChamp(szNouvRes, iLigne, "PRESENCE"))
		*piKey = 0;
	  else if (iFillChamp(szNouvRes, iLigne, "-"))
		*piKey = 0;
	  else if (iOkValeur(szNouvRes))
		;
	  else
	  { *piKey = 0;
		beep();
aprintf("", "t:  \"%s\"|ss: %d|sl: %d|nr: \"%s\"", t, ss, sl, szNouvRes);
	  }
	}

	// CUC_FormSetPropStr(fScral, txtResultat0+iLigne, CUCP_TEXT, szR);
	DX_Text(0, fScral, txtResultat0+iLigne, szR, sizeof(dScral.res[0].szResultat));
	if (iss>=0)
	  CUC_FormSetPropNum(fScral, txtResultat0+iLigne, CUCP_SELSTART, iss);
	if (isl>=0)
	  CUC_FormSetPropNum(fScral, txtResultat0+iLigne, CUCP_SELLENGTH, 99);
  }
}

static void txtResultat_LostFocus()
{
  int iCtrl = CUC_FormGetActiveControl(fScral);
  int iLigne = iCtrl-txtResultat0;
  int iOk = 0;

  Assert(iLigne>=0 && iLigne<=9);
  ScralDataExchange(1, fScral, &dScral);

  if (szR[0])
  {

	if (iCalibreResultat(iLigne, "ABSENCE"))
	  iOk = 1;
	else if (iCalibreResultat(iLigne, "PRESENCE"))
	  iOk = 1;
	else if (iCalibreResultat(iLigne, "-"))
	  iOk = 1;
	else if (iOkValeur(szR))
	{
	  if (strcmp(szR, "<")==0)
		sprintf(szR, "<%d", dScral.res[iLigne].im);
	  iOk = 1;
	}
	else
	{ aprintf("", "Saisie incorrecte !");
	  CUC_FormSetActiveControl(fScral, iCtrl);
	}
  }

  if (iOk)
  { DoInterpretation(0);
	ScralDataExchange(0, fScral, &dScral);
  }
}

static void txtResultat_GotFocus()
{
//  int iCtrl = CUC_FormGetActiveControl(fScral);
//  int iLigne = iCtrl-txtResultat0;
//  Assert(iLigne>=0 && iLigne<=9);
//
//  CUC_FormSetPropNum(fScral, txtResultat0+iLigne, CUCP_SELSTART, 0);
//  CUC_FormSetPropNum(fScral, txtResultat0+iLigne, CUCP_SELLENGTH, 99);
}

//======================================================================

static struct FormEvent tScralEvents[] =
{
  SCRAL,			CUCE_LOAD,			Scral_Load,
  SCRAL,			CUCE_KEY,		    Scral_Key,
  txtCritere,		CUCE_KEY,			txtCritere_Key,
  txtMethode,		CUCE_KEY,		    txtMethode_Key,
  txtCritere,		CUCE_LOSTFOCUS,		txtCritere_LostFocus,
  txtMethode,		CUCE_LOSTFOCUS,		txtMethode_LostFocus,

  txtNumEtb,		CUCE_KEY,			txtNumEtb_Key,

  txtResultat0,		CUCE_KEY,			txtResultat_Key,
  txtResultat1,		CUCE_KEY,			txtResultat_Key,
  txtResultat2,		CUCE_KEY,			txtResultat_Key,
  txtResultat3,		CUCE_KEY,			txtResultat_Key,
  txtResultat4,		CUCE_KEY,			txtResultat_Key,
  txtResultat5,		CUCE_KEY,			txtResultat_Key,
  txtResultat6,		CUCE_KEY,			txtResultat_Key,
  txtResultat7,		CUCE_KEY,			txtResultat_Key,
  txtResultat8,		CUCE_KEY,			txtResultat_Key,
  txtResultat9,		CUCE_KEY,			txtResultat_Key,

  txtResultat0,		CUCE_GOTFOCUS,		txtResultat_GotFocus,
  txtResultat1,		CUCE_GOTFOCUS,		txtResultat_GotFocus,
  txtResultat2,		CUCE_GOTFOCUS,		txtResultat_GotFocus,
  txtResultat3,		CUCE_GOTFOCUS,		txtResultat_GotFocus,
  txtResultat4,		CUCE_GOTFOCUS,		txtResultat_GotFocus,
  txtResultat5,		CUCE_GOTFOCUS,		txtResultat_GotFocus,
  txtResultat6,		CUCE_GOTFOCUS,		txtResultat_GotFocus,
  txtResultat7,		CUCE_GOTFOCUS,		txtResultat_GotFocus,
  txtResultat8,		CUCE_GOTFOCUS,		txtResultat_GotFocus,
  txtResultat9,		CUCE_GOTFOCUS,		txtResultat_GotFocus,

  txtResultat0,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,
  txtResultat1,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,
  txtResultat2,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,
  txtResultat3,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,
  txtResultat4,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,
  txtResultat5,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,
  txtResultat6,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,
  txtResultat7,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,
  txtResultat8,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,
  txtResultat9,		CUCE_LOSTFOCUS,		txtResultat_LostFocus,

  txtConclusion,	CUCE_KEY,			txtConclusion_Key,

  btnOk,			CUCE_CLIC,			btnOk_Clic,
  btnAnnuler,		CUCE_CLIC,			btnAnnuler_Clic,
  btnEditeGermes,	CUCE_CLIC,			btnEditeGermes_Clic,
  -1
};

//======================================================================

struct FormHelp tFHScral[] =
{
  txtCritere,		FH_SAISIE|FH_AUTOSELECT,
	txtNumEtb,		-1,
	"CritŠre d'analyse:     F4 pour modifier ce champ",
  txtMethode,		FH_SAISIE|FH_AUTOSELECT,
	txtNumEtb,		txtCritere,
	"M‚thode d'analyse:     S=Simplifi‚, J=JO, A=AFNOR std, E=AFNOR Expertise",
  txtNumEtb,		FH_SAISIE|FH_AUTOSELECT,
	txtDateDebAna,	txtCritere,
	"Nø d'‚tablissement",
  txtDateDebAna,	FH_SAISIE|FH_AUTOSELECT,
	txtResultat0,	txtNumEtb,		
	"Date d'analyse",
  txtResultat0,		FH_SAISIE|FH_AUTOSELECT,
	txtResultat1,	txtDateDebAna,  
	"R‚sultats 1er germe:     nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtResultat1,		FH_SAISIE|FH_AUTOSELECT,
	txtResultat2,	txtResultat0,   
	"R‚sultats 2Šme germe:    nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtResultat2,		FH_SAISIE|FH_AUTOSELECT,
	txtResultat3,	txtResultat1,   
	"R‚sultats 3Šme germe:    nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtResultat3,		FH_SAISIE|FH_AUTOSELECT,
	txtResultat4,	txtResultat2,   
	"R‚sultats 4Šme germe:    nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtResultat4,		FH_SAISIE|FH_AUTOSELECT,
	txtResultat5,	txtResultat3,   
	"R‚sultats 5Šme germe:    nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtResultat5,		FH_SAISIE|FH_AUTOSELECT,
	txtResultat6,	txtResultat4,   
	"R‚sultats 6Šme germe:    nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtResultat6,		FH_SAISIE|FH_AUTOSELECT,
	txtResultat7,	txtResultat5,   
	"R‚sultats 7Šme germe:    nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtResultat7,		FH_SAISIE|FH_AUTOSELECT,
	txtResultat8,	txtResultat6,   
	"R‚sultats 8Šme germe:    nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtResultat8,		FH_SAISIE|FH_AUTOSELECT,
	txtResultat9,	txtResultat7,   
	"R‚sultats 9Šme germe:    nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtResultat9,		FH_SAISIE|FH_AUTOSELECT,
	txtConclusion,	txtResultat8,
	"R‚sultats 10Šme germe:   nnn, <nnn, <, -, ASENCE, PRESENCE",
  txtConclusion,	FH_SAISIE,
	txtObservations,txtResultat9,
	"Conclusion de l'analyse: F4 pour voir la liste",
  txtObservations,	FH_SAISIE|FH_AUTOSELECT,
	-1,				-1,
	"Observations compl‚mentaires",
  btnOk,			0,
	btnAnnuler,		txtObservations,
	"Valider les changements et fermer le dialogue",
  btnAnnuler,		0,
	btnEditeGermes,	btnOk,
	"Abandonner les changements et fermer le dialogue",
  btnEditeGermes,	0,
	btnInterprete,	btnAnnuler,
	"Ouvrir la grille d'‚dition des germes",
  btnInterprete,	0,
	-1,				 btnEditeGermes,
	"R‚-interpreter les r‚sultats en affichant le d‚tail",
  -1
};

int iFFCtrl;

static void FFScral_GotFocus()
{
  int i;
  iFFCtrl = CUC_FormGetActiveControl(fScral);
  for (i=0 ; i<tFHScral[i].iChamp>=0 ; i++)
	if (tFHScral[i].iChamp==iFFCtrl)
	{ CUC_FormSetPropStr(fScral, lblAide, CUCP_CAPTION, tFHScral[i].szAide);
	  if (tFHScral[i].iFlags&FH_AUTOSELECT)
	  { CUC_FormSetPropNum(fScral, iFFCtrl, CUCP_SELSTART, 0);
		CUC_FormSetPropNum(fScral, iFFCtrl, CUCP_SELLENGTH, 99);
	  }
	  return;
	}

  // Pas trouv‚ le contr“le: on efface le label d'aide
  CUC_FormSetPropStr(fScral, lblAide, CUCP_CAPTION, "");
}

//======================================================================

// Exploitation de la feuille
static void DoFormScral(char *szTitre)
{

  if (CUC_FormCreate(&fScral, tScralControls, tScralEvents, NULL)<0)
	aprintf("DoFormScral", "Echec … la cr‚ation de la grille !");
  else
  {
	if (fh_iRegisterHelp(fScral, tFHScral, FFScral_GotFocus)>=0)
	{
	  // CUC_FormDeactivate(feuille_inferieure);
	  CUC_FormSetCaption(fScral, szTitre);

	  iLitCritere(1);
	  DoInterpretation(0);
	  ScralDataExchange(0, fScral, &dScral);

	  CUC_FormShow(fScral);

	  CUC_FormExec(fScral);
	  CUC_FormDestruct(fScral);
	  // CUC_FormActivate(feuille_inferieure);
	}
  }
}

//======================================================================

void DoSaisana(char *szRef)
{
  int iStatus, i;

  iStatus = cral_iLitCRAL(szRef, 'F', &c, 0);
  if (iStatus<0)
  { aprintf("ERREUR !", "saisana: DoSaisAna: Echec au cral_iLitCRAL !|Retour: %d", iStatus);
	return;
  }

  // On efface la structure d'E/S
  memset(&c, 0, sizeof(c));

  if (iStatus==100)	// Pas de donn‚es dans cralabo: nouvel enregistrement
  {
	// On efface l'enregistrement et on remplit un maximum de champs
	// avec les infos de seriedetail
    strcpy(dScral.szReference, r_sd.sd_reference);
    strcpy(dScral.szCritere, r_sd.sd_critere);
    strcpy(dScral.szMethode, r_sd.sd_methode);
	dScral.iVerCrit = 0;
	dScral.iNumEtb = r_sd.sd_numetb;
	if (dScral.iNumEtb==0) dScral.iNumEtb = NULL_INT;
	dScral.szDateDebAna[0] = 0;
	for (i=0 ; i<10 ; i++)
	{
	  dScral.res[i].iNumGer = NULL_INT;
	  dScral.res[i].szResultat[0] = 0;
	}
	dScral.iConclusion = NULL_INT;
	dScral.iCPrin = NULL_INT;
	strcpy(dScral.szObservations, r_sd.sd_observations);
  }
  else
  {
	// On remplit les champs … partir de labcrat/labcrac
    strcpy(dScral.szReference, c.szReference);
    strcpy(dScral.szCritere, c.szCritere);
    strcpy(dScral.szMethode, c.szMethode);
	dScral.iVerCrit = c.iVerCrit;
	dScral.iNumEtb = c.iNumEtb;
	dScral.szDateDebAna[0] = 0;
	for (i=0 ; i<10 ; i++)
	{
	  dScral.res[i].iNumGer = c.res[i].iNumGer;
	  strcpy(dScral.res[i].szResultat, c.res[i].szResultat);
	}
	dScral.iConclusion = c.iConclusion;
	dScral.iCPrin = c.iCPrin;
	strcpy(dScral.szObservations, c.szObservations);
  }
  
  // On r‚alise la saisie interactive
  DoFormScral("Saisie/modification d'un CRA");
}

//======================================================================

void DoSaisTest(char *szCritere)
{
  // On efface la structure d'E/S
  memset(&c, 0, sizeof(c));
  dScral.iConclusion = NULL_INT;
  dScral.iCPrin = NULL_INT;
  dScral.iNumEtb = NULL_INT;
  
  strcpy(dScral.szCritere, szUCase(szCritere));
  strcpy(dScral.szMethode, "S");
  DoFormScral("Test d'un critŠre");
}

