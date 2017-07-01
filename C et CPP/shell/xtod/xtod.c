// xtod.c
// Conversion de fichiers texte Unix en fichiers Dos
// Traire tous les fichiers passés sur la ligne de commande.
// Attention, le focntionnement est différent de la commande Unix xtod.
//
// Linké avec setargv pour l'expansion des paramètres
//
// 26/05/95 PV
// 29/07/96 PV	Accentuation OEM des messages d'erreur; options

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <io.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/utime.h>

char szNomProg[_MAX_FNAME];
int bModeXtoD;
int	bOptR;

_inline void Identification()
{
  printf("XtoD/DtoX 1.2\nConvertit les fins de ligne dans des fichiers texte\nentre les conventions Unix et Dos\n");
}


_inline void Usage()
{
  printf("Usage: %s [-r] fichier...\n", szNomProg);
  if (bModeXtoD)
    printf("Convertit les fins de ligne \\n [Unix] (ou les \\r si opt -r) en \\r\\n [Dos]\n");
  else
    printf("Convertit les fins de ligne \\r\\n [Dos] en \\n (ou \\r si opt -r) [Unix]\n");
}

_inline void Info()
{
  printf("Fichier:          "  __FILE__  "\n"
	     "Date compilation: " __DATE__  " " __TIME__ "\n"
         "Date fichier:     " __TIMESTAMP__ "\n"
         "Compilateur:      MSC %d\n"
	     "Copyright:        (c) 1996 P.VIOLENT", _MSC_VER);
}


static void AtoB(char *szNomfic)
{
  int	i, h;
  long	lFic;
  int	lLu, lEcrit, lAEcrire;
  char	*szBuffer, *s, *d, c, lc;
  int	nbTr;
  struct stat sb;
  struct _utimbuf ub;

  h = open(szNomfic, O_RDONLY|O_BINARY);
  if (h<0)
  {
    fprintf(stderr, "%s: Echec … l'ouverture en lecture du fichier '%s': ", szNomProg, szNomfic);
	perror("");
	return;
  }

  i = fstat(h, &sb);
  if (i<0)
  {
    fprintf(stderr, "%s: Echec au fstat sur le fichier '%s': ", szNomProg, szNomfic);
	perror("");
	close(h);
	return;
  }

  lFic = sb.st_size;
  szBuffer = malloc(lFic+1);
  if (szBuffer==NULL)
  {
    fprintf(stderr, "%s: Echec au malloc(%d) pour lire le fichier '%s': ", szNomProg, lFic+1, szNomfic);
	perror("");
	close(h);
	return;
  }
  lLu = read(h, szBuffer, lFic);
  szBuffer[lLu] = 0;
  close(h);

  if (lLu!=lFic || lLu!=(int)strlen(szBuffer))
  {
    fprintf(stderr, "%s: Echec … la lecture du fichier '%s'\n      Le fichier n'est probablement pas de type texte. Fichier ignoré\n",
	  szNomProg, szNomfic);
	free(szBuffer);
	return;
  }

  nbTr = 0;
  if (bModeXtoD)
  {
    // Transformation \n -> \r\n
	// Les \r\n ne sont pas modifiés
	char *szBufferR;

	// 1ère étape on compte
	s = szBuffer;
	lc = 0;
	while (c = *s++)
	{
	  if (c=='\n' && lc!='\r' || bOptR && c=='\r' && *s!='\n')
	    nbTr++;
	  lc = c;
	}

    if (nbTr==0)
    {
      fprintf(stderr, "%s: Fichier '%s', Aucune s‚quence \\n isol‚e trouv‚e\n      Le fichier est probablement d‚j… de type Unix. Fichier ignor‚\n",
	    szNomProg, szNomfic);
    }
	else
	{
	  lFic += nbTr;
      szBufferR = realloc(szBuffer, lFic+1);
      if (szBufferR==NULL)
      {
        fprintf(stderr, "%s: Echec au realloc(%d) pour le fichier '%s': ", szNomProg, lFic+1, szNomfic);
	    perror("");
	    free(szBuffer);
	    return;
      }
	  szBuffer = szBufferR;

	  d = szBuffer+lFic;
	  s = d - nbTr;
	  *d-- = *s--;
	  while (s>=szBuffer)
	  {
	    c = *s--;
	    if (c=='\n' && s>=szBuffer && *s!='\r')
	    {
	      *d-- = c;
		  c = '\r';
	    }
		if (bOptR && c=='\r' && s[2]!='\n')
		{
		  *d-- = '\n';
		}
	    *d-- = c;
	  }
	}

  }
  else
  {
    // Transformation \r\n -> \n

	s = szBuffer;
    d = szBuffer;
    while (c=*s++)
    {
      if (c=='\r' && *s=='\n')
	  {
		if (bOptR)
		  s++;
		else
		  c = *s++;
	    nbTr++;
	  }
	  *d++ = c;
    }
    *d = 0;

    if (nbTr==0)
    {
      fprintf(stderr, "%s: Fichier '%s', Aucune s‚quence \\r\\n trouv‚e\n      Le fichier est probablement déjà de type Dos. Fichier ignoré\n",
	    szNomProg, szNomfic);
    }
  }


  if (nbTr)
  {
	h = open(szNomfic, O_WRONLY|O_BINARY);
	if (h<0)
	{
      fprintf(stderr, "%s: chec … l'ouverture en ‚criture du fichier '%s': ", szNomProg, szNomfic);
	  perror("");
	  free(szBuffer);
	  return;
    }
	lAEcrire = strlen(szBuffer);
	lEcrit = write(h, szBuffer, lAEcrire);
	if (lEcrit!=lAEcrire)
	{
      fprintf(stderr, "%s: Erreur … l'‚criture du fichier '%s'\n", szNomProg, szNomfic);
          fprintf(stderr, "      %d octets ‚crits au lieu de %d: ", lEcrit, lAEcrire);
	  perror("");
	  close(h);
	  free(szBuffer);
	  return;
    }

	// Troncature si le résultat est plus court
	if (lFic>lAEcrire)
	  chsize(h, lAEcrire);

	// On restore la date de dernière modification
	ub.actime = sb.st_atime;
	ub.modtime = sb.st_mtime;
	i = _futime(h, &ub);
	if (i<0)
	{
      fprintf(stderr, "%s: Erreur au futime sur le fichier '%s': ", szNomProg, szNomfic);
	  perror("");
    }

    if (bModeXtoD)
      printf("%s: %d \\n -> \\r\\n\n", szNomfic, nbTr);
    else
      printf("%s: %d \\r\\n -> \\n\n", szNomfic, nbTr);

	close(h);
  }

  free(szBuffer);
}


int main(int argc, char **argv)
{
  int i;
  int iNbFic = 0;
  int bProbleme = 0;

  _splitpath(argv[0], NULL, NULL, szNomProg, NULL);
  bModeXtoD = stricmp(szNomProg, "xtod")==0;

  for (i=1 ; i<argc ; i++)
	if (argv[i][0]!='-' && argv[i][0]!='/')
	  iNbFic++;
	else
	{
	  if (stricmp(argv[i], "/r")==0 || stricmp(argv[i], "-r")==0)
		bOptR = 1;
	  else if (strcmp(argv[1], "/??")==0 || strcmp(argv[1], "-??")==0 )
	  { 
		Identification();
		Info();
		return 0;
	  }        
	  else if (strcmp(argv[i], "/?")==0 || strcmp(argv[i], "-?")==0)
	  { 
		Identification();
		Usage();
		return 0;
	  }
	  else if (argv[i][0]=='/' || argv[i][0]=='-')
	  {
		fprintf(stderr, "%s: Option %s inconnue\n", szNomProg, argv[i]);
		bProbleme = 1;
	  }

	}

  if (iNbFic==0 || bProbleme)
  {
	Identification();
	Usage();
	exit(1);
  }

  for (i=1 ; i<argc ; i++)
	if (argv[i][0]!='-' && argv[i][0]!='/')
      AtoB(argv[i]);
  return 0;
}
