// ttype.cpp
// Text File Type
// Usage: ttype [options] path...
// 2005/01/05 PV  1.0	First version; determine file type
// 2005/01/09 PV  1.1	Conversion to ANSI and to Unicode
// 2005/01/11 PV  1.2	CheckSQL option

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

char szVersion[] = "1.2.0";

bool bVerbose = false;			// Option v
bool bConvertUnicode = false;	// Option u
bool bConvertANSI = false;		// Option a
bool bAffichageANSI = false;	// Option i
bool bWidePath = false;			// Option w (chemins de plus de 255 caractères)

bool bModeW;					// Détermine si on fait des appels système Unicode (xxxW)

bool bCheckSQL = false;			// Option s

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
	/*
	int l = strlen(szANSI)+1;
	wchar_t *ps = (wchar_t *)alloca(2*l);
	MultiByteToWideChar(CP_ACP, 0, szANSI, l, ps, l);
	return UString(ps);
	*/
	int l = strlen(szANSI)+1;
	wchar_t *ps = (wchar_t *)malloc(2*l);
	MultiByteToWideChar(CP_ACP, 0, szANSI, l, ps, l);
	UString us = UString(ps);
	free(ps);
	return us;
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


void Pause(bool bFinal)
{
	cerr << "Enter to continue";
}

///////////////////////////////////////////////////////////////////////////

void Identification()
{
	cout << "ttype " << szVersion << (bModeW ? (bWidePath ?" (unicode long)":" (unicode)") : " (ansi)") << endl
		 << "Text File Type\n\n";
}

inline void Usage()
{
	cout << "Usage: ttype [/?] [/option ...] file...\n";

	cout << Aff("Displays and converts text file type\n"
		        "Options: /v  verbose\n"
				"         /i  ANSI output (default: OEM)\n"
				"         /w  Wide path, Allows more than 255 chars in paths\n"
				"         /u  Convert ANSI text files to Unicode text files\n"
				"         /a  Convert Unicode text files to ANSI text files\n"
				"         /s  SQL check\n"
		);
}

inline void Info()
{
	cout << "File:             " << __FILE__  << '\n'
		 << "Compilation date: " << __DATE__ << ' ' << __TIME__ << '\n'
		 << "File date:        " << __TIMESTAMP__ << '\n'
		 << "Compiler:         " << _MSC_VER << '\n'
		 << "Copyright:        " << "(c) 2005 P.VIOLENT";
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
	cout << ": Error " << szErr << ": " << Aff(lpMsgBuf) << endl;
	
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
			cerr << Aff("DetermineModeW failed: ");
			AfficheErrSysteme("");
			Pause(0);
			exit(0);
		}
	}
}


void ConvertAsciiToUnicode(UString usPath)
{
	cout << " --> Unicode";

	// Get file size
	struct _stat sb;
	int h;

	if(bModeW)
		h = _wstat((const wchar_t *)usPath, &sb);
	else
		h = _stat(ANSI(usPath), &sb);
	if (h<0)
	{
		cout << " *** stat failed";
		return;
	}

	if (sb.st_size>1024*1024)
	{
		cout << " *** Larger than 1MB, not converted.";
		return;
	}

	unsigned char *m = (unsigned char *)malloc(sb.st_size+1);
	if (m==NULL)
	{
		cout << " *** malloc failed";
		return;
	}
	m[sb.st_size] = 0;	// end of string

	// Open file
	if(bModeW)
		h = _wopen((const wchar_t *)usPath, O_RDWR+O_BINARY);
	else
		h = _open(ANSI(usPath), O_RDWR+O_BINARY);
	if (h<0)
	{
		cout << " *** open failed";
		free(m);
		return;
	}

	// Read ASCII data
	int s;
	s = read(h, m, sb.st_size);
	if (s!=sb.st_size)
	{
		cout << " *** read!=size !";
		close(h);
		free(m);
		return;
	}

	// Rewind file
	lseek(h, 0L, SEEK_SET);

	// Convert
	UString us = UnicodeFromANSI((const char *)m);

	// Write header
	if (2!=write(h, "\xff\xfe", 2))
	{
		cout << " *** write header failed";
		close(h);
		free(m);
		return;
	}
	// Write data
	write(h, us.GetBuffer(0), 2*us.GetLength());

	// Close file and free buffer
	close(h);
	free(m);
}


void ConvertUnicodeToAscii(UString usPath)
{
	cout << " --> ASCII";

	// Get file size
	struct _stat sb;
	int h;

	if(bModeW)
		h = _wstat((const wchar_t *)usPath, &sb);
	else
		h = _stat(ANSI(usPath), &sb);
	if (h<0)
	{
		cout << " *** stat failed";
		return;
	}

	if (sb.st_size>1024*1024)
	{
		cout << " *** Larger than 1MB, not converted.";
		return;
	}

	wchar_t *m = (wchar_t *)malloc(sb.st_size-2+2);
	if (m==NULL)
	{
		cout << " *** malloc failed";
		return;
	}
	m[sb.st_size/2-1] = 0;		// end of string

	// Open file
	if(bModeW)
		h = _wopen((const wchar_t *)usPath, O_RDONLY+O_BINARY);
	else
		h = _open(ANSI(usPath), O_RDONLY+O_BINARY);
	if (h<0)
	{
		cout << " *** open failed";
		free(m);
		return;
	}

	// Skip header
	int s;
	s = read(h, (char *)m, 2);
	if (s!=2)
	{
		cout << " *** header read size!=2 !";
		close(h);
		free(m);
		return;
	}

	// Read unicode data
	s = read(h, (char *)m, sb.st_size-2);
	if (s!=sb.st_size-2)
	{
		cout << " *** read!=size !";
		close(h);
		free(m);
		return;
	}

	// Close file
	close(h);

	// Open file in write mode and truncates it
	if(bModeW)
		h = _wopen((const wchar_t *)usPath, O_WRONLY+O_BINARY+O_TRUNC);
	else
		h = _open(ANSI(usPath), O_WRONLY+O_BINARY+O_TRUNC);
	if (h<0)
	{
		cout << " *** open in write mode failed";
		free(m);
		return;
	}

	// Convert
	UString us = UString(m);

	// Write data
	write(h, ANSI(us.GetBuffer(0)), us.GetLength());

	// Close file and free buffer
	close(h);
	free(m);
}



inline bool isAscii7(unsigned char c)
{
	return c==9 || c==10 || c==13 || (c>=32 && c<127);
}

inline bool isAscii8(unsigned char c)
{
	return isAscii7(c) || (c>=128 && c!=0xfe && c!=0xff);
}

enum eFileType
{
	eftAscii,
	eftUnicode,
	eftOther
};


void CheckSQL(enum eFileType eft, UString usPath)
{
	cout << " SQL:";

	// Get file size
	struct _stat sb;
	int h;

	if(bModeW)
		h = _wstat((const wchar_t *)usPath, &sb);
	else
		h = _stat(ANSI(usPath), &sb);
	if (h<0)
	{
		cout << " *** stat failed";
		return;
	}

	if (sb.st_size>1024*1024)
	{
		cout << " *** Larger than 1MB, not checked.";
		return;
	}

	// Open file
	if(bModeW)
		h = _wopen((const wchar_t *)usPath, O_RDONLY+O_BINARY);
	else
		h = _open(ANSI(usPath), O_RDONLY+O_BINARY);
	if (h<0)
	{
		cout << " *** open failed";
		return;
	}

	UString usSQL;
	int s;
	wchar_t *m;
	unsigned char *n;

	switch(eft)
	{
		case eftUnicode:
			m = (wchar_t *)malloc(sb.st_size-2+2);
			if (m==NULL)
			{
				cout << " *** malloc failed";
				return;
			}
			m[sb.st_size/2-1] = 0;		// end of string

			// Skip header
			s = read(h, (char *)m, 2);
			if (s!=2)
			{
				cout << " *** header read size!=2 !";
				close(h);
				return;
			}

			// Read unicode data
			s = read(h, (char *)m, sb.st_size-2);
			if (s!=sb.st_size-2)
			{
				cout << " *** read!=size !";
				close(h);
				return;
			}

			usSQL = UString(m);
			free(m);
			break;

		case eftAscii:
			n = (unsigned char *)malloc(sb.st_size+1);
			if (n==NULL)
			{
				cout << " *** malloc failed";
				return;
			}
			n[sb.st_size] = 0;	// end of string

			// Read ASCII data
			s = read(h, n, sb.st_size);
			if (s!=sb.st_size)
			{
				cout << " *** read!=size !";
				close(h);
				free(n);
				return;
			}

			usSQL = UnicodeFromANSI((const char *)n);
			free(n);
			break;
	}

	// Test SQL
	int l;
	wchar_t c1, c2;
	bool bEOL = false;
	for(l = usSQL.GetLength() ; --l>=0 ;)
	{
		c2 = usSQL[l];
		if (c2==L'\n' || c2==L'\r')
			bEOL = true;
		if (c2!=L' ' && c2!=L'\n' && c2!=L'\r')
			break;
	}
	if (l>0)
	{
		c1 = usSQL[--l];
		//cout << " Last two non-white char: " << Aff(c1) << Aff(c2);

		if (bEOL && (c1==L'g' || c1==L'G') && (c2==L'o' || c2==L'O'))
			cout << "Ok";
		else
		{
			cout << "Pb";

			usSQL += L"\r\nGO\r\n";
			close(h);

			// Open file in write mode
			if(bModeW)
				h = _wopen((const wchar_t *)usPath, O_WRONLY+O_BINARY);
			else
				h = _open(ANSI(usPath), O_WRONLY+O_BINARY);
			if (h<0)
			{
				cout << " *** open in write mode failed";
				return;
			}
			
			switch(eft)
			{
				case eftAscii:
					write(h, ANSI(usSQL.GetBuffer(0)), usSQL.GetLength());
					break;

				case eftUnicode:
					// Write header
					if (2!=write(h, "\xff\xfe", 2))
					{
						cout << " *** write header failed";
						close(h);
						free(m);
						return;
					}

					// Write data
					write(h, usSQL.GetBuffer(0), 2*usSQL.GetLength());

					break;
			}

			cout << ", Updated";
		}
	}

	// Close file
	close(h);
}


// Process one file
void ProcessOneFile(UString usPath)
{
	enum eFileType eft = eftOther;

	cout << Aff(usPath) << '\t';
	cout.flush();

	int h;
	if(bModeW)
		h = _wopen((const wchar_t *)usPath, O_RDONLY+O_BINARY);
	else
		h = _open(ANSI(usPath), O_RDONLY+O_BINARY);

	unsigned char bBuffer[4];
	int r;
	r = read(h, bBuffer, 4);
	if (r<0)
		cout << "Read failed";
	else if (r==0)
		cout << "Empty file";
	else if (r<4)
		cout << "Small file, less than 4 bytes" << " r=" << r;
	else
	{
		if (bBuffer[0]==0xff && bBuffer[1]==0xfe)
		{
			eft = eftUnicode;
			cout << "Unicode";
		}
		else if (bBuffer[0]==0xfe && bBuffer[1]==0xff)
			cout << "Unicode big endian";
		else if (bBuffer[0]==0xef && bBuffer[1]==0xbb && bBuffer[2]==0xbf)
			cout << "UTF-8";
		else if (isAscii7(bBuffer[0]) && isAscii7(bBuffer[1]) && isAscii7(bBuffer[2]) && isAscii7(bBuffer[3]))
		{
			eft = eftAscii;
			cout << "Ascii 7bit";
		}
		else if (isAscii8(bBuffer[0]) && isAscii8(bBuffer[1]) && isAscii8(bBuffer[2]) && isAscii8(bBuffer[3]))
		{
			eft = eftAscii;
			cout << "Ascii 8bit";
		}
		else
			cout << "Binary";
	}

	close(h);

	if (bConvertUnicode && eft==eftAscii)
	{
		ConvertAsciiToUnicode(usPath);
		eft = eftUnicode;
	}
	else if (bConvertANSI && eft==eftUnicode)
	{
		ConvertUnicodeToAscii(usPath);
		eft = eftAscii;
	}

	if (bCheckSQL)
		CheckSQL(eft, usPath);


	cout << endl;
}



// Process one argument at a time
// Consider the argument as a pattern, general case
void ProcessOneArgument(UString usPathS)
{
	WIN32_FIND_DATAW wfdw;
	WIN32_FIND_DATA wfd;
	HANDLE          hFile;
	DWORD           err;
	UString			usModele;
	int				i;
	Dir				dirSource;
	int				iNbSource=0;
	UString			usPathPrefix;

	// Get path part
	int pb = usPathS.FindLast(L'\\');
	if (pb>=0)
		usPathPrefix = usPathS.Left(pb+1);
	
	// On énumère les fichiers de la source
	usModele = usPathS;
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
		cout << "ttype: FindFirstFile " << Guillemets(Aff(usModele));
		AfficheErrSysteme("ttype: FindFirstFile "+Guillemets(Aff(usModele)));
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
			cout << "ttype: FindNextFile " << Guillemets(Aff(usModele));
			AfficheErrSysteme("ttype: FindNextFile "+Guillemets(Aff(usModele)));
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
		if (pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY) 
		{
			if ((pSource->dwFileAttributes&FILE_ATTRIBUTE_HIDDEN)==0 || (pSource->dwFileAttributes&FILE_ATTRIBUTE_SYSTEM)==0)
			{
			// No recursivity for now
			// ProcessOneArgument(usPathS + pSource->cFileName + L"\\");
			}
		}
		else
			ProcessOneFile(usPathPrefix+pSource->cFileName);
	}
}





int main(int argc, char **argv)
{
	int i;
	
	bool bProbleme = false;

	// On regarde si le système supporte les appels Unicode
	DetermineModeW();
	
	// On traite les options lors d'une première passe
	// de façon à ne pas rendre l'ordre des options significatif
	for (i=1 ; i<argc ; i++)
	{
		if (stricmp(argv[i], "/v")==0 || stricmp(argv[i], "-v")==0)
			bVerbose = true;
		else if (stricmp(argv[i], "/u")==0 || stricmp(argv[i], "-u")==0)
			bConvertUnicode = true;
		else if (stricmp(argv[i], "/a")==0 || stricmp(argv[i], "-a")==0)
			bConvertANSI = true;
		else if (stricmp(argv[i], "/s")==0 || stricmp(argv[i], "-s")==0)
			bCheckSQL = true;
		else if (stricmp(argv[i], "/i")==0 || stricmp(argv[i], "-i")==0)
			bAffichageANSI = true;
		else if (stricmp(argv[i], "/w")==0 || stricmp(argv[i], "-w")==0)
			bWidePath = true;
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
			cerr << "ttype: Unknown option " << argv[i] << endl;
			bProbleme = true;
		}
	}
	if (bProbleme) return 1;

	if (bConvertANSI && bConvertUnicode)
	{
		cout << "ttype: Options -a and -u can't be used together.\n";
		return 1;
	}
	
	// Le reste des arguments est traité dans une deuxième passe
	int iNbFic = 0;
	for (i=1 ; i<argc ; i++)
	{
		if (argv[i][0]=='/' || argv[i][0]=='-')
		{
			/* Option déjà traitée */;
		}
		else
		{
			ProcessOneArgument(UnicodeFromANSI(argv[i]));
			iNbFic++;
		}
	}
	
	if (iNbFic==0)
	{
		cerr << "ttype: At least one file must be specified\n";
		bProbleme = true;
		return 2;
	}

	return 0;
}
