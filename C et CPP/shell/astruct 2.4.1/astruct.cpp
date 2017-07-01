// astruct.cpp
// Aligne deux structures de dossiers sur disque
// Usage: astruct [options] source cible
// Options: /t: test, affiche les op�rations mais ne fait rien
//          /v: verbose, affiche le d�tail de l'analyse
// 25/08/96 PV  1.0
//  6/09/96 PV	1.1 Optimisation avec la classe Dir; r�duction importante du nombre d'appels � findxxx et stat
// 12/09/96 PV	    Option /v verbose
// 20/09/96 PV	1.2.0 Analyse des fichiers via win32 � cause du probl�me d'heude d'�t� de _findfirst
// 23/09/96 PV	1.3.0 Option /_: ne pas copier fichiers/dossiers commen�ant par _, pour FrontPage
//					  Option /l: copie les fichiers et cr�e les dossiers en minuscules
// 02/10/96 PV  1.3.1 Correction de probl�mes d'accents et de retours � la ligne
//					  operator << sur __int64 correct
// 21/10/96 PV  1.4.0 Traitement complet des accents avec stricmp maison au lieu du stricmp standard
//					  Cas des volumes destination int�gralement vides trait� sans erreur
// 20/03/97 PV  1.4.1 Plus de test sur le retour de FindClose, parfois erreur sans raison...
//  5/01/98 PV  1.5.0 Arrondi du timestamp � 2 secondes pour les comparaisons, le filesystem FAT (et FAT32) ayant une r�solution de 2 sec...
//  5/01/98 PV  1.5.1 Option /p de pause finale en cas d'erreurs; Test de d'offset de temps entre source et dest et option /t
//  6/01/98 PV  1.5.2 M�thode de test d'offset de temps en deux cr�ations inapplicable...
//  9/04/98 PV  1.6.0 Option /. pour transformer les fichiers dont le nom commence par un . en _
// 24/04/98 PV	1.6.1 Option /d: ne pas copier les volumes DriveSpace
// 27/10/98 PV	1.6.2 Gestion des r�pertoires commen�ant par un .; plus d'option /.
// 28/10/98 PV	1.6.3 Option /_ remplac�e par /%, ne copie pas les r�pertoires commen�ant par % (conflit avec /.)
// 30/10/98 PV	1.6.4 Gestion compl�te de la conversion . en _
//  2/11/98 PV	1.6.5 Retour de l'option /_ !!! (pour les arborescences FrontPage...)
// 24/08/99 PV	1.6.6 Pas de message en cas d'�chec � la cr�ation du fichier $$--$$.. sur la source au test d'offset
//  7/04/00 PV	1.7.0 Compatibilit� Win2000. L'arrondi � un timestamp pair est diff�rent entre Unix et Win2000 !!!!
// 15/05/00 PV	1.7.1 FileCopy Windows 2000->Win 98, timestamp ..50s --> ..52s => tol�rance de 2s aux tests d'�galit�...
// 20/08/00 PV	1.7.2 Effacement d'un r�pertoire R/O impossible sous Windows 2000 ==> effacer l'attribut en cas d'�chec de suppression
//  8/12/00 PV	1.7.3 Pb astruct de l'arborescence FTP du serveur avec des accents ANSI
// 24/12/01 PV	2.0.0 Version Unicode; Fin de l'option D
// 26/12/01 PV	2.0.1 Conversion correcte � partir des accents OEM dela ligne de commande; Option s (s�curit� - ne pas �craser un fichier +r�cent)
// 26/12/01 PV	2.1.0 Fonctionnement mixte Unicode/ANSI selon le syst�me, option /A pour forcer les appels syst�me ANSI sur les syst�mes g�rant l'Unicode
// 31/12/01 PV	2.1.1 Option d'affichage ANSI au lieu de l'affichage OEM console standard (utile pour rediriger la sortie dans un fichier et l'afficher avec le bloc-notes). Attention, les param�tres restent en OEM (console ou .bat)
// 27/01/04 PV	2.2.0 Ignore le fichier $$--$$--.$-$ dans les copies/effacement
// 16/04/04 PV	2.3.0 Option /w: support des chemins de plus de 255 caract�res en mode Unicode
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
bool bNoPercent = false;	  // Option % (Ignore sur la source les fichiers commen�ant par %)
bool bNoUnderscore = false;	  // Option _ (Ignore sur la source les fichiers commen�ant par _)
bool bOptionL = false;		  // Option l (copie en minuscules)
bool bOptionS = false;		  // Option s (n'�crase pas un fichier plus r�cent)
bool bPauseFinale = false;	  // Option p
bool bAffichageANSI = false;  // Option i
bool bWidePath = false;		  // Option w (chemins de plus de 255 caract�res)
bool bNoAction = false;		  // Option n (aucune action)
bool bTraceObjects = false;	  // Option o (traces internes sur les objets)


bool bModeW;				  // D�termine si on fait des appels syst�me Unicode (xxxW)

int iNbDel = 0;               // Nb de fichiers effac�s
int iNbCopy = 0;              // Nb de fichiers copi�s
int iNbFicTotal = 0;          // Nb de fichiers compar�s
int iNbDirTotal = 1;          // Nb de r�pertoires analys�s, on part de 1 pour le r�pertoire principal
int iNbNoCopy = 0;		      // Nb de fichiers avec �chec � la copie

UString usSource, usDest;     // Les deux param�tres du programme

UString usNomficTTO(L"$$--$$--.$-$");	// Test TimeOffset


///////////////////////////////////////////////////////////////////////////

// M�morise un tableau dynamique de structures WIN32_FIND_DATAW
// void Ajoute(const WIN32_FIND_DATAW &rfd)		ajoute un �l�ment � la collection
// int iCount()									retourne le nombre d'�l�ments
// WIN32_FIND_DATAW &operator[](int iRang)		retourne un �l�ment par son indice (base 0)
// WIN32_FIND_DATAW *pdirFind(UString &usAChercher)	retourne un �l�ment par son nom (recherche ignorant la casse)

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
	static int m_nConstr;		// Nb d'appels � un constructeur
	static int m_nDestr;		// Nb d'appels au destructeur
public:
	static int GetnConstr() { return m_nConstr; }
	static int GetnDestr() { return m_nDestr; }
};

int Dir::m_nConstr;
int Dir::m_nDestr;


///////////////////////////////////////////////////////////////////////////
// Support des paths sup�rieurs � 255 caract�res
// Transforme la cha�ne pass�e en r�f�rence selon ce qui suit:
// The Unicode versions of several functions permit paths that exceed the MAX_PATH length if the path has the "\\?\" prefix.
// The "\\?\" tells the function to turn off path parsing. However, each component in the path cannot be more than MAX_PATH
// characters long. Use the "\\?\" prefix with paths for local storage devices and the "\\?\UNC\" prefix with paths having 
// the Universal Naming Convention (UNC) format. The "\\?\" is ignored as part of the path. For example, "\\?\C:\myworld\private"
// is seen as "C:\myworld\private", and "\\?\UNC\bill_g_1\hotstuff\coolapps" is seen as "\\bill_g_1\hotstuff\coolapps". 
//
// Impl�mente les fonctions d'acc�s au filesystem xx_WWP (Wchar_t Wide Path)
// Selon l'option w, transforme le path ou non avec les conventions longues via WidePath0
// avant l'appel de la fonction windows xxW �quivalente
// Comme �a la conversion et la logique du code d'analyse reste inchang�e dans le reste du pgm

void WidePath0(UString &us)
{
  // Le traitement n'est pas actif si l'option /w n'est pas utilis�e, par s�curit�
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
// Routine d'affichage centralis�e, re�oit des chaines 8 bits ANSI en param�tre,
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
// Emballe une cha�ne de guillements si elle contient un espace, ou retourne
// la cha�ne non modifi�e dans le cas contraire

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
// Message de pause final et liste des probl�mes rencontr�s

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

  cerr << Aff("Entr�e pour continuer");
  if (bFinal && iNbNoCopy) cerr << Aff(", ?+Entr�e pour revoir les probl�mes");
  cerr << "...";
  cin.getline(c, sizeof(c));

  if (bFinal && c[0]=='?')
  {
    cerr << Aff("\nProbl�mes rencontr�s lors de l'ex�cution :\n");
	Probleme *p;
	for (p=p0 ; p!=NULL ; p=p->pSuiv)
	  cerr << p->sMsg << endl;
  }
}

///////////////////////////////////////////////////////////////////////////
// Traitement des accents

/* majAZ Convertit un caract�re en majuscule (si c'est possible) entre
**	 A et Z, c'est � dire non accentu�e.  Ainsi, toutes les lettres
**	 suivantes sont converties en 'E':  e � � � � � E
**	 Si la conversion n'est pas possible, le caract�re est rendu
**	 tel quel. (ex: '$')
*/

/*
static unsigned char tabmajAZ[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177CUEAAAACEEEIIIAAE��OOOUUYOU\x9B\x9c\x9d\x9e\x9f" "AIOUNN";

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
              "Options: /t D�sactive le contr�le de diff�rence de temps\n"
              "         /v Mode verbose, le d�tail de l'analyse est affich�\n"
              "         /% Ne copie pas fichiers et dossiers commen�ant par %\n"
              "         /_ Ne copie pas fichiers et dossiers commen�ant par _\n"
              "         /l Cr�e des dossiers et des fichiers avec un nom en minuscules\n"
              "         /p Pause finale en cas de probl�me pour revoir les erreurs\n"
              "         /a Appels syst�me forc�s en mode ANSI sous Windows NT/2K/XP\n"
			  "         /i Affichages en mode ANSI (mode OEM par d�faut)\n"
              "         /w WidePath, chemins de plus de 255 caract�res en mode Unicode\n"
			  "         /n NoAction, affiche les commandes mais n'ex�cute aucune action\n"
              "         /s S�curit�, n'�crase pas un fichier plus r�cent sur la destination\n");
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
       << "Date fichier:     " << __TIMESTAMP__ << '\n'
       << "Compilateur:      MSC " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1996-2004 P.VIOLENT";
}


// Version sophistiqu�e du perror compatible multithread, � base de GetLastError()
void AfficheErrSysteme(const CString sMessage)
{
  char *lpMsgBuf;
  DWORD iErr = GetLastError();
  char *p;
  size_t l;

  FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
	NULL, iErr, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
	(LPTSTR) &lpMsgBuf, 0, NULL);

  // On �limine les retours � la ligne dans le message
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

  if (iErr==112)  // Espace insuffisant sur disque: on s'arr�te sur le message
    Pause(0);
}


void CopieFichier(const UString &usNomficSource, const UString &usNomficDest)
{
  UString usNomficDestLower = usNomficDest;

  if (bOptionL)
	usNomficDestLower.MakeLower();

  cout << "copy " << Guillemets(Aff(usNomficSource)) << " " << Guillemets(Aff(usNomficDestLower));
  cout.flush();		// La copie peut �tre longue, au travers de Num�ris...

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

  // On supprime les attributs qui emp�chent l'effacement
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
// pour les champs utilis�s par ce programme
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



// Efface r�cursivement un r�pertoire, m�me non vide
void EffaceDir(const UString &usNomdir)
{
  WIN32_FIND_DATAW wfdw;
  WIN32_FIND_DATA wfd;
  HANDLE          hFile;
  DWORD           err;
  UString usModele, usAEffacer;

  // On efface tout ce qui tra�ne dans le r�pertoire
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
	// Pas de fichier dans le r�pertoire: pas de probl�me !
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
	// Sous 2000, un r�pertoire avec l'attribut lecture seule ne peut pas �tre effac�...
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


// D�termine si le syst�me supporte les appels Unicode
// On suppose que GetFileAttributesW(L"C:\\"); doit toujours r�ussir sur un syst�me
// ayant le support Unicode
// Attention: � tester sur un serveur Citrix o� C: � �t� remapp� en M:
void DetermineModeW()
{
  int iAttrib = GetFileAttributesW(L"C:\\");
  if (iAttrib>=0)
	bModeW = true;
  else
  {
	DWORD iErr = GetLastError();
	if (iErr==120)	  // Fonction non support�e par le syst�me
	  bModeW = false;
	else
	{
	  cerr << Aff("�chec au DetermineModeW: ");
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
// La comparaison est arrondie � deux secondes, puisque le filesystem FAT
// ne dispose que de cette r�solution (alors qu'un fichier en r�seau sur un FS Unix
// a une date de modif � la seconde pr�s)
// La r�solution d'un FILETIME est de 100ns
// retourne le signe de t2-t1
int cmpFileTime(FILETIME *pft1, FILETIME *pft2)
{
  __int64 t1 = (((__int64)pft1->dwHighDateTime)*0x100000000i64+(__int64)(pft1->dwLowDateTime))/10000000;
  __int64 t2 = (((__int64)pft2->dwHighDateTime)*0x100000000i64+(__int64)(pft2->dwLowDateTime))/10000000;

  if (t2-t1<-2) return -1;
  if (t2-t1>2) return 1;
  return 0;
}


// R�alise l'alignement r�cursif du r�pertoire usPathS/usPathD relatif �
// sSource et sDest. usPathD est identique � usPathS mais ajust� en fonction
// des caract�ristiques de la cible (ex: . en t�te remplac� par un _)
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

  // 0. On �num�re les fichiers de la source et de la destination
  // Cette op�ration n'a lieu qu'une seule fois, pour minimiser le nombre
  // d'appels systeme

  // D'abord le r�pertoire source
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
  // Pas de test sur le r�sultat, plante de fa�on erratique


  // Puis le r�pertoire destination
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
  // ou qui sont � une date diff�rente sur la source.
  // On cr�e les dossiers n�cessaires sur la destination.
  for (i=0 ; i<iNbSource ; i++)
  {
	WIN32_FIND_DATAW *pSource = &dirSource[i];

	// Conversion syst�matique du . initial de la source en _ sur la destination
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

	  // Les dossiers HIDDEM+SYSTEM tels que \RECYCLED ne sont pas cr��s ni copi�s
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
			cout << Guillemets(Aff(usFullDest)) << Aff(" est plus r�cent que ") << Guillemets(Aff(usFullSource)) << ", pas de copie.\n";
			if (bVerbose)
			{
              cout << Guillemets(Aff(usFullSource)) << Aff(": plus r�cent sur la destination\n");
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
				cout << Guillemets(Aff(usFullSource)) << Aff(": dates diff�rentes\n");
				cout << "source:      " << pSource->ftLastWriteTime << endl; // << " " << ctime(&ts) << endl;
				cout << "destination: " << pDest->ftLastWriteTime << endl; // << " " << ctime(&td) << endl;
			  }

			  if (size64(pSource->nFileSizeLow,pSource->nFileSizeHigh) != size64(pDest->nFileSizeLow,pDest->nFileSizeHigh))
			  {
				cout << Guillemets(Aff(usFullSource)) << Aff(": tailles diff�rentes\n");
				cout << "source:      " << size64(pSource->nFileSizeLow, pSource->nFileSizeHigh) << endl;
				cout << "destination: " << size64(pDest->nFileSizeLow, pDest->nFileSizeHigh) << endl;
			  }
			}
			// Si le fichier cible qui n'est pas � jour a des attributs bizzares,
			// on les efface, pour �viter un �chec de la copie
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


  // 2. On �limine les fichiers et les dossiers en trop sur la destination
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



  // 3. On aligne r�cursivement les sous-r�pertoires de la source
  for (i=0 ; i<iNbSource ; i++)
  {
	WIN32_FIND_DATAW *pSource = &dirSource[i];
	// On ignore les r�pertoires qui ont � la fois les attributs HIDDEN et SYSTEM,
	// ce qui est en particulier le cas de la corbeille (r�pertoire \RECYCLED)
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



// Fonction empirique pour d�terminer s'il existe une diff�rence d'heure entre la source et la destination
// N�cessite que le r�pertoire source soit accessible en �criture...
// On �vacue les diff�rences de pr�cision par un arrondi � un temps multiple de 2 secondes
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

  // Si la source n'est pas accessible en �criture, on d�gage silencieusement
  if (h<0) return;

  if (h<0)
  { cerr << Aff("astruct (tGetTime): �chec � la cr�ation de ") << Guillemets(Aff(usPathSource)) << ": Erreur " << errno << ": " << sys_errlist[errno] << endl;
    Pause(0);
    exit(0);
  }
  close(h);
  if (bModeW)
	h = _wstat(usPathSource, &buf);
  else
	h = _stat(ANSI(usPathSource), &buf);
  if (h<0)
  { cerr << Aff("astruct (tGetTime): �chec au stat ") << Guillemets(Aff(usPathSource)) << ": Erreur " << errno << ": " << sys_errlist[errno] << endl;
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
  { cerr << Aff("astruct (tGetTime): �chec au stat ") << Guillemets(Aff(usPathDest)) << ": Erreur " << errno << ": " << sys_errlist[errno] << endl;
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
    cout << Aff("Attention, diff�rence de temps entre source et destination apr�s copie\n")
         << Aff("astruct ne g�re pas cette situation.\n")
         << Aff("L'option -t d�sactive ce test.\n");
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

  // On regarde si le syst�me supporte les appels Unicode
  DetermineModeW();

  // Tests de WidePath
  //TestWidePath();

  // On traite les options lors d'une premi�re passe
  // de fa�on � ne pas rendre l'ordre des options significatif
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


  // Le reste des arguments est trait� dans une deuxi�me passe
  int iRangArg = 0;
  for (i=1 ; i<argc ; i++)
  {
	if (argv[i][0]=='/' || argv[i][0]=='-')
	  /* Option d�j� trait�e */;
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
    cerr << Aff("astruct: La source et la destination doivent �tre pr�cis�es\n");
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
  {	cerr << Aff("Appels syst�me ") << (bModeW ? " Unicode (W)" : " ANSI") << endl;
	cerr << "Affichage " << (bAffichageANSI ? "ANSI" : "OEM") << endl;
  }
  if (!bOptionT)
    DetermineTimeOffset();
  AStruct(L"", L"");

  cerr << iNbDirTotal << " dossier" << s(iNbDirTotal) << Aff(" analys�") << s(iNbDirTotal) << ", " << iNbFicTotal << " fichier" << s(iNbFicTotal) << Aff(" analys�") << s(iNbFicTotal) << endl
       << iNbCopy << " fichier" << s(iNbCopy) << Aff(" copi�") << s(iNbCopy) << ", " << iNbDel << " fichier" << s(iNbDel) << Aff(" effac�") << s(iNbDel) << (bNoAction ? " (noaction)":"") << endl;
  if (iNbNoCopy)
    cerr << iNbNoCopy << Aff(" probl�me") << s(iNbNoCopy) << " lors de la copie" << endl;

fin:
  if (bVerbose || (iNbNoCopy && bPauseFinale))
	Pause(1);

  if (bTraceObjects)
	TraceObjectsOutput();

  return 0;
}
