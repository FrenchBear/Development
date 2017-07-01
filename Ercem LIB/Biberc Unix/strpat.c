/* strpat.c
**	Comparaison d'une chaine de caracteres avec un masque pouvant
**	comporter des ' * ' et des ' ? '.
**
**	entree :	p_buff   = pointeur chaine de caractere
**				p_masque = pointeur masque
**
**	sortie :	fonction =  0 si egalite
**						 =  1 sinon
**
**	Dans le cas de la presence du joker '*', le reste de la chaine doit
**	correspondre au reste du masque .
**	On peut mettre plusieurs '*' dans le masque.
**
**	exemple :	abcdef	a*d*f		==> OK
**				abcdef	a*f*		==> OK
** FG 24/06/94
*/

#include "biberc.h"
#include <ctype.h>

#include "import.h"

/*
#define TEST
*/



/* -----------------------------------------------------------------*/
int strpat(char *p_buff, char *p_masque)
{
  register unsigned char clv1;				/* car chaine en cours   */
  register unsigned char clv2;				/* car masque en cours   */

  while( (clv2 = *(p_masque++)) )			/* boucle sur masque     */
  {
	if( clv2 == '*' )						/* marque '*' --> tout c */
	{
	  if( !*p_masque )						/* ...* ==> reste = vrai */
	  {
		return(0);
	  }
	  else
	  {
		while(*p_buff)						/* boucle sur p_buff     */
		{
		  if( !strpat(p_buff,p_masque) )
		  {
			return(0);						/* ...*... = p_buff      */
		  }
		  else
		  {
			p_buff++;						/* test car p_buff suiv  */
		  }
		}
		return(1);							/* '*'x --> x ! ds p_buff*/
	  }
	}
	else if( !(clv1 = *p_buff++) )			/* fin p_util detectee   */
	{
	  return(1);							/* p_masque > p_buff     */
	}
	else if( (clv2 != '?')				&&	/* '?' ==> tout char     */
	   (toupper(clv1) != toupper(clv2))	  )	/* difference trouvee    */
	{
	  return(1);
	}
  } /* while clv2 */


  if( !*p_buff )							/* fin p_masque et p_buff*/
  {
	return(0);
  }
  else
  {
	return(1);
  }
}



/* ---------------------------------------------------------------- */
/*   MAIN() pour tests unitaires								 */
/* ---------------------------------------------------------------- */

#if defined(TEST)


main(argc,argv)
int argc;
char *argv[];
{
  char fich[129];
  char buff[129];

  while(buff[0]!='q')
  {
	printf("string :\n");
	scanf("%s", fich);

	printf("masque :\n");
	scanf("%s", buff);

	printf("resultat comparaison = %d\n\n",strpat(fich, buff));
  }
}

#endif
