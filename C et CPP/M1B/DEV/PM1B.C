
/*  PM1B.C
**
**  Param‚trage du programme M1B
*/

/*============================================================================*/

#include <stdio.h>
#include <stdlib.h>

#include <vtypes.h>
#include <couleurs.h>
#include <clavier.h>

#include <vlib.ref>

/*============================================================================*/

char *l1[] = { "COM1", "COM2", "Autre:", NULL };
char *l2[] = { "1200", "4800", "Autre:", NULL };
char *l3[] = { "Auto", "Mono", "Couleur", NULL };
char *l4[] = { "Minitel", "Modem:", NULL };

struct
{
  char **tlib;
  int2 tcol[5];
  int2 csel;
} tmenu[] =
{
  { l1 },
  { l2 },
  { l3 },
  { l4 },
  { NULL }
};

#define L0 6

couleur CIF1, CIF2, CIF3, CIF4;
couleur CAL1, CAL2, CAL3, CAL4;

couleur CINV, FINV;

#define ERRMSG ((errno>=0 && errno<sys_nerr)?sys_errlist[errno]:"[message inconnu]")

int2 abase, vectit, vitesse;
char seqinit[32];

int2 modif;

char nomfic[] = "m1b.pro";
char lsep[] = "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ";

int2 tabspeed[] = { 300, 600, 1200, 2400, 4800, 9600, 0 };

/*============================================================================*/

void lignetouche(l, msg)
int2 l;
char *msg;
{
  char c;

  ve_gotolc(l, 1);
  ve_ccarfond(BLANC, NOIR);
  while (c=*msg++)
    switch(c)
    {
      case '[':
	ve_ccarfond(NOIR, BLANC);
	ve_sorcar(' ');
	break;

      case ']':
	ve_sorcar(' ');
	ve_ccarfond(BLANC, NOIR);
	break;

      default:
	ve_sorcar(c);
	break;
    }

} /* lignetouche */

/*============================================================================*/

void dispadd(n)
int2 n;
{
  ve_ccar(BLANC);
  if (n<0 || n==1)
  { ve_ccar(CYAN);
    ve_putslc(L0, 60, "___");
    ve_putslc(L0, 74, "__");
    ve_ccar(BLANC);
    ve_gotolc(L0,60); ve_printf("%x", abase);
    ve_gotolc(L0,74); ve_printf("%x", vectit);
  }

  if (n<0 || n==2)
  { ve_ccar(CYAN);
    ve_putslc(L0+2, 60, "_____");
    ve_ccar(BLANC);
    ve_gotolc(L0+2,60); ve_printf("%d", vitesse);
  }

  if (n<0 || n==3)
  { ve_ccar(CYAN);
    ve_putslc(L0+6, 60, "___________________");
    ve_ccar(BLANC);
    ve_gotolc(L0+6,60); ve_printf("%s", seqinit);
  }
}

/*============================================================================*/

void sauveconfig()
{
  FILE *f;

  f = fopen(nomfic, "w");
  if (f==NULL)
  { char message[400];
    sprintf(message,"|chec … l'ouverture du fichier|\"%s\"||%s|", nomfic, ERRMSG);
    alert(1,"Attention !",CAL1,CAL2,CAL3,CAL4,message,1,1,"Ok");
    return;
  }

  fprintf(f,"%d %d %d\n%d %d\n%d\n%d %s\n", tmenu[0].csel, abase, vectit,
					      tmenu[1].csel, vitesse,
					      tmenu[2].csel,
					      tmenu[3].csel, seqinit);

  fclose(f);
  modif = 0;

} /* sauveconfig */

/*============================================================================*/

void litconfig()
{
  FILE *f;
  char seq[32];
  int2 csel0, csel1, csel2, csel3;
  int2 labase, lvectit, lvitesse;
  int2 i;

  f = fopen(nomfic, "r");
  if (f==NULL)
  { modif = 1;
    return;
  }

  i = fscanf(f, "%d %d %d\n%d %d\n%d\n%d %[^]\n", &csel0, &labase, &lvectit,
					   &csel1, &lvitesse,
					   &csel2,
					   &csel3, seq);

  fclose(f);

  if (i<7)
    modif = 1;
  else
  {
    if (csel0<0 || csel0>2) csel0 = 0;
    if (csel1<0 || csel1>2) csel1 = 0;
    if (csel2<0 || csel2>2) csel2 = 0;
    if (csel3<0 || csel3>2) csel3 = 0;
    tmenu[0].csel = csel0;
    tmenu[1].csel = csel1;
    tmenu[2].csel = csel2;
    tmenu[3].csel = csel3;
    strcpy(seqinit, seq);
    abase = labase;
    vectit = lvectit;
    vitesse = lvitesse;
    for (i=0 ; tabspeed[i] ; i++)
      if (vitesse==tabspeed[i]) break;
    if (tabspeed[i]==0)
      vitesse = 300;
    dispadd(-1);
  }

} /* litconfig */

/*============================================================================*/

/* initcoul	Initialise les variables CIF1..CIF4 et CAL1..CAL4, qui sont
**		les couleurs utilis‚es pour les menus et pour les boŒtes
**		d'alerte.
*/

void initcoul()
{
  if (vt_couleur)
  { CAL1 = BLANC|BRILLANT; CAL2 = JAUNE|BRILLANT; CAL3 = BLANC; CAL4 = ROUGE;
    CIF1 = VIOLET;	   CIF2 = ROUGE;	  CIF3 = BLEU;	CIF4 = BLANC;
    CINV = BLANC|BRILLANT; FINV = BLEU;
  } else
  { CAL1 = NOIR;	   CAL2 = NOIR;   CAL3 = NOIR;		 CAL4 = BLANC;
    CIF1 = BLANC|BRILLANT; CIF2 = BLANC;  CIF3 = BLANC|BRILLANT; CIF4 = NOIR;
    CINV = NOIR;	   FINV = BLANC;
  }

}  /* initcoul */

/*============================================================================*/

void main()
{
  int2 i, j;
  char c1, c2;
  booleen fin;
  int2 lsel;
  booleen redisp;
  touche t;
  int2 llsel, lcsel;
  int2 emode;

  initvlib();
  initcoul();
  litconfig();


  ve_ccar(VERT);
  ve_putslc(1,30,"ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿");
  ve_putslc(2,30,"³                    ³");
  ve_putslc(3,30,"ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ");
  ve_putslc(17,1,lsep);
  ve_putslc(23,1,lsep);

  ve_ccar(JAUNE|BRILLANT);
  ve_putslc(2,32,"Param‚trage de M1B");

  lignetouche(24,"Mouvements: [\x18] [\x19] [\x1b] [\x1a]   Informations compl‚mentaires: [\x11ÄÙ]");
  lignetouche(25,"Aide: [F1]  Sauve: [F2]  Sauve+Fin: [F3]  Abandon+Fin: [F4]");

  ve_ccar(CYAN);
  ve_putslc(L0	,1,"Port de communication:                            @base:      h   IT:");
  ve_putslc(L0+2,1,"Vitesse du port (bauds):                          Vitesse:");
  ve_putslc(L0+4,1,"Mode vid‚o:");
  ve_putslc(L0+6,1,"Connexion:                                        Init:");

  for (i=0 ; tmenu[i].tlib!=NULL ; i++)
  {
    for (j=0 ; tmenu[i].tlib[j]!=NULL ; j++)
    { if (tmenu[i].csel==j) { c1='['; c2=']'; ve_ccar(BLANC|BRILLANT); }
      else { c1 = c2 = ' '; ve_ccar(BLANC); }
      if (j==0) tmenu[i].tcol[j] = 26;
      else	tmenu[i].tcol[j] = tmenu[i].tcol[j-1]+3+strlen(tmenu[i].tlib[j-1]);
      ve_gotolc(L0+2*i, tmenu[i].tcol[j]);
      ve_printf("%c%s%c", c1, tmenu[i].tlib[j], c2);
    }
  }
  dispadd(-1);

  lsel = 0;
  fin = 0;
  redisp = 1;
  llsel = -1;
  lcsel = -1;
  emode = 0;

  while (!fin)
  {

    if (redisp)
    { ve_ccarfond(CINV, FINV);
      ve_gotolc(L0+2*lsel, tmenu[lsel].tcol[tmenu[lsel].csel]);
      ve_printf(" %s ", tmenu[lsel].tlib[tmenu[lsel].csel]);
      ve_ccarfond(CYAN, NOIR);
      redisp = 0;
      if (llsel != lsel)
      {
	ve_clszone(18,22);
	switch(lsel)
	{
	  case 0:
	    ve_puts("Choisissez le port sur lequel l'ordinateur est reli‚ au modem ou au Minitel.\n"
		    "COM1 ou COM2 sont les choix les plus courants. S'il n'y a qu'une seule prise\n"
		    "s‚rie sur l'ordinateur, il s'agit probablement de COM1.\n"
		    "Le choix [Autre] permet d'adapter le programme … une carte particuliŠre,\n"
		    "en indiquant le vecteur d'interruption et l'adresse de base.");
	    break;

	  case 1:
	    ve_puts("Choisissez la vitesse de transfert. La vitesse normale pour un Minitel est de\n"
		    "1200 bauds. Il est possible d'utiliser d'autres vitesses … l'aide de la\n"
		    "commande Fonction-P du Minitel, mais cette vitesse est perdue chaque fois\n"
		    "que le Minitel est mis hors-tension, et cette vitesse ne change pas la\n"
		    "vitesse de transfert sur la ligne t‚l‚phonique qui reste de 75/1200 bauds.\n");
	    break;

	  case 2:
	    ve_puts("Choisissez le mode vid‚o.\n"
		    "En principe il faut toujours laisser le mode Auto, ce qui permet au programme\n"
		    "de reconnaŒtre automatiquement le type de carte install‚. Si cela ne fonctionne\n"
		    "pas correctement sur un modŠle particulier de carte vid‚o, il est possible\n"
		    "d'imposer au programme le type de carte … utiliser.\n");
	    break;

	  case 3:
	    ve_puts("Choisissez le type de connexion. La connexion Minitel indique que l'ordinateur\n"
		    "utilise le modem d'un minitel par l'interm‚diaire de la prise p‚riinformatique;\n"
		    "la connexion Modem indique que l'ordinateur est directement connect‚ … un modem."
		    "Dans ce cas, il est possible d'indiquer une s‚ruence d'initialisation du modem,\n"
		    "envoy‚e au lancement du programme. (exemple: ^MATW1^MATDP3615^M)");
	    break;

	}
      }
    }

    llsel = lsel;
    lcsel = tmenu[lsel].csel;

    t = vc_lircar();
    switch(t)
    {
      case K_LEFT:
	if (tmenu[lsel].csel>0)
	{ tmenu[lsel].csel--;
	  redisp = 1;
	}
	break;

      case K_RIGHT:
	if (tmenu[lsel].tlib[tmenu[lsel].csel+1]!=NULL)
	{ tmenu[lsel].csel++;
	  redisp = 1;
	}
	break;

      case K_UP:
	if (lsel>0)
	{ lsel--;
	  redisp = 1;
	}
	break;

      case K_DOWN:
	if (tmenu[lsel+1].tlib!=NULL)
	{ lsel++;
	  redisp = 1;
	}
	break;

      case K_RET:
	if (lsel==0 && tmenu[lsel].csel==2)	  emode = 1;
	else if (lsel==1 && tmenu[lsel].csel==2)  emode = 2;
	else if (lsel==3 && tmenu[lsel].csel==1)  emode = 3;
	if (emode) redisp = 1;
	break;

      case K_F2:
      case K_F3:
	sauveconfig();
	fin = (booleen)(t==K_F3);
	break;

      case K_F4:
      case K_ESC:
      case K_ALT_X:
      case 'q':
      case 'Q':
	if (modif)
	{ i = alert(1,"Attention !",CAL1,CAL2,CAL3,CAL4,"|La configuration a ‚t‚ cr‚‚e ou modifi‚e.||Sortir sans sauvegarder ?|",2,2,"Oui|Annuler");
	  fin = (booleen)(i==1);
	}
	else
	  fin = 1;
	break;

      case K_ALT_F4:
	fin = 1;
	break;

    } /* switch t */

    if (redisp)
    { if (t==K_UP || t==K_DOWN || emode>0) { c1='['; c2=']'; ve_ccar(BLANC|BRILLANT); }
      else { c1 = c2 = ' '; ve_ccar(BLANC); }
      ve_gotolc(L0+2*llsel, tmenu[llsel].tcol[lcsel]);
      ve_printf("%c%s%c", c1, tmenu[llsel].tlib[lcsel], c2);
      modif = 1;
    }

    if (emode)
    {
      static touche exitkey[] = { K_ESC, K_RET, 0 };
      char buffer[32];

      switch(emode)
      {
	case 1:
	  sprintf(buffer, "%x", abase);
	  if (inputlc(L0, 60, buffer,3,"a1", exitkey)!=K_ESC)
	  { int2 newabase, newvectit;

	    sscanf(buffer, "%x", &newabase);
	    sprintf(buffer, "%x", vectit);
	    if (inputlc(L0, 74, buffer,2,"a1", exitkey)!=K_ESC)
	    { sscanf(buffer, "%x", &newvectit);

	      abase = newabase;
	      vectit = newvectit;
	    }
	  }
	  break;

	case 2:
	  sprintf(buffer, "%d", vitesse);
	  if (inputlc(L0+2, 60, buffer,5,"1", exitkey)!=K_ESC)
	  { int2 newvitesse;

	    sscanf(buffer, "%d", &newvitesse);
	    for (i=0 ; tabspeed[i] ; i++)
	      if (newvitesse==tabspeed[i]) break;
	    if (tabspeed[i]==0)
	      alert(1,"Attention !",CAL1,CAL2,CAL3,CAL4,"|Les seules vitesses actuellement|reconnues sont les suivantes:||  . 300     . 1200    . 4800|  . 600     . 2400    . 9600|",1,1,"Ok");
	    else
	      vitesse = newvitesse;
	  }
	  break;

	case 3:
	  strcpy(buffer, seqinit);
	  if (inputlc(L0+6, 60, buffer, 20, "X", exitkey)!=K_ESC)
	    strcpy(seqinit, buffer);
	  break;

      }
      dispadd(emode);
      emode = 0;
    }

  } /* while (!fin) */


  ve_clszone(24,25);
  ve_gotolc(24,1);
  vb_refresh();
  exit(0);

} /* pm1b */

