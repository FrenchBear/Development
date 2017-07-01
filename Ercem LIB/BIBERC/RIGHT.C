/* right.c
** Obtention d'un pointeur sur les caractäres Ö droite d'une chaåne
** 23/11/94 PV
*/

#include <stdio.h>
#include <clib.ref>

#include "biberc.h"

#include "import.h"


char *szRight(char *szBuffer, int iNbCar)
{
  int l;
  Assert(szBuffer!=NULL);
  Assert(iNbCar>=0);
  l = strlen(szBuffer);
  if (iNbCar>l) iNbCar = l;
  return szBuffer+l-iNbCar;
}

