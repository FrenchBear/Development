/* valid.c
** Validation d'un caractäre par rapport Ö un modäle
**
** 3/12/94 PV	Extrait de chaine.c
*/

#include <stdio.h>
#include "biberc.h"

#include "import.h"

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

int iValid(const UC *modele, UC c, int *ptrok)
{
  register int  d,t;

       if (c>='A' && c<='Z') d='A';
  else if (c>='a' && c<='z') d='a';
  else if (c>=128 && c<=165) d='Ö';
  else if (c>='0' && c<='9') d='1';
  else d=c;

  *ptrok = instring(modele,(char)c)|instring(modele,(char)d)|instring(modele,'X');
  if (*ptrok)
    return c;

  t=0;
  if (instring(modele,'A')) t+=1;
  if (instring(modele,'a')) t+=2;
  if (instring(modele,(UC)'Ö')) t+=4;

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
