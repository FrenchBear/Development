// conclusion.ec
// Module d'accäs aux conclusions
// 18/11/94 PV

#include <stdio.h>
#include <biberc.h>
#include <esqlc.h>

#include <t_conclusion.h>

extern char szNomApp[];

int con_iLitConclusions(int iSuivant)
{
  static int nbConclusion;
  static int *tConclusion;
  static int iIndex;

  if (nbConclusion==0)
  {
	$int inb;
	$int iconclusion;

	$declare CCount cursor for select count(unique con_indice)
	  into $inb from conclusion
	  where con_libelle[1]<>"[";
	CTRLSQL;
	$open CCount;
	CTRLSQL;
	$fetch CCount;
	CTRLSQL;
	$close CCount;
	CTRLSQL;
	$free CCount;
	CTRLSQL;

	tConclusion = (int *)malloc(inb*sizeof(int));

	$declare Cconclusion cursor for select unique con_indice
	  into $iconclusion from conclusion
	  where con_libelle[1]<>"[";
	CTRLSQL;
	$open Cconclusion;
	CTRLSQL;
	for(;;)
	{
	  $fetch Cconclusion;
	  if (sqlca.sqlcode==100) break;
	  CTRLSQL;
	  tConclusion[nbConclusion++] = iconclusion;
	}
	$close Cconclusion;
	CTRLSQL;
	$free Cconclusion;
	CTRLSQL;
  }

  if (!iSuivant) iIndex = 0;
  if (iIndex>=nbConclusion)
	return -1;
  else
	return tConclusion[iIndex++];
}

void con_LitLibConclusion(int iconclusion, char cLangue, char *szconclusion, int iTailleBuffer)
{
  $int ig;
  $char szlangue[2];
  $char szlibelle[100];

  ig = iconclusion;
  szlangue[0] = cLangue;
  szlangue[1] = 0;
  $declare cLitConclusion cursor for
	select con_libelle into $szlibelle
	from conclusion
	where con_indice=$ig and con_langue=$szlangue;
  CTRLSQL;
  $open cLitConclusion;
  CTRLSQL;
  $fetch cLitConclusion;
  if (sqlca.sqlcode==100)
	szlibelle[0] = 0;
  else
	CTRLSQL;
  $close cLitConclusion;
  CTRLSQL;
  $free cLitConclusion;
  CTRLSQL;

  strncpy2(szconclusion, szRTrim(szlibelle), iTailleBuffer);
}

