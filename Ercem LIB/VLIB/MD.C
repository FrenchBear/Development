
/* MD.C 	P.Violent	MSC 4.0|5.0 / MS-DOS
**
** Ver. 1.00	11.IV.88	P.Violent
** Ver. 1.01	11.V.88 	Modif des variables de vlib
** Ver. 1.10	17.V.88 	Importation de ses propres r‚f. pour MSC 5.0
** Ver. 1.20	20.V.88 	E/S ‚volu‚es de VLIB
** Ver. 2.00	23.V.88 	Plexus -> VLIB
**
**
** Gestion de menus horizontaux (routines md_xx)
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la bibliothŠque C std. */

#include <stdio.h>	/* pour NULL */
#include <string.h>
char *malloc(unsigned);

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

extern const uint1   vt_lig,vt_col,vb_io;
extern const booleen vt_couleur;
extern	     uint1   vb_at;

#include "couleurs.h"
#include "clavier.h"
#include "vdef.h"
#include "vconst.h"

#include "couleurs.ref"
#include "curseur.ref"  /* ve_gotolc */
#include "init.ref"     /* vlib_err */
#include "ecran.ref"    /* ve_putslca, ve_sorcar */
#include "clavier.ref"  /* vc_lircar */
#include "chaine.ref"   /* majAZ */
#include "a0.ref"       /* a0_save et a0_restore */
#include "pa.ref"

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s */

#include "menuder.h"

#include "md.ref"

/*============================================================================*/
/* Variables export‚es */

public booleen md_oknuage;
public booleen md_oktravail;

/* la table des acc‚l‚rateurs */
#define FKEYMAX  512+135
public MD_MENU *md_tabacc[FKEYMAX];

/*============================================================================*/
/* Variables et d‚finitions priv‚es au module */

static booleen attrib_impose = 0;

static uint1 AT_STD_ITEM;
static uint1 AT_SEL_ITEM;
static uint1 AT_XXX_ITEM;
static uint1 AT_STD_TITRE;
static uint1 AT_SEL_TITRE;
static uint1 AT_CADRE;

static touche md_stack[MD_STACKSIZE];
static int2   md_top;

static MD_MENU *md_p;

/* Le point de d‚part de l'arborscence */
static MD_STRUCT1 md_mstart;

/* table de conversion:  atoalt[lette-'A'] -> code de ALT_lettre */
static touche atoalt[] =
{
  K_ALT_A, K_ALT_B, K_ALT_C, K_ALT_D, K_ALT_E, K_ALT_F, K_ALT_G, K_ALT_H, K_ALT_I, K_ALT_J,
  K_ALT_K, K_ALT_L, K_ALT_M, K_ALT_N, K_ALT_O, K_ALT_P, K_ALT_Q, K_ALT_R, K_ALT_S, K_ALT_T,
  K_ALT_U, K_ALT_V, K_ALT_V, K_ALT_X, K_ALT_Y, K_ALT_Z
};

/*============================================================================*/
/* messages internes, codes de retour de md_execute_1menu() */

#define EXIT_FINI	1
#define EXIT_ESC	2
#define EXIT_PRECEDENT	3
#define EXIT_SUIVANT	4
#define EXIT_ACCEL	5

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

static void near md_defaut_setattrib(void);
static void near md_init_menu(MD_MENU *,MD_STRUCT1 *,int2,int2,int2);
static void near md_item(MD_STRUCT1 *,booleen);
static void near md_affiche_menu(MD_STRUCT1 *);
static void near md_efface_menu(void);
static int2 near md_execute_1menu(MD_STRUCT1 *);

/*============================================================================*/

void md_setattrib(std_item,xxx_item,sel_item,std_titre,sel_titre)
uint1 std_item,xxx_item,sel_item,std_titre,sel_titre;
{
  attrib_impose = 1;
  AT_STD_ITEM  = std_item;
  AT_XXX_ITEM  = xxx_item;
  AT_SEL_ITEM  = sel_item;
  AT_STD_TITRE = std_titre;
  AT_SEL_TITRE = sel_titre;

} /* md_setattrib */

/*============================================================================*/

static void near md_defaut_setattrib()
{
  if (!attrib_impose)
  {
    if (!vt_couleur)
    {
      AT_XXX_ITEM  = (uint1)(BLEU + 16*NOIR);
      AT_SEL_ITEM  = (uint1)(NOIR + 16*BLANC);
      AT_STD_TITRE = (uint1)(NOIR + 16*BLANC);
      AT_SEL_TITRE = (uint1)(BLANC|BRILLANT + 16*NOIR);
    }
    else
    {
      AT_XXX_ITEM  = (uint1)(BLANC + 16*NOIR);
      AT_SEL_ITEM  = (uint1)(JAUNE|BRILLANT + 16*ROUGE);
      AT_STD_TITRE = (uint1)(BLANC|BRILLANT + 16+BLEU);
      AT_SEL_TITRE = (uint1)(JAUNE|BRILLANT + ((vb_io==VO_DIRECT2)?0:16*ROUGE));
    }
    AT_STD_ITEM  = (uint1)(BLANC|BRILLANT + 16*NOIR);
    AT_CADRE = (uint1) VERT|BRILLANT;
  }

} /* md_defaut_setattrib */

/*============================================================================*/

static void near md_init_menu(m,bloc,niveau,ligne,colonne)
MD_MENU    *m;
MD_STRUCT1 *bloc;
int2 niveau,ligne,colonne;
{
  int2	     l,c;
  int2	     larg,ltext;
  int2	     item;
  MD_MENU    *p;
  MD_STRUCT1 *md_st1;

  larg = 0;
  item = 0;
  p = m;
  while (p->texte!=NULL)
  {
    if ((ltext=(int2)strlen(p->texte))>larg) larg=ltext;
    p++;
    item++;
  }

  /* correction du calcul automatique de la position pour que ‡a rentre
  ** dans l'‚cran
  */
  if (colonne+larg+2>vt_col) colonne=vt_col-larg-1;
  if (ligne+item+2>vt_lig) ligne=vt_lig-item-1;

  /* maj des infos du bloc du menu courant (sa structure MD_STRUCT1) */
  bloc->niveau	  = niveau;
  bloc->nbitem	  = item;
  bloc->ligne	  = ligne;
  bloc->colonne   = colonne;
  bloc->largeur   = larg;
  bloc->hauteur   = item;
  bloc->choix_rem = 0;

  p = m;
  item = 0;
  while (p->texte!=NULL)
  {
    /* mise … jour de la table des acc‚l‚rateurs */
    if (p->accel)
    {
/* ifdef DEBUG */
      if (md_tabacc[p->accel]!=NULL)
      {
	char message[100];
	sprintf(message,"(md.c) md_init_menu: L'acc‚l‚rateur de \"%s\" a d‚ja ‚t‚ utilis‚ pour \"%s\"...",
				     p->texte,p->accel,md_tabacc[p->accel]->texte);
	vlib_err(message);
      }
/* endif */
      md_tabacc[p->accel]=p;
    }

    if (p->type == MD_TY_MENU)
    {
      /* cr‚ation du poste */
      md_st1 = (MD_STRUCT1 *) malloc(sizeof(MD_STRUCT1));

      /* mise … jour du chaŒnage */
      md_st1->ptm   = p->u.ptr_menu;
      md_st1->pere  = bloc;
      md_st1->back  = p;
      p->u.ptr_menu = (MD_MENU *) md_st1;

      /* calcul des caract‚ristiques du sous_menu */
      if (niveau==0)	/* le menu horizontal */
      { c = colonne;
	l = ligne;
	colonne += (int2)(2+strlen(p->texte));
      }
      else		/* les menus verticaux */
      { c = colonne+larg+5;
	l = ligne+item+1;
      }
      /* traitement r‚cursif du sous_menu */
      md_init_menu(md_st1->ptm,md_st1,niveau+1,l,c);
    } /* cas item de type sous_menu */

    p++;
    item++;
  } /* while */

} /* md_init_menu */

/*============================================================================*/

void md_stocke(m)
MD_MENU *m;
{
  int2 i;

  /* initialisation de la racine du chaŒnage */
  md_mstart.ptm = m;

  /* initialisation de la table des acc‚l‚rateurs */
  for (i=0 ; i<FKEYMAX ; i++)
    md_tabacc[i] = NULL;
  md_tabacc[K_F10] = m;

  /* cr‚ation r‚cursive des postes MD_STRUCT1 associ‚s aux menus */
  md_init_menu(m,&md_mstart,0,2,3);

  /* initialisation des couleurs */
  md_defaut_setattrib();

} /* md_stocke */

/*============================================================================*/

void md_dessin()
{
  MD_MENU *p;
  int2 c=vt_col-1;
  uint1 old_at;

  old_at = vb_at;
  vb_at = AT_STD_TITRE;
  ve_gotolc(1,1);
  ve_sorcar(' ');
  p = md_mstart.ptm;
  while (p->texte!=NULL)
  { ve_sorcar(' ');
    ve_puts2(p->texte);
    ve_sorcar(' ');
    c -= (int2)strlen(p->texte)+2;
    p++;
  } /* while */

  while (c--) ve_sorcar(' ');
  vb_at = old_at;

} /* md_dessin */

/*============================================================================*/

static void near md_item(m,sel)
MD_STRUCT1 *m;
booleen    sel;
{
  uint1 at;
  char buffer[64],*texte;
  int2 i;
  int2 c  = m->colonne-2;
  int2 lg = m->largeur;

  if (sel)
    at = AT_SEL_ITEM;
  else
  {
    register int2 a = (m->ptm+m->choix_rem)->attrib;
    if (a==MD_AT_NUAGE && !md_oknuage || a==MD_AT_TRAV	&& !md_oktravail)
      at = AT_XXX_ITEM;
    else
      at = AT_STD_ITEM;
  }

  for (i=0 ; i<lg+2 ; i++) buffer[i]=' ';
  buffer[i]=0;
  texte = (m->ptm+m->choix_rem)->texte;
  for (i=(int2)strlen(texte) ; i-- ; ) buffer[i+1]=texte[i];

  ve_putslca(m->ligne+m->choix_rem+1,c+1,buffer,at);
} /* md_item */

/*============================================================================*/

static void near md_affiche_menu(m)
MD_STRUCT1 *m;
{
  MD_MENU *p;
  int2 l,c,ht,lg;
  int2 i,ii;
  static char *cadre = "ÚÄ·³ºÔÍ¼";

  l = m->ligne;
  c = m->colonne-2;
  ht = m->hauteur;
  lg = m->largeur;

  pa_push(l,c,ht+2,lg+4);

  ve_gotolc(l,c);
  vb_at = AT_CADRE;
  ve_sorcar(cadre[0]);
  for (i=lg+2 ; i-- ; ) ve_sorcar(cadre[1]);
  ve_sorcar(cadre[2]);

  p = m->ptm;
  ii = 0;
  while (p->texte != NULL)
  { ve_gotolc(l+1+ii,c);
    if (p->type == MD_TY_SEP)
    { ve_sorcar('Ã');
      for (i=lg+2 ; i-- ; ) ve_sorcar('Ä');
      ve_sorcar('¶');
    }
    else
    {
      ve_sorcar(cadre[3]);
      if (ii == m->choix_rem)
	vb_at = AT_SEL_ITEM;
      else
      {
	register booleen autorise=1;

	if (p->attrib==MD_AT_NUAGE && !md_oknuage) autorise = 0;
	if (p->attrib==MD_AT_TRAV  && !md_oktravail) autorise = 0;
	vb_at = autorise?AT_STD_ITEM:AT_XXX_ITEM;
      }
      ve_sorcar(' ');
      ve_puts2(p->texte);
      for (i=(int2)strlen(p->texte) ; i<lg+1 ; i++) ve_sorcar(' ');
      vb_at = AT_CADRE;
      ve_sorcar(cadre[4]);
    }
    p++;
    ii++;

  } /* while */

  ve_gotolc(l+ht+1,c);
  vb_at = AT_CADRE;
  ve_sorcar(cadre[5]);
  for (i=lg+2 ; i-- ; ) ve_sorcar(cadre[6]);
  ve_sorcar(cadre[7]);

} /* md_affiche_menu */

/*============================================================================*/

static void near md_efface_menu()
{
  pa_pop();
} /* md_efface_menu */

/*============================================================================*/

static int2 near md_execute_1menu(m)
MD_STRUCT1 *m;
{
  booleen exec;
  touche  c;
  int2	  exit_menu = 0;

  md_affiche_menu(m);
  while (!exit_menu)
  { exec = 0;
    if (md_top) c=md_stack[--md_top];
	   else c=vc_lircar();

    if (c==K_UP || c==K_DOWN || c==K_HOME || c==K_END)
    { md_item(m,0);
      if (c==K_HOME) m->choix_rem = 0;
      else if (c==K_END)  m->choix_rem = m->hauteur-1;
      else
      { do
	{ if (c==K_DOWN) m->choix_rem = (m->choix_rem+1)%m->hauteur;
		    else m->choix_rem = (m->choix_rem-1+m->hauteur)%m->hauteur;
	} while ((m->ptm+m->choix_rem)->type == MD_TY_SEP);
      }
      md_item(m,1);
    }
    else if (c==K_ESC)	 exit_menu = EXIT_ESC;
    else if (c==K_LEFT)  exit_menu = EXIT_PRECEDENT;
    else if (c==K_RIGHT) exit_menu = EXIT_SUIVANT;
    else if (c==K_RET || c==K_F10)   exec = 1;
    else
    { int2 i,j,k;
      booleen trouve = 0;
      booleen ta = 0;

      i = (m->choix_rem+1)%m->hauteur;
      for (j=0 ; !trouve && j<m->hauteur ; j++,i=(i+1)%m->hauteur)
      {
	k = majAZ(((m->ptm+i)->texte)[0]);
	if (k==majAZ(c) || (ta=(booleen)((m->ptm+i)->accel==c)) || (ta=(booleen)(k>='A' && k<='Z' && atoalt[k-'A']==c)) )
	{ md_item(m,0);
	  m->choix_rem = i;
	  md_item(m,1);
	  trouve = 1;
	  if (ta) exec=1; /* si accel ou K_ALT_lettre, on execute tout de suite */
	}
      }
      if (!trouve)
      {
	/* on v‚rifie ici si ce n'est pas l'acc‚lerateur d'un truc
	** imm‚diat, auquel cas on le lance.
	*/
	if (md_tabacc[c]!=NULL)
	{
	  MD_MENU *p = md_tabacc[c];
	  if (p->attrib == MD_AT_IMMED)
	    (*(p->u.ptr_fonc))();
	}
      }
    }

    if (exec)
    { if ((m->ptm+m->choix_rem)->type == MD_TY_EXIT)
      { md_p = m->ptm+m->choix_rem;
	exit_menu = EXIT_FINI;
      }
      else
      { int2 i;
	i = md_execute_1menu((MD_STRUCT1 *)(m->ptm+m->choix_rem)->u.ptr_menu);
	if (i==EXIT_FINI) exit_menu=i;
      }
    } /* if exec */

  } /* while */
  md_efface_menu();
  return exit_menu;

} /* MD_MENU */

/*============================================================================*/

MD_MENU *md_exec(m)
MD_MENU *m;
{
  MD_MENU    *q = md_mstart.ptm;
  MD_STRUCT1 *p;
  int2	     i,r;
  char	     titre[32];

  md_p = NULL;
  md_top = 0;

  p = (MD_STRUCT1 *) m->u.ptr_menu;
  while (p->niveau != 1)
  {
    md_stack[md_top++] = K_RET;
    md_stack[md_top++] = p->back->texte[0];	/* ! */
    p = p->pere;
  } /* while */

  /* On met dans i le num‚ro du menu de base correspondant */
  i = 0;
  while ((MD_STRUCT1 *)(q->u.ptr_menu) != p)
  { i++;
    q++;
  }

  a0_save();
  for(;;)
  {
    strcat(strcat(strcpy(titre," "),p->back->texte)," ");
    /* on passe le titre en attribut s‚l‚ctionn‚ */
    ve_putslca(1,p->colonne-1,titre,AT_SEL_TITRE);

    md_tabacc[K_F10] = p->back;
    r = md_execute_1menu(p);

    /* titre en vid‚o normale */
    ve_putslca(1,p->colonne-1,titre,AT_STD_TITRE);

    if (r==EXIT_FINI || r==EXIT_ESC) { a0_restore(); return md_p; }
    else if (r==EXIT_SUIVANT)	     i = (i+1)%md_mstart.nbitem;
    else if (r==EXIT_PRECEDENT)      i = (i-1+md_mstart.nbitem)%md_mstart.nbitem;

    p = (MD_STRUCT1 *) ((md_mstart.ptm+i)->u.ptr_menu);

  } /* for(;;) */

} /* md_exec */

