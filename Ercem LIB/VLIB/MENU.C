
/*  MENU.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	2.VII.87	Version initiale.
**  Ver. 1.10	4.VII.87	Gestion des touches (tabkey)
**  Ver. 1.11	12.VII.87	Inversion du choix courant
**  Ver. 1.12	27.VII.87	Version monochrome
**  Ver. 1.13	31.VII.87	Void & Co.
**  Ver. 1.14	31.VII.87	Gestion de Home et End
**  Ver. 1.20	18.III.88	M‚moire locale pour sauvecran/rappelecran
**				Utilisation de types.h
**  Ver. 1.21	30.III.88	Longueur fixe de lgmaxitem pour le choix courant
**  Ver. 1.22	11.IV.88	Modification de clavier.h
**  Ver. 1.30	11.IV.88	Eclatement en modules; fin de sauvecran
**  Ver. 1.31	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.20	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 1.30	23.V.88 	VLIB 2.0
**  Ver. 1.31	30.VII.88	Utilisation de const
**
**
**  Ce module implante une gestion simple de menus.
**  D‚placement du choix actif par TAB et Shift TAB ou les flŠches H. & B.
**  Validation par RETURN ou ESPACE.
**  A chaque menu il est possible d'associer une touche dans tabkey.
**
**  Cette routine n'a ‚t‚ test‚e qu'en couleurs CGA. Je ne sais pas
**  ce qu'elle peut donner sur un adaptateur N&B.
**
**
**  ParamŠtres:
**  -----------
**  propre:	 Si 1 ou 2, sauve l'‚cran recouvert. Si 1, le restitue en fin.
**  titre:	 Une chaŒne de titre ecadr‚e, "" si pas de titre.
**  c1,c2,c3,c4: Couleurs du titre, du texte, des choix et du fond.
**  idefaut:	 Item par d‚faut (de 1 … ...)
**  tabmsg:	 Tableau des messages, termin‚ par une chaŒne vide.
**		 Les choix commencent par *, suivis par la caractŠre assici‚,
**		 c'est … dire celui qui valude directement l'option.
**  tabkey:	 La liste des touches qui valident directement les choix.
**		 Codes de CLAVIER.H. tabkey[0] est le code de la sortie
**		 sans r‚ponse (retour: 0), g‚n‚ralement ESC.
**		 Une lettre E dans tabkey correspond au clavier aussi bien
**		 … la touche E qu'aux touches e, ‚, ..., mais un e dans
**		 tabkey ne sera pas valid‚ par la touche E. Aussi mettre
**		 des majuscules dans TABKEY.
**
**  Retour:
**  -------
**  Le num‚ro de l'item actif au moment de la validation. Vaut 1 pour le 1er
**  choix (la 1Šre ligne de tabmsg commen‡ant par une ‚toile), et 0 pour
**  la sortie sans r‚ponse.
**
**  Exemple:
**  --------
**  char *tabmsg[]=
**  {
**    " ",
**    "Quel est votre choix ? ",
**    " ",
**    "*1 - On continue",
**    "*2 - On r‚fl‚chit",
**    "*F - On s'arrˆte",
**    "";
**  }
**
**  int tabkey[] = { ESC,'1','2','F' };
**
**  i = menu(0,"Joli titre!",ROUGE,ROUGE,BLEU,BLANC,tabmsg,tabkey,1);
**
**  affichera le menu suivant:
**
**		 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
**		 º   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿   º
**		 º   ³ Joli titre! ³   º
**		 º   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ   º
**		 º		       º
**		 º  Que faites-vous?   º
**		 º		       º
**		 º > 1 - ON CONTINUE   º
**		 º   2 - On r‚fl‚chit  º
**		 º   F - On s'arrˆte   º
**		 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
**
**
**  Version 1.12: monochrome
**  ------------------------
**  On ne tient compte que de la couleur du fond. Si elle vaut NOIR
**  (ou NOIR+BRILLANT), le cadre est affich‚ en noir, choix et titre en
**  surbrillance, le texte en caractŠres normaux.
**  Si le fond n'est pas noir, alors tout est affich‚ en noir sur fond vert
**  (ou ambre, ‡a d‚pend des moniteurs...)
**  Dans les deux cas, le choix courant est affich‚ en vid‚o invers‚e,
**  pr‚c‚d‚ d'une flŠche clignottante.
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */

#include <string.h>

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

extern int2 am_lig,am_col;
extern const uint1 vt_lig,vt_col;
extern const booleen vt_couleur;

#include "clavier.h"
#include "couleurs.h"

#include "curseur.ref"
#include "box.ref"
#include "pa.ref"
#include "couleurs.ref"
#include "ecran.ref"
#include "clavier.ref"
#include "chaine.ref"
#include "a0.ref"
#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "menu.ref"

static void near drawitem(int2,int2,couleur,couleur);

/*============================================================================*/
/* Variables et d‚finitions priv‚es au module */

#define MAXMENU 15
#define NORMAL	 0
#define ACTIF	 1

static int2 l0,c0,		/* Coord du coin haut gauche du cadre	     */
	    lg,ht,		/* Largeur et hauteur du cadre		     */
	    voff;		/* Offset vert. textes (3 si titre, 0 sinon) */

static int2 tabindex[MAXMENU],tablig[MAXMENU];
static char *tablib[MAXMENU];
static int2 nbitem;
static int2 lgmaxitem;		/* Taille du plus long choix (version 1.21)  */

/*============================================================================*/

int2 menu(propre,titre,c1,c2,c3,c4,tabmsg,tabkey,idefaut)
int2	      propre;
int2	      idefaut;
const touche  *tabkey;
const char    *titre,*tabmsg[];
couleur       c1,c2,c3,c4;
{
  register int2 i,j;
  touche  c;
  int2	  lg1,lg2,item;
  booleen termine;
  int2	  lgmaxmessage,nbmessage;
  int2	  scurs;

  scurs  = ve_qcurseur();

  a0_save();
  ve_curseur(0);		     /* On travaille sans curseur		*/

  /* On calcule la largeur minimale que devrait avoir la boŒte pour afficher */

  lg1 = (*titre)?(int2)(strlen(titre)+8):0;   /* le titre		     */
  lgmaxmessage = 0;
  lgmaxitem = 0;
  nbmessage = 0;
  while (j=(int2)strlen(tabmsg[nbmessage])) /* correct, pas ==		   */
  {
    if (j>lgmaxmessage) lgmaxmessage=j;
    if (tabmsg[nbmessage][0]=='*' && j-1>lgmaxitem) lgmaxitem=j-1;
    nbmessage++;
  }
  lg2 = lgmaxmessage+7; 		      /* le texte		     */


  lg = (lg1>lg2)?lg1:lg2;		      /* On conserve la plus grande. */

  ht = nbmessage+2;
  if (lg1) ht=ht+3;			      /* titre = 3 lignes en plus    */

  am_lig = l0 = (vt_lig-ht)/2+1;	      /* On centre … l'‚cran         */
  am_col = c0 = (vt_col-lg)/2+1;

  /* On sauvegarde ‚ventuellement l'‚tat de l'‚cran sous la boŒte            */
  if (propre) pa_push(l0,c0,ht,lg);

  ve_ccarfond(c2,c4);		     /* On dessine le cadre de type plein (1)	*/
  drawbox(l0,c0,ht,lg,"ÉÍ»ººÈÍ¼",1);

  if (lg1)			  /* Si il y a un  titre, on l'affiche cent‚ */
  {
    ve_ccar(c1);
    i=(lg-lg1)/2;
    drawbox(l0+1,c0+i+2,3,lg1-4,"ÚÄ¿³³ÀÄÙ",1);
    ve_putslc(l0+2,c0+i+4,titre);
    voff=3;
  }
  else
    voff=0;

  nbitem=0;
  j=l0+voff+1;
  for (i=0 ; i<nbmessage ; i++,j++)
  {
    if (*tabmsg[i]!='*')
    {
      ve_ccar(c2);
      ve_putslc(j,c0+3,tabmsg[i]);
    }
    else
    {
      ve_ccar(c3);
      tabindex[nbitem]=i;
      tablig[nbitem]=j;
      ve_putslc(j,c0+5,tablib[nbitem++] = (char *)tabmsg[i]+1);
    }
  }

  item = idefaut-1;		/* choix courant = choix par d‚faut	*/
  drawitem(item,ACTIF,c3,c4);	/* Et on affiche le choix courant	*/

  termine = 0;
  do
  {
    c=vc_lircar();		/* On scrute */

    if ( c==K_TAB || c==K_DOWN || c==K_UP || c==K_SHIFT_TAB || c==K_HOME || c==K_END)
    {
      drawitem(item,NORMAL,c3,c4);
      switch(c)
      {
	case K_TAB:
	case K_DOWN: item = (item+1)%nbitem;	      break;
	case K_SHIFT_TAB:
	case K_UP:   item = (item-1+nbitem)%nbitem;   break;
	case K_HOME: item = 0;			      break;
	case K_END:  item = nbitem-1;
      }
      drawitem(item,ACTIF,c3,c4);
    }
    else
    {
      touche b;

      for (i=0 ; i<nbitem && !termine ; i++)
      {
	if ((b=tabkey[i+1])<0) b+=256;	 /* cas o— les constantes char */
					 /* de l'appelant sont sign‚es */
	if (c==b || majAZ(c)==b)
	{
	  if (item!=i)
	  {
	    drawitem(item,NORMAL,c3,c4);
	    item=i;
	    drawitem(item,ACTIF,c3,c4);
	  }
	  termine = 1;
	}
      }
    }
  } while(c!=K_RET && c!=K_ESPACE && c!=tabkey[0] && !termine);

  if (c==tabkey[0]) item=0;
  else		    item++;

  /* On restitue ‚ventuellement la portion d'‚cran recouverte                */
  if (propre==1) pa_pop();

  a0_restore();
  ve_curseur(scurs);

  return(item);

} /* menu */

/*============================================================================*/

static void near drawitem(n,typ,coul,fond)
register int2 n,typ;
couleur coul,fond;
{
  register int2 j,k;
  char c;

  if (typ==ACTIF) ve_ccar(coul|CLIGNOTANT);
  ve_gotolc(tablig[n],c0+2);
  vb_sorcar((char)(typ==ACTIF?26:32));
  vb_sorcar(' ');

  if (typ==ACTIF)
    if (vt_couleur)
      ve_ccarfond(BLANC|BRILLANT,BLEU);
    else
      if (fond==0)
	 ve_ccarfond(NOIR,BLANC);
      else
	 ve_ccarfond(BLANC|BRILLANT,NOIR);
  else ve_ccar(coul);

  vb_sorcar(' ');
  for(j=0,k=(int2)strlen(tablib[n]) ; j<k ; j++)
  {
    c=tablib[n][j];
    vb_sorcar((typ==ACTIF)?(char)majAZ(c):c);
  }
  while(k++<lgmaxitem) vb_sorcar(' ');             /* Version 1.21 */
  vb_sorcar(' ');
  if (typ==ACTIF) ve_ccarfond(coul,fond);

} /* drawitem */

