
/*  CHAINE.C	1.20 P.Violent
**
**
**  Routines:
**  ---------
**  instring	Teste la pr�sence d'un caract�re dans une cha�ne
**  maj 	Conversion -> majuscules
**  majAZ	Conversion -> majuscules non accentu�es
**  minaz	Conversion -> minuscules non accentu�es
**  iValid	Validation d'un caract�re par rapport � un mod�le
*/

#include <stdio.h>
#include <ctype.h>
#include <clib.ref>
#include "biberc.ref"


/* instring Rend vrai ou faux selon que le caract�re est dans la cha�ne
**	    ch ou pas. (En fait, renvoie le premier trouv�, entre le
**	    caract�re et la fin de cha�ne)
*/

int instring(ch,car)
UC car;
UC *ch;
{
  while(*ch && *ch!=car) ch++;
  return *ch;
}

/*====================================================================*/

/* maj	Convertit un caract�re en majuscule (si c'est possible) en
**	conservant le plus possible les accents. Ainsi, le caract�re
**	� est converti en �, alors que �, �, � et e sont convertis
**	en E.
**	Si la conversion n'est pas possible, le caract�re est rendu
**	tel quel. (ex: '$')
*/

static UC tabmaj[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177���A�A��EEEIII�����O�OUUY������FAIOU��";

UC maj(c)
UC c;
{
  return (c>='a' && c<=165)?(int)tabmaj[c-'a']:c;
} /* maj */

/*====================================================================*/

/* majAZ Convertit un caract�re en majuscule (si c'est possible) entre
**	 A et Z, c'est � dire non accentu�e.  Ainsi, toutes les lettres
**	 suivantes sont converties en 'E':  e � � � � �
**	 Si la conversion n'est pas possible, le caract�re est rendu
**	 tel quel. (ex: '$')
*/

static UC tabmajAZ[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177CUEAAAACEEEIIIAAE��OOOUUYOU�����AIOUNN";

UC majAZ(c)
UC c;
{
  return (c>='a' && c<=165)?(int)tabmajAZ[c-'a']:c;
} /* majAZ */

/*====================================================================*/

/* minaz Convertit un caract�re en minuscule (si c'est possible) entre
**	 a et z, c'est � dire non accentu�e.  Ainsi, toutes les lettres
**	 suivantes sont converties en 'e':  E � � � � �
**	 Si la conversion n'est pas possible, le caract�re est rendu
**	 tel quel. (ex: '$')
*/

static UC tabminaz[38]=
  "cueaaaaceeeiiiaae��ooouuyou�����aiounn";

UC minaz(c)
UC c;
{
  if (c>='A' && c<='Z') return c+32;
  return (c>=128 && c<=165)?(int)tabminaz[c-128]:c;

} /* minaz */

/*====================================================================*/

/* iValid  Cette fonction v�rifie si un caract�re correspond bien � un
**	   mod�le donn�, et fait �ventuellement une conversion.
**
**	Param�tres:
**	-----------
**	modele: Un char* sur une cha�ne de caract�res. D�crit plus loin.
**	c:	Le caract�re � tester
**	ptrok:	Un int*, remplit la zone point�e avec vrai si le caract�re
**		correspond au mod�le (ou si il a pu �tre converti), faux
**		sinon.
**
**	Retour:
**	-------
**	Le caract�re, �ventuellement converti. Si *ptrok est � faux, le
**	caract�re c est retourn� tel quel.
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
  else if (c>=128 && c<=165) d='�';
  else if (c>='0' && c<='9') d='1';
  else d=c;

  if (*ptrok = instring(modele,(char)c)|instring(modele,(char)d)|instring(modele,'X'))
    return c;

  t=0;
  if (instring(modele,'A')) t+=1;
  if (instring(modele,'a')) t+=2;
  if (instring(modele,'�')) t+=4;

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
