// majsoft.cpp
// Met à jour les programmes sur un micro
// Usage: majsoft [/t] [/v] source cible
// Options: /t: test, affiche les opérations mais ne fait rien
//          /v: verbose, affiche le détail de l'analyse
//			/m: affiche les macros
// 25/11/96 PV  1.0
// 17/07/97 PV  1.1    Macros lues dans la registry (favorites folders); Affichage OEM()
// 20/08/00 PV  1.2    Récupération de Program Files dans $ProgramFiles
// 25/08/00 PV  1.2.1  Bug sous NT (droits d'accès)
// 25/08/00 PV  1.3    Dossier paramétrable
// 16/10/00 PV  1.3.1  Défaut sur X:
// 16/10/00 PV  1.3.2  Défaut X:\majsoft\majsoftx.ini


#include <Windows.h>
#include <iostream.h>
#include <stdio.h>			  // sprintf
#include <io.h>				  // access
#include <malloc.h>
#include <assert.h>
#include <time.h>

#include "CString.h"		  // Classe CString
#include "strop.h"			  // Opérations sur chaînes
#include "stristr.h"

BOOL bTest = FALSE;			  // Option t
BOOL bVerbose = FALSE;		  // Option v
BOOL bListeMacros = FALSE;	  // Option m

int iNbCopy = 0;			  // Nb de fichiers copiés
int iNbNoCopy = 0;			  // Nb d'échecs à la copie


const char szFichierIniDefaut[] = "X:\\MajSoft\\MajSoftX.ini";

#define NBMAXMACROS 30

struct Macro
{
  CString sCle;				  // Nom de la macro, commençant par $
  CString sValeur;			  // Valeur de la macro
} tMacros[NBMAXMACROS];

int iNbMacros;				  // Nb de macros dans le tableau tMacros


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
// Emballe une chaîne de guillements si elle contient un espace, ou retourne
// la chaîne non modifiée dans le cas contraire

CString Guillemets(const CString &sBase)
{
  if (sBase.Find(' ')>=0)
	return '"' + sBase + '"';
  else
	return sBase;
}

///////////////////////////////////////////////////////////////////////////
// Assistance pour les E/S des dates et les entiers 64 bits

ostream &operator <<(ostream &o, const struct _FILETIME &ft)
{
  
  FILETIME lt;	  // Localtime;
  SYSTEMTIME st;

  FileTimeToLocalFileTime(&ft, &lt);
  FileTimeToSystemTime(&lt, &st);

  char szDate[20];
  sprintf(szDate, "%2d/%02d/%4d %2d:%02d:%02d", st.wDay, st.wMonth, st.wYear, st.wHour, st.wMinute, st.wSecond);
  o << szDate;
  return o;
}


ostream &operator <<(ostream &o, const __int64 &ll)
{
  char szBuffer[32];

  sprintf(szBuffer, "%I64d", ll);
  o << szBuffer;
  return o;
}

///////////////////////////////////////////////////////////////////////////

void Pause()
{
  char c[10];

  cerr << "Entr‚e pour continuer...";
  cin.getline(c, sizeof(c));
}


///////////////////////////////////////////////////////////////////////////
// Traitement des accents

/* majAZ Convertit un caractère en majuscule (si c'est possible) entre
**	 A et Z, c'est à dire non accentuée.  Ainsi, toutes les lettres
**	 suivantes sont converties en 'E':  e é è ê ë É E
**	 Si la conversion n'est pas possible, le caractère est rendu
**	 tel quel. (ex: '$')
*/

static unsigned char tabmajAZ[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177CUEAAAACEEEIIIAAE’‘OOOUUYOU\x9B\x9c\x9d\x9e\x9f" "AIOUNN";

inline unsigned char majAZ(unsigned char c)
{
  return (unsigned char)((c>='a' && c<=165)?(int)tabmajAZ[c-'a']:c);
} /* majAZ */


int stricmp(const unsigned char *s1, const unsigned char *s2)
{
  unsigned char c1, c2;

  while ((c1=(unsigned char)majAZ(*s1))==(c2=(unsigned char)majAZ(*s2)) && *s1)
  { s1++;
    s2++;
  }
  return c1-c2>0?1:(c1-c2<0?-1:0);
}

char *stristr(const char *szLigne, const char *szATrouver)
{
  int i;		// Indice courant dans la chaîne parcourue
  int x;		// Indice courant dans la chaîne à trouver
  int t;		// Indice de sauvegarde dans la chaîne à parcourir
  int iLLigne, iLATrouver;	// Longueur des chaînes

  // Garde-fou
  assert(szLigne!=NULL);
  assert(szATrouver!=NULL);

  iLLigne = strlen(szLigne);
  iLATrouver = strlen(szATrouver);

  for (i=0 ; i<=iLLigne-iLATrouver ; i++)
  {
	t = i;	// On mémorise la position courante

	x = 0;
	while(majAZ(szLigne[i])==majAZ(szATrouver[x]))
	{
	  i++;x++;
	  if (szATrouver[x]==0)	// Fin de szATrouver -> trouv‚!
		return (char *)szLigne+i-x;
	}
	// On sort de la boucle: on n'a pas trouve ici
	i = t;

	// On passe à la position suivante
  }

  // On n'a pas trouvé du tout
  return(NULL);
}


///////////////////////////////////////////////////////////////////////////
// Remplace toutes les occurrences de szCherche par szRemplace dans szSource.
// Ne tient pas compte d'une différence majuscules/minuscules

char *strsubst(char *szSource, size_t lSource, const char *szCherche, const char *szRemplace)
{
  char *p;
  assert(szSource!=NULL);
  assert(szCherche!=NULL);
  assert(szRemplace!=NULL);

  size_t lCherche = strlen(szCherche);
  size_t lRemplace = strlen(szRemplace);

  while (p=stristr(szSource, szCherche))
  {
	if (lCherche>lRemplace)
	  strdelnc(p, lCherche-lRemplace);
	else if (lCherche<lRemplace)
	{
	  if (strlen(szSource)+lRemplace-lCherche>=lSource)
		  return NULL;
	  strinsnc(p, lRemplace-lCherche);
	}

	strncpy(p, szRemplace, lRemplace);
  }
  return szSource;
}


///////////////////////////////////////////////////////////////////////////

void Identification()
{
  cout << "MAJSOFT 1.3.2\n"
       << "Mise … jour des programmes d'un micro\n\n";
}

inline void Usage()
{
  cout << "Usage: MAJSOFT [/?] [/t] [/v] [/m] [Fichier]\n"
	   << "Le fichier de configuration par d‚faut est " << szFichierIniDefaut << "\n"
	   << "Options: /t: Mode test, aucun fichier n'est copi‚\n"
	   << "         /v: Mode verbose, le d‚tail de l'analyse est affich‚\n"
	   << "         /m: Affiche la liste des macros et termine le programme\n";
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
       << "Date fichier:     " << __TIMESTAMP__ << '\n'
       << "Compilateur:      MSC " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1996-2000 P.VIOLENT";
}


// Version sophistiquée du perror compatible multithread, à base de GetLastError()
void AfficheErrSysteme()
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
  cout << ": Erreur " << iErr << ": " << OEM(lpMsgBuf) << endl;
  LocalFree( lpMsgBuf );

  if (iErr==112)  // Espace insuffisant sur disque: on s'arrête sur le message
    Pause();
}


void CopieFichier(const CString &sNomficSource, const CString &sNomficDest)
{
  cout << "copy " << Guillemets(OEM(sNomficSource)) << " " << Guillemets(OEM(sNomficDest)) << flush;

  if (!bTest)
  {
	if (!CopyFile(sNomficSource, sNomficDest, FALSE))
	{
	  AfficheErrSysteme();
	  iNbNoCopy++;
	}
	else
	  cout << endl;
  }
  else
	cout << endl;
  iNbCopy++;
}



void CreeDir(const CString &sNomdir)
{
  cout << "md " << Guillemets(OEM(sNomdir)) << flush;
  if (!bTest)
  {
    if (!CreateDirectory(sNomdir, NULL))
	  AfficheErrSysteme();
  }
  cout << endl;
}


int bOkDir(CString sDir)
{
  int iAttrib = GetFileAttributes(sDir);

  if (iAttrib<0)
	return FALSE;
  if (!(iAttrib&FILE_ATTRIBUTE_DIRECTORY))
	return FALSE;

  return TRUE;
}


__int64 size64(DWORD nFileSizeLow, DWORD nFileSizeHigh)
{
  return ((__int64)nFileSizeHigh)*0x100000000i64 +(__int64)nFileSizeLow;
}


__int64 cmpFileTime(FILETIME *pft1, FILETIME *pft2)
{
  return (__int64)pft2->dwHighDateTime*0x100000000i64+(__int64)pft2->dwLowDateTime-(((__int64)pft1->dwHighDateTime)*0x100000000i64+(__int64)(pft1->dwLowDateTime));
}


int iLitInfoFichier(CString sFichier, WIN32_FIND_DATA *pwfd)
{
  HANDLE  hFile;

  if ((hFile = FindFirstFile((const char *)sFichier, pwfd)) == INVALID_HANDLE_VALUE)
  {
	if (GetLastError()!=2)	// Fichier non trouvé, Ok pas de message
	{
	  cout << "AStruct: FindFirstFile " << Guillemets(OEM(sFichier));
	  AfficheErrSysteme();
	}
	return -1;
  }

  if (!FindClose((HANDLE)hFile))
  {
	cout << "AStruct: Echec au FindClose ";
	AfficheErrSysteme();
	return -1;
  }

  return 0;
}


void MajSoft(CString &sFichierIni)
{
  FILE	*f = fopen(sFichierIni, "r");
  BOOL	bSectionActive;
  char	*szSource, *szDest;
  char	szBuffer[400], szDestPath[256];
  char	*p;
  WIN32_FIND_DATA wfdSource, wfdDest;
  HKEY	hKey;
  long	lStatus;
  int	i;
  char  szCle[128], szValeur[128];
  DWORD dwLgCle, dwLgValeur, dwType;
  char	szWindowsDirectory[256];



  // On initialise les valeurs des répertoires-macros
  GetWindowsDirectory(szWindowsDirectory, sizeof(szWindowsDirectory));
  if (szWindowsDirectory[strlen(szWindowsDirectory)-1]=='\\')
	szWindowsDirectory[strlen(szWindowsDirectory)-1]=0;

  tMacros[0].sCle = "$WinDir";
  tMacros[0].sValeur = szWindowsDirectory;
  iNbMacros = 1;

  // On récupère Program Files
  lStatus = RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\\Microsoft\\Windows\\CurrentVersion", 0, KEY_QUERY_VALUE, &hKey);
  assert(lStatus==ERROR_SUCCESS);
  dwLgValeur = sizeof(szValeur);
  lStatus = RegQueryValueEx(hKey, "ProgramFilesDir", NULL, &dwType, (unsigned char *)szValeur, &dwLgValeur);
  assert(lStatus==ERROR_SUCCESS);
  tMacros[iNbMacros].sCle = "$ProgramFiles";
  tMacros[iNbMacros].sValeur = szValeur;
  iNbMacros++;

  // Et les dossiers spéciaux
  lStatus = RegOpenKeyEx(HKEY_CURRENT_USER, "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders", 0, KEY_ALL_ACCESS, &hKey);
  assert(lStatus==ERROR_SUCCESS);
  for (i=0 ; ; i++)
  {
	dwLgCle = sizeof(szCle);
	dwLgValeur = sizeof(szValeur);
	lStatus = RegEnumValue(hKey, i, szCle, &dwLgCle, NULL, NULL, (unsigned char *)szValeur, &dwLgValeur);
    if (lStatus!=ERROR_SUCCESS)
	  break;

	if (iNbMacros==NBMAXMACROS)
	{ cout << "MajSoft: Nb maximal de macros atteint\n";
	  break;
	}

	tMacros[iNbMacros].sCle = CString("$")+szCle;
	tMacros[iNbMacros].sValeur = szValeur;

	iNbMacros++;
  }
  RegCloseKey(hKey);

  if (bListeMacros)
  {
	for (i=0 ; i<iNbMacros ; i++)
	  cout << tMacros[i].sCle << " = " << OEM(tMacros[i].sValeur) << endl;
	exit(0);
  }


  // Analyse du fichier majsoft.ini
  while (fgets(szBuffer, sizeof(szBuffer), f)!=NULL)
  {
	assert(strlen(szBuffer)>=1);
	szBuffer[strlen(szBuffer)-1] = 0;

	if (szBuffer[0]==0 || szBuffer[0]==';')
	  continue;

	if (szBuffer[0]=='[')
	{
	  if (stricmp(szBuffer, "[Common]")==0)
		bSectionActive = TRUE;
	  else
	  {
		cout << "majsoft: Section " << szBuffer << " ignorée\n";
		bSectionActive = FALSE;
	  }
	  continue;
	}

	for (i=0 ; i<iNbMacros ; i++)
	  strsubst(szBuffer, sizeof(szBuffer), tMacros[i].sCle, tMacros[i].sValeur);

	p = strchr(szBuffer, '$');
	if (p!=NULL)
	{
	  cout << "majsoft: Variable inconnue dans la ligne '" << szBuffer << "' (caractère $)\n";
	  continue;
	}

	p = strchr(szBuffer, '=');
	if (p==NULL)
	{
	  cout << "majsoft: Ligne '" << szBuffer << "' incorrecte. (pas de =)\n";
	  continue;
	}

	if (bSectionActive)
	{
	  *p = 0;
	  szSource = p+1;
	  szDest = szBuffer;

	  strcpy(szDestPath, szDest);
	  p = strrchr(szDestPath, '\\');
	  if (p==NULL)
	  {
		cout << "majsoft: Impossible de déterminer le répertoire cible pour la ligne '" << szBuffer << "'\n";
		continue;
	  }
	  *p = 0;

	  if (!bOkDir(szDestPath))
		CreeDir(szDestPath);

	  BOOL bACopier;

	  if (iLitInfoFichier(szSource, &wfdSource)<0)
		continue; // La source doit exister, sinon erreur !

	  if (iLitInfoFichier(szDest, &wfdDest)<0)
	  {
		if (bVerbose)
		{ cout << "Source: " << wfdSource.ftLastWriteTime << "  " << OEM(szSource) << endl;
		  cout << "Dest:   " << "Inexistant           " << OEM(szDest) << endl;
		  cout << "-> A copier\n";
		}
		bACopier = TRUE;
	  }
	  else
	  {
		bACopier = cmpFileTime(&wfdSource.ftLastWriteTime, &wfdDest.ftLastWriteTime)<0;
		if (bVerbose)
		{ cout << "Source: " << wfdSource.ftLastWriteTime << "  " << OEM(szSource) <<  endl;
		  cout << "Dest:   " << wfdDest.ftLastWriteTime   << "  " << OEM(szDest) << endl;
		  cout << (bACopier ? "-> A copier\n" : "-> Ne rien faire\n");
		}
	  }

	  if (bACopier)
		CopieFichier(szSource, szDest);
	}

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
	if (stricmp(argv[i], "/t")==0 || stricmp(argv[i], "-t")==0)
	  bTest = TRUE;
	else if (stricmp(argv[i], "/v")==0 || stricmp(argv[i], "-v")==0)
	  bVerbose = TRUE;
	else if (stricmp(argv[i], "/m")==0 || stricmp(argv[i], "-m")==0)
	  bListeMacros = TRUE;
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
	  cerr << "majsoft: Option " << argv[i] << " inconnue\n";
	  bProbleme = TRUE;
	}
  }


  CString sFichierIni = szFichierIniDefaut;


  // Le reste des arguments est traité dans une deuxième passe
  int iRangArg = 0;
  for (i=1 ; i<argc ; i++)
  {
	if (argv[i][0]=='/' || argv[i][0]=='-')
	  /* Option déjà traitée */;
	else
	{
	  if (iRangArg==0)
		sFichierIni = argv[i];
	  else 
	  {
		cerr << "majsoft: Option " << argv[i] << " inconnue\n";
		bProbleme = TRUE;
	  }
	  iRangArg++;
	}
  }

  if (access(sFichierIni, 04)<0)
  {
	cerr << "majsoft: Echec lors de l'accŠs au fichier " << sFichierIni;
	AfficheErrSysteme();
	bProbleme = TRUE;
  }

  if (bProbleme)
	goto fin;

  cerr << "majsoft " << sFichierIni << endl;
  MajSoft(sFichierIni);

  cerr << iNbCopy << " fichier(s) copié(s)" << endl;
  if (iNbNoCopy)
    cerr << iNbNoCopy << " problŠme(s) lors de la copie" << endl;

fin:
  if (bVerbose)
	Pause();

  return 0;
}
