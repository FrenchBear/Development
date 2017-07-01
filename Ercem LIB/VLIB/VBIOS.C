
/*  VBIOS.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	18.IV.88	P.Violent
**  Ver. 1.10	23.V.88 	VLIB 2.0
**  Ver. 1.11	30.VII.88	Utilisation de const
**
**
**  Entr‚es/sorties de bas niveau de VLIB pour E/S standards avec conversions
**  de type 'terminal 7 bits'.
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */

#include <stdio.h>

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

#include "vdef.h"

#include "clavier.h"

#include "curseur.ref"
#include "a0.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "vbios.ref"

static void near hardscroll(void);

/*============================================================================*/
/* d‚clarations et variables priv‚es au module */

static const char ansi8pc2[32]="\
 ùùood";

static const char ansi7us[256]="\
 OOo*tp.ooooo..*><|!PP_|^v><--^v !\"#$%&'()*+,-./0123456789:;<=>?\
@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~^\
CueaaaaceeeiiiAAEaAooouuyOUcLYPfaiounNao?--24!\"\":#$|++++++|+++++\
++++-++++++++=+++++++++++++OooooabGpEsmgTtZd80En=+><SS/=o../n2o ";

static const char ansi7fr[256]="\
 OOo*tp.ooooo..*><|!P]_|^v><--^v !\"#$%&'()*+,-./0123456789:;<=>?\
@ABCDEFGHIJKLMNOPQRSTUVWXYZ(\\)^_`abcdefghijklmnopqrstuvwxyz(!)~^\
Cu{aa@a\\ee}iiiAAEaAooou|yOUcLYPfaiounNao?--24!\"\":#$:++++++:+++++\
++++-++++++++=+++++++++++++OooooabGpEsmgTtZd80En=+><SS/=[../n2o ";

static const char conv_coul[8] = "04261537";

/*============================================================================*/
/* Variables import‚es */

extern const uint1   vb_io;
extern	     uint1   vb_lig,vb_col,vb_at,vb_curs;
extern const uint2   vt_col2;
extern	     uint2   vb_index;
extern	     uint1   far * vb_dptr;
extern const uint1   vt_lig,vt_col,vt_police,vt_type;
extern const booleen vt_couleur;
extern	     uint1   *_conv_at;
extern	     booleen _nconv;

/*============================================================================*/
/* Variables export‚es */

public uint1 vb_at_phy = 255;
public uint1 vb_lig_phy = 255, vb_col_phy;
public uint1 vb_curs_phy = 255;

/*============================================================================*/

void vb_sorcar0(c)
unsigned char c;
{
  if (vb_io==VO_DOS)
    putchar(c);

} /* vb_sorcar0 */

/*============================================================================*/

void vb_sorch0(texte)
const char *texte;
{
  while (*texte) vb_sorcar0(*texte++);

} /* vb_sorch0 */

/*============================================================================*/

void vb_refresh()
{
  if (vb_lig!=vb_lig_phy || vb_col!=vb_col_phy || vb_io!=VO_DOS)
    vb_gotolc(vb_lig,vb_col);

  if (vb_at_phy!=vb_at)
    vb_setattrib(vb_at);

} /* vb_refresh*/

/*============================================================================*/

void vb_sorcar(c)
unsigned char c;
{
  /* en mode dos, on positionne le curseur s'il n'est pas au bon endroit, ainsi
  ** que l'attribut s'il n'est pas correct
  */
  if (vb_io==VO_DOS)
    vb_refresh();

  /* traitement du caractŠre sp‚cial saut de ligne */
  if (c=='\n')
  {
    vb_lig++;
    vb_col=0;
    vb_index = vt_col2*vb_lig;

    if (vb_io==VO_DOS) vb_sorcar0(c);

    if (vb_lig==vt_lig) 		/* \n sur la derniŠre ligne */
      hardscroll();			/* scroll dans l'image ‚cran */

    vb_lig_phy=vb_lig;
    vb_col_phy=vb_col;
    return;
  }

  /* conversion de police ‚ventuelle */
  if (_nconv)
    switch(vt_police)
    {
      case VP_ASCII8PC2: if (c<' ') c = ansi8pc2[c]; break;
      case VP_ASCII7US:  c = ansi7us[c]; break;
      case VP_ASCII7FR:  c = ansi7fr[c]; break;
    }

  /* stockage dans l'‚cran (mode direct) ou dans l'image ‚cran (autres modes) */
  vb_dptr[vb_index++] = c;
  vb_dptr[vb_index++] = vb_at_phy;

  /* sortie 'physique' pour les modes non directs */
  if (vt_type!=VT_DIRECT)
    vb_sorcar0(c);

  /* progression du curseur */
  vb_col++;
  if (vb_col==vt_col)
  { vb_col=0;
    vb_lig++;
    if (vb_lig==vt_lig) hardscroll();
  }

  vb_lig_phy=vb_lig;
  vb_col_phy=vb_col;

} /* vb_sorcar */

/*============================================================================*/

void vb_sorch(texte)
const char *texte;
{
  while (*texte) vb_sorcar(*texte++);

} /* vb_sorch */

/*============================================================================*/

static void near hardscroll()
{
  register int2 s,d,i;
  uint2 far *vb_dptr2 = (uint2 far *)vb_dptr;
  uint2 at2 = (vb_at<<8)+' ';

  vb_lig = vt_lig-1;
  vb_index = vt_col2*vb_lig+2*vb_col;	/* et pas vt pour les 2 derniers */

  s = vt_col;
  d = 0;
  for (i=(vt_lig-1)*vt_col ; i-- ; )
    vb_dptr2[d++]=vb_dptr2[s++];
  for(i=vt_col ; i-- ; )
    vb_dptr2[d++] = at2;

} /* hardscroll  */

/*============================================================================*/

touche vb_lircar()
{
    int2 c;

    c = (unsigned char) getchar();
    if (c<=1)				/* ^A permet de rentrer une comb. sp. */
      c = ((unsigned char) getchar())+FKEY;

    return c;

} /* vb_lircar */

/*============================================================================*/

/* vb_cardispo	Retour vrai si un caractŠre est disponible dans le buffer
**		clavier: cela ‚vite d'appeler inkey qui reste bloqu‚
**		si aucun caractŠre n'est disponible...
*/

booleen vb_cardispo()
{
  return 0;

} /* vb_cardispo */

/*============================================================================*/

void vb_setattrib(new_at)
uint1 new_at;
{
  vb_at_phy = vb_at = new_at;

  /* envoi de la chaŒne ANSI */
  if (vb_io==VO_DOS)
  {
    uint1 c1,c2;
    booleen mtel = (booleen)(vt_type==VT_M1B80);

    c1 = (uint1) new_at&7;
    c2 = (uint1) (new_at>>4)&7;

    vb_sorch0(mtel?"\033[0m":"\033[0");
    if (new_at&0x08) vb_sorch0(mtel?"\033[1m":";1");
    if (new_at&0x80) vb_sorch0(mtel?"\033[5m":";5");

    if (vt_couleur)
    { vb_sorch0(";3");
      vb_sorcar0(conv_coul[c1]);
      vb_sorch0(";4");
      vb_sorcar0(conv_coul[c2]);
    }
    else
    { if (c1==1) vb_sorch0(mtel?"\033[4m":";4");
      if (c1==0) vb_sorch0(mtel?"\033[7m":";7");
    }

    if (!mtel) vb_sorcar0('m');
  }

} /* vb_setattrib */

/*============================================================================*/

void vb_gotolc(l,c)
uint1 l,c;
{
  vb_lig_phy = vb_lig = l;
  vb_col_phy = vb_col = c;
  vb_index = vt_col2*l+c+c;

  if (vb_io==VO_DOS)
  {
    int2 l2=l+1;
    int2 c2=c+1;

    vb_sorch0("\033[");
    if (l2>=10) vb_sorcar0((char)(l2/10+'0'));
    if (l2>1) vb_sorcar0((char)(l2%10+'0'));
    if (l2>1 || c2>1) vb_sorcar0(';');
    if (c2>=100) vb_sorcar0((char)(c2/100+'0'));
    if (c2>=10) vb_sorcar0((char)((c2/10)%10+'0'));
    if (c2>1) vb_sorcar0((char)(c2%10+'0'));
    vb_sorcar0('H');
  }

} /* vb_gotolc */

/*============================================================================*/

void vb_wherelc(l,c)
uint1 *l,*c;
{
    *l = vb_lig;
    *c = vb_col;

} /* vb_wherelc */

/*============================================================================*/

/* les nouvelles valeurs sont destin‚es aux adaptateurs compaq, pas tout …
** fait standards dans ce domaine...
*/

void vb_curseur(typ)
uint1 typ;
{

} /* vb_curseur */

/*============================================================================*/

/* vb_clszone	efface la zone d'‚cran comprise entre les lignes debutzone et
**		finzone comprises, (de 0 … vt_lig-1) c'est … dire qu'on la remplit
**		avec des espaces ayant l'attribut courant.
**		si debutzone=0 et finzone=vt_lig-1, efface tout l'‚cran et
**		ramŠne le curseur au sommet … gauche.
*/

void vb_clszone(debutzone,finzone)
uint1 debutzone,finzone;
{
  int2	   far *d;
  int2	   val;
  register int2  i;

  if (vb_at_phy!=vb_at)
    vb_setattrib(vb_at);

  d = (int2 far *) (vb_dptr+debutzone*vt_col2);
  val = (int2)(' ' + (vb_at<<8));

  for(i=vt_col*(finzone-debutzone+1) ; i-- ;)
    *d++ = val;

  if (vb_io == VO_DOS)
  {
    if (debutzone==0 && finzone==vt_lig-1)	/* effacement total */
    {
      vb_sorch0("\033[2J\033[H");
      vb_lig_phy = vb_col_phy = 0;
    }
    else					/* effacement partiel */
    {
      vb_gotolc(debutzone,0);
      for (i=debutzone ; i<=finzone ; i++)
      { vb_sorch0("\033[K");
	if (i!=finzone) vb_sorcar0('\n');
      }
      vb_lig_phy = finzone;
      vb_col_phy = 0;
    }
  } /* VO_DOS */

  vb_lig = debutzone;
  vb_col = 0;
  vb_index = vt_col2*vb_lig;

} /* vb_clszone */

/*============================================================================*/

void vb_supligne(n,ligne)
uint1 n,ligne;
{
  int2 n2=n;

  vb_gotolc(ligne,0);
  vb_sorch0("\033[");
  if (n2>=10) vb_sorcar0((char)(n2/10+'0'));
  if (n2>1) vb_sorcar0((char)(n2%10+'0'));
  vb_sorcar0('M');

} /* vb_supligne */

void vb_insligne(n,ligne)
uint1 n,ligne;
{
  int2 n2=n;

  vb_gotolc(ligne,0);
  vb_sorch0("\033[");
  if (n2>=10) vb_sorcar0((char)(n2/10+'0'));
  if (n2>1) vb_sorcar0((char)(n2%10+'0'));
  vb_sorcar0('L');

} /* vb_insligne */

