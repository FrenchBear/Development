// makedic.c
// programme fabriquant un fichier dictionnaire à partir de fichiers mots
// PV 13/05/94

#include <stdio.h>
#include <fcntl.h>          // O_RDWR
#include <stdlib.h>         // exit
#include <string.h>         // strdup
#include <time.h>           // time

#ifdef UNIX
#include <clib.ref>
#define O_BINARY 0
#else
#include <io.h>             // open
#include <direct.h>         // chdir
#endif

#define  uchar  unsigned char
#define  ushort unsigned short

#define MAXMOTS 40000U
struct sTM
{             
  uchar     *szMot;         // Mot
  float     fRatio;         // Ratio d'efficacité du préfixe
  ushort    lPref;          // Nb de caractères du préfixe
  ushort    nbCles;         // Nb de mots concernés par le préfixe
  ushort    uBloc;          // N° de bloc (pour renvoi)
  ushort    filler;         // taille structure = diviseur de 64k (tableau huge)
} tm[MAXMOTS];

FILE        *fTra;          // Fichier de trace
long        nbMots;         // Nb de mots au total
ushort      nbBlocs;        // Nb de blocs dans le dictionaire

// Pour les stats finales
uchar       lgCleMax;       // Longueur maximum d'une clé
ushort      lgMotMax;       // Longueur maximum d'un mot complet
ushort      nbClesMax;      // Nombre maximum de clés par bloc
ushort      lgBlocMax;      // Longueur maximum d'un bloc
long        lTailleMots;    // Taille cumulée des fichiers de mots
long        lTailleDico;    // Taille du fichier dictionnaire

uchar       sBloc[5000];    // Bloc courant
ushort      lgBloc;         // Taille du bloc

uchar       szBuffer[100];  // Ligne courante en entrée (lecture des mots)

struct sCLE
{
  char      *szCle;         // Texte de la clé, ou NULL pour la clé vide (pas de malloc(0)!)
  ushort    uBloc;          // Bloc suite si clé de type noeud, ou 0 si clé finale
};

#define MAXBLOCS 10000U
struct sTB
{
  struct sCLE   *tCle;
  ushort    nbCles;
  ushort    uRef;           // Nb de références au bloc
  uchar     *sBloc;         // Chaîne compacte du bloc pour trouver rapidement les blocs déjà créés avec memcmp
  ushort    lgBloc;         // Nb d'octets de sBloc
  ushort    filer;
} tBloc[MAXBLOCS];          // Tableau des blocs


struct sBT                  // Blocs triés
{
  ushort    uOldNum;
  ushort    uRef;
} *tBT;


#include "paires.h"         // Optimisation des paires de caractères


#ifdef UNIX
char szPathPrincipal[] = "/usr/lib/vspell/francais.dic";
char szPathMots[]      = "/usr/sce/vspell/mots";
#else
char szPathPrincipal[] = "d:/c/vspell/francais.dic";
char szPathMots[]      = "d:/c/vspell/mots";
#endif



// Compacte les paires de la chaîne szBuffer 
void ComprimePaires(uchar *szBuffer)
{
  int       j, k;
  uchar     l;
  uchar     c1, c2, trouve;
  
  c1 = szBuffer[0];
  c2 = szBuffer[1];
  j = 2;                    // Indice du prochain car de szBuffer
  k = 0;
  while (c1 && c2)
  {
    trouve = 0;
    for (l=0 ; l<NBP ; l++)
      if (c1==tP[l][0] && c2==tP[l][1])
      { trouve = l+155;
        break;
      }
      
    if (!trouve)
    { szBuffer[k++] = c1;
      c1 = c2;
    }
    else
    { szBuffer[k++] = trouve;
      c1 = szBuffer[j++];
    }
    c2 = szBuffer[j++];
  }
  
  if (c1) szBuffer[k++] = c1;
  szBuffer[k] = 0;
}


// Détermine le nombre de caractères en commun au début de deux chaînes
int iLgCommun(uchar *s1, uchar *s2)
{
  int l = 0;
  
  while (*s1 && *s1++==*s2++)
    l++;
  return l;
}


// Détermine la clé préfixe optimale pour le iième mot et son ratio d'efficacité
// Si la clé optimale est dentique à celle du mot précédent, son ratio reste à 0
// même si le calcul théorique d'efficacité est meilleur.
void CalculeRatios(long i)
{
  uchar     szPref[50], szPrefOpt[50];
  int       iNb = 1;
  ushort    lPref;      // longueur courant du prefixe
  ushort    lPrefOpt;   // longueur optimale du préfixe
  long      j;               
  long      tc;         // taille condensée
  long      tn;         // taille normale
  float     fRatio;     // ratio courant
  float     fRatioOpt;  // ratio d'efficacité optimal
  ushort    nbmpOpt;    // nb de mots concernés par le préfixe optimal
  
  strcpy(szPref, tm[i].szMot);
  strcpy(szPrefOpt, tm[i].szMot);
  lPref = strlen(szPref);                             
  fRatioOpt = 0.0f;                          
  nbmpOpt = 1;
  lPrefOpt = lPref;
  j = i+1;                   
  tn = lPref;
  tc =  lPref;
  while (j<nbMots)
  {
    if (strncmp(szPref, tm[j].szMot, lPref)!=0)
    { int lPref2;
      lPref2 = iLgCommun(szPref, tm[j].szMot);
      if (lPref2==0) break;
      tc += iNb*(lPref-lPref2);
      lPref = lPref2;
      szPref[lPref] = 0;
      
      if (i>0)
        if (strncmp(tm[i-1].szMot, szPref, lPref)==0)
          break;    // Si on retombe sur le préfixe précédent, il a priorité
    }
    tc += strlen(tm[j].szMot)-lPref;
    tn += strlen(tm[j].szMot);
    if (j==nbMots-1 || strncmp(szPref, tm[j+1].szMot, lPref)!=0)
    { // Le ratio n'est calculé que sur une rupture de clé, de façon à prendre jusqu'au
      // dernier mot pour un préfixe donné
      fRatio = (tn-tc+0.0f)/tn;
      if (fRatio>fRatioOpt)
      { fRatioOpt = fRatio;
        nbmpOpt = (ushort)(j-i+1);
        lPrefOpt = lPref;
        strcpy(szPrefOpt, szPref);
      }
    }
    j++;
    iNb++;
  }
  
  tm[i].fRatio = fRatioOpt;
  tm[i].nbCles   = nbmpOpt;
  tm[i].lPref  = lPrefOpt;
} 


// Fabrique le bloc
// Si ce bloc existe déjà, retourne le n° de l'ancien bloc correspondant,
// sinon retourne un nouveau n°
ushort uCreeBloc(long iBase)
{
  uchar     szPref[50];
  ushort    i;
  ushort    nbCles;         // Nb de mots dans le bloc concernés par le préfixe
  
  if (nbBlocs>=MAXBLOCS)
  { printf("Nb maximum de blocs atteint (%u)\n", MAXBLOCS);
    exit(1);
  }
  
  strcpy(szPref, tm[iBase].szMot);
  szPref[tm[iBase].lPref] = 0;
  nbCles = tm[iBase].nbCles;
  
  lgBloc = 2;
  fprintf(fTra, "%s(", szPref);
  for (i=0 ; i<nbCles ; i++)
  { 
    uchar  lMot;
    uchar  szMot[50];
                                
    strcpy(szMot, tm[iBase+i].szMot+tm[iBase].lPref);
    ComprimePaires(szMot);
    lMot = (uchar)strlen(szMot);
      
    if (i) fprintf(fTra, ",");
    fprintf(fTra, "%s", szMot);
    if (tm[iBase+i].uBloc)
    { fprintf(fTra,"->%u", tm[iBase+i].uBloc);
      lMot += 128;
    }
      
    sBloc[lgBloc++] = lMot;
    strncpy(sBloc+lgBloc, szMot, lMot);
    lgBloc += (lMot&127);
    if (tm[iBase+i].uBloc)
    { memcpy(sBloc+lgBloc, &tm[iBase+i].uBloc, 2);
      lgBloc += 2;
    }
  }                        
  memcpy(sBloc, &lgBloc, 2);

  // On regarde si le bloc a déjà été rencontré  
  for (i=0 ; i<nbBlocs ; i++)
    if (lgBloc==tBloc[i].lgBloc)
      if (memcmp(sBloc, tBloc[i].sBloc, tBloc[i].lgBloc)==0)
      { fprintf(fTra, ")  Bloc %d\n", i+1);
        tBloc[i].uRef++;
        return i+1;
      }

  fprintf(fTra, ") -> Nouveau bloc %d\n", nbBlocs+1);
  
  tBloc[nbBlocs].sBloc = malloc(lgBloc);
  if (tBloc[nbBlocs].sBloc==NULL)
  { printf("Echec au malloc(%u) de tBloc\n", lgBloc);
    exit(1);
  }
  memcpy(tBloc[nbBlocs].sBloc, sBloc, lgBloc);
  tBloc[nbBlocs].lgBloc = lgBloc;
  tBloc[nbBlocs].uRef = 0;
  
  // On fabrique la structure chaînée des clés en mémoire
  tBloc[nbBlocs].nbCles = nbCles;
  tBloc[nbBlocs].tCle = (struct sCLE *)malloc(nbCles*sizeof(struct sCLE));
  if (tBloc[nbBlocs].tCle==NULL)
  { printf("Echec au malloc(%u) de tBloc[%u].tCle\n", nbCles*sizeof(struct sCLE), nbBlocs);
    exit(1);
  }
  
  for (i=0 ; i<nbCles ; i++)
  { 
    uchar  lMot;
    uchar  szMot[50];
                                
    strcpy(szMot, tm[iBase+i].szMot+tm[iBase].lPref);
    ComprimePaires(szMot);
    lMot = (uchar)strlen(szMot);
    
    if (lMot>0)
    {
      tBloc[nbBlocs].tCle[i].szCle = strdup(szMot);
      if (tBloc[nbBlocs].tCle[i].szCle==NULL)
      { printf("Echec au strdup de tBloc[%u].tCle[%u] = \"%s\"\n", nbBlocs, i, szMot);
        exit(1);
      }
    }
    else
      tBloc[nbBlocs].tCle[i].szCle = NULL;
    tBloc[nbBlocs].tCle[i].uBloc = tm[iBase+i].uBloc;
    free(tm[iBase+i].szMot);
  }                        
  
  return ++nbBlocs;
}
  
  
void Analyse()
{
  long      i;
  long      iOpt;
  float     fOpt;
  int       iPasse;
  uchar     szPref[50];
  ushort    nbCles;     // Nb de mots dans le bloc concernés par le préfixe
  ushort    uBloc;      // N° de bloc
  
  for(iPasse=0 ; ; iPasse++)
  {  
    for (i=0 ; i<nbMots ; i++)
    { if (tm[i].nbCles==0)
        CalculeRatios(i);
    }
      
    /*
    if (nbMots<50)
    { fprintf(fTra, "\niPasse:%ld  %ld mots\n", i, nbMots);
      for (i=0 ; i<nbMots ; i++)
        fprintf(fTra, "%-30s  %4.1f%%  lp:%2d  nbCles:%d\n", tm[i].szMot, 100*tm[i].fRatio, tm[i].lPref, tm[i].nbCles);
      fprintf(fTra, "\n");
    }
    */
  
    fOpt = 0.0f;
    for (i=0 ; i<nbMots ; i++)
      if (tm[i].fRatio>fOpt)
      { fOpt = tm[i].fRatio;
        iOpt = i;
      }
      
    if (fOpt==0.0f) break;

    strcpy(szPref, tm[iOpt].szMot);
    szPref[tm[iOpt].lPref] = 0;
    nbCles = tm[iOpt].nbCles;
  
    uBloc = uCreeBloc(iOpt);
    
    // L'entrée est remplacé par le préfixe et un pointage de bloc
    tm[iOpt].szMot = strdup(szPref);
    tm[iOpt].uBloc = uBloc;     // 1er bloc = 1
                                               
    // On décale le reste des mots dans le  tableau
    for (i=iOpt+1 ; i+nbCles-1<nbMots ; i++)
      tm[i] = tm[i+nbCles-1];
    nbMots = nbMots-nbCles+1;
    printf("%ld \r", nbMots);
    fflush(stdout);
    
    // On marque ceux dont il faut recalculer le ratio (suite à l'explusion du bloc et l'insertion du préfixe)
    for (i=0 ; i<=iOpt ; i++)
      if (i+tm[i].nbCles>=iOpt)
        tm[i].nbCles = 0;
  } 
}


int compMots(const void *p1, const void *p2)
{
  return strcmp(((struct sTM *)p1)->szMot, ((struct sTM *)p2)->szMot);
}


int compBT(const void *p1, const void *p2)
{
  return (int)(((struct sBT *)p2)->uRef - ((struct sBT *)p1)->uRef);
}


void SorDico()
{
  int       hDic;           // Fichier de sortie (dictionnaire)
  ushort    i, j;
  ushort    nbCles;
  uchar     lgCle;
  uchar     lgCleComp;               
  ushort    uBloc;

  hDic = open(szPathPrincipal, O_WRONLY|O_CREAT|O_BINARY|O_TRUNC, 0666);
  if (hDic<0)
  { fprintf(stderr, "Echec à l'ouverture du fichier %s:", szPathPrincipal);
    exit(1);
  }
  
  fprintf(fTra, "\nEcriture du dictionnaire %s\n", szPathPrincipal);

  for (i=0 ; i<nbBlocs ; i++)
  {
    lgBloc = 2;
    fprintf(fTra, "Bloc %u (", i+1);
                   
    nbCles = tBloc[i].nbCles;
    for (j=0 ; j<nbCles ; j++)
    { 
      if (j) fprintf(fTra, ",");
      
      if (tBloc[i].tCle[j].szCle==NULL)
        lgCle = 0;
      else
        lgCle = (uchar)strlen(tBloc[i].tCle[j].szCle);
        
      if (lgCle>lgCleMax) lgCleMax = lgCle;
      
      lgCleComp = lgCle;
      uBloc = tBloc[i].tCle[j].uBloc;
      if (uBloc)
      {
        if (uBloc<=6)
          lgCleComp += (uchar)(32*uBloc);
        else
          lgCleComp += (uchar)(32*7);
      }
      
      fprintf(fTra, "[%d/%d]", lgCleComp/32, lgCleComp%32);
      if (tBloc[i].tCle[j].szCle!=NULL)
        fprintf(fTra, "%s", tBloc[i].tCle[j]);
        
      sBloc[lgBloc++] = lgCleComp;
      if (lgCle>0)
      { strncpy(sBloc+lgBloc, tBloc[i].tCle[j].szCle, lgCle);
        lgBloc += lgCle;
      }
      
      if (uBloc>6)
      { memcpy(sBloc+lgBloc, &uBloc, 2);
        lgBloc += 2;
        fprintf(fTra, "[%u]", uBloc);
      }
      else if (uBloc>0)
        fprintf(fTra, "<%u>", uBloc);
    }
    fprintf(fTra, ") lg=%u\n", lgBloc);
    memcpy(sBloc, &lgBloc, 2);
    write(hDic, sBloc, lgBloc);
    
    if (lgBloc>lgBlocMax) lgBlocMax = lgBloc;
    if (nbCles>nbClesMax) nbClesMax = nbCles;
  }                        

  sBloc[0] = sBloc[1] = 0;
  write(hDic, sBloc, 2);        // Dernier bloc, lg=0
  
  lTailleDico = tell(hDic);
  
  close(hDic);
}


void EchangeNB(ushort n1, ushort n2)
{
  ushort      i, j;             
  struct sTB    temp;
  
  fprintf(fTra, "Echange blocs %u et %u\n", n1, n2);
  
  // Les blocs
  temp = tBloc[n1-1];
  tBloc[n1-1] = tBloc[n2-1];
  tBloc[n2-1] = temp;
  
  // Les pointeurs uBloc associés aux clés
  for (i=0 ; i<nbBlocs ; i++)
    for (j=0 ; j<tBloc[i].nbCles ; j++)
      if (tBloc[i].tCle[j].uBloc==n1)
        tBloc[i].tCle[j].uBloc=n2;
      else if (tBloc[i].tCle[j].uBloc==n2)
        tBloc[i].tCle[j].uBloc=n1;

  // La table des blocs triés
  for (i=0 ; i<nbBlocs ; i++)
    if (tBT[i].uOldNum==n1)
      tBT[i].uOldNum=n2;
    else if (tBT[i].uOldNum==n2)
      tBT[i].uOldNum=n1;
}

void OptimiseNumBlocs()
{
  ushort  i;
    
  tBT = (struct sBT *)malloc(nbBlocs*sizeof(struct sBT));
  if (tBT==NULL)
  { printf("Echec au malloc(%u) pour tBT\n", nbBlocs*sizeof(struct sBT));
    exit(1);
  }
  for (i=0 ; i<nbBlocs ; i++)
  { tBT[i].uOldNum = i+1;
    tBT[i].uRef = tBloc[i].uRef;
  }
  qsort((void *)tBT, nbBlocs, sizeof(tBT[0]), compBT);
  fprintf(fTra, "\nLes 6 blocs les plus utilisés\n");
  for (i=0 ; i<6 ; i++)
  { fprintf(fTra, "Bloc %5u:  nb réf: %5u\n", tBT[i].uOldNum, tBT[i].uRef);
   
    if (tBT[i].uOldNum!=i+1) 
      EchangeNB(tBT[i].uOldNum, (ushort)(i+1));
  }
}



void main()
{                      
  FILE      *fMots;
  char      lettre;
  ushort    nbmloc;     // nombre de mots pour la lettre courante
  long      nbmstart;   // Indice de départ du 1er mot pour la lettre courante
  long      nbMotsTot = 0;
  ushort    lgMot;
  time_t    tDebut;
  int       iATrier;
  
  
  tDebut = time(0L);
  
  fTra = fopen("dico.tra", "w");
  if (fTra==NULL)
  { perror("Echec à l'ouverture du fichier trace dico.tra");
    exit(1);
  }              

  chdir(szPathMots);
  
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
  
    printf("Lecture du fichier %s... ", szNomficMots);
    fflush(stdout);                                      
    nbmloc = 0;                                           
    nbmstart = nbMots;
    iATrier = 0;
    while (fgets(szBuffer, 100, fMots)!=NULL)
    {                              
      //if (strchr(szBuffer, '-')!=NULL) continue;  // Les mots composés sont ignorés
      szBuffer[strlen(szBuffer)-1] = 0;
      if (szBuffer[0]==0) continue;                 // Les lignes vides sont ignorées
      
      lgMot = strlen(szBuffer);
      if (lgMot>lgMotMax) lgMotMax = lgMot;
      
      if (nbMots>=MAXMOTS)
      { printf("Nb maximum de mots (%u) atteint !\n", MAXMOTS);
        exit(1);
      }
      
      tm[nbMots].szMot = strdup((char *)szBuffer);
      if (tm[nbMots].szMot==NULL)
      { printf("Echec au strdup, mot %u %s\n", nbmloc, szBuffer);
        exit(1);
      }
      tm[nbMots].fRatio = 0.0f;
      tm[nbMots].lPref = 0;
      tm[nbMots].nbCles = 0;
      tm[nbMots].uBloc = 0;         // Mot simple
      
      if (nbmloc && strcmp(tm[nbMots-1].szMot, tm[nbMots].szMot)>0)
        iATrier = 1;
      
      nbMots++;   
      nbmloc++;
      nbMotsTot++;
    }          
    printf("%5u mots  ", nbmloc);
    fflush(stdout);
    lTailleMots += ftell(fMots);
    fclose(fMots);                 

    if (iATrier)
    { printf("Tri... ");
      fflush(stdout);
      
      qsort((void *)(tm+nbmstart), nbmloc, sizeof(tm[0]), compMots);
    }
    printf("\n");

    Analyse();
  }
  printf("Fin de la lecture: %ld mots trouvés\n", nbMotsTot);
  nbMots;
  
  printf("Début de la construction des blocs\n");
  // Ecriture du super-bloc
  tm[0].nbCles = (ushort)nbMots;
  tm[0].lPref = 0;
  uCreeBloc(0);
    
  printf("Tris des blocs selon le fréquence d'utilisation\n");
  OptimiseNumBlocs();
  
  printf("Ecriture du dictionnaire\n");
  SorDico();
  tDebut = time(0L)-tDebut;

  printf("\n");
  printf("nb mots:         %ld\n", nbMotsTot);
  printf("nb blocs:        %u\n", nbBlocs);
  printf("lgBloc max:      %u o\n", lgBlocMax);
  printf("nb clé max:      %u\n", nbClesMax);
  printf("lg clé max:      %i car\n", lgCleMax);
  printf("lg mot max:      %u car\n", lgMotMax);
  printf("Taille des mots: %ld o\n", lTailleMots);
  printf("Taile du dict:   %ld o\n", lTailleDico);
  printf("Taux de réduc:   %5.2f%%\n", (lTailleDico*100.0f)/lTailleMots);
  printf("Durée:           %ld sec\n", tDebut);
  
  printf("\nTerminé !\n");
  
  fclose(fTra);
}
