// Test du Warning Level
// PV 19/6/94

#include <stdio.h>
#include <malloc.h>

int main()
{
  char *p;

  p = malloc(10000000);
  if (p==NULL)
    perror("Echec au malloc");
  else
    printf("Ok alloc 1 bloc de 10Mo !\n");

  free(p);
  return 0;
}
