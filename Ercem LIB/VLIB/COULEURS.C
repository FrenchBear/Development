
/*  COULEURS.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	1.VII.87	CGA + Driver ANSI.SYS Amstrad
**  Ver. 1.01	20.VII.87	Optimisations
**  Ver. 1.10	27.VII.87	Ajout de coulnb
**  Ver. 1.11	27.VII.87	Version monochrome
**  Ver. 1.20	13. X .87	Version remani‚e couleur+mono
**  Ver. 1.30	1.III.88	Optimisation cputs/putch au lieu de printf
**  Ver. 1.31	18.III.88	Utilisation de types.h
**  Ver. 1.32	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.40	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 2.00	20.V.88 	E/S ‚volu‚es. Module complŠtement repris.
**  Ver. 2.10	23.V.88 	VLIB 2.0
**
**
**  Module de d‚finition des fonctions manipulant les couleurs.
**
**  Routines:
**  ---------
**  ve_ccar	   Couleur de caractŠre c
**  ve_cfond	   Couleur de fond c
**  ve_ccarfonf    Fixe la couleur des caractŠres et du fond
**  vc_setattrib   Fixe l'attribut courant
**  ve_qccar	   Rend la couleur de caractŠre actuelle
**  ve_qcfond	   Rend la couleur de fond
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

extern const booleen vt_couleur;
extern	     uint1   vb_at;

#include "vdef.h"
#include "couleurs.h"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "couleurs.ref"

/*============================================================================*/
/* Variables et d‚finitions priv‚es au module */

typedef union
{
  struct
  {
    unsigned ccar:  3;
    unsigned brill: 1;
    unsigned cfond: 3;
    unsigned clig:  1;
  } str;
  uint1 att1;
} ATTRIBUT;

/*============================================================================*/
/* Variables import‚es */

extern uint1 *_conv_at;

/*============================================================================*/

void ve_ccar(c)
couleur c;
{
  ATTRIBUT new_at;

  new_at.att1 = vb_at;
  new_at.str.ccar  = c&7;
  if (c&BRILLANT)   new_at.str.brill = 1;  else  new_at.str.brill = 0;
  if (c&CLIGNOTANT) new_at.str.clig  = 1;  else  new_at.str.clig  = 0;
  if (!vt_couleur)
  { new_at.att1 = _conv_at[new_at.att1];
    if (c&SOULIGNE) new_at.str.ccar = 1;
  }
  vb_at = new_at.att1;

} /* ve_ccar */

/*============================================================================*/

void ve_cfond(c)
couleur c;
{
  ATTRIBUT new_at;

  new_at.att1 = vb_at;
  new_at.str.cfond = c&7;
  vb_at = new_at.att1;

} /* ve_cfond */

/*============================================================================*/

void ve_ccarfond(c,d)
couleur c,d;
{
  ATTRIBUT new_at;

  new_at.att1 = vb_at;
  new_at.str.ccar  = c&7;
  new_at.str.cfond = d&7;
  if (c&BRILLANT)   new_at.str.brill = 1;  else  new_at.str.brill = 0;
  if (c&CLIGNOTANT) new_at.str.clig  = 1;  else  new_at.str.clig  = 0;
  if (!vt_couleur)
  { new_at.att1 = _conv_at[new_at.att1];
    if (c&SOULIGNE) new_at.str.ccar = 1;
  }
  vb_at = new_at.att1;

} /* ve_ccarfond */

/*============================================================================*/

couleur ve_qccar()
{
  couleur r;

  r = vb_at&15; 		/* 1bit brill + 3bits ccar */
  if (r&0x80) r|=CLIGNOTANT;
  return r;

} /* ve_qccar */

/*============================================================================*/

couleur ve_qcfond()
{
  return (couleur) ((vb_at>>4)&7);	/* 3bits cfond */

} /* ve_qcfond */

