/* datefr.c
** Retourne la date et l'heure en fran‡ais dans un format
** semblable … ctime
**
**  2/09/92		Sorti de pr.c pour ˆtre inclus dans biberc
** 11/05/95 PV	szDateFrEx
*/

#include <stdio.h>
#include <string.h>
#include <time.h>

#include "import.h"

static char ch[24];

static char * tabmoisus[12] =
{ "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec" };
static char * tabmoisfr[12] =
{ "Jan","F‚v","Mar","Avr","Mai","Jui","Jul","Ao–","Sep","Oct","Nov","D‚c" };

static char * tabjourus[7] =
{ "Sun","Mon","Tue","Wed","Thu","Fri","Sat" };
static char * tabjourfr[7] =
{ "Dim","Lun","Mar","Mer","Jeu","Ven","Sam" };


char *szDateFrEx(time_t l)
{
  char *p;
  int  i,mois,jour;
  char chlocal[23];

  p = ctime(&l);

  mois = 0;
  for (i=0 ; !mois ; i++)
    if (!strncmp(tabmoisus[i],p+4,3)) mois=i+1;
  jour = 0;
  for (i=0 ; !jour ; i++)
    if (!strncmp(tabjourus[i],p,3)) jour=i+1;

  sprintf(chlocal,"%s .. %s .... ..:..",tabjourfr[jour-1],tabmoisfr[mois-1]);
  strncpy(chlocal+4,p+8,2);
  strncpy(chlocal+11,p+20,4);
  strncpy(chlocal+16,p+11,5);

  strcpy(ch,chlocal);
  return ch;

} /* szDateFrEx */


char *szDateFr()
{
  time_t l;

  l = time(0L);
  return szDateFrEx(l);
}
