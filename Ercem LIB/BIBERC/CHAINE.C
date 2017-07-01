/*  CHAINE.C	1.20 P.Violent
**
**  Routines:
**  ---------
**  instring	Teste la pr‚sence d'un caractŠre dans une chaŒne
**  maj 	Conversion -> majuscules
**  majAZ	Conversion -> majuscules non accentu‚es
**  minaz	Conversion -> minuscules non accentu‚es
*/

#include <stdio.h>
#include <ctype.h>
#include <clib.ref>
#include "biberc.h"

#include "import.h"


/* instring Rend vrai ou faux selon que le caractŠre est dans la chaŒne
**	    ch ou pas. (En fait, renvoie le premier trouv‚, entre le
**	    caractŠre et la fin de chaŒne)
*/

int instring(const UC *ch, UC car)
{
  while(*ch && *ch!=car) ch++;
  return *ch;
}

/*====================================================================*/

/* maj	Convertit un caractŠre en majuscule (si c'est possible) en
**	conservant le plus possible les accents. Ainsi, le caractŠre
**	‚ est converti en , alors que ˆ, Š, ‰ et e sont convertis
**	en E.
**	Si la conversion n'est pas possible, le caractŠre est rendu
**	tel quel. (ex: '$')
*/

static UC tabmaj[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177€šAŽA€EEEIIIŽ’’O™OUUY™š›œžFAIOU¥¥";

UC maj(UC c)
{
  return (UC)((c>='a' && c<=165)?(int)tabmaj[c-'a']:c);
} /* maj */

/*====================================================================*/

/* majAZ Convertit un caractŠre en majuscule (si c'est possible) entre
**	 A et Z, c'est … dire non accentu‚e.  Ainsi, toutes les lettres
**	 suivantes sont converties en 'E':  e ‚ ˆ ‰ Š 
**	 Si la conversion n'est pas possible, le caractŠre est rendu
**	 tel quel. (ex: '$')
*/

static UC tabmajAZ[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177CUEAAAACEEEIIIAAE’‘OOOUUYOU›œžŸAIOUNN";

UC majAZ(UC c)
{
  return (UC)((c>='a' && c<=165)?(int)tabmajAZ[c-'a']:c);
} /* majAZ */

/*====================================================================*/

/* minaz Convertit un caractŠre en minuscule (si c'est possible) entre
**	 a et z, c'est … dire non accentu‚e.  Ainsi, toutes les lettres
**	 suivantes sont converties en 'e':  E ‚ ˆ ‰ Š 
**	 Si la conversion n'est pas possible, le caractŠre est rendu
**	 tel quel. (ex: '$')
*/

static UC tabminaz[38]=
  "cueaaaaceeeiiiaae’‘ooouuyou›œžŸaiounn";

UC minaz(UC c)
{
  if (c>='A' && c<='Z') return (UC)(c+32);
  return (UC)((c>=128 && c<=165)?(int)tabminaz[c-128]:c);

} /* minaz */
