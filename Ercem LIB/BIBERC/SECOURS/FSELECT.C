/*  fselect.c	BoŒte de s‚lection de fichiers
**
** 15/08/88	1.00	PremiŠre version, clavier uniquement.
** 23/08/88	1.01	S‚lection dans la liste par initiale.
** 01/02/92	2.0	Version Unix
**  9/05/92	Unix Sys V 3.2 R 4.0
** 23/03/93	2.1	Plus de refresh avant un getch !
**  9/04/94 PV	drawbox->wdrawbox, dans box.c. Fin de curses.ref
** 20/06/94 PV	Utilisation de vpanel
**  3/12/94 PV	Dépoussiérage, compatibilité rapide avec Dos, fin de near
*/

/*====================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C stand */

#include <stdio.h>
#include <io.h>
#include <ctype.h>

#include <clib.ref>
#include "biberc.h"

/*====================================================================*/
/* prototypes des fonctions et proc‚dures du module */

static void en_haut(int);
static void en_bas(int);
static void affiche_colonne(void);
static void highlight(int);
static char *joliformat(char *);
static void selectparlettre(int);
static int compare(const char**, const char**);

/*====================================================================*/
/* Variables et d‚finitions priv‚es au module */

#define NBMAXFICH 100

static int ib,is;
static char *tabptr[NBMAXFICH];
static int nbfic;
static int l0b,htb;		/* boŒte de s‚l‚ction */
static int l0,c0;		/* cadre */
static int l0i,c0i;		/* z“ne de saisie */
static char base[64];
static char nomfic2[64];
static char nomfici[34];	/* nom en cours de saisie */

static WINDOW *win;

extern UC *szBoxd, *szBoxs;

/*====================================================================*/

int exist(szNomfic)
char *szNomfic;
{
  int h = open(szNomfic,0);
  if (h<0) return 0;
  close(h);
  return 1;
}

/*====================================================================*/

/* mode:
** -----
**   0 - Aucun contr“le
**   1 - Le fichier doit exister
**   2 - Le fichier ne doit pas exister
**   3 - BoŒte de confirmation de l'‚crasement si le fichier existe
*/

int fileselect(titre,message,mode,nomfic,chemin,defaut,ext)
char *titre,*message;
int mode;
char *nomfic;
char *chemin,*defaut,*ext;
{
  int	  lg,ht;
  int	  i,l;
  int	  lmsg,lmaxmsg,ltitre;
  int	  voff;
  char	  *msg;
  int	  lgb;
  char	  c, buf[64];
  int	  imode;
  int	  t;
  int	  cr;
  char	  ext2[4];

  strcpy(base,chemin);

  l = (int)strlen(base)-1;
  while (l>0 && (c=base[l])!='/' &&  c!=':') base[l--]=0;

  strcpy(nomfici,defaut);
  strcpy(ext2,ext);

  i = 0;
  lmaxmsg = 0;

  ht = 0;
  if (ltitre = (int)strlen(titre)) ht = 3;

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

  lg = 38;
  if ((int)strlen(chemin)+4>lg) lg=(int)(strlen(chemin)+4);
  if (ltitre+8>lg) lg=ltitre+8;
  if (lmaxmsg+4>lg) lg=lmaxmsg+4;

  ht = LINES*2/3+5;

  l0 = (LINES-ht)/2;
  c0 = (COLS-lg)/2;

  refresh();
  win = newwin2(ht,lg,l0,c0);
  InitWin(win);

  wdrawbox(win,szBoxd,0,0,ht,lg);
  mvwaddch(win,ht-3,0,(unsigned char)'Ç');
  for (i=lg-2 ; i-- ;)
    waddch(win, (unsigned char)'Ä');
  waddch(win, (unsigned char)'¶');

  if (ltitre)
  {
    i = (lg-ltitre-4)/2;
    wdrawbox(win,szBoxs,1,i,3,ltitre+4);
    mvwaddstr(win,2,i+2,titre);
    voff=3;
  }
  else
    voff=0;

  l0b = voff+1;
  *buf = 0;
  i = 0;
  msg = (char *)message;
  while (c=*msg++)
    if (c=='|')
    { if (i)
      { buf[i] = 0;
	mvwaddstr(win,l0b,2,buf);
	i = 0;
      }
      l0b++;
    }
    else
      buf[i++] = c;
  if (i)
  { buf[i] = 0;
    mvwaddstr(win,l0b++,2,buf);
  }

  l0b++;

  l0i = l0b;
  c0i = 2;

  l0b += 2;
  mvwaddstr(win,l0b,2,chemin);

  l0b++;
  htb = ht-l0b-3;
  lgb = 18;

  wdrawbox(win, szBoxs, l0b,2,htb,lgb);
  mvwaddstr(win,l0b,lgb+1,"ÂÄÄÄ¿");
  mvwaddstr(win,l0b+1,lgb+1,"³ ^ ³");
  mvwaddstr(win,l0b+2,lgb+1,"ÃÄÄÄ´");

  mvwaddstr(win,l0b+htb-3,lgb+1,"ÃÄÄÄ´");
  mvwaddstr(win,l0b+htb-2,lgb+1,"³ v ³");
  mvwaddstr(win,l0b+htb-1,lgb+1,"ÁÄÄÄÙ");

  for (i=0 ; i<htb-6 ; i++)
    mvwaddch(win, l0b+3+i, lgb+5, (unsigned char)'³');

  mvwaddstr(win,l0b+htb-6,lgb+7,"ÚÄÄÄÄÄÄÄÄÄ¿");
  mvwaddstr(win,l0b+htb-5,lgb+7,"³ Annuler ³");
  mvwaddstr(win,l0b+htb-4,lgb+7,"ÀÄÄÄÄÄÄÄÄÄÙ");
  mvwaddstr(win,l0b+htb-3,lgb+7,"ÉÍÍÍÍ»");
  mvwaddstr(win,l0b+htb-2,lgb+7,"º Ok º");
  mvwaddstr(win,l0b+htb-1,lgb+7,"ÈÍÍÍÍ¼");

#ifdef UNIX
  { char szCmd[64], szNomfic[80];
    FILE *p;
    nbfic = 0;
    sprintf(szCmd, "ls %s", chemin);
    p = popen(szCmd, "r");
    while (fgets(szNomfic, 80, p)!=NULL)
    {
      i = strlen(szNomfic)-1;
      szNomfic[i--] = 0;
      while (i && szNomfic[i]!='/') i--;
      if (szNomfic[i]=='/') i++;
      tabptr[nbfic] = malloc(1+strlen(szNomfic+i));
      strcpy(tabptr[nbfic], szNomfic+i);
      nbfic++;
      if (nbfic==NBMAXFICH) break;
    }
    pclose(p);
  }
#endif

  /* tri des noms de fichier par ordre alphab‚tique */
  qsort((void *)tabptr, nbfic, sizeof(char*), compare);

  imode = 0;
  ib = is = 0;

  affiche_colonne();

  for (;;)
    if (imode==0)
    {
      mvwaddstr(win,ht-2,2,"[<ÄÙ] valide, [Tab] -> liste ");
      /* wrefresh(win); */
      t = iWInput(win,l0i,c0i,nomfici,33,33,"a1_/:.");
      if (t==KEY_RETURN) { cr=1;
		      if (nomfici[0]==0) cr=0;
		      goto suite; }
      if (t==KEY_ESCAPE) { cr=0; goto suite; }
      if (t==KEY_TAB || t==KEY_DOWN)
	imode = 1;
    }
    else
    {
      mvwaddstr(win,ht-2,2,"[<ÄÙ] [^] [v] [Tab] -> saisie");
      highlight(1);
      for (;;)
      { /* wrefresh(win); */
	t = wgetch2(win);
	switch(t)
	{
	  case	 KEY_UP: if (is==0)
			   imode = 0;
			 else
			   en_haut(1); break;
	  case KEY_PGUP: en_haut(8); break;
	  case KEY_HOME: en_haut(100); break;

	  case KEY_DOWN: en_bas(1); break;
	  case KEY_PGDN: en_bas(8); break;
	  case	KEY_END: en_bas(100); break;

	  case	KEY_ESCAPE: cr=0; goto suite;
	  case	KEY_RETURN: cr=1; goto suite;

	  case	KEY_TAB: imode=0; highlight(0);
		       break;

	      default: /* traitement des lettres pour s‚lection directe */
		       selectparlettre(t);
	} /* switch */

	if (imode==0) break;

      } /* for ;; */

    } /* else */

suite:
  if (cr==1)
  { 
    int flag = 0;

    l = 0;
    while (!flag && (c=nomfici[l++])) flag = (int)(c=='/' ||  c==':');
    if (!flag) strcat(strcpy(nomfic2,base),nomfici);
    else       strcpy(nomfic2, nomfici);

    flag = 0;
    l = (int)strlen(nomfic2)-1;
    while (!flag && l>0 && (c=nomfic2[l--])!='/' &&  c!=':')
      flag = (int) (c=='.');
    if (!flag && ext2[0])
      strcat(strcat(nomfic2,"."),ext2);
  }

  delwin2(win);

  if (cr==1)
    strcpy(nomfic,nomfic2);

    for (i=0 ; i<nbfic ; i++)
      free(tabptr[i]);
  return cr;

} /* fileselect */

/*====================================================================*/

static void en_haut(n)
int n;
{
  register int newis;

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

/*====================================================================*/

static void en_bas(n)
int n;
{
  register int newis;

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

/*====================================================================*/

static void affiche_colonne()
{
  int j;

  for (j=0 ; j<htb-2 && ib+j<nbfic; j++)
    mvwaddstr(win,l0b+j+1,3,joliformat(tabptr[ib+j]));

} /* affiche_colonne */

/*====================================================================*/

static void highlight(at)
int at;
{
  if (at)
  { wattron(win,SOULIGNE);
    strcpy(nomfici,tabptr[is]);
    wmove(win,l0i,c0i);
    wprintw(win,"%-33s",nomfici);
    wattroff(win,SOULIGNE);
  }

  if (at) wattron(win,INVERSE);
  mvwaddstr(win,l0b+1+is-ib,3,joliformat(tabptr[is]));
  if (at) wattroff(win,INVERSE);

} /* highlight*/

/*====================================================================*/

static char * joliformat(nomfic)
char *nomfic;
{
  static char buffer[15];

  sprintf(buffer, " %-14s ", nomfic);
  return buffer;

} /* joliformat  */

/*====================================================================*/

static void selectparlettre (lettre)
int lettre;
{
  int i;

  lettre = minaz((UC)lettre);
  if ((lettre>='a' && lettre<='z') || lettre=='_')
  {    /* test validit‚ int */
    for (i=is+1; i<nbfic; i++)/* recherche dans la suite de la liste */
      if (*tabptr[i]==(char)lettre) break;
    if (i<nbfic)	   /* on a trouv‚ une initiale correspondante */
    {
      is = i;
      if (is > ib+htb-2-1) ib = is;
      if (ib > nbfic-(htb-2)) ib = nbfic-(htb-2);
      if (ib<0) ib = 0;
      affiche_colonne();
      highlight(1);
      return;
    }

    for (i=0; i<is; i++)	/* recherche en d‚but de liste */
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
  }

} /* selectparlettre() */

/*====================================================================*/

static int compare(p1, p2)
const char **p1, **p2;
{
  return((int)strcmp(*p1, *p2));

} /* compare() */

