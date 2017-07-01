#include <stdio.h>
#include <stdlib.h>

int main()
{
  int i;
  char *p;

  for (i=0 ; i<16*1024 ; i++)
  {
    if (i%64==0)
      printf("\n%5d ", i);
    printf(".");
    p = malloc(1024);
    if (p==NULL)
    { printf("Echec … %d Ko\n", i);
      exit(1);
    }
  }
  return 0;
}
