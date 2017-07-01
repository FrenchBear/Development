
/*  CLS.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.0	16.IV.88	Extraction de ecran.c
**  Ver. 1.01	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.10	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 2.00	20.V.88 	E/S evolu‚es
**  Ver. 2.10	23.V.88 	VLIB 2.0
**
**
**  Routines de gestion d'‚cran de VLIB - Effacement de l'‚cran
**  Note: ligne et colonne commencent … 1.
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

extern const uint1 vt_lig;

#include "vbios.ref"            /* vb_clszone */

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "cls.ref"

/*============================================================================*/

/* ve_cls	Efface complŠtement l'‚cran.
*/

void ve_cls()
{
  vb_clszone(0,vt_lig-1);

} /* ve_cls */

/*============================================================================*/

/* ve_clszone	efface la zone d'‚cran comprise entre les lignes debutzone et
**		finzone comprises, (de 1 … vt_lig) c'est … dire qu'on la remplit
**		avec des espaces CYAN sur fond noir.
*/

void ve_clszone(debutzone,finzone)
int2 debutzone,finzone;
{
  vb_clszone((uint1)(debutzone-1),(uint1)(finzone-1));

} /* ve_clszone */

