
/* unixtimeix
** Conversion d'un champ date au format informix (long) en date Unix
** 23/02/94 PV
*/

#include <time.h>

time_t unixtimeix(dix)
long dix;
{
  time_t l;
  l = (dix-25568);
  l *= 24L*60L*60L;
  return l;
}
