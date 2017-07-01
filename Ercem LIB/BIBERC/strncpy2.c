/* strncpy2.c
** identique … strncpy, mais termine toujours par un \0
** 22/08/94 PV	Y'en avait marre de strncpy
*/

#include <stdio.h>
#include <string.h>

#include "import.h"

char *strncpy2(char *dest, const char *source, unsigned count)
{
  strncpy(dest, source, count)[count-1] = 0;
  return dest;
}
