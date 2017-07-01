
/*  FILL.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	13.IV.88	P.Violent
**  Ver. 1.01	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.10	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 2.00	20.V.88 	E/S ‚volu‚es
**  Ver. 2.10	20.V.88 	Fin de a0_puts_s et a0_filla
**				a0_puts_sa -> putslca dans ecran.c
**  Ver. 2.20	21.V.88 	a0 -> fill et suffixe ve
**  Ver. 2.30	23.V.88 	VLIB 2.0
**  Ver. 2.31	30.VII.88	Utilisation de const
**
**
**  Routines de remplissage de z“nes … l'‚cran...
**  Note: ligne et colonne commencent … 1.
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

extern const uint1   vb_io;
extern	     uint1   vb_at;
extern const uint1   far * const vb_dptr;
extern const uint2   vt_col2;

#include "vdef.h"

#include "couleurs.ref"
#include "curseur.ref"
#include "a0.ref"
#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "fill.ref"

/*============================================================================*/

void ve_fillc(lig,col,haut,larg,car)
int2 lig,col,haut,larg;
uint1 car;
{
  ve_fillca(lig,col,haut,larg,car,vb_at);

} /* ve_fillc */

/*============================================================================*/

void ve_fillca(lig,col,haut,larg,car,att)
int2 lig,col,haut,larg;
uint1 car,att;
{
  int2	i,j;
  uint1 far *p = (char far *)vb_dptr + vt_col2*(lig-1)+2*(col-1);
  uint1 far *q;

  vb_at = att;
  for (i=haut ; i-- ; )
  { q = p;
    for (j=larg ; j-- ; )
    { *q++ = car;
      *q++ = att;
    }
    p += vt_col2;
  }

  if (vb_io == VO_DIRECT2)
    a0_rebuild(lig,col,haut,larg,1);
  else if (vb_io != VO_DIRECT)
  {
    for (i=0 ; i<haut ; i++)
    {
      ve_gotolc(lig+i,col);
      for (j=0 ; j<larg ; j++)
	vb_sorcar(car);
    }
  }

} /* ve_fillca */

