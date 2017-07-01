/* sqlfatal.c
** Sortie d'urgence d'un programme
** S'utilise avec la macro CTRLSQL de esqlc.h
** 14/09/94 PV	Extrait de disquette du serveur
** 19/09/94 PV	SQLFatal nouvelle version
*/

#include <stdlib.h>			// exit
#include <time.h>
#include "biberc.h"

#include "import.h"


void SQLFatal(const char *szApplication, const char *szFichier, int iLigne, int iErr, const char *szMsgUser)
{

#ifdef UNIX
  char szCmd[16];
  FILE *f;

  if (iModeCurses) FinEcran();
  printf("\nERREUR FATALE SQL !\nPr‚venez la DI en transmettant les informations de la ligne suivante:\n%s: %s(%d): sqlca.sqlcode: %d\n\n", szApplication, szFichier, iLigne, iErr);
  if (szMsgUser!=NULL) printf("%s\n\n", szMsgUser);
  sprintf(szCmd, "ierr %d", iErr);
  system(szCmd);

  f = fopen("/usr/log/error.log", "a");
  if (f!=NULL)
  {
	time_t t = time(0L);
	fprintf(f, "\n-----------------------------------\nERREUR FATALE SQL !\n%s: %s(%d): sqlca.sqlcode: %d\n",
	  szApplication, szFichier, iLigne, iErr);
	if (szMsgUser!=NULL) fprintf(f, "%s\n", szMsgUser);
	fprintf(f, "Date: %s", ctime(&t));
	fclose(f);
  }
  exit(1);
#endif
}

