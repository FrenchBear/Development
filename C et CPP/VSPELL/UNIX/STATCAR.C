#include <stdio.h>
#include <string.h>
#include <direct.h>			// chdir
#include <stdlib.h>			// exit
#include <assert.h>

#define UC unsigned char

UC			szBuffer[100];	// Ligne courante

#define MAXTOK 300

struct sTOK
{
  UC	*szTok;
  long	nbOcc;
  float	fFreq;
} tTok[MAXTOK];
int nbTok;

UC szLettres[] = "abcdefghijklmnopqrstuvwxyz‚‡ŠŒ“–";
long tP[32][32];

int comp(const void *p1, const void *p2)
{
  float fDiff = ((struct sTOK *)p2)->fFreq - ((struct sTOK *)p1)->fFreq;
  if (fDiff>0) return 1;
  if (fDiff<0) return -1;
  return 0;
}


void main()
{                      
  FILE		*fMots;
  FILE		*fTok;
  FILE		*fTra;
  char		lettre;
  long		nbm, nbmloc;
  long		nbc;
  int		i, j;
  UC		c1, c2;
  UC		*p1, *p2;
  UC		c1m, c2m;
  long		lm;
  
  chdir("d:/doc/dico");
  
  printf("Lecture des tokens...\n");
  fTok = fopen("tokens.txt", "r");
  while (fgets(szBuffer, 100, fTok)!=NULL)
  {
    szBuffer[strlen(szBuffer)-1] = 0;
    if (szBuffer[0]==0) continue;				// Les lignes vides sont ignorées
    tTok[nbTok].szTok = strdup(szBuffer);
    if (tTok[nbTok].szTok==NULL)
    { printf("Echec au malloc token %s\n", szBuffer);
      exit(1);
    }
    nbTok++;
  }         
  fclose(fTok);
  
  printf("%d tokens lus\n", nbTok);
  
  
  nbm = 0;
  nbc = 0;
  for (lettre='a' ; lettre<='z'+1 ; lettre++)
  {
    char szNomficMots[16];
    
    sprintf(szNomficMots, "%c.txt", lettre<='z'?lettre:'0');
    fMots = fopen(szNomficMots, "r");
    if (fMots==NULL)
    { fprintf(stderr, "Echec à l'ouverture du fichier des mots ");
      perror(szNomficMots);
      exit(1);
    }              
  
    printf("      Lecture du fichier %s...", szNomficMots);
    fflush(stdout);                                      
    nbmloc = 0;                                           
    while (fgets(szBuffer, 100, fMots)!=NULL)
    {                              
      // if (strchr(szBuffer, '-')!=NULL) continue;	// Les mots composés sont ignorés
      szBuffer[strlen(szBuffer)-1] = 0;
      if (szBuffer[0]==0) continue;				// Les lignes vides sont ignorées
      
      for (i=0 ; i<nbTok ; i++)
      { char *p = szBuffer;
        while (p = strstr(p, tTok[i].szTok))
        { p++;
          tTok[i].nbOcc++;
        }
      }
      
      c2 = szBuffer[0];
      p2 = strchr(szLettres, c2);
      j = 1;
      while (c2)
      { c1 = c2;
        p1 = p2;
        
        c2 = szBuffer[j++];
        p2 = strchr(szLettres, c2);
        if (p1 && p2)
          tP[p1-szLettres][p2-szLettres]++;
      }
      
      
      nbm++;   
      nbmloc++;
      nbc += strlen(szBuffer);

      if (nbmloc%100==0)
      { printf("\r%-5d", nbmloc);
        fflush(stdout);
      }    
      // if (nbm==5000) break;
    }             
    printf("\r%-5d\n", nbmloc);
    fclose(fMots);
    
    // break;                     
  }
  printf("\nFin de la lecture: %ld mots/%ld caractères trouvés\n", nbm, nbc);
  
  for (i=0 ; i<nbTok ; i++)
    tTok[i].fFreq = strlen(tTok[i].szTok)*(tTok[i].nbOcc+0.0f)/nbc;
    
  qsort((void *)(tTok), nbTok, sizeof(tTok[0]), comp);
  
  fTra = fopen("tokens.out", "w");
  for (i=0 ; i<nbTok ; i++)
    fprintf(fTra, "%-6s %6ld  %7.5f%%\n", tTok[i].szTok, tTok[i].nbOcc, tTok[i].fFreq);
  
  fprintf(fTra, "\n\n");
  do
  {
  
    lm = 0;
    for (c1=0 ; c1<32 ; c1++)
      for (c2=0 ; c2<32 ; c2++)
        if (tP[c1][c2]>lm)
        { lm = tP[c1][c2];
          c1m = c1;
          c2m = c2;
        }
    if (lm)
    { fprintf(fTra, "%c%c %6ld  %7.5f%%\n", szLettres[c1m], szLettres[c2m], lm, (2.0*lm)/nbc);
      tP[c1m][c2m] = 0;
    }
  } while (lm);          
  
  fclose(fTra);
}
