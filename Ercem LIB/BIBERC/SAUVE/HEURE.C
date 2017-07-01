
/* heure.c
** Fonctions d'affichage d'une pendule
** 12/04/93	1.0  Mise en bibliothäque
*/

#include <stdio.h>
#include <signal.h>

#include <clib.ref>
#include "biberc.ref"

/*====================================================================*/

void AfficheHeure()
{
  mvaddstr(1,0,szDateFr());
}

static void alrmint()
{
  AfficheHeure();
//  signal(SIGALRM, alrmint);
//  alarm(60);
}

void InitHeure()
{
//  signal(SIGALRM, alrmint);
//  alarm(60);
}

void FinHeure()
{
//  alarm(0);
  mvaddstr(1, 0, "                     ");
}
