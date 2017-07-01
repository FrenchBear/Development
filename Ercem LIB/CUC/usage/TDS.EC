// tds.ec
// Test du module Dynamic SQL
// 20/11/94 PV

#include <stdio.h>
#include <clib.ref>

#include <biberc.h>

#include <esqlc.h>

#include "ds.h"

char szNomApp[] = "tds";

void main()
{
  struct Dynaset *dsGerme;
  char	szReq[200];
  int	iNb;

  $database ercem;
  CTRLSQL;

  dsGerme = ds_CreateDynaset("select ger_indice,ger_libelle,timestamp from germe where ger_langue='F' order by ger_indice");
  while (!ds_iEOF(dsGerme))
  {
	int iGerme;
	char szLibelle[60];
	char szTS[20];

	iGerme = ds_iGetFieldNum(dsGerme, "ger_indice"), 
	ds_szGetFieldStr(dsGerme, "ger_libelle", szLibelle, sizeof(szLibelle));
	ds_szGetFieldStr(dsGerme, "timestamp", szTS, sizeof(szTS));

	//sprintf(szReq, "select count(*) iNb from criterel where crl_germe=%d", iGerme);
	//iNb = ds_ExpressGetNum(szReq);
	iNb = 0;

	printf("%3d: %s %s %d\n", iGerme, szLibelle, szTS, iNb);

	//getchar();
	ds_MoveNext(dsGerme);
  }
  ds_CloseDynaset(dsGerme);

  exit(0);
}
