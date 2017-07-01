/* szcase.c
** Routines de conversion de casse de chaånes
** 18/11/94 PV
*/

#include <stdio.h>
#include <clib.ref>

#include "biberc.h"

#include "import.h"


UC *szUCase(UC *s)
{
  UC *s0 = s;

  if (s!=NULL)
	while (*s = majAZ(*s))
	  s++;
  return s0;
}

UC *szLCase(UC *s)
{
  UC *s0 = s;

  if (s!=NULL)
	while (*s = minaz(*s))
	  s++;
  return s0;
}

