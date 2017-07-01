/* ruban.c
** impression du ruban d'‚tiquettes dur la 2Šme imprimante
**  5/08/94 PV  1Šre version
*/

#include <stdio.h>
#include <fcntl.h>
#include <termio.h>
#include <signal.h>
#include <clib.ref>
#include <cuc.h>

#include "serie.h"

//====================================================================

int Imp;				// Imprimante 4100 pour le ruban direct

#include "ascii.h"

//====================================================================

static int iprintf(char *szFormat, ...)
{
  int	c = 0;
  char	szBuffer[128];
  int	iStop;
  int	i;

  szBuffer[0] = STX;
  vsprintf(szBuffer+1, szFormat, (char *)(1+&szFormat));
  szBuffer[strlen(szBuffer)+1] = 0;
  szBuffer[strlen(szBuffer)] = ETX;
  for(iStop=0 ; iStop==0 ;)
  {
    write(Imp, szBuffer, strlen(szBuffer));

    while ((i=read(Imp, &c, 1))>0)
	{
	  c &= 127;
	  if (c==GS || c==DC3) continue;
	  if (c==SOH)
	  { iStop=1;
		break;
	  }

	  switch(c)
	  {
		case US:
		  i = iAlert("Erreur US","|Erreur ruban|",1,2,"R‚essayer|Abandonner");
		  if (i==2) iStop = 1;
		  break;

		case EM:
		  i = iAlert("Erreur US","|Pas d'alimentation d'‚tiquette|",1,2,"R‚essayer|Abandonner");
		  if (i==2) iStop = 1;
		  break;

		default:
		  iStop = 1;
		  break;
	  }
	}
  }
  return 0;
}


void RubanInit()
{
  Imp = open("/dev/ttya03", O_RDWR);
  if (Imp<0)
  { perror("Echec … l'ouverture de /dev/ttya03");
    return;
  }
  else
  {
    int errflag;
    struct termio term;

    errflag = ioctl(Imp, TCGETA, &term);
    if (errflag<0)
      perror("Echec au 1er ioctl");
    term.c_iflag &= ISTRIP|ICRNL;
    term.c_lflag &= ~(ICANON|ECHO);
    term.c_cc[VMIN] = '\1';
    term.c_cc[VTIME] = '\1';
    errflag = ioctl(Imp, TCSETA, &term);
    if (errflag<0)
      perror("Echec au 2eme ioctl");
  }
}


void Ruban1Etiq(struct BOITE *b)
{
  int	j;
  int	iLettres;
  int	iRef;
  int	iEch;
  int	iDil;
  char	szBuffer[128];
  int	iNbb;

//aprintf("Ruban1Etiq", "Ref: %s|Sachet: %d|Type: %d", b->szReference, iSachet, b->iTypeMarquage);

  /* G‚n‚ration de la r‚f‚rence num‚rique */
  iLettres = (b->szReference[0]-'A')*26+(b->szReference[1]-'A');
  iRef = atoi(b->szReference+2);
  iEch = atoi(1+strchr(b->szReference, '.'));

  if (b->iGermel==-1)
    iDil = 7;	/* sachet, conventionnel */
  else if (b->iDilution>=-6 && b->iDilution<=0)
	iDil = -b->iDilution;
  else if (b->iDilution==-32768)
	iDil = 9;	/* pas de dilution */
  else
	iDil = 8;	/* ‚chantillon pur */

  if (b->iGermel==-1)	// Sac
	iNbb = 1;
  else
	iNbb = b->iNbBoites;

  if (b->iTypeMarquage==4)
	for (j=0 ; j<iNbb ; j++)
	{
	  szBuffer[0] = 0;
	  sprintf(szBuffer+strlen(szBuffer), "%cE1", ESC);	/* S‚lection du format 1 */
	  sprintf(szBuffer+strlen(szBuffer), "%c", CAN);
	  sprintf(szBuffer+strlen(szBuffer), "%s\r", b->szReference);
	  sprintf(szBuffer+strlen(szBuffer), "%s\r", b->szCritere);

	  if (b->iGermel==-1)
		sprintf(szBuffer+strlen(szBuffer), "Broyat\r");
	  else if (b->iDilution==1)
		sprintf(szBuffer+strlen(szBuffer), "%sEP\r", b->szGermel);
	  else if (b->iDilution!=-32768)
		sprintf(szBuffer+strlen(szBuffer), "%s%2d\r", b->szGermel, b->iDilution);
	  else
		sprintf(szBuffer+strlen(szBuffer), "%s\r", b->szGermel);

	  sprintf(szBuffer+strlen(szBuffer), "%s\r", szTech);

	  if (b->iNbBoites==1)
		sprintf(szBuffer+strlen(szBuffer), "\r");
	  else
		sprintf(szBuffer+strlen(szBuffer), "Bte %d\r", j+1);

	  sprintf(szBuffer+strlen(szBuffer), "%03d%06d%02d%02d%01d00", iLettres, iRef, iEch, b->iGermel<0?0:b->iGermel, iDil);
	  sprintf(szBuffer+strlen(szBuffer), "%c", ETB);

	  iprintf("%s", szBuffer);
	}

}


// Fermeture de la liaison
void RubanFin()
{
  // Ejection d'une ‚tiquette vierge
  iprintf("%c%c", CAN, ETB);

  sleep(1);
  if (Imp>=0)
  { close(Imp);
  }
}

