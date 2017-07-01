// testlect.cpp
// Test de lecture récursif de fichiers
// Usage: testlect [/s] répertoire|fichier|motif...
// Option /s: récursif
// Motif: utilise * et/ou ? sans /
//
// Codes de retour :
// 0: aucun problème
// 1: problème dans les arguments
// 2: problème de lecture
//
// 26/05/98 PV

#include <Windows.h>
#include <iostream.h>
#include <stdio.h>
#include <malloc.h>
#include <io.h>
#include <sys\stat.h>	  // _stat
#include <direct.h>		  // _getcwd
#include <crtdbg.h>
#include "CString.h"

const CString sNomApp = "testlect";

class Collection
{
private:
  int iNbNom;
  CString **tsNom;

public:
  Collection() { iNbNom=0; tsNom=NULL; }
  ~Collection() { if (tsNom) free(tsNom); }

  void add(const CString &sNom)
  {
	tsNom = (CString **)realloc(tsNom, (iNbNom+1)*sizeof(CString *));
	tsNom[iNbNom] = new CString(sNom);
	iNbNom++;
  }

  int count() { return iNbNom; }

  CString &operator[](int iRang)
  {
	_ASSERT(iRang>=0 && iRang<iNbNom);
	return *tsNom[iRang];
  }
};

Collection colMotif;
Collection colRepertoire;
Collection colFichierAbsolu;

BOOL bRecursif = FALSE;
BOOL bTest = FALSE;
BOOL bVerbose = FALSE;

int iNbLu = 0;

///////////////////////////////////////////////////////////////////////////

void Identification()
{
  cout << "TESTLECT 1.0\n"
       << "Test de lecture de fichiers\n\n";
}

inline void Usage()
{
  cout << "Usage: TESTLECT [/?] [/S] [/v] Dossier|Fichier|Motif\n"
           << "Les dossiers sont les points de d‚part de la recherche r‚cursive si l'option /s est utilis‚e. Par d‚faut: dossier courant\n"
           << "Les motifs sont d‚finis avec les caractŠres joker * et ? (exemple: *.bak)\n"
		   << "Options: /v: Mode verbose\n"
           << "         /s: Mode r‚cursif\n"
		   << "         /t: Mode test, la lecture n'est pas faite\n";
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
       << "Date fichier:     " << __TIMESTAMP__ << '\n'
       << "Compilateur:      MSC " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1998 P.VIOLENT";

}


///////////////////////////////////////////////////////////////////////////
// Conversions OEM <--> ANSI pratiques

CString OEM(const CString &sANSI)
{
  char *ps = (char *)alloca(sANSI.GetLength()+1);
  CharToOemBuff(sANSI, ps, sANSI.GetLength()+1);
  return CString(ps);
}

CString ANSI(const CString &sOEM)
{
  char *ps = (char *)alloca(sOEM.GetLength()+1);
  CharToOemBuff(sOEM, ps, sOEM.GetLength()+1);
  return CString(ps);
}


///////////////////////////////////////////////////////////////////////////

Collection colProblemes;

void AjouteProbleme(const CString sMessage)
{
	colProblemes.add(sMessage);
}


// Version sophistiquée du perror compatible multithread, à base de GetLastError()
void AfficheErrSysteme(const CString sMessage)
{
  char *lpMsgBuf;
  DWORD iErr = GetLastError();
  char *p;
  size_t l;

  FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
	NULL, iErr, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
	(LPTSTR) &lpMsgBuf, 0, NULL);

  // On élimine les retours à la ligne dans le message
  while (p=strchr(lpMsgBuf, '\n'))
	*p = ' ';
  while (p=strchr(lpMsgBuf, '\r'))
	*p = ' ';
  while ((l=strlen(lpMsgBuf)) && lpMsgBuf[l-1]==' ')
	lpMsgBuf[l-1] = 0;

  char szErr[10];
  sprintf(szErr, "%d", iErr);
  cout << ": Erreur " << szErr << ": " << OEM(lpMsgBuf) << endl;
  if (!sMessage.IsEmpty())
    AjouteProbleme(sMessage+": Erreur "+szErr+": "+OEM(lpMsgBuf));

  LocalFree(lpMsgBuf);
}


// Lit un fichier
void TestLecture(const CString sNomfic)
{
	const TAILLEBUFF = 16384;
	HANDLE hFile;
	DWORD  dwBytesRead;
	char   buff[TAILLEBUFF];
	DWORD  dwSize;
	DWORD  dwBlocs, dwBlocCourant = 0;

	hFile = CreateFile(sNomfic,            // open MYFILE.TXT 
                GENERIC_READ,              // open for reading 
                FILE_SHARE_READ | FILE_SHARE_WRITE,
                NULL,                      // no security 
                OPEN_EXISTING,             // existing file only 
                FILE_FLAG_SEQUENTIAL_SCAN, // normal file 
                NULL);                     // no attr. template 
	if (hFile==INVALID_HANDLE_VALUE)
	{
	  if (!bVerbose)
		cout << OEM(sNomfic);
      cout << ": chec ouverture";
	  AfficheErrSysteme(sNomfic);
      if (bVerbose) cout << endl;
	  return;
	}

	dwSize = GetFileSize(hFile, NULL);
	if (dwSize == 0xFFFFFFFF) dwSize = 0;	// On ne traite pas les erreurs à ce niveau
	dwBlocs = dwSize/TAILLEBUFF;

	do
	{
	  if (ReadFile(hFile, buff, TAILLEBUFF, &dwBytesRead, NULL)==0) 
	  { 
		if (!bVerbose)
		  cout << OEM(sNomfic);
        cout << ": chec lecture";
		AfficheErrSysteme(sNomfic);
		if (bVerbose) cout << endl;
		CloseHandle(hFile);
		return;
	  }

	  if (dwBytesRead==TAILLEBUFF)
	  {
		dwBlocCourant++;
		if (dwBlocCourant%100 == 0)
		{
			cout << (100*dwBlocCourant)/dwBlocs << "%\r";
			cout.flush();
		}
	  }
	} while (dwBytesRead>0);  
	
	CloseHandle(hFile); 
}


void Lit1Fichier(const CString &sChemin)
{
  iNbLu++;

  if (bVerbose)
	cout << OEM(sChemin);
  else
	cout << "     Fichier " << iNbLu << "\r";
  cout.flush();

  TestLecture(sChemin);

  if (bVerbose)
    cout << endl;
}

void Analyse(CString sStartPath)
{
  struct _finddata_t fd;
  CString sModele;
  int hf;
  int i, m;

  // On normalise le répertoire de départ
  if (sStartPath.Right(1)!="\\") sStartPath = sStartPath + "\\";

  // On recherche les fichiers correspondant au motif souhaité
  for (m=0 ; m<colMotif.count() ; m++)
  {
	sModele = sStartPath + colMotif[m];
	hf = _findfirst((const char *)sModele, &fd);
	if (hf>0)
	  do
	  {
		if ((fd.attrib&_A_SUBDIR)==0)
		  Lit1Fichier(sStartPath+fd.name);
  		i = _findnext(hf, &fd);
	  } while (i!=-1);
	_findclose(hf);
  }

  if (bRecursif)
  {
	// Puis on descend récursivement dans les sous-répertoires
	sModele = sStartPath + "*.*";
	hf = _findfirst((const char *)sModele, &fd);
	if (hf>0)
	  do
	  {
		// On ne parcourt pas récursivement . et .., ni les répertoires
		// qui ont à la fois les attributs HIDDEN et SYSTEM, ce qui est
		// en particulier le cas de la corbeille (répertoire \RECYCLED)
		if (fd.attrib&_A_SUBDIR && strcmp(fd.name, ".") && strcmp(fd.name, "..") && ((fd.attrib&_A_HIDDEN)==0 || (fd.attrib&_A_SYSTEM)==0))
		  Analyse(sStartPath+fd.name);
  		i = _findnext(hf, &fd);
	  } while (i!=-1);
	_findclose(hf);
  }

}


int main(int argc, char **argv)
{
  int i;
  BOOL bProbleme = FALSE;

  // On traite les options lors d'une première passe
  // de façon à ne pas rendre l'ordre des options significatif
  for (i=1 ; i<argc ; i++)
  {
	if (stricmp(argv[i], "/s")==0 || stricmp(argv[i], "-s")==0)
	  bRecursif = TRUE;
	else if (stricmp(argv[i], "/v")==0 || stricmp(argv[i], "-v")==0)
	  bVerbose = TRUE;
	else if (stricmp(argv[i], "/t")==0 || stricmp(argv[i], "-t")==0)
	  bTest = TRUE;
	else if (strcmp(argv[1], "/??")==0 || strcmp(argv[1], "-??")==0 )
    { 
      Identification();
      Info();
      return 0;
    }        
    else if (strcmp(argv[i], "/?")==0 || strcmp(argv[i], "-?")==0)
    { 
      Identification();
      Usage();
      return 0;
    }
	else if (argv[i][0]=='/' || argv[i][0]=='-')
	{
	  cerr << sNomApp << ": Option " << argv[i] << " inconnue\n";
	  bProbleme = TRUE;
	}
  }


  // Le reste des arguments est traité dans une deuxième passe
  for (i=1 ; i<argc ; i++)
  {
	// A convertir d'OEM en ANSI
	char szAnsiOpt[256];
	OemToCharBuff(argv[i], szAnsiOpt, strlen(argv[i])+1);

	if (szAnsiOpt[0]=='/' || szAnsiOpt[0]=='-')
	  /* Option déjà traitée */;
	else if (strchr(szAnsiOpt, '*')!=NULL || strchr(szAnsiOpt, '?')!=NULL)
	{
	  // Motif. On vérifie qu'il ne contient ni \ ni / ni :
	  if (strchr(szAnsiOpt, '\\') || strchr(szAnsiOpt, '?') || strchr(szAnsiOpt, ':'))
	  {
        cerr << sNomApp << ": Le motif '" << szAnsiOpt << "' contient un caractŠre interdit (:, \\ ou /)\n";
		bProbleme = TRUE;
	  }
	  else
		colMotif.add(szAnsiOpt);
	}
	else
	{
	  struct _stat sb;
	  if (_stat(szAnsiOpt, &sb)<0)
	  {
		// Un fichier inexistant sans chemin absolu est accepté en mode récursif
		if (!bRecursif || strchr(szAnsiOpt, '\\') || strchr(szAnsiOpt, ':'))
		{
		  cerr << sNomApp << ": '" << szAnsiOpt << "' n'est ni un fichier ni un dossier existant\n";
		  bProbleme = TRUE;
		}
		else
		  colMotif.add(szAnsiOpt);
	  }
	  else
	  {
	    if ((sb.st_mode&_S_IFDIR)==_S_IFDIR)
		  colRepertoire.add(szAnsiOpt);
		else if (strchr(szAnsiOpt, '\\')==0 && strchr(szAnsiOpt, ':')==0)
		  colMotif.add(szAnsiOpt);
		else
		  colFichierAbsolu.add(szAnsiOpt);
	  }
	}
  }

  if (colMotif.count()==0 && colFichierAbsolu.count()==0)
    colMotif.add("*.*");

  if (bProbleme)
	return 1;

  // Si on n'a précisé aucun répertoire on part du répertoire courant
  if (colRepertoire.count()==0 && bRecursif)
  {
	char szCurrentPath[256];
    _getcwd(szCurrentPath, sizeof(szCurrentPath));
	colRepertoire.add(szCurrentPath);
  }

  for (i=0 ; i<colRepertoire.count() ; i++)
	Analyse(colRepertoire[i]);
  for (i=0 ; i<colFichierAbsolu.count() ; i++)
	Lit1Fichier(colFichierAbsolu[i]);

  cout << sNomApp << ": ";
  if (iNbLu)
	cout << iNbLu;
  else
    cout << "Aucun";
  cout << " fichier";
  if (iNbLu>1) cout << "s";
  cout << " lu";
  if (iNbLu>1) cout << "s";

  if (colProblemes.count()>0)
  {
	cout << ", " << colProblemes.count() << " erreur";
	if (colProblemes.count()>1) cout << "s";
  }
  else
	if (iNbLu>0)
	  cout << ", aucune erreur";
  cout << ".\n";

  if (bVerbose && colProblemes.count()>0)
  {
	  cout << "\nListe des erreurs" << endl;
	  for (i=0 ; i<colProblemes.count() ; i++)
		  cout << colProblemes[i] << endl;

	  char c[10];
	  cerr << "Entr‚e pour continuer...";
	  cin.getline(c, sizeof(c));
  }

  return colProblemes.count()>0 ? 2 : 0;
}
