
#include <stdio.h>

main()
{
  char szBuffer[100];
  FILE *f = fopen("f1", "r");
  while (fgets(szBuffer, 100, f) != NULL)
  { szBuffer[strlen(szBuffer)-1] = 0;
    printf("<%s>\n", szBuffer);
  }
  return 0;
}
