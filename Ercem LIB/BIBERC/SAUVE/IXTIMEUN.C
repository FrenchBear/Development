
/* ixtimeunix
** Conversion d'un champ date au format unix (time_t) en date informix
** 23/02/94 FG
*/

#include <time.h>

/* unix -> ix */
long ixtimeunix(dunix)
time_t dunix;
{
  long l;

  dunix /= 24L*60L*60L;
  l = (dunix+25568L);

  return l;
}
