// decmime.cpp
// Application de décodage des fichiers mime
// 29/05/95 PV

#include <iostream.h>
#include <fstream.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void Identification()
{
  cout << "DECMIME 1.0\n"
	   << "Decodeur de fichiers MIME.\n\n";
}

inline void Usage()
{
  cout << "Usage: DECMIME [/?] nomfic\n"
	   << "nomfic est le nom du fichier contenant les données codées MIME\n";
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
	   << "Date fichier:     " << __TIMESTAMP__ << '\n'
	   << "Compilateur:      " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1995 P.VIOLENT";
}

void main(int argc, char **argv)
{
  if (argc>1)
  {
	if (strcmp(argv[1], "/??")==0)
	{ 
	  Identification();
	  Info();
	  return;
	}        

	if (strncmp(argv[1], "/?", 2)==0)
	{ 
	  Identification();
	  Usage();
	  return;
	}        
  }

  if (argc!=2)
  {
	Identification();
   	Usage();
	return;
  }
  
  cout << "Décodage en cours...\n";

  ifstream f;
  char szBuffer[100];

  f.open(argv[1]);
  if (!f.is_open())
  {
    cerr << "Echec à l'ouverture du fichier '" << argv[1] << "': ";
	perror("");
	exit(1);
  }
  
  while (f.good())
  {
    f.getline(szBuffer, 100);
    cout << '<' << szBuffer << '>' << endl;
  }
  f.close();

  cout << "Décodage terminé !\n";
}
