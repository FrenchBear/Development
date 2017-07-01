
/*  PA.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	13.IV.88	P.Violent
**  Ver. 1.01	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.20	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 2.00	20.V.88 	E/S ‚volu‚es...
**  Ver. 2.10	23.V.88 	VLIB 2.0
**
**
**  Gestion de la pile d'affichage (routines pa_xx)
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

#include "vconst.h"
#include "vdef.h"

#include "init.ref"
#include "curseur.ref"
#include "a0.ref"
#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "pa.ref"

/*============================================================================*/
/* Variables et d‚finitions import‚es */

extern const uint1   vb_io;
extern const uint1   far * const vb_dptr;
extern const uint2   vt_col2;
extern const uint1   vt_lig,vt_col;
extern	     char    far *pa_buffer;
extern	     char    far *pa_zbuffer;

/*============================================================================*/
/* Variables et d‚finitions priv‚es au module */

static struct
{
  int2 lig,col;
  int2 haut,larg;
  char far *buffptr;
} pa_stack[PA_STACKSIZE];

/*============================================================================*/
/* Variables export‚es */

public uint2 pa_buffer_free = PA_BUFFERSIZE;
public int2  pa_stack_free  = PA_STACKSIZE;
public int2  pa_nbitem = 0;

/*============================================================================*/

void pa_push(lig,col,haut,larg)
int2 lig,col,haut,larg;
{
  int2 i,j;
  uint1 far *p = (char far *)vb_dptr+vt_col2*(lig-1)+2*(col-1);
  uint1 far *q;

  if (pa_nbitem==PA_STACKSIZE-1)
    vlib_err("pa_push (pa.c): D‚bordement de la pile d'affichage (PA_STACKSIZE)");
  if (pa_buffer+PA_BUFFERSIZE < pa_zbuffer+2*haut*larg)
    vlib_err("pa_push (pa.c): D‚bordement de la pile d'affichage (PA_BUFFERSIZE)");

  pa_stack[pa_nbitem].lig = lig;
  pa_stack[pa_nbitem].col = col;
  pa_stack[pa_nbitem].haut = haut;
  pa_stack[pa_nbitem].larg = larg;
  pa_stack[pa_nbitem].buffptr = pa_zbuffer;
  pa_nbitem++;
  pa_stack_free--;
  pa_buffer_free -= (uint2)(2*haut*larg);

  for (i=haut ; i-- ; )
  { q = p;
    for (j=(int2)(2*larg) ; j-- ; )
      *pa_zbuffer++ = *q++;
    p += vt_col2;
  }
} /* pa_push */

/*============================================================================*/

void pa_pushecran()
{
  pa_push(1,1,vt_lig,vt_col);

} /* pa_pushecran */

/*============================================================================*/

void pa_pop()
{
  int2	i,j;
  uint1 far *p,far *q,far *r;
  int2	haut,larg;
  int2	lig,col;

  pa_nbitem--;
  pa_stack_free++;
  r = pa_zbuffer = pa_stack[pa_nbitem].buffptr;
  lig  = pa_stack[pa_nbitem].lig;
  col  = pa_stack[pa_nbitem].col;
  haut = pa_stack[pa_nbitem].haut;
  larg = pa_stack[pa_nbitem].larg;

  pa_buffer_free += (uint2)(2*haut*larg);

  p = (char far *)vb_dptr+vt_col2*(lig-1)+2*(col-1);
  for (i=haut ; i-- ; )
  { q = p;
    for (j=(int2)(2*larg) ; j-- ; )
      *q++ = *r++;
    p += vt_col2;
  }

  if (vb_io != VO_DIRECT)
    a0_rebuild(lig,col,haut,larg,0);

} /* pa_pop */

