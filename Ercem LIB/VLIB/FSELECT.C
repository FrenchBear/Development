
/*  FSELECT.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	15.VIII.88	PremiŠre version, clavier uniquement.
**  Ver. 1.01	23.VIII.88	S‚lection dans la liste par initiale.
**				Tri de la liste par ordre alphab‚tique.
**
**  Module de s‚lection de fichiers.
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */

#include <stdio.h>		/* sprintf */
#include <malloc.h>
#include <string.h>
#include <search.h>
#include <ctype.h>

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

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
#include "input.ref"
#include "alert.ref"
#include "divers.ref"           /* exist */
#include "fill.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "fselect.ref"

static void near en_haut(int2);
static void near en_bas(int2);
static void near affiche_colonne(void);
static void near highlight(booleen);
static char * near joliformat(char *);
static void near selectparlettre(touche);
static int2 compare(char**, char**);

/*============================================================================*/
/* Variables et d‚finitions priv‚es au module */

#define NBMAXFICH 40
static touche exitkey[] = { K_ESC, K_TAB, K_RET, 0 };

static int2 ib,is;
static char *tabptr[NBMAXFICH];
static int2 nbfic;
static int2 l0b,htb;		/* boŒte de s‚l‚ction */
static int2 l0,c0;		/* cadre */
static int2 l0i,c0i;		/* z“ne de saisie */
static char base[64];
static char nomfic2[64];
static char nomfici[33];	/* nom en cours de saisie */
static couleur _c3,_c4;

/*============================================================================*/

char *strlwr(s)
char *s;
{
  char *ss = s;
  while (*s) { *s=tolower(*s); s++; }
  return ss;
}

/*============================================================================*/

/* mode:
** -----
**   0 - Aucun contr“le
**   1 - Le fichier doit exister
**   2 - Le fichier ne doit pas exister
**   3 - BoŒte de confirmation de l'‚crasement si le fichier existe
*/

int2 fileselect(titre,message,c1,c2,c3,c4,mode,nomfic,chemin,defaut,ext,info)
const char *titre,*message;
couleur c1,c2,c3,c4;
int2 mode;
char *nomfic;
const char *chemin,*defaut,*ext;
void (*info)(const char *,const char *);
{
  int2	  lg,ht;
  int2	  i,l;
  char	  c;
  int2	  lmsg,lmaxmsg,ltitre;
  int2	  voff;
  char	  *msg;
  int2	  lgb;
  char	  buf[64];
  booleen imode;
  touche  t;
  int2	  cr;
  char	  ext2[4];
  int2	  status;
  /* struct find_t buffer; */
  char	  cheminlocal[64], *ptrc;

  a0_save();

  _c3 = c3;
  _c4 = c4;

  strcpy(base,chemin);
  for (i=(int2)strlen(base) ; i-- ; )
  { c = base[i] = (char)majAZ(base[i]);
    if (c=='/') base[i]='\\';
  }

  l = (int2)strlen(base)-1;
  while (l>0 && (c=base[l])!='\\' &&  c!=':') base[l--]=0;

  strcpy(nomfici,defaut);
  for (i=(int2)strlen(nomfici) ; i-- ; ) nomfici[i]=(char)majAZ(nomfici[i]);
  strcpy(ext2,ext);
  for (i=(int2)strlen(ext2) ; i-- ; ) ext2[i]=(char)majAZ(ext2[i]);

  i = 0;
  lmaxmsg = 0;

  ht = 0;
  if (ltitre = (int2)strlen(titre)) ht = 3;

  lmsg = 0;
  msg = (char *)message;
  while (c=*msg++)
    if (c=='|')
    { ht++;
      if (lmsg>lmaxmsg) lmaxmsg = lmsg;
      lmsg = 0;
    }
    else
      lmsg++;

  lg = 36;
  if ((int2)strlen(chemin)+4>lg) lg=(int2)(strlen(chemin)+4);
  if (ltitre+8>lg) lg=ltitre+8;
  if (lmaxmsg+4>lg) lg=lmaxmsg+4;

  ht = vt_lig*2/3+5;

  l0 = (vt_lig-ht)/2+1;
  c0 = (vt_col-lg)/2+1;

  /* On sauvegarde ‚ventuellement l'‚tat de l'‚cran sous la boŒte             */
  pa_push(l0,c0,ht,lg);

  ve_ccarfond(c2,c4);
  drawbox(l0,c0,ht,lg,"ÉÍ»ººÈÍ¼",1);
  ve_sorcarlc(l0+ht-3,c0,'Ç');
  ve_sorcarlc(l0+ht-3,c0+lg-1,'¶');
  ve_fillc(l0+ht-3,c0+1,1,lg-2,'Ä');

  ve_ccar(c1);
  if (ltitre)
  {
    i = (lg-ltitre-4)/2;
    drawbox(l0+1,c0+i,3,ltitre+4,"ÚÄ¿³³ÀÄÙ",0);
    ve_putslc(l0+2,c0+i+2,titre);
    voff=3;
  }
  else
    voff=0;

  ve_ccar(c2);
  l0b = l0+voff+1;
  *buf = 0;
  i = 0;
  msg = (char *)message;
  while (c=*msg++)
    if (c=='|')
    { if (i)
      { buf[i] = 0;
	ve_putslc(l0b,c0+2,buf);
	i = 0;
      }
      l0b++;
    }
    else
      buf[i++] = c;
  if (i)
  { buf[i] = 0;
    ve_putslc(l0b++,c0+2,buf);
  }

  ve_ccar(c3);
  l0b++;

  l0i = l0b;
  c0i = c0+2;

  l0b += 2;
  ptrc = strlwr(strcpy(cheminlocal, chemin));
  while (c=*ptrc)
  {
    if (c=='/') *ptrc = '\\';
    ptrc++;
  }
  ve_putslc(l0b,c0+2,cheminlocal);

  l0b++;
  htb = l0+ht-l0b-3;
  lgb = 16;

  drawbox(l0b,c0+2,htb,lgb,"ÚÄ¿³³ÀÄÙ",0);
  ve_putslc(l0b+0,c0+lgb+1,"ÂÄÄÄ¿");
  ve_putslc(l0b+1,c0+lgb+1,"³  ³");
  ve_putslc(l0b+2,c0+lgb+1,"ÃÄÄÄ´");

  ve_putslc(l0b+htb-3,c0+lgb+1,"ÃÄÄÄ´");
  ve_putslc(l0b+htb-2,c0+lgb+1,"³  ³");
  ve_putslc(l0b+htb-1,c0+lgb+1,"ÁÄÄÄÙ");

  ve_fillc(l0b+3,c0+lgb+5,htb-6,1,'³');

  ve_putslc(l0b+htb-6,c0+lgb+7,"ÚÄÄÄÄÄÄÄÄÄ¿");
  ve_putslc(l0b+htb-5,c0+lgb+7,"³ Annuler ³");
  ve_putslc(l0b+htb-4,c0+lgb+7,"ÀÄÄÄÄÄÄÄÄÄÙ");
  ve_putslc(l0b+htb-3,c0+lgb+7,"ÉÍÍÍÍ»");
  ve_putslc(l0b+htb-2,c0+lgb+7,"º Ok º");
  ve_putslc(l0b+htb-1,c0+lgb+7,"ÈÍÍÍÍ¼");

/* version xenix de mise au point */
  nbfic=3;
  tabptr[0]="FIC1.A";
  tabptr[1]="FIC2.B";
  tabptr[2]="FIC3.C";

/*
  nbfic = 0;
  status = _dos_findfirst((char *)chemin,_A_NORMAL,&buffer); 
  while (status==0)
  { tabptr[nbfic] = alloca((int2)strlen(buffer.name)+1);
    strcpy(tabptr[nbfic++],buffer.name);
     status = _dos_findnext(&buffer); 
  }
*/

  /* tri des noms de fichier par ordre alphab‚tique */
  qsort(tabptr, nbfic, sizeof(char*), compare);

  imode = 0;
  ib = is = 0;

  affiche_colonne();

restart:
  for (;;)
    if (imode==0)
    {
      ve_putslc(l0+ht-2,c0+2,"[ÄÙ] valide, [Tab] -> liste ");
      t = inputlc(l0i,c0i,nomfici,32,"A1_\\:.",exitkey);
      if (t==K_RET) { cr=1;
		      if (nomfici[0]==0) cr=0;
		      goto suite; }
      if (t==K_ESC) { cr=0; goto suite; }
      imode = 1;
    }
    else
    {
      ve_putslc(l0+ht-2,c0+2,"[ÄÙ] [] [] [Tab] [F1]=info");
      highlight(1);
      for (;;)
      { t = vc_lircar();
	switch(t)
	{
	  case	 K_UP: en_haut(1); break;
	  case K_PGUP: en_haut(8); break;
	  case K_HOME: en_haut(100); break;

	  case K_DOWN: en_bas(1); break;
	  case K_PGDN: en_bas(8); break;
	  case	K_END: en_bas(100); break;

	  case	K_ESC: cr=0; goto suite;
	  case	K_RET: cr=1; goto suite;

	  case	 K_F1: strcat(strcpy(nomfic2,base),nomfici);
		       (*info)(nomfic2,nomfici);
		       break;

	  case	K_TAB: imode=0; highlight(0);
		       break;

	      default: /* traitement des lettres pour s‚lection directe */
		       selectparlettre(t);
	} /* switch */

	if (imode==0) break;

      } /* for ;; */

    } /* else */

suite:
  if (cr==1)
  { char buffer[200];
    booleen flag = 0;

    l = 0;
    while (!flag && (c=nomfici[l++])) flag = (booleen)(c=='\\' ||  c==':');
    if (!flag) strcat(strcpy(nomfic2,base),nomfici);
    else       strcpy(nomfic2, nomfici);

    flag = 0;
    l = (int2)strlen(nomfic2)-1;
    while (!flag && l>0 && (c=nomfic2[l--])!='\\' &&  c!=':')
      flag = (booleen) (c=='.');
    if (!flag)
      strcat(strcat(nomfic2,"."),ext2);

    switch (mode)
    {
      case 1: if (!exist(nomfic2))
	      { sprintf(buffer,"|Le fichier \"%s\" n'existe pas !|",nomfic2);
		i = alert(1,"Attention !",BLANC|BRILLANT,JAUNE|BRILLANT,BLANC,ROUGE,buffer,1,2,"Changer de nom|Abandonner");
		if (i==2)
		  cr = 0;
		else
		  goto restart;
	      }
	      break;

      case 2: if (exist(nomfic2))
	      { sprintf(buffer,"|Le fichier \"%s\" existe d‚j… !|",nomfic2);
		i = alert(1,"Attention !",BLANC|BRILLANT,JAUNE|BRILLANT,BLANC,ROUGE,buffer,1,2,"Changer de nom|Abandonner");
		if (i==2)
		  cr = 0;
		else
		  goto restart;
	      }
	      break;

      case 3: if (exist(nomfic2))
	      { sprintf(buffer,"|Le fichier \"%s\" existe d‚j… !|",nomfic2);
		i = alert(1,"Attention !",BLANC|BRILLANT,JAUNE|BRILLANT,BLANC,ROUGE,buffer,1,3,"Changer de nom|€a ne fait rien !|Abandonner");
		switch(i)
		{ case 3: cr=0; break;
		  case 1: goto restart;
		}
	      }
	      break;

    } /* switch */

  }

  pa_pop();
  a0_restore();

  if (cr==1)
    strcpy(nomfic,nomfic2);
  return cr;

} /* fileselect */

/*============================================================================*/

static void near en_haut(n)
int2 n;
{
  register int2 newis;

  if (is==0) return;
  newis = is-n;
  if (newis<0) newis = 0;

  if (newis<ib)
  { ib = newis;
    affiche_colonne();
  }
  else
    highlight(0);

  is = newis;
  highlight(1);

} /* en_haut*/

/*============================================================================*/

static void near en_bas(n)
int2 n;
{
  register int2 newis;

  if (is>=nbfic-1) return;
  newis = is+n;
  if (newis>=nbfic) newis = nbfic-1;

  if (newis>=ib+htb-2)
  { ib = newis-(htb-2)+1;
    affiche_colonne();
  }
  else
    highlight(0);

  is = newis;
  highlight(1);

} /* en_haut*/

/*============================================================================*/

static void near affiche_colonne()
{
  int2 j;

  ve_ccar(_c3);
  for (j=0 ; j<htb-2 && ib+j<nbfic; j++)
    ve_putslc(l0b+j+1,c0+3,joliformat(tabptr[ib+j]));

} /* affiche_colonne */

/*============================================================================*/

static void near highlight(at)
booleen at;
{
  if (at)
    ve_ccarfond(BLANC|BRILLANT,BLEU);
  else
    ve_ccarfond(_c3,_c4);

  ve_putslc(l0b+1+is-ib,c0+3,joliformat(tabptr[is]));

  if (at)
  { ve_ccarfond(_c3,_c4);
    strcpy(nomfici,tabptr[is]);
    ve_gotolc(l0i,c0i);
    ve_printf("%-12s",nomfici);
  }

} /* highlight*/

/*============================================================================*/

static char * near joliformat(nomfic)
char *nomfic;
{
  static char buffer[15];
  char c;
  int2 i = 0;

  buffer[i++]=' ';
  while (c = *nomfic++)
    if (c!='.')
      buffer[i++]=c;
    else
      while (i<=9) buffer[i++]=' ';

  while (i<14) buffer[i++]=' ';
  buffer[i] = 0;

  return buffer;

} /* joliformat  */

/*============================================================================*/

static void near selectparlettre (lettre)
touche lettre;
{
  int2 i;

  lettre = majAZ(lettre);
  if ((lettre>='A' && lettre<='Z') || lettre=='_')    /* test validit‚ touche */
  {
    for (i=is+1; i<nbfic; i++)	       /* recherche dans la suite de la liste */
      if (*tabptr[i]==(char)lettre) break;
    if (i<nbfic)		   /* on a trouv‚ une initiale correspondante */
    {
      is = i;
      if (is > ib+htb-2-1) ib = is;
      if (ib > nbfic-(htb-2)) ib = nbfic-(htb-2);
      if (ib<0) ib = 0;
      affiche_colonne();
      highlight(1);
      return;
    }

    for (i=0; i<is; i++)		       /* recherche en d‚but de liste */
      if (*tabptr[i]==(char)lettre) break;
    if (i<is)
    {
      is = i;
      if (is < ib) ib = is;
      if (ib > nbfic-(htb-2)) ib = nbfic-(htb-2);
      if (ib<0) ib = 0;
      affiche_colonne();
      highlight(1);
      return;
    }
    else bipbip(0);
  }
  else bipbip(0);

} /* selectparlettre() */

/*============================================================================*/

static int2 compare(p1, p2)
char **p1, **p2;
{
  return((int2)strcmp(*p1, *p2));

} /* compare() */

