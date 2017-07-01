// makehosts.cpp
// produits un fichier hosts windows à partir d'un fichier du named Unix
// 17/07/97 PV

//#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main()
{
  char szBuffer[200];
  FILE *f, *g;

  f = fopen("C:\\win95\\ercem.hosts", "r");
  if (f==NULL)
  { perror("Echec à l'ouverture en lecture de c:\\win95\\ercem.hosts");
    exit(1);
  }

  g = fopen("c:\\win95\\hosts.new", "w");
  if (g==NULL)
  { perror("Echec à l'ouverture en écriture de c:\\win95\\hosts.new");
    exit(1);
  }

  while (fgets(szBuffer, sizeof(szBuffer), f)!=NULL)
  {
	int i1, i2, i3, i4;
	int nb;
	char szHost[30], szK1[30], szK2[30];

    if (szBuffer[0]=='\n' || szBuffer[0]=='\r' || szBuffer[0]==';')
	  continue;

	nb = sscanf(szBuffer, "%s %s %s %d.%d.%d.%d", szHost, szK1, szK2, &i1, &i2, &i3, &i4);

	if (nb!=7 || stricmp(szK1, "IN") || stricmp(szK2, "A"))
	  continue;
	fprintf(g, "%d.%d.%d.%d\t%s\t%s.ercem.com\n", i1, i2, i3, i4, szHost, szHost);
  }

  fclose(f);
  fclose(g);
}
