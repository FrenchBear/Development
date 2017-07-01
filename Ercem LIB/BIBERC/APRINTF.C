/* aprintf.c
** printf version boåte de dialogue, tres pratique
** 10/10/94 PV
** 11/01/95 PV  Ecriture sur stdout
*/

#include "biberc.h"

#include "import.h"

/*====================================================================*/
/* Routine pratique de message d'erreur
*/

void aprintf(const char *szTitre, const char *szFormat, ...)
{
  char szBuffer[2000];

  vsprintf(szBuffer, szFormat, (char *)((&szFormat)+1));
  if (!iModeCurses)
	printf("%s\n%s\n", szTitre, szBuffer);
  else
	AlertOk(szTitre, szBuffer);
}

