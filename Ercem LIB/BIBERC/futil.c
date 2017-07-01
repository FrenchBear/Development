// futil.c
// Fonctions d'informations sur les fichiers
// 24/05/95 PV

#include "biberc.h"
#include "import.h"

#include <fcntl.h>
#include <sys/stat.h>

// access !
#if defined(DOS) || defined(WIN32)
#include <io.h>
#endif
#if defined(UNIX)
#include <unistd.h>
#endif

//====================================================================
// Test de l'existence d'un fichier

int bFileExist(const char *szNomfic)
{
  return access(szNomfic, 0)==0;
/*
  int h = open(szNomfic,0);
  if (h<0) return 0;
  close(h);
  return 1;
*/
}

//====================================================================
// Retourne la taille d'un fichier
// 0 si le fichier est vide ou n'existe pas

long lFileSize(const char *szFullPath)
{
  long l;

#ifdef UNIX
#define O_BINARY 0
#endif
  
  int h = open(szFullPath, O_RDONLY|O_BINARY);
  if (h<0) return 0;
  
#ifdef UNIX
  lseek(h, 0, SEEK_END);
  l = tell(h);
#else
  l = _filelength(h);
#endif

  close(h);

  return l;
}

//====================================================================
// Retourne la date de dernière modification d'un fichier (date Unix)
// Retour <0 si échec au stat

time_t tFileDateMAJ(const char *szPath)
{
  int i;
  struct stat sb;

  i = stat(szPath, &sb);
  if (i<0) return i;
  return sb.st_mtime;

#ifdef OLDDOS
  int fh; 
  union
  {
    unsigned old_time;
    struct
    {
      unsigned deuxsec: 5;
      unsigned minutes: 6;
      unsigned heures:  5; 
    } dostime;
  } utime;

  union
  {    
    unsigned old_date;
    struct
    {
      unsigned day:   5;
      unsigned month: 4;
      unsigned year:  7; 
    } dosdate;
  } udate;
  
  /* Open file with _dos_open function */
  if( _dos_open( szFullPath, _O_RDONLY, &fh ) != 0 )
    return 0;
  _dos_getftime( fh, &udate.old_date, &utime.old_time );
  _dos_close( fh );
  
  return unixtimeex(udate.dosdate.day, udate.dosdate.month, udate.dosdate.year+1980, utime.dostime.heures, utime.dostime.minutes, 2*utime.dostime.deuxsec);
#endif
}
