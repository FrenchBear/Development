/* strop.c
** Op‚rations diverses sur les chaŒnes (termin‚es par un \0)
** PV, D‚cembre 92
*/

#include <stdio.h>
#include <string.h>
#include "biberc.h"

#include "import.h"


/* InsŠre n caractŠres … l'adresse point‚e par p, retourne cette
** adresse.
*/

UC *strinsnc(UC *p, int n)
{
  int l = strlen(p)+1;
  p += l+n-1;
  while (l--)
  { *p = *(p-n);
    p--;
  }
  return p;
}


/* Efface n caractŠres … l'adresse point‚e par p, retourne cette
** adresse.
*/

UC *strdelnc(UC *p, int n)
{
  UC *q, *psauve;

  psauve = q = p;
  if (n>(int)strlen(p)) n = strlen(p);
  p += n;
  while (*q++ = *p++) ;
  return psauve;
}

