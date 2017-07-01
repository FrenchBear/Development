// tmfr.cpp
// Affichage de la date et de l'heure en fran‡ais
// 20/02/94 PV
//  4/08/98 PV	Ajout d'un retour à la ligne !
// 16/08/00 PV	Retour 0, ça fait plus propre comme code de sortie de fin de script que 0x40dd08 !
//  1/12/03 PV  v1.3 affichage des options après la date


#include <iostream.h> 
#include <iomanip.h>
#include <string.h>
#include <malloc.h>
#include <time.h>
#include <Windows.h>

void Identification()
{
	cout	<< "TMFR 1.3\n"
			<< "Affichage de la date et de l'heure en fran‡ais.\n\n";
}

inline void Usage()
{
	cout	<< "Usage: TMFR [/?] [texte]\n";
}

inline void Info()
{
	cout	<< "Fichier:          " << __FILE__  << '\n'
			<< "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
			<< "Date fichier:     " << __TIMESTAMP__ << '\n'
			<< "Compilateur:      " << _MSC_VER << '\n'
			<< "Copyright:        " << "(c) 1994-2003 P.VIOLENT";

}
  
  
static char *szJour[7] =
{	"Dim",
	"Lun",
	"Mar",
	"Mer",
	"Jeu",
	"Ven",
	"Sam"
};

/*
static char *szMois[12] =
{
	"Janvier",
	"F‚vrier",
	"Mars",
	"Avril",
	"Mai",
	"Juin",
	"Juillet",
	"Ao–t",
	"Septembre",
	"Octobre",
	"Novembre",
	"D‚cembre"
};
*/

ios& fillzero(ios& r)
{          
  r.fill('0');
  return r;
}


int main(int argc, char **argv)
{
  if (argc>1)
  {
    if (strcmp(argv[1], "/??")==0)
    { 
      Identification();
      Info();
      return 1;
    }        

    if (strncmp(argv[1], "/?", 2)==0)
    { 
      Identification();
      Usage();
      return 2;
    }        
    
  }

  time_t t = time(0L);     
  struct tm *lt = localtime(&t);
  
  cout	<< szJour[lt->tm_wday] << ' ' 
	    << setw(2) << lt->tm_mday << '/' 
	    << setw(2) << lt->tm_mon+1 << '/'
		<< lt->tm_year+1900 << ' '
		<< setw(2) << fillzero << lt->tm_hour << ':'
		<< setw(2) << lt->tm_min << ':'
		<< setw(2) << lt->tm_sec;

  if (argc>1)
  {
	cout << ',';
	for (int i=1 ; i<argc ; i++)
	{
	  char *ps = (char *)alloca(strlen(argv[i])+1);
	  CharToOemBuff(argv[i], ps, strlen(argv[i])+1);
	  cout << ' ' << ps;
	}
  }

  cout 	<< endl;

  return 0;
}
