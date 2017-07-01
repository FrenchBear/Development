// dumpdic.c
// programme de vidage du dictionnaire
// Permet de vérifier que le fichier généré par makedic est correct
// PV 13/05/94

#include <stdio.h>
#include <io.h>
#include <fcntl.h>			// O_RDWR
#include <direct.h>			// chdir
#include <stdlib.h>			// exit
#include <string.h>			// strdup
#include <assert.h>

#define UC unsigned char

int			hDic;			// Fichier en entrée (dictionnaire)
FILE		*fDump;			// Fichier de sortie
long		nbMots;			// Nb de mots au total

unsigned	nbBlocs;		// Nb de blocs dans le dictionaire

#define MAXBLOCS 10000U
struct sTB
{
  UC		*sBloc;
  unsigned	lgBloc;
  unsigned	filler;
} tBloc[MAXBLOCS];			// Tableau d'historique des blocs

UC			lgCleMax;		// longueur maximum d'une clé
unsigned	lgMotMax;		// longueur maximum d'un mot complet
unsigned	nbCleMax;		// nombre maximum de clés par bloc
unsigned	lgBlocMax;		// longueur maximum d'un bloc

#include "paires.h"


// Décomprime les paires de caractères
void SorMot(UC *s)
{
  UC c;
  unsigned lgMot = 0;
  
  while (c = *s++)
    if (c<155)
    {
      fputc(c, fDump);
      lgMot++;
    }
    else
    {
      fputs(tP[c-155], fDump);
      lgMot += 2;
    }
  fputc('\n', fDump);
  
  if (lgMot>lgMotMax) lgMotMax = lgMot;
  
  nbMots++;
  if (nbMots%1000==0)
    printf("%ld\r", nbMots);
}


void VideBloc(unsigned uBloc, UC *szPrefixe)
{
  UC		*sBloc;                       
  unsigned	i, lp;
  UC		lm;			// longueur mot
  UC		lmc;		// id. composite (+ evt bit 7)
  UC		szMot[50];
  unsigned	uSousBloc;                               
  unsigned	lgBloc;
  unsigned	nbeb;		// nb d'entrées dans le bloc
  
  // printf("%5d %s\n", uBloc, szPrefixe);
  // getchar();
  
  if (uBloc==0 || uBloc>nbBlocs)
  { printf("Appel de VideBloc avec uBloc incorrect !\n");
    exit(1);
  }
  
  uBloc--;
  lgBloc = tBloc[uBloc].lgBloc-2;
  sBloc = tBloc[uBloc].sBloc;
  
  strcpy(szMot, szPrefixe);
  lp = strlen(szPrefixe);

  i = 0;
  nbeb = 0;
  while (i<lgBloc)
  { nbeb++;                  
    lmc = sBloc[i++];
    lm = lmc%32;
    uSousBloc = lmc/32;
    if (lm>lgCleMax) lgCleMax=lm;
    strncpy(szMot+lp, sBloc+i, lm);
    szMot[lp+lm] = 0;
    i += lm;
    if (uSousBloc==0)
      SorMot(szMot);
    else
   	{ 
   	  if (uSousBloc==7)
   	  { memcpy(&uSousBloc, sBloc+i, 2);
   	    i += 2;
   	  }
	  VideBloc(uSousBloc, szMot);
    }
  }
  if (nbeb>nbCleMax) nbCleMax = nbeb;
}


void main()
{
  unsigned	lgBloc;			// taille du bloc courant
  
  chdir("d:/doc/dico");
  hDic = open("dico.dic", O_RDONLY|O_BINARY);
  if (hDic<0)
  { perror("Echec à l'ouverture du dictionnaire dico.dic");
    exit(1);
  }              
        
  fDump = fopen("dico.dmp", "w");
  if (fDump==NULL)
  { perror("Echec à l'ouverture du fichier .dmp");
    exit(1);
  }

  printf("Lecture du dictionnaire...\n");
  nbBlocs = 0;  
  for(;;)
  {
    read(hDic, &lgBloc, 2);
    if (lgBloc==0) break;                  
    
    if (nbBlocs>=MAXBLOCS)
    { printf("Nb maximum de blocs atteint (%u)\n", MAXBLOCS);
      exit(1);
    }
    
    if (lgBloc>lgBlocMax) lgBlocMax = lgBloc;
    tBloc[nbBlocs].lgBloc = lgBloc;
    tBloc[nbBlocs].sBloc = malloc(lgBloc-2);
    if (tBloc[nbBlocs].sBloc==NULL)
    { perror("Echec au malloc");
      exit(1);
    }
    read(hDic, tBloc[nbBlocs].sBloc, lgBloc-2);             
    nbBlocs++;  
  }

  close(hDic);
  printf("%u blocs lus\n", nbBlocs);
  
  VideBloc(nbBlocs, "");
  fclose(fDump);
  
  printf("%ld mots extraits\n", nbMots);
  printf("lgBloc max: %u\n", lgBlocMax);
  printf("nb clé max: %u\n", nbCleMax);
  printf("lg clé max: %i\n", lgCleMax);
  printf("lg mot max: %u\n", lgMotMax);
  
  exit(0);
}