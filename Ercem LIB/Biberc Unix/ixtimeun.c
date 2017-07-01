/* ixtimeunix
** Conversion d'un champ date au format unix (time_t) en date informix
** 23/02/94 FG
**  3/12/94 PV	Portabilit‚ Dos
*/

#include <time.h>
#include "biberc.h"

#include "import.h"

/* unix -> ix */
long dUnixToIx(time_t dUnix)
{
  long l;

  if (dUnix!=NULL_INT)
  {
	dUnix /= 24*60*60L;
	/* 25568 : nb jours du 1/1/1900 (base ix) -> 31/12/1969 (base unix) */
	l = (dUnix+25568);
	return l;
  }
  else
    return NULL_INT;

}
