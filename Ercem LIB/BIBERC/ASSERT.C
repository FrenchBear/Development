/* assert.c
** Version de biberc
** 18/11/94 PV
** 24/11/94 PV	Utilisation de FinEcran … la place de stopcurses
** 11/01/95 PV  Ecriture sur stdout
*/

#include <stdlib.h>			/* exit */
#include <signal.h>
#include "biberc.h"

#include "import.h"

void BibercAssert(const char *szExpression, const char *szFichier, const int iLigne)
{
  if (!iModeCurses)
  { char szBuffer[80];

	printf("\nECHEC AU ASSERT\nTransmettez … la DI les informations suivantes:\nFichier: %s ligne %d\nExpression: %s\n(Return pour continuer)\n", szFichier, iLigne, szExpression);
	gets(szBuffer);
  }
  else
  {
	char szMessage[200];
	int i;

	sprintf(szMessage, "|Transmettez … la DI les informations suivantes:|Fichier: %s ligne %d|Expression: %s|", szFichier, iLigne, szExpression);
	i = iAlert("ERREUR INTERNE: ECHEC AU ASSERT", szMessage, 1,1, "Abandonner|Ignorer");
	if (i==1)
	{
	  if (iModeCurses) FinEcran();
	  printf("\nbiberc: AssertBiberc.c: Interruption sur assertion non v‚rifi‚e.\nFichier: %s ligne %d\nExpression: %s\n", szFichier, iLigne, szExpression);
	  exit(2);
	}
  }
}

