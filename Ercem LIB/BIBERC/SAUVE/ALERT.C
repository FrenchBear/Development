
/* alert.c
** Gestion de boŒtes d'alerte
**
** 26/11/92	Sorti de esecr.c
*/

#include <stdio.h>
#include <curses.h>
#include <ctype.h>
#include <errno.h>

#include <clib.ref>
#if !defined(_M_XOUT)
#include <curses.ref>
#endif

#include "biberc.ref"

int iAlertl0, iAlertc0;
extern UC *szBoxd, *szBoxs;

/*  iAlert
**
**  propre:	 Si 1 ou 2, sauve l'‚cran recouvert. Si 1, le restitue en fin.
**  titre:	 Une chaŒne de titre ecadr‚e, "" si pas de titre.
**  strmessage:  Le texte de la boŒte, ligne suivante par | ou \n.
**  bdefaut:	 Le bouton par d‚faut (de 1 … ...)
**  bescape:	 Code de retour si ESCAPE. Peut ˆtre quelconque, mˆme n‚gatif.
**  strbouton:	 Le texte des boutons, s‚par‚s par |.
**
**  Retour:
**  -------
**  Le num‚ro du bouton actif au moment de la validation.
*/

/* Variables et d‚finitions priv‚es au module */

#define ACTIF  1	 /* Constantes pour la gestion des boutons    */
#define NORMAL 0

#define LMAX 20 	 /* Nb maxi de lignes de texte / boite	      */
#define BMAX 8		 /* Nb maxi de boutons par boite	      */

/* _DrawBouton	Routine interne … alert.  Dessine le bouton nbouton, typ
**		pouvant prendre la valeur NORMAL ou ACTIF.
**		NORMAL:  -> cadre simple    texte normal
**		ACTIF:	 -> cadre double    texte majuscules
*/

static void _DrawBouton(win, nbout,typ,voff,off,nbmessage,lmaxbouton,tabbouton)
WINDOW *win;
int nbout,typ,voff,off,nbmessage,lmaxbouton;
char * tabbouton[];
{
  int	off2,lg;
  char	c;
  char	*p;
  char	buffer[80];

  if (typ==ACTIF)
    wattron(win, INVERSE);

  wdrawbox(win, (typ==ACTIF) ? szBoxd : szBoxs, nbmessage+1+voff,off+3+nbout*(lmaxbouton+6),3,lmaxbouton+4);
  lg = 0;
  p = (char *) tabbouton[nbout];
  while ((c=p[lg]) && c!='|') buffer[lg++]=(typ==ACTIF)?(char)toupper(c):c;
  buffer[lg]=0;
  off2 = (lmaxbouton-lg)/2;
  mvwaddch(win, nbmessage+2+voff,off+4+nbout*(lmaxbouton+6),' ');
  for (lg=lmaxbouton+1 ; lg-- ; )
    waddch(win,' ');
  mvwaddstr(win, nbmessage+2+voff,off+off2+5+nbout*(lmaxbouton+6),buffer);

  if (typ==ACTIF)
    wattroff(win, INVERSE);

} /* _DrawBouton */

/* _Scan124	Routine interne … alert.  D‚compose la chaŒne constitu‚e
**		d'‚l‚ments s‚par‚s par des | en lignes du tableau tab.
**		Rend la longueur du plus long dans *lgmax et le nombre
**		d'‚l‚ments dans *nbmsg.
*/

static void _Scan124(str,tab,nbmsg,lgmax)
int *nbmsg;
int *lgmax;
char *str;
char *tab[];
{
  int i=0,lmax=0;
  char *p;

  p = (char *)str;
  while (*p)
  {
    p = (char *)str;
    *tab++=p;
    while (*p && (*p)!='|' && (*p)!='\n') p++;
    if ((p-(char *)str)>lmax) lmax = (p-(char *)str);
    str=p+1;
    i++;
  }

  *nbmsg=i;
  *lgmax=lmax;

} /* _Scan124 */

int iAlert(titre,strmessage,bdefaut,bescape,strbouton)
int     bdefaut,bescape;
char    *titre,*strmessage,*strbouton;
{
  int	  i, c;
  int	  lg1,lg2,lg3,bouton;
  char	  *p;
  char	  *tabmessage[LMAX],	/* Lignes du texte		     */
	  *tabbouton[BMAX];	/* messages des boutons		     */
  int	  lmaxmessage,	/* Longueur de la ligne de texte la + longue */
	  lmaxbouton;	/* Idem pour le bouton			     */
  int	  nbmessage,	/* Nb de lignes de texte     */
	  nbbouton;	/* Nb de boutons	     */
  int	  l0,c0,	/* Coord du coin haut gauche de la boŒte     */
	  lg,ht,	/* Largeur et hauteur de la boŒte     */
	  off,		/* D‚calge des boutons pour le centrage*/
	  voff; 	/* Offset vertical affichage texte et    */
			/* bouton (3 si titre, 0 sinon) 	     */
  char	  buffer[80];	/* pour pr‚parer les chaŒnes … ‚diter	     */
  WINDOW  *win;


  _Scan124(strmessage,tabmessage,&nbmessage,&lmaxmessage);
  if (nbmessage>LMAX)
  { /* erreur */
  }
  if (strbouton!=NULL)
  { _Scan124(strbouton, tabbouton, &nbbouton ,&lmaxbouton);
    if (nbbouton>BMAX)
    { /* erreur */
    }
  }
  else
    nbbouton = 0;
			    /* On calcule la largeur minimale que    */
			    /* devrait avoir la boŒte pour afficher: */
  lg1 = ((*titre)?strlen(titre)+8:0);   /* le titre		     */
  lg2 = lmaxmessage+6;			/* le texte		     */
  lg3 = nbbouton ? (lmaxbouton+6)*nbbouton+4:46;	/* les boutons		     */

  lg = (lg1>lg2)?lg1:lg2;		/* On conserve la plus grande*/
  if (lg3>lg) lg=lg3;

  off = 0;		/* Si la ligne des boutons n'est pas la plus */
  if (lg>lg3)		/* longue, on calcule un offset pour qu'elle */
    off = (lg-lg3)/2;	/* soit centr‚e … l'affichage.               */

  ht = nbmessage+2;	/* 2 = lignes du cadre			     */
  if (nbbouton) ht+=3;	/* Si il y a des boutons, 3 lignes de plus   */
  if (lg1) ht+=3;	/* Si il y a un titre, 3 lignes en plus      */

  iAlertl0 = l0 = (LINES-ht)/2+1;       /* On centre … l'‚cran       */
  iAlertc0 = c0 = (COLS-lg)/2;

  /* On sauvegarde ‚ventuellement l'‚tat de l'‚cran sous la boŒte    */
  refresh();
  win = newwin(ht, lg, l0, c0);
  InitWin(win);
  wdrawbox(win, szBoxd, 0, 0, ht, lg);

  if (lg1)		/* Si il y a un  titre, on l'affiche cent‚   */
  {
    i=(lg-lg1+1)/2;
    wdrawbox(win, szBoxs, 1,i+2,3,lg1-4);
    mvwaddstr(win,2,i+4,titre);
    voff=3;
  }
  else
    voff=0;

			    /* On affiche le texte...		     */
  for (i=0 ; i<nbmessage ; i++)
  {
    int j=0;

    p = tabmessage[i];
    while (*p && *p!='|' && *p!='\n') buffer[j++]=*p++;
    buffer[j]=0;
    mvwaddstr(win,i+1+voff,3,buffer);
  }

  if (strbouton==NULL) return (int)win;

  bouton = bdefaut-1;	     /* bouton courant = bouton par d‚faut    */

  if (nbbouton)
  {			     /* et les boutons, sauf celui par d‚faut */
    for (i=0;i<nbbouton;i++)
      if (i!=bdefaut-1) _DrawBouton(win, i,NORMAL,voff,off,nbmessage,lmaxbouton,tabbouton);

    _DrawBouton(win, bouton,ACTIF,voff,off,nbmessage,lmaxbouton,tabbouton);	   /* Et on affiche le bouton courant	    */

    do
    { int b;

      wrefresh(win);
      c = getch2();		     /* On scrute le clavier	      */

      if ( (b= (c==KEY_TAB||c==KEY_RIGHT)) || c==KEY_LEFT||c==KEY_SHIFT_TAB)
      { _DrawBouton(win, bouton,NORMAL,voff,off,nbmessage,lmaxbouton,tabbouton);
	if (b) bouton = (bouton+1)%nbbouton;
	else   bouton = (bouton-1+nbbouton)%nbbouton;
	_DrawBouton(win, bouton,ACTIF,voff,off,nbmessage,lmaxbouton,tabbouton);
      }

    } while(c!=KEY_RETURN && c!=KEY_ESPACE && c!=KEY_ESCAPE);

    if (c == KEY_ESCAPE) bouton=bescape-1;  /* -1 car return(bouton+1) */
  }

  delwin(win);
  touchwin(stdscr);

  return bouton+1;

} /* alert */

/*====================================================================*/

void AlertOk(titre,strmessage)
char *titre,*strmessage;
{
  iAlert(titre,strmessage,1,1,"Ok");

} /* alert_ok */

/*====================================================================*/

void AlertErr(szApp, szRoutine, szMessage)
char *szApp, *szRoutine, *szMessage;
{
  char	szTxt[800];
  static char szTitre[] = "Attention - Erreur fichier";

  sprintf(szTxt,"|%s||errno:   %d|message: %s|", szMessage, errno,
    errno<sys_nerr ? sys_errlist[errno] : "** Erreur ind‚finie **");
  AlertOk(szTitre, szTxt);
  ErrorLog(szApp, szRoutine, szTitre, szMessage);
}

