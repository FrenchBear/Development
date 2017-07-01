/* impr.c
** Impression des ‚tiquettes
** 29/04/94 PV  PremiŠre version
**  7/07/94 PV  Livraison de la machine
** 26/10/94 PV	Version fonctionnant sur le serveur
*/

#include <stdio.h>
#include <fcntl.h>
#include <termio.h>
#include <signal.h>
#include <clib.ref>
#include <cuc.h>

#include "serie.h"

//====================================================================

#define HT_PILE_MAX	20
static int	iTaillePile;	// Hauteur de la pile courante

extern char szNomOperateur[];
static char szOldRef[11];

/*
#define LASER			// Impression de la planche laser
*/
#ifndef serveur
#define ETIQUETEUSE		// Machine … d‚poser les ‚tiquettes
#endif

#ifdef ETIQUETEUSE
int Mach;				// Machine … d‚poser les ‚tiquettes
#else
FILE *fTra;
#endif

#ifdef LASER
FILE *Las;	/* Laser */
#endif

#include "ascii.h"

extern void InfoMarquage(char *szMessage, int iRefresh, int iInit);

//====================================================================

static void Cubitus(int iFiller)
{
  // InfoMarquage("Appel chien de garde", 1, 0);
}


void ImpInit()
{
#ifdef ETIQUETEUSE
  int i,j;
  char c;
  char szBuffer[100];

  Mach = open("/dev/ttya02", O_RDWR);
  if (Mach<0)
  { perror("Echec … l'ouverture de /dev/ttya02");
    return;
  }
  else
  {
    int errflag;
    struct termio term;

    errflag = ioctl(Mach, TCGETA, &term);
    if (errflag<0)
      perror("Echec au 1er ioctl");
    term.c_iflag &= ISTRIP|ICRNL;
    term.c_cflag &= CSIZE;
    term.c_cflag |= CS8;
    term.c_lflag &= ~(ICANON|ECHO);
    term.c_cc[VMIN] = '\1';
    term.c_cc[VTIME] = '\0';
    errflag = ioctl(Mach, TCSETA, &term);
    if (errflag<0)
      perror("Echec au 2eme ioctl");

    // On vide le buffer d'entr‚e
	signal(SIGALRM, Cubitus);
	alarm(1);
	for(;;)
	{
	  i = 0;
	  for (;;)
	  { j = read(Mach, &c, 1);
		if (j<0) break;
		szBuffer[i++] = c;
		if (c=='\r' || c=='\n' || i==100) break;
	  }
	  if (j<0) break;
	  szBuffer[--i] = 0;
	  // aprintf("Ouverture machine", "Re‡u: %s", szBuffer);
	}
	alarm(0);
	signal(SIGALRM, SIG_IGN);

    iTaillePile = 0;
  }
#else
  fTra = fopen("envoi_automate.txt", "a");
#endif

#ifdef LASER
  Las = popen("lpr -s", "w");
  fprintf(Las, "S‚rie d'‚chantillons de %s\n", szNomOperateur);
  fprintf(Las, "Edition du %s\n\n", szDateFr());
#endif

  szOldRef[0] = 0;
}


// Envoie un ordre BOITE … l'automate de marquage des ‚tiquettes
static void Marque1Boite(int iType, char *szImpr, int iFin)
{
  char	szMessage[100];
  char	szBuffer[400], c;
  char	szRecu[100];
  int	i, j;
  int	iDeja;

  sprintf(szBuffer, "BOITE %d,\"%s\",%d\r", iType, szImpr, iFin);

#ifdef ETIQUETEUSE
  do
  {
	static char szRestart[3] = "?\r";

    i = 0;
	iDeja = 0;
    for (;;)
    {
	  signal(SIGALRM, Cubitus);
	  alarm(5);
	  if (!iDeja)
	  { iDeja = 1;
		InfoMarquage("Lecture:", 1, 0);
	  }
	  j = read(Mach, &c, 1);
	  if (j<0)
	  { 
		InfoMarquage("Lecture: Sortie par chien de garde -> Envoi de ?<CR>", 1, 0);
		write(Mach, szRestart, 2);
		iDeja = 0;
		continue;
	  }
      szRecu[i++] = c;
      if (c=='\r' || c=='\n') break;
    }
    szRecu[--i] = 0;

    sprintf(szMessage, "Lecture: Re‡u: %s", szRecu);
	InfoMarquage(szMessage, 1, -1);

  } while (strcmp(szRecu, "OK"));
  alarm(0);
  signal(SIGALRM, SIG_IGN);

  write(Mach, szBuffer, strlen(szBuffer));

#else

  for (i=strlen(szBuffer) ; i-- ; )
  { if (szBuffer[i]=='\r') szBuffer[i]='|';
	if (szBuffer[i]<' ') szBuffer[i]='.';
  }
  fprintf(fTra, "%s\n", szBuffer);

#endif
}


void Imp1Boite(struct BOITE *b, int iFin)
{
  int	j;
  int	iLettres;
  int	iRef;
  int	iEch;
  int	iDil;
  char	szBuffer[128];
  int	iF;

  /* G‚n‚ration de la r‚f‚rence num‚rique */
  iLettres = (b->szReference[0]-'A')*26+(b->szReference[1]-'A');
  iRef = atoi(b->szReference+2);
  iEch = atoi(1+strchr(b->szReference, '.'));
  if (b->iDilution>=-6 && b->iDilution<=0)
	iDil = -b->iDilution;
  else if (b->iDilution==-32768)
	iDil = 9;	/* pas de dilution */
  else
	iDil = 8;	/* ‚chantillon pur */


  if (b->iTypeMarquage!=4)
	for (j=0 ; j<b->iNbBoites ; j++)
	{
	  szBuffer[0] = 0;
	  sprintf(szBuffer+strlen(szBuffer), "%c", STX);
	  sprintf(szBuffer+strlen(szBuffer), "%cE1", ESC);	/* S‚lection du format 1 */
	  sprintf(szBuffer+strlen(szBuffer), "%c", CAN);
	  sprintf(szBuffer+strlen(szBuffer), "%s\r", b->szReference);
	  sprintf(szBuffer+strlen(szBuffer), "%s\r", b->szCritere);
	  if (b->iDilution==1)
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

	  sprintf(szBuffer+strlen(szBuffer), "%03d%06d%02d%02d%01d00", iLettres, iRef, iEch, b->iGermel, iDil);
	  sprintf(szBuffer+strlen(szBuffer), "%c", ETB);
	  sprintf(szBuffer+strlen(szBuffer), "%c", ETX);

	  // L'ordre de fin est ignor‚ avant la derniŠre d'un
	  // marquage multiple
	  iF = iFin;
	  if (j!=b->iNbBoites-1) iF = 0;

	  // Mais si la pile d‚borde, on en tient compte tout de suite
	  if (iTaillePile==HT_PILE_MAX) iF = 1;
	  Marque1Boite(b->iTypeMarquage, szBuffer, iF);
	  if (iF)
		iTaillePile = 0;
	  else
		iTaillePile++;
	}

#ifdef LASER
  if (Las!=NULL)
  {
    if (strcmp(szRef, szOldRef))
    { fprintf(Las, "\n%-11s %-4s\n", szRef, szCrit);
      strcpy(szOldRef, szRef);
    }

    fprintf(Las, "   ");
    if (iDilution==1)
      fprintf(Las, "%s EP", szGermel);
    else if (iDilution!=-32768)
      fprintf(Las, "%s %2d", szGermel, iDilution);
    else
      fprintf(Las, "%s   ", szGermel);

    if (iQuantite!=-32768)
      fprintf(Las, "%5g ml ", iQuantite/10.0);
    else
      fprintf(Las, "         ");

    if (nbBoites!=1)
      fprintf(Las, " %2d b ", nbBoites);
    else
      fprintf(Las, "      ");

    fprintf(Las, " %s\n", szComment);

  }
#endif
}

void ImpFin()
{

// Fermeture de la liaison
#ifdef ETIQUETEUSE
  if (Mach>=0)
  { close(Mach);
  }
#else
  fclose(fTra);
#endif

#ifdef LASER
  if (Las!=NULL)
    pclose(Las);
#endif
}

