
/*  IMPRIME.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	19.XII.87
**  Ver. 1.10	18.III.88	Utilisation de types.h
**  Ver. 1.20	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**
**
**  Routines de gestion de l'imprimante
**
**  Routines:
**  ---------
**  okprinter	Teste la pr‚sence de l'imprimante
**  conv_impr	Conversion d'un caractŠre <32 en chaŒne de caractŠres
**		imprimables
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */


/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"


/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "imprime.ref"

/*============================================================================*/

/* okprinter	rend vrai si l'imprimante est prˆte, 0 sinon.
*/

booleen okprinter()
{
  return 1;

} /* okprinter */

/*============================================================================*/

/* conv_impr	Convertit le caractŠre pass‚ en paramŠtre en chaŒne de
**		caractŠres imprimables, pour les caractŠres de code
**		inf‚rieur … 32.
*/

char *conv_impr(c)
char c;
{
  static char s[4];

  char d,*p = s;

  if (c>=' ')
    *p++ = c;
  else
  {
    *p++ = " ..<.........><|!P_|^v><-<^v"[c];
    d =    "....>.............^.|.._||--'>.."[c];
    if (d!='.')
    {
      *p++ = 8;   /* backspace */
      *p++ = d;
    }
  }
  *p++ = 0;

  return s;

} /* conv_impr */

