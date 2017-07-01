
/*  DATE.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.0	16.IV.88	Module particulier, extrait de divers.c
**  Ver. 1.10	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 1.11	30.VII.88	Utilisation de const
**
**
**  Routines de gestion de date
**
**  Routines:
**  ---------
**  today	Date du jour en 3*2 caractŠres: 130787
**  datefr	Version fran‡aise de cdate()
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */

#include <string.h>
#include <time.h>

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "date.ref"

/*============================================================================*/
/* Variables et d‚finitions priv‚es au module */

static char ch[24];

static const char * const tabmoisus[12] =
{ "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec" };
static const char * const tabmoisfr[12] =
{ "Jan","F‚v","Mar","Avr","Mai","Jui","Jul","Ao–","Sep","Oct","Nov","D‚c" };

static const char * const tabjourus[7] =
{ "Sun","Mon","Tue","Wed","Thu","Fri","Sat" };
static const char * const tabjourfr[7] =
{ "Dim","Lun","Mar","Mer","Jeu","Ven","Sam" };

/*============================================================================*/

/* today     Rend la date du jour, 3*2 caractŠres: jour, mois & ann‚e.
*/

void today(j,m,a)
char *j,*m,*a;
{
  char *ptr;
  long l;
  int1 i,mois;

  l = time(0L);
  ptr = ctime(&l);

  mois = 0;
  for (i=0 ; i<12 && !mois ; i++)
    if (!strncmp(tabmoisus[i],ptr+4,3)) mois=i+1;

  j[0] = ptr[8];
  j[1] = ptr[9];
  m[0] = mois/10 + '0';
  m[1] = mois%10 + '0';
  a[0] = ptr[22];
  a[1] = ptr[23];

} /* today */

/*============================================================================*/

/* datefr    rend un * sur la date format ctime mais en fran‡ais
*/

char *datefr()
{
  char *p;
  long l;
  int1 i,mois,jour;

  l = time(0L);
  p = ctime(&l);

  mois = 0;
  for (i=0;i<12 && !mois;i++)
    if (!strncmp(tabmoisus[i],p+4,3)) mois=i+1;
  jour = 0;
  for (i=0;i<12 && !jour;i++)
    if (!strncmp(tabjourus[i],p,3)) jour=i+1;

  strcpy(ch,"jjj .. mmm .... ..:..");
  strncpy(ch,tabjourfr[jour-1],3);
  strncpy(ch+7,tabmoisfr[mois-1],3);
  strncpy(ch+4,p+8,2);
  strncpy(ch+11,p+20,4);
  strncpy(ch+16,p+11,5);

  return ch;

} /* datefr */

