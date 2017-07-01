/* proto.c
**
** 27/03/90	V2, Unix, curses et multitƒche
** 21/05/90	Compatibilit‚ Unix et DOS
** 20/05/92	MSC 7.0
*/

#ifdef UNIX
#include <stdio.h>
#include <clib.ref>
#endif

#include "m1b.h"
#include "io.h"

#include "ecran.ref"
#include "clavier.ref"
#include "comm.ref"
#include "proto.ref"

/*====================================================================*/

extern CONTEXTE contexte;

static int status;

#define CLAVIER 0
#define MODEM	1
#define ECRAN	2

static int bouclagemodem = 0;

static int etatprotocole[2] = {0,0};

static int connexion[2][3] =
/*		 -> clavier	-> modem   -> ‚cran */
/* clavier */ { {     0,	     1, 	0   },
/* modem */	{     0,	     0, 	1   }
	      };

/*====================================================================*/

void pro_init()
{
  status = ST_FIN;

}

static void output(byte car, int origine)
{
  if (connexion[origine][MODEM])
  { comE_ecritcar(car);
  /*  if (bouclagemodem) pro_from_com(car); */	/* bouclage local */
  }
  if (connexion[origine][ECRAN]) ecr_ecritcar(car);
}

/* Pour l'instant, non utilis‚ */
#ifdef NE_PAS_COMPILER
static void cxfin(int code)
{
  switch(status)
  {
    case ST_FIN:
      if (code==0) status = ST_CONNEXION;
      break;

    case ST_CONNEXION:
      if (code==1) status = ST_CONNECTE;
      else	   status = ST_FIN;
      break;

    case ST_CONNECTE:
      if (code==1) status = ST_FIN;
      break;
  }
  bouclagemodem = status==ST_FIN;
  ecr_newstatus(status);
}
#endif

void protocole(byte car, int origine)
{
  static lastcar[3][2];

  if (car==0) return;

debut:
  switch(etatprotocole[origine])
  {
    case 0:
    {
      switch(car)
      {
	case 27:	/* ESC */
	  etatprotocole[origine] = 1;
	  break;

	case 0x13:
	  etatprotocole[origine] = 8;
	  break;

	default:
	  output(car,origine);
	  break;
      }
    } /* case 0 */
    break;

    case 1:	/* aprŠs ESC */
    {
      switch(car)
      {
	case '9':
	  etatprotocole[origine] = 2;
	  break;

	case ':':
	  etatprotocole[origine] = 3;
	  break;

	case ';':
	  etatprotocole[origine] = 5;
	  break;

	case 'a':
	  comE_ecritcar(31);	/* US */
	  comE_ecritcar((byte)(contexte.lcurs+'@'));
	  comE_ecritcar((byte)(contexte.ccurs+'A'));
	  etatprotocole[origine] = 0;
	  break;

	default:
	  output(27,origine);
	  etatprotocole[origine] = 0;
	  goto debut;
      }
    } /* etat 1 */
    break;

    case 2:		/* aprŠs ESC 9 */
      switch (car)
      {
	case 'z':       /* Identification bloc 2 minitel 1 filtr‚e */
	  break;

	case '{':       /* identification du minitel } */
	  comE_ecritcar(1);	/* SOH */
	  comE_ecritcar('C');    /* Telic */
	  comE_ecritcar('u');
	  comE_ecritcar('<');
	  comE_ecritcar(4);	/* EOT */
	  break;
      }
      etatprotocole[origine] = 0;
      break;

    case 3:		/* aprŠs ESC : (PRO 2) */
      lastcar[origine][0] = car;
      etatprotocole[origine] = 4;
      break;

    case 4:		/* aprŠs ESC : X */
      switch(lastcar[origine][0])
      {
	case '2':
	  switch(car)
	  {
/*{ (vi)*/  case '}':
	      ecr_mode(MO_MIXTE);
	      break;

	    case '~':
	      ecr_mode(MO_VIDEOTEX);
	      break;
	  }
	  break;

	case 'i':       /* PRO2 START */
	  switch(car)
	  {
	    case 'C':   /* ROULEAU */
	      ecr_mode_rouleau(1);
	      break;

	    case 'E':   /* MINUSCULES */
#ifndef UNIX
	      cla_minuscules(1); /* pas dans le mˆme proces sous Unix */
#endif
	      break;
	  }
	  break;

	case 'j':       /* PRO2 STOP */
	  switch(car)
	  {
	    case 'C':   /* ROULEAU */
	      ecr_mode_rouleau(0);
	      break;

	    case 'E':   /* MINUSCULES */
#ifndef UNIX
	      cla_minuscules(0);
#endif
	      break;
	  }
	  break;

      }
      etatprotocole[origine] = 0;
      break;

    case 5:		/* aprŠs ESC ; */
      lastcar[origine][0] = car;
      etatprotocole[origine] = 6;
      break;

    case 6:		/* aprŠs ESC ; X */
      lastcar[origine][1] = car;
      etatprotocole[origine] = 7;
      break;

    case 7:		/* aprŠs ESC ; X Y */
      switch(lastcar[origine][0])
      {
	case 0x60:	/* PRO3 OFF */
	  switch(lastcar[origine][1])
	  { case 0x58:	/* r‚cepteur = ECRAN */
	      switch(car)
	      { case 0x52:  /* ‚metteur = MODEM */
		  connexion[MODEM][ECRAN] = 0;
		  break;
		case 0x51:  /* ‚metteur = CLAVIER */
		  connexion[CLAVIER][ECRAN] = 0;
		  break;
	      }
	      break;
	    case 0x5A:	/* r‚cepteur = MODEM */
	      if (car==0x51)
		connexion[CLAVIER][MODEM] = 0;
	      break;
	  }
	  break;
	case 0x61:	/* PRO3 ON */
	  switch(lastcar[origine][1])
	  { case 0x58:	/* r‚cepteur = ECRAN */
	      switch(car)
	      { case 0x52:  /* ‚metteur = MODEM */
		  connexion[MODEM][ECRAN] = 1;
		  break;
		case 0x51:  /* ‚metteur = CLAVIER */
		  connexion[CLAVIER][ECRAN] = 1;
		  break;
	      }
	      break;
	    case 0x5A:	/* r‚cepteur = MODEM */
	      if (car==0x51)
		connexion[CLAVIER][MODEM] = 1;
	      break;
	  }
	  break;
      }
      etatprotocole[origine] = 0;
      break;

    case 8:
    switch(car)
    { /* case 0x59: cxfin(0); break; */   /* Appui connexion/fin */
      /* case 0x53: cxfin(1); break; */   /* Confirmation de connexion/fin */
      case 0x70: ecr_mode(MO_MIXTE); break;	/* acquittements du */
      case 0x71: ecr_mode(MO_VIDEOTEX); break;	/* protocole */
      case 0x5e: ecr_mode(MO_VIDEOTEX); break;	/* protocole */
      default:
	output(0x13,origine);
	output(car,origine);
    }
    etatprotocole[origine] = 0;

  } /* switch etat */

} /* protocole */


void pro_from_com(word car)
{
  protocole((byte) car,MODEM);
}

void pro_from_cla(word car)
{
  if (car==MSG_BIP) ecr_beep();
  if (car==MSG_PHOTO) ecr_photo();
  else protocole((byte) car,CLAVIER);
}

void pro_inversestatus()
{
  switch(status)
  {
    case ST_FIN:
    case ST_CONNEXION:
      status = ST_CONNECTE;
      break;

    case ST_CONNECTE:
      status = ST_FIN;
      break;
  }
  bouclagemodem = status==ST_FIN;
  ecr_newstatus(status);

}

