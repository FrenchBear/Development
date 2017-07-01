
/* strstr.c
**
** Fonction de la bibliothäque C sous dos mais pas disponible sous
** Unix...
** 25/03/94 FG  Correction bug sur test boucle for(i=-8;i--; ) ...
*/

#include <stdio.h>

char *strstr(s1, s2)
char *s1, *s2;
{
  int i;
  int l2 = strlen(s2);

  for (i=strlen(s1)-l2+1 ; i>0; i--)
  { if (strncmp(s1, s2, l2)==0)
      return s1;
    s1++;
  }
  return NULL;

} /* strstr */
