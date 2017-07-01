// germe.ec
// Module d'accäs aux germes
// 17/11/94 PV

#include <stdio.h>
#include <biberc.h>
#include <esqlc.h>

#include <t_germe.h>

extern char szNomApp[];


int ger_iLitGermes(int iSuivant)
{
  static int nbGerme;
  static int *tGerme;
  static int iIndex;

  if (nbGerme==0)
  {
	$int inb;
	$int igerme;

	$declare CCount cursor for select count(unique ger_indice)
	  into $inb from germe;
	CTRLSQL;
	$open CCount;
	CTRLSQL;
	$fetch CCount;
	CTRLSQL;
	$close CCount;
	CTRLSQL;
	$free CCount;
	CTRLSQL;

	tGerme = (int *)malloc(inb*sizeof(int));

	$declare CGerme cursor for select unique ger_indice
	  into $igerme from germe;
	CTRLSQL;
	$open CGerme;
	CTRLSQL;
	for(;;)
	{
	  $fetch CGerme;
	  if (sqlca.sqlcode==100) break;
	  CTRLSQL;
	  tGerme[nbGerme++] = igerme;
	}
	$close CGerme;
	CTRLSQL;
	$free CGerme;
	CTRLSQL;
  }

  if (!iSuivant) iIndex = 0;
  if (iIndex>=nbGerme)
	return -1;
  else
	return tGerme[iIndex++];
}

void ger_LitLibGerme(int iGerme, char cLangue, char *szGerme, int iTailleBuffer)
{
  $int ig;
  $char szlangue[2];
  $char szlibelle[100];

  ig = iGerme;
  szlangue[0] = cLangue;
  szlangue[1] = 0;
  $declare cLitGerme cursor for
	select ger_libelle into $szlibelle
	from germe
	where ger_indice=$ig and ger_langue=$szlangue;
  CTRLSQL;
  $open cLitGerme;
  CTRLSQL;
  $fetch cLitGerme;
  if (sqlca.sqlcode==100)
	szlibelle[0] = 0;
  else
	CTRLSQL;
  $close cLitGerme;
  CTRLSQL;
  $free cLitGerme;
  CTRLSQL;

  strncpy2(szGerme, szRTrim(szlibelle), iTailleBuffer);
}

