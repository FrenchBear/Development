// quote.cpp
// Affiche une citation
// PV mai 94
//  6/05/94 Première version


#include <stdio.h> 			// perror
#include <stdlib.h>			// exit
#include <io.h>				// open
#include <fcntl.h>			// O_RDWR
#include <iostream.h>		// cout
#include <string.h>			// strcmp
#include <ctype.h>			// isspace
#include <time.h>

int iTrace = 0;

#define MAXBUFFER 5000
char szBuffer[MAXBUFFER];

void Identification()
{
  cout << "QUOTE 1.0\n"
       << "Affichage d'une citation.\n\n";
}

inline void Usage()
{
  cout << "Usage: QUOTE [/?] [fichier_citation.quo]\n"
       << "Par défaur, c'est le fichier quotes.quo du répertoire courant qui est lu\n";
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
       << "Date fichier:     " << __TIMESTAMP__ << '\n'
       << "Compilateur:      " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1994 P.VIOLENT";
}
 
 
int iCreeIndex(FILE *f, char *szNomInd)
{     
  int g;
  long lp = 0;			// Dernière position
  long nbq = 0;			// Nb de quotes
  int  z = 0;
  int  i;
        
  if (iTrace)
    cout << "Création du fichier index " << szNomInd << '\n';
  g = open(szNomInd, O_RDWR|O_CREAT|O_BINARY, 0666);
  if (g<0)
  { fprintf(stderr, "Echec à la création du fichier index ", szNomInd);
    perror(szNomInd);
    return -1;
  }

  rewind(f);            
  lp = 0;
  write(g, &lp, sizeof(long));	// filler pour le nombre de citations (inconnu pour l'instant)
  
  while (fgets(szBuffer, MAXBUFFER, f)!=NULL)
  {
    if (szBuffer[0]=='$')
    { 
      write(g, &lp, sizeof(long));         
      if (iTrace)
        cout << nbq << ':' << lp << '\n';
      nbq++;
    }
    lp = ftell(f);
  }                                   
  
  if (nbq==0)
  { cout << "Problème: aucune citation repérée !\n"
         << "Chaque citation doit commencer par un $, y compris la première.\n";
    close(g);
    unlink(szNomInd);
    exit(1);
  }
  
  if (iTrace)
    cout << nbq << " citations\n";
  
  // Table de nbq zéros pour éviter de ressortir les mêmes
  for (i=0 ; i<nbq ; i++)
    write(g, &z, 1);   
                    
  // On enregistre le nombre de quotes
  lseek(g, 0, 0);
  write(g, &nbq, 4);
  lseek(g, 0, 0);
                              
  if (iTrace)
    cout << "Fin de la création du fichier index\n";                              
  return g;
}                                  


int iLongMot(char *s)
{
  int l = 0;
  
  while (*s && !isspace(*s))
  {
    s++;
    l++;
  }
  return l;
}
              
              
void AfficheQuote(char *szNomTxt)
{
  int hind;		// fichier index
  FILE *ftxt;	// fichier des citations
  long nbq;		// nb de citations
  long q;       // citation choisie au hasard (de 0 à nbq-1)
  char dispo;   // citation déjà tirée ?
  long adq;		// adresse du texte de la citation
  int  n;
  long lStatus;
  char szNomInd[128];
  
  if (stricmp(szNomTxt+strlen(szNomTxt)-4, ".quo")!=0)
  {
    cout << "Le ficher de citations doit se terminr par .quo ! " << szNomTxt+strlen(szNomTxt)-4;
    return;
  }
  
  ftxt = fopen(szNomTxt, "r");
  if (ftxt==NULL)
  { fprintf(stderr, "Echec à l'ouverture du fichier ");
    perror(szNomTxt);
    exit(1);
  }   
                   
  strcpy(szNomInd, szNomTxt);
  strcpy(szNomInd+strlen(szNomInd)-4, ".ind");
  hind = open(szNomInd, O_RDWR|O_BINARY);
  if (hind<0 && errno==2)	// No such file
    hind = iCreeIndex(ftxt, szNomInd);
  if (hind<0)
  { fprintf(stderr, "Echec à l'ouverture du fichier ");
    perror(szNomInd);
    exit(1);
  }        
                       
relecture:
  read(hind, &nbq, sizeof(long));  
                
  if (iTrace)
    cout << nbq << " citations\n";  

  srand( (unsigned)time( NULL ) );
  q = rand()%nbq;
  for(n =0 ; ; n++)
  {                             
    if (iTrace)
      cout << "Essai " << q << " adr: " << 4*(nbq+1)+q << ' ';
    lStatus = lseek(hind, 4*(nbq+1)+q, 0);
    if (lStatus<0)
    { perror("Echec au lseek");
      exit(1);
    }
    read(hind, &dispo, 1);
    if (dispo==0)
    { 
      if (iTrace)
        cout << "libre\n";
      break;
    }                   
    if (iTrace)
      cout << "pas libre\n";
    q = (q+1)%nbq;
    if (n==nbq-1)
    { 
      if (iTrace)
        cout << "Effacement général\n";
      lseek(hind, 4*(nbq+1), 0);     
      dispo = 0;
      for (n=0 ; n<nbq ; n++)
        write(hind, &dispo, 1);
      n = 0;
    }
  }                          
  
  dispo = 1;
  lseek(hind, 4*(nbq+1)+q, 0);
  write(hind, &dispo, 1);
  lseek(hind, 4*(q+1), 0);
  read(hind, &adq, sizeof(long));                    
  
  if (iTrace)
    cout << "Adresse citation: " << adq << '\n';
          
  fseek(ftxt, adq, 0);
  if (fgetc(ftxt)!='$')
  {
    static int iMedor = 0;
    iMedor++;
    if (iMedor>1)
    { cout << "Erreur grave, double erreur de couhérence -> Arrêt du programme\n";
      exit(1);
    } 
    if (iTrace)
      cout << "Erreur de cohérence, réindexation du fichier\n";
    close(hind);
    hind = iCreeIndex(ftxt, szNomInd);
    goto relecture;
  }
  while (fgets(szBuffer, MAXBUFFER, ftxt)!=NULL)
  {
    if (szBuffer[0]=='$') break;
    int p = 0;
    int c = 0;           
    unsigned char ch;
    
    for(;;)   
    {
      if (c+iLongMot(szBuffer+p)>78)
      { cout << '\n';
        c = 0;
      }
      do
      {                    
        ch = szBuffer[p++];
        cout << ch;                
        c++;
      } while (ch && !isspace(ch));
      if (ch==0 || ch=='\n') break;
    }
    if (ch!='\n')
      cout << '\n';
  }

  close(hind);
  fclose(ftxt);
}
  


void main(int argc, char **argv)
{
  int iOpt = 1;      
  char *szPath;

  if (argc>1)
  {
    if (strcmp(argv[1], "/??")==0)
    { 
      Identification();
      Info();
      exit(0);
    }        

    if (strncmp(argv[1], "/?", 2)==0)
    { 
      Identification();
      Usage();
      exit(0);
    }        
    
    if (stricmp(argv[1], "/t")==0)
    { 
      iTrace = 1;
      iOpt++;
    }        
  }          
  
  if (argc>iOpt)
    szPath = argv[iOpt];
  else
    szPath = "quotes.quo";
  
  AfficheQuote(szPath);
  exit(0);
}