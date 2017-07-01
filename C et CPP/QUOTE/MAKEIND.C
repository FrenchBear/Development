// makeind.c
// prépare le fichier quotes.ind
//  6/5/94 PV

#include <stdio.h>
#include <io.h>
#include <fcntl.h>

int main()
{     
  FILE *f;  
  int g;
  char szBuffer[300];
  long lp = 0;			// Dernière position
  long nbq = 0;			// Nb de quotes
  int  z = 0;
  int  i;
  
  f = fopen("quotes.txt", "r");
  if (f==NULL)
  { perror("Echec à l'ouverture de quotes.txt");
    return 1;
  }     
  
  g = open("quotes.ind", O_RDWR|O_CREAT|O_BINARY, 0666);
  if (g<0)
  { perror("Echec à la création de quotes.ind");
    return 1;
  }
            
  lp = tell(g);
  write(g, &lp, sizeof(long));
  while (fgets(szBuffer, 300, f)!=NULL)
  {
    if (szBuffer[0]=='$')
    { 
      write(g, &lp, sizeof(long));
      printf("%ld: %ld\n", nbq, lp);
      nbq++;
    }
    lp = ftell(f);
  }
  printf("%d quotes\n", nbq);
  
  fclose(f);        
  
  // Table de nbq zéros pour éviter de ressortir les mêmes
  for (i=0 ; i<nbq ; i++)
    write(g, &z, 1);   
                    
  // On enregistre le nombre de quotes
  lseek(g, 0, 0);
  write(g, &nbq, 4);                  
  
  close(g);
  
  return 0;
}