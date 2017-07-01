
/*  CLAVIER.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	1.VII.87
**  Ver. 1.01	31.VII.87	Void & Co.
**  Ver. 1.10	23.X.87 	Fonction cardispo().
**  Ver. 1.20	18.III.88	Utilisation de types.h
**  Ver. 1.30	11.IV.88	Inkey par le bios … cause d'un bug de getch !!!
**				(retour farfelu pour ALT_Q et ALT_R)
**  Ver. 1.40	28.IV.88	avec hotkey
**  Ver. 1.50	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 1.60	20.V.88 	E/S ‚volu‚es
**  Ver. 1.70	23.V.88 	VLIB 2.0
**
**
**  Routines de manipulation du clavier
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */

#include <stdio.h>	/* NULL */

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

#include "clavier.h"

#include "vconst.h"
#include "vdef.h"

#include "vbios.ref"    /* vb_lircar */
#include "init.ref"     /* vlib_err */

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "clavier.ref"

/*============================================================================*/
/* Variables export‚es */

public int2    vc_nbhotkey = 0;
public booleen vc_okhotkey = 1;
public int2    vc_nbmaxhotkey = VC_NBMAXHOTKEY;
public int2    vc_supershift = K_F9;

/*============================================================================*/
/* Variables et d‚finitions priv‚es au module */

static struct
{
  touche key;
  void	 (*routine)(void);
} tabhot[VC_NBMAXHOTKEY];

/*============================================================================*/

void (*vc_hotkey(key,routine))(void)
touche key;
void   (*routine)(void);
{
  int2 i;
  void (*old_routine)();

  for (i=0 ; i<vc_nbhotkey ; i++)
    if (tabhot[i].key == key)
    {
      old_routine = tabhot[i].routine;
      tabhot[i].routine = routine;
      return old_routine;
    }

  if (vc_nbhotkey==VC_NBMAXHOTKEY-1)
    vlib_err("(clavier.c) hotkey: d‚bordement de tabhot[]");
  else
  {
    tabhot[vc_nbhotkey].routine = routine;
    tabhot[vc_nbhotkey].key	= key;
    vc_nbhotkey++;
  }
  return NULL;

} /* vc_hotkey */

/*============================================================================*/

touche vc_lircar()
{
  register touche  t;
  register int2    i;
  register booleen ok;

  do
  {
    ok = 1;
    t = vb_lircar();
    if (t==vc_supershift)
      t = vb_lircar()+SSHIFT;
    if (vc_okhotkey)
      for (i=0 ; i<vc_nbhotkey && ok ; i++)
      {
	if (tabhot[i].key==t && tabhot[i].routine!=NULL)
	{ (*tabhot[i].routine)();
	  ok = 0;
	}
      }
  } while (!ok);
  return t;

} /* vc_lircar */

/*============================================================================*/

/* vc_cardispo	Retour vrai si un caractŠre est disponible dans le buffer
**		clavier: cela ‚vite d'appeler lircar qui reste bloqu‚
**		si aucun caractŠre n'est disponible...
*/

booleen vc_cardispo()
{
  return vb_cardispo();

} /* vc_cardispo */

