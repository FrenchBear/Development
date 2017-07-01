#include <stdio.h>
#include <time.h>

main()
{
  long t = time(0L);
  struct tm *d = localtime(&t);

  printf("set today=%2d%02d%02d\n", d->tm_year, d->tm_mon+1, d->tm_mday);
  exit(0);
}
