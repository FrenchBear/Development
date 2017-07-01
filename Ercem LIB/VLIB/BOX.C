
/*  BOX.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	16.IV.88	Extraction de ecran.c, utilisation de
**				a0_drawbox
**  Ver. 1.01	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.10	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 2.00	20.V.88 	E/S ‚volu‚es
**  Ver. 2.10	20.V.88 	Fusion box.c+a0_box.x -> box.c
**  Ver. 2.20	23.V.88 	VLIB 2.0
**  Ver. 2.21	30.VII.88	Utilisation de const
**
**
**  Gestion d'‚cran de bas niveau - Affichage de boŒtes.
**  Note: ligne et colonne commencent … 1.
**
**  drawbox	Dessine une boŒte en ligne lig,col largeur larg heuteur haut.
**		Les caractŠres ont l'attibut courant.
**		Le bord est fait … partir de la chaŒne cadre de 8 caractŠres:
**
**		     1
**		0 Ú  Ä	¿ 2
**
**		3 ³	³ 4
**		     6
**		5 À  Ä	Ù 7
**
**  cls a vrai (non nul) remplit la boite d'espaces.
**
**  drawboxa	Idem drawbox, mais en plus on peut pr‚ciser un attribut.
**
**  Ces deux routines sont 'propres' dans le sens o— elles conservent le
**  contexte de travail (attribut, pos. du curseur, ...)
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

extern const uint1 far * const vb_dptr;
extern const uint1 vb_at,vb_io;
extern const uint2 vt_col2;

#include "vdef.h"

#include "couleurs.ref"
#include "curseur.ref"
#include "a0.ref"
#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "box.ref"

/*============================================================================*/

void drawbox(lig,col,haut,larg,cadre,cls)
booleen cls;
int2	   lig,col,haut,larg;
const char *cadre;
{
  drawboxa(lig,col,haut,larg,cadre,cls,vb_at);

} /* drawbox */

/*============================================================================*/

void drawboxa(lig,col,haut,larg,cadre,cls,att)
booleen cls;
int2	   lig,col,haut,larg;
const char *cadre;
uint1	   att;
{
  register int2 i,j;
  char far *p,far *q;
  char far *r;

  a0_save();
  vb_setattrib(att);

  p = (char far *)vb_dptr+vt_col2*(lig-1)+2*(col-1);

  if (cls)
  { q = p+vt_col2+2;
    for(i=0 ; i<haut-2 ; i++)
    { r = q;
      for(j=larg-2 ; j-- ; )
      { *r++ = ' ';
	*r++ = vb_at;
      }
      q += vt_col2;
    }
  }

  q=p;
  *q++=cadre[0];  *q++=vb_at;
  for(i=larg-2 ; i-- ; ) {*q++=cadre[1]; *q++=vb_at;}
  *q++=cadre[2];  *q++=vb_at;

  q=p+vt_col2;
  for(i=0 ; i<haut-2 ; i++)
  { r=q;
    *r++=cadre[3];  *r++=vb_at;
    r+=larg+larg-4;
    *r++=cadre[4];  *r=vb_at;
    q+=vt_col2;
  }

  *q++=cadre[5];  *q++=vb_at;
  for(i=larg-2 ; i-- ; ) {*q++=cadre[6]; *q++=vb_at;}
  *q++=cadre[7];  *q++=vb_at;

  if (vb_io == VO_DIRECT2)
    a0_rebuild(lig,col,haut,larg,0);
  else if (vb_io != VO_DIRECT)
  {
    ve_gotolc(lig,col);
    vb_sorcar(cadre[0]);
    for(i=larg-2 ; i-- ; ) vb_sorcar(cadre[1]);
    vb_sorcar(cadre[2]);

    for (i=lig+1 ; i<lig+haut-1 ; i++)
    {
      ve_gotolc(i,col);
      vb_sorcar(cadre[3]);
      if (cls)
	for (j=0 ; j<larg-2 ; j++)
	  vb_sorcar(' ');
      else
	ve_gotolc(i,col+larg-1);
      vb_sorcar(cadre[4]);
    }

    ve_gotolc(lig+haut-1,col);
    vb_sorcar(cadre[5]);
    for(i=larg-2 ; i-- ; ) vb_sorcar(cadre[6]);
    vb_sorcar(cadre[7]);
  }

  a0_restore();

} /* a0_drawbox */

