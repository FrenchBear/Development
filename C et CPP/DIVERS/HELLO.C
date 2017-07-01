#include <stdio.h>
#include "mesdef.h"

main()
begin
  int *p;

  p = malloc(sizeof(int));

  *p = 12;
  printf("*p = %d\n", *p);

  free(p)

end
