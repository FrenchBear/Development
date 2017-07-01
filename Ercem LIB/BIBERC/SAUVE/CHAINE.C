
/*  CHAINE.C	1.20 P.Violent
**
**
**  Routines:
**  ---------
**  instring	Teste la prÇsence d'un caractäre dans une chaåne
**  maj 	Conversion -> majuscules
**  majAZ	Conversion -> majuscules non accentuÇes
**  minaz	Conversion -> minuscules non accentuÇes
**  iValid	Validation d'un caractäre par rapport Ö un modäle
*/

#include <stdio.h>
#include <ctype.h>
#include <clib.ref>
#include "biberc.ref"


/* instring Rend vrai ou faux selon que le caractäre est dans la chaåne
**	    ch ou pas. (En fait, renvoie le premier trouvÇ, entre le
**	    caractäre et la fin de chaåne)
*/

int instring(ch,car)
UC car;
UC *ch;
{
  while(*ch && *ch!=car) ch++;
  return *ch;
}

/*====================================================================*/

/* maj	Convertit un caractäre en majuscule (si c'est possible) en
**	conservant le plus possible les accents. Ainsi, le caractäre
**	Ç est converti en ê, alors que à, ä, â et e sont convertis
**	en E.
**	Si la conversion n'est pas possible, le caractäre est rendu
**	tel quel. (ex: '$')
*/

static UC tabmaj[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177ÄöêAéAèÄEEEIIIéèêííOôOUUYôöõúùûFAIOU••";

UC maj(c)
UC c;
{
  return (c>='a' && c<=165)?(int)tabmaj[c-'a']:c;
} /* maj */

/*====================================================================*/

/* majAZ Convertit un caractäre en majuscule (si c'est possible) entre
**	 A et Z, c'est Ö dire non accentuÇe.  Ainsi, toutes les lettres
**	 suivantes sont converties en 'E':  e Ç à â ä ê
**	 Si la conversion n'est pas possible, le caractäre est rendu
**	 tel quel. (ex: '$')
*/

static UC tabmajAZ[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177CUEAAAACEEEIIIAAEíëOOOUUYOUõúùûüAIOUNN";

UC majAZ(c)
UC c;
{
  return (c>='a' && c<=165)?(int)tabmajAZ[c-'a']:c;
} /* majAZ */

/*====================================================================*/

/* minaz Convertit un caractäre en minuscule (si c'est possible) entre
**	 a et z, c'est Ö dire non accentuÇe.  Ainsi, toutes les lettres
**	 suivantes sont converties en 'e':  E Ç à â ä ê
**	 Si la conversion n'est pas possible, le caractäre est rendu
**	 tel quel. (ex: '$')
*/

static UC tabminaz[38]=
  "cueaaaaceeeiiiaaeíëooouuyouõúùûüaiounn";

UC minaz(c)
UC c;
{
  if (c>='A' && c<='Z') return c+32;
  return (c>=128 && c<=165)?(int)tabminaz[c-128]:c;

} /* minaz */

/*====================================================================*/

/* iValid  Cette fonction vÇrifie si un caractäre correspond bien Ö un
**	   modäle donnÇ, et fait Çventuellement une conversion.
**
**	Paramätres:
**	-----------
**	modele: Un char* sur une chaåne de caractäres. DÇcrit plus loin.
**	c:	Le caractäre Ö tester
**	ptrok:	Un int*, remplit la zone pointÇe avec vrai si le caractäre
**		correspond au modäle (ou si il a pu àtre converti), faux
**		sinon.
**
**	Retour:
**	-------
**	Le caractäre, Çventuellement converti. Si *ptrok est Ö faux, le
**	caractäre c est retournÇ tel quel.
**
*/

int iValid(modele,c,ptrok)
UC c;
int *ptrok;
UC *modele;
{
  register int  d,t;

       if (c>='A' && c<='Z') d='A';
  else if (c>='a' && c<='z') d='a';
  else if (c>=128 && c<=165) d='Ö';
  else if (c>='0' && c<='9') d='1';
  else d=c;

  if (*ptrok = instring(modele,(char)c)|instring(modele,(char)d)|instring(modele,'X'))
    return c;

  t=0;
  if (instring(modele,'A')) t+=1;
  if (instring(modele,'a')) t+=2;
  if (instring(modele,'Ö')) t+=4;

  switch (t)
  {
    case 1: c=(char)majAZ(c);
	    *ptrok=((c>='A')&(c<='Z'));
	    break;
    case 2: c=(char)minaz(c);
	    *ptrok=((c>='a')&(c<='z'));
	    break;
    case 3: if (c>=128) { c=(char)minaz(c);
			  *ptrok=((c>='a')&(c<='z'));
			}
	    break;
    case 4:
    case 6: if (c<='Z') { c=(char)minaz(c);
			  *ptrok=((c>='a')&(c<='z'));
			} /* Pas de break */
    case 5:
    case 7: *ptrok |= (d=='a');
  }

  return c;

} /* valid */
