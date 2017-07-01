/* ierr.c
** Fonction par d‚faut de traitement d'erreurs
** et affectation par d‚faut du poiteur d'erreur
** 15/11/94 FG	Première version
**  3/12/94	PV	Sortie de ErrorLog de esecr.c; prototypage correct
*/

#include <stdio.h>
#include <stdlib.h>		/* getenv, atoi */
#include <time.h>		/* time, localtime */

#include "ierr.h"

#include "import.h"


/* D‚finition de la fonction d'erreur de la bibliothŠque */
int fiErrDefault(char *szNomApp, char *szFichier, int iLigne, char *szMessage, int iCode)
{
  printf("Erreur dans prog %s fichier %s ligne %d code %d\n", szNomApp, szFichier, iLigne, iCode);
  if(szMessage!=NULL) printf("Message = %s\n",szMessage);
  return 0;
}

/* On affecte la fonction d'erreur globale … fiErrDefault */
int (*IERR)() = fiErrDefault;


void ErrorLog(const char *szApp, const char *szRoutine, const char *szTitre, const char *szMessage)
{
  FILE *f;
  struct tm *lt;
  long l;
  static char *tty;
  static int utilisateur;
  static int premierpassage = 1;

  if (premierpassage)
  { premierpassage=0;
    tty = getenv("TRA_ID");
    if(tty==NULL) utilisateur=0; else utilisateur=atoi(tty);

    tty=getenv("TTY");
    if(tty==NULL) tty="??";
  }

  l = time(0L);
  lt = localtime(&l);

  f = fopen("/usr/log/error.log", "a");
  fprintf(f,"%2d/%02d/%02d %2d:%02d %3d %-10.10s %-9.9s %-10.10s %s: %s\n", 
    lt->tm_mday, lt->tm_mon+1, lt->tm_year, lt->tm_hour, lt->tm_min,
    utilisateur,tty,
    szApp, szRoutine, szTitre, szMessage);
  fclose(f);
}

