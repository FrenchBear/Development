#include <stdio.h>
#include <ctype.h>

#define VRAI 1
#define FAUX 0


void Recherche(Motif, szNomFich)
char *Motif, *szNomFich;
{
   FILE *f;
   char Ligne[500];
   int i = 0, j = 0, Debut = FAUX, Fin = FAUX;
   int k, ll, lm, Trouve;

   if (szNomFich == NULL) f = stdin;
   else {  f = fopen(szNomFich, "r");
	   if (f == NULL)
	      { printf("*** Echec … l'ouverture du fichier '%s'.\n", szNomFich);
		exit(1);
	      }
	}

   lm = strlen(Motif);
   if (Motif[0] == '^') {  Debut = VRAI; Motif ++; lm --;  }
   if (Motif[lm-1] == '$') {  Fin = VRAI; Motif[lm-1] = 0; lm --; }

   while (fgets(Ligne, 2000, f) != NULL)
   {   ll = strlen(Ligne)-1;
       Ligne[ll] = 0;

       i = j = 0;  Trouve = FAUX;
       while (i<=ll-lm && !Trouve)
       {  if (majAZ(Ligne[i]) == majAZ(Motif[0]))
	  {  k = i; j = 0;
	     while ((j<lm) && (majAZ(Ligne[k]) == majAZ(Motif[j])))
	     {	k ++; j ++;  }
	     if ((j == lm) && ((Debut && i == 0) || (Fin && k == ll) || (!Debut && !Fin)))
	     {	Trouve = VRAI;
		printf("%s\n", Ligne);
	     }
	  }
	  i ++;
       }
   }
}


void main(argc, argv)
int argc;
char **argv;

{
   int i;

   switch (argc)
   {  case 1: printf("Usage: FFGREP Motif [NomDeFichier]...\n");
	      break;
      case 2: Recherche(argv[1], NULL);
	      break;
     default: for (i=2; i<argc; i++) Recherche(argv[1], argv[i]);
	      break;
   }
}
