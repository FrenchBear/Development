
/* p4
** Programmation du format des ‚tiquettes sur Intermec 4100
** PV 06/05/94
*/

#include <stdio.h>
#include <fcntl.h>
#include <termio.h>
#include <signal.h>

#include <clib.ref>

int h;
struct termio	term;

#define CAN 24
#define ESC 27
#define ETB 23
#define SI  15
#define STX 2
#define ETX 3
#define ENQ 5

// char *tszAscii[32] =
// {
// };

void iprintf(char *szFormat, ...)
{
  int c = 0;
  char szBuffer[128];

//   szBuffer[0] = ENQ;
//   write(h, szBuffer, 1);
//   read(h, &c, 1);
//   c = c & 127;
//   printf("R‚p ENQ: %d 0x%02x\n", c, c);

  szBuffer[0] = STX;
  vsprintf(szBuffer+1, szFormat, (char *)(1+&szFormat));
  szBuffer[strlen(szBuffer)+1] = 0;
  szBuffer[strlen(szBuffer)] = ETX;
  write(h, szBuffer, strlen(szBuffer));

  read(h, &c, 1);
  c &= 0x7f;
  printf("Lu: %d 0x%02x\n", c, c);
}

static void Cubitus(int iFiller)
{
  // aprintf("Machine","Appel chien de garde");
}

void VideBuffer()
{
  int	c = 0;
  int	j;

  signal(SIGALRM, Cubitus);
  alarm(60);
  for(;;)
  {
	j = read(h, &c, 1); c&=127;
	if (j<0) break;
	printf("VideBuffer: %d 0x%02x  j=%d\n", c, c, j);
  }
  alarm(0);
  signal(SIGALRM, SIG_IGN);
}

main()
{
  int	 errflag;
  
  h = open("/dev/ttya03", O_RDWR);
  if (h<0)
  { perror("Echec … l'ouverture de /dev/ttya03");
    exit(1);
  }

  errflag = ioctl(h, TCGETA, &term);
  if (errflag<0)
    perror("Echec au 1er ioctl");
  term.c_lflag &= ~(ICANON|ECHO);
  term.c_cc[VMIN] = '\1';
  term.c_cc[VTIME] = '\0';
  errflag = ioctl(h, TCSETA, &term);
  if (errflag<0)
    perror("Echec au 2eme ioctl");

  printf("Programmation du mode de fonctionnement\n");
  iprintf("%ce", ESC);
  iprintf("%cR1", SI);
  // iprintf("%cD35", SI);	// Automate
  iprintf("%cD0", SI);		// Ruban
  iprintf("%cL400", SI);
  iprintf("%cI3", SI);

  printf("Programmation du format\n");
  iprintf("%cP;", ESC);
  iprintf("E1;F1;");

// Automate: 0
#define offx 25

  iprintf("H0;o%d,90;f2;c2;d0,11;h2;w2;", 355+offx);		// Ref
  iprintf("H1;o%d,53;f2;c2;d0,4;h1;w2;", 85+offx);			// CritŠre
  iprintf("H2;o%d,33;f2;c2;d0,6;h1;w1;", 85+offx);			// Germe
  iprintf("H3;o%d,92;f2;c2;d0,7;h1;w1;", 85+offx);			// Personne
  iprintf("H4;o%d,72;f2;c2;d0,6;h1;w1;", 85+offx);			// L‚gende
  iprintf("B5;o%d,55;f2;c6,0;i0;d0,16;h34;w1;p@;", 355+offx);// CodeB
  /*
  iprintf("H0;o0,25;f0;c2;d0,11;h2;w2;");
  iprintf("H1;o294,85;f0;c2;d0,4;h1;w2;");
  iprintf("H2;o266,15;f0;c21;d0,5;h1;w1;");
  iprintf("H3;o294,65;f0;c2;d0,7;h1;w1;");
  iprintf("B4;o0,65;f0;c2;i0;d0,14;h34;w1;p@;");
  */
  iprintf("R");

  printf("Impression de l'‚tiquette\n");
  iprintf("%cE1", ESC);
  iprintf("%c", CAN);
  iprintf("MW123456.01\r");
  iprintf("A1\r");
  iprintf("GAM-3\r");
  iprintf("PieVIO\r");
  iprintf("2.5 ml\r");
  iprintf("1234567890123456");
  iprintf("%c", ETB);

  VideBuffer();

  close(h);
}
