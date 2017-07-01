// treel.cpp
// Dessine l'arorescence des répertoires en version "nom de fichiers longs"
// P.VIOLENT 19/02/95

#include "tw.h"

#include <stdio.h>
#include <iostream.h>
#include <stdlib.h>
#include <direct.h>
#include <string.h>
#include <io.h>

#include <sys/types.h>
#include <sys/stat.h>

#include "cstring.h"

int iNbSousRepTotal = 0;

void Identification()
{
  cout << "TREEL 1.0\n"
       << "Affichage d'une arborescence de r‚pertoire, version noms de fichiers longs.\n\n";
}

inline void Usage()
{
  cout << "Usage: TREEL [/?]\n";
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
       << "Date fichier:     " << __TIMESTAMP__ << '\n'
       << "Compilateur:      MSC " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1995 P.VIOLENT";

}


void dessine(CString sPath, CString sMarge)
{
  struct _finddata_t fd;
  CString sModele;
  CString sMargeFils;
  char *szModele;
  int hf;
  int i;
  char **pszSousRep = NULL;
  int iNbSousRep = 0;

  sModele = sPath;
  if (sModele.Right(1)!="\\") sModele = sModele + "\\";
  sModele = sModele + "*.*";
  szModele = (char *)(const char *)sModele;
  hf = _findfirst(szModele, &fd);
  if (hf>0)
    do
    {
	  if (fd.attrib&_A_SUBDIR && strcmp(fd.name, ".") & strcmp(fd.name, ".."))
	  { pszSousRep = (char **)realloc(pszSousRep, (iNbSousRep+1)*sizeof(char *));
		pszSousRep[iNbSousRep++] = strdup(fd.name);
	  }
  	  i = _findnext(hf, &fd);
    } while (i!=-1);
  _findclose(hf);

  for (i=0 ; i<iNbSousRep ; i++)
  {
    if (i==iNbSousRep-1)
	  sMargeFils = sMarge + "   ";
	else if (i==0)
	  sMargeFils = sMarge + "\xB3  ";

    char szSousRepOEM[256];
    CharToOemBuff(pszSousRep[i], szSousRepOEM, strlen(pszSousRep[i])+1);
    cout << sMarge << ((i==iNbSousRep-1) ? "\xC0\xC4 " : "\xC3\xC4 ") << szSousRepOEM << endl;

    sModele = sPath;
    if (sModele.Right(1)!="\\") sModele = sModele + "\\";
    sModele = sModele + pszSousRep[i];
    dessine(sModele, sMargeFils);
	free(pszSousRep[i]);

	iNbSousRepTotal++;
  }

  if (iNbSousRep)
    free(pszSousRep);
}


int main(int argc, char **argv)
{
  char szCurrentPath[256];

  if (argc>1)
  {
    if (strcmp(argv[1], "/??")==0)
    { 
      Identification();
      Info();
      return 0;
    }        

    if (strncmp(argv[1], "/?", 2)==0)
    { 
      Identification();
      Usage();
      return 0;
    }        
  }

  if (argc>1)
  { 
    struct _stat sb;

    strncpy(szCurrentPath, argv[1], sizeof(szCurrentPath));
	szCurrentPath[sizeof(szCurrentPath)-2] = 0;
	if (szCurrentPath[strlen(szCurrentPath)-1] != '\\')
	  strcat(szCurrentPath, "\\");
	if (_stat(szCurrentPath, &sb)<0)
	{
	  CString sMessage;
          sMessage = "treel: Echec … la lecture du r‚pertoire '";
	  sMessage = sMessage + szCurrentPath + "'";
	  perror(sMessage);
	  return 1;
	}
  }
  else
    getcwd(szCurrentPath, sizeof(szCurrentPath));

  cout << szCurrentPath << endl;
  dessine(szCurrentPath, "");
  cout << endl << iNbSousRepTotal << " sous-r‚pertoire(s)\n";

  return 0;
}
