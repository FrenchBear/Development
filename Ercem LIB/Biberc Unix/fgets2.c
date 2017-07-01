/* fgets2.c
** identique … fgets, mais ‚limine le \n en fin de ligne
** 22/08/94 PV	Trainait un peu partout...
*/

#include <stdio.h>
#include <string.h>

#include "import.h"

char *fgets2(char *buffer, int taille, FILE *f)
{
  char *p = fgets(buffer,taille,f);
  if (p!=NULL) buffer[strlen(buffer)-1] = 0;
  return p;
}
