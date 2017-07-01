// escral.ec
// Entr‚es/Sorties des CRA Labo
// 02/11/94 PV

#include <stdio.h>
#include <clib.ref>

#include <biberc.h>
#include <sqlplus.h>

#include "escral.h"

//======================================================================
// Identification

extern char szNomApp[];
extern char szTitreApp[];

//======================================================================
// Variables priv‚es

//======================================================================
// AccŠs … la base de donn‚es

#include <esqlc.h>
#include <decimal.h>

#include <t_labcrat.h>

//======================================================================
// Recherche les cl‚s pour la requˆte pass‚e en paramŠtre sur la table
// labcrat. Appelle la fonction iEnum pour chaque r‚f‚rence trouv‚e.
// Un retour <0 de iEnum interrompt l'‚num‚ration.
// Colonnes symboliques trait‚es: ref et numetb
// retour: <0: problŠme
//		   >=0: Nb de r‚f‚rences lues

int cral_iRechCRALt(int iNbCol, char **tszCol, char **tszQuery, int iFlags, int (*iEnum)(char *szRef))
{
  char	szTmp[500];
  $char	szsql[1000];
  int	i, j;
  int	iNb;

  strcpy(szsql, "select lct_ref from labcrat where ");
  for (i=0 ; i<iNbCol ; i++)
  { 
	if (i) strcat(szsql, "and ");

	if (stricmp(tszCol[i], "ref")==0)
	{ if (j = sqp_iQueryToSQL("lct_ref", tszQuery[i], 'A', szTmp, sizeof(szTmp))<0)
	  { aprintf("ERREUR INTERNE !", "escral: cral_iRechCRALt:|Echec au iQueryToSQL(\"lct_ref\",\"%s\", ...)|Retour: %d", tszQuery[i], j);
		return -1;
	  }
	}
	else if (stricmp(tszCol[i], "numetb")==0)
	{ if (j = sqp_iQueryToSQL("lct_numetb", tszQuery[i], 'N', szTmp, sizeof(szTmp))<0)
	  { aprintf("ERREUR INTERNE !", "escral: cral_iRechCRALt:|Echec au iQueryToSQL(\"lct_numetb\",\"%s\", ...)|Retour: %d", tszQuery[i], j);
		return -1;
	  }
	}
	else
	{
	  aprintf("ERREUR INTERNE !", "escral: cral_iRechCRALt: colonne %s inconnue dans la table labcrat !", tszCol[i]);
	  return -1;
	}

	// +5: on pr‚voit pour le "and " suivant ‚ventuel
	if (strlen(szsql)+strlen(szTmp)+5>=sizeof(szsql))
	{ aprintf("ERREUR INTERNE !", "escral: cral_iRechCRALt: D‚bordement de la variable szsql !");
	  return -1;
	}
	strcat(strcat(szsql, szTmp), " ");
  }

  $prepare pReq from $szsql;
  CTRLSQL;
  $declare cReq cursor for pReq;
  CTRLSQL;
  $open cReq;
  CTRLSQL;
  iNb = 0;
  for(;;)
  {
	$char szref[11];
	$fetch cReq into $szref;
	if (sqlca.sqlcode==100) break;
	CTRLSQL;

	iNb++;
	if (iEnum(szref)<0)
	  break;
  }

  $close cReq;
  CTRLSQL;
  $free cReq;
  CTRLSQL;
  $free pReq;
  CTRLSQL;

  return iNb;
}

// Idem cral_iRechCRALt mais d'accŠs simplifi‚ pour une requˆte sur
// une seule colonne
int cral_iRechCRAL1(char *szCol, char *szQuery, int iFlags, int (*iEnum)(char *szRef))
{
  return cral_iRechCRALt(1, &szCol, &szQuery, iFlags, iEnum);
}

//======================================================================
// Lecture d'un CRA labo … partir de sa cl‚
// Retour: 0:   Ok
//		   100: Rien … lire...
//		   -1:  ProblŠme

int cral_iLitCRAL(char *szRef, char cLangue, struct CRAL *p, int iFlags)
{
  $char *szref;
  $struct T_LABCRAT lct;

  // Lecture de la tˆte
  szref = szRef;
  $select lct_ref,lct_critere,lct_vercrit,lct_methode,lct_numetb,
		  lct_datedebana, lct_conclusion, lct_cprin,
		  lct_observations
	into $lct.lct_ref,
		 $lct.lct_critere,
		 $lct.lct_vercrit,
		 $lct.lct_methode,
  		 $lct.lct_numetb,
		 $lct.lct_datedebana,
		 $lct.lct_conclusion,
		 $lct.lct_cprin,
		 $lct.lct_observations
	from labcrat
	where lct_ref = $szref;
  CTRLSQL;

  if (sqlca.sqlcode==100)	// Pas de donn‚es trouv‚es
	return 100;
  
  strncpy2(p->szReference, szRTrim(lct.lct_ref), sizeof(p->szReference));
  strncpy2(p->szCritere, szRTrim(lct.lct_critere), sizeof(p->szCritere));
  p->iVerCrit = lct.lct_vercrit;
  strncpy2(p->szMethode, szRTrim(lct.lct_methode), sizeof(p->szMethode));
  p->iNumEtb = lct.lct_numetb;
  strncpy2(p->szDateDebAna, szRTrim(lct.lct_datedebana), sizeof(p->szDateDebAna));
  p->iConclusion = lct.lct_conclusion;
  p->iCPrin = lct.lct_cprin;
  strncpy2(p->szObservations, szRTrim(lct.lct_observations), sizeof(p->szObservations));

  if (!(iFlags&CRAL_TETESEULE))
  {
	// Lecture du corps
	// ...
  }

  return 0;
}

//======================================================================

int cral_iEcritCRAL(char *szRef, struct CRAL *pCRAL, int iFlags)
{

  return 0;
}
