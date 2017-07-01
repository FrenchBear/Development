
#include <stdio.h>
#include <clib.ref>

void main()
{
  InitEcran();
  NoDelInterrupt();
  signal(11,0);
  signal(3,0);
  refresh();

  AjoutBoite();

  FinEcran();
  exit(0);
}
