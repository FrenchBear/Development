
#include <stdio.h>
#include <io.h>
#include <string.h>
#include <sys\types.h>
#include <sys\stat.h>
#include <dos.h>

int xgetchar()
{
  union REGS reg;

  reg.h.ah = 0;
  int86(0x16, &reg, &reg);
  return reg.h.al;
}

void more(f)
FILE *f;
{
  char buffer[128];
  long lg;
  int  l;
  int  fin = 0;
  int  ic;

  if (f==stdin)
    lg = 0;
  else
    lg = filelength(fileno(f));

  l = 24;

  do
  {
    while (l--)
      if (fgets(buffer,127,f)==NULL)
      { fin = 1;
	break;
      }
      else
	printf("%s",buffer);

    if (fin) return;
    printf("\033[7m More ");
    if (lg) printf("- %d%% ",100*ftell(f)/lg);
    printf("\033[0m ");

    l = 0;
    do
    { ic = xgetchar();
      if (ic==' ') l=24;
      else if (ic=='\r') l=1;
      else if (ic=='q' || ic=='Q') l=-1;
    } while (l==0);
    printf("\r             \r");

  } while (l>0);

}

void main(argc,argv)
char **argv;
{
  if (argc==1)
    more(stdin);
  else
  { int i;
    FILE *f;

    for (i=1 ; i<argc ; i++)
    {
      if (argc>2)
	printf("Fichier: %s\n\n", argv[i]);
      f = fopen(argv[i],"r");
      if (f==NULL)
      { char buffer[128];

	strcat(strcpy(buffer, "more: chec lors de l'accŠs … "), argv[i]);
	perror(buffer);
      }
      else
      { more(f);
	fclose(f);
	if (argc>2)
	  printf("\n\n");
      }
    } /* for i */
  } /* else */

  exit(0);

} /* main */

