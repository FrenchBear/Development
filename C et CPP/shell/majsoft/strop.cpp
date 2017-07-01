/* strop.c
** Op‚rations diverses sur les chaŒnes (termin‚es par un \0)
** PV, D‚cembre 92
** 15/2/96 PV	uchar -> char
*/

#include <stdio.h>
#include <string.h>

#include "strop.h"

/* InsŠre n caractŠres … l'adresse point‚e par p, retourne cette
** adresse.
*/

char *strinsnc(char *p, int n)
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

char *strdelnc(char *p, int n)
{
  char *q, *psauve;

  psauve = q = p;
  if (n>(int)strlen(p)) n = strlen(p);
  p += n;
  while (*q++ = *p++) ;
  return psauve;
}

