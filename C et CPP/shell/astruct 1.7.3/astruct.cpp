// astruct.cpp
// Aligne deux structures de dossiers sur disque
// Usage: astruct [/vlpt_] source cible
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
//

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

char szVersion[] = "1.7.3";

BOOL bVerbose = FALSE;		  // Option v
BOOL bNoPercent = FALSE;	  // Option % (Ignore sur la source les fichiers commençant par %)
BOOL bNoUnderscore = FALSE;	  // Option _ (Ignore sur la source les fichiers commençant par _)
BOOL bOptionL = FALSE;		  // Option l (copie en minuscules)
BOOL bPauseFinale = FALSE;	  // Option p
BOOL bOptionD = FALSE;		  // Option d (ne pas copier les volumes drivespace)

int iNbDel = 0;               // Nb de fichiers effacés
int iNbCopy = 0;              // Nb de fichiers copiés
int iNbFicTotal = 0;          // Nb de fichiers comparés
int iNbDirTotal = 1;          // Nb de répertoires analysés, on part de 1 pour le répertoire principal
int iNbNoCopy = 0;		      // Nb de fichiers avec échec à la copie

CString sSource, sDest;       // Les deux paramètres du programme

///////////////////////////////////////////////////////////////////////////

// Mémorise un tableau dynamique de structures WIN32_FIND_DATA
// void Ajoute(const WIN32_FIND_DATA &rfd)		ajoute un élément à la collection
// int iCount()									retourne le nombre d'éléments
// WIN32_FIND_DATA &operator[](int iRang)		retourne un élément par son indice (base 0)
// WIN32_FIND_DATA *pdirFind(char *szAChercher)	retourne un élément par son nom (recherche ignorant la casse)

class Dir
{
private:
  int iNbFD;
  WIN32_FIND_DATA *tFD;

public:
  Dir() { iNbFD=0; tFD=NULL; }
  ~Dir() { if (tFD) free(tFD); }

  void Ajoute(const WIN32_FIND_DATA &rfd)
  {
	tFD = (WIN32_FIND_DATA *)realloc(tFD, (iNbFD+1)*sizeof(WIN32_FIND_DATA));
	tFD[iNbFD] = rfd;
	iNbFD++;
  }

  int iCount() { return iNbFD; }

  WIN32_FIND_DATA &operator[](int iRang)
  {
	return tFD[iRang];
  }

  WIN32_FIND_DATA *pdirFind(const char *szAChercher)
  {
	for (int i=0 ; i<iNbFD ; i++)
	  if (stricmp(tFD[i].cFileName, szAChercher)==0)
	    return tFD+i;
	return NULL;
  }
};

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
  o << "(" << ft.dwLowDateTime << ";" << ft.dwHighDateTime << ")";
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

void Pause(BOOL bFinal)
{
  char c[10];

  cerr << "Entr‚e pour continuer";
  if (bFinal && iNbNoCopy) cerr << ", ?+Entr‚e pour revoir les problŠmes";
  cerr << "...";
  cin.getline(c, sizeof(c));

  if (bFinal && c[0]=='?')
  {
    cerr << "\nProblŠmes rencontr‚s lors de l'ex‚cution :\n";
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


///////////////////////////////////////////////////////////////////////////

void Identification()
{
  cout << "ASTRUCT " << szVersion << endl
       << "Alignement d'une structure de dossiers sur disque\n\n";
}

inline void Usage()
{
  cout << "Usage: ASTRUCT [/?] [/t] [/v] [/%] [/l] [/p] [/d] [/.] source destination\n"
           << "Source et destination sont deux chemins absolus de dossiers\n"
           << "Options: /t D‚sactive le contr“le de diff‚rence de temps\n"
           << "         /v Mode verbose, le d‚tail de l'analyse est affich‚\n"
           << "         /% Ne copie pas fichiers et dossiers commen‡ant par %\n"
           << "         /l Cr‚e des dossiers et des fichiers avec un nom en minuscules\n"
           << "         /p Pause finale en cas de problŠme pour revoir les erreurs\n"
           << "         /d Ne copie pas les volumes DriveSpace (Drvspace.*)\n"
           << "         /. Transforme un point en 1Šre position en _\n";
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
       << "Date fichier:     " << __TIMESTAMP__ << '\n'
       << "Compilateur:      MSC " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1996-2001 P.VIOLENT";
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

  if (iErr==112)  // Espace insuffisant sur disque: on s'arrête sur le message
    Pause(0);
}


void CopieFichier(const CString &sNomficSource, const CString &sNomficDest)
{
  char szNomficDestLower[260];

  if (bOptionL)
  {
	const char *s = sNomficDest;
	char *d = szNomficDestLower;
    while (*d++ = tolower(*s++))
	  ;
  }
  else
	strcpy(szNomficDestLower, sNomficDest);

  cout << "copy " << Guillemets(OEM(sNomficSource)) << " " << Guillemets(OEM(szNomficDestLower));
  cout.flush();		// La copie peut être longue, au travers de Numéris...

  if (!CopyFile(sNomficSource, szNomficDestLower, FALSE))
  {
    AfficheErrSysteme("copy "+Guillemets(OEM(sNomficSource))+" "+Guillemets(OEM(szNomficDestLower)));
    iNbNoCopy++;
  }
  else
    cout << endl;
  iNbCopy++;
}


void EffaceFichier(const CString &sNomfic)
{
  cout << "del " << Guillemets(OEM(sNomfic));

  // On supprime les attributs qui empêchent l'effacement
  int iAttrib = GetFileAttributes(sNomfic);
  if ((iAttrib&FILE_ATTRIBUTE_HIDDEN) || (iAttrib&FILE_ATTRIBUTE_SYSTEM) || (iAttrib&FILE_ATTRIBUTE_READONLY))
    SetFileAttributes(sNomfic, FILE_ATTRIBUTE_NORMAL);

  if (!DeleteFile(sNomfic))
    AfficheErrSysteme("del "+Guillemets(OEM(sNomfic)));

  cout << endl;
  iNbDel++;
}


// Efface récursivement un répertoire, même non vide
void EffaceDir(const CString &sNomdir)
{
  WIN32_FIND_DATA wfd;
  HANDLE          hFile;
  DWORD           err;
  CString sModele, sAEffacer;

  // On efface tout ce qui traîne dans le répertoire
  sModele = sNomdir + "\\*";
  if ((hFile = FindFirstFile((const char *)sModele, &wfd)) == INVALID_HANDLE_VALUE)
  {
	// Pas de fichier dans le répertoire: pas de problème !
	if (GetLastError()==2) goto suiteEffaceDir;

	cout << "EffaceDir: FindFirstFile " << Guillemets(OEM(sModele));
	AfficheErrSysteme("EffaceDir: FindFirstFile "+Guillemets(OEM(sModele)));
	return;
  }
  for(;;)
  {
	if (strcmp(wfd.cFileName, ".") && strcmp(wfd.cFileName, ".."))
	{
	  sAEffacer = sNomdir + "\\" + wfd.cFileName;
	  int iAttrib = GetFileAttributes(sAEffacer);
	  if (iAttrib>=0)
		if (iAttrib&FILE_ATTRIBUTE_DIRECTORY)
		  EffaceDir(sAEffacer);
		else
		  EffaceFichier(sAEffacer);
	}

	if (!FindNextFile((HANDLE)hFile, &wfd))
	{
      err = GetLastError();
      if (err==ERROR_NO_MORE_FILES)
	    break;
	  cout << "EffaceDir: FindNextFile " << Guillemets(OEM(sModele));
	  AfficheErrSysteme("EffaceDir: FindNextFile "+Guillemets(OEM(sModele)));
	  break;
	}

  }
  if (!FindClose((HANDLE)hFile))
  {
	cout << "EffaceDir: FindClose ";
	return;
  }

suiteEffaceDir:
  cout << "rd " << Guillemets(OEM(sNomdir));
  cout.flush();
  
  int bResult;
  bResult = RemoveDirectory(sNomdir);
  if (!bResult)
  {	
	// Sous 2000, un répertoire avec l'attribut lecture seule ne peut pas être effacé...
	int iAttrib = GetFileAttributes(sNomdir);
	if (iAttrib&FILE_ATTRIBUTE_READONLY)
	{ SetFileAttributes(sNomdir, FILE_ATTRIBUTE_NORMAL);
	  bResult = RemoveDirectory(sNomdir);
	}
	if (!bResult)
      AfficheErrSysteme("rd "+Guillemets(OEM(sNomdir)));
  }
  cout << endl;
}


void CreeDir(const CString &sNomdir)
{
  char szNomdirLower[260];

  if (bOptionL)
  {	const char *s = sNomdir;
	char *d = szNomdirLower;
    while (*d++ = tolower(*s++))
	  ;
  }
  else
	strcpy(szNomdirLower, sNomdir);

  if (szNomdirLower[0]=='.')
	szNomdirLower[0] = '_';

  cout << "md " << Guillemets(OEM(szNomdirLower));
  cout.flush();
  if (!CreateDirectory(szNomdirLower, NULL))
    AfficheErrSysteme("md "+Guillemets(OEM(szNomdirLower)));
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


// Compare deux champs de type FILETIME
// La comparaison est arrondie à deux secondes, puisque le filesystem FAT
// ne dispose que de cette résolution (alors qu'un fichier en réseau sur un FS Unix
// a une date de modif à la seconde près)
// La résolution d'un FILETIME est de 100ns
int cmpFileTime(FILETIME *pft1, FILETIME *pft2)
{
  __int64 t1 = (((__int64)pft1->dwHighDateTime)*0x100000000i64+(__int64)(pft1->dwLowDateTime))/10000000;
  __int64 t2 = (((__int64)pft2->dwHighDateTime)*0x100000000i64+(__int64)(pft2->dwLowDateTime))/10000000;

  return (t2-t1<-2) || (t2-t1>2);
}


// Réalise l'alignement récursif du répertoire sPathS/sPathD relatif à
// sSource et sDest. sPathD est identique à sPathS mais ajusté en fonction
// des caractéristiques de la cible (ex: . en tête remplacé par un _)
void AStruct(CString sPathS, CString sPathD)
{
  WIN32_FIND_DATA wfd;
  HANDLE          hFile;
  DWORD           err;
  CString		  sModele;
  int			  i;
  Dir			  dirSource, dirDest;
  int			  iNbSource=0, iNbDest=0;

  // 0. On énumère les fichiers de la source et de la destination
  // Cette opération n'a lieu qu'une seule fois, pour minimiser le nombre
  // d'appels systeme

  // D'abord le répertoire source
  sModele = sSource + sPathS + "*";
  if ((hFile = FindFirstFile((const char *)sModele, &wfd)) == INVALID_HANDLE_VALUE)
  {
	cout << "AStruct: FindFirstFile " << Guillemets(OEM(sModele));
	AfficheErrSysteme("AStruct: FindFirstFile "+Guillemets(OEM(sModele)));
	return;
  }
  for(;;)
  {
	if (strcmp(wfd.cFileName, ".") && strcmp(wfd.cFileName, "..") &&
	    (!bNoPercent || wfd.cFileName[0]!='%') &&
	    (!bNoUnderscore || wfd.cFileName[0]!='_') &&
		(!bOptionD || strnicmp(wfd.cFileName, "Drvspace.", 9))
	   )
	{
	  dirSource.Ajoute(wfd);
	  iNbSource++;
	}
	if (!FindNextFile((HANDLE)hFile, &wfd))
	{
      err = GetLastError();
      if (err==ERROR_NO_MORE_FILES)
	    break;
	  cout << "AStruct: FindNextFile " << Guillemets(OEM(sModele));
	  AfficheErrSysteme("AStruct: FindNextFile "+Guillemets(OEM(sModele)));
	  break;
	}
  }
  FindClose((HANDLE)hFile);
  // Pas de test sur le résultat, plante de façon erratique


  // Puis le répertoire destination
  sModele = sDest + sPathD + "*";
  if ((hFile = FindFirstFile((const char *)sModele, &wfd)) == INVALID_HANDLE_VALUE)
  {
	if (GetLastError()!=2)	// File not found est Ok !
	{
	  cout << "AStruct: FindFirstFile(dest) " << Guillemets(OEM(sModele));
	  AfficheErrSysteme("AStruct: FindFirstFile(dest) "+Guillemets(OEM(sModele)));
	  return;
	}
  }
  if (hFile!=INVALID_HANDLE_VALUE)
  {
	for(;;)
	{
	  if (strcmp(wfd.cFileName, ".") && strcmp(wfd.cFileName, ".."))
	  {
		dirDest.Ajoute(wfd);
		iNbDest++;
	  }
	  if (!FindNextFile((HANDLE)hFile, &wfd))
	  {
		err = GetLastError();
		if (err==ERROR_NO_MORE_FILES)
		  break;
		cout << "AStruct: FindNextFile(dest) " << Guillemets(OEM(sModele));
		AfficheErrSysteme("AStruct: FindNextFile(dest) "+Guillemets(OEM(sModele)));
		break;
	  }

	}
	FindClose((HANDLE)hFile);
  }

  // 1. On copie les fichiers source qui n'existent pas sur la destination,
  // ou qui sont plus récents sur la source. On crée les dossiers nécessaires
  // sur la destination
  for (i=0 ; i<iNbSource ; i++)
  {
	WIN32_FIND_DATA *pSource = &dirSource[i];

	// Conversion systématique du . initial de la source en _ sur la destination
	CString sSourceTrans;
	if (pSource->cFileName[0]=='.')
	  sSourceTrans = "_" + CString(pSource->cFileName+1);
	else
	  sSourceTrans = pSource->cFileName;

    WIN32_FIND_DATA *pDest = dirDest.pdirFind(sSourceTrans);
	CString sFullSource = sSource + sPathS + pSource->cFileName;
	CString sFullDest = sDest + sPathD + sSourceTrans;

	if (pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)
	{
	  iNbDirTotal++;

	  // Les dossiers HIDDEM+SYSTEM tels que \RECYCLED ne sont pas créés ni copiés
	  if ((pSource->dwFileAttributes&FILE_ATTRIBUTE_HIDDEN)==0 || (pSource->dwFileAttributes&FILE_ATTRIBUTE_SYSTEM)==0)
	  {
		if (pDest==NULL)
		  CreeDir(sFullDest);
	  }
	}
	else	// fichier
	{
	  BOOL bACopier = FALSE;

	  iNbFicTotal++;

	  if (pDest==NULL)
	  {
		if (bVerbose)
		  cout << Guillemets(OEM(sFullSource)) << ": " << sSourceTrans << ": inexistant sur la cible\n";
		bACopier = TRUE;
	  }
	  else
		if (cmpFileTime(&pSource->ftLastWriteTime, &pDest->ftLastWriteTime) ||
		    size64(pSource->nFileSizeLow,pSource->nFileSizeHigh) != size64(pDest->nFileSizeLow,pDest->nFileSizeHigh))
		{
		  bACopier = TRUE;

		  if (bVerbose)
		  {
			if (cmpFileTime(&pSource->ftLastWriteTime, &pDest->ftLastWriteTime))
			{
              cout << Guillemets(OEM(sFullSource)) << ": dates diff‚rentes\n";
			  cout << "source:      " << pSource->ftLastWriteTime << endl; // << " " << ctime(&ts) << endl;
			  cout << "destination: " << pDest->ftLastWriteTime << endl; // << " " << ctime(&td) << endl;
			}

			if (size64(pSource->nFileSizeLow,pSource->nFileSizeHigh) != size64(pDest->nFileSizeLow,pDest->nFileSizeHigh))
			{
              cout << Guillemets(OEM(sFullSource)) << ": tailles diff‚rentes\n";
			  cout << "source:      " << size64(pSource->nFileSizeLow, pSource->nFileSizeHigh) << endl;
			  cout << "destination: " << size64(pDest->nFileSizeLow, pDest->nFileSizeHigh) << endl;
			}
		  }
		  // Si le fichier cible qui n'est pas à jour a des attributs bizzares,
		  // on les efface, pour éviter un échec de la copie
		  if ((pDest->dwFileAttributes&FILE_ATTRIBUTE_HIDDEN) || 
			  (pDest->dwFileAttributes&FILE_ATTRIBUTE_SYSTEM) || 
			  (pDest->dwFileAttributes&FILE_ATTRIBUTE_READONLY))
			SetFileAttributes(sFullDest, FILE_ATTRIBUTE_NORMAL);
		}

	  if (bACopier)
		CopieFichier(sFullSource, sFullDest);
	}
  }


  // 2. On élimine les fichiers et les dossiers en trop sur la destination
  for (i=0 ; i<iNbDest ; i++)
  {
    WIN32_FIND_DATA *pSource = dirSource.pdirFind(dirDest[i].cFileName);
	WIN32_FIND_DATA *pDest = &dirDest[i];

	// Conversion du _ initial de la destination en . sur la source
	if (pSource==NULL && dirDest[i].cFileName[0]=='_')
	{
	  CString sSourceTrans;
	  sSourceTrans = "." + CString(&dirDest[i].cFileName[1]);
	  pSource = dirSource.pdirFind(sSourceTrans);
	}

	if (pSource==NULL ||	// N'existe plus sur la source
		((pDest->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY) && (pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)==0) ||  // Dossier sur la cible mais fichier sur la source
		((pDest->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)==0 && (pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY))	  // Fichier sur la cible mais dossier sur la source
	   )
	{
	  CString sAEffacer = sDest + sPathD + pDest->cFileName;
	  if (pDest->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)	// Dossier sur la cible
		EffaceDir(sAEffacer);
	  else							// Fichier
		EffaceFichier(sAEffacer);
	}
  }



  // 3. On aligne récursivement les sous-répertoires de la source
  for (i=0 ; i<iNbSource ; i++)
  {
	WIN32_FIND_DATA *pSource = &dirSource[i];
	// On ignore les répertoires qui ont à la fois les attributs HIDDEN et SYSTEM,
	// ce qui est en particulier le cas de la corbeille (répertoire \RECYCLED)
	if ((pSource->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY) && ((pSource->dwFileAttributes&FILE_ATTRIBUTE_HIDDEN)==0 || (pSource->dwFileAttributes&FILE_ATTRIBUTE_SYSTEM)==0))
	{
	  CString sDirTrans;

	  sDirTrans = pSource->cFileName;
	  if (sDirTrans[0]=='.')
		sDirTrans = "_" + CString(1+(const char *)sDirTrans);
	  AStruct(sPathS + pSource->cFileName + "\\", sPathD + sDirTrans + "\\");
	}
  }
}



// Fonction empirique pour déterminer s'il existe une différence d'heure entre la source et la destination
// Nécessite que le répertoire source soit accessible en écriture...
// On évacue les différences de précision par un arrondi à un temps multiple de 2 secondes
void DetermineTimeOffset()
{
  CString      sNomfic("$$--$$--.$-$");
  CString      sPathSource, sPathDest;
  time_t       tSource, tDest;
  int		   h;
  struct _stat buf;

  sPathSource = sSource+sNomfic;
  sPathDest = sDest+sNomfic;
  h = open(sPathSource, O_WRONLY|O_CREAT, 0777);

  // Si la source n'est pas accessible en écriture, on dégage silencieusement
  if (h<0) return;

  if (h<0)
  { cerr << "astruct (tGetTime): Echec à la création de " << Guillemets(OEM(sPathSource)) << ": Erreur " << errno << ": " << sys_errlist[errno] << endl;
    Pause(0);
    exit(0);
  }
  close(h);
  h = _stat(sPathSource, &buf);
  if (h<0)
  { cerr << "astruct (tGetTime): Echec au stat " << Guillemets(OEM(sPathSource)) << ": Erreur " << errno << ": " << sys_errlist[errno] << endl;
    unlink(sPathSource);
    Pause(0);
    exit(0);
  }
  tSource = buf.st_mtime; 		

  CopyFile(sPathSource, sPathDest, FALSE);
  h = _stat(sPathDest, &buf);
  if (h<0)
  { cerr << "astruct (tGetTime): Echec au stat " << Guillemets(OEM(sPathDest)) << ": Erreur " << errno << ": " << sys_errlist[errno] << endl;
    unlink(sPathSource);
    unlink(sPathDest);
	Pause(0);
	exit(0);
  }
  tDest = buf.st_mtime;

  unlink(sSource+sNomfic);
  unlink(sDest+sNomfic);

  if (abs(tDest-tSource)>2)
  {
    cout << "Attention, diff‚rence de temps entre source et destination\n"
         << "Cette version de astruct ne gŠre pas cette situation.\n"
         << "L'option -t d‚sactive ce test.\n";
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

int main(int argc, char **argv)
{
  int i;

  BOOL bProbleme = FALSE;
  BOOL bOptionT = FALSE;

  // On traite les options lors d'une première passe
  // de façon à ne pas rendre l'ordre des options significatif
  for (i=1 ; i<argc ; i++)
  {
    if (stricmp(argv[i], "/v")==0 || stricmp(argv[i], "-v")==0)
	  bVerbose = TRUE;
	else if (stricmp(argv[i], "/t")==0 || stricmp(argv[i], "-t")==0)
	  bOptionT = TRUE;
	else if (stricmp(argv[i], "/p")==0 || stricmp(argv[i], "-p")==0)
	  bPauseFinale = TRUE;
	else if (strcmp(argv[i], "/%")==0 || strcmp(argv[i], "-%")==0)
	  bNoPercent = TRUE;
	else if (strcmp(argv[i], "/_")==0 || strcmp(argv[i], "-_")==0)
	  bNoUnderscore = TRUE;
	else if (stricmp(argv[i], "/l")==0 || stricmp(argv[i], "-l")==0)
	  bOptionL = TRUE;
	else if (stricmp(argv[i], "/d")==0 || stricmp(argv[i], "-D")==0)
	  bOptionD = TRUE;
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
	  bProbleme = TRUE;
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
		sSource = argv[i];
	  else if (iRangArg==1)
		sDest = argv[i];
	  iRangArg++;
	}
  }

  if (iRangArg!=2)
  {
    cerr << "astruct: La source et la destination doivent ƒtre pr‚cis‚es\n";
	bProbleme = TRUE;
  }
  else
  {
	if (!bOkDir(sSource))
	{
	  cerr << "astruct: \"" << OEM(sSource) << "\" n'existe pas ou est inaccessible\n";
	  bProbleme = TRUE;
	}

	if (!bOkDir(sDest))
	{
	  cerr << "astruct: \"" << OEM(sDest) << "\" n'existe pas ou est inaccessible\n";
	  bProbleme = TRUE;
	}
  }

  if (bProbleme)
	goto fin;

  if (sSource.Right(1)!="\\")
	sSource += "\\";
  if (sDest.Right(1)!="\\")
	sDest += "\\";

  cerr << "astruct " << sSource << " -> " << sDest << endl;
  if (!bOptionT)
    DetermineTimeOffset();
  AStruct("", "");

  cerr << iNbDirTotal << " dossier" << s(iNbDirTotal) << " analys‚" << s(iNbDirTotal) << ", " << iNbFicTotal << " fichier" << s(iNbFicTotal) << " analys‚" << s(iNbFicTotal) << endl
       << iNbCopy << " fichier" << s(iNbCopy) << " copi‚" << s(iNbCopy) << ", " << iNbDel << " fichier" << s(iNbDel) << " effac‚" << s(iNbDel) << endl;
  if (iNbNoCopy)
    cerr << iNbNoCopy << " problŠme" << s(iNbNoCopy) << " lors de la copie" << endl;

fin:
  if (bVerbose || (iNbNoCopy && bPauseFinale))
	Pause(1);

  return 0;
}
