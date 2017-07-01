/* strncat2.c
** identique … strncat, mais termine toujours par un \0
** 28/08/94 PV
*/

#include <stdio.h>
#include <string.h>

#include "import.h"

char *strncat2(char *dest, const char *source, unsigned count)
{
  strncat(dest, source, count)[count-1] = 0;
  return dest;
}
