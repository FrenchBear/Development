
/*  INPUT.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	3.VII.87	Clavier uniquement.
**  Ver. 1.01	27.VII.87	Version monochrome
**  Ver. 1.02	27.VII.87	Version monochrome
**  Ver. 1.03	23.X.87 	Impose un petit curseur pendant la saisie
**  Ver. 1.10	18.III.88	Utilisation de types.h
**  Ver. 1.20	17.IV.88	Eclatement en modules
**  Ver. 1.21	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.20	17.V.88 	Compatibilit� MSC 5.0; nouveaux .REF
**  Ver. 1.30	20.V.88 	E/S �volu�es
**  Ver. 1.40	23.V.88 	VLIB 2.0
**  Ver. 1.50	20.VI.88	Param�tre tabexitkey
**  Ver. 1.51	30.VII.88	Utilisation de const
**
**
**  Ce module implante une fonction de lecture performante, input().
**  Elle saisit un nombre maximum de caract�res � un endroit donn� sur
**  l'�cran, avec contr�le de types et gestion des touches d'�dition.
**
**  inputlc a le m�me effet, sinon qu'elle place le curseur en ligne l
**  colonne c avant de commencer la saisie.
**
**  Param�tres:
**  -----------
**  buf:	 Un char* sur le buffer � remplir.
**  lgbuf:	 Nb de caract�res maximum � lire
**  modele:	 Cha�ne des caract�res valides (char *)
**  exitkey:	 Tableau des codes des touches terminant la saisie, fini par 0
**  l0,c0:	 Ligne & colonne du 1er caract�re � saisir (inputlc)
**
**  Retour:
**  -------
**  Le code du carat�re qui a termin� la saisie, qui se trouve forc�ment dans
**  exitkey.
**
**  Principe du mod�le:
**  -------------------
**  Il s'agit d'une cha�ne d�crivant les caract�res autoris�s � la saisie,
**  compos�e des codes suivants:
**	A: lettres de A � Z
**	a: lettres de a � z  (minuscules sans accents)
**	�: toutes les minuscules, accentu�es comprises
**	1: chiffres de 0 � 9
**	X: tout caract�re
**  autre: ce caract�re (ex: mettre un blanc dans le mod�le pour l'autoriser)
**
**  Ainsi, le mod�le "A1\:." saisit des noms de fichiers complets alors
**  que "A1" n'autorise ni unit�, ni path ni extension.
**  "1" saisira un entier alors que "1.+-Ee" saisira un r�el.
**  (Noter que les caract�res seulements sont corrects; c'est � celui qui
**  appelle input() de v�rifier que la cha�ne rendue � un sens, car pour
**  le 1er exemple, on peut tr�s bien saisir  :AA\\.\\A:\:..)
**
**  Les conversions au niveau de la frappe sont effectu�es par la fonction
**  valid. Voici un tableau donnant la lettre prise en compte en fonction
**  de la touche press�e et du mod�le:
**
**			  Caract�res contenus dans le mod�le
**
**		       ���������������������������������������ͻ
**		       �   A   �   a   �  Aa   �   �   �  A�   �
**	      ������������������������������������������������͹
** Touche     �   E    �   E   �   e   �   E   �   e   �   E   �
** frapp�e    ������������������������������������������������Ķ
** au	      �   e    �   E   �   e   �   e   �   e   �   e   �
** clavier    ������������������������������������������������Ķ
**	      �   �    �   E   �   e   �   e   �   �   �   �   �
**	      ������������������������������������������������ͼ
*/

/*============================================================================*/
/* prototypes, d�finitions et variables import�s de la biblio C standard */

#include <string.h>

/*============================================================================*/
/* prototypes, d�finitions et variables import�s des autres modules de VLIB */

#include "vtypes.h"

extern const booleen vt_couleur;
extern const uint1   vb_at;
extern const uint1   vb_lig,vb_col;

#include "clavier.h"
#include "couleurs.h"

#include "ecran.ref"
#include "curseur.ref"
#include "couleurs.ref"
#include "clavier.ref"
#include "chaine.ref"
#include "divers.ref"
#include "a0.ref"
#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc�dures du module */

#include "input.ref"

/*============================================================================*/

touche inputlc(l0,c0,buf,lgbuf,modele,exitkey)
int2	     l0,c0;
char	     *buf;
const char   *modele;
int2	     lgbuf;
const touche *exitkey;
{
  int2	  i,lg,pos;
  booleen ok;
  touche  c;
  char	  *p,*q,d,t;
  int2	  scurs;
  uint1   oldat;

  scurs  = ve_qcurseur();
  ve_gotolc(l0,c0);
  oldat = vb_at;

  if (vt_couleur)			   /* On fixe la couleur indiquant */
    ve_ccarfond(BLANC|BRILLANT,BLEU);	   /* la zone de saisie 	   */
  else
    ve_ccarfond(BLANC|BRILLANT|SOULIGNE,NOIR);

  ve_curseur(2);			   /* On affiche un � curseur	   */

  lg = (int2)strlen(buf);			/* On affiche le contenu actuel */
  if (lg>lgbuf) lg = lgbuf;		/* de buf			*/
  for(i=0 ; i<lg ; i++) vb_sorcar(buf[i]);
  for(i=lg+1 ; i<=lgbuf ; i++) vb_sorcar(' ');
  pos = lg+1;				/* et on se positionne en fin.	*/

  for(;;)
  {
    vb_gotolc((uint1)(l0-1),(uint1)(c0+pos-2));
    c = vc_lircar();

    for (i=0 ; exitkey[i] ; )
      if (c==exitkey[i++]) goto finboucle;

    if (c<K_ESPACE || c>'\xff')
    {					/* Cas d'un caract�re sp�cial   */
      switch (c)			/* (Touche de fctn, fl�che,...) */
      {
	case K_BACK: if (pos>1)
		   {			/* Si on n'est pas en d�but     */
		     pos--;
		     ve_gotolc(l0,c0+pos-1);
		     p = buf+pos-1;q=p+1;
		     while (d = *p++ = *q++) vb_sorcar(d);
		     vb_sorcar(' ');
		     lg--;
		   }
		   else bipbip(1);	/* sinon on proteste un peu...	*/
		   break;

	case K_HOME: pos = 1; break;

	case K_END:  pos = lg+1; break;

	case K_LEFT: if (pos>1) pos--;
		   else       bipbip(1);
		   break;

	case K_RIGHT:if (pos<=lg) pos++;
		   else 	bipbip(1);
		   break;

	case K_DEL: if (pos!=lg+1)
		  {
		     p = buf+pos-1;
		     q = p+1;
		     while (d = *p++ = *q++) vb_sorcar(d);
		     vb_sorcar(' ');
		     lg--;
		   }
		   else bipbip(1);
		   break;
      }
    }
    else			/* Cas d'un caract�re 'normal'               */
    {
      c = valid(modele,c,&ok);	/* On v�rifie s'il est conforme, avec une    */
				/* conversion �ventuelle		     */
      if (lg==lgbuf || !ok)
	bipbip(1);		/* On ne peut pas d�border du buffer	     */
      else
      {
	p = buf+pos-1;
	d = (char) c;
	do
	{
	  vb_sorcar(d); 	   /* On affiche le caract�re, et on d�cale	*/
	  t = *p;		/* ceux qui suivent (insertion) jusqu'�      */
	  *p++ = d;		/* la marque de fin de cha�ne		     */
	  d = t;
	} while(d);
	buf[++lg]=0;		/* on rajoute le marqueur de fin de cha�ne   */
	pos++;
      }
    }

  } /* for(;;) */

finboucle:
  ve_gotolc(l0,c0);
  vb_setattrib(oldat);
  vb_sorch(buf);				/* la couleur normale	     */
  for (i=lg ; i<lgbuf ; i++) vb_sorcar(' ');

  ve_curseur(scurs);

  return c;

} /* inputlc */

/*============================================================================*/

touche input(buf,lgbuf,modele,exitkey)
char	     *buf;
const char   *modele;
int2	     lgbuf;
const touche *exitkey;
{
  return inputlc(vb_lig+1,vb_col+1,buf,lgbuf,modele,exitkey);

} /* input */

