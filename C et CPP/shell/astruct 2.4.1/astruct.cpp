// astruct.cpp
// Aligne deux structures de dossiers sur disque
// Usage: astruct [options] source cible
// Options: /t: test, affiche les opérations mais ne fait rien
//          /v: verbose, affiche le détail de l'analyse
// 25/08/96 PV  1.0
//  6/09/96 PV	1.1 Optimisation avec la classe Dir; réduction importante du nombre d'appels à findxxx et stat
// 12/09/96 PV	    Option /v verbose
// 20/09/96 PV	1.2.0 Analyse des fichiers via win32 à cause du problème d'heude d'été de _findfirst
// 23/09/96 PV	1.3.0 Option /_: ne pas copier fichiers/dossiers commençant par _, pour FrontPage
//					  Option /l: copie les fichiers et crée les dossiers en minuscules
// 02/10/96 PV  1.3.1 Correction de problèmes d'accents et de retours à la ligne
//					  operator << sur __int64 correct
// 21/10/96 PV  1.4.0 Traitement complet des accents avec stricmp maison au lieu du stricmp standard
//					  Cas des volumes destination intégralement vides traité sans erreur
// 20/03/97 PV  1.4.1 Plus de test sur le retour de FindClose, parfois erreur sans raison...
//  5/01/98 PV  1.5.0 Arrondi du timestamp à 2 secondes pour les comparaisons, le filesystem FAT (et FAT32) ayant une résolution de 2 sec...
//  5/01/98 PV  1.5.1 Option /p de pause finale en cas d'erreurs; Test de d'offset de temps entre source et dest et option /t
//  6/01/98 PV  1.5.2 Méthode de test d'offset de temps en deux créations inapplicable...
//  9/04/98 PV  1.6.0 Option /. pour transformer les fichiers dont le nom commence par un . en _
// 24/04/98 PV	1.6.1 Option /d: ne pas copier les volumes DriveSpace
// 27/10/98 PV	1.6.2 Gestion des répertoires commençant par un .; plus d'option /.
// 28/10/98 PV	1.6.3 Option /_ remplacée par /%, ne copie pas les répertoires commençant par % (conflit avec /.)
// 30/10/98 PV	1.6.4 Gestion complète de la conversion . en _
//  2/11/98 PV	1.6.5 Retour de l'option /_ !!! (pour les arborescences FrontPage...)
// 24/08/99 PV	1.6.6 Pas de message en cas d'échec à la création du fichier $$--$$.. sur la source au test d'offset
//  7/04/00 PV	1.7.0 Compatibilité Win2000. L'arrondi à un timestamp pair est différent entre Unix et Win2000 !!!!
// 15/05/00 PV	1.7.1 FileCopy Windows 2000->Win 98, timestamp ..50s --> ..52s => tolérance de 2s aux tests d'égalité...
// 20/08/00 PV	1.7.2 Effacement d'un répertoire R/O impossible sous Windows 2000 ==> effacer l'attribut en cas d'échec de suppression
//  8/12/00 PV	1.7.3 Pb astruct de l'arborescence FTP du serveur avec des accents ANSI
// 24/12/01 PV	2.0.0 Version Unicode; Fin de l'option D
// 26/12/01 PV	2.0.1 Conversion correcte à partir des accents OEM dela ligne de commande; Option s (sécurité - ne pas écraser un fichier +récent)
// 26/12/01 PV	2.1.0 Fonctionnement mixte Unicode/ANSI selon le système, option /A pour forcer les appels système ANSI sur les systèmes gérant l'Unicode
// 31/12/01 PV	2.1.1 Option d'affichage ANSI au lieu de l'affichage OEM console standard (utile pour rediriger la sortie dans un fichier et l'afficher avec le bloc-notes). Attention, les paramètres restent en OEM (console ou .bat)
// 27/01/04 PV	2.2.0 Ignore le fichier $$--$$--.$-$ dans les copies/effacement
// 16/04/04 PV	2.3.0 Option /w: support des chemins de plus de 255 caractères en mode Unicode
// 28/04/04 PV	2.3.1 Traitement propre de WidePath
// 30/04/04 PV	2.4.0 Option /n: NoAction, Option affichage ANSI = /i
//  2/05/04 PV	2.4.1 Option /o: TraceObjects (traces internes)


#include <Windows.h>
#include <iostream.h>
#include <stdio.h>            // sprintf
#include <io.h>
#include <malloc.h>
#include <time.h>

#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>

#include "CString.h"
#include "UString.h"

char szVersion[] = "2.4.1";

bool bVerbose = false;		  // Option v
bool bNoPercent = false;	  // Option % (Ignore sur la source les fichiers commençant par %)
bool bNoUnderscore = false;	  // Option _ (Ignore sur la source les fichiers commençant par _)
bool bOptionL = false;		  // Option l (copie en minuscules)
bool bOptionS = false;		  // Option s (n'écrase pas un fichier plus récent)
bool bPauseFinale = false;	  // Option p
bool bAffichageANSI = false;  // Option i
bool bWidePath = false;		  // Option w (chemins de plus de 255 caractères)
bool bNoAction = false;		  // Option n (aucune action)
bool bTraceObjects = false;	  // Option o (traces internes sur les objets)


bool bModeW;				  // Détermine si on fait des appels système Unicode (xxxW)

int iNbDel = 0;               // Nb de fichiers effacés
int iNbCopy = 0;              // Nb de fichiers copiés
int iNbFicTotal = 0;          // Nb de fichiers comparés
int iNbDirTotal = 1;          // Nb de répertoires analysés, on part de 1 pour le répertoire principal
int iNbNoCopy = 0;		      // Nb de fichiers avec échec à la copie

UString usSource, usDest;     // Les deux paramètres du programme

UString usNomficTTO(L"$$--$$--.$-$");	// Test TimeOffset


///////////////////////////////////////////////////////////////////////////

// Mémorise un tableau dynamique de structures WIN32_FIND_DATAW
// void Ajoute(const WIN32_FIND_DATAW &rfd)		ajoute un élément à la collection
// int iCount()									retourne le nombre d'éléments
// WIN32_FIND_DATAW &operator[](int iRang)		retourne un élément par son indice (base 0)
// WIN32_FIND_DATAW *pdirFind(UString &usAChercher)	retourne un élément par son nom (recherche ignorant la casse)

class Dir
{
private:
  int iNbFD;
  WIN32_FIND_DATAW *tFD;

public:
  Dir() { iNbFD=0; tFD=NULL; m_nConstr++; }
  Dir(const Dir &d0) { assert(0); }
  ~Dir() { if (tFD) free(tFD); m_nDestr++; }

  void Ajoute(const WIN32_FIND_DATAW &rfd)
  {
	tFD = (WIN32_FIND_DATAW *)realloc(tFD, (iNbFD+1)*sizeof(WIN32_FIND_DATAW));
	tFD[iNbFD] = rfd;
	iNbFD++;
  }

  int iCount() { return iNbFD; }

  WIN32_FIND_DATAW &operator[](int iRang)
  {
	return tFD[iRang];
  }

  WIN32_FIND_DATAW *pdirFind(const UString &usAChercher)
  {
	for (int i=0 ; i<iNbFD ; i++)
	  if (wcsicmp(tFD[i].cFileName, usAChercher)==0)
	    return tFD+i;
	return NULL;
  }

  // Traces
protected:
	static int m_nConstr;		// Nb d'appels à un constructeur
	static int m_nDestr;		// Nb d'appels au destructeur
public:
	static int GetnConstr() { return m_nConstr; }
	static int GetnDestr() { return m_nDestr; }
};

int Dir::m_nConstr;
int Dir::m_nDestr;


///////////////////////////////////////////////////////////////////////////
// Support des paths supérieurs à 255 caractères
// Transforme la chaîne passée en référence selon ce qui suit:
// The Unicode versions of several functions permit paths that exceed the MAX_PATH length if the path has the "\\?\" prefix.
// The "\\?\" tells the function to turn off path parsing. However, each component in the path cannot be more than MAX_PATH
// characters long. Use the "\\?\" prefix with paths for local storage devices and the "\\?\UNC\" prefix with paths having 
// the Universal Naming Convention (UNC) format. The "\\?\" is ignored as part of the path. For example, "\\?\C:\myworld\private"
// is seen as "C:\myworld\private", and "\\?\UNC\bill_g_1\hotstuff\coolapps" is seen as "\\bill_g_1\hotstuff\coolapps". 
//
// Implémente les fonctions d'accès au filesystem xx_WWP (Wchar_t Wide Path)
// Selon l'option w, transforme le path ou non avec les conventions longues via WidePath0
// avant l'appel de la fonction windows xxW équivalente
// Comme ça la conversion et la logique du code d'analyse reste inchangée dans le reste du pgm

void WidePath0(UString &us)
{
  // Le traitement n'est pas actif si l'option /w n'est pas utilisée, par sécurité
  if (!bWidePath)
	return;

  if (us[1]==L':')
  {
	us.Insert(0, L"\\\\?\\");
  }
  else if (us[0]==L'\\' && us[1]==L'\\')
  {
    us.Insert(0,L"\\\\?\\UNC");
	us.Delete(7, 1);
  }
}

static HANDLE FindFirstFileW_WWP(const UString &usModele, LPWIN32_FIND_DATAW lpFindFileData)
{
  UString usM = usModele;
  WidePath0(usM);
  return FindFirstFileW((const wchar_t *)usM, lpFindFileData);
}

static BOOL CopyFileW_WWP(const UString &usSource, const UString &usDest, bool bFailIfExists)
{
  if (bNoAction) return TRUE;

  UString usS = usSource;
  UString usD = usDest;
  WidePath0(usS);
  WidePath0(usD);
  return CopyFileW((const wchar_t *)usS, (const wchar_t *)usD, bFailIfExists);
}

static DWORD GetFileAttributesW_WWP(const UString &usNomfic)
{
  UString usF = usNomfic;
  WidePath0(usF);
  return GetFileAttributesW((const wchar_t *)usF);
}

static BOOL SetFileAttributesW_WWP(const UString &usNomfic, DWORD dwAttributes)
{
  if (bNoAction) return TRUE;

  UString usF = usNomfic;
  WidePath0(usF);
  return SetFileAttributesW((const wchar_t *)usF, dwAttributes);
}

static BOOL DeleteFileW_WWP(const UString &usNomfic)
{
  if (bNoAction) return TRUE;

  UString usF = usNomfic;
  WidePath0(usF);
  return DeleteFileW((const wchar_t *)usF);
}

static BOOL RemoveDirectoryW_WWP(const UString &usNomdir)
{
  if (bNoAction) return TRUE;

  UString usD = usNomdir;
  WidePath0(usD);
  return RemoveDirectoryW((const wchar_t *)usD);
}

static BOOL CreateDirectoryW_WWP(const UString &usNomdir, LPSECURITY_ATTRIBUTES lpSecurityAttributes)
{
  if (bNoAction) return TRUE;

  UString usD = usNomdir;
  WidePath0(usD);
  return CreateDirectoryW((const wchar_t *)usD, lpSecurityAttributes);
}


///////////////////////////////////////////////////////////////////////////
// Conversions OEM <--> ANSI pratiques

CString OEM(const CString &sANSI)
{
  char *ps = (char *)alloca(sANSI.GetLength()+1);
  CharToOemBuff(sANSI, ps, sANSI.GetLength()+1);
  return CString(ps);
}

/*
CString ANSI(const CString &sOEM)
{
  char *ps = (char *)alloca(sOEM.GetLength()+1);
  OemToCharBuff(sOEM, ps, sOEM.GetLength()+1);
  return CString(ps);
}
*/

// Conversions Unicode <--> ANSI/OEM

CString ANSI(const UString &usUnicode)
{
  int l = usUnicode.GetLength()+1;
  char *ps = (char *)alloca(l);
  WideCharToMultiByte(CP_ACP, 0, (const wchar_t *)usUnicode, l, ps, l, NULL, NULL);
  return CString(ps);
}

CString OEM(const UString &usUnicode)
{
  int l = usUnicode.GetLength()+1;
  char *ps = (char *)alloca(l);
  WideCharToMultiByte(CP_OEMCP, 0, (const wchar_t *)usUnicode, l, ps, l, NULL, NULL);
  return CString(ps);
}

/*
UString UnicodeFromOEM(const char *szOEM)
{
  int l = strlen(szOEM)+1;
  wchar_t *ps = (wchar_t *)alloca(2*l);
  MultiByteToWideChar(CP_OEMCP, 0, szOEM, l, ps, l);
  return UString(ps);
}
*/

UString UnicodeFromANSI(const char *szANSI)
{
  int l = strlen(szANSI)+1;
  wchar_t *ps = (wchar_t *)alloca(2*l);
  MultiByteToWideChar(CP_ACP, 0, szANSI, l, ps, l);
  return UString(ps);
}

///////////////////////////////////////////////////////////////////////////
// Routine d'affichage centralisée, reçoit des chaines 8 bits ANSI en paramètre,
// ou 16 bits unicode et produit en sortie une CString 8 bits ANSI ou Unicode
// selon bAffichageANSI

CString Aff(const char *s)
{
  if (bAffichageANSI)
	return CString(s);
  else
	return OEM(s);
}

CString Aff(const UString &us)
{
  if (bAffichageANSI)
	return ANSI(us);
  else
	return OEM(us);
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
  FILETIME ftLocal;
  SYSTEMTIME stLocal;

  if (FileTimeToLocalFileTime(&ft, &ftLocal))
	if (FileTimeToSystemTime(&ftLocal, &stLocal))
	  o << stLocal.wDay << "/" << stLocal.wMonth << "/" << stLocal.wYear << " " 
        << stLocal.wHour << ":" << stLocal.wMinute << ":" << stLocal.wSecond;
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
// Message de pause final et liste des problèmes rencontrés

struct Probleme
{
  CString sMsg;
  Probleme *pSuiv;
} *p0;

void AjouteProbleme(CString sMsg)
{
  Probleme *p;

  p = new Probleme;
  p->sMsg = sMsg;
  p->pSuiv = p0;
  p0 = p;
}

void Pause(bool bFinal)
{
  char c[10];

  cerr << Aff("Entrée pour continuer");
  if (bFinal && iNbNoCopy) cerr << Aff(", ?+Entrée pour revoir les problèmes");
  cerr << "...";
  cin.getline(c, sizeof(c));

  if (bFinal && c[0]=='?')
  {
    cerr << Aff("\nProblèmes rencontrés lors de l'exécution :\n");
	Probleme *p;
	for (p=p0 ; p!=NULL ; p=p->pSuiv)
	  cerr << p->sMsg << endl;
  }
}

///////////////////////////////////////////////////////////////////////////
// Traitement des accents

/* majAZ Convertit un caractère en majuscule (si c'est possible) entre
**	 A et Z, c'est à dire non accentuée.  Ainsi, toutes les lettres
**	 suivantes sont converties en 'E':  e é è ê ë É E
**	 Si la conversion n'est pas possible, le caractère est rendu
**	 tel quel. (ex: '$')
*/

/*
static unsigned char tabmajAZ[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177CUEAAAACEEEIIIAAE’‘OOOUUYOU\x9B\x9c\x9d\x9e\x9f" "AIOUNN";

inline unsigned char majAZ(unsigned char c)
{
  return (unsigned char)((c>='a' && c<=165)?(int)tabmajAZ[c-'a']:c);
} 

/*
int stricmp(const unsigned char *s1, const unsigned char *s2)
{
  unsigned char c1, c2;

  while ((c1=(unsigned char)majAZ(*s1))==(c2=(unsigned char)majAZ(*s2)) && *s1)
  { s1++;
    s2++;
  }
  return c1-c2>0?1:(c1-c2<0?-1:0);
}
*/

///////////////////////////////////////////////////////////////////////////

void Identification()
{
  cout << "ASTRUCT " << szVersion << (bModeW ? (bWidePath ?" (unicode long)":" (unicode)") : " (ansi)") << endl
       << "Alignement d'une structure de dossiers sur disque\n\n";
}

inline void Usage()
{
  cout << "Usage: astruct [/?] [/option ...] source destination\n"
       << Aff("Source et destination sont deux dossiers existants\n"
              "Options: /t Désactive le contrôle de différence de temps\n"
              "         /v Mode verbose, le détail de l'analyse est affiché\n"
              "         /% Ne copie pas fichiers et dossiers commençant par %\n"
              "         /_ Ne copie pas fichiers et dossiers commençant par _\n"
              "         /l Crée des dossiers et des fichiers avec un nom en minuscules\n"
              "         /p Pause finale en cas de problème pour revoir les erreurs\n"
              "         /a Appels système forcés en mode ANSI sous Windows NT/2K/XP\n"
			  "         /i Affichages en mode ANSI (mode OEM par défaut)\n"
              "         /w WidePath, chemins de plus de 255 caractères en mode Unicode\n"
			  "         /n NoAction, affiche les commandes mais n'exécute aucune action\n"
              "         /s Sécurité, n'écrase pas un fichier plus récent sur la destination\n");
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
       << "Date fichier:     " << __TIMESTAMP__ << '\n'
       << "Compilateur:      MSC " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1996-2004 P.VIOLENT";
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
  cout << ": Erreur " << szErr << ": " << Aff(lpMsgBuf) << endl;
  if (!sMessage.IsEmpty())
    AjouteProbleme(sMessage+": Erreur "+szErr+": "+Aff(lpMsgBuf));

  LocalFree(lpMsgBuf);

  if (iErr==112)  // Espace insuffisant sur disque: on s'arrête sur le message
    Pause(0);
}


void CopieFichier(const UString &usNomficSource, const UString &usNomficDest)
{
  UString usNomficDestLower = usNomficDest;

  if (bOptionL)
	usNomficDestLower.MakeLower();

  cout << "copy " << Guillemets(Aff(usNomficSource)) << " " << Guillemets(Aff(usNomficDestLower));
  cout.flush();		// La copie peut être longue, au travers de Numéris...

  BOOL bRes;
  if (bModeW)
	bRes = CopyFileW_WWP(usNomficSource, usNomficDestLower, false);
  else
	if (bNoAction)
	  bRes = true;
	else
	  bRes = CopyFile(ANSI(usNomficSource), ANSI(usNomficDestLower), false);
  if (!bRes)
  {
    AfficheErrSysteme("copy "+Guillemets(Aff(usNomficSource))+" "+Guillemets(Aff(usNomficDestLower)));
    iNbNoCopy++;
  }
  else
    cout << endl;
  iNbCopy++;
}


void EffaceFichier(const UString &usNomfic)
{
  cout << "del " << Guillemets(Aff(usNomfic));

  // On supprime les attributs qui empêchent l'effacement
  int iAttrib;
  BOOL bRes;

  if (bNoAction)
	bRes = TRUE;
  else
  {
	if (bModeW)
	  iAttrib = GetFileAttributesW_WWP(usNomfic);
	else
	  iAttrib = GetFileAttributes(ANSI(usNomfic));
	if ((iAttrib&FILE_ATTRIBUTE_HIDDEN) || (iAttrib&FILE_ATTRIBUTE_SYSTEM) || (iAttrib&FILE_ATTRIBUTE_READONLY))
	{
	  if (bModeW)
		SetFileAttributesW_WWP(usNomfic, FILE_ATTRIBUTE_NORMAL);
	  else
		SetFileAttributes(ANSI(usNomfic), FILE_ATTRIBUTE_NORMAL);
	}

	if (bModeW)
	  bRes = DeleteFileW_WWP(usNomfic);
	else
	  bRes = DeleteFile(ANSI(usNomfic));
  }

  if (!bRes)
    AfficheErrSysteme("del "+Guillemets(Aff(usNomfic)));

  cout << endl;
  iNbDel++;
}


// Conversion WIN32_FIND_DATAW --> WIN32_FIND_DATA
// pour les champs utilisés par ce programme
void RecopieWFD(WIN32_FIND_DATAW *wfdw, const WIN32_FIND_DATA *wfd)
{
  memcpy(wfdw, wfd, (char *)&(wfd->cFileName)-(char *)wfd);
  MultiByteToWideChar(CP_ACP, 0, wfd->cFileName, 1+strlen(wfd->cFileName), wfdw->cFileName,  MAX_PATH);

  /* WIN32_FIND_DATAW
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    DWORD dwReserved0;
    DWORD dwReserved1;
    WCHAR  cFileName[ MAX_PATH ];
    WCHAR  cAlternateFileName[ 14 ];
  */
}



// Efface récursivement un répertoire, même non vide
void EffaceDir(const UString &usNomdir)
{
  WIN32_FIND_DATAW wfdw;
  WIN32_FIND_DATA wfd;
  HANDLE          hFile;
  DWORD           err;
  UString usModele, usAEffacer;

  // On efface tout ce qui traîne dans le répertoire
  usModele = usNomdir + L"\\*";
  if (bModeW)
  {
	hFile = FindFirstFileW_WWP((const wchar_t *)usModele, &wfdw);
  }
  else
  {
	hFile = FindFirstFile(ANSI(usModele), &wfd);
	RecopieWFD(&wfdw, &wfd);
  }
  if (hFile == INVALID_HANDLE_VALUE)
  {
	// Pas de fichier dans le répertoire: pas de problème !
	if (GetLastError()==2) goto suiteEffaceDir;

	cout << "EffaceDir: FindFirstFile " << Guillemets(Aff(usModele));
	AfficheErrSysteme("EffaceDir: FindFirstFile "+Guillemets(Aff(usModele)));
	return;
  }
  for(;;)
  {
	if (wcscmp(wfdw.cFileName, L".") && wcscmp(wfdw.cFileName, L".."))
	{
	  usAEffacer = usNomdir + L"\\" + wfdw.cFileName;
	  int iAttrib;
	  if (bModeW)
		iAttrib = GetFileAttributesW_WWP(usAEffacer);
	  else
		iAttrib = GetFileAttributes(ANSI(usAEffacer));
	  if (iAttrib>=0)
		if (iAttrib&FILE_ATTRIBUTE_DIRECTORY)
		  EffaceDir(usAEffacer);
		else
		  EffaceFichier(usAEffacer);
	}

	BOOL bRes;
	if (bModeW)
	  bRes = FindNextFileW((HANDLE)hFile, &wfdw);
	else
	{
	  bRes = FindNextFile((HANDLE)hFile, &wfd);
	  RecopieWFD(&wfdw, &wfd);
	}
	if (!bRes)
	{
      err = GetLastError();
      if (err==ERROR_NO_MORE_FILES)
	    break;
	  cout << "EffaceDir: FindNextFile " << Guillemets(Aff(usModele));
	  AfficheErrSysteme("EffaceDir: FindNextFile "+Guillemets(Aff(usModele)));
	  break;
	}

  }
  if (!FindClose((HANDLE)hFile))
  {
	cout << "EffaceDir: FindClose ";
	AfficheErrSysteme("");
	return;
  }

suiteEffaceDir:
  cout << "rd " << Guillemets(Aff(usNomdir));
  cout.flush();
  
  int bResult;
  if (bNoAction)
	bResult = true;
  else if (bModeW)
	bResult = RemoveDirectoryW_WWP(usNomdir);
  else
    bResult = RemoveDirectory(ANSI(usNomdir));
  if (!bResult)
  {	
	// Sous 2000, un répertoire avec l'attribut lecture seule ne peut pas être effacé...
	int iAttrib;
	if (bModeW)
	  iAttrib = GetFileAttributesW_WWP(usNomdir);
	else
	  iAttrib = GetFileAttributes(ANSI(usNomdir));
	if (iAttrib&FILE_ATTRIBUTE_READONLY)
	{ 
	  if (bModeW)
	  {
		SetFileAttributesW_WWP(usNomdir, FILE_ATTRIBUTE_NORMAL);
		bResult = RemoveDirectoryW_WWP(usNomdir);
	  }
	  else
	  {
		SetFileAttributes(ANSI(usNomdir), FILE_ATTRIBUTE_NORMAL);
		bResult = RemoveDirectory(ANSI(usNomdir));
	  }
	}
	if (!bResult)
      AfficheErrSysteme("rd "+Guillemets(Aff(usNomdir)));
  }
  cout << endl;
}


void CreeDir(const UString &usNomdir)
{
  UString usNomdirLower = usNomdir;

  if (bOptionL)
	usNomdirLower.MakeLower();

  if (usNomdirLower[0]==L'.')
	usNomdirLower.SetAt(0, L'_');

  cout << "md " << Guillemets(Aff(usNomdirLower));
  cout.flush();
  BOOL bRes;
  if (bNoAction)
	bRes = TRUE;
  else if (bModeW)
	bRes = CreateDirectoryW_WWP(usNomdirLower, NULL);
  else
	bRes = CreateDirectory(ANSI(usNomdirLower), NULL);
  if (!bRes)
    AfficheErrSysteme("md "+Guillemets(Aff(usNomdirLower)));
  cout << endl;
}


// Détermine si le système supporte les appels Unicode
// On suppose que GetFileAttributesW(L"C:\\"); doit toujours réussir sur un système
// ayant le support Unicode
// Attention: à tester sur un serveur Citrix où C: à été remappé en M:
void DetermineModeW()
{
  int iAttrib = GetFileAttributesW(L"C:\\");
  if (iAttrib>=0)
	bModeW = true;
  else
  {
	DWORD iErr = GetLastError();
	if (iErr==120)	  // Fonction non supportée par le système
	  bModeW = false;
	else
	{
	  cerr << Aff("Échec au DetermineModeW: ");
	  AfficheErrSysteme("");
	  Pause(0);
	  exit(0);
	}
  }
}


int bOkDir(UString usDir)
{
  int iAttrib;
  
  
  if (bModeW)
	iAttrib = GetFileAttributesW_WWP(usDir);
  else
	iAttrib = GetFileAttributes(ANSI(usDir));

  if (iAttrib<0)
	return false;
  if (!(iAttrib&FILE_ATTRIBUTE_DIRECTORY))
	return false;

  return true;
}


__int64 size64(DWORD nFileSizeLow, DWORD nFileSizeHigh)
{
  return ((__int64)nFileSizeHigh)*0x100000000i64 +(__int64)nFileSizeLow;
}


// Compare deux champs de type FILETIME
// La comparaison est arrondie à deux secondes, puisque le filesystem FAT
// ne dispose que de cette résolution (alors qu'un fichier en réseau sur un FS Unix
// a une date de modif à la seconde près)
// La résolution d'un FILETIME est de 100ns
// retourne le signe de t2-t1
int cmpFileTime(FILETIME *pft1, FILETIME *pft2)
{
  __int64 t1 = (((__int64)pft1->dwHighDateTime)*0x100000000i64+(__int64)(pft1->dwLowDateTime))/10000000;
  __int64 t2 = (((__int64)pft2->dwHighDateTime)*0x100000000i64+(__int64)(pft2->dwLowDateTime))/10000000;

  if (t2-t1<-2) return -1;
  if (t2-t1>2) return 1;
  return 0;
}


// Réalise l'alignement récursif du répertoire usPathS/usPathD relatif à
// sSource et sDest. usPathD est identique à usPathS mais ajusté en fonction
// des caractéristiques de la cible (ex: . en tête remplacé par un _)
void AStruct(UString usPathS, UString usPathD)
{
  WIN32_FIND_DATAW wfdw;
  WIN32_FIND_DATA wfd;
  HANDLE          hFile;
  DWORD           err;
  UString		  usModele;
  int			  i;
  Dir			  dirSource, dirDest;
  int			  iNbSource=0, iNbDest=0;

  // 0. On énumère les fichiers de la source et de la destination
  // Cette opération n'a lieu qu'une seule fois, pour minimiser le nombre
  // d'appels systeme

  // D'abord le répertoire source
  usModele = usSource + usPathS + L"*";
  if (bModeW)
  { 
	hFile = FindFirstFileW_WWP((const wchar_t *)usModele, &wfdw);
  }
  else
  {
	hFile = FindFirstFile(ANSI(usModele), &wfd);
	RecopieWFD(&wfdw, &wfd);
  }
  if (hFile == INVALID_HANDLE_VALUE)
  {
	cout << "AStruct: FindFirstFile " << Guillemets(Aff(usModele));
	AfficheErrSysteme("AStruct: FindFirstFile "+Guillemets(Aff(usModele)));
	return;
  }
  for(;;)
  {
	if (wcscmp(wfdw.cFileName, L".") && wcscmp(wfdw.cFileName, L"..") && wcscmp(wfdw.cFileName, usNomficTTO) &&
	    (!bNoPercent || wfdw.cFileName[0]!='%') &&
	    (!bNoUnderscore || wfdw.cFileName[0]!='_')
	   )
	{
	  dirSource.Ajoute(wfdw);
	  iNbSource++;
	}
	BOOL bRes;
	if (bModeW)
	  bRes = FindNextFileW((HANDLE)hFile, &wfdw);
	else
	{
	  bRes = FindNextFile((HANDLE)hFile, &wfd);
	  RecopieWFD(&wfdw, &wfd);
	}
	if (!bRes)
	{
      err = GetLastError();
      if (err==ERROR_NO_MORE_FILES)
	    break;
	  cout << "AStruct: FindNextFile " << Guillemets(Aff(usModele));
	  AfficheErrSysteme("AStruct: FindNextFile "+Guillemets(Aff(usModele)));
	  break;
	}
  }
  FindClose((HANDLE)hFile);
  // Pas de test sur le résultat, plante de façon erratique


  // Puis le répertoire destination
  usModele = usDest + usPathD + L"*";
  if (bModeW)
	hFile = FindFirstFileW_WWP((const wchar_t *)usModele, &wfdw);
  else
  {
	hFile = FindFirstFile(ANSI(usModele), &wfd);
	RecopieWFD(&wfdw, &wfd);
  }
  if (hFile == INVALID_HANDLE_VALUE)
  {
	if (!( (GetLastError()==3 && bNoAction) ||	// err 3, chemin introuvable Ok en mode NoAction
	        GetLastError()!=2) )				// File not found est Ok dans tous les cas !
	{
	  cout << "AStruct: FindFirstFile(dest) " << Guillemets(Aff(usModele));
	  AfficheErrSysteme("AStruct: FindFirstFile(dest) "+Guillemets(Aff(usModele)));
	  return;
	}
  }
  if (hFile!=INVALID_HANDLE_VALUE)
  {
	for(;;)
	{
	  if (wcscmp(wfdw.cFileName, L".") && wcscmp(wfdw.cFileName, L"..") && wcscmp(wfdw.cFileName, usNomficTTO))
	  {
		dirDest.Ajoute(wfdw);
		iNbDest++;
	  }
	  BOOL bRes;
	  if (bModeW)
		bRes = FindNextFileW((HANDLE)hFile, &wfdw);
	  else
	  {
		bRes = FindNextFile((HANDLE)hFile, &wfd);
		RecopieWFD(&wfdw, &wfd);
	  }
	  if (!bRes)
	  {
		err = GetLastError();
		if (err==ERROR_NO_MORE_FILES)
		  break;
		cout << "AStruct: FindNextFile(dest) " << Guillemets(Aff(usModele));
		AfficheErrSysteme("AStruct: FindNextFile(dest) "+Guillemets(Aff(usModele)));
		break;
	  }

	}
	FindClose((HANDLE)hFile);
  }

  // 1. On copie les fichiers source qui n'existent pas sur la destination,
  // ou qui sont à une date différente sur la source.
  // On crée les dossiers nécessaires sur la destination.
  for (i=0 ; i<iNbSource ; i++)
  {
	WIN32_FIND_DATAW *pSource = &dirSource[i];

	// Conversion systématique du . initial de la source en _ sur la destination
	UString usSourceTrans;
	if (pSource->cFileName[0]==L'.')
	  usSourceTrans = L"_" + UString(pSource->cFileName+1);
	else
	  usSourceTrans = pSource->cFileName;

    WIN32_FIND_DATAW *pDest = dirDest.pdirFind(usSourceTrans);
	UString usFullSource = usSource + usPathS + pSource->cFileName;
	UString usFullDest = usDest + usPathD + usSourceTrans;

	if (pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)
	{
	  iNbDirTotal++;

	  // Les dossiers HIDDEM+SYSTEM tels que \RECYCLED ne sont pas créés ni copiés
	  if ((pSource->dwFileAttributes&FILE_ATTRIBUTE_HIDDEN)==0 || (pSource->dwFileAttributes&FILE_ATTRIBUTE_SYSTEM)==0)
	  {
		if (pDest==NULL)
		  CreeDir(usFullDest);
	  }
	}
	else	// fichier
	{
	  bool bACopier = false;

	  iNbFicTotal++;

	  if (pDest==NULL)
	  {
		if (bVerbose)
		  cout << Guillemets(Aff(usFullSource)) << ": " << Aff(usSourceTrans) << ": inexistant sur la destination\n";
		bACopier = true;
	  }
	  else
	  {
		int iCmp;

		if ((iCmp=cmpFileTime(&pSource->ftLastWriteTime, &pDest->ftLastWriteTime)) ||
		    size64(pSource->nFileSizeLow,pSource->nFileSizeHigh) != size64(pDest->nFileSizeLow,pDest->nFileSizeHigh))
		{
		  if (bOptionS && iCmp>0)
		  {
			cout << Guillemets(Aff(usFullDest)) << Aff(" est plus récent que ") << Guillemets(Aff(usFullSource)) << ", pas de copie.\n";
			if (bVerbose)
			{
              cout << Guillemets(Aff(usFullSource)) << Aff(": plus récent sur la destination\n");
			  cout << "source:      " << pSource->ftLastWriteTime << endl; // << " " << ctime(&ts) << endl;
			  cout << "destination: " << pDest->ftLastWriteTime << endl; // << " " << ctime(&td) << endl;
			}
		  }
		  else
		  {
			bACopier = true;

			if (bVerbose)
			{
			  if (cmpFileTime(&pSource->ftLastWriteTime, &pDest->ftLastWriteTime))
			  {
				cout << Guillemets(Aff(usFullSource)) << Aff(": dates différentes\n");
				cout << "source:      " << pSource->ftLastWriteTime << endl; // << " " << ctime(&ts) << endl;
				cout << "destination: " << pDest->ftLastWriteTime << endl; // << " " << ctime(&td) << endl;
			  }

			  if (size64(pSource->nFileSizeLow,pSource->nFileSizeHigh) != size64(pDest->nFileSizeLow,pDest->nFileSizeHigh))
			  {
				cout << Guillemets(Aff(usFullSource)) << Aff(": tailles différentes\n");
				cout << "source:      " << size64(pSource->nFileSizeLow, pSource->nFileSizeHigh) << endl;
				cout << "destination: " << size64(pDest->nFileSizeLow, pDest->nFileSizeHigh) << endl;
			  }
			}
			// Si le fichier cible qui n'est pas à jour a des attributs bizzares,
			// on les efface, pour éviter un échec de la copie
			if ((pDest->dwFileAttributes&FILE_ATTRIBUTE_HIDDEN) || 
				(pDest->dwFileAttributes&FILE_ATTRIBUTE_SYSTEM) || 
				(pDest->dwFileAttributes&FILE_ATTRIBUTE_READONLY))
			  if (bModeW)
				SetFileAttributesW_WWP(usFullDest, FILE_ATTRIBUTE_NORMAL);
			  else
				SetFileAttributes(ANSI(usFullDest), FILE_ATTRIBUTE_NORMAL);
		  }
		}
	  }

	  if (bACopier)
		CopieFichier(usFullSource, usFullDest);
	}
  }


  // 2. On élimine les fichiers et les dossiers en trop sur la destination
  for (i=0 ; i<iNbDest ; i++)
  {
    WIN32_FIND_DATAW *pSource = dirSource.pdirFind(dirDest[i].cFileName);
	WIN32_FIND_DATAW *pDest = &dirDest[i];

	// Conversion du _ initial de la destination en . sur la source
	if (pSource==NULL && dirDest[i].cFileName[0]=='_')
	{
	  UString usSourceTrans;
	  usSourceTrans = L"." + UString(&dirDest[i].cFileName[1]);
	  pSource = dirSource.pdirFind(usSourceTrans);
	}

	if (pSource==NULL ||	// N'existe plus sur la source
		((pDest->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY) && (pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)==0) ||  // Dossier sur la cible mais fichier sur la source
		((pDest->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)==0 && (pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY))	  // Fichier sur la cible mais dossier sur la source
	   )
	{
	  UString usAEffacer = usDest + usPathD + pDest->cFileName;
	  if (pDest->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)	// Dossier sur la cible
		EffaceDir(usAEffacer);
	  else							// Fichier
		EffaceFichier(usAEffacer);
	}
  }



  // 3. On aligne récursivement les sous-répertoires de la source
  for (i=0 ; i<iNbSource ; i++)
  {
	WIN32_FIND_DATAW *pSource = &dirSource[i];
	// On ignore les répertoires qui ont à la fois les attributs HIDDEN et SYSTEM,
	// ce qui est en particulier le cas de la corbeille (répertoire \RECYCLED)
	if ((pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY) && ((pSource->dwFileAttributes&FILE_ATTRIBUTE_HIDDEN)==0 || (pSource->dwFileAttributes&FILE_ATTRIBUTE_SYSTEM)==0))
	{
	  UString usDirTrans;

	  usDirTrans = pSource->cFileName;
	  if (usDirTrans[0]=='.')
		usDirTrans = L"_" + UString(1+(const wchar_t *)usDirTrans);
	  AStruct(usPathS + pSource->cFileName + L"\\", usPathD + usDirTrans + L"\\");
	}
  }
}



// Fonction empirique pour déterminer s'il existe une différence d'heure entre la source et la destination
// Nécessite que le répertoire source soit accessible en écriture...
// On évacue les différences de précision par un arrondi à un temps multiple de 2 secondes
void DetermineTimeOffset()
{
  UString      usPathSource, usPathDest;
  time_t       tSource, tDest;
  int		   h;
  struct _stat buf;

  usPathSource = usSource+usNomficTTO;
  usPathDest = usDest+usNomficTTO;
  if (bModeW)
	h = _wopen(usPathSource, O_WRONLY|O_CREAT, 0777);
  else
	h = _open(ANSI(usPathSource), O_WRONLY|O_CREAT, 0777);

  // Si la source n'est pas accessible en écriture, on dégage silencieusement
  if (h<0) return;

  if (h<0)
  { cerr << Aff("astruct (tGetTime): Échec à la création de ") << Guillemets(Aff(usPathSource)) << ": Erreur " << errno << ": " << sys_errlist[errno] << endl;
    Pause(0);
    exit(0);
  }
  close(h);
  if (bModeW)
	h = _wstat(usPathSource, &buf);
  else
	h = _stat(ANSI(usPathSource), &buf);
  if (h<0)
  { cerr << Aff("astruct (tGetTime): Échec au stat ") << Guillemets(Aff(usPathSource)) << ": Erreur " << errno << ": " << sys_errlist[errno] << endl;
    if (bModeW)
	  _wunlink(usPathSource);
	else
	  _unlink(ANSI(usPathSource));
    Pause(0);
    exit(0);
  }
  tSource = buf.st_mtime; 		

  if (bModeW)
	CopyFileW(usPathSource, usPathDest, FALSE);
  else
	CopyFile(ANSI(usPathSource), ANSI(usPathDest), FALSE);
  if (bModeW)
	h = _wstat(usPathDest, &buf);
  else
	h = _stat(ANSI(usPathDest), &buf);
  if (h<0)
  { cerr << Aff("astruct (tGetTime): Échec au stat ") << Guillemets(Aff(usPathDest)) << ": Erreur " << errno << ": " << sys_errlist[errno] << endl;
	bModeW ? _wunlink(usPathSource) : _unlink(ANSI(usPathSource));
    bModeW ? _wunlink(usPathDest)   : _unlink(ANSI(usPathDest));
	Pause(0);
	exit(0);
  }
  tDest = buf.st_mtime;

  bModeW ? _wunlink(usSource+usNomficTTO) : _unlink(ANSI(usSource+usNomficTTO));
  bModeW ? _wunlink(usDest+usNomficTTO)   : _unlink(ANSI(usDest+usNomficTTO));

  if (abs(tDest-tSource)>2)
  {
    cout << Aff("Attention, différence de temps entre source et destination après copie\n")
         << Aff("astruct ne gère pas cette situation.\n")
         << Aff("L'option -t désactive ce test.\n");
	cout << "tSource: " << tSource << " " << ctime(&tSource);
	cout << "tDest:   " << tDest   << " " << ctime(&tDest);
	Pause(0);
	exit(0);
  }
}


static inline char *s(int iVar)
{
  return (iVar>1) ? "s" : "";
}

/*
static void TWP(wchar_t* wsPath)
{
  UString *us = new UString(wsPath);
  printf("%S --> ", us->GetBuffer(0));
  WidePath0(*us);
  printf("%S\n", us->GetBuffer(0));
}

static void TestWidePath()
{
  bWidePath = true;
  //TWP(L"fichier.ext");
  TWP(L"C:\\dic\\fic.path");
  TWP(L"\\\\serv\\ress\\path\\fic.ext");
  exit(0);
}
*/

void TraceObjectsOutput()
{
  cerr << endl;
  cerr << "CString: constr: " << CString::GetnConstr() << "  destr: " << CString::GetnDestr() << endl;
  cerr << "UString: constr: " << UString::GetnConstr() << "  destr: " << UString::GetnDestr() << endl;
  cerr << "Dir: constr: " << Dir::GetnConstr() << "  destr: " << Dir::GetnDestr() << endl;
}


int main(int argc, char **argv)
{
  int i;

  bool bProbleme = false;
  bool bOptionT = false;

  // On regarde si le système supporte les appels Unicode
  DetermineModeW();

  // Tests de WidePath
  //TestWidePath();

  // On traite les options lors d'une première passe
  // de façon à ne pas rendre l'ordre des options significatif
  for (i=1 ; i<argc ; i++)
  {
    if (stricmp(argv[i], "/v")==0 || stricmp(argv[i], "-v")==0)
	  bVerbose = true;
	else if (stricmp(argv[i], "/t")==0 || stricmp(argv[i], "-t")==0)
	  bOptionT = true;
	else if (stricmp(argv[i], "/p")==0 || stricmp(argv[i], "-p")==0)
	  bPauseFinale = true;
	else if (strcmp(argv[i], "/%")==0 || strcmp(argv[i], "-%")==0)
	  bNoPercent = true;
	else if (strcmp(argv[i], "/_")==0 || strcmp(argv[i], "-_")==0)
	  bNoUnderscore = true;
	else if (stricmp(argv[i], "/l")==0 || stricmp(argv[i], "-l")==0)
	  bOptionL = true;
	else if (stricmp(argv[i], "/s")==0 || stricmp(argv[i], "-s")==0)
	  bOptionS = true;
	else if (stricmp(argv[i], "/a")==0 || stricmp(argv[i], "-a")==0)
	  bModeW = false;
	else if (stricmp(argv[i], "/i")==0 || stricmp(argv[i], "-i")==0)
	  bAffichageANSI = true;
	else if (stricmp(argv[i], "/n")==0 || stricmp(argv[i], "-n")==0)
	  bNoAction = true;
	else if (stricmp(argv[i], "/w")==0 || stricmp(argv[i], "-w")==0)
	  bWidePath = true;
	else if (stricmp(argv[i], "/o")==0 || stricmp(argv[i], "-o")==0)
	  bTraceObjects = true;
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
	  cerr << "astruct: Option " << argv[i] << " inconnue\n";
	  bProbleme = true;
	}
  }


  // Le reste des arguments est traité dans une deuxième passe
  int iRangArg = 0;
  for (i=1 ; i<argc ; i++)
  {
	if (argv[i][0]=='/' || argv[i][0]=='-')
	  /* Option déjà traitée */;
	else
	{
	  if (iRangArg==0)
		usSource = UnicodeFromANSI(argv[i]);
	  else if (iRangArg==1)
		usDest = UnicodeFromANSI(argv[i]);
	  iRangArg++;
	}
  }

  if (iRangArg!=2)
  {
    cerr << Aff("astruct: La source et la destination doivent être précisées\n");
	bProbleme = true;
  }
  else
  {
	if (!bOkDir(usSource))
	{
	  cerr << "astruct: \"" << Aff(usSource) << "\" n'existe pas ou est inaccessible\n";
	  bProbleme = true;
	}

	if (!bOkDir(usDest))
	{
	  cerr << "astruct: \"" << Aff(usDest) << "\" n'existe pas ou est inaccessible\n";
	  bProbleme = true;
	}
  }

  if (bProbleme)
	goto fin;

  if (usSource.Right(1)!=L"\\")
	usSource += L"\\";
  if (usDest.Right(1)!=L"\\")
	usDest += L"\\";

  cerr << "astruct " << Aff(usSource) << " -> " << Aff(usDest) << (bNoAction ? " (noaction)":"") << endl;
  if (bVerbose)
  {	cerr << Aff("Appels système ") << (bModeW ? " Unicode (W)" : " ANSI") << endl;
	cerr << "Affichage " << (bAffichageANSI ? "ANSI" : "OEM") << endl;
  }
  if (!bOptionT)
    DetermineTimeOffset();
  AStruct(L"", L"");

  cerr << iNbDirTotal << " dossier" << s(iNbDirTotal) << Aff(" analysé") << s(iNbDirTotal) << ", " << iNbFicTotal << " fichier" << s(iNbFicTotal) << Aff(" analysé") << s(iNbFicTotal) << endl
       << iNbCopy << " fichier" << s(iNbCopy) << Aff(" copié") << s(iNbCopy) << ", " << iNbDel << " fichier" << s(iNbDel) << Aff(" effacé") << s(iNbDel) << (bNoAction ? " (noaction)":"") << endl;
  if (iNbNoCopy)
    cerr << iNbNoCopy << Aff(" problème") << s(iNbNoCopy) << " lors de la copie" << endl;

fin:
  if (bVerbose || (iNbNoCopy && bPauseFinale))
	Pause(1);

  if (bTraceObjects)
	TraceObjectsOutput();

  return 0;
}
