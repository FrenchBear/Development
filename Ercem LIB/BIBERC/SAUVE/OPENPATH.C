
/* openpath.c
** Ouvre un fichier en explorant si besoin est les r‚pertoires
** indiqu‚s dans une variable d'environnement
** PV 20/04/93	PremiŠre version
*/


#include <stdio.h>
#include <clib.ref>

FILE *fopenpath(szNomfic, szMode, szVar)
char *szNomfic, *szMode, *szVar;
{
  int	i, nonfin, trouve;
  char	szPath[256];
  char	*st;
  FILE	*f;

  if ((f=fopen(szNomfic, szMode))!=NULL)
    return f;

  if ((st=getenv(szVar))==NULL)
    return NULL;

  i = 0;
  trouve = 0;
  nonfin = 1;
  while (!trouve && nonfin)
  { int j;
    
    for (j=0 ; st[i] && st[i]!=':' ; szPath[j++]=st[i++]) ;
    szPath[j++] = '/';
    szPath[j] = 0;
    strcat(szPath, szNomfic);
    if ((f=fopen(szPath, szMode))!=NULL)
      return f;
    if (st[i]==0) 
      return NULL;
    i++;
  }

  return NULL;
}

