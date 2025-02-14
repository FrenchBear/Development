/* getenv	Lit une cha�ne d'environnement accentu�e
**			avec valeur par d�faut
**  9/01/92
** 28/12/92	Retourne le buffer
*/

#include <stdio.h>
#include <string.h>

#include <clib.ref>
#include "biberc.h"

#include "import.h"


char *GetEnvString(const char *szNomEnv, UC *szBuffer, const UC *szDefaut)
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
