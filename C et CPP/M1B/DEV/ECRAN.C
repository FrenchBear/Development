/* ecran.c
** 30/12/91     Traitement du champ US
** 20/05/92     MSC 7.0, champ RS
*/

#include <dos.h>
#include <stdio.h>
int putch(int);

#include "m1b.h"
#include "ecran.h"

#include "ecran.ref"
#include "comm.ref"

/* infos "hard" */
static int nbcolecran;
static char far * displayptr;
static int cartecouleur;
static int videomode;
static int videomode0;

static int encouleur;

static union
{ byte at;
  struct
  { unsigned ccar:3;
    unsigned brillant:1;
    unsigned cfond:3;
    unsigned clig:1;
  } s;
} attrib;

static struct
{ byte car;
  byte attrib;
} imecran[25][80];


/* infos d'‚tat du module ‚cran */

static int mode;
static int nbcolmode;
static int status;
static int autowrap;
static int autoscroll;

CONTEXTE contexte;
static CONTEXTE sauvecontexte;
static CONTEXTE contexte7;


/* infos de l'automate … ‚tats */

static byte lastcar;

/*======================================================================*/

void phy_goto(int l, int c)
{
  union REGS reg;

  reg.h.ah = 2;                   /* Fonction 2: positionnement */
  reg.h.bh = 0;                   /* page */
  reg.h.dh = (byte) l;
  reg.h.dl = (byte) c;
  int86(0x10, &reg, &reg);
}

void phy_cls()
{
  union REGS reg;

  reg.h.ah = 6;                    /* Fonction 6: d‚filement vers le haut */
  reg.h.al = 0;                    /* 0 ligne = effacement */
  reg.h.bh = 7;                    /* attribut des nouvelles lignes */
  reg.h.ch = 0;                    /* ligne du coin haut gauche */
  reg.h.cl = 0;                    /* colonne du ... */
  reg.h.dh = 24;                   /* ligne du coin en bas … droite */
  reg.h.dl = (byte)(nbcolecran-1); /* colonne du ... */
  int86(0x10, &reg, &reg);
}

static void setvideomode(int mode)
{
  union REGS reg;

  reg.h.ah = 0;
  reg.h.al = (byte) mode;
  int86(0x10, &reg, &reg);
  if (mode>2) nbcolecran=80;
  else nbcolecran = 40;
}

/*======================================================================*/

static void setcolor()
{
  static int cc,cf;

/* cc NO   BL   VE   CY   RO   VI   JA   BL
cf
NO    0,0  7,0  7,0  7,0  7,0  7,0  7,0  7,0
BL    0,7  7,0  7,0  7,0  7,0  7,0  7,0  7,0
CY    0,7  7,0  7,0  7,0  7,0  7,0  7,0  7,0
RO    0,7  7,0  7,0  7,0  7,0  7,0  7,0  7,0
VI    0,7  7,0  7,0  7,0  7,0  7,0  7,0  7,0
JA    0,7  7,0  7,0  7,0  7,0  7,0  7,0  7,0
BL    0,7  7,0  7,0  7,0  7,0  7,0  7,0  7,0
*/

  if (!contexte.inverse) { cc=contexte.ccar; cf=contexte.cfond; }
  else          { cc=contexte.cfond; cf=contexte.ccar; }

  if (!encouleur)
  {
    if (cc==CO_NOIR)
    { attrib.s.ccar = 0;
      if (cf==CO_NOIR) attrib.s.cfond = 0;
      else             attrib.s.cfond = 7;
    }
    else
    { attrib.s.ccar = 7;
      attrib.s.cfond = 0;
    }
  }
  else
  { attrib.s.ccar = cc;
    attrib.s.cfond = cf;
    if (attrib.s.ccar==attrib.s.cfond)
      attrib.s.ccar = (attrib.s.ccar==0) ? 7 : 0;
  }
}


static void screencol(int nbcol)
{
  if (cartecouleur && nbcolecran!=nbcol)
    if (nbcol==40)
      setvideomode(1);
    else
      setvideomode(3);
}

static void xscroll(int ldeb, int lfin, int nblig)
{
  union REGS reg;
  int i,j;

  if (nblig>0)  /* scroll vers le bas */
  {

    for (i=lfin ; i>=ldeb+nblig ; i--)
      for (j=0 ; j<nbcolmode ; j++)
	imecran[i][j] = imecran[i-nblig][j];
    for (i=0 ; i<nblig ; i++)
      for (j=0 ; j<nbcolmode ; j++)
	{ imecran[ldeb+i][j].car = ' ';
	  imecran[ldeb+i][j].attrib = 7;
	}

    reg.h.ah = 7;                   /* Fonction 7: d‚filement vers le bas */
    reg.h.al = (byte)nblig;         /* nb de lignes */
    reg.h.bh = 7;                   /* attribut des nouvelles lignes */
    reg.h.ch = (byte)ldeb;          /* ligne du coin haut gauche */
    reg.h.cl = 0;                   /* colonne du ... */
    reg.h.dh = (byte)lfin;
    reg.h.dl = (byte)(nbcolmode-1);
    int86(0x10, &reg, &reg);
  }
  else          /* scroll vers le haut (classique) */
  {
    nblig = -nblig;
    if (nblig==0) nblig=lfin-ldeb+1;

    for (i=ldeb ; i<=lfin-nblig ; i++)
      for (j=0 ; j<nbcolmode ; j++)
	imecran[i][j] = imecran[i+nblig][j];
    for (i=0 ; i<nblig ; i++)
      for (j=0 ; j<nbcolmode ; j++)
	{ imecran[lfin-i][j].car = ' ';
	  imecran[lfin-i][j].attrib = 7;
	}

    reg.h.ah = 6;                   /* Fonction 6: d‚filement vers le haut */
    reg.h.al = (byte)nblig;         /* nb de lignes */
    reg.h.bh = 7;                   /* attribut des nouvelles lignes */
    reg.h.ch = (byte)ldeb;          /* ligne du coin haut gauche */
    reg.h.cl = 0;                   /* colonne du ... */
    reg.h.dh = (byte)lfin;
    reg.h.dl = (byte)(nbcolmode-1);
    int86(0x10, &reg, &reg);
  }
}


static void ecritcar2(byte car)
{
  displayptr[contexte.lcurs*2*nbcolecran+contexte.ccurs*2] = car;
  displayptr[contexte.lcurs*2*nbcolecran+contexte.ccurs*2+1] = attrib.at;
  imecran[contexte.lcurs][contexte.ccurs].car = car;
  imecran[contexte.lcurs][contexte.ccurs].attrib = attrib.at;
  if (contexte.echelley==2)
  {
  if (contexte.lcurs>1)
    { displayptr[(contexte.lcurs-1)*2*nbcolecran+contexte.ccurs*2]   = ' ';
      displayptr[(contexte.lcurs-1)*2*nbcolecran+contexte.ccurs*2+1] = attrib.at;
      imecran[contexte.lcurs-1][contexte.ccurs].car    = ' ';
      imecran[contexte.lcurs-1][contexte.ccurs].attrib = attrib.at;
    }
  else
    { contexte.echellex = contexte.echelley = 1;
    }
  }
  contexte.ccurs = contexte.ccurs+1;
  if (contexte.ccurs==nbcolmode)
  { if (!autowrap)
    { contexte.ccurs=nbcolmode-1;
    }
    else
    {
      contexte.lcurs += contexte.echelley;
      contexte.ccurs = 0;

      if (contexte.lcurs>24)
	if (!autoscroll)        /* mode page */
	{  contexte.lcurs -= 24;
	  if (contexte.echelley==2 && contexte.lcurs==1)
	    contexte.lcurs = 2;
	}
	else                    /* mode rouleau */
	{ xscroll(1,24,24-contexte.lcurs);
	  contexte.lcurs = 24;
	}
    }
  }
  phy_goto(contexte.lcurs, contexte.ccurs);
}

void ecr_curseur(int curseurvisible)
{

}

void ecr_goto(int lig, int col)
{
  if (lig>=0) contexte.lcurs = lig;
  if (col>=0) contexte.ccurs = col;
  phy_goto(contexte.lcurs, contexte.ccurs);
}


static void ecritstatus()
{
  int lsauv = contexte.lcurs;
  int csauv = contexte.ccurs;
  byte atsauv = attrib.at;

  attrib.at = 7;
  if (mode==MO_VIDEOTEX)
  { ecr_goto(0,38);
    attrib.at = 0x70;
  }
  else
    ecr_goto(0,77);

  if (status==ST_CONNEXION) attrib.s.clig = 1;
  ecritcar2((byte)(status==ST_FIN?'F':'C'));

  attrib.at = atsauv;
  ecr_goto(lsauv, csauv);
}

void ecr_newstatus(int st)
{
  status = st;
  ecritstatus();
}

static void cls(int effaceimage)
{
  int i,j;

  attrib.at = 7;
  phy_cls();

  if (effaceimage)
    for (i=0 ; i<25 ; i++)
      for (j=0 ; j<nbcolmode ; j++)
      { imecran[i][j].car = ' ';
	imecran[i][j].attrib = attrib.at;
      }

  contexte.lcurs = 1;
  contexte.ccurs = 0;
  ecritstatus();
}

void ecr_mode(int newmode)
{
  if (mode==newmode) return;

  mode = newmode;
  switch(mode)
  { case MO_VIDEOTEX:
      nbcolmode  = 40;
      contexte.police     = PO_G0;
      autowrap   = 1;
      autoscroll = 0;
      break;

    case MO_MIXTE:
      nbcolmode  = 80;
      contexte.police     = PO_G0US;
      autowrap   = 0;
      autoscroll = 1;
      break;
  }

  contexte.ccar = CO_BLANC;
  contexte.cfond = CO_NOIR;
  contexte.inverse = 0;
  setcolor();
  contexte.insmode = 0;
  contexte.echellex = contexte.echelley = 1;

  screencol(nbcolmode);
  cls(1);
}

void ecr_init()
{
  union REGS reg;

  reg.h.ah = 15;
  int86(0x10, &reg, &reg);
  videomode0 = reg.h.al;
  nbcolecran=reg.h.ah;

  if (videomode0!=7)
    displayptr = (char far *) 0XB8000000L;
  else
    displayptr = (char far *) 0XB0000000L;

  encouleur = cartecouleur = videomode0!=7;

  mode = -1;
  status = ST_FIN;
  ecr_mode(MO_VIDEOTEX);
}

void ecr_close()
{
  phy_cls();
  phy_goto(0,0);

  if (videomode!=videomode0)
    setvideomode(videomode0);
}


void ecr_beep()
{
  putch(7);
}

static void lclear(int ligne, int c1, int c2)
{
  int c;
  char far * ptr = displayptr + 2*nbcolecran*ligne+2*c1;

  for (c=c1 ; c<=c2 ; c++)
  {
    if (ligne==0 && mode==MO_VIDEOTEX && c>=36 && c<=38)
      ptr += 2;
    else
    { *ptr++ = imecran[ligne][c].car = ' ';
      *ptr++ = imecran[ligne][c].attrib = 7;
    }
  }

}

void ecr_move(int dlig, int dcol, int cont)
{
  contexte.ccurs += dcol;
  if (contexte.ccurs<0)
  { if (cont)
    { contexte.ccurs += nbcolmode;
      contexte.lcurs--;
    }
    else
      contexte.ccurs = 0;
  }
  if (contexte.ccurs>=nbcolmode)
  { if (cont)
    { contexte.ccurs -= nbcolmode;
      contexte.lcurs++;
    }
    else
      contexte.ccurs = nbcolmode-1;
  }

  contexte.lcurs += dlig;
  if (contexte.lcurs<1)
  { if (cont)
      contexte.lcurs += 24;
    else
      contexte.lcurs = 1;
  }
  if (contexte.lcurs>24)
  { if (cont)
      if (autoscroll)
      { xscroll(1, 24, -1);
	contexte.lcurs = 24;
      }
      else
	contexte.lcurs -= 24;
    else
      contexte.lcurs = 24;
  }

  phy_goto(contexte.lcurs, contexte.ccurs);
}


void ecr_tab()
{
  if (mode==MO_VIDEOTEX || contexte.lcurs==0)
    ecr_move(0,1,1);
  else
  { contexte.ccurs = (contexte.ccurs/8+1)*8;
    if (contexte.ccurs>=nbcolmode) contexte.ccurs=nbcolmode;
    phy_goto(contexte.lcurs, contexte.ccurs);
  }
}

static void ctrlmove(int dlig, int dcol)
{
  if (contexte.lcurs==0)
  { if (dlig==1)
    { contexte = sauvecontexte;
      setcolor();
      phy_goto(contexte.lcurs, contexte.ccurs);
    }
    else if (dlig==0)
      ecr_move(dlig,dcol,1);
  }
  else
    ecr_move(dlig,dcol,1);
}

static void ecritcar1(byte car)
{
  if (contexte.lcurs==0)
  { if (mode==MO_VIDEOTEX && contexte.ccurs>=36 && contexte.ccurs<=38)
    { contexte.ccurs++;
      phy_goto(contexte.lcurs, contexte.ccurs);
      return;
    }
  }
  ecritcar2(car);
}

static void ecritcar0(byte car)
{
  int ccurssauv = contexte.ccurs;

  ecritcar1(car);
  if (contexte.echellex==2 && ccurssauv!=39) ecritcar1(' ');
}

void ecritcar(byte car)
{
  switch(contexte.police)
  {
    case PO_G0:
      switch(car)
      { case '~':
	case '`': car='Ä'; break;
	case '{':
	case '|':
	case '}': car='³'; break;

      }
      break;

    case PO_G1:
      car = ' ';
      break;

    case PO_G2_1:
      switch(car)
      {
	case '#': car='œ'; contexte.police=PO_G0; break;
	case  39: car=''; contexte.police=PO_G0; break;
	case ',': car='<'; contexte.police=PO_G0; break;
	case '-': car='^'; contexte.police=PO_G0; break;
	case '.': car='>'; contexte.police=PO_G0; break;
	case '/': car='v'; contexte.police=PO_G0; break;
	case '0': car='ø'; contexte.police=PO_G0; break;
	case '1': car='ñ'; contexte.police=PO_G0; break;
	case '8': car='ö'; contexte.police=PO_G0; break;
	case '<': car='¬'; contexte.police=PO_G0; break;
	case '=': car='«'; contexte.police=PO_G0; break;

	case 'A':   /* Š */
	case 'B':   /* ‚ */
	case 'C':   /* ˆ */
	case 'H':   /* ‰ */
	case 'K':   /* ‡ */
	  lastcar = car;
	  contexte.police = PO_ACCENT;
	  return;

	default: car='_'; contexte.police=PO_G0; break;
      }
      break;

    case PO_ACCENT:
      switch(car)
      {
	case 'a':
	  switch(lastcar)
	  { case 'A': car='…'; break;
	    case 'C': car='ƒ'; break;
	    case 'H': car='„'; break;
	  }
	  break;
	case 'e':
	  switch(lastcar)
	  { case 'A': car='Š'; break;
	    case 'B': car='‚'; break;
	    case 'C': car='ˆ'; break;
	    case 'H': car='‰'; break;
	  }
	  break;
	case 'i':
	  switch(lastcar)
	  { case 'C': car='Œ'; break;
	    case 'H': car='‹'; break;
	  }
	  break;
	case 'o':
	  switch(lastcar)
	  { case 'C': car='“'; break;
	    case 'H': car='”'; break;
	  }
	  break;
	case 'u':
	  switch(lastcar)
	  { case 'A': car='—'; break;
	    case 'C': car='–'; break;
	    case 'H': car=''; break;
	  }
	  break;
	case 'c':
	  if (lastcar=='K') car='‡';
	  break;
      }
      contexte.police = PO_G0;
      break;

    case PO_G0US:
      break;

    case PO_G0FR:
      switch(car)
      { case '@': car='…'; break;
	case '[': car='ø'; break;
	case '\\': car='‡'; break;
	case ']': car=''; break;
	case '{': car='‚'; break;
	case '|': car='—'; break;
	case '}': car='Š'; break;
      }
      break;
  }

  lastcar = car;
  ecritcar0(car);
}

void ecr_ecritchaine(byte *ch)
{
  while (*ch)
    ecritcar(*ch++);
}

static void ecr_attrib(int vattrib, int etat)
{
  switch(vattrib)
  {
    case AT_NORMAL:
      contexte.inverse = 0;
      setcolor();
      attrib.s.brillant = 0;
      attrib.s.clig= 0;
      break;

    case AT_BRILLANT:
      attrib.s.brillant = etat;
      break;

    case AT_CLIGNOTANT:
      attrib.s.clig = etat;
      break;

    case AT_INVERSE:
      if (etat)
      { contexte.inverse = 1;
	setcolor();
      }
      else
      { contexte.inverse = 0;
	setcolor();
      }
      break;
  } /* switch attrib */
}

static void ecr_ccar(int couleur)
{
  if (contexte.ccar!=couleur)
  {
    contexte.ccar = couleur;
    setcolor();
  }
}

static void ecr_cfond(int couleur)
{
  if (contexte.cfond!=couleur)
  {
    contexte.cfond = couleur;
    setcolor();
  }
}

static void ecr_police(int newpol)
{
  if (contexte.police!=PO_G1 || newpol!=PO_G2_1)
    contexte.police = newpol;
}

static void ecr_echelle(int echx, int echy)
{
  contexte.echellex = echx;
  contexte.echelley = echy;
}

static void initcontexte()
{
  ecr_attrib(AT_NORMAL,1);
  ecr_ccar(CO_BLANC);
  ecr_cfond(CO_NOIR);
  ecr_echelle(1,1);
  if (mode==MO_VIDEOTEX)
    ecr_police(PO_G0);
  else
    ecr_police(PO_G0US);
}

void ecr_cls(int type)
{
  int l1,l2,c1,c2;

  switch(type)
  { case 0: l1=contexte.lcurs+1;l2=24; c1=contexte.ccurs;c2=nbcolmode-1; break;
    case 1: l1=1;l2=contexte.lcurs-1; c1=0;c2=contexte.ccurs; break;
    case 3:
    case 2: l1=1;l2=24; c1=0;c2=-1; break;
  }

  xscroll(l1,l2,0);
  if (c2>=c1) lclear(contexte.lcurs,c1,c2);

  if (type==3)
  { ecr_goto(1,0);
    initcontexte();
  }
}


static void ecr_cls2(int type)
{
  switch(type)
  { case 0: lclear(contexte.lcurs, contexte.ccurs, nbcolmode-1); break;
    case 1: lclear(contexte.lcurs, 0, contexte.ccurs); break;
    case 2: lclear(contexte.lcurs, 0, nbcolmode-1); break;
  }
}


static void ecr_insmode(int etat)
{
  contexte.insmode = etat;
}

static void ecr_insertl(int nblig)
{
  xscroll(contexte.lcurs,24,nblig);
  ecr_goto(contexte.lcurs,0);
}

void ecr_deletel(int nblig)
{
  xscroll(contexte.lcurs, 24, -nblig);
  ecr_goto(contexte.lcurs,0);
}

void ecr_contexte(int mode)
{

}

void ecr_redisplay()
{
  int lsauv = contexte.lcurs;
  int csauv = contexte.ccurs;
  int i,j;

  cls(0);       /* on n'efface pas l'image */
  for (i=0 ; i<25 ; i++)
   for (j=0 ; j<nbcolmode ; j++)
   { displayptr[i*2*nbcolecran+j*2] = imecran[i][j].car;
     displayptr[i*2*nbcolecran+j*2+1] = imecran[i][j].attrib;
   }
  ecr_goto(lsauv,csauv);

}

void ecr_repeat(int count)
{
  while (count--)
    ecritcar0(lastcar);
}

void ecr_mode_rouleau(int n)
{
  autoscroll = n;
}

void ecr_photo()
{
  static char nomfic[64] = "";
  FILE *f;
  int i,j;

  if (nomfic[0]==0)
  { phy_goto(0,0);
    puts("                                        ");
    phy_goto(0,0);
    printf("Nom du fichier: ");
    gets(nomfic);
    ecr_redisplay();
  }

  f = fopen(nomfic,"a");
  if (f==NULL)
    nomfic[0] = 0;
  else
  { for (i=0 ; i<24 ; i++)
    { for (j=0 ; j<nbcolmode ; j++)
	fputc(imecran[i][j].car,f);
      fputc('\n',f);
    }
    fputc('\n',f);
    fclose(f);
    putch(7);
  }
}

void ecr_ecritcar(byte car)
{
  static int etat = 0;
  static int nbpar;
  static int tpar[10];

  static byte lastcar;

  if (car<0x20) etat = 0;       /* reprise sur C0 */

  switch(etat)
  {
    case 0:
    {
      switch(car)
      { case 0:  break;
	case 1:  break;
	case 2:  break;
	case 3:  break;
	case 4:  break;
	case 5:  break;
	case 6:  break;
	case 7:  ecr_beep();          break;
	case 8:  ctrlmove(0,-1);      break;
	case 9:  ecr_tab();           break;
	case 10: ctrlmove(1,0);       break;
	case 11: if (mode==MO_VIDEOTEX) ctrlmove(-1,0);
		 else                   ctrlmove(1,0);
		 break;
	case 12: if (mode==MO_VIDEOTEX) ecr_cls(3);
		 else                   ctrlmove(1,0);
		 break;
	case 13: ecr_goto(-1,0);      break;
	case 14: if (mode==MO_VIDEOTEX) ecr_police(PO_G1);
		 else                   ecr_police(PO_G0FR);
		 break;
	case 15: if (mode==MO_VIDEOTEX) ecr_police(PO_G0);
		 else                   ecr_police(PO_G0US);
		 break;
	case 16: break;
	case 17: if (mode==MO_VIDEOTEX) ecr_curseur(1);
		 break;
	case 18: etat = 9;            break;
	case 19: etat = 10;           break;
	case 20: if (mode==MO_VIDEOTEX) ecr_curseur(0);
		 break;
	case 21: break;
	case 22: if (mode==MO_VIDEOTEX) ecr_police(PO_G2_1);
		 break;
	case 23: break;
	case 24: if (mode==MO_VIDEOTEX) ecr_cls2(0);
		 else                   ecritcar(219);
		 break;
	case 25: if (mode==MO_VIDEOTEX) ecr_police(PO_G2_1);
		 break;
	case 26: ecritcar(219); break;
	case 27: etat = 1;      break;
	case 28: break;
	case 29: break;
	case 30: if (mode==MO_VIDEOTEX)
		 { initcontexte();
		   ecr_goto(1,0);
		 }
		 break;
	case 31: etat = 7;      break;
	default: ecritcar(car); break;
       case 127: ecritcar(219); break;
      }
    } /* etat 0 */
    break;

    case 1:     /* aprŠs ESC */
    {
      switch(car)
      {
	case '[':
	  etat = 2;
	  nbpar = 1;
	  tpar[0] = 0;
	  break;

	case 0x20: case 0x21: case 0x22: case 0x23: case 0x24: case 0x25:
	case 0x26: case 0x27: case 0x28: case 0x29: case 0x2A: case 0x2B:
	case 0x2C: case 0x2D: case 0x2E: case 0x2F:
	  etat = 4; break;      /* S‚quence ESC 2/X... filtr‚e */

	case '5':
	case '6': etat = 11; break;     /* filtr‚ par le module ‚cran */
	case '7': if (mode==MO_VIDEOTEX) etat = 11;
		  else { contexte7 = contexte; etat = 0; }
		  break;

	case '8': if (mode==MO_MIXTE)
		  { contexte = contexte7;
		    setcolor();
		    phy_goto(contexte.lcurs,contexte.ccurs);
		  }
		  break;

	case '@': if (mode==MO_VIDEOTEX)  ecr_ccar(CO_NOIR);
		  etat=0; break;
	case 'A': if (mode==MO_VIDEOTEX)  ecr_ccar(CO_ROUGE);
		  etat=0; break;
	case 'B': if (mode==MO_VIDEOTEX)  ecr_ccar(CO_VERT);
		  etat=0; break;
	case 'C': if (mode==MO_VIDEOTEX)  ecr_ccar(CO_JAUNE);
		  etat=0; break;
	case 'D': if (mode==MO_VIDEOTEX)  ecr_ccar(CO_BLEU);
		  else                    ecr_move(1,0,1);
		  etat=0; break;
	case 'E': if (mode==MO_VIDEOTEX)  ecr_ccar(CO_VIOLET);
		  else
		    if (contexte.lcurs>0)
		    { ctrlmove(1,0);
		      ecr_goto(-1,0);
		    }
		  etat=0; break;
	case 'F': if (mode==MO_VIDEOTEX)  ecr_ccar(CO_CYAN);
		  etat=0; break;
	case 'G': if (mode==MO_VIDEOTEX)  ecr_ccar(CO_BLANC);
		  etat=0; break;

	case 'H': if (mode==MO_VIDEOTEX)  ecr_attrib(AT_CLIGNOTANT,1);
		  etat=0; break;
	case 'I': if (mode==MO_VIDEOTEX)  ecr_attrib(AT_CLIGNOTANT,0);
		  etat=0; break;

	case 'L': if (mode==MO_VIDEOTEX)  ecr_echelle(1,1);
		  etat=0; break;
	case 'M': if (mode==MO_VIDEOTEX)  ecr_echelle(1,2);
		  else                    ctrlmove(-1,0);
		  etat=0; break;
	case 'N': if (mode==MO_VIDEOTEX)  ecr_echelle(2,1);
		  etat=0; break;
	case 'O': if (mode==MO_VIDEOTEX)  ecr_echelle(2,2);
		  etat=0; break;

	case 'P': if (mode==MO_VIDEOTEX)  ecr_cfond(CO_NOIR);
		  etat=0; break;
	case 'Q': if (mode==MO_VIDEOTEX)  ecr_cfond(CO_ROUGE);
		  etat=0; break;
	case 'R': if (mode==MO_VIDEOTEX)  ecr_cfond(CO_VERT);
		  etat=0; break;
	case 'S': if (mode==MO_VIDEOTEX)  ecr_cfond(CO_JAUNE);
		  etat=0; break;
	case 'T': if (mode==MO_VIDEOTEX)  ecr_cfond(CO_BLEU);
		  etat=0; break;
	case 'U': if (mode==MO_VIDEOTEX)  ecr_cfond(CO_VIOLET);
		  etat=0; break;
	case 'V': if (mode==MO_VIDEOTEX)  ecr_cfond(CO_CYAN);
		  etat=0; break;
	case 'W': if (mode==MO_VIDEOTEX)  ecr_cfond(CO_BLANC);
		  etat=0; break;

	case ']': if (mode==MO_VIDEOTEX)  ecr_attrib(AT_INVERSE,1);
		  etat=0; break;
	case '\\': if (mode==MO_VIDEOTEX)  ecr_attrib(AT_INVERSE,0);
		  etat=0; break;

	default:
	  etat = 0;
	  break;
      }
    } /* etat 1 */
    break;

    case 2:     /* aprŠs ESC [ */
    {
      switch(car)
      {
	case '0': case '1': case '2': case '3': case '4':
	case '5': case '6': case '7': case '8': case '9':
	  tpar[nbpar-1] = tpar[nbpar-1]*10 + car-'0';
	  break;

	case ';':
	  nbpar++;
	  tpar[nbpar-1] = 0;
	  break;

	case 'A':
	  ecr_move(tpar[0]?-tpar[0]:-1,0,0);
	  etat = 0;
	  break;

	case 'B':
	  ecr_move(tpar[0]?tpar[0]:1,0,0);
	  etat = 0;
	  break;

	case 'C':
	  ecr_move(0,tpar[0]?tpar[0]:1,0);
	  etat = 0;
	  break;

	case 'D':
	  ecr_move(0,tpar[0]?-tpar[0]:-1,0);
	  etat = 0;
	  break;

	case 'H':
	  { int p1, p2;
	    if (tpar[0]) p1=tpar[0]; else p1=1;
	    if (nbpar==1 || tpar[1]==0) p2=1; else p2=tpar[1];
	    ecr_goto(p1,p2-1);
	  }
	  etat = 0;
	  break;

	case 'J':
	  ecr_cls(tpar[0]);
	  etat = 0;
	  break;

	case 'K':
	  ecr_cls2(tpar[0]);
	  etat = 0;
	  break;

	case 'h':
	  switch(tpar[0])
	  {
	    case 4: ecr_insmode(1); break;
	  }
	  etat = 0;
	  break;

	case 'l':
	  switch(tpar[0])
	  {
	    case 4: ecr_insmode(0); break;
	  }
	  etat = 0;
	  break;

	case 'L':
	  ecr_insertl(tpar[0]?tpar[0]:1);
	  etat = 0;
	  break;

	case 'M':
	  ecr_deletel(tpar[0]?tpar[0]:1);
	  etat = 0;
	  break;

	case 'm':
	  if (mode==MO_MIXTE)
	    switch(tpar[0])
	    { case 0:  ecr_attrib(AT_NORMAL, 1);           break;
	      case 1:  ecr_attrib(AT_BRILLANT, 1);   break;
	      case 4:  ecr_attrib(AT_SOULIGNE, 1);   break;
	      case 5:  ecr_attrib(AT_CLIGNOTANT, 1); break;
	      case 7:  ecr_attrib(AT_INVERSE, 1);    break;
	      case 22: ecr_attrib(AT_BRILLANT, 0);   break;
	      case 24: ecr_attrib(AT_SOULIGNE, 0);   break;
	      case 25: ecr_attrib(AT_CLIGNOTANT, 0); break;
	      case 27: ecr_attrib(AT_INVERSE, 0);    break;
	    } /* switch tpar[0] */
	  etat = 0;
	  break;

	case '?':
	  etat = 3;
	  break;

	default:
	  etat = 0;
	  break;
      }
    } /* etat 2 */
    break;

    case 3:     /* aprŠs ESC [ ? */
    if (car=='{')
      ecr_mode(MO_VIDEOTEX);
    etat = 0;
    break;

    case 4:     /* aprŠs ESC [ 2/x */
    if (car>0x2f)
      etat = 0;
    break;

    case 7:     /* aprŠs US */
    lastcar = car;
    etat = 8;
    break;

    case 8:
    if (car>'@' && lastcar>='@')
    { if (contexte.lcurs>0) sauvecontexte = contexte;
      ecr_goto(lastcar-'@', car-'@'-1);
      initcontexte();
    }
    else if (lastcar>='0' && lastcar<='2')
    { int l = (lastcar-'0')*10+car-'0';
      if (l>=0 && l<=24)
      { if (contexte.lcurs>0) sauvecontexte = contexte;
	ecr_goto(l, 0);
	initcontexte();
      }
    }
    etat = 0;
    break;

    case 9:
    if (car>='@')
      ecr_repeat(car-'@');
    etat = 0;
    break;

    case 10:    /* AprŠs ^S, 0x13, 19: pr‚fixe de touche */
    etat = 0;
    break;

    case 11:    /* aprŠs ESC 5 ou ESC 6 ou ESC 7: filtr‚ par l'‚cran */
    etat = 0;
    break;

  } /* switch etat */

} /* ecr_ecritcar */

