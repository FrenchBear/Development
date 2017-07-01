// timestam.c
// Routines de manupilation de timestamp
// 12/12/94 PV	Extrait des programmes du labo
// 14/12/94 PV	JMAtoUS et UTtoJMA

#include <stdio.h>
#include <time.h>

#include "biberc.h"

#include "import.h"

//======================================================================
// Convertit une date unix (UT) en chaŒne de 20 caractŠres ann‚e
// … seconde (YS) pour Informix

char *szUTtoYS(time_t t, char szBuffer[20])
{
  struct tm *lt;

  if (t<=0) szBuffer[0] = 0;
  else
  {
	lt = localtime(&t);
	sprintf(szBuffer, "%4d-%02d-%02d %02d:%02d:%02d",
	  1900+lt->tm_year, lt->tm_mon+1, lt->tm_mday,
	  lt->tm_hour, lt->tm_min, lt->tm_sec);
  }
  return szBuffer;
}

// Op‚ration inverse de la pr‚c‚dente, convertit un YearSecond en
// UnixTime
time_t YStoUT(char *szYS)
{
  int j,m,a,h,min,s;
  if (sscanf(szYS, "%d-%d-%d %d:%d:%d", &a, &m, &j, &h, &min, &s)!=6)
	return 0;	// Date NULL
  else
	return unixtimeex(j,m,a,h,min,s);
}

//======================================================================
// Convertit une date unix (UT) en chaŒne de 11 caractŠres jj/mm/aaaa

char *szUTtoJMA(time_t t, char szBuffer[11])
{
  struct tm *lt;

  if (0==t)
	szBuffer[0] = 0;
  else
  {
	lt = localtime(&(time_t)t);
	sprintf(szBuffer, "%02d/%02d/%4d",
	  lt->tm_mday, lt->tm_mon+1, 1900+lt->tm_year);
  }
  return szBuffer;
}

// Op‚ration inverse de la pr‚c‚dente, convertit un jj/mm/aaaa en
// UnixTime
time_t JMAtoUT(char *szJMA)
{
  int j,m,a;

  if (sscanf(szJMA, "%d/%d/%d", &j, &m, &a)!=3)
	return 0;	// Date NULL
  else
	return unixtime(j,m,a);
}

