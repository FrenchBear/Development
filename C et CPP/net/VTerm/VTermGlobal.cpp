// VTermGlobal.cpp
// Fonctions et variables globales de VTerm
// 03/05/96 PV
//  1/11/96 PV	szMonAdresseIP
//  9/12/98 PV	Changement de couleur bleu brillant par défaut
// 31/10/00 PV	iLignesDefautOptions/iColonnesDefautOptions

#include "stdafx.h"
#include "VTerm.h"
#include "VTermGlobal.h"

// Couleurs par défaut
COLORREF tcolCouleursDefaut[16] =
{
  RGB(0,0,0),				// Noir
  RGB(0,0,0x80),	 		// Bleu
  RGB(0,0x80,0),			// Vert
  RGB(0,0x80,0x80),			// Cyan
  RGB(0x80,0,0),			// Rouge
  RGB(0x80,0,0x80),			// Magenta
  RGB(0x80,0x80,0),			// "Brun"
  RGB(255, 251, 240),		// Blanc
  RGB(180,180,184),			// Noir "clair" !
  RGB(0x80, 0x80, 0xff),	// Bleu brillant  (devrait être RGB(0,0,255))
  RGB(0,255,0),				// Vert brillant
  RGB(0,255,255),			// Cyan brillant
  RGB(255,0,0),				// Rouge brillant
  RGB(255,0,255),			// Magenta brillant
  RGB(255,255,0),			// Jaune
  RGB(255,255,255),			// Blanc brillant
};

COLORREF tcolCouleurs[16];	// Couleurs courantes utilisées lors de l'affichage

int bCouleursModifiees;		// Vrai si les couleurs ont été trafiques (à sauvegerder en fin de programme)
int iOptions;				// Options globales du programme
int iLignesDefautOptions;	// Lignes par défaut pour les nouvelles fenêtres
int iColonnesDefautOptions;	// Colonnes par défaut pour les nouvelles fenêtres
char szFont[31];			// Police d'affichage

// Historique des 6 dernières connexions
ConnexionRecente CR;

// Gestion de la palette
int bAvecPalette;			// Vrai si l'affichage utilise une palette de couleurs
CPalette *pCPal = NULL;
LOGPALETTE *pLogPalette = NULL;

// Sélection en cours
BOOL  bModeSelection;

// Options
BOOL  bOptDebug;

// Suivi des connexions actives
int	  iNbConnexionsActives = 0;

// Identification de la machine sur laquelle tourne VTerm
char  szMonAdresseIP[16];

//============================================================================

void ReaffichageComplet(BOOL bChangePolice)
{
  // On ajoute un + au nom de la police courante pour indiquer qu'il faut
  // la recréer dans OnUpdate
  if (bChangePolice)
	strcat(szFont, "+");

  // On met à jour toutes les vues de tous les documents
  POSITION p0 = AfxGetApp()->GetFirstDocTemplatePosition();
  while (p0!=NULL)
  {
	CDocTemplate* pDocTemplate = AfxGetApp()->GetNextDocTemplate(p0);
	POSITION p1 = pDocTemplate->GetFirstDocPosition();
	while (p1!=NULL)
	{
	  CDocument *pDoc = pDocTemplate->GetNextDoc(p1);
	  pDoc->UpdateAllViews(NULL);
	}
  }
}


// Pour les afichages avec palette, génère une palette avec le tableau des 16
// couleurs souhaitées dans la variable globale pCPal
void GenerePalette(COLORREF tcolCouleurs[16])
{
  int i;

  if (pCPal!=NULL) delete pCPal;

  if (pLogPalette==NULL)
	pLogPalette =(LOGPALETTE *) malloc(sizeof(LOGPALETTE)+15*sizeof(PALETTEENTRY));
  pLogPalette->palVersion = 0x300;
  pLogPalette->palNumEntries = 16;
  for (i=0 ; i<16 ; i++)
  {
	pLogPalette->palPalEntry[i].peRed = GetRValue(tcolCouleurs[i]);
	pLogPalette->palPalEntry[i].peGreen = GetGValue(tcolCouleurs[i]);
	pLogPalette->palPalEntry[i].peBlue = GetBValue(tcolCouleurs[i]);
	pLogPalette->palPalEntry[i].peFlags = 0;
  }

  pCPal = new CPalette;
  pCPal->CreatePalette(pLogPalette);
}
