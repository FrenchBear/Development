
/*  ECRAN.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.0	1.VII.87	CGA + Driver ANSI.SYS Amstrad
**  Ver. 1.10	20.VII.87	puts
**  Ver. 1.11	27.VII.87	Version monochrome de curseur
**  Ver. 1.12	27.VII.87	drawbox affiche un blanc … gauche et … droite
**				du cadre...
**  Ver. 1.13	27.VII.87	Version monochrome
**  Ver. 1.20	1.III.88	puts -> ve_puts2, car redef interdite en Turbo C
**  Ver. 1.21	18.III.88	Optimisation de clszone, modif scrolldown
**  Ver. 1.30	18.III.88	Avec types.h
**  Ver. 1.40	16.IV.88	R‚duction du volume des routines, cr‚ation
**				des modules cls.c et scroll.c
**  Ver. 1.41	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.50	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 2.00	20.V.88 	E/S ‚volu‚es, vbios
**  Ver. 2.10	21.V.88 	a0_puts_sa -> ve_putslca
**  Ver. 2.20	22.V.88 	Fin de cio.c -> r‚cupŠre ve_printf et ve_puts
**  Ver. 2.30	23.V.88 	VLIB 2.0
**  Ver. 2.31	30.VII.88	Utilisation de const
**
**
**  Ce fichier de routines fournit un acces direct … la m‚moire ‚cran,
**  ainsi que des routines de manipulation du curseur, des couleurs...
**
**  Note: ligne et colonne commencent … 1.
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */

#include <stdio.h>
#include <varargs.h>

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"


#include "couleurs.ref"
#include "curseur.ref"          /* ve_gotolc */
#include "a0.ref"               /* a0_save, a0_restore */
#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "ecran.ref"

/*============================================================================*/

void ve_puts(texte)
const char *texte;
{
  vb_sorch(texte);
  vb_sorcar('\n');

} /* ve_puts */

/*============================================================================*/

/* ve_puts2	R‚‚criture du puts de la bibliothŠque, mais sans retour … la
**		ligne … la fin.
*/

void ve_puts2(texte)
const char *texte;
{
  vb_sorch(texte);

} /* ve_puts2 */

/*============================================================================*/

/*  ve_putslc	   Ecrit la chaine texte en ligne l colonne c.
*/

void ve_putslc(l,c,texte)
int2 l,c;
const char *texte;
{
  ve_gotolc(l,c);
  vb_sorch(texte);

} /* ve_putslc */

/*============================================================================*/

void ve_putslca(lig,col,texte,attrib)
int2 lig,col;
const char *texte;
uint1 attrib;
{
  a0_save();
  ve_gotolc(lig,col);
  vb_setattrib(attrib);
  vb_sorch(texte);
  a0_restore();

} /* ve_putslca */

/*============================================================================*/

/* ve_sorcar	Affiche le caractŠre car de maniŠre rapide.
*/

void ve_sorcar(car)
unsigned char car;
{
  vb_sorcar(car);

} /* ve_sorcar */

/*============================================================================*/

/* ve_sorcarlc	Idem ve_sorcar, mais positionne au pr‚alable le curseur en
**		ligne l et colonne c.
*/

void ve_sorcarlc(l,c,car)
int2 l,c;
unsigned char car;
{
  ve_gotolc(l,c);
  vb_sorcar(car);

} /* ve_sorcarlc */

/*============================================================================*/

/* ve_printf	Comme le printf des E/S standard, mais utilise le vbios.
**		La d‚claration de type prototype est rendue obligatoire
**		par le Turbo C qui n'accepte les ... uniquement dans ce type
**		de d‚claration.
*/

void ve_printf(format,va_alist)
const char *format;
va_dcl
{
  char buffer[400];
  va_list arg_ptr;
  va_start(arg_ptr);
  vsprintf(buffer,format,arg_ptr);
  vb_sorch(buffer);

} /* ve_printf */

