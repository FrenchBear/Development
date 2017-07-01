/* unixtimeix
** Conversion d'un champ date au format informix (long) en date Unix
** 23/02/94 PV
** 10/11/94 FG Retour NULL_INT si NULL_DATE
** 28/11/94 PV	strncat2
*/

#include <time.h>
#include "biberc.h"

#include "import.h"

/* ix -> unix */
time_t dIxToUnix(long dix)
{
  time_t l;

  if (dix!=NULL_INT)
  {
	/* 25568 : nb jours du 1/1/1900 (base ix) -> 31/12/1969 (base unix) */
	l = dix-25568;
	l = l*24*60*60;
	return l;
  }
  else
    return NULL_INT;
}
