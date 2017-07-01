
/*  CURSEUR.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.0	16.IV.88	Extraction de ecran.c
**  Ver. 1.01	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.10	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 2.00	20.V.88 	E/S evolu‚es
**  Ver. 2.10	23.V.88 	VLIB 2.0
**  Ver. 2.11	30.VII.88	Utilisation de const
**
**
**  Routines de gestion d'‚cran de VLIB - Gestion du ve_curseur
**  Note: ligne et colonne commencent … 1.
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

extern	     uint1 vb_lig,vb_col;
extern const uint1 vb_curs;
extern const uint2 vt_col2;
extern	     uint2 vb_index;

#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "curseur.ref"

/*============================================================================*/

/* ve_gotolc	   Envoie le curseur en ligne l et colonne c.
*/

void ve_gotolc(l,c)
int2 l,c;
{
  vb_lig = (uint1)(l-1);
  vb_col = (uint1)(c-1);
  vb_index = vt_col2*vb_lig+2*vb_col;

} /* ve_gotolc */

/*============================================================================*/

/* ve_wherelc	Rend les coordonn‚es actuelles du curseur.
*/

void ve_wherelc(l,c)
int2 *l,*c;
{
  *l = vb_lig+1;
  *c = vb_col+1;

} /* ve_wherelc */

/*============================================================================*/

/* ve_curseur	Change la forme du ve_curseur
**		  typ:	0 -> pas de ve_curseur	      1 -> 1/4 en bas
**			2 -> 1/2 en bas 	   3 -> pav‚ complet
**
**		Cette routine a ‚t‚ test‚e en CGA et monochrome texte.
*/

void ve_curseur(typ)
int2 typ;
{
  vb_curseur((uint1)typ);

} /* ve_curseur */

/*============================================================================*/

/* ve_qcurseur	Rend le type actuel du curseur.
**		La valeur rendue a le mˆme sens que dans ve_curseur(typ).
**		Si on n'a jamais fait appel … ve_curseur au pr‚alable, le type
**		par d‚faut est 1 (1/4 en bas) qui est en g‚n‚ral celui
**		obtenu depuis le COMMAND.COM.
*/

int2 ve_qcurseur()
{
  return (int2)vb_curs;

} /* ve_qcurseur */

