
/* stricmp.c
** Routines de comparaison non sign‚es
** Pr‚sentes dans la biblio C standard, mais pas sous Unix...
** PV 2/2/94
*/

#include "biberc.ref"

int stricmp(s1, s2)
unsigned char *s1, *s2;
{
  unsigned char c1, c2;

  while ((c1=majAZ(*s1))==(c2=majAZ(*s2)) && *s1)
  { s1++;
    s2++;
  }
  return c1-c2>0?1:(c1-c2<0?-1:0);
}


int strnicmp(s1, s2, n)
unsigned char *s1, *s2;
int n;
{
  unsigned char c1, c2;
  while ((c1=majAZ(*s1))==(c2=majAZ(*s2)) && n>0 && *s1)
  { s1++;
    s2++;
    n--;
  }
  if (n==0) return 0;
  return c1-c2>0?1:(c1-c2<0?-1:0);
}
