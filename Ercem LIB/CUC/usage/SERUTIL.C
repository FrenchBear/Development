// serutil.c
// Routiles diverses et vari‚es du module serie

#include <stdio.h>
#include <time.h>
#include <ctype.h>
#include <clib.ref>

#include "serie.h"

//======================================================================
// Convertit une date unix (UT) en chaŒne de 20 caractŠres ann‚e
// … seconde (YS) pour Informix

void UTtoYS(unsigned t, char szBuffer[20])
{
  struct tm *lt;

  lt = localtime(&(time_t)t);
  sprintf(szBuffer, "%4d-%02d-%02d %2d:%02d:%02d",
	lt->tm_year, lt->tm_mon+1, lt->tm_mday,
	lt->tm_hour, lt->tm_min, lt->tm_sec);
}

//======================================================================

static int IdToI(int iId)
{
  int i;

  for (i=0 ; i<nbUtilisateur ; i++)
    if (tabUtilisateur[i].uti_numuti == (short)iId)
      break;
  return i;
}

char *szIdToNom(int iId)
{
  return tabUtilisateur[IdToI(iId)].uti_nom;
}

char *szIdToInit(int iId)
{
  return tabUtilisateur[IdToI(iId)].uti_bal;
}

