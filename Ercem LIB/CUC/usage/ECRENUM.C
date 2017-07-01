// ecrenum.c
// Programme recalculant les num‚ros de ligne #line faisant r‚f‚rence
// au fichier d'origine .ec aprŠs la passe fglc2 d'informix 4
// Cette commande est appel‚e uniquement par c4gl
// PV 20/7/94

#include <stdio.h>
#include <clib.ref>

int		iLigne;
char	szBuffer[5000];
FILE	*fs, *fd, *ff;

#define MAXREF 1000
struct
{
  int	iLigne;
  int	iLigneOrg;
} tL[MAXREF];
int nbRef;

main(int argc, char **argv)
{
  int	i, j;

  if (argc!=5)
  {
	printf("Usage: ecrenum f.ec f.c f2.c fich\n");
	printf("f.ec est le fichier .ec aprŠs la passe pr‚processeur\n");
	printf("f.c  est le fichier aprŠs la passe fglc2 dont les directives #line vont ˆtre\n     resynchronis‚es\n");
	printf("f2.c est le fichier … g‚n‚rer\n");
	printf("fich est le nom du fichier de base concern‚ par les #line\n");
	exit(1);
  }

  fs = fopen(argv[1], "r");
  if (fs==NULL)
  { fprintf(stderr, "Echec … l'ouverture du fichier \"%s\": ", argv[1]);
	perror("");
	exit(1);
  }

  fd = fopen(argv[2], "r");
  if (fd==NULL)
  { fprintf(stderr, "Echec … l'ouverture du fichier \"%s\": ", argv[2]);
	perror("");
	exit(1);
  }

  ff = fopen(argv[3], "w");
  if (ff==NULL)
  { fprintf(stderr, "Echec … l'ouverture du fichier \"%s\": ", argv[3]);
	perror("");
	exit(1);
  }

  // Analyse du fichier .ec pour trouver la correpondance lignes/
  // lignes d'origine
  nbRef = 0;
  iLigne = 1;
  while (fgets(szBuffer, 5000, fs)!=NULL)
  { int iLO;
	char szNomfic[256];

	if (strncmp(szBuffer, "#line", 5)==0)
	{
	  sscanf(szBuffer+5, "%d \"%[^\"]", &iLO, szNomfic);
	  if (strcmp(argv[4], szNomfic)==0)
	  { tL[nbRef].iLigne = iLigne;
		tL[nbRef].iLigneOrg = iLO;
		nbRef++;
	  }
	}
	iLigne++;
  }
  fclose(fs);

/*
  printf("R‚f‚rences\n");
  for (i=0 ; i<nbRef ; i++)
	printf("%5d: %5d\n", tL[i].iLigne, tL[i].iLigneOrg);
  printf("\n");
*/
  
  iLigne = 1;
  for(;;)
  {
	int		iLO, iLNum;
	char	szNomfic[256];

	if (fgets(szBuffer, 5000, fd)==NULL) break;

	if (strncmp(szBuffer, "#line", 5)==0)
	{
	  sscanf(szBuffer+5, "%d \"%[^\"]", &iLO, szNomfic);
	  if (strcmp(argv[4], szNomfic)==0)
	  {
		for (j=0 ; j<nbRef ; j++)
		  if (iLO<tL[j].iLigne) break;
		j--;

		if (j>=0)
		{ char szNum[6];

		  iLNum = strchr(szBuffer+6, ' ')-(szBuffer+6);

		  sprintf(szNum, "%*d", iLNum, iLO-tL[j].iLigne+tL[j].iLigneOrg);
		  strncpy(szBuffer+6, szNum, strlen(szNum));


		  // printf("%d: %d -> %d\n", iLigne, iLO, iLO-tL[j].iLigne+tL[j].iLigneOrg);
		}
	  }
	}

	fputs(szBuffer, ff);

	iLigne++;
  }

  fclose(fd);
  fclose(ff);

}
