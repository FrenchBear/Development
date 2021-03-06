/* clavier.c
** version DOS
** 20/05/92	MSC 7.0
*/

#include <stdio.h>
#include <dos.h>
int kbhit(void);

#include "m1b.h"
#include "clavier.h"
#include "ecran.h"

#include "proto.ref"
#include "clavier.ref"
#include "ecran.ref"

extern CONTEXTE contexte;

static int automajus = 1;

void cla_init()
{
}

void cla_minuscules(int mode)
{
  automajus = !mode;
}

int cla_cardispo()
{
  return kbhit();
}

word cla_litcar()
{
  union REGS reg;

  reg.h.ah = 0;
  int86(0x16, &reg, &reg);
  return (word)(reg.h.al?reg.h.al:FKEY+reg.h.ah);
}

typedef struct
{ word key;
  char *seq;
} CONVERSIONw;

typedef struct
{ byte key;
  char *seq;
} CONVERSIONb;

CONVERSIONb acc_videotex[] =
{
  '',          "\031Aa",
  '',          "\031Ca",
  '',          "\031Ha",
  '',          "\031Ae",
  '',          "\031Be",
  '',          "\031Ce",
  '',          "\031He",
  '',          "\031Au",
  '',          "\031Cu",
  '',          "\031Hu",
  '',          "\031Ci",
  '',          "\031Hi",
  '',          "\031Co",
  '',          "\031Ho",
  '',          "\031Kc",
  'α',          "\031{",
  '',          "\031#",
  '«',          "\031=",
  '¬',          "\031<",
  '',          "\031'",
  'ψ',          "\031" "0",
  'ρ',          "\031" "1",
  'φ',          "\031" "8"
};

#define NBACCVIDEOTEX (sizeof(acc_videotex)/sizeof(acc_videotex[0]))


CONVERSIONb acc_mixtefr[] =
{
  '',          "@",
  '',          "a",
  '',          "a",
  '',          "{",
  '',          "}",
  '',          "e",
  '',          "e",
  '',          "|",
  '',          "u",
  '',          "u",
  '',          "i",
  '',          "i",
  '',          "o",
  '',          "o",
  'ψ',          "[",
  '',          "\\",
  '',          "]",
};

#define NBACCMIXTEFR (sizeof(acc_mixtefr)/sizeof(acc_mixtefr[0]))


CONVERSIONb acc_mixteus[] =
{
  '',          "a",
  '',          "a",
  '',          "a",
  '',          "e",
  '',          "e",
  '',          "e",
  '',          "e",
  '',          "u",
  '',          "u",
  '',          "u",
  '',          "i",
  '',          "i",
  '',          "o",
  '',          "o",
  'ψ',          "o",
  '',          "c",
  '',          "par",
};

#define NBACCMIXTEUS (sizeof(acc_mixteus)/sizeof(acc_mixteus[0]))

static CONVERSIONw tcode[] =
{
  K_F3, 	"\023I",        /* Connexion/Fin */
  K_F4, 	"\023D",        /* Guide */
  K_F5, 	"\023F",        /* Sommaire */
  K_F6, 	"\023E",        /* Annulation */
  K_F7, 	"\023C",        /* Rptition */
  K_F8, 	"\023B",        /* Retour */
  K_F9, 	"\023H",        /* Suite */
  K_RET,	"\023H",        /* Suite */
  K_F10,	"\023A",        /* Envoi */
  K_BACK,	"\023G",        /* Correction */

  K_UP, 	"\033[A",
  K_DOWN,	"\033[B",
  K_RIGHT,	"\033[C",
  K_LEFT,	"\033[D"
};

#define NBTCODE (sizeof(tcode)/sizeof(tcode[0]))


static void protocolestr(byte *ch)
{
  while (*ch) pro_from_cla(*ch++);
}

static int send(word key)
{
  int i;

  if (key==K_F1)
  {
    phy_cls();
    phy_goto(0,0);
    puts("                 ΙΝΝΝΝΝ»");
    puts("                 Ί M1B Ί");
    puts("                 ΘΝΝΝΝΝΌ");
    puts(" ");
    puts("      F1  - Aide");
    puts("      F2  - Photo");
    puts(" ");
    puts("      F3  - Mode local/Mode connect");
    puts(" ");
    puts("      F4  - Guide");
    puts("      F5  - Sommaire");
    puts("      F6  - Annulation");
    puts("      F7  - Rptition");
    puts("      F8  - Retour");
    puts("      F9  - Suite");
    puts("      F10 - Envoi");
    puts("Backspace - Correction");
    puts(" ");
    puts("Appuyez sur une touche...");
    cla_litcar();
    ecr_redisplay();
    return 0;
  }
  if (key==K_ALT_X || key==K_END) return -1;
  if (key==K_ALT_R /* || key==K_CTRL_R */ )
  { ecr_redisplay();
    return 0;
  }
  if (key==K_F2)
  { ecr_photo();
    return 0;
  }
  /*
  if (key==K_F3)
  { pro_inversestatus();
    return 0;
  }
  */

  if (!(key&FKEY))
  {
    if (automajus)
      if (key>='a' && key<='z') key -= 32;
      else if (key>='A' && key<='Z') key += 32;

    switch(contexte.police)
    {
      case PO_G0:
      case PO_G1:
      case PO_G2_1:
      case PO_ACCENT:
	for (i=0 ; i<NBACCVIDEOTEX ; i++)
	{
	  if ((byte)key == acc_videotex[i].key)
	  { protocolestr(acc_videotex[i].seq);
	    return 0;
	  }
	}
	break;

      case PO_G0US:
	for (i=0 ; i<NBACCMIXTEUS ; i++)
	  if ((byte)key == acc_mixteus[i].key)
	  { protocolestr(acc_mixteus[i].seq);
	    return 0;
	  }
	break;

      case PO_G0FR:
	for (i=0 ; i<NBACCMIXTEFR ; i++)
	  if ((byte)key == acc_mixtefr[i].key)
	  { protocolestr(acc_mixtefr[i].seq);
	    return 0;
	  }
	break;
    }

  }

  if (key&FKEY || key==K_BACK)
  {
    for (i=0 ; i<NBTCODE ; i++)
      if (key==tcode[i].key)
      { protocolestr(tcode[i].seq);
	return 0;
      }
    ecr_beep();
  }
  else
    if (key>127)
      ecr_beep();
    else
      pro_from_cla((byte)key);

  return 0;
}

int cla_job()
{
  if (!cla_cardispo()) return 0;
  return send(cla_litcar());
}

