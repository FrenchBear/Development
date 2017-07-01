// pdel.cpp
// Efface des fichiers et les place dans la corbeille
// Usage: pdel [/s] répertoire|fichier|motif...
// Option /s: récursif, uniquement dans les répertoires énumérés
// Motif: utilise * et/ou ? sans /
// 09/07/96 PV

#include <Windows.h>
#include <iostream.h>
#include <io.h>
#include <sys\stat.h>	  // _stat
#include <direct.h>		  // _getcwd
#include <crtdbg.h>
#include "CString.h"

class Collection
{
private:
  int iNbNom;
  CString **tsNom;

public:
  Collection() { iNbNom=0; tsNom=NULL; }
  ~Collection() { if (tsNom) free(tsNom); }

  void Ajoute(const CString &sNom)
  {
	tsNom = (CString **)realloc(tsNom, (iNbNom+1)*sizeof(CString *));
	tsNom[iNbNom] = new CString(sNom);
	iNbNom++;
  }

  int iCount() { return iNbNom; }

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

int iNbDel = 0;

///////////////////////////////////////////////////////////////////////////

void Identification()
{
  cout << "PDEL 1.0\n"
       << "Efface des fichiers et les place dans la corbeille\n\n";
}

inline void Usage()
{
  cout << "Usage: PDEL [/?] [/S] [/v] Dossier|Fichier|Motif\n"
           << "Les dossiers sont les points de d‚part de la recherche r‚cursive si l'option /s est utilis‚e. Par d‚faut: dossier courant\n"
           << "Les motifs sont d‚finis avec les caractŠres joker * et ? (exemple: *.bak)\n"
		   << "Options: /v: Mode verbose\n"
                   << "         /s: Mode r‚cursif\n"
		   << "         /t: Mode test, l'effacement n'est pas fait\n";
}

inline void Info()
{
  cout << "Fichier:          " << __FILE__  << '\n'
	   << "Date compilation: " << __DATE__ << ' ' << __TIME__ << '\n'
       << "Date fichier:     " << __TIMESTAMP__ << '\n'
       << "Compilateur:      MSC " << _MSC_VER << '\n'
	   << "Copyright:        " << "(c) 1996 P.VIOLENT";

}

// Efface un fichier et le place dans la corbeille
int EffaceVersCorbeille(CString sNomfic)
{
  // On fait terminer le nom de fichier par \0\0
  int l = sNomfic.GetLength();
  char *szNom = (char *)malloc(l+2);
  strcpy(szNom, sNomfic);
  szNom[l+1] = 0;

  SHFILEOPSTRUCT s;

  s.hwnd = NULL; 
  s.wFunc = FO_DELETE;
  s.pFrom = szNom;
  s.pTo = NULL;
  s.fFlags = FOF_ALLOWUNDO | FOF_NOCONFIRMATION | FOF_SILENT;
  s.fAnyOperationsAborted = TRUE;
  s.hNameMappings = NULL;
  s.lpszProgressTitle = "Effacement"; // Inutile, il n'y a pas de fenêtre

  return SHFileOperation(&s);
}


void Efface1Fichier(const CString &sChemin)
{
  char szCheminOEM[256];
  CharToOemBuff(sChemin, szCheminOEM, sChemin.GetLength()+1);
  cout << szCheminOEM << endl;

  EffaceVersCorbeille(sChemin);

  iNbDel++;
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
  for (m=0 ; m<colMotif.iCount() ; m++)
  {
	sModele = sStartPath + colMotif[m];
	hf = _findfirst((const char *)sModele, &fd);
	if (hf>0)
	  do
	  {
		if ((fd.attrib&_A_SUBDIR)==0)
		  Efface1Fichier(sStartPath+fd.name);
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

  /*
  // Spécial pour développeurs avec MSVC !!!
  AjouteMotif("*.pdb");
  AjouteMotif("*.sbr");
  AjouteMotif("*.pch");
  AjouteMotif("*.map");
  AjouteMotif("*.idb");
  AjouteMotif("*.obj");
  AjouteMotif("*.bsc");
  AjouteMotif("*.ilk");
  */

  BOOL bProbleme = FALSE;
  BOOL bVerbose = FALSE;

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
	  cerr << "pdel: Option " << argv[i] << " inconnue\n";
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
        cerr << "pdel: Le motif '" << szAnsiOpt << "' contient un caractŠre interdit (:, \\ ou /)\n";
		bProbleme = TRUE;
	  }
	  else
		colMotif.Ajoute(szAnsiOpt);
	}
	else
	{
	  struct _stat sb;
	  if (_stat(szAnsiOpt, &sb)<0)
	  {
		// Un fichier inexistant sans chemin absolu est accepté en mode récursif
		if (!bRecursif || strchr(szAnsiOpt, '\\') || strchr(szAnsiOpt, ':'))
		{
		  cerr << "pdel: '" << szAnsiOpt << "' n'est ni un fichier ni un dossier existant\n";
		  bProbleme = TRUE;
		}
		else
		  colMotif.Ajoute(szAnsiOpt);
	  }
	  else
	  {
	    if ((sb.st_mode&_S_IFDIR)==_S_IFDIR)
		  colRepertoire.Ajoute(szAnsiOpt);
		else if (strchr(szAnsiOpt, '\\')==0 && strchr(szAnsiOpt, ':')==0)
		  colMotif.Ajoute(szAnsiOpt);
		else
		  colFichierAbsolu.Ajoute(szAnsiOpt);
	  }
	}
  }

  if (colMotif.iCount()==0 && colFichierAbsolu.iCount()==0)
  {
    cerr << "pdel: Aucun fichier ni aucun motif valide de pr‚cis‚\n";
	bProbleme = TRUE;
  }

  if (bProbleme)
	exit(1);

  // Si on n'a précisé aucun répertoire on part du répertoire courant
  if (colRepertoire.iCount()==0 && bRecursif)
  {
	char szCurrentPath[256];
    _getcwd(szCurrentPath, sizeof(szCurrentPath));
	colRepertoire.Ajoute(szCurrentPath);
  }

  if (bVerbose)
  {
	if (bRecursif)
	  cout << "Recherche r‚cursive\n";
	else
	  cout << "Recherche non r‚cursive\n";

	for (i=0 ; i<colMotif.iCount() ; i++)
	  cout << "Motif/Fichier: '" << colMotif[i] << "'\n";
	for (i=0 ; i<colRepertoire.iCount() ; i++)
	  cout << "R‚pertoire: '" << colRepertoire[i] << "'\n";
	for (i=0 ; i<colFichierAbsolu.iCount() ; i++)
	  cout << "Fichier absolu: '" << colFichierAbsolu[i] << "'\n";
  }

  for (i=0 ; i<colRepertoire.iCount() ; i++)
	Analyse(colRepertoire[i]);
  for (i=0 ; i<colFichierAbsolu.iCount() ; i++)
	Efface1Fichier(colFichierAbsolu[i]);

  if (bVerbose)
  {
	if (iNbDel)
	  cout << iNbDel;
	else
	  cout << "Aucun";
	cout << " fichier";
	if (iNbDel>>1) cout << "s";
	cout << " effac‚";
	if (iNbDel>>1) cout << "s";
	cout << "\n";
  }

  return 0;
}
