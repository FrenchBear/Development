// countfiles.cpp
// Compte les fichiers et les répertoires à partir d'une position donnée
// Usage: countfiles [options] path
// Options: /v: verbose, affiche le détail de l'analyse
// 29/12/04 PV  1.0
//					  Affiche des messages en anglais si la langue de Windows n'est pas le Français.

#include <Windows.h>
#include <iostream.h>
#include <stdio.h>				// sprintf
#include <io.h>
#include <malloc.h>
#include <time.h>

#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>

#include "CString.h"
#include "UString.h"

char szVersion[] = "1.0.0";

bool bVerbose = false;			// Option v
bool bAffichageANSI = false;	// Option i
bool bWidePath = false;			// Option w (chemins de plus de 255 caractères)

bool bFra;						// Si vrai, affiche des messages en français, sinon en anglais

bool bModeW;					// Détermine si on fait des appels système Unicode (xxxW)

int iNbFicTotal = 0;			// Nb de fichiers comparés
int iNbDirTotal = 1;			// Nb de répertoires analysés, on part de 1 pour le répertoire principal

UString usSource;				// Le paramètres du programme



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

static DWORD GetFileAttributesW_WWP(const UString &usNomfic)
{
	UString usF = usNomfic;
	WidePath0(usF);
	return GetFileAttributesW((const wchar_t *)usF);
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
	cerr << Aff(bFra ? "Entrée pour continuer" : "Enter to continue");
}

///////////////////////////////////////////////////////////////////////////

void Identification()
{
	cout << "countfiles " << szVersion << (bModeW ? (bWidePath ?" (unicode long)":" (unicode)") : " (ansi)") << endl
		 << (bFra ? "Comptage de fichiers et de dossiers\n\n"
		          : "Folder and files count\n\n");
}

inline void Usage()
{
	cout << "Usage: countfiles [/?] [/option ...] path\n";

	if (bFra)
	cout << Aff("Source et destination sont deux dossiers existants\n"
		"Options: /v      Mode verbose, le détail de l'analyse est affiché\n"
		) ;
	else
	cout << Aff("Source and destination must be valid and existing folders\n"
		"Options: /v      Verbose mode, detailed output (in French !)\n"
		) ;
}

inline void Info()
{
	cout << (bFra ? "Fichier:          " : "File:             ") << __FILE__  << '\n'
		 << (bFra ? "Date compilation: " : "Compilation date: ") << __DATE__ << ' ' << __TIME__ << '\n'
		 << (bFra ? "Date fichier:     " : "File date:        ") << __TIMESTAMP__ << '\n'
		 << (bFra ? "Compilateur:      MSC " : "Compiler:         ") << _MSC_VER << '\n'
		 <<         "Copyright:        " << "(c) 2004-2005 P.VIOLENT";
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
	cout << (bFra?": Erreur ":": Error ") << szErr << ": " << Aff(lpMsgBuf) << endl;
	if (!sMessage.IsEmpty())
		AjouteProbleme(sMessage+ (bFra?": Erreur ":": Error ")+szErr+": "+Aff(lpMsgBuf));
	
	LocalFree(lpMsgBuf);
	
	if (iErr==112)  // Espace insuffisant sur disque: on s'arrête sur le message
		Pause(0);
}



// Conversion WIN32_FIND_DATAW --> WIN32_FIND_DATA
// pour les champs utilisés par ce programme
void RecopieWFD(WIN32_FIND_DATAW *wfdw, const WIN32_FIND_DATA *wfd)
{
	memcpy(wfdw, wfd, (char *)&(wfd->cFileName)-(char *)wfd);
	MultiByteToWideChar(CP_ACP, 0, wfd->cFileName, 1+strlen(wfd->cFileName), wfdw->cFileName,  MAX_PATH);
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


// Parcourd récursimevent usPathS et réalise le comptage
void countfiles(UString usPathS)
{
	WIN32_FIND_DATAW wfdw;
	WIN32_FIND_DATA wfd;
	HANDLE          hFile;
	DWORD           err;
	UString		  usModele;
	int			  i;
	Dir			  dirSource;
	int			  iNbSource=0;
	
	// On énumère les fichiers de la source
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
		cout << "countfiles: FindFirstFile " << Guillemets(Aff(usModele));
		AfficheErrSysteme("countfiles: FindFirstFile "+Guillemets(Aff(usModele)));
		return;
	}
	for(;;)
	{
		if (wcscmp(wfdw.cFileName, L".") && wcscmp(wfdw.cFileName, L".."))
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
			cout << "countfiles: FindNextFile " << Guillemets(Aff(usModele));
			AfficheErrSysteme("countfiles: FindNextFile "+Guillemets(Aff(usModele)));
			break;
		}
	}
	FindClose((HANDLE)hFile);
	// Pas de test sur le résultat, plante de façon erratique
	
	
	// On continue récursivement les sous-répertoires de la source
	for (i=0 ; i<iNbSource ; i++)
	{
		WIN32_FIND_DATAW *pSource = &dirSource[i];
		// On ignore les répertoires qui ont à la fois les attributs HIDDEN et SYSTEM,
		// ce qui est en particulier le cas de la corbeille (répertoire \RECYCLED)
		if ((pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY) && ((pSource->dwFileAttributes&FILE_ATTRIBUTE_HIDDEN)==0 || (pSource->dwFileAttributes&FILE_ATTRIBUTE_SYSTEM)==0))
		{
			countfiles(usPathS + pSource->cFileName + L"\\");
			iNbDirTotal++;
		}
		else
			iNbFicTotal++;
	}
}




static inline char *s(int iVar)
{
	return (iVar>1) ? "s" : "";
}


int main(int argc, char **argv)
{
	int i;
	
	bool bProbleme = false;

	// Détermine la langue par défaut de l'environnement
	LANGID l = GetSystemDefaultLangID() & 0x3ff;
	bFra = (l==0xC);

	// On regarde si le système supporte les appels Unicode
	DetermineModeW();
	
	// On traite les options lors d'une première passe
	// de façon à ne pas rendre l'ordre des options significatif
	for (i=1 ; i<argc ; i++)
	{
		if (stricmp(argv[i], "/v")==0 || stricmp(argv[i], "-v")==0)
			bVerbose = true;
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
			if (bFra)
				cerr << "countfiles: Option " << argv[i] << " inconnue\n";
			else
				cerr << "countfiles: Unknown option " << argv[i] << endl;
			bProbleme = true;
		}
	}
	
	
	// Le reste des arguments est traité dans une deuxième passe
	int iRangArg = 0;
	for (i=1 ; i<argc ; i++)
	{
		if (argv[i][0]=='/' || argv[i][0]=='-')
		{
			/* Option déjà traitée */;
		}
		else
		{
			if (iRangArg==0)
				usSource = UnicodeFromANSI(argv[i]);
			iRangArg++;
		}
	}
	
	if (iRangArg!=1)
	{
		cerr << Aff(bFra ? "countfiles: Le répertoire doit être précisé\n"
						 : "countfiles: Folder must be specified\n");
		bProbleme = true;
	}
	else
	{
		if (!bOkDir(usSource))
		{
			cerr << "countfiles: \"" << Aff(usSource) << (bFra ? "\" n'existe pas ou est inaccessible\n" : "\" does not exist, or is not accessible\n");
			bProbleme = true;
		}
	}


	if (bProbleme)
		goto fin;
	
	if (usSource.Right(1)!=L"\\")
		usSource += L"\\";
	
	cerr << (bFra?"comptage de ":"counting ") << Aff(usSource) << endl;
	if (bVerbose)
	{	
		cerr << Aff(bFra?"Appels système ":"System calls ") << (bModeW ? " Unicode (W)" : " ANSI") << endl;
		cerr << (bFra?"Affichage ":"Output ") << (bAffichageANSI ? "ANSI" : "OEM") << endl;
	}
	countfiles(L"");
	
	cerr << iNbDirTotal << (bFra?" dossier":" folder") << s(iNbDirTotal) << endl;
	cerr << iNbFicTotal << (bFra?" fichier":" file") << s(iNbFicTotal) << endl;

fin:
	if (bVerbose)
		Pause(1);
	
	return 0;
}
