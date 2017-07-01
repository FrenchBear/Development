/* curseur(typ) Change la forme du curseur
**		  typ:	0 -> pas de curseur	   1 -> 1/4 en bas
**			2 -> 1/2 en bas 	   3 -> pav‚ complet
**
**		Cette routine a ‚t‚ test‚e en CGA et monochrome texte.
*/

void curseur(typ)
int1 typ;
{
  static int1 tconvcoul[]= {9,6,4,0};	/* Lignes de d‚but de balayage	   */
  static int1 tconvnb[]  = {14,12,8,0}; /* pour couleur et N&B		   */
  union REGS reg;

  reg.h.ah = 1; 			/* Fonction 1: aspect du curseur   */
					/* D‚but de balayage		   */
  reg.h.ch = colorcard?tconvcoul[typ]:tconvnb[typ];
  reg.h.cl = (int1)(colorcard?7:13);   /* Fin de balayage		   */
  int86(0X10, &reg, &reg);
}
