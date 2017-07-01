
/* getenv	Lit une chaŒne d'environnement accentu‚e
**		avec valeur par d‚faut
**  9/01/92
** 28/12/92	Retourne le buffer
*/

#include <stdio.h>
#include <string.h>

#include <clib.ref>


char *GetEnvString(szNomEnv, szBuffer, szDefaut)
unsigned char *szNomEnv, *szBuffer, *szDefaut;
{
  unsigned char *p, *p0;
  p0 = szBuffer;

  if ((p=getenv(szNomEnv))!=NULL)
  { while (*szBuffer = *p)
    {
      if (*szBuffer=='\\')
      { *szBuffer = (unsigned char)((p[1]-'0')*64+(p[2]-'0')*8+p[3]-'0');
	p += 3;
      }
      szBuffer++;
      p++;
    }
    *szBuffer = 0;
  }
  else
    strcpy(szBuffer, szDefaut);

  return p0;
}
