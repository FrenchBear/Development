/* heure.c
** Fonctions d'affichage d'une pendule
** 12/04/93		Mise en bibliothŠque
**  3/12/94	PV	Compatibilité avec Dos
*/

#include <stdio.h>
#include <signal.h>

#include <clib.ref>
#include "biberc.h"

#include "import.h"

/*====================================================================*/

void AfficheHeure()
{
  mvaddstr(1,0,szDateFr());
}

#ifdef UNIX  
static void alrmint(int iSignal)
{
  AfficheHeure();
  signal(SIGALRM, alrmint);
  alarm(60);
}
#endif

void InitHeure()
{
#ifdef UNIX
  signal(SIGALRM, alrmint);
  alarm(60);
#endif
}

void FinHeure()
{
#ifdef UNIX
  alarm(0);
#endif
  mvaddstr(1, 0, "                     ");
}
