// testdic.c
// Test du dictionnaire
// PV 15/05/94

#include <stdio.h>
#include <stdlib.h>                     // exit
#include <time.h>                       // time

#ifdef UNIX
#include <clib.ref>
#endif

#define  uchar  unsigned char
#define  ushort unsigned short

#include "vspell.h"

char szTest[] = "Il ‚tait un petit (mais alors, tout petit !) {g}navire{n} qui n'avait JAMAIS navygy‚ sous les 40Šmes rugissants (40ø de latitude), oh‚ oh‚, Matelot...";
char szBuffer[1000];

int iBack(int iMessage, uchar *szMot, unsigned iPos, unsigned iLen)
{
  printf("iBack: %d: %s, Pos=%d, Len=%d\n", iMessage, szMot, iPos, iLen);
  VS_AjouteMot(szMot);
  return 0;
}    


void main()
{ 
  time_t    tDebut, tFin;
  time_t    uDelai;
  
  FILE      *fTest;
  
  fTest = fopen("textes/ls.txt", "r");
  if (fTest==NULL)
  { perror("testdic: Echec à l'ouverture du fichier texte");
    exit(1);
  }
  
  tDebut = time(0L);
  if (VS_iInit()<0)
  { printf("testdic: Echec à l'initialisation de vspell\n");
    exit(1);
  }
  tFin = time(0L);
  
  uDelai = tFin-tDebut;
  printf("Durée de lecture: %u sec\n", uDelai);
  
  tDebut = time(0L);
//  VS_Spell(szTest, 0, iBack);
  while (fgets(szBuffer, 1000, fTest)!=NULL)
    VS_Spell(szBuffer, 0, iBack);
  tFin = time(0L);
  
  uDelai = tFin-tDebut;
  if (uDelai==0) uDelai = 1;
  printf("Durée de vérification: %u sec\n", uDelai);
  printf("Nb de mots vérifiés:   %ld\n", VS_nbMotsVerifies);
  printf("Nb mots/sec:           %ld\n", VS_nbMotsVerifies/uDelai);
  printf("Nb de recherches:      %ld\n", VS_nbRecherches);
  printf("Nb recherches/sec:     %ld\n", VS_nbRecherches/uDelai);
  
  VS_Fin();
  fclose(fTest);
  
  exit(0);
}
