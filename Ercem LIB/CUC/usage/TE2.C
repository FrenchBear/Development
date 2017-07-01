
/* te2
** Programmation du format des ‚tiquettes sur Intermec 4100
** PV 06/05/94
*/

#include <stdio.h>
#include <fcntl.h>

#include <clib.ref>

FILE *f;

#define CAN 24
#define ESC 27
#define ETB 23
#define STX 2
#define ETX 3

void iprintf(char *szFormat, ...)
{
  fprintf(f, "%c", STX);
  vfprintf(f, szFormat, (char *)(1+&szFormat));
  fprintf(f, "%c", ETX);
}

main()
{
  
  f = fopen("/dev/ttys0f", "w");
  if (f==NULL)
  { perror("Echec … l'ouverture de /dev/ttys0f");
    exit(1);
  }

  /* programmation du format */
  iprintf("%cP;", ESC);
  iprintf("E1;F1;");
  iprintf("H0;o4,60;f0;c21;d0,11;h1;w1;");
  iprintf("H1;o4,28;f0;c2;d0,4;h2;w2;");
  iprintf("H2;o260,70;f0;c2;d0,5;h2;w2;");
  iprintf("B3;o95,25;f0;c2;i0;d0,14;h34;w1;p@;");
  iprintf("R");


  /* envois... */
  iprintf("%cE1", ESC);
  iprintf("%c", CAN);
  iprintf("GK123456.01\r");
  iprintf("A1\r");
  iprintf("GAM-1\r");
  iprintf("1234567890123456");
  iprintf("%c", ETB);

  fclose(f);
}
