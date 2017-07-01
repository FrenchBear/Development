/* valid.c
** Validation d'un caract�re par rapport � un mod�le
**
** 3/12/94 PV	Extrait de chaine.c
*/

#include <stdio.h>
#include "biberc.h"

#include "import.h"

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

int iValid(const UC *modele, UC c, int *ptrok)
{
  register int  d,t;

       if (c>='A' && c<='Z') d='A';
  else if (c>='a' && c<='z') d='a';
  else if (c>=128 && c<=165) d='�';
  else if (c>='0' && c<='9') d='1';
  else d=c;

  *ptrok = instring(modele,(char)c)|instring(modele,(char)d)|instring(modele,'X');
  if (*ptrok)
    return c;

  t=0;
  if (instring(modele,'A')) t+=1;
  if (instring(modele,'a')) t+=2;
  if (instring(modele,(UC)'�')) t+=4;

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
