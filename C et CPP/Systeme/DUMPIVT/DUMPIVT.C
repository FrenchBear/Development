// dumpivt.v
// affiche la table des vecteurs d'interruptions du mode réel ou du mode V86
// 3/6/95 PV

#include <stdio.h>
#include <dos.h>

int main()
{
  int i;
  void (interrupt far * far * ivt)() = 0;
  
  void (interrupt far * p1)();
  void (interrupt far * p2)();
  
  for (i=0 ; i<256 ; i++)
  {
    p1 = ivt[i];
    p2 = _dos_getvect(i);
  
    printf("%02xh  %Fp  %Fp  %s\n", i, p1, p2, p1==p2 ? "" : "!=");
  }
  
  return 0;
}
