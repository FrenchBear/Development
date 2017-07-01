/* m1b.c
** module principal
**
** 27/03/90	V2, Unix, curses et multitƒche
** 26/12/90	Version COM1 et COM2
** 20/05/92	MSC 7.0
**
** Version MS-DOS
*/

#include "m1b.h"

#include "ecran.ref"
#include "clavier.ref"
#include "comm.ref"
#include "proto.ref"

static void init(char *script)
{
  comE_init(script);
  cla_init();
  ecr_init();
  pro_init();
}

static void close()
{
  comE_close();
  ecr_close();
}

static void emul()
{
  for(;;)
  { if (cla_job()<0) break;
    com_job();
  }
}

void main(int argc, char **argv)
{
  if (argc==2)
    init(argv[1]);
  else
    init("");
  emul();
  close();
}

