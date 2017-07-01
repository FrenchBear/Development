
/*  CHAINE.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	3.VII.87
**  Ver. 1.01	31.VII.87	Void & Co.
**  Ver. 1.10	18.III.88	Utilisation de types.h
**  Ver. 1.10	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 1.11	30.VII.88	Utilisation de const
**
**
**  Ce fichier de routines regroupe leqs fonctions de manipulation de
**  chaŒnes de caractŠres.
**
**  Routines:
**  ---------
**  instring	Teste la pr‚sence d'un caractŠre dans une chaŒne
**  maj 	Conversion -> majuscules
**  majAZ	Conversion -> majuscules non accentu‚es
**  minaz	Conversion -> minuscules non accentu‚es
**  valid	Validation d'un caractŠre par rapport … un modŠle
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "chaine.ref"

/*============================================================================*/

/* instring	Rend vrai ou faux selon que le caractŠre est dans la chaŒne
**		ch ou pas. (En fait, renvoie le premier trouv‚, entre le
**		caractŠre et la fin de chaŒne)
*/

booleen instring(ch,car)
unsigned char car;
const unsigned char *ch;
{
  while(*ch && *ch!=car) ch++;
  return *ch;
}

/*============================================================================*/

/* maj		Convertit un caractŠre en majuscule (si c'est possible) en
**		conservant le plus possible les accents. Ainsi, le caractŠre
**		‚ est converti en , alors que ˆ, Š, ‰ et e sont convertis
**		en E.
**		Si la conversion n'est pas possible, le caractŠre est rendu
**		tel quel. (ex: '$')
*/

static const unsigned char tabmaj[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177€šAA€EEEIII’’O™OUUY™š›œFAIOU¥¥";

int2 maj(c)
int2 c;
{
  if (c<0) c+=256;
  return (c>='a' && c<='¥')?(int2)tabmaj[c-'a']:c;

} /* maj */

/*============================================================================*/

/* majAZ	Convertit un caractŠre en majuscule (si c'est possible) entre
**		A et Z, c'est … dire non accentu‚e.  Ainsi, toutes les lettres
**		suivantes sont converties en 'E':  e ‚ ˆ ‰ Š 
**		Si la conversion n'est pas possible, le caractŠre est rendu
**		tel quel. (ex: '$')
*/

static const unsigned char tabmajAZ[72]=
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\177CUEAAAACEEEIIIAAE’‘OOOUUYOU›œŸAIOUNN";

int2 majAZ(c)
int2 c;
{
  if (c<0) c+=256;
  return (c>='a' && c<='¥')?(int2)tabmajAZ[c-'a']:c;

} /* majAZ */

/*============================================================================*/

/* minaz	Convertit un caractŠre en minuscule (si c'est possible) entre
**		a et z, c'est … dire non accentu‚e.  Ainsi, toutes les lettres
**		suivantes sont converties en 'e':  E ‚ ˆ ‰ Š 
**		Si la conversion n'est pas possible, le caractŠre est rendu
**		tel quel. (ex: '$')
*/

static const unsigned char tabminaz[38]=
  "cueaaaaceeeiiiaae’‘ooouuyou›œŸaiounn";

int2 minaz(c)
int2 c;
{
  if (c<0) c+=256;
  if (c>='A' && c<='Z') return c+32;
  return (c>='€' && c<='¥')?(int2)tabminaz[c-'€']:c;

} /* minaz */

/*============================================================================*/

/* valid	Cette fonction v‚rifie si un caractŠre correspond bien … un
**		modŠle donn‚, et fait ‚ventuellement une conversion.
**
**	ParamŠtres:
**	-----------
**	modele: Un char* sur une chaŒne de caractŠres. D‚crit plus loin.
**	c:	Le caractŠre … tester
**	ptrok:	Un booleen*, remplit la zone point‚e avec vrai si le caractŠre
**		correspond au modŠle (ou si il a pu ˆtre converti), faux
**		sinon.
**
**	Retour:
**	-------
**	Le caractŠre, ‚ventuellement converti. Si *ptrok est … faux, le
**	caractŠre c est retourn‚ tel quel.
**
**
**  Principe du modŠle:
**  -------------------
**  Il s'agit d'une chaŒne d‚crivant les caractŠres autoris‚s … la saisie,
**  compos‚e des codes suivants:
**	A: lettres de A … Z
**	a: lettres de a … z  (minuscules sans accents)
**	…: toutes les minuscules, accentu‚es comprises
**	1: chiffres de 0 … 9
**	X: tout caractŠre
**  autre: ce caractŠre (ex: mettre un blanc dans le modŠle pour l'autoriser)
**
**
**  Principe de la conversion:
**  --------------------------
**  Cette table donne pour 3 lettres en entr‚e (E,e et ‚) le r‚sultat de
**  la conversion en fonction du modŠle.  Noter que dans le cas les caractŠres,
**  une conversion est toujous possible pour peu que le modŠle contienne au
**  moins A, a ou ….  Egalement, si le modŠle contient une lettre particuliŠre,
**  comme un E, seule la lettre E sera reconnue valide, mais pas e ni ‚.
**
**			   CaractŠres contenus dans le modŠle
**
**		       ÉÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍ»
**		       º   A   ³   a   ³  Aa   ³   …   ³  A…   º
**	      ÉÍÍÍÍÍÍÍÍÎÍÍÍÍÍÍÍØÍÍÍÍÍÍÍØÍÍÍÍÍÍÍØÍÍÍÍÍÍÍØÍÍÍÍÍÍÍ¹
**	      º   E    º   E   ³   e   ³   E   ³   e   ³   E   º
** CaractŠre  ÇÄÄÄÄÄÄÄÄ×ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ¶
** test‚      º   e    º   E   ³   e   ³   e   ³   e   ³   e   º
**	      ÇÄÄÄÄÄÄÄÄ×ÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ¶
**	      º   ‚    º   E   ³   e   ³   e   ³   ‚   ³   ‚   º
**	      ÈÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍ¼
*/

int2 valid(modele,c,ptrok)
int2 c;
booleen *ptrok;
const char *modele;
{
  register int2  d,t;

  if (c<0) c+=256;

       if (c>='A' && c<='Z') d='A';
  else if (c>='a' && c<='z') d='a';
  else if (c>='€' && c<='¥') d='…';
  else if (c>='0' && c<='9') d='1';
  else d=c;

  if (*ptrok = (booleen)(instring(modele,(char)c)|instring(modele,(char)d)|instring(modele,'X')))
    return c;

  t=0;
  if (instring(modele,'A')) t+=1;
  if (instring(modele,'a')) t+=2;
  if (instring(modele,'…')) t+=4;

  switch (t)
  {
    case 1: c=(char)majAZ(c);
	    *ptrok=(booleen)((c>='A')&(c<='Z'));
	    break;
    case 2: c=(char)minaz(c);
	    *ptrok=(booleen)((c>='a')&(c<='z'));
	    break;
    case 3: if (c>='€') { c=(char)minaz(c);
			  *ptrok=(booleen)((c>='a')&(c<='z'));
			}
	    break;
    case 4:
    case 6: if (c<='Z') { c=(char)minaz(c);
			  *ptrok=(booleen)((c>='a')&(c<='z'));
			} /* Pas de break */
    case 5:
    case 7: *ptrok |= (d=='a');
  }

  return c;

} /* valid */

