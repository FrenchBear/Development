
/*  ALERT.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	1.VII.87	Clavier uniquement.
**  Ver. 1.10	9.VII.87	Tests de d‚bordement, fin du paramŠtre panneau.
**  Ver. 1.11	12.VII.87	Gestion 'intelligente' des messages.
**  Ver. 1.12	27.VII.87	Version monochrome.
**  Ver. 1.13	31.VII.87	Void & Co.
**  Ver. 1.20	1.III.88	ve_puts/ve_puts2, plus de printf
**  Ver. 1.30	18.III.88	M‚moire locale pour sauvecran/rappelecran
**				Utilisation de types.h
**  Ver. 1.31	11.IV.88	Modification de clavier.h
**  Ver. 1.40	11.IV.88	Eclatement en modules; fin de sauvecran
**  Ver. 1.41	20.IV.88	Propre: booleen -> int2
**  Ver. 2.00	28.IV.88	Version r‚entrante, et alert_ok
**  Ver. 2.10	6.V.88		AccŠs direct ‚cran pour l'‚criture
**  Ver. 2.20	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 2.30	20.V.88 	E/S ‚volu‚es
**  Ver. 2.40	23.V.88 	VLIB 2.0
**  Ver. 2.41	30.VII.88	Utilisation de const
**
**  Ce module implante une gestion des boŒtes d'alerte telles qu'on les
**  trouve sous GEM.  Cela permet simplement et rapidement d'implanter
**  une question … choix multiples pr‚d‚termin‚s.
**  D‚placement du bouton actif par TAB et Shift TAB ou les flŠches G. & D.
**  Validation par RETURN ou ESPACE.
**
**  ParamŠtres:
**  -----------
**  propre:	 Si 1 ou 2, sauve l'‚cran recouvert. Si 1, le restitue en fin.
**  titre:	 Une chaŒne de titre ecadr‚e, "" si pas de titre.
**  c1,c2,c3,c4: Couleurs du titre, du texte, des boutons et du fond.
**  strmessage:  Le texte de la boŒte, ligne suivante par | ou \n.
**  bdefaut:	 Le bouton par d‚faut (de 1 … ...)
**  bescape:	 Code de retour si ESCAPE. Peut ˆtre quelconque, mˆme n‚gatif.
**  strbouton:	 Le texte des boutons, s‚par‚s par |.
**
**  Retour:
**  -------
**  Le num‚ro du bouton actif au moment de la validation.
**
**  Exemple: (avec des	#define de COULEURS.H)
**  --------
**  i=alert(0,"",VIOLET,ROUGE,BLEU,BLANC,"Vous pensez qu'on|continue ?|",
**	    1,3,"Oui|Non");
**
**  affichera la boŒte suivante:
**
**	   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
**	   º  Vous pensez qu'on º    <- pas de titre
**	   º  continue ?	º
**	   º			º    <- ligne blanche: strmessage termin‚ par |
**	   º  ÉÍÍÍÍÍ»  ÚÄÄÄÄÄ¿	º
**	   º  º OUI º  ³ NON ³	º    <- Oui par d‚faut
**	   º  ÈÍÍÍÍÍ¼  ÀÄÄÄÄÄÙ	º
**	   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
**
**  Version 1.12: monochrome
**  ------------------------
**  On ne tient compte que de la couleur du fond. Si elle vaut NOIR
**  (ou NOIR+BRILLANT), la boŒte est affich‚e en noir, boutons et titre en
**  surbrillance, le texte en caractŠres normaux.
**  Si le fond n'est pas noir, alors tout est affich‚ en noir sur fond vert
**  (ou ambre, ‡a d‚pend des moniteurs...)
**
**  Version 2.00: r‚entrance et alert_ok
**  ------------------------------------
**  A cause de hotkey, on peut appeler … nouveau alert quand on est dans alert;
**  du coup, toutes les variables sont locales, et le module r‚entrant.
**  alert_ok est une version simplifi‚e, qui propose uniquement le bouton ok,
**  et s'utilise en tant que proc‚dure.
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */

#include <stdio.h>	/* pour NULL */
#include <string.h>
void exit(int);

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

extern int2 am_lig,am_col;
extern const uint1 vt_lig,vt_col;

#include "couleurs.h"
#include "clavier.h"

#include "ecran.ref"
#include "curseur.ref"
#include "pa.ref"
#include "couleurs.ref"
#include "clavier.ref"
#include "chaine.ref"
#include "a0.ref"
#include "box.ref"
#include "vbios.ref"
#include "init.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "alert.ref"

static void near drawbouton(int2,int2,int2,int2,int2,int2,int2,int2,
			    const char * *);
static void near scan124(const char *,char * *,int2 *,int2 *);

/*============================================================================*/
/* Variables et d‚finitions priv‚es au module */

#define ACTIF  1		 /* Constantes pour la gestion des boutons    */
#define NORMAL 0

#define LMAX 20 		 /* Nb maxi de lignes de texte / boite	      */
#define BMAX 5			 /* Nb maxi de boutons par boite	      */

/*============================================================================*/

int2 alert(propre,titre,c1,c2,c3,c4,strmessage,bdefaut,bescape,strbouton)
      int2    propre;
      int2    bdefaut,bescape;
      couleur c1,c2,c3,c4;
const char    *titre,*strmessage,*strbouton;
{
  register int2 i;
  touche  c;
  int2	  lg1,lg2,lg3,bouton;
  int2	  scurs;		/* Sauvegarde du ve_curseur			*/
  char	  *p;
  char	  *tabmessage[LMAX],	/* Lignes du texte			     */
	  *tabbouton[BMAX];	/* messages des boutons 		     */
  int2	  lmaxmessage,		/* Longueur de la ligne de texte la + longue */
	  lmaxbouton;		/* Idem pour le bouton			     */
  int2	  nbmessage,		/* Nb de lignes de texte		     */
	  nbbouton;		/* Nb de boutons			     */
  int2	  l0,c0,		/* Coord du coin haut gauche de la boŒte     */
	  lg,ht,		/* Largeur et hauteur de la boŒte	     */
	  off,			/* D‚calge des boutons pour le centrage      */
	  voff; 		/* Offset vertical affichage texte et	     */
				/* bouton (3 si titre, 0 sinon) 	     */
  char	  buffer[80];		/* pour pr‚parer les chaŒnes … ‚diter	     */


  scurs  = ve_qcurseur();
  a0_save();

  ve_curseur(0);			   /* On travaille sans ve_curseur    */

  scan124(strmessage,tabmessage,&nbmessage,&lmaxmessage);     /* On d‚compose */
  if (nbmessage>LMAX)
  {
    vb_sorch("\nmsg=");
    vb_sorch(strmessage);
    vlib_err("(alert.c) alert: nbmessage>LMAX");
  }
  scan124(strbouton, tabbouton, &nbbouton ,&lmaxbouton);      /* les chaŒnes  */
  if (nbbouton>BMAX)
  {
    vb_sorch("\nbouton=");
    ve_puts(strbouton);
    vlib_err("(alert.c) alert: nbbouton>BMAX");
  }

  /* On calcule la largeur minimale que devrait avoir la boŒte pour afficher: */

  lg1 = (int2) ((*titre)?strlen(titre)+8:0);   /* le titre		      */
  lg2 = lmaxmessage+6;			       /* le texte		      */
  lg3 = (lmaxbouton+6)*nbbouton+4;	       /* les boutons		      */

  lg = (lg1>lg2)?lg1:lg2;		       /* On conserve la plus grande  */
  if (lg3>lg) lg=lg3;

  off = 0;		/* Si la ligne des boutons n'est pas la plus          */
  if (lg>lg3)		/* longue, on calcule un offset pour qu'elle soit     */
    off = (lg-lg3)/2;	/* centr‚e … l'affichage.                             */

  ht = nbmessage+2;	/* 2 = lignes du cadre				      */
  if (nbbouton) ht+=3;	/* Si il y a des boutons, 3 lignes de plus	      */
  if (lg1) ht+=3;	/* Si il y a un titre, 3 lignes en plus 	      */

  am_lig = l0 = (vt_lig-ht)/2+1;	       /* On centre … l'‚cran         */
  am_col = c0 = (vt_col-lg)/2+1;

  /* On sauvegarde ‚ventuellement l'‚tat de l'‚cran sous la boŒte             */
  if (propre) pa_push(l0,c0,ht,lg);

  ve_ccarfond(c2,c4);
  drawbox(l0,c0,ht,lg,"ÉÍ»ººÈÍ¼",1);

  ve_ccar(c1);
  if (lg1)		/* Si il y a un  titre, on l'affiche cent‚            */
  {
    i=(lg-lg1+1)/2;
    drawbox(l0+1,c0+i+2,3,lg1-4,"ÚÄ¿³³ÀÄÙ",0);
    ve_putslc(l0+2,c0+i+4,titre);
    voff=3;
  }
  else
    voff=0;

				    /* On affiche le texte...		     */
  if (nbmessage) ve_ccar(c2);
  for (i=0 ; i<nbmessage ; i++)
  {
    register int2 j=0;

    p = tabmessage[i];
    while (*p && *p!='|' && *p!='\n') buffer[j++]=*p++;
    buffer[j]=0;
    ve_putslc(l0+i+1+voff,c0+3,buffer);
  }

  bouton = bdefaut-1;		     /* bouton courant = bouton par d‚faut    */

  if (nbbouton)
  {				     /* et les boutons, sauf celui par d‚faut */
    ve_ccar(c3);
    for (i=0;i<nbbouton;i++)
      if (i!=bdefaut-1) drawbouton(i,NORMAL,l0,c0,voff,off,nbmessage,lmaxbouton,tabbouton);

    drawbouton(bouton,ACTIF,l0,c0,voff,off,nbmessage,lmaxbouton,tabbouton);	   /* Et on affiche le bouton courant	    */

    do
    { int2 b;

      c=vc_lircar();		     /* On scrute le clavier		      */

      if ( (b= (booleen)(c==K_TAB||c==K_RIGHT)) || c==K_LEFT||c==K_SHIFT_TAB)
      {
	drawbouton(bouton,NORMAL,l0,c0,voff,off,nbmessage,lmaxbouton,tabbouton);
	if (b) bouton = (bouton+1)%nbbouton;
	else   bouton = (bouton-1+nbbouton)%nbbouton;
	drawbouton(bouton,ACTIF,l0,c0,voff,off,nbmessage,lmaxbouton,tabbouton);
      }

    } while(c!=K_RET && c!=K_ESPACE && c!=K_ESC);

    if (c == K_ESC) bouton=bescape-1;	   /* -1 car return(bouton+1)	       */
  }

  /* On restitue ‚ventuellement la portion d'‚cran recouverte uniquement
  ** si propre vaut 1; dans le cas o— il vaut 2, c'est … l'appelant de
  ** faire le pa_pop();
  */
  if (propre==1) pa_pop();

  a0_restore();
  ve_curseur(scurs);			   /* restitution du curseur d'origine */
  return bouton+1;

} /* alert */

/*============================================================================*/

/* drawbouton	Routine interne … alert.  Dessine le bouton nbouton, typ
**		pouvant prendre la valeur NORMAL ou ACTIF.
**		NORMAL:  -> cadre simple    texte normal
**		ACTIF:	 -> cadre double    texte majuscules
*/

static void near drawbouton(nbout,typ,l0,c0,voff,off,nbmessage,lmaxbouton,tabbouton)
int2 nbout,typ,l0,c0,voff,off,nbmessage,lmaxbouton;
const char * tabbouton[];
{
  int2 off2,lg;
  register char c;
  char *p;
  char buffer[80];

  drawbox(l0+nbmessage+1+voff,c0+off+3+nbout*(lmaxbouton+6),3,lmaxbouton+4,
	  (typ==ACTIF)?"ÉÍ»ººÈÍ¼":"ÚÄ¿³³ÀÄÙ",0);
  lg = 0;
  p = (char *) tabbouton[nbout];
  while ((c=p[lg]) && c!='|') buffer[lg++]=(typ==ACTIF)?(char)majAZ(c):c;
  buffer[lg]=0;
  off2 = (lmaxbouton-lg)/2;
  ve_putslc(l0+nbmessage+2+voff,c0+off+off2+5+nbout*(lmaxbouton+6),buffer);

} /* drawbouton */

/*============================================================================*/

/* scan124	Routine interne … alert.  D‚compose la chaŒne constitu‚e
**		d'‚l‚ments s‚par‚s par des | en lignes du tableau tab.
**		Rend la longueur du plus long dans *lgmax et le nombre
**		d'‚l‚ments dans *nbmsg.
*/

static void near scan124(str,tab,nbmsg,lgmax)
int2 *nbmsg;
int2 *lgmax;
const char *str;
char *tab[];
{
  int2 i=0,lmax=0;
  char *p;

  p = (char *)str;
  while (*p)
  {
    p = (char *)str;
    *tab++=p;
    while (*p && (*p)!='|' && (*p)!='\n') p++;
    if ((int2)(p-(char *)str)>lmax) lmax = (int2)(p-(char *)str);
    str=p+1;
    i++;
  }

  *nbmsg=i;
  *lgmax=lmax;

} /* scan124 */

/*============================================================================*/

void alert_ok(titre,c1,c2,c3,c4,strmessage)
couleur c1,c2,c3,c4;
const char *titre,*strmessage;
{
  alert(1,titre,c1,c2,c3,c4,strmessage,1,1,"Ok");

} /* alert_ok */

