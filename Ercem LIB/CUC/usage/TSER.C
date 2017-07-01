
#include <stdio.h>
#include <sys/fcntl.h>
#include <termio.h>
#include <signal.h>

#include <clib.ref>

main()
{
  struct termio	term;
  int	 errflag;
  FILE	 *f;

  f = fopen("/dev/tty", "w+");
  if (f==NULL)
  { perror("Echec … l'ouverture de /dev/tty12");
    exit(1);
  }

  errflag = ioctl(fileno(f), TCGETA, &term);
  term.c_lflag &= ~(ICANON|ECHO);
  term.c_cc[VMIN] = '\1';
  term.c_cc[VTIME] = '\0';
  errflag = ioctl(fileno(f), TCSETA, &term);

  fprintf(f, "Hello\r\n");
  /* system("stty -a </dev/tty12"); */

  for(;;)
  { int c;

    read(fileno(f), &c, 1);
    printf("Lu: %d\n", c);
  }

  fclose(f);

}
