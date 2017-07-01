
/* chorl.c	implantation des routines horl_debut et horl_fin
**		en faisant appel … la routine ftime.
*/

#include <sys\types.h>
#include <sys\timeb.h>

struct timeb tdebut,tfin;

horl_debut()
{
  ftime(&tdebut);
}

horl_fin()
{
  int secs,milisec;

  ftime(&tfin);
  secs = tfin.time-tdebut.time;
  milisec = tfin.millitm-tdebut.millitm;
  if (milisec<0)
  {
    milisec += 1000;
    secs--;
  }
  printf("Dur‚e d'ex‚cution: %d.%3.3d s\n",secs,milisec);
}

