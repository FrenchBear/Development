// ds.ec
// Module d'accŠs SQL Dynamique
// 20/11/94 PV	PremiŠre version

#include <stdio.h>
#include <clib.ref>

#include <biberc.h>

#include <esqlc.h>
#include <sqltypes.h>

#include "ds.h"

extern char szNomApp[];
static char *szNomModule = "SQL Dynamique";

struct Dynaset
{
  char	szType[4];			// Pour contr“le de type de pointeur
  struct sqlda sda;			// Descripteur des variables de stockage
  int	sqlcode;			// status du dernier fetch
  _SQCURSOR _SQ1;			// Curseur statique du ESQL/C
};

#define CtrlTypeDynaset(ds) Assert(ds!=NULL); Assert(strcmp((char *)ds, "DYN")==0)

struct Dynaset *ds_CreateDynaset(char *szRequete)
{
  int i;
  struct Dynaset *ds;
  struct sqlda *sda;		// Descripteur SQL
  char	*m;
  static int iNbCurs = 0;
  char	szNomCurs[10];		// Nom interne du curseur

  // On alloue la m‚moire pour l'objet
  ds = malloc(sizeof(struct Dynaset));
  memset(ds, 0, sizeof(struct Dynaset));
  Assert(ds!=NULL);
  strcpy(ds->szType, "DYN");

  // On fait pr‚parer la requˆte par le moteur SQL
  //$prepare prep for szRequete;
  _iqprepare(&(ds->_SQ1), szRequete);
  CTRLSQL;

  // Et on lui demande de la d‚crire
  //$describe prep into sda;
  _iqdscribe(&(ds->_SQ1), &sda);
  CTRLSQL;

  // On duplique cette description
  ds->sda.sqld = sda->sqld;
  ds->sda.sqlvar = (struct sqlvar_struct *)malloc(sda->sqld*sizeof(struct sqlvar_struct));

  // Allocation de l'espace de stockage et duplication
  for (i=0 ; i<sda->sqld ; i++)
  {
	ds->sda.sqlvar[i].sqlname = strdup(sda->sqlvar[i].sqlname);
	switch(sda->sqlvar[i].sqltype)
	{
	  case SQLSMINT:		// Shorts stock‚s en entiers !!!
	  case SQLINT:
	  case SQLDATE:
	  case SQLSERIAL:
		m = malloc(2+sizeof(int));
		ds->sda.sqlvar[i].sqltype = CINTTYPE;
		ds->sda.sqlvar[i].sqllen = sizeof(int);
		ds->sda.sqlvar[i].sqlind = (short *)m;
		ds->sda.sqlvar[i].sqldata = m+2;
		break;
	  case SQLCHAR:
		m = malloc(3+sda->sqlvar[i].sqllen);
		ds->sda.sqlvar[i].sqltype = CCHARTYPE;
		ds->sda.sqlvar[i].sqllen = (short)(1+sda->sqlvar[i].sqllen);
		ds->sda.sqlvar[i].sqlind = (short *)m;
		ds->sda.sqlvar[i].sqldata = m+2;
		break;
	  case SQLDTIME:
		m = malloc(2+20);
		ds->sda.sqlvar[i].sqltype = CCHARTYPE;
		ds->sda.sqlvar[i].sqllen = 20;
		ds->sda.sqlvar[i].sqlind = (short *)m;
		ds->sda.sqlvar[i].sqldata = m+2;
		break;
	  default:
		printf("Type %d non trait‚ par ds_CreateDynaset\n",
		  sda->sqlvar[i].sqltype);
		exit(1);
	}
	ds->sda.sqlvar[i].sqlformat = NULL;
	ds->sda.sqlvar[i].sqlilen = 0;
	ds->sda.sqlvar[i].sqlitype = 0;
	ds->sda.sqlvar[i].sqlidata = NULL;
  }

  //$declare curs cursor for prep;
  sprintf(szNomCurs, "ds%d", ++iNbCurs);
  _iqddclcur(&(ds->_SQ1), szNomCurs, 0);
  CTRLSQL;

  //$open curs;
  _iqcopen(&(ds->_SQ1), 0, (char *) 0, (char *) 0, (char *) 0, 0);
  CTRLSQL;

  // On m‚morise le curseur
  //ds->_SQ1 = _SQ1;

  // Et on se place sur le premier enregistrement
  ds_MoveNext(ds);

  return ds;
}


void ds_Dump(struct Dynaset *ds)
{
  int i;

  CtrlTypeDynaset(ds);

  printf("@ds:%x nb:%d sqlvar:%x\n", ds, ds->sda.sqld, ds->sda.sqlvar);
  for (i=0 ; i<ds->sda.sqld ; i++)
	printf("%d: %-18.18s %3d %2d %x\n", i, ds->sda.sqlvar[i].sqlname, ds->sda.sqlvar[i].sqltype, ds->sda.sqlvar[i].sqllen, ds->sda.sqlvar[i].sqldata);
}


int ds_CloseDynaset(struct Dynaset *ds)
{
  int i;

  CtrlTypeDynaset(ds);

  ds->szType[0] = 0;	// On efface le type par s‚curit‚
  // On libŠre la m‚moire des champs de donn‚es
  for (i=0 ; i<ds->sda.sqld ; i++)
  { free(ds->sda.sqlvar[i].sqlind);
	free(ds->sda.sqlvar[i].sqlname);
  }

  // On restaure le curseur E/SQL-C
  //_SQ1 = ds->_SQ1;

  //$close curs;
  _iqclose(&(ds->_SQ1));
  CTRLSQL;

  //$free curs;
  _iqfree(&(ds->_SQ1));
  CTRLSQL;

  // On libŠre la copie de la description...
  free(ds->sda.sqlvar);
  // Puis l'objet
  free(ds);

  return 1;
}

//======================================================================

// Retour d'un champ num‚rique … partir de son indice (usage interne)
static int iRecupInt(struct Dynaset *ds, int iIndice, char *szFonction)
{
  switch (ds->sda.sqlvar[iIndice].sqltype)
  {
	case CINTTYPE:
	  return *(int *)ds->sda.sqlvar[iIndice].sqldata;
	default:
	  aprintf(szNomModule, "%s: Le champ %d:%s n'est pas de type num‚rique !", szFonction, iIndice, ds->sda.sqlvar[iIndice].sqlname);
	  return 0;
  }
}

// Lecture d'un champ num‚rique … partir de son nom
int ds_iGetFieldNum(struct Dynaset *ds, char *szChamp)
{
  int i;

  CtrlTypeDynaset(ds);
  Assert(szChamp!=NULL);
  Assert(!ds_iEOF(ds));

  for (i=0 ; i<ds->sda.sqld ; i++)
	if (stricmp(ds->sda.sqlvar[i].sqlname, szChamp)==0)
	  return iRecupInt(ds, i, "ds_iGetFieldNum");

  aprintf(szNomModule, "ds_iGetFieldNum: Champ %s inconnu !", szChamp);
  return 0;
}


// Lecture d'un champ num‚rique connaissant son indice
int ds_iGetFieldNumInd(struct Dynaset *ds, int iIndice)
{
  CtrlTypeDynaset(ds);
  Assert(!ds_iEOF(ds));

  if (iIndice<0 || iIndice>=ds->sda.sqld)
  { aprintf(szNomModule, "ds_iGetFieldNum: L'indice doit ˆtre compris entre 0 et %d !", ds->sda.sqld-1);
	return 0;
  }
  return iRecupInt(ds, iIndice, "ds_iGetFieldNumInd");
}

//======================================================================

// Retour d'un champ texte … partir de son indice (usage interne)
static char *szRecupStr(struct Dynaset *ds, int iIndice, char *szFonction, char *szBuffer, int iTailleBuffer)
{
  switch (ds->sda.sqlvar[iIndice].sqltype)
  {
	case CCHARTYPE:
	  return strncpy2(szBuffer, ds->sda.sqlvar[iIndice].sqldata, iTailleBuffer);
	default:
	  aprintf(szNomModule, "%s: Le champ %s n'est pas de type chaŒne !", szFonction, iIndice, ds->sda.sqlvar[iIndice].sqlname);
	  return NULL;
  }
}

// Fonction publique de lecture de champ texte … partir de son nom
char *ds_szGetFieldStr(struct Dynaset *ds, char *szChamp, char *szBuffer, int iTailleBuffer)
{
  int i;

  CtrlTypeDynaset(ds);
  Assert(szChamp!=NULL);
  Assert(szBuffer!=NULL);
  Assert(!ds_iEOF(ds));

  for (i=0 ; i<ds->sda.sqld ; i++)
	if (stricmp(ds->sda.sqlvar[i].sqlname, szChamp)==0)
	  return szRecupStr(ds, i, "ds_iGetFieldStr", szBuffer, iTailleBuffer);
  aprintf(szNomModule, "ds_iGetFieldStr: Champ %s inconnu !", szChamp);
  return NULL;
}


// Fonction publique de lecture de champ texte … partir de son indice
char *ds_szGetFieldStrInd(struct Dynaset *ds, int iIndice, char *szBuffer, int iTailleBuffer)
{
  CtrlTypeDynaset(ds);
  Assert(szBuffer!=NULL);
  Assert(!ds_iEOF(ds));

  if (iIndice<0 || iIndice>=ds->sda.sqld)
  { aprintf(szNomModule, "ds_iGetFieldStrInd: L'indice doit ˆtre compris entre 0 et %d !", ds->sda.sqld-1);
	return 0;
  }
  return szRecupStr(ds, iIndice, "ds_iGetFieldStrInd", szBuffer, iTailleBuffer);
}

//======================================================================

// Se positionne sur l'enregistrement suivant
int ds_MoveNext(struct Dynaset *ds)
{
  struct sqlda *sda;		// Descripteur SQL

  CtrlTypeDynaset(ds);
//ds_Dump(ds);

  // On r‚cupŠre la copie du descripteur
  sda = &ds->sda;

  //$fetch curs using descriptor sda;
  _iqnftch(&(ds->_SQ1), 0, (char *) 0, &ds->sda, 1, (long) 0, 0, (char *) 0, (char *) 0, 0);
  CTRLSQL;
  ds->sqlcode = sqlca.sqlcode;

  return ds->sqlcode;
}

// D‚termine si on est en fin de fichier
// Faux tant qu'on est sur le dernier enregistrement
// Vrai dŠs qu'on fait un MoveNext … partir de cette position
int ds_iEOF(struct Dynaset *ds)
{
  CtrlTypeDynaset(ds);
  return ds->sqlcode==100;
}

//======================================================================

// Pour r‚cup‚rer rapidement le premier champ du premier enregistrement
// correspondant … la requˆte.
// Pratique pour un select count(*)...
int ds_ExpressGetNum(char *szRequete)
{
  struct Dynaset *ds;
  int i;

  ds = ds_CreateDynaset(szRequete);
  i = ds_iGetFieldNumInd(ds, 0);
  ds_CloseDynaset(ds);
  return i;
}

