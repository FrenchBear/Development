
/*  SCROLL.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.0	16.IV.88	Extraction de ecran.c
**  Ver. 1.10	27.IV.88	scrollleft et scrollright; notation sc_xx
**  Ver. 1.11	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.20	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 2.00	20.V.88 	E/S ‚volu‚es
**  Ver. 2.10	23.V.88 	VLIB 2.0
**  Ver. 2.11	30.VII.88	Utilisation de const
**
**
**  Routines de gestion d'‚cran de VLIB - Routines de scroll
**  Note: ligne et colonne commencent … 1.
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */


/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

#include "vdef.h"

#include "couleurs.ref"
#include "cls.ref"
#include "curseur.ref"
#include "a0.ref"
#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "scroll.ref"

/*============================================================================*/
/* Variables import‚es */

extern const uint1 vb_io,vb_at,vt_type;
extern	     uint1 vb_lig,vb_col;
extern const uint2 vt_col2;
extern	     uint2 vb_index;
extern const uint1 far * const vb_dptr;
extern const uint1 vt_col;
extern	     uint1 *_conv_at;
extern	     uint1 vb_lig_phy,vb_col_phy;

/*============================================================================*/

/* sc_up	D‚place la portion de texte entre les lignes debutzone et
**		finzone (de 1 … vt_lig, comprises) de n lignes vers le haut,
**		et remplit les lignes du bas ainsi d‚gag‚es avec des blancs.
*/

void sc_up(n,debutzone,finzone)
int2 n,debutzone,finzone;
{
  uint2 far *vb_dptr2 = (uint2 far *)vb_dptr;
  uint2 at2 = (vb_at<<8)+' ';
  register int2 s,d;
  int2 i;

  d = (debutzone-1)*vt_col;		/* destination			      */
  s = (debutzone-1+n)*vt_col;		/* source			      */

  for (i=(finzone-debutzone+1-n)*vt_col ; i-- ; )
    vb_dptr2[d++]=vb_dptr2[s++];

  for (i=n*vt_col ; i-- ;)		/* On efface les n lignes du bas.     */
    vb_dptr2[d++] = at2;

  if (vb_io==VO_DOS)
  {
    vb_supligne((uint1)n,(uint1)(debutzone   -1));	/* -1 car bios: 0..n */
    vb_insligne((uint1)n,(uint1)(finzone-n+1 -1));
  }

  vb_lig = (uint1)(debutzone-1);
  vb_col = 0;
  vb_index = vt_col2*vb_lig;

} /* sc_up */

/*============================================================================*/

/* sc_down	Comme sc_up, mais dans l'autre sens.
*/

void sc_down(n,debutzone,finzone)
int2 n,debutzone,finzone;
{
  uint2 far *vb_dptr2 = (uint2 far *)vb_dptr;
  uint2 at2 = (vb_at<<8)+' ';
  register int2 s,d;
  int2 i;

  s = (finzone-n)*vt_col-1;
  d = finzone*vt_col-1;

  for (i=(finzone-debutzone+1-n)*vt_col ; i-- ; )
    vb_dptr2[d--]=vb_dptr2[s--];

  for (i=n*vt_col ; i-- ; )
    vb_dptr2[d--] = at2;

  if (vb_io==VO_DOS)
  {
    vb_supligne((uint1)n,(uint1)(finzone-n+1 -1));
    vb_insligne((uint1)n,(uint1)(debutzone   -1));	/* -1 car bios: 0..n */
  }

  vb_lig = (uint1)(debutzone-1);
  vb_col = 0;
  vb_index = vt_col2*vb_lig;

} /* sc_down */

/*============================================================================*/

/* sc_left	D‚place la portion de texte entre les lignes debutzone et
**		finzone (de 1 … vt_lig, comprises) de n colonnes vers la gauche,
**		et remplit les colonnes de droite ainsi d‚gag‚es avec des
**		blancs.
*/

void sc_left(n,debutzone,finzone)
int2 n,debutzone,finzone;
{
  register char far *s,far *d,far *s0;
  int2 i,j;

  d = (char far *)vb_dptr+(debutzone-1)*vt_col2;	/* destination			      */
  s = d+2*n;			       /* source			     */

  for (i=finzone-debutzone+1 ; i-- ; )
  {
    s0=s;
    for (j=vt_col2-2*n ; j-- ; ) *d++=*s++;
    for (j=n ; j-- ; ) { *d++ = ' '; *d++ = 3; }
    s=s0+vt_col2;
  }

  if (vb_io!=VO_DIRECT)
    a0_rebuild(debutzone,1,finzone-debutzone+1,vt_col,0);

} /* sc_left */

/*============================================================================*/

/* sc_right	D‚place la portion de texte entre les lignes debutzone et
**		finzone (de 1 … vt_lig, comprises) de n colonnes vers la droite,
**		et remplit les colonnes de gauche ainsi d‚gag‚es avec des
**		blancs.
*/

void sc_right(n,debutzone,finzone)
int2 n,debutzone,finzone;
{
  register char far *s,far *d,far *s0;
  int2 i,j;

  d = (char far *)vb_dptr+(finzone)*vt_col2-1;		/* destination	*/
  s = d-2*n;					/* source	*/

  for (i=finzone-debutzone+1 ; i-- ; )
  {
    s0=s;
    for (j=vt_col2-2*n ; j-- ; ) *d--=*s--;
    for (j=n ; j-- ; ) { *d-- = 3; *d-- = ' '; }
    s = s0-vt_col2;
  }

  if (vb_io!=VO_DIRECT)
    a0_rebuild(debutzone,1,finzone-debutzone+1,vt_col,0);

} /* sc_right */

