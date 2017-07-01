
/* sg.c
** Programme de calcul d'une solution au jeu de golf
** PV ao–t 92
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>


struct sjeu
{ char tas[7][5];
  char ztas[7];
  char talon[16];
  char ztalon;
  char sfile;
};

struct sjeu jeu;

long nbpasse = 0;
long tpasse[50];

// InitJeu cr‚e une configuration initiale al‚atoire
void InitJeu()
{
  char	jeulin[52];
  int	i;

  for (i=0 ; i<13 ; i++)
    jeulin[i] = jeulin[i+13] = jeulin[i+26] = jeulin[i+39] = (char)(i+1);

  for (i=0 ; i<100 ; i++)
  { int i1 = rand()%52;
    int i2 = rand()%52;

    char t = jeulin[i1];
    jeulin[i1] = jeulin[i2];
    jeulin[i2] = t;
  }

  for (i=0 ; i<35 ; i++)
    jeu.tas[i/5][i%5] = jeulin[i];
  for (i=0 ; i<16 ; i++)
    jeu.talon[i] = jeulin[i+35];
  jeu.sfile = jeulin[51];

  for (i=0 ; i<7 ; i++)
    jeu.ztas[i] = 4;
  jeu.ztalon = 15;
}

void AfficheJeu(pj, f)
struct sjeu *pj;
FILE *f;
{
  int i, j;

  fprintf(f,"\n\n");
  for (i=0 ; i<5 ; i++)
  { for (j=0 ; j<7 ; j++)
      if (i<=pj->ztas[j])
	fprintf(f, "%2d  ", pj->tas[j][i]);
      else
	fprintf(f, "--  ");
    fprintf(f, "\n");
  }
  fprintf(f, "\n");
  for (i=0 ; i<= pj->ztalon ; i++)
    fprintf(f, "%2d ", pj->talon[i]);
  fprintf(f, "\n\n%2d\n\n", pj->sfile);

}

int iResoud(pj, n)
struct sjeu *pj;
int n;
{
  int aumoins1 = 0;
  int i;
  char c;

  nbpasse++;
  tpasse[n]++;

  if (n==14)
  {
    for (i=1 ; i<=14 ; i++)
      printf("%ld ", tpasse[i]);
     printf("%ld\n",nbpasse);
  }

  for (i=0 ; i<7 ; i++)
  { if (pj->ztas[i]<0) continue;
    aumoins1 = 1;

    if (abs((c=pj->tas[i][pj->ztas[i]])-pj->sfile)==1 && c!=13)
    { struct sjeu jeu2 = *pj;
      jeu2.sfile = jeu2.tas[i][jeu2.ztas[i]--];
      if (iResoud(&jeu2,n+1)>0) return 1;
    }
  }

  // Si tous les tas sont vides, c'est gagn‚ !
  if (aumoins1==0) return 1;

  // Si le talon n'est pas vide on a forc‚ment la possibilit‚ de le jouer
  if (pj->ztalon>=0)
  { struct sjeu jeu2 = *pj;
    jeu2.sfile = jeu2.talon[jeu2.ztalon--];
    return iResoud(&jeu2,n+1);
  }
  return 0;
}


void main()
{
  time_t td, tf;

  InitJeu();
  AfficheJeu(&jeu, stdout);

  printf("Recherche d'une solution en cours...\n");

  td = time(NULL);
  if (iResoud(&jeu,0)>0)
    printf("Solution trouv‚e !!\n");
  else
    printf("Aucune solution !\n");
  tf = time(NULL);

  { FILE *f;
    int i;

    f = fopen("resul.txt", "w");
    fprintf(f, "Configuration de d‚part\n");
    AfficheJeu(&jeu, f);
    fprintf(f, "D‚but: %s", ctime(&td));
    fprintf(f, "Fin:   %s", ctime(&tf));
    fprintf(f, "Delta: %d s\n\n", tf-td);

    fprintf(f, "Nb total de coups: %ld\n\n", nbpasse);
    fprintf(f, "D‚tail du nb de passes par niveau\n");
    for (i=0 ; i<50 ; i++)
      if (tpasse[i]>0)
	fprintf(f, "%2d %ld\n", i, tpasse[i]);
    fclose(f);
  }

  exit(0);
}
