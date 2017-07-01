// ctrltxt.c
// Verifie que les .txt sont corrects: caracteres permis, pas de doublons
// PV 16/05/94

#include <stdio.h>
#include <stdlib.h>         // exit
#include <string.h>         // strdup
#include <time.h>           // time

#ifdef UNIX
#include <clib.ref>
#else
#include <direct.h>         // chdir
#endif

#define  uchar  unsigned char
#define  ushort unsigned short

#define  MAXMOTS 30000U
uchar    *tszMot[MAXMOTS];  // huge
ushort   nbMots;
long     nbMotsTot;


// équivalent de strcmp sur pointeurs de char *, pour qsort, bsearch...
int strpcmp(const void *p1, const void *p2)
{
  return strcmp(*(char **)p1, *(char **)p2);
}


void main()
{
  char   lettre;
  uchar  szBuffer[100];
  uchar  *pszBuffer = szBuffer;
  FILE   *fMots;
  int    i;
  int    bDirty;            // Le fichier n'était pas trié, à ré-écrire
  ushort j;
  time_t tDebut, tFin;
  ushort uPos;
  
  tDebut = time(0L);
#ifdef UNIX
  chdir("/usr/sce/vspell/mots");
#else
  chdir("d:/c/vspell/mots");
#endif
  
  nbMotsTot = 0;
  for (lettre='a' ; lettre<='z'+1 ; lettre++)
  {
    char szNomficMots[16];
    
    sprintf(szNomficMots, "%c.txt", lettre<='z'?lettre:'0');
    fMots = fopen(szNomficMots, "r");
    if (fMots==NULL)
    { fprintf(stderr, "Echec lors de l'ouverture du fichier des mots ");
      perror(szNomficMots);
      continue;
    }              
  
    printf("Lecture du fichier %s\n", szNomficMots);
    nbMots = 0;
    bDirty = 0;
    while (fgets(szBuffer, 100, fMots)!=NULL)
    {                              
      szBuffer[strlen(szBuffer)-1] = 0;
      if (szBuffer[0]==0) continue; // Les lignes vides sont exclues
      
      for (i=strlen(szBuffer) ; i-- ; )
        if (szBuffer[i]>=155)
          printf("%s: Erreur mot %s: car %c interdit !\n", szNomficMots, szBuffer, szBuffer[i]);

      if (bsearch(&pszBuffer, tszMot, nbMots, sizeof(tszMot[0]), strpcmp)!=NULL)
        printf("%s: Mot %s en double !\n", szNomficMots, szBuffer);
      
      tszMot[nbMots] = strdup(szBuffer);
      if (tszMot==NULL)
      { printf("ctrltxt: Echec au strdup(\"%s\")\n", szBuffer);
        exit(1);
      }
      
      nbMots++;
      
      // Tri par insertion du nouveau mot
      uPos = nbMots-1;
      while (uPos>0)
      if (strcmp(tszMot[uPos-1], tszMot[uPos])>0)
      { uchar *temp;
        temp = tszMot[uPos-1];
        tszMot[uPos-1] = tszMot[uPos];
        tszMot[uPos] = temp;
        uPos--;
        bDirty = 1;
      }
      else
        break;
      
      if (nbMots%100==0)
      { printf("%u\r", nbMots);
        fflush(stdout);
      }
    }
    
    nbMotsTot += nbMots;
    fclose(fMots);
    
    printf("%u mots vérifiés\n", nbMots);
    
    if (bDirty)
    { 
      char szNomficBak[16];
    
      printf("Ré-écriture du fichier .txt: rename, ");
      fflush(stdout);
            
      sprintf(szNomficBak, "%ctxt.bak", lettre<='z'?lettre:'0');
      unlink(szNomficBak);
#ifdef UNIX
      link(szNomficMots, szNomficBak);
      unlink(szNomficMots);
#else
      rename(szNomficMots, szNomficBak);
#endif
      
      fMots = fopen(szNomficMots, "w");
      printf("écriture, ");
      fflush(stdout);
      
      if (fMots==NULL)
      { fprintf(stderr, "Echec à l'ouverture du fichier %s:");
        perror("");
      }
      else
      {
        for (j=0 ; j<nbMots ; j++)
        { fputs(tszMot[j], fMots);
          fputc('\n', fMots);
        }
        printf("fermeture");
        fflush(stdout);
        fclose(fMots);
        printf(".\n");
      }
    }

    // Libération des ressources    
    for (j=0 ; j<nbMots ; j++)
      free(tszMot[j]);
  }

  tFin = time(0L);
  printf("\nTerminé.\n");
  printf("Durée:      %u sec\n", tFin-tDebut);
  printf("Mots total: %ld\n", nbMotsTot);
  printf("Cadence:    %ld mots/sec\n", nbMotsTot/(tFin-tDebut));
  
  exit(0);
}