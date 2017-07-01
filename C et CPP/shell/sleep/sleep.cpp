// sleep.cpp
// Pause simple lors de l'exécution d'un programme
//  4/12/03 PV

#include <iostream.h> 
//#include <iomanip.h>
//#include <string.h>
//#include <malloc.h>
//#include <time.h>
#include <Windows.h>

void Identification()
{
	cout	<< "SLEEP 1.0\n"
            << "Pause simple lors de l'ex‚cution d'un programme.\n\n";
}

inline void Usage()
{
    cout    << "Usage: SLEEP [/?] dur‚e_en_secondes\n";
}

inline void Info()
{
	cout	<< "Fichier:          " << __FILE__  << '\n'
			<< "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
			<< "Date fichier:     " << __TIMESTAMP__ << '\n'
			<< "Compilateur:      " << _MSC_VER << '\n'
			<< "Copyright:        " << "(c) 2003 P.VIOLENT";

}
  

int main(int argc, char **argv)
{
  if (argc!=2)
  {
    Usage();
	return 2;
  }

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

  DWORD dwTemps = 1000 * atoi(argv[1]);
  Sleep(dwTemps);

  return 0;
}
