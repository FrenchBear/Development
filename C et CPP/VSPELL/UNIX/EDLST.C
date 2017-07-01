
/* edlst.c
** Editeur associ‚ … libstand.4ge
**
** 26/11/92 PV	PremiŠre version
**  6/12/92 PV	Mise au point d‚finitive 1.0
** 14/12/92 PV	Titre de libell‚ standard
** 17/05/94 PV	V‚rification d'orthographe
*/

/*
#define TEST
*/

#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <sys/errno.h>

#include <clib.ref>
#include <biberc.ref>
#include <ipcs.ref>

extern int errno;

/* Canaux de communication */
static int  iRid, iWid;

/* Structure ‚chang‚e en tant que message */
#define LGBUFF 30000
static struct Message
{ int  iType;
  int  iLg;
  UC   szTexte[LGBUFF];
} msg;

static char szTitre[80] = "Editeur de libell‚s standard";

#ifdef TEST
#define LIG0 3		/* D‚but de la zone d'‚dition */
#define COL0 10
#define NBLIG 5		/* Taille de la zone d'‚dition */
#define NBCOL 30	/* 80 interdit */
#else
#define LIG0 3		/* D‚but de la zone d'‚dition */
#define COL0 0
#define NBLIG (LINES-3)	/* Taille de la zone d'‚dition */
#define NBCOL 79	/* 80 interdit */
#endif

extern int EditeTexte();
extern int iEdLastKey, iEdLastPos;

int	iPosEd;		/* Position o— reprendre la saisie */
int	iVSInterrompu;	/* V‚rification interrompue */
int	iVSCharge;	/* Correcteur initialis‚ */

#define  uchar  unsigned char
#define  ushort unsigned short

#include "vspell.h"

/*====================================================================*/

int iBack(int iMessage, uchar *szMot, unsigned iPos, unsigned iLen)
{
  char szMessage[200], *szTitre;
  int i;

  switch(iMessage)
  {
    case VSM_MOT_INCONNU:
      szTitre = "Mot inconnu !";
      sprintf(szMessage, "Le mot \"%s\" n'a pas ‚t‚ trouv‚|dans le dictionnaire", szMot);
      break;

    case VSM_NOM_PROPRE:
      szTitre = "Nom propre";
      sprintf(szMessage, "Le mot \"%s\" a ‚t‚ trouv‚|dans le dictionnaire mais|avec une diff‚rence MAJ/min", szMot);
      break;
  }

  i = iAlert(szTitre, szMessage, 1,1, "Corriger|Ajouter|Ignorer");
  switch(i)
  {
    case 1:
      iPosEd = iPos;
      iVSInterrompu = 1;
      return -1;
    case 2:
      VS_AjouteMot(szMot);
    case 3:
      return 0;
  }
}

/*====================================================================*/

int iDoEdition(szTexte)
char *szTexte;
{
  int iStatus;
  int iPos;

  InitEcran();
  NoDelInterrupt();
  mvaddstr(0,0,szTitre);
  mvaddstr(1,0,"Ctrl+X,F9:Efface car,  F5:{},  F7:Ortho,  Echap:Valide,  Suppr:Abandonne");
  mvaddstr(2,0,"-------------------------------------------------------------------------------");

  iPos = 0;
  for(;;)
  {
    iStatus = EditeTexte(szTexte, stdscr, LIG0, COL0, NBLIG, NBCOL, iPos);
    if (iEdLastKey!=KEY_F(7))
      break;

    iPosEd = iPos;
    iVSInterrompu = 0;

    if (iVSCharge==0)
    {
      if (VS_iInit()<0)
      { AlertOk("Probleme !","Echec … l'initialisation|du v‚rificateur !");
	continue;
      }
      iVSCharge = 1;
    }

    VS_Spell(szTexte, 0, iBack);
    if (iVSInterrompu==0)
      AlertOk("","Verification termin‚e.");

    iPos = iPosEd;
  }
  FinEcran();
  return iStatus;
}


main(argc, argv)
int argc;
char **argv;
{
  int iStatus;

  if (argc==4 && strcmp(argv[1], "-q")==0)
  { 
    iRid = atoi(argv[3]);
    iWid = atoi(argv[2]);

    for(;;)
    {
      iStatus = msgrcv(iRid, &msg, LGBUFF, 0, 0);
      if (iStatus<0)
      { if (errno!=EIDRM) /* fin si destruction de la file */
	  perror("edlst: main (edlst.c): Echec au msgrcv(rid)");
	exit(1);
      }

      if (msg.iType==1)	/* Titre */
      { strcpy(szTitre, msg.szTexte);
	continue;
      }

      iStatus = iDoEdition(msg.szTexte);
      if (iStatus<0)
      { msg.iType = 3;	/* Abandon */
	msg.iLg = 0;
      }
      else if (iStatus>0)	/* Texte modifi‚ */
      { msg.iType = 2;
	msg.iLg = strlen(msg.szTexte)+1;
      }
      else		/* Texte non modifi‚ */
      { msg.iType = 4;
	msg.iLg = 0;
      }

      iStatus = msgsnd(iWid, &msg, sizeof(int)+msg.iLg, 0);
      if (iStatus<0)
      { perror("edlst: main (edlst.c): Echec au msgsnd(wid)");
	exit(1);
      }
    }
  }
  else if (argc==1)
  {
    strcpy(msg.szTexte, "Il ‚tait un petit navire qui n'avait jamais navigu‚, oh‚ oh‚, matelot... On tira au sort pour savoir qui, qui, qui serait mang‚, oh‚, oh‚, matelot... Le sort tomba sur le plus jeune...\nUne ligne vide pr‚cŠde... et pas de saut de ligne final.\n");
    iStatus = iDoEdition(msg.szTexte);
    printf("%s\n\niStatus = %d\n", msg.szTexte, iStatus);
    exit(0);
  }

  fprintf(stderr, "Usage: edlst [-q rid wid]\r\n");
  return 0;
}

