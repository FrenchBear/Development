/* boite.ec
** Application de marquage des boåtes de Petri
** 29/04/94 PV  1.00
** 28/09/94 FG	Modif tables critere, criterel
*/

#include <stdio.h>
#include <signal.h>
#include <ctype.h>

#include <clib.ref>
#include <biberc.h>
#include <fix.ref>

/*====================================================================*/

static char szNomApp[] = "boite 1.00";
static char szTitreApp[] = "Marquage des boåtes";

int iExitCode;

char	szSystemID[40], szNomOperateur[40];

#define CARTOUCHE Cartouche(szNomApp, szTitreApp, "")

int iZone;	/* 0: Code barre, rÇfÇrence, ... */
		/* 1: Liste des boåtes */
int iChamp;
#define CH0_CODEBARRE	0
#define CH0_REFERENCE	1
#define CH0_NUMETB	2
#define CH0_PREFIXE	3
#define CH0_NOMETB	4
#define CH0_CRITERE	5

#define CH1_GERMEL	0
#define CH1_DILUTION	1
#define CH1_QUANTITE	2
#define CH1_NBBOITES	3
#define CH1_TYPEBOITE	4

int	iEch;	/* Echantillon courant, indice des tableaux suivants */
int	iBoite; /* Boåte courante dans tBoites */

#define MAXECH 12
char	tszCodeBarre[MAXECH][19];
char	tszReference[MAXECH][12];
char	tszCritere[MAXECH][5];
char	tszNumEtb[MAXECH][6];
char	tszPrefixe[MAXECH][11];
char	tszNomEtb[MAXECH][41];
int	tnbBoites[MAXECH];

#define	MAXBOITE 16
struct
{
  char	szGermel[4];
  int	iGermel;
  int	iDilution;
  int	iQuantite;
  int	nbBoites;
  int	iFacteur;
  int	iTypeMarquage;
  char	szComment[61];
} tBoites[MAXECH][MAXBOITE];

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

int	A_CHAMP_ACTIF;
int	A_CHAMP_INACTIF;
int	A_ETIQUETTE;
int	A_TOUCHE;
int	A_ERREUR;
int	A_CHAMP_FIXE;

/*====================================================================*/

char *tszSansC30[] =
{
  "SFR", "SFS",		/* Sodexho */
  "EXP",		/* Expresself */
  "SOG",		/* Sogeres */
  "EUR",		/* Eurest */
  "ACC",		/* Accor */
  "REG",		/* Regiself */
  "LRP",		/* LRP */
  "MEL",		/* Melodine */
  "OR",			/* Orly */
  "CER",		/* Ceres */
  "MER",		/* Mercure */
  "SOF", "PUL", "ALT",	/* Sofitel, Pulmann, Altea */
  "NOV",		/* Novotel */
  "IBIS",		/* Ibis */
  NULL
};

/*====================================================================*/
/* Structures d'interface avec la base de donnÇes */

#include <esqlc.h>

#include <t_dilution.h>
#include <t_critere.h>
#include <t_criterel.h>
#include <t_germelabo.h>

$struct T_DILUTION   r_dil;
$struct T_CRITERE    r_cri;
$struct T_GERMELABO  r_gl;

/*====================================================================*/

/* VÇrifie si on a un message en attente */
void CtrlMessage()
{
  FILE	*f;
  char	szBuffer[128], *szMailName;

  szMailName = getenv("TRA_INIT");
  if (szMailName==NULL) return;

  sprintf(szBuffer, "ls /u/edip/messagerie/%s/r* 2>/dev/null", szMailName);
  f = popen(szBuffer, "r");
  if (fgets(szBuffer, 128, f)!=NULL)
  { attron(A_REVERSE);
    mvaddstr(1, 64, " Vous avez reáu ");
    mvaddstr(2, 64, "  un message !  ");
    beep();
    attroff(A_REVERSE);
  }
  pclose(f);
}

/*====================================================================*/

void ErrSQL(szApp, szModule, szMsg)
char *szApp, *szModule, *szMsg;
{
  char szMessage[400];
  static char szTitre[] = "Erreur SQL !";

  sprintf(szMessage,"|%s||Code SQL: %d|Code ISAM: %d|", szMsg, 
    sqlca.sqlcode, sqlca.sqlerrd[2]);
  AlertOk(szTitre, szMessage);
  ErrorLog(szApp, szModule, szTitre, szMessage);
}

/*====================================================================*/

void MessageErr(char *szFormat, ...)
{
  char szBuffer[200];

  if (szFormat==NULL)
  {
    move(LINES-4,0);
    clrtoeol();
  }
  else
  { 
    vsprintf(szBuffer, szFormat, (char *)((&szFormat)+1));
    move(LINES-4,0);
    attron(A_ERREUR);
    printw("%-79.79s", szBuffer);
    attroff(A_ERREUR);
  }
}

/*====================================================================*/

void AfficheOnglet(int iIndice, int iSel)
{
  if (iSel)
    attron(A_CHAMP_FIXE);
  move(6+iIndice, 0);
  printw("%2d: %-11.11s %-4.4s", iIndice+1, tszReference[iIndice], tszCritere[iIndice]);
  if (iSel)
    attroff(A_CHAMP_FIXE);
}


void AfficheTitreCritere()
{
  $char	szcrit[5];

  strcpy(szcrit, tszCritere[iEch]);
  $select cri_titre1 into $r_cri.cri_titre1
    from critere 
	where cri_critere=$szcrit and
		  cri_version=1;
  move (10,43);
  if (sqlca.sqlcode==0)
  { r_cri.cri_titre1[37] = 0;
    addstr(r_cri.cri_titre1);
  }
  else
    clrtoeol();
}


void AfficheChamp1(int iBoite, int iChamp)
{
  int l0, c0;

  l0 = 13 + iBoite%8;
  c0 = 23 + 30*(iBoite/8);
  attron(A_CHAMP_INACTIF);

  switch(iChamp)
  {
    case CH1_GERMEL:
      mvaddstr(l0, c0, tBoites[iEch][iBoite].szGermel);
      break;

    case CH1_DILUTION:
      move(l0, c0+5);
      if (tBoites[iEch][iBoite].iDilution==1)
		addstr("EP");
      else if (tBoites[iEch][iBoite].iDilution==-32768)
		addstr("  ");
      else
		printw("%-2d", tBoites[iEch][iBoite].iDilution);
      break;

    case CH1_QUANTITE:
      move(l0,c0+9);
      if (tBoites[iEch][iBoite].iQuantite==-32768)
	addstr("   ");
      else
	printw("%-3g", tBoites[iEch][iBoite].iQuantite/10.0);
      break;

    case CH1_NBBOITES:
      move(l0,c0+14);
      printw("%-2d", tBoites[iEch][iBoite].nbBoites);
      break;

    case CH1_TYPEBOITE:
      move(l0,c0+18);
      printw("%-1d", tBoites[iEch][iBoite].iTypeMarquage);
      break;
  }
  attroff(A_CHAMP_INACTIF);
}


void AfficheBoite(int iBoite)
{
  AfficheChamp1(iBoite, CH1_GERMEL);
  AfficheChamp1(iBoite, CH1_DILUTION);
  AfficheChamp1(iBoite, CH1_QUANTITE);
  AfficheChamp1(iBoite, CH1_NBBOITES);
  AfficheChamp1(iBoite, CH1_TYPEBOITE);
}


void AfficheBoites()
{
  int n;

  /* On efface la liste courante */
  for (n=13 ; n<21 ; n++)
  { move(n, 23);
    clrtoeol();
  }

  for(n=0 ; n<tnbBoites[iEch] ; n++)
    AfficheBoite(n);
}

void AfficheChamp0(int iChamp, int iAttribut)
{
  attron(iAttribut);
  switch(iChamp)
  {
    case CH0_CODEBARRE:
      move(6,38);
      printw("%-18.18s", tszCodeBarre[iEch]);
      break;

    case CH0_REFERENCE:
      move(7,38);
      printw("%-11.11s", tszReference[iEch]);
      break;

    case CH0_NUMETB:
      move(8,38);
      printw("%-5.5s", tszNumEtb[iEch]);
      break;

    case CH0_PREFIXE:
      move(9,27);
      printw("%-10.10s", tszPrefixe[iEch]);
      break;

    case CH0_NOMETB:
      move(9,38);
      printw("%-40.40s", tszNomEtb[iEch]);
      break;

    case CH0_CRITERE:
      move(10,38);
      printw("%-4.4s", tszCritere[iEch]);
      attroff(iAttribut);
      AfficheTitreCritere();
      break;

  }
  attroff(iAttribut);
}


int iApresModifCritere()
{
  int	iErr = 0;
  $char	szcrit[5];

  AfficheOnglet(iEch, 1);

  szRTrim(tszCritere[iEch]);
  if (tszCritere[iEch][0]==0) return 0;

  strcpy(szcrit, tszCritere[iEch]);
  $select cri_titre1 into $r_cri.cri_titre1
    from critere
	where cri_critere=$szcrit and
		  cri_version=1;
  if (sqlca.sqlcode!=0)
  {
    MessageErr("Critäre inexistant !");
    return -1;
  }
  else
  {
    int n;
    int i;

    AfficheTitreCritere();
    $declare cdil cursor for 
      select dil_germel, dil_dilution,
	     dil_quantite, dil_nbboites, dil_facteur, dil_comment,
	     gl_ngermel, gl_typemarquage
      into $r_dil.dil_germel, $r_dil.dil_dilution,
	   $r_dil.dil_quantite, $r_dil.dil_nbboites, $r_dil.dil_facteur,
	   $r_dil.dil_comment,
	   $r_gl.gl_ngermel, $r_gl.gl_typemarquage
      from dilution,germelabo
      where dil_critere=$szcrit and gl_germel=dil_germel;
    if (sqlca.sqlcode<0)
    { ErrSQL(szNomApp, "iApresModifCritere", "Echec Ö la dÇclaration du curseur SQL cdil.");
      return 0;
    }

    $open cdil;
    if (sqlca.sqlcode<0)
    { ErrSQL(szNomApp, "iApresModifCritere", "Echec Ö l'ouverture du curseur SQL cdil.");
      return 0;
    }

    tnbBoites[iEch] = 0;
    for(n=0 ; ; n++)
    {
      $fetch cdil;
      if (sqlca.sqlcode==100) break;

      if (n>=MAXBOITE)
      { AlertOk("","20 boites maximum !");
		break;
      }

      /* Exceptions pour les coliformes 30 */
      for (i=0 ; tszSansC30[i]!=NULL ; i++)
	if (strncmp(tszSansC30[i], tszPrefixe[iEch], strlen(tszSansC30[i]))==0)
	  if (strcmp(r_dil.dil_germel, "C30")==0)
	    { i = -99;
	      break;
	    }
      if (i<0)
	continue;
      
      strcpy(tBoites[iEch][tnbBoites[iEch]].szGermel, r_dil.dil_germel);
      tBoites[iEch][tnbBoites[iEch]].iDilution = r_dil.dil_dilution;
      tBoites[iEch][tnbBoites[iEch]].iQuantite = r_dil.dil_quantite;
      tBoites[iEch][tnbBoites[iEch]].nbBoites = r_dil.dil_nbboites;
      tBoites[iEch][tnbBoites[iEch]].iFacteur = r_dil.dil_facteur;
      tBoites[iEch][tnbBoites[iEch]].iGermel = r_gl.gl_ngermel;
      tBoites[iEch][tnbBoites[iEch]].iTypeMarquage = r_gl.gl_typemarquage;
      strcpy(tBoites[iEch][tnbBoites[iEch]].szComment, szRTrim(r_dil.dil_comment));
      tnbBoites[iEch]++;
    }
    $close cdil;

    AfficheBoites();
  }

}


int iSaisieCritere()
{
  int 	iKey;
  char	szOldCritere[5];

  strcpy(szOldCritere, tszCritere[iEch]);
  Message("Critäre d'interprÇtation");
  iKey = iInput(10, 38, tszCritere[iEch], 4, 4, "A1");
  MessageErr(NULL);

  if (iKey==KEY_F(1) && tszCritereExemple[iEch]!=NULL)
  { strcpy(tszCritere[iEch], tszCritereExemple[iEch]);
    AfficheChamp0(CH0_CRITERE, A_CHAMP_INACTIF);
    refresh();
    iKey = KEY_RETURN;
  }

  if (strcmp(tszCritere[iEch], szOldCritere))
  { if (iApresModifCritere()<0)
      return 0;
  }
  return iKey;
}


void ApresModifNumEtb()
{
  $char szprefixe[11], sznometb[41];
  $int ietb;

  ietb = atoi(tszNumEtb[iEch]);
  $select etb_prefixe, etb_nom
    into $szprefixe, $sznometb
    from etablissement
    where etb_numetb=$ietb;

  if (sqlca.sqlcode == 100)
  { strcpy(tszPrefixe[iEch], "***");
    strcpy(tszNomEtb[iEch], "*** Etablissement inexistant !");
  }
  else
  { strcpy(tszPrefixe[iEch], szRTrim(szprefixe));
    strcpy(tszNomEtb[iEch], szRTrim(sznometb));
  }

  AfficheChamp0(CH0_PREFIXE, A_CHAMP_INACTIF);
  AfficheChamp0(CH0_NOMETB, A_CHAMP_INACTIF);
}


int iSaisieNumEtb()
{
  char	szOldNumEtb[6];
  int	iKey;

  strcpy(szOldNumEtb, tszNumEtb[iEch]);
  Message("N¯ d'Çtablissement");
  iKey = iInput(8, 38, tszNumEtb[iEch], 5, 5, "1");
  MessageErr(NULL);

  if (strcmp(szOldNumEtb, tszNumEtb[iEch]))
    ApresModifNumEtb();

  return iKey;
}

int iSaisieCodeBarre()
{
  int	iKey;
  int	iEtb;
  int	iErr = 0;
  char	szOldCodeBarre[19];

  strcpy(szOldCodeBarre, tszCodeBarre[iEch]);
  Message("Code barre de la fiche de prÇlävement");
  iKey = iInput(6, 38, tszCodeBarre[iEch], 18, 18, "1");
  MessageErr(NULL);

  if (iKey==KEY_F(1) && tszCodeBarreExemple[iEch]!=NULL)
  { strcpy(tszCodeBarre[iEch], tszCodeBarreExemple[iEch]);
    AfficheChamp0(CH0_CODEBARRE, A_CHAMP_INACTIF);
    refresh();
    iKey = KEY_RETURN;
  }

  if (strcmp(szOldCodeBarre, tszCodeBarre[iEch])==0)
    return iKey;
  if (strlen(tszCodeBarre[iEch])==0)
    return iKey;

  if (strlen(tszCodeBarre[iEch])!=18)
  {
    MessageErr("Erreur! Le code barre doit faire 18 caractäres de long !");
    iErr = 1;
  }
  else
  {
    int i, iCS, iCS2;
    int iSite, iPrest, iPrel, iIng;
    static char cSite[] = "GAPMO";

    sscanf(tszCodeBarre[iEch], "%03d%06d%02d%05d%02d", &iSite, &iPrest, &iPrel, &iEtb, &iCS);

    iCS2 = 0;
    for (i=0 ; i<16 ; i++)
      iCS2 += (tszCodeBarre[iEch][i]-'0')*i;
    iCS2 %= 100;
    if (iCS!=iCS2)
    {
      MessageErr("Erreur de check-sum: lue: %d  recalculÇe: %d", iCS, iCS2);
      iErr = 1;
    }
    else
    {
      iIng = iSite % 26;
      iSite /= 26;
      sprintf(tszReference[iEch], "%c%c%d.%02d", cSite[iSite], 'A'+iIng, iPrest, iPrel);
      sprintf(tszNumEtb[iEch], "%d", iEtb);

      AfficheChamp0(CH0_REFERENCE, A_CHAMP_INACTIF);
      AfficheChamp0(CH0_NUMETB, A_CHAMP_INACTIF);
      AfficheOnglet(iEch, 1);

      ApresModifNumEtb();
    }
  }

  if (iErr && iKey!=KEY_END) iKey = 0;
  return iKey;
}


void AfficheChamps0()
{
  AfficheChamp0(CH0_CODEBARRE, A_CHAMP_INACTIF);
  AfficheChamp0(CH0_REFERENCE, A_CHAMP_INACTIF);
  AfficheChamp0(CH0_NUMETB, A_CHAMP_INACTIF);
  AfficheChamp0(CH0_PREFIXE, A_CHAMP_INACTIF);
  AfficheChamp0(CH0_NOMETB, A_CHAMP_INACTIF);
  AfficheChamp0(CH0_CRITERE, A_CHAMP_INACTIF);
}

void AfficheAnalyse()
{
  AfficheOnglet(iEch, 1);
  AfficheChamps0();
  AfficheBoites();
  iChamp = CH0_CODEBARRE;
  iZone = 0;
}

void Imprime()
{
  int i, j;

  /* 1äre passe: vÇrification */
  for (i=0 ; i<MAXECH ; i++)
  {
    if (tszCritere[i][0] && tszReference[i][0]==0)
    { AfficheOnglet(iEch,0);
      iEch = i;
      AfficheAnalyse();
      iChamp = CH0_REFERENCE;
      AlertOk("","Impression impossible tant que|la rÇfÇrence n'est pas saisie !");
      return;
    }
    for (j=0 ; j<i ; j++)
      if (tszReference[i][0])
	if (strcmp(tszReference[i], tszReference[j])==0)
	{ AfficheOnglet(iEch,0);
	  iEch = i;
	  AfficheAnalyse();
	  AlertOk("","RÇfÇrence en double !");
	  return;
	}
  }


  /* 2äme passe: impression */
  ImpInit();

  for (i=0 ; i<MAXECH ; i++)
    for (j=0 ; j<tnbBoites[i] ; j++)
      Imprime1Etiquette(tszReference[i], tszCritere[i],
	tBoites[i][j].szGermel, tBoites[i][j].iGermel, 
	tBoites[i][j].iDilution, tBoites[i][j].nbBoites,
	tBoites[i][j].iQuantite, tBoites[i][j].iFacteur,
	tBoites[i][j].iTypeMarquage, tBoites[i][j].szComment
	);

  ImpFin();
}

int iSaisieZone0()
{
  int iKey;

  Fkeys("[PgPrec]/[PgSuiv] Analyse prÇcÇdente/suivante  [F7] Impression  [Fin] Menu");

  for (;;)
  {
    switch(iChamp)
    {
      case CH0_CODEBARRE:	/* Code barre */
	iKey = iSaisieCodeBarre();
	break;

      case CH0_REFERENCE:	/* RÇfÇrence */
	Message("RÇfÇrence d'analyse");
	iKey = iInput(7, 38, tszReference[iEch], 11, 11, "A1.");
	MessageErr(NULL);
	break;

      case CH0_NUMETB:	/* N¯ Çtablissement */
	iKey = iSaisieNumEtb();
	break;

      case CH0_PREFIXE:	/* PrÇfixe d'Çtablissement */
	Message("PrÇfixe d'Çtablissement");
	iKey = iInput(9, 27, tszPrefixe[iEch], 10, 10, "A1.");
	MessageErr(NULL);
	break;

      case CH0_NOMETB:	/* Nom d'Çtablissement */
	Message("Nom d'Çtablissement");
	iKey = iInput(9, 38, tszNomEtb[iEch], 40, 40, "A1.- ");
	MessageErr(NULL);
	break;

      case CH0_CRITERE:	/* Critäre */
	iKey = iSaisieCritere();
	break;
    }
  
    switch(iKey)
    {
      case KEY_END:
		 return -1;
      case KEY_F(6):
		return 1;
      case KEY_F(7):
		Imprime();
		break;
      case KEY_UP:
		if (iChamp>0) iChamp--;
		break;
      case KEY_RETURN:
		if (iChamp==CH0_CRITERE)
		{
		/*
		  if (iEch<MAXECH-1)
		  { AfficheOnglet(iEch, 0);
			iEch++;
			AfficheAnalyse();
		  }
		  iChamp = CH0_CODEBARRE;
		*/
		  break;
		}
		else if (iChamp==CH0_CODEBARRE)
		{ iChamp = CH0_CRITERE;
		  break;
		}
      case KEY_DOWN:
      case KEY_TAB:
		if (iChamp<CH0_CRITERE)
		  iChamp++;
		else
		  return 1;
		break;

      case KEY_PGUP:
		if (iEch>0)
		{ AfficheOnglet(iEch, 0);
		  iEch--;
		  AfficheAnalyse();
		  iChamp = CH0_CODEBARRE;
		}
		break;

      case KEY_PGDN:
		if (iEch<MAXECH-1)
		{ AfficheOnglet(iEch, 0);
		  iEch++;
		  AfficheAnalyse();
		  iChamp = CH0_CODEBARRE;
		}
		break;

    }
  }
  return 0;
}


int iSaisieZone1()
{ 
  int	iKey;
  int	iNouvBoite;
  int	i;
  char	szBuffer[20];

  Fkeys("[Fläches] SÇlection  [-] Suppression de boåte  [+] Ajout de boåte");

  iBoite = 0;
  iChamp = CH1_GERMEL;

  for(;;)
  {
    int l0, c0;

    l0 = 13 + iBoite%8;
    c0 = 23 + 30*(iBoite/8);
    switch(iChamp)
    {
      case CH1_GERMEL:
		Message("Germe Ö rechercher");
		iKey = iInput(l0, c0, tBoites[iEch][iBoite].szGermel, 3,3,"A1+");
		MessageErr(NULL);
		break;

      case CH1_DILUTION:
		c0 += 5;
		if (tBoites[iEch][iBoite].iDilution==1)
		  strcpy(szBuffer, "EP");
		else if (tBoites[iEch][iBoite].iDilution==-32768)
		  szBuffer[0] = 0;
		else
		  sprintf(szBuffer, "%d", tBoites[iEch][iBoite].iDilution);
		Message("Dilution, ou EP");
		iKey = iInput(l0, c0, szBuffer, 2,2,"1-EP");
		MessageErr(NULL);
		break;

      case CH1_QUANTITE:
        c0 += 9;
		if (tBoites[iEch][iBoite].iQuantite==-32768)
		  szBuffer[0] = 0;
		else
		  sprintf(szBuffer, "%-3g", tBoites[iEch][iBoite].iQuantite/10.0);
		Message("QuantitÇ Ö diffuser sur une boåte");
		iKey = iInput(l0, c0, szBuffer, 3,3,"1.");
		MessageErr(NULL);
		break;

      case CH1_NBBOITES:
		c0 += 14;
		sprintf(szBuffer, "%d", tBoites[iEch][iBoite].nbBoites);
		Message("Nombre de boåtes Ö marquer");
		iKey = iInput(l0, c0, szBuffer, 1,1,"1");
		MessageErr(NULL);
		break;

      case CH1_TYPEBOITE:
		c0 += 18;
		sprintf(szBuffer, "%d", tBoites[iEch][iBoite].iTypeMarquage);
		Message("Type de marquage: 0=vide, 1=SPP, 4=Çtiquette libre");
		iKey = iInput(l0, c0, szBuffer, 1,1,"1");
		MessageErr(NULL);
		break;
    }

    iNouvBoite = iBoite;

    switch(iKey)
    {
      case KEY_F(7):
		Imprime();
		break;

      case KEY_TAB:
      case KEY_RIGHT:
		iChamp = iChamp+1;
		if (iChamp<=CH1_TYPEBOITE)
		  break;
		iChamp = CH1_GERMEL;
		/* pas de break */

      case KEY_DOWN:
      case KEY_RETURN:
		if (iBoite<tnbBoites[iEch]-1)
		  iNouvBoite++;
		break;

      case KEY_LEFT:
		iChamp--;
		if (iChamp>=0) break;
		iChamp = CH1_TYPEBOITE;
		/* pas de break */

      case KEY_UP:
		if (iBoite>0)
		{ iNouvBoite--;
		  break;
		}
		return 0;

      case KEY_END:
		return -1;

      case KEY_HOME:
		if (iNouvBoite)
		  iNouvBoite = 0;
		else
		  iNouvBoite = tnbBoites[iEch]-1;
		break;

      case KEY_INSERT:
	  case KEY_F(9):
      case '+':
		break;

      case KEY_DELETE:
      case '-':
		/*
		i = iAlert("","Voulez-vous rÇellement|supprimer cette boåte ?|",1,2,"Ok|Annuler");
		*/
		i=1;
		if (i==1)
		{
		  for (i=iBoite+1 ; i<tnbBoites[iEch] ; i++)
			tBoites[iEch][i-1] = tBoites[iEch][i];
		  tnbBoites[iEch]--;
		  if (iNouvBoite>=tnbBoites[iEch])
			iNouvBoite = tnbBoites[iEch]-1;
		  AfficheBoites();
		  if (iNouvBoite<0)
			return 0;
		  iBoite = iNouvBoite;
		}
		break;
    }
    if (iBoite!=iNouvBoite)
      iBoite = iNouvBoite;
  }
}


void Boite()
{
  int i;

  CartoucheStd(szNomApp);
  Titre("PrÇparation d'une sÇrie");

  mvaddstr(5,0,"Analyses");
  mvaddstr(5,23,"DÇtail de l'analyse");
  mvaddstr(12,23,"Boåtes");
  attroff(SOULIGNE);
  mvaddstr(6,23,"Code barre:");
  mvaddstr(7,23,"RÇfÇrence:");
  mvaddstr(8,23,"Etablissement:");
  mvaddstr(10,23,"Critäre:");
  for (i=0 ; i<MAXECH ; i++)
  { move(6+i, 0);
    printw("%2d:",i+1);
  }
  for (i=5 ; i<LINES-4 ; i++)
    mvaddch(i,21,179);

  attron(SOULIGNE);
  iEch = 0;
  AfficheAnalyse();

  iZone = 0;
  iChamp = 0;
  for( ; iZone>=0 ; )
  {
    switch(iZone)
    {
      case 0:	iZone = iSaisieZone0(); break;
      case 1:	iZone = iSaisieZone1(); break;
    }
  }

}

/*====================================================================*/
/* Initialisations */

void InitEnv()
{
  GetEnvString("SYSTEMID", szSystemID, "(systäme inconnu)");
  GetEnvString("TRA_NOM", szNomOperateur, "(sans nom)");
}

void InitSQL()
{
  $database ercem;

  if (sqlca.sqlcode!=0)
  { char szMessage[200];

    sprintf(szMessage, "|PROBLEME GRAVE !||Accäs Ö la base impossible.|Code erreur: %d|", sqlca.sqlerrd);
    fprintf(stderr, "%s: %s\n", szNomApp, szMessage);
    exit(1);
  }
}


void InitBoite()
{
  InitEnv();
  InitSQL();
  InitEcran();
  NoDelInterrupt();
  signal(11,0);

  A_CHAMP_ACTIF	  = INVERSE;
  A_CHAMP_INACTIF = SOULIGNE|BRILLANT;
  A_ETIQUETTE	  = 0;
  A_TOUCHE		  = INVERSE|BRILLANT;
  A_ERREUR		  = INVERSE|CLIGNOTANT;
  if (strncmp(termname(), "vt100", 5)==0)
    A_CHAMP_FIXE = DIMINUE;
  else
    A_CHAMP_FIXE = BRILLANT;

  InputMode(A_CHAMP_ACTIF, A_CHAMP_INACTIF);

  InitHeure();
}

/*====================================================================*/

void main(argc, argv)
int argc;
char **argv;
{
  InitBoite();
  Boite();
  FinHeure();
  FinEcran();
  exit(iExitCode);
}

