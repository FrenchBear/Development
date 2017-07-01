// ouvreserie.c
// Rappel d'une s‚rie pr‚c‚demment imprim‚e

#include <stdio.h>
#include <ctype.h>
#include <time.h>
#include <clib.ref>

#include <cuc.h>

#include "serie.h"		// Interface publique C
#include "serieec.h"	// Interface publique E-SQL/C

//====================================================================
// Donn‚es priv‚es

static int iSerieAOuvrir;

/*====================================================================*/

static struct CUC_Form   *fOuvrir;		// Pointeur de feuille

#define OUVRIR           400		// Base des contr“les de la feuille
#define lblPrompt        (OUVRIR+1)
#define txtNumSerie      (OUVRIR+2)
#define lblLegende       (OUVRIR+3)
#define lstSeries        (OUVRIR+4)
#define btnOuvrir        (OUVRIR+5)
#define btnAnnuler       (OUVRIR+6)

static struct FormControl tOuvrirControls[] =
{
  OUVRIR,             CUCT_FORM,          3,  10,  20, 65,  0,   "S‚ries pr‚c‚dentes",
  lblPrompt,          CUCT_LABEL,         2,  2,   1,  10,  OUVRIR, "&S‚rie:",
  txtNumSerie,        CUCT_TEXTEDIT,      1,  9,   3,  15,  OUVRIR, "",

  lblLegende,         CUCT_LABEL,         4,  2,   1,  46,  OUVRIR, "Nø   Tech      Date",
  lstSeries,          CUCT_LIST,          5,  1,   14, 46,  OUVRIR, "",
  btnOuvrir,          CUCT_COMMANDBUTTON, 2,  49,  3,  12,  OUVRIR, "Ok",
  btnAnnuler,         CUCT_COMMANDBUTTON, 5,  49,  3,  12,  OUVRIR, "Annuler",
  -1
};

// Configuration initiale des contr“les
static void Ouvrir_InitCtrl()
{
  CUC_FormSetPropNum(fOuvrir, btnOuvrir, CUCP_DEFAULT, 1);
  CUC_FormSetPropNum(fOuvrir, btnAnnuler, CUCP_CANCEL, 1);
  CUC_FormSetPropNum(fOuvrir, lstSeries, CUCP_TABSIZE, 5);
}


static void OUVRIR_Load()
{
  int	i;
  time_t t;
  char	szLigne[60];
  $char	szdatemin[20];

  Ouvrir_InitCtrl();
  t = time(0L) - 7*24*60*60;
  UTtoYS(t, szdatemin);

  $declare COuvrir cursor for
	select ser_numserie, ser_numtech, ser_dh
	  into $r_ser.ser_numserie, $r_ser.ser_numtech, $r_ser.ser_dh
	  from serielabo
	  where ser_dh>=$szdatemin
	  order by ser_numserie desc;

  $open COuvrir;
  for(;;)
  {
	$fetch COuvrir;
	if (sqlca.sqlcode==100) break;

	sprintf(szLigne, "%d\t%s\t%s",
	  r_ser.ser_numserie, szIdToInit(r_ser.ser_numtech), r_ser.ser_dh);

	CUC_FormAddItem(fOuvrir, lstSeries, szLigne, -1);
  }
  $close COuvrir;
}

static void OUVRIR_Key(int *piKey)
{
  if (*piKey==KEY_CTRL_D)		// Sortie de secours...
	CUC_FormExit(fOuvrir);
  else if (*piKey==KEY_F(2))	// Sortie g‚n‚rale pour ce programme
	CUC_FormExit(fOuvrir);
}

static void txtNumSerie_GotFocus()
{
  CUC_FormSetPropNum(fOuvrir, txtNumSerie, CUCP_SELSTART, 0);
  CUC_FormSetPropNum(fOuvrir, txtNumSerie, CUCP_SELLENGTH, 99);
}

static void lstSeries_Change()
{
  char szBuffer[20];

  CUC_FormGetPropStr(fOuvrir, lstSeries, CUCP_TEXT, szBuffer, sizeof(szBuffer));
  sprintf(szBuffer, "%d", atoi(szBuffer));
  CUC_FormSetPropStr(fOuvrir, txtNumSerie, CUCP_TEXT, szBuffer);
  CUC_FormSetPropNum(fOuvrir, txtNumSerie, CUCP_SELSTART, 0);
  CUC_FormSetPropNum(fOuvrir, txtNumSerie, CUCP_SELLENGTH, 99);
}

static void btnOuvrir_Clic()
{
  char szBuffer[20];

  CUC_FormGetPropStr(fOuvrir, txtNumSerie, CUCP_TEXT, szBuffer, sizeof(szBuffer));
  iSerieAOuvrir = atoi(szBuffer);
  CUC_FormExit(fOuvrir);
}

// Sortie simple par annulation
static void btnAnnuler_Clic()
{
  CUC_FormExit(fOuvrir);
}


static void txtNumSerie_Key(int *piKey)
{
  // Les flŠches verticales sont sous-trait‚es … la liste
  if (*piKey==KEY_DOWN || *piKey==KEY_PGDN ||
	  *piKey==KEY_UP   || *piKey==KEY_PGUP)
  { 
	CUC_FormDoEvent(fOuvrir, lstSeries, CUCE_KEY, *piKey);
	*piKey = 0;
  }
}


static struct FormEvent tOuvrirEvents[] =
{
  OUVRIR,        CUCE_LOAD,            OUVRIR_Load,
  OUVRIR,        CUCE_KEY,             OUVRIR_Key,
  txtNumSerie,   CUCE_GOTFOCUS,        txtNumSerie_GotFocus,
  txtNumSerie,   CUCE_KEY,             txtNumSerie_Key,
  lstSeries,     CUCE_CHANGE,          lstSeries_Change,
  btnOuvrir,     CUCE_CHANGE,          btnOuvrir_Clic,
  btnAnnuler,    CUCE_CHANGE,          btnAnnuler_Clic,
  -1
};

//====================================================================

int iOuvrir()
{
  iSerieAOuvrir = 0;

  // On lance la feuille d'ouverture
  if (CUC_FormCreate(&fOuvrir,tOuvrirControls,tOuvrirEvents,NULL)<0)
	aprintf("Ouvrir", "Echec … la cr‚ation de la feuille !");
  else
  { 
	CUC_FormShow(fOuvrir);
	CUC_FormExec(fOuvrir);
	CUC_FormDestruct(fOuvrir);
  }

  return iSerieAOuvrir;
}
