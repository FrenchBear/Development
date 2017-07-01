
/*  INIT.C	P.Violent	MSC 4.0|5.0 / MS-DOS
**
**  Ver. 1.00	16.IV.88	extrait de divers.ref
**  Ver. 1.01	11.V.88 	Modif variables globales de VLIB
**  Ver. 1.10	16.V.88 	Fin de l'init des var gl. dans initvlib
**  Ver. 1.20	17.V.88 	Compatibilit‚ MSC 5.0; nouveaux .REF
**  Ver. 1.30	17.V.88 	Fin de vlibvar r‚cuper‚ ici
**  Ver. 1.40	20.V.88 	E/S ‚volu‚es
**  Ver. 1.50	23.V.88 	VLIB 2.0
**  Ver. 1.51	7.VII.88	Test du retour du halloc
**  Ver. 1.52	30.VII.88	Utilisation de const
**
**
**  Initialisation des routines de vlib
*/

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s de la biblio C standard */

#include <stdio.h>	/* NULL */
#include <stdlib.h>	/* exit, ... */
#include <string.h>

/*============================================================================*/
/* prototypes, d‚finitions et variables import‚s des autres modules de VLIB */

#include "vtypes.h"

#include "vdef.h"
#include "vconst.h"

#include "vbios.ref"

/*============================================================================*/
/* prototypes des fonctions et proc‚dures du module */

#include "init.ref"

static void near init_ecran(void);
static void near init_vb_io(void);

/* finvlib n'est pas d‚clar‚ en near car il est utilis‚ en paramŠtre de
** onexit qui n‚c‚ssite un far * en modŠle large.
*/

/*============================================================================*/
/* Variables export‚es */

/* version */
public const uint1 _vlibmajor = 2;
public const uint1 _vlibminor = 10;

/* bios */
public uint2   vb_index;
public uint1   far *vb_dptr,vb_at;
public uint1   vb_io;
public uint1   vb_lig,vb_col,vb_curs;

/* terminal */
public uint1   vt_lig,vt_col,vt_vmode,vt_police,vt_type;
public uint2   vt_col2;
public booleen vt_couleur;

/* alert / menu */
public int2	am_lig,am_col;

/* pa */
public char far *pa_buffer;
public char far *pa_zbuffer;

/* variables internes … vlib */
public uint1   *_conv_at;	/* table de conversion des attributs */
public booleen _nconv=1;	/* ok si conversion caracteres */

/*============================================================================*/
/* Variables et proc‚dures priv‚es */

booleen ega43vga50 = 0;

/*============================================================================*/

/* initvlib	Cette routine initialise les diverses routines de la
**		bibliothŠque VLIB, notamment les couleurs par d‚faut,
**		ou l'adresse de base de la m‚moire ‚cran.
*/

void initvlib()
{
  init_vb_io();
  init_ecran();

  pa_buffer = malloc(PA_BUFFERSIZE);
  pa_zbuffer = pa_buffer;
  if (pa_buffer == NULL)
    vlib_err("(init.c) initvlib: plus de m‚moire pour le malloc !");

} /* initvlib */

/*============================================================================*/

/* vlib_err	ProblŠme lors de l'utilisation d'une routine de vlib
*/

void vlib_err(message)
const char *message;
{
  vb_sorch("\nProblŠme dans VLIB:");
  vb_sorch(message);
  vb_sorcar('\n');
  exit(1);

} /* vlib_err */

/*============================================================================*/

/* init_ecran()  Initialise les variables globales:
**		   vb_dptr:	pointeur sur le 1er caractŠre de l'‚cran
**				en mode direct, ou sur un tableau de
**				2*vt_lig*vt_colc aractŠres qui simule l'‚cran.
**		   vt_couleur:	vrai si on travaille avec une carte couleur.
*/

static void near init_ecran()
{
  vt_vmode = 0;
  vb_dptr = (char far *)malloc(2*vt_lig*vt_col);

  vt_col2 = vt_col+vt_col;

  /* grosse cuisine pour adapter les couleurs en noir et blanc ! */
  if (!vt_couleur || vb_io==VO_DIRECT2)
  {
    uint2 i;
    uint1 c1,c2;

    _conv_at = (uint1 *) malloc(256);
    for (i=0 ; i<256 ; i++)
    {
      c1 = (uint1) (i&7);
      c2 = (uint1) ((i>>4)&7);
      if (c1>0) c1=7;
      if (c2>0) c2=7;
      if (c1==c2) c1=(int1)(7-c1);
      _conv_at[i] = (uint1) ((i&0x88)|c1|(c2<<4));
    }
  }

  vb_curs = 1;
  vb_setattrib(7);		/* d‚faut: blanc/noir */
  vb_clszone(0,vt_lig-1);

} /* initecran */

/*============================================================================*/

/* init_vb_io	Initialisation de la variable vb_io avec une des constantes
**		VB_xx de vlib.def en fonction de la variable globale TERM.
*/

static void near init_vb_io()
{
  char *p,*q;
  char item[32];
  int2 lg,i;
  char c;
  int2 termdef=0;

  p = NULL;  /* getenv("vterm"); */
  if (p==NULL) p = "ansipc,ascii8pc2,co,25";
  q = p;

  vt_couleur = 2;	/* rappel: vt_couleur est un booleen !!!! */
			/* 2=non d‚fini ici. */
  for(;;)
  {
    while (*p==' ') p++;
    if (*p==0) break;
    lg = 0;
    while ((c=*p) && c!=' ' && c!=',') { item[lg++]=c; p++; }
    item[lg]=0;
    while (*p==' ') p++;
    if (*p==',' && lg>0)
      p++;
    else if (*p || lg==0)
    {
      puts("VTERM: erreur de syntaxe: (au niveau du !)");
      puts(q);
      for (i=(int2)(p-q) ; i-- ;) putchar(' ');
      putchar('!');
      putchar('\n');
      exit(1);
    }

     if (strcmp(item,"ansipc")==0)  {termdef++; vb_io=VO_DOS;     vt_type=VT_ANSIPC; vt_lig=25; vt_col=80; vt_police=VP_ASCII8PC2; vt_couleur=0; }
else if (strcmp(item,"vt100")==0)   {termdef++; vb_io=VO_DOS;     vt_type=VT_VT100;  vt_lig=24; vt_col=80; vt_police=VP_ASCII7US;  vt_couleur=0; }
else if (strcmp(item,"m1b80")==0)   {termdef++; vb_io=VO_DOS;     vt_type=VT_M1B80;  vt_lig=24; vt_col=80; vt_police=VP_ASCII7FR;  vt_couleur=0; }
else
    {
      if (termdef==0)
      {
	fputs("VTERM: type_sortie inconnu: ",stdout);
	puts(item);
	exit(1);
      }
 else if (strcmp(item,"ascii8pc")==0)  { vt_police=VP_ASCII8PC; }
 else if (strcmp(item,"ascii8pc2")==0) { vt_police=VP_ASCII8PC2; }
 else if (strcmp(item,"ascii7us")==0)  { vt_police=VP_ASCII7US; }
 else if (strcmp(item,"ascii7fr")==0)  { vt_police=VP_ASCII7FR; }
 else if (strcmp(item,"co")==0)        { vt_couleur=1; }
 else if (strcmp(item,"nb")==0)        { vt_couleur=0; }
 else {
	i=(int2)atoi(item);
	if (i>=24 && i<=79)   vt_lig = (uint1)i;
   else if (i>=80 && i<=140)  vt_col = (uint1)i;
   else {
	  fputs("VTERM: champ non reconnu: ",stdout);
	  puts(item);
	  exit(1);
	}
      }
    }

  } /* for(;;) */

  if (termdef>1)
  { puts("VTERM: Plusieurs valeurs pour type_sortie !!!");
    exit(1);
  }

} /* init_vb_io  */

