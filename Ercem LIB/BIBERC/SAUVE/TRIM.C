
/* trim.c
** Fonctions de suppression de blancs en d�but et en fin de cha�ne
** 30/12/92 PV	But�e sur i=0 !!!!!!!!!
** 10/02/94 PV	szLTrim
*/

#include <string.h>

/* szRTrim
** Efface les blancs en fin de cha�ne
*/
char *szRTrim(ptrch)
char *ptrch;
{
  register short i;

  i = (short)(strlen(ptrch) - 1);
  while (i>=0 && ptrch[i]==' ') ptrch[i--] = 0;
  return ptrch;

} /* szRTrim() */


/* szLTrim
** Efface les blancs en d�but de cha�ne
*/
char *szLTrim(ptrch)
char *ptrch;
{
  int i = 0, j = 0;

  while(ptrch[i]==' ') i++;
  if (i==0) return ptrch;
  while (ptrch[j++] = ptrch[i++]) /* nop */ ;
  return ptrch;
}
