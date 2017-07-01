/* alert.c
** Gestion de boŒtes d'alerte
**
** 26/11/92	Sorti de esecr.c
**  9/04/94 PV	Fin de curses.ref. drawbox -> wdrawbox
** 20/06/94 PV	Utilisation de vpanel
** 30/10/94 PV	Coupure automatique des lignes sans plantage...
**  3/12/94 PV	D‚possi‚rage. Retour de wAlert 'propre'.
**  6/12/94 PV	Utilisation de maj pour le texte du bouton actif.
**				Acc‚l‚rateurs &
*/

#include <stdio.h>
#include <curses.h>
#include <ctype.h>
#include <errno.h>

#include <clib.ref>
#include "biberc.h"

#include "import.h"


int iAlertl0=0, iAlertc0=0;
WINDOW *wAlert = 0;
extern UC *szBoxd, *szBoxs;

/*  iAlert
**
**  titre:		 Une chaŒne de titre ecadr‚e, "" si pas de titre.
**  strmessage:  Le texte de la boŒte, ligne suivante par | ou \n.
**  bdefaut:	 Le bouton par d‚faut (de 1 … ...)
**  bescape:	 Code de retour si ESCAPE. Peut ˆtre quelconque, mˆme <0
**  strbouton:	 Le texte des boutons, s‚par‚s par |, et acc‚l‚rateurs &
**
**  Retour:
**  -------
**  Le num‚ro du bouton actif au moment de la validation.
*/

/* Variables et d‚finitions priv‚es au module */

#define ACTIF  1	 /* Constantes pour la gestion des boutons    */
#define NORMAL 0

#define LMAX 24 	 /* Nb maxi de lignes de texte / boite	      */
#define BMAX 8		 /* Nb maxi de boutons par boite	      */


// Retourne la longueur d'un texte sans compter les &
static int lgSansEt(char *p)
{
  int l = 0;
  char c;
  while ((c=*p++) && c!='|')
  {
    if (c=='&')
      c=*p++;
    l++;
  }
  return l;    
}


/* DrawBouton	Routine interne … alert.  Dessine le bouton nbouton, typ
**		pouvant prendre la valeur NORMAL ou ACTIF.
**		NORMAL:  -> cadre simple    texte normal
**		ACTIF:	 -> cadre double    texte majuscules
*/

static void DrawBouton(WINDOW *win, int nbout, int typ, int voff, int off, int nbmessage, int lmaxbouton, char *tabbouton[])
{
  int	i, off2, col;
  char	c, c2;
  char	*p;

  if (typ==ACTIF)
    wattron(win, INVERSE);

  wdrawbox(win, typ==ACTIF ? szBoxd : szBoxs, nbmessage+1+voff,off+3+nbout*(lmaxbouton+6),3,lmaxbouton+4);
  p = (char *) tabbouton[nbout];
  wmove(win, nbmessage+2+voff, off+4+nbout*(lmaxbouton+6));
  
  off2 = (lmaxbouton-lgSansEt(p))/2;
  for (col=0 ; col<=off2 ; col++)
    waddch(win,' ');
  
  for (i=0 ; (c=c2=p[i++]) && c!='|' ; )
  { if (c=='&')
    { c = p[i++];
      if (c==0) break;
	  if (typ==ACTIF)
		wattroff(win, INVERSE);
	  else
		wattron(win, INVERSE);
    }
    waddch(win, (char)((typ==ACTIF)?(char)maj(c):c));
    col++;
    if (c2=='&')
	  if (typ==ACTIF)
		wattron(win, INVERSE);
	  else
		wattroff(win, INVERSE);
  }
  
  while (col++<=lmaxbouton+1)
    waddch(win, ' ');

  if (typ==ACTIF)
    wattroff(win, INVERSE);
  wmove(win, nbmessage+2+voff, off+4+nbout*(lmaxbouton+6)+off2+1);

} /* DrawBouton */


/* Scan124
** Routine interne … alert.  D‚compose la chaŒne constitu‚e
** d'‚l‚ments s‚par‚s par des | en lignes du tableau tab.
** Rend la longueur du plus long dans *lgmax et le nombre
** d'‚l‚ments dans *nbmsg. Si bDecompterEt est vrai, les & ne
** sont pas compt‚s dans la longueur de ligne
*/

static void Scan124(const char *str, char *tab[], int *nbmsg, int *lgmax, int bDecompterEt, int iMaxMsg)
{
  int i=0, lmax=0;
  int iNbEt = 0;
  char *p;

  p = (char *)str;
  while (*p)
  {
    p = (char *)str;
	if (0==iMaxMsg)
	{ printf("biberc alert.c Scan124: Nombre maximum de lignes de texte ou de boutons atteint !\r\n");
	  break;
	}
    *tab++ = p;
	iMaxMsg--;
    while (*p && (*p)!='|' && (*p)!='\n')
	{ 
	  if (*p=='&') iNbEt++;
	  if ((p-str)>72) 
	  { while (*p!=' ') p--;
		*p='|';
		break;
	  }
	  p++;
	}
    if ((p-str)>lmax) lmax = (p-(char *)str);
    str=p+1;
    i++;
  }

  if (bDecompterEt) lmax -= iNbEt;
  *nbmsg=i;
  *lgmax=lmax;

} /* Scan124 */


// Renvoie le code de la touche qui suit un & dans la chaŒne
// pass‚e en paramŠtre, ou 0 s'il n'y en a pas
static char accel(char *p)
{
  char c;
  while ((c=*p++) && c!='|')
    if (c=='&')
      return *p;
  return 0;
}



int iAlert(const char *titre, const char *strmessageorg, int bdefaut, int bescape, const char *strbouton)
{
  int	  i, c;
  int	  lg1,lg2,lg3,bouton;
  char	  *p;
  char	  *tabmessage[LMAX],/* Lignes du texte						*/
		  *tabbouton[BMAX];	/* messages des boutons					*/
  int	  lmaxmessage,		/* Lg de la ligne de texte la + longue	*/
		  lmaxbouton;		/* Idem pour le bouton					*/
  int	  nbmessage,		/* Nb de lignes de texte				*/
		  nbbouton;			/* Nb de boutons						*/
  int	  l0,c0,			/* Coord du coin haut gauche de la boŒte*/
		  lg,ht,			/* Largeur et hauteur de la boŒte		*/
		  off,				/* D‚calge des boutons pour le centrage	*/
		  voff; 			/* Offset vertical affichage texte et	*/
							/* bouton (3 si titre, 0 sinon)			*/
  WINDOW  *win;				/* Ptr de fenˆtre curses				*/

  char	  *strmessage = strdup(strmessageorg);
  // Le message est dupliqu‚ de fa‡on interne temporaire, car des |
  // sont ins‚r‚s automatiquement si la largeur d'une ligne d‚passe
  // 70 caractŠres de fa‡on … ce que l'affichage se passe bien, mais
  // le message de l'appelant ne doit pas ˆtre modifi‚.

  Scan124(strmessage, tabmessage, &nbmessage, &lmaxmessage, 0, LMAX);
  if (strbouton!=NULL)
    Scan124(strbouton, tabbouton, &nbbouton ,&lmaxbouton, 1, BMAX);
  else
    nbbouton = 0;
			    			// On calcule la largeur minimale que
			    			// devrait avoir la boŒte pour afficher:
  lg1 = ((*titre)?strlen(titre)+8:0);				// le titre
  lg2 = lmaxmessage+6;								// le texte
  lg3 = nbbouton ? (lmaxbouton+6)*nbbouton+4:46;	// les boutons

  lg = (lg1>lg2)?lg1:lg2;	// On conserve la plus grande
  if (lg3>lg) lg=lg3;

  off = 0;					// Si la ligne des bout n'est pas la plus
  if (lg>lg3)				// longue, on calcule un offset pour
    off = (lg-lg3)/2;		// qu'elle soit centr‚e … l'affichage.

  ht = nbmessage+2;			// 2 = lignes du cadre
  if (nbbouton) ht+=3;		// Si il y a des boutons, 3 li de plus
  if (lg1) ht+=3;			// Si il y a un titre, 3 lignes en plus

  iAlertl0 = l0 = (LINES-ht)/2+1;   // On centre … l'‚cran
  iAlertc0 = c0 = (COLS-lg)/2;

  win = newwin2(ht, lg, l0, c0);
  InitWin(win);
  wdrawbox(win, szBoxd, 0, 0, ht, lg);

  if (lg1)					// Si il y a un titre, on l'affiche cent‚
  {
    i=(lg-lg1+1)/2;
    wdrawbox(win, szBoxs, 1,i+2,3,lg1-4);
    mvwaddstr(win,2,i+4,titre);
    voff=3;
  }
  else
    voff=0;

						    // On affiche le texte...
  for (i=0 ; i<nbmessage ; i++)
  {
    p = tabmessage[i];
    wmove(win, i+1+voff, 3);
    while (*p && *p!='|' && *p!='\n')
      waddch(win, *p++);
  }

  if (strbouton==NULL)
  { wAlert = win;
    return 0;
  }

  bouton = bdefaut-1;	    // bouton courant = bouton par d‚faut

  if (nbbouton)				// On affiche les boutons,
  {			     			// sauf celui par d‚faut
    for (i=0 ; i<nbbouton ; i++)
      if (i!=bdefaut-1) DrawBouton(win, i,NORMAL,voff,off,nbmessage,lmaxbouton,tabbouton);

							// Et on affiche le bouton courant
    DrawBouton(win, bouton,ACTIF,voff,off,nbmessage,lmaxbouton,tabbouton);

    do
    { int b;

      c = wgetch2(win);	    // On scrute le clavier

      if ( (b= (c==KEY_TAB||c==KEY_RIGHT)) || c==KEY_LEFT||c==KEY_SHIFT_TAB)
      { DrawBouton(win, bouton,NORMAL,voff,off,nbmessage,lmaxbouton,tabbouton);
		if (b) bouton = (bouton+1)%nbbouton;
		else   bouton = (bouton-1+nbbouton)%nbbouton;
		DrawBouton(win, bouton,ACTIF,voff,off,nbmessage,lmaxbouton,tabbouton);
      }
	  else
	  {      
		for (i=0 ; i<nbbouton ; i++)
		  if (maj((char)c)==maj(accel(tabbouton[i])))
		  { bouton = i;
		    goto fin;
		  }
      }

    } while(c!=KEY_RETURN && c!=KEY_ESPACE && c!=KEY_ESCAPE);

    if (c == KEY_ESCAPE) bouton=bescape-1;  // -1 car return(bouton+1)
  }

fin:
  delwin2(win);
  free(strmessage);

  return bouton+1;

} /* alert */

/*====================================================================*/

void AlertOk(const char *szTitre, const char *szMessage)
{
  iAlert(szTitre, szMessage, 1, 1, "Ok");

} /* alert_ok */

/*====================================================================*/

void AlertErr(const char *szApp, const char *szRoutine, const char *szMessage)
{
  char	szTxt[800];
  static char szTitre[] = "Attention - Erreur fichier";

  sprintf(szTxt,"|%s||errno:   %d|message: %s|", szMessage, errno,
    errno<sys_nerr ? sys_errlist[errno] : "** Erreur ind‚finie **");
  AlertOk(szTitre, szTxt);
  ErrorLog(szApp, szRoutine, szTitre, szMessage);
}

