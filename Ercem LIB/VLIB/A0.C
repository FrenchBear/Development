
/*  A0.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	20.IV.88	a0->fill; sauvecontexte/restituecontexte de
**				pa.c -> ici sous a0_save/a0_restore
**  Ver. 1.10	23.V.88 	VLIB 2.0
**  Ver. 1.11	30.VII.88	Utilisation de const
**
**
**  Gestion de l'affichage de bas niveau (routines a0_xx)
**
**  Routines
**  --------
**
**  a0_save	Sauvegarde de la position du curseur et de l'at. courant
**  a0_restore	Restitue le dernier ‚tat sauv‚ par la routine pr‚c‚dente
**  a0_rebuild	Reconstruit une partie de l'‚cran … partir du tableau
**		vb_dptr pour les modes bios ou ansi
**  a0_redisplay  Reconstruit tout l'‚cran, attribut et position du curseur
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

#include "vdef.h"
#include "vconst.h"

#include "couleurs.ref"
#include "curseur.ref"
#include "init.ref"
#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "a0.ref"

/*============================================================================*/
/* Variables et d‚finitions priv‚es au module */

static struct
{
  int2	lig;
  int2	col;
  uint1 att;
} contexte[A0_STACKSIZE];

static zcontexte = 0;		/* sommet de pile de contexte */

/*============================================================================*/
/* Variables import‚es */

extern const uint1   vb_io;
extern	     uint1   vb_lig,vb_col,vb_at;
extern const uint2   vt_col2;
extern	     uint2   vb_index;
extern const uint1   far * const vb_dptr;
extern const uint1   vt_lig,vt_col;
extern const booleen vt_couleur;
extern	     uint1   *_conv_at;
extern	     booleen _nconv;

/*============================================================================*/

void a0_save()
{
  if (zcontexte+1==A0_STACKSIZE)
    vlib_err("(a0.c) a0_save: D‚bordement de la pile de contexte.");

  contexte[zcontexte].lig = vb_lig;
  contexte[zcontexte].col = vb_col;
  contexte[zcontexte].att = vb_at;
  zcontexte++;

} /* a0_save */

/*============================================================================*/

void a0_restore()
{
  if (--zcontexte<0)
    vlib_err("(a0.c) a0_restore: Sous-d‚bordement de la pile du contexte.");

  ve_gotolc(contexte[zcontexte].lig+1,contexte[zcontexte].col+1);
  vb_setattrib(contexte[zcontexte].att);

} /* a0_restore */

/*============================================================================*/

void a0_rebuild(lig,col,haut,larg,conv)
int2 lig,col,haut,larg;
booleen conv;
{
  int2	i,j;
  uint1 far *p,far *q;
  uint1 a,c;

  if (vb_io == VO_DIRECT2)
  {
    uint2 far *s = (uint2 far *) 0xB8000000L;
    uint2 far *d = (uint2 far *) 0xB0000000L;
    register int2 index;
    int2 sauveindex;
    union
    { unsigned ca;
      struct
      { unsigned c:8;
	unsigned a:8;
      } u;
    } ca;

    sauveindex = vt_col*(lig-1)+col-1;

    for (i=haut ; i-- ;)
    {
      index = sauveindex;
      for (j=larg ; j-- ; )
      { ca.u.a = _conv_at[(ca.ca = s[index])>>8];
	d[index++] = (uint2)ca.ca;
      }
      sauveindex += vt_col;
    }
  }
  else if (vb_io != VO_DIRECT)
  {
    a0_save();
    _nconv=conv;
    p = (char far *)vb_dptr+vt_col2*(lig-1)+2*(col-1);
    for (i=lig ; i<lig+haut ; i++)
    { q = p;
      vb_lig = (uint1)(i-1);
      vb_col = (uint1)(col-1);
      vb_index = vt_col2*vb_lig+2*vb_col;
      if (i==vt_lig && larg==vt_col) larg=vt_col-1;
      for (j=0 ; j<larg ; j++)
      {
	c = *q++;
	a = *q++;
	if (a!=vb_at) vb_at = vt_couleur?a:_conv_at[a];
	vb_sorcar(c);
      }
      p += vt_col2;
    }
    _nconv=1;
    a0_restore();
  }

} /* a0_rebuild */

/*============================================================================*/

void a0_redisplay()
{
  if (vb_io != VO_DIRECT)
  {
    ve_gotolc(vb_lig+1,vb_col+1);
    vb_setattrib(vb_at);
    a0_rebuild(1,1,vt_lig,vt_col,0);
  }

} /* a0_redisplay */

