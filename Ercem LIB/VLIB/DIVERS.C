
/*  DIVERS.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.0	3.VII.87	Driver ANSI.SYS Amstrad
**  Ver. 1.1	12.VII.87	Ajout de run, datefr, today, initvlib
**  Ver. 1.2	27.VII.87	Version monochrome des routines ‚volu‚es
**  Ver. 1.30	28.VII.87	okprinter
**  Ver. 1.31	27.VII.87	Version monochrome, et vlibv dans version.c
**				okprinter dans imprime.c
**  Ver. 1.40	18.III.88	Avec types.h
**  Ver. 1.50	16.IV.88	sortie de date et initvlib
**  Ver. 1.60	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 1.70	20.V.88 	E/S Evolu‚es
**  Ver. 1.71	30.VII.88	Utilisation de const
**
**
**  Ce fichier de routines regroupe toutes les fonctions plus ou moins
**  bizzarres qui n'ont pas pu ˆtre cas‚es ailleurs...
**
**  Routines:
**  ---------
**  bipbip	Pour jouer de la musique
**  exist	Teste l'existence d'un fichier
**  run 	Lance un programme externe
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "divers.ref"

/*============================================================================*/

/* bipbip	Emet une note de musique, en fonction de n.
**		Pour l'instant, je ne sais pas comment faire cela en C...
**		aussi j'envoie un [BEL] la sortie standard...
*/

void bipbip(n)
int2 n;
{
  vb_sorcar0(7);

} /* bipbip */

/*============================================================================*/

/* exist	Teste si nomfic existe. Retour 0 ou 1 selon que le fichier
**		existe ou non.	Compatible avec APPEND du MS-DOS, c'est …
**		dire qu'un fichier qui n'est pas pr‚sent dans le catalogue
**		courant mais qui existe dans un des catalogues d‚finis par
**		append est consider‚ comme existant.
*/

booleen exist(nomfic)
const char *nomfic;
{
  int f;

  if ((f=open((char *)nomfic,0))<0) return 0;
  else close(f);
  return 1;

} /* exist */

