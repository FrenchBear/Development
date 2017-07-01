/* cuctxt.c
** Impl‚mentation du contr“le TextEdit de la bibliothŠque CUC v2
** 16/01/95 PV
*/

#include <stdio.h>
#include <curses.h>
#include <memory.h>
#include <ctype.h>

#include <clib.ref>
#include <biberc.h>

#include "cuc.h"
#include "cucpriv.h"
#include "import.h"

#ifdef UNIX
#define max(a,b)        ((a)<(b) ? (b) : (a))
#define min(a,b)        ((a)>(b) ? (b) : (a))
#endif

#define HSCROLL 1           // Bit de iScrollBars pour la barre horizontale
#define VSCROLL 2           // id pour la barre verticale

typedef size_t POSITION;
#define POSMAX 60000

static char szNomClasse[] = "CUC TextEdit";
static char szNomType[]   = "TXT";
static UC   *szSelText    = NULL;   // PressePapiers

static UC   iEOFDefaut;
static UC   iEOLDefaut;
static UC   iTabDefaut;

struct CUC_TextEdit
{
  char  szType[4];          // Pour des contr“les internes (TXT)

  int   iEnabled;           // Vrai si le contr“le doit r‚agir
  int   iVisible;           // Vrai si le contr“le est affich‚
  int   iHasFocus;          // Vrai si le contr“le a le focus
						
  WINDOW *wDisp;            // Fenˆtre (curses) d'affichage du contr“le
  void  *IdBack;            // Identificateur de retour
  char  *szTag;             // Tag du contr“le
  void  *Parent;            // Pointeur sur un contr“le parent
  int   (*iRaiseEvent)(void *, int , int ); // Messages en retour

  int   iTop;               // Nø de ligne … l'‚cran, base 0
  int   iLeft;              // Nø de colonne … l'‚cran, base 0
  int   iWidth;             // Largeur du contr“le en colonnes
  int   iHeight;            // Hauteur du contr“le en lignes

  int   iTabStop;           // Arrˆt sur tabulation
  int   iTabSize;           // Valeur en nb d'espaces de la tab
  int   iAlignment;         // 0: gauche, 1: droite, 2: centr‚
  int   iMultiligne;         // si vrai, retour … la ligne possible
  int   iScrollBars;        // 0: aucune, 1: horizontale, 2: verticale, 3:
  int   iStdAttrib;         // Attribut Standard du contr“le
  int   iAutoSize;          // taille ajust‚e … szText
  int   iBorderStyle;       // 0: non encadr‚, 1: encadr‚ simple, 2: double
							// !! encadr‚ si iHeight >= 3

  UC    *szText;            // Texte du contr“le
  POSITION iLgText;         // Longueur allou‚e pour szText
  POSITION iLength;         // Longueur r‚elle du texte (=strlen)
  
  UC    *szUndo;            // Texte pr‚c‚demment effac‚
  POSITION iLgUndo;         // Longueur allou‚e pour szUndo
  POSITION iUndoPos;        // Position … laquelle on a ins‚r‚
  POSITION iUndoLength;     // Longueur ins‚r‚e

  struct CUC_VScrollBar *pVSB;  // Barre de d‚filement verticale
  struct CUC_HScrollBar *pHSB;  // Barre de d‚filement horizontale

  POSITION   iMaxLength;    // Nb car max du contr“le, 0 si infini
  int   iModeInsertion;     // Vrai en mode insertion, 0 en mode remplacement

  UC    iEOL;               // EOL Char
  UC    iEOF;               // EOF Char
  UC    iTab;               // Tab Char

  POSITION  iSelLength;     // longueur de la s‚lection

  POSITION  iPosition;      // Offset du curseur clignotant ou de fin de s‚lection
  int   iLigne, iColonne;   // Coordonn‚es du curseur ou de fin de s‚lection
  int   iModeExtension;     // Vrai aprŠs F8, faux si pas en mode extension
  
  int   iWrap;              // 0: Pas de wrap, 1: Word wrap
  int   iNbLignes;
  
  POSITION  iPositionAncrage;   // D‚but de la s‚lection
  int   iLigneAncrage;
  int   iColonneAncrage;
  
  POSITION  iPositionStart; // 1er caractŠre de la fenˆtre
  int   iLigneStart;
  int   iColonneStart;
  
  int   iLargeurAffichage;  // Largeur de la fenˆtre d'‚dition, ou + infini si pas de wrap
  int   iHauteurAffichage;  // Hauteur de la fenˆtre d'‚dition

  int   iTopOffset;         // D‚calage ‚ventuel de la 1Šre ligne (0 ou 1) selon le bord
  int   iLeftOffset;        // D‚calage ‚ventuel de la 1Šre colonne (0 ou 1) selon le bord

  int   iLCurs;             // Coordonn‚es du curseur
  int   iCCurs;
};


#define cCarCourant(pTXT)  (pTXT->szText[pTXT->iPosition])
#define iSelStart(pTXT)    (min(pTXT->iPosition, pTXT->iPositionAncrage))

static POSITION iTrouverDebutParagraphe(struct CUC_TextEdit *pTXT, POSITION p);
static POSITION XYenPosition(struct CUC_TextEdit *pTXT, int iLig, int iCol);

//====================================================================

#ifdef _DEBUG
void AfficheEtat(struct CUC_TextEdit *pTXT)
{
  move(1,57); printw("iPosition:        %5d", pTXT->iPosition);
  move(2,57); printw("iLigne:           %5d", pTXT->iLigne);
  move(3,57); printw("iColonne:         %5d", pTXT->iColonne);
  move(4,57); printw("iPositionAncrage: %5d", pTXT->iPositionAncrage);
  move(5,57); printw("iLigneAncrage:    %5d", pTXT->iLigneAncrage);
  move(6,57); printw("iColonneAncrage:  %5d", pTXT->iColonneAncrage);
  move(7,57); printw("iPositionStart:   %5d", pTXT->iPositionStart);
  move(8,57); printw("iLigneStart:      %5d", pTXT->iLigneStart);
  move(9,57); printw("iColonneStart:    %5d", pTXT->iColonneStart);
  move(10,57);printw("iSelLength:       %5d", pTXT->iSelLength);
  move(11,57);printw("iModeExtension:   %5d", pTXT->iModeExtension);
  move(12,57);printw("iModeInsertion:   %5d", pTXT->iModeInsertion);
  move(13,57);printw("iNbLignes:        %5d", pTXT->iNbLignes);
  move(14,57);printw("iMaxLength:       %5d", pTXT->iMaxLength);
  move(15,57);printw("iScrollBars:      %5d", pTXT->iScrollBars);
  move(16,57);printw("iLength:          %5d", pTXT->iLength);
  move(17,57);printw("iLCurs:           %5d", pTXT->iLCurs);
  move(18,57);printw("iCCurs:           %5d", pTXT->iCCurs);
  move(19,57);printw("iUndoPos:         %5d", pTXT->iUndoPos);
  move(20,57);printw("iUndoLength:      %5d", pTXT->iUndoLength);
}
#endif

/*====================================================================*/
// Efface completement le contr“le de l'‚cran (affiche des espaces)

static void Efface(struct CUC_TextEdit *pTXT)
{
  if (iOkWDisp(pTXT->wDisp, szNomClasse, "Efface")<0) return;
  CUC_EffaceRectangle(pTXT->wDisp, pTXT->iTop, pTXT->iLeft, pTXT->iHeight, pTXT->iWidth);
}

//====================================================================

static int iTailleCaractere(struct CUC_TextEdit *pTXT, UC c, int iCol, char **psBuffer)
{
  int TW;
  static UC sBuffer[2];

  switch(c)
  {
	case '\t':
	  TW = min(pTXT->iTabSize, pTXT->iLargeurAffichage);
	  if (psBuffer)
	  { *psBuffer = "¯                        ";
		*psBuffer[0] = pTXT->iTab ? pTXT->iTab : iTabDefaut;
	  }
	  return TW-(iCol%TW);

	case '\n':
	  if (psBuffer)
	  { sBuffer[0] = pTXT->iEOL ? pTXT->iEOL : iEOLDefaut;
		*psBuffer = sBuffer;
	  }
	  return 1;
	
	case 0:
	  if (psBuffer)
	  { sBuffer[0] = pTXT->iEOF ? pTXT->iEOF : iEOFDefaut;
		*psBuffer = sBuffer;
	  }
	  return 1;
	
	case 1: case 2: case 3: case 4: case 5:
	case 6: case 7: case 8:
	case 11: case 12: case 13: case 14: case 15:
	case 16: case 17: case 18: case 19: case 20:
	case 21: case 22: case 23: case 24: case 25:
	case 26: case 27: case 28: case 29: case 30:
	case 31:
	  if (psBuffer)
	  { sBuffer[0] = '^';
		sBuffer[1] = (char)(c+64);
		*psBuffer = sBuffer;
	  }
	  return 2;

	case 127:
	  if (psBuffer)
	  { sBuffer[0] = '^';
		sBuffer[1] = '?';
		*psBuffer = sBuffer;
	  }
	  return 2;
	
	default:
	  if (psBuffer)
	  { sBuffer[0] = c;
		*psBuffer = sBuffer;
	  }
	  return 1;
  }
}


// Retourne la largeur d'affichage d'un mot (*piLAff) et la progresion 
// en caractŠres correspondante (*pidp). 
// Le premier blanc ou \n qui suit un mot est int‚gr‚ au mot, les blancs et 
// les tabulations suivantes sont ind‚pendantes.
// Ne retourne pas de mot de largeur sup‚rieure … pTXT->LargeurAffichage.
// *bDebut est positionn‚ … vrai si le mot doit ˆtre plac‚ en d‚but de ligne 
// parce qu'il suit un \n
// *bDernier est vrai si le mot est le dernier du paragraphe
static void TailleMot(struct CUC_TextEdit *pTXT, POSITION p, int iCol, int *piLAff, POSITION *pidp, int *bDebut, int *bDernier)
{
  int iLAff;
  POSITION dp;

#if defined(_DEBUG)
  if (p>pTXT->iLength)
  { aprintf("", "p (%d) > pTXT->iLength (%d) !!!", p , pTXT->iLength);
	_asm int 3;
  }
#endif
  Assert(p<=pTXT->iLength);

  // On d‚termine si le mot est en d‚but de ligne
  *bDebut = 0;
  if (pTXT->iMultiligne)
	if (p>0 && pTXT->szText[p-1]=='\n') *bDebut = 1;

  *bDernier = 0;
  
  // Les espaces et les tabs isol‚s sont des mots … part entiŠre
  if (pTXT->szText[p]==' ' || pTXT->szText[p]=='\t' || pTXT->szText[p]=='\n')
  {
	*piLAff = iTailleCaractere(pTXT, pTXT->szText[p], iCol, NULL);
	*pidp = 1;
	if (pTXT->iMultiligne)
	  if (pTXT->szText[p]=='\n') 
		*bDernier = 1;
	return;
  }


  iLAff = 0;
  dp = 0;

  if (pTXT->szText[p]==0)
	iLAff = 1;

  while (iLAff<pTXT->iLargeurAffichage && pTXT->szText[p] && !isspace(pTXT->szText[p]))
  {
	iLAff += iTailleCaractere(pTXT, pTXT->szText[p], iCol, NULL);
	dp++;
	p++;
  }
  if ((pTXT->szText[p]==' ' || pTXT->szText[p]=='\n') && iLAff+1<=pTXT->iLargeurAffichage)
  {
	if (pTXT->iMultiligne)
	  if (pTXT->szText[p]=='\n') *bDernier = 1;
	iLAff++;
	p++;
	dp++;
  }
  
  if (pTXT->szText[p]==0) *bDernier = 1;
  *piLAff = iLAff;
  *pidp = dp;
}

//====================================================================

static void AfficheCurseur(struct CUC_TextEdit *pTXT)
{
  if (pTXT->iLCurs>=0 && pTXT->iCCurs>=0)
	wmove(pTXT->wDisp, pTXT->iTop+pTXT->iTopOffset+pTXT->iLCurs, pTXT->iLeft+pTXT->iLeftOffset+pTXT->iCCurs);
}

// Redessine le texte du contr“le
static void AfficheTexteAvecOuSansScroll(struct CUC_TextEdit *pTXT, int bOkScroll, int bAffichageForce)
{
  POSITION p, dp, pStart;
  int   iLig, iCol;
  int   iLigEcran, iColEcran;
  UC    c;          // CaractŠre point‚
  int   dc;
  int   bDebut, bDernier;
  POSITION iSelMin, iSelMax;
  int   i;          // Boucle d'affichage des tabulations
  UC    *pAff;

#define FinirAffichageLigne() { \
	int ic = iColEcran-pTXT->iColonneStart; \
	if (ic<0) ic = 0; \
	while (ic<pTXT->iLargeurAffichage) \
	  cmvwaddch(pTXT->wDisp, pTXT->iTop+pTXT->iTopOffset+iLigEcran, pTXT->iLeft+pTXT->iLeftOffset+ic++, ' ' /*250*/); \
	iLigEcran++; \
	iColEcran = 0; \
	}

	
  if (bOkScroll)
  {
	if (pTXT->iWrap==0)       // Scroll horizontal
	{
	  int iOldStart = pTXT->iColonneStart;

	  while (pTXT->iColonne >= pTXT->iColonneStart+pTXT->iLargeurAffichage)
	  { pTXT->iColonneStart += pTXT->iLargeurAffichage/3;
		bAffichageForce = 1;
	  }
	  while (pTXT->iColonne < pTXT->iColonneStart)
	  { pTXT->iColonneStart -= pTXT->iLargeurAffichage/3;
		bAffichageForce = 1;
	  }
	  if (pTXT->iColonneStart<0) pTXT->iColonneStart = 0;

	  if (iOldStart!=pTXT->iColonneStart)
	  {

		// On synchronise l'ascenseur horizontal
		if ((pTXT->iScrollBars&HSCROLL) && pTXT->pHSB!=NULL)
		{ 
		  if (pTXT->iMultiligne)
		  {
			CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_MIN, 0);
			CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_MAX, 100);
			CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_VALUE, (pTXT->iColonne>100) ? 100 : pTXT->iColonne);
		  }
		  else
		  { 
			CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_MAX, pTXT->iLength);
			CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_VALUE, pTXT->iPosition);
		  }
		}
	  }
	}

	if (pTXT->iMultiligne)    // Scroll vertical
	{
	  int iOldStart = pTXT->iLigneStart;

	  while (pTXT->iLigne >= pTXT->iLigneStart+pTXT->iHauteurAffichage)
	  { pTXT->iLigneStart += pTXT->iHauteurAffichage/3;
		bAffichageForce = 1;
	  }
	  while (pTXT->iLigne < pTXT->iLigneStart)
	  { pTXT->iLigneStart -= pTXT->iHauteurAffichage/3;
		bAffichageForce = 1;
	  }
	  if (pTXT->iLigneStart<0) pTXT->iLigneStart = 0;

	  if (iOldStart!=pTXT->iLigneStart)
	  {
		pTXT->iPositionStart = XYenPosition(pTXT, pTXT->iLigneStart, pTXT->iColonneStart);

		// On synchronise l'ascenseur vertical
		if ((pTXT->iScrollBars&VSCROLL) && pTXT->pVSB!=NULL)
		{ CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_MAX, pTXT->iNbLignes-1);
		  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_VALUE, pTXT->iLigne);
		}
	  }
	}
  }


  // Optimisation: tant qu'on n'a pas demand‚ explicitement un r‚affichage
  // et qu'il n'y a pas eu de scroll, on ne fait que positionner le curseur !
  if (!bAffichageForce)
  {
	pTXT->iLCurs = pTXT->iLigne - pTXT->iLigneStart;
	pTXT->iCCurs = pTXT->iColonne - pTXT->iColonneStart;

	AfficheCurseur(pTXT);
	return;
  }
  
  pTXT->iLCurs = -1;        // Coordonn‚es du curseur. RAZ pour v‚rifier
  pTXT->iCCurs = -1;        // que l'affichage est correct

  iSelMin = min(pTXT->iPosition, pTXT->iPositionAncrage);
  iSelMax = max(pTXT->iPosition, pTXT->iPositionAncrage);

  p = pTXT->iPositionStart;
  pStart = pTXT->iPositionStart;
  iLig = pTXT->iLigneStart;
  iCol = pTXT->iColonneStart;
  iLigEcran = 0;
  iColEcran = 0;

  wattron(pTXT->wDisp, pTXT->iStdAttrib);

  for(;;)
  {
	int bFin = 0;

	TailleMot(pTXT, p, iColEcran, &dc, &dp, &bDebut, &bDernier);
	if ((bDebut && p!=pStart) || (pTXT->iWrap && iColEcran+dc>pTXT->iLargeurAffichage))
	{ FinirAffichageLigne();
	  if (iLigEcran>=pTXT->iHauteurAffichage) break;
	  if (pTXT->szText[p]=='\t')
		TailleMot(pTXT, p, iColEcran, &dc, &dp, &bDebut, &bDernier);
	}
	if (pTXT->szText[p]==0) 
	{ dp=1;
	  bFin = 1;
	}
	
	// Affichage d'un mot
	while (dp>0)                    
	{                               
	  if (p==pTXT->iPosition)       
	  { pTXT->iLCurs = iLigEcran;
		pTXT->iCCurs = iColEcran-pTXT->iColonneStart;   
	  }                             
	  c = pTXT->szText[p];     
	  if (c)
	  {                                     
		if (pTXT->iHasFocus)                
		  if (p>=iSelMin && p<iSelMax)        
			wattron(pTXT->wDisp, A_REVERSE);  
		  else                                
			wattroff(pTXT->wDisp, A_REVERSE); 
	  }
	  dc = iTailleCaractere(pTXT, c, iColEcran, &pAff);
	  for (i=0 ; i<dc ; i++)
	  {
		if (iColEcran>=pTXT->iColonneStart && iColEcran<pTXT->iColonneStart+pTXT->iLargeurAffichage)
		  cmvwaddch(pTXT->wDisp, pTXT->iTop+pTXT->iTopOffset+iLigEcran, pTXT->iLeft+pTXT->iLeftOffset-pTXT->iColonneStart+iColEcran, pAff[i]);
		iColEcran++; 
	  }
	  if (c) p++;  
	  dp--;        
	}


	if (bFin) break;
  }

  // Le curseur n'est pas positionn‚, problŠme !
  if (pTXT->iLCurs<0)
  { aprintf("", "Echec au scroll vertical");
#if defined(_DEBUG)
	_asm int 3;
#endif
  }
  
  while (iLigEcran<pTXT->iHauteurAffichage)
	FinirAffichageLigne();

  wattroff(pTXT->wDisp, A_REVERSE);
  wattroff(pTXT->wDisp, pTXT->iStdAttrib);

  AfficheCurseur(pTXT);
}

static void AfficheTexte(struct CUC_TextEdit *pTXT, int bAffichageForce)
{
  AfficheTexteAvecOuSansScroll(pTXT, 1, bAffichageForce);
}

/*====================================================================*/
// Redessine complŠtement le contr“le
static void Affiche(struct CUC_TextEdit *pTXT)
{
  int i;

  if (iOkWDisp(pTXT->wDisp, szNomClasse, "Affiche")<0) return;
  
  if (!pTXT->iEnabled) wattron(pTXT->wDisp, DIMINUE);

  if(pTXT->iHeight>1 && pTXT->iWidth>1 && pTXT->iBorderStyle)
  { // On affiche un cadre
	UC *pszG;

	pszG = pTXT->iBorderStyle==1?szBoxs:szBoxd;
	// Partie haute
	cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft, pszG[0]);
	for (i=1; i<=pTXT->iWidth-2 ; i++ )
	  cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft+i, pszG[1]);
	cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft+pTXT->iWidth-1, pszG[2]);

	// ScrollBars 0: aucune, 1: horizontale, 2: verticale, 3: double
	// Bord gauche
	for (i=1 ; i<pTXT->iHeight ; i++)
	  cmvwaddch(pTXT->wDisp, pTXT->iTop+i, pTXT->iLeft, pszG[3]);

	// Bord droit
	if(pTXT->iBorderStyle && !(pTXT->iScrollBars & VSCROLL) || pTXT->iHeight<=4)
	  for (i=1 ; i<pTXT->iHeight ; i++)
		cmvwaddch(pTXT->wDisp, pTXT->iTop+i, pTXT->iLeft+pTXT->iWidth-1, pszG[4]);

	// Partie basse
	cmvwaddch(pTXT->wDisp, pTXT->iTop+pTXT->iHeight-1, pTXT->iLeft, pszG[5]);
	if(pTXT->iBorderStyle && !(pTXT->iScrollBars & HSCROLL) || pTXT->iWidth<=4)
	  for (i=1; i<=pTXT->iWidth-2 ; i++ )
		cmvwaddch(pTXT->wDisp, pTXT->iTop+pTXT->iHeight-1, pTXT->iLeft+i, pszG[6]);

	cmvwaddch(pTXT->wDisp, pTXT->iTop+pTXT->iHeight-1, pTXT->iLeft+pTXT->iWidth-1, pszG[7]);
  }
  else if(pTXT->iBorderStyle==1)
  {
	cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft, '[');
	cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft+pTXT->iWidth-1, ']');
  }
  else if(pTXT->iBorderStyle==2)
  {
	cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft, '<');
	cmvwaddch(pTXT->wDisp, pTXT->iTop, pTXT->iLeft+pTXT->iWidth-1, '>');
  }

  // Barres de d‚filement
  if (pTXT->pHSB)
	CUC_HScrollBarRefresh(pTXT->pHSB);
  if (pTXT->pVSB)
	CUC_VScrollBarRefresh(pTXT->pVSB);

  AfficheTexte(pTXT, 1);
  if (!pTXT->iEnabled) wattroff(pTXT->wDisp, DIMINUE);
}


//====================================================================
// Met … jour les variables internes de suivi de la zone d'affichage 
// aprŠs changement d'une propri‚t‚ entrainant la modification d'une
// de ces valeurs

static void MajTailleAffichage(struct CUC_TextEdit *pTXT)
{
  pTXT->iLargeurAffichage = pTXT->iBorderStyle ? pTXT->iWidth-2 : pTXT->iWidth;
  if (pTXT->iBorderStyle && pTXT->iHeight>2)
  {
	pTXT->iHauteurAffichage = pTXT->iHeight-2; 
	pTXT->iTopOffset = 1;
  }
  else
  {
	pTXT->iHauteurAffichage = pTXT->iHeight;
	pTXT->iTopOffset = 0;
  }

  if (pTXT->iBorderStyle)
	pTXT->iLeftOffset = 1;
  else
	pTXT->iLeftOffset = 0;
}

//====================================================================
// Cr‚ation du contr“le TextEdit

struct CUC_TextEdit *CUC_TextEditCreate(WINDOW *w, int (*iRaiseEvent)(void *, int , int ))
{
  struct CUC_TextEdit *pTXT;

  pTXT = (struct CUC_TextEdit *)malloc(sizeof(struct CUC_TextEdit));

  if (pTXT==NULL)
  { aprintf("CUC: CUC_TextEditCreate", "Echec au malloc (structure)");
	return NULL;
  }

  // Pour ‚viter de trop morceler la m‚moire, on alloue forfaitairement 64 octets...
  pTXT->iLgText = 64;           // Forfait … la cr‚ation
  pTXT->szText = malloc(64);
  if (pTXT->szText==NULL)
  { aprintf("CUC: CUC_TextEditCreate", "Echec au malloc (texte)");
	free(pTXT);
	return NULL;
  }
  pTXT->iLength = 0;
  pTXT->szText[0] = 0;

  /* Initialisation avec des valeurs quelconques mais plausibles
  ** Ces valeurs ne sont pas sp‚cifi‚es dans le cahier des charges
  ** Un programme NE DOIT PAS en tenir compte
  */
  pTXT->wDisp = w;
  pTXT->iRaiseEvent = iRaiseEvent;
  pTXT->IdBack = pTXT;
  pTXT->iHasFocus = 0;
  pTXT->iTop = 0;
  pTXT->iLeft = 0;
  pTXT->iWidth = 10;
  pTXT->iHeight = 2;
  pTXT->szTag = NULL;
  pTXT->iEnabled = 1;
  pTXT->iVisible = 0;           // Cr‚‚ invisible
  pTXT->Parent = NULL;
  pTXT->iTabStop = 1;
  strcpy(pTXT->szType, szNomType);  // Choix conventionnel
  pTXT->iAlignment = 0;
  pTXT->iMultiligne = 0;
  pTXT->iScrollBars = 0;
  pTXT->iAutoSize = 0;
  pTXT->iBorderStyle = 0;
  pTXT->iStdAttrib = 0;
  pTXT->iTabSize = 4;
  pTXT->iSelLength = 0;
  pTXT->iModeInsertion = 1;
  pTXT->iModeExtension = 1;
  pTXT->iMaxLength = 0;         // Longueur infinie
  pTXT->iNbLignes = 1;
  
  pTXT->szUndo = NULL;
  pTXT->iLgUndo = 0;
  pTXT->iUndoPos = 0;
  pTXT->iUndoLength = 0;

  MajTailleAffichage(pTXT);

  pTXT->iEOF = 0;
  pTXT->iEOL = 0;
  pTXT->iTab = 0;

  if (strncmp(ttytype, "ansi", 4)==0)
  { iEOFDefaut = 247; iEOLDefaut = 254; iTabDefaut = 175; }
  else
  { iEOFDefaut = 176+32+12; iEOLDefaut = 182; iTabDefaut = 175; }

  pTXT->iPosition = 0;
  pTXT->iLigne = 0;
  pTXT->iColonne = 0;

  pTXT->iPositionAncrage = 0;
  pTXT->iLigneAncrage = 0;
  pTXT->iColonneAncrage = 0;

  pTXT->iPositionStart = 0;
  pTXT->iLigneStart = 0;
  pTXT->iColonneStart = 0;
  
  MajTailleAffichage(pTXT);

  pTXT->pHSB = NULL;
  pTXT->pVSB = NULL;

  return pTXT;
}

/*====================================================================*/
// Destruction du contr“le TextEdit

void CUC_TextEditDestruct(struct CUC_TextEdit *pTXT)
{
  if (iCtrlType(pTXT, "CUC_TextEditDestruct", szNomType)<0)
	return;
	
  // On d‚truit les ScrollBars...
  if(pTXT->pHSB!=NULL) CUC_HScrollBarDestruct(pTXT->pHSB);
  if(pTXT->pVSB!=NULL) CUC_VScrollBarDestruct(pTXT->pVSB);

  if (pTXT->szTag!=NULL) free(pTXT->szTag);     // On d‚truit le tag...
  if (pTXT->szText!=NULL) free(pTXT->szText);   // puis le texte...
  if (pTXT->szUndo!=NULL) free(pTXT->szUndo);   // le buffer d'annulation...
  pTXT->szType[0] = 0;                          // (s‚curit‚)
  free((void *)pTXT);                           // puis la structure
}

/*====================================================================*/
// AprŠs une modification de largeur, hauteur ou de propri‚t‚
// scrollbars, met … jour les barres de d‚filemen
// 
static void DoScrollBars(struct CUC_TextEdit *pTXT)
{

  if(pTXT->iScrollBars & HSCROLL)
	if(pTXT->iWidth>4 && pTXT->iHeight>1)
	{
	  if (pTXT->pHSB==NULL)
	  {
		pTXT->pHSB = CUC_HScrollBarCreate(pTXT->wDisp, NULL);  
		CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_MIN, 0);
		CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_MAX, 1);
		CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_SMALLCHANGE, 1);
		CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_VALUE, 0);
		CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_CSIZE, 1);
		CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_ENABLED, TRUE);
	  }
	  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_LEFT, pTXT->iLeft+1);
	  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_TOP, pTXT->iTop+pTXT->iHeight-1);
	  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_HEIGHT, 1);
	  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_WIDTH, pTXT->iWidth-2);
	  CUC_HScrollBarSetPropPtr(pTXT->pHSB, CUCP_WDISP, pTXT->wDisp);
	  CUC_HScrollBarSetPropNum(pTXT->pHSB, CUCP_VISIBLE, pTXT->iVisible);
	}
	else
	{
	  if (pTXT->pHSB!=NULL)
	  {
		CUC_HScrollBarDestruct(pTXT->pHSB);
		pTXT->pHSB = NULL;
	  }
	}
  else
  {
	if (pTXT->pHSB!=NULL)
	{
	  CUC_HScrollBarDestruct(pTXT->pHSB);
	  pTXT->pHSB = NULL;
	}
  }

  
  if(pTXT->iScrollBars & VSCROLL)
	if(pTXT->iWidth>1 && pTXT->iHeight>4)
	{
	  if (pTXT->pVSB==NULL)
	  {
		pTXT->pVSB = CUC_VScrollBarCreate(pTXT->wDisp, NULL);
		CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_MIN, 0);
		CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_MAX, 1);
		CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_SMALLCHANGE, 1);
		CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_VALUE, 0);
		CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_CSIZE, 1);
		CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_ENABLED, TRUE);
	  }
	  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_LEFT, pTXT->iLeft+pTXT->iWidth-1);
	  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_TOP, pTXT->iTop+1);
	  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_WIDTH, 1);
	  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_HEIGHT, pTXT->iHeight-2);
	  CUC_VScrollBarSetPropPtr(pTXT->pVSB, CUCP_WDISP, pTXT->wDisp);
	  CUC_VScrollBarSetPropNum(pTXT->pVSB, CUCP_VISIBLE, pTXT->iVisible);
	}
	else
	{
	  if (pTXT->pVSB!=NULL)
	  {
		CUC_VScrollBarDestruct(pTXT->pVSB);
		pTXT->pVSB = NULL;
	  }
	}
  else
  {
	if (pTXT->pVSB!=NULL)
	{
	  CUC_VScrollBarDestruct(pTXT->pVSB);
	  pTXT->pVSB = NULL;
	}
  }
}

/*====================================================================*/
// Routines g‚n‚rales de manipulation 



// Retourne le d‚but du paragraphe … partir d'une position quelconque
// … l'int‚rieur du paragraphe
static POSITION iTrouverDebutParagraphe(struct CUC_TextEdit *pTXT, POSITION p)
{ 
#ifdef _DEBUG
  int iMedor = 0;
#endif

  if (p==0) return p;
  Assert(p<=pTXT->iLength);
  
  for(;;)
  {
	if (p>0) p--;
	if (pTXT->szText[p]=='\n')
	  return p+1;
	if (p==0) return p;

#ifdef _DEBUG
#if defined(_DEBUG)
	if (p>=60000) 
	  _asm int 3;
#endif
	Assert(iMedor++<200);
#endif
  }
}


			 
// Retourne la position du d‚but du paragraphe suivant, ou 0 si p
// est dans le dernier paragraphe
static POSITION iParagrapheSuivant(struct CUC_TextEdit *pTXT, POSITION p)
{
  while (pTXT->szText[p]!='\n' && pTXT->szText[p]!=0)
	p++;
								   
  if (pTXT->szText[p]=='\n')
	return p+1;
  else
	return 0;
}




// Calcule le nombre de lignes occup‚es par un paragraphe
static int iNbDeLignes1Paragraphe(struct CUC_TextEdit *pTXT, POSITION p)
{
  POSITION dp;
  int col, nbl, dc;
  int bDebut, bDernier;
  
  if (pTXT->iWrap==0) return 1;

  p = iTrouverDebutParagraphe(pTXT, p);
  nbl = 1;
  col = 0;
  while (pTXT->szText[p])
  {
	TailleMot(pTXT, p, col, &dc, &dp, &bDebut, &bDernier);
	if (col+dc>pTXT->iLargeurAffichage)
	{ nbl++;
	  col = 0;
	  if (pTXT->szText[p]=='\t')
		TailleMot(pTXT, p, col, &dc, &dp, &bDebut, &bDernier);
	}
	col += dc;
	p += dp;
	if (bDernier) break;
  }
  return nbl;
}




// Retourne la position correpondant … la position Ligne, Colonne pass‚e
// en paramŠtre
static POSITION XYenPosition(struct CUC_TextEdit *pTXT, int iLig, int iCol)
{
  POSITION p;
  int l, c;
#ifdef _DEBUG
  int iMedor = 0;
#endif
  
  if (iLig>=pTXT->iNbLignes)
	iLig = pTXT->iNbLignes-1;
  l = c = 0;
  p = 0;

  for(;;)
  {
	int dc, dp;
	int bDebut, bDernier;

#ifdef _DEBUG
	Assert(iMedor++<1000);
#endif
	if (pTXT->szText[p]==0)
	  return p;
	TailleMot(pTXT, p, c, &dc, &dp, &bDebut, &bDernier);
	if (bDebut || (pTXT->iWrap && c+dc>pTXT->iLargeurAffichage))
	{
	  if (l==iLig) return p-1;
	  c = 0;
	  l++;
	  if (pTXT->szText[p]=='\t')
		TailleMot(pTXT, p, c, &dc, &dp, &bDebut, &bDernier);
	}

	if (l==iLig && c+dc>iCol)
	{
	  // La position est … l'int‚rieur du mot !
	  // return p+iCol-c;
	  int i;

	  for (i=0 ; i<dp ; i++)
	  {
		dc = iTailleCaractere(pTXT, pTXT->szText[p], c, NULL);
		if (c+dc>iCol) return p;
		c += dc;
		if (pTXT->szText[p]) p++;
	  }
	  return p;
	}

	c += dc;
	p += dp;
	if (l==iLig && bDernier)
	{ if (pTXT->szText[p-1]=='\n')
		return p-1;
	  else
		return p;
	}
  }
}



// Calcule la ligne et la colonne correspondant … iPosition
static void PositionEnXY(struct CUC_TextEdit *pTXT, POSITION *pPos, int *piLig, int *piCol)
{
  POSITION p;
  POSITION pMax = pTXT->iLength;
  int   lig, col;
#ifdef _DEBUG
  int   iMedor = 0;
#endif

  if (*pPos>pMax) *pPos = pMax;
  lig = col = 0;
  p = 0;
  if (*pPos==p)
  {
	*piLig = lig;
	*piCol = col;
	return;
  }
  
  for(;;)
  {
	int dc, dp;
	int bDebut, bDernier;

#ifdef _DEBUG
	Assert(iMedor++<1000);
#endif
	TailleMot(pTXT, p, col, &dc, &dp, &bDebut, &bDernier);
	if (bDebut || (pTXT->iWrap && col+dc>pTXT->iLargeurAffichage))
	{ col = 0;
	  lig++;
	  if (pTXT->szText[p]=='\t')
		TailleMot(pTXT, p, col, &dc, &dp, &bDebut, &bDernier);
	}
	if (pTXT->szText[p]==0) break;
	if (p+dp>*pPos) break;
	col += dc;
	p += dp;
  }
  
  // La position cherch‚e est dans le mot
  while (p<*pPos && pTXT->szText[p])
  {
	int tc;
	tc = iTailleCaractere(pTXT, pTXT->szText[p], col, NULL);
if (pTXT->szText[p]=='\t')
aprintf("$1", "col:%d  tc:%d|", col, tc);
	col += tc;
	p++;
#ifdef _DEBUG
	Assert(iMedor++<1000);
#endif
  }
  
  *piLig = lig;
  *piCol = col;
}



void CalculeLC(struct CUC_TextEdit *pTXT)
{
  POSITION p;
  int iLig, iCol;

  p = pTXT->iPosition;
  PositionEnXY(pTXT, &p, &iLig, &iCol);
  pTXT->iPosition = p;
  pTXT->iLigne = iLig;
  pTXT->iColonne = iCol;
}


void Special(struct CUC_TextEdit *pTXT)
{
  POSITION p, pMax, dp, pd;
  int   col, dc;
  int   bDebut, bDernier;
  int   iLig, iCol;

  printf("\r\np    c  dc  dp  d  f x  y  dp  nbl\r\n"
			 "---  -  --  --  -  - -- -- --- ---\r\n");
  pMax = pTXT->iLength;
  col = 0;
  for (p=0 ; p<=pMax ; p++)
  {
	UC c = pTXT->szText[p];
	if (c<32) c='.';

	TailleMot(pTXT, p, col, &dc, &dp, &bDebut, &bDernier);
	PositionEnXY(pTXT, &p, &iLig, &iCol);
	pd = iTrouverDebutParagraphe(pTXT, p);

	printf("%3d  %c  %2d  %2d  %1d  %1d %2d %2d %3d ",
	  p, c, dc, dp, bDebut, bDernier, iLig, iCol, pd);

	if (bDebut || p==0)
	{ int dl = iNbDeLignes1Paragraphe(pTXT, p);
	  printf("%3d", dl);
	}
	printf("\r\n");
  }
}


// Compte le nombre de lignes au total dans tous les paragraphes compris
// entre les position pDebut et pFin.
// Ces deux paragraphes sont compris dans leur int‚gralit‚.

static int iNbDeLignes(struct CUC_TextEdit *pTXT, POSITION pDebut, POSITION pFin)
{
  int nb;
  
  if (pDebut>pFin)
  { POSITION pTmp = pDebut;
	pDebut = pFin;
	pFin = pTmp;
  }
  
  pDebut = iTrouverDebutParagraphe(pTXT, pDebut);
  pFin = iTrouverDebutParagraphe(pTXT, pFin);
  nb = 0;
  for(;;)
  { nb += iNbDeLignes1Paragraphe(pTXT, pDebut);
	if (pDebut==pFin) break;
	pDebut = iParagrapheSuivant(pTXT, pDebut);
	Assert(pDebut!=0);
  }
  return nb;      
}



static void MemoriseUndo(struct CUC_TextEdit *pTXT, POSITION iPos)
{
  if (pTXT->iSelLength!=0)
  {
	if (pTXT->iSelLength+1 > pTXT->iLgUndo)
	{
	  POSITION lMem = pTXT->iSelLength+10;
	  UC *p;
			
	  if (pTXT->szUndo==NULL)
		p = malloc(lMem);
	  else
		p = realloc(pTXT->szUndo, lMem);
	  if (p!=NULL)
	  { pTXT->szUndo = p;
		pTXT->iLgUndo = lMem;
	  }
	}
  }
  if (pTXT->szUndo!=NULL)
    strncpy2(pTXT->szUndo, pTXT->szText+iPos, min(pTXT->iLgUndo, pTXT->iSelLength+1));
}



// Efface la s‚lection du contr“le, genere l'evenement Change
static void EffaceSelection(struct CUC_TextEdit *pTXT)
{
  POSITION iDebut;
  int n1, n2;

  iDebut = min(pTXT->iPosition, pTXT->iPositionAncrage);
  
  // On m‚morise le texte s‚lectionn‚ pour l'annulation
  MemoriseUndo(pTXT, iDebut);
  pTXT->iUndoPos = iDebut;
  pTXT->iUndoLength = 0;


  n1 = iNbDeLignes(pTXT, pTXT->iPosition, pTXT->iPositionAncrage);
  strdelnc(pTXT->szText+iDebut, pTXT->iSelLength);
  pTXT->iLength -= pTXT->iSelLength;
  n2 = iNbDeLignes(pTXT, iDebut, iDebut);
  pTXT->iNbLignes = pTXT->iNbLignes-n1+n2;
  
  pTXT->iPosition = iDebut;
  CalculeLC(pTXT);

  pTXT->iSelLength = 0;
  pTXT->iPositionAncrage = pTXT->iPosition;
  pTXT->iLigneAncrage = pTXT->iLigne;
  pTXT->iColonneAncrage = pTXT->iColonne;
  
  if (pTXT->iEnabled)
	if (pTXT->iRaiseEvent != NULL)
	  pTXT->iRaiseEvent(pTXT->IdBack, CUCE_CHANGE, 0);
}


// GŠre l'allocation m‚moire pour le contr“le pour stocker t octets
int bOkAlloc(struct CUC_TextEdit *pTXT, size_t t)
{
  if (t>pTXT->iLgText)
  {
	char *np;

	t += 64;    // Pour ‚viter d'allouer 1 octet … la fois !
	np = realloc(pTXT->szText, t);
	if (np==NULL)
	{ aprintf(szNomClasse, "|Echec au realloc (%u) !|", t);
	  return 0;
	}

	pTXT->szText = np;
	pTXT->iLgText = t;
  }
  return 1;
}




// InsŠre un texte "normal" dans le buffer … la position courante
// La s‚lection est effac‚e. GŠre la m‚moire, genere l'evenement change
static int bInsererTexte(struct CUC_TextEdit *pTXT, const UC *pTexteInsere)
{
  POSITION  iInsertion;
  int       n1, n2;
  size_t    lApres, lIns;

  // Taille du nouveau texte aprŠs l'insertion
  lIns = strlen(pTexteInsere);
  lApres = pTXT->iLength - pTXT->iSelLength + lIns;

  if (pTXT->iMaxLength && lApres>pTXT->iMaxLength)
	return 0;
  if (!bOkAlloc(pTXT, lApres+1)) return 0;
																	 
  // On calcule la position d'insertion
  iInsertion = min(pTXT->iPosition, pTXT->iPositionAncrage);

  // On m‚morise le texte s‚lectionn‚ pour l'annulation
  MemoriseUndo(pTXT, iInsertion);
  pTXT->iUndoPos = iInsertion;
  pTXT->iUndoLength = lIns;

  n1 = iNbDeLignes(pTXT, pTXT->iPosition, pTXT->iPositionAncrage);
  strdelnc(pTXT->szText+iInsertion, pTXT->iSelLength);
  strinsnc(pTXT->szText+iInsertion, lIns);
  strncpy(pTXT->szText+iInsertion, pTexteInsere, strlen(pTexteInsere));
  pTXT->iLength = lApres;
  pTXT->iPosition = iInsertion+lIns;
  n2 = iNbDeLignes(pTXT, iInsertion, pTXT->iPosition);
  pTXT->iNbLignes = pTXT->iNbLignes-n1+n2;
  CalculeLC(pTXT);
  pTXT->iSelLength = 0;
  pTXT->iPositionAncrage = pTXT->iPosition;
  pTXT->iLigneAncrage = pTXT->iLigne;
  pTXT->iColonneAncrage = pTXT->iColonne;
  
  
  if (pTXT->iEnabled)
	if (pTXT->iRaiseEvent != NULL)
	  pTXT->iRaiseEvent(pTXT->IdBack, CUCE_CHANGE, 0);

  return 1;
}


// AprŠs un changement "important" tel que le changement du wrap,
// ou le positionnement de la propri‚t‚ TEXT ou la largeur, aligne
// position/s‚l‚ction/ancrage sur 0, et recalcule le nombre de lignes
static void RAZ(struct CUC_TextEdit *pTXT)
{
  pTXT->iLargeurAffichage = pTXT->iBorderStyle ? pTXT->iWidth-2 : pTXT->iWidth;

  pTXT->iSelLength = 0;
  pTXT->iModeExtension = 0;
	  
  pTXT->iPosition = 0;
  pTXT->iLigne = 0;
  pTXT->iColonne = 0;
  
  pTXT->iPositionAncrage = 0;
  pTXT->iLigneAncrage = 0;
  pTXT->iColonneAncrage = 0;

  pTXT->iPositionStart = 0;
  pTXT->iLigneStart = 0;
  pTXT->iColonneStart = 0;

  pTXT->iNbLignes = iNbDeLignes(pTXT, 0, pTXT->iLength);
}

/*====================================================================*/
// Positionnement d'une propri‚t‚ num‚rique

int CUC_TextEditSetPropNum(struct CUC_TextEdit *pTXT, int iProp, int iArg)
{
  static char _f_[] = "CUC_TextEditSetPropNum";
  size_t uArg;

  if (iCtrlType(pTXT, _f_, szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_LEFT:
	  if (pTXT->iLeft!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 79)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		  pTXT->iLeft = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
	  }
	  break;

	case CUCP_TOP:
	  if (pTXT->iTop!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		  pTXT->iTop = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
	  }
	  break;

	case CUCP_WIDTH:
	  if(pTXT->iAutoSize) return -1;
	  if (pTXT->iWidth!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 80)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iWidth = iArg;
		DoScrollBars(pTXT);
		RAZ(pTXT);
		if (pTXT->iVisible) Affiche(pTXT);
	  }
	  break;

	case CUCP_HEIGHT:
	  if(pTXT->iAutoSize) return -1;
	  if (pTXT->iHeight!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 25)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iHeight = iArg;
		MajTailleAffichage(pTXT);
		DoScrollBars(pTXT);
		if (pTXT->iVisible) Affiche(pTXT);
	  }
	  break;

	case CUCP_ALIGNMENT:
	  if (pTXT->iAlignment!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 2)<0)
		  return -1;
		pTXT->iAlignment = iArg;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);
	  }
	  break;

	case CUCP_MULTILINE:
	  if (pTXT->iMultiligne!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iMultiligne = iArg;
		if ((pTXT->iScrollBars&HSCROLL)==0 && pTXT->iMultiligne)
		  pTXT->iWrap = 1;  // Word wrap si multiligne et pas de barre de d‚filement horizontale
		else
		  pTXT->iWrap = 0;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);
	  }
	  break;

	case CUCP_SCROLLBARS:
	  if (pTXT->iScrollBars!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 3)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		// ScrollBars 0: aucune, 1: horizontale, 2: verticale, 3: double
		pTXT->iScrollBars = iArg;
		DoScrollBars(pTXT);
		if ((pTXT->iScrollBars&HSCROLL)==0 && pTXT->iMultiligne)
		  pTXT->iWrap = 1;  // Word wrap si multiligne et pas de barre de d‚filement horizontale
		else
		  pTXT->iWrap = 0;
		RAZ(pTXT);
		if (pTXT->iVisible) Affiche(pTXT);
	  }
	  break;

// Propri‚t‚ non trait‚e pour l'instant
	case CUCP_AUTOSIZE:
	  ErrPropNonGeree(szNomClasse, _f_, iProp);
	  break;

	case CUCP_BORDERSTYLE:
	  if (pTXT->iBorderStyle!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 2)<0)
		  return -1;
		if (pTXT->iVisible) Efface(pTXT);
		pTXT->iBorderStyle = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
		MajTailleAffichage(pTXT);
	  }
	  break;

	case CUCP_STDATTRIB:
	  if (pTXT->iStdAttrib!=iArg)
	  { 
		pTXT->iStdAttrib = iArg;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);
	  }
	  break;

	case CUCP_SELSTART:
	  {
		POSITION iOldPosition = pTXT->iPosition;

		pTXT->iModeExtension = 0;
		uArg = (size_t)iArg;
		pTXT->iPosition = uArg;
		CalculeLC(pTXT);
		pTXT->iPositionAncrage = pTXT->iPosition;
		pTXT->iLigneAncrage = pTXT->iLigne;
		pTXT->iColonneAncrage = pTXT->iColonne;
		pTXT->iSelLength = 0;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);

		if (pTXT->iPosition!=iOldPosition)
		  if (pTXT->iRaiseEvent != NULL)
			pTXT->iRaiseEvent(pTXT->IdBack, CUCE_SELCHANGE, 0);
	  }
	  break;
	  
	case CUCP_SELLENGTH:
	  {
		size_t iStart = min(pTXT->iPosition, pTXT->iPositionAncrage);
		size_t lMax = pTXT->iLength-iStart;
		size_t uArg = (size_t)iArg;

		if (uArg>lMax) uArg=lMax;
		if (pTXT->iSelLength!=uArg)
		{ pTXT->iSelLength = uArg;
		  pTXT->iPosition = pTXT->iPosition+uArg;
		  CalculeLC(pTXT);
		  if (pTXT->iVisible) AfficheTexte(pTXT, 1);
		}
	  }
	  break;

	case CUCP_INSMODE:
	  if (pTXT->iModeInsertion!=iArg)
	  { 
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, 1)<0)
		  return -1;
		pTXT->iModeInsertion = iArg;
	  }
	  break;

	case CUCP_MAXLENGTH:
	  pTXT->iMaxLength = (POSITION) iArg;
	  break;

	case CUCP_TABSIZE:
	  if (pTXT->iTabSize!=iArg)
	  {
		pTXT->iTabSize = iArg;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);
	  }
	  break;

	case CUCP_VISIBLE:
	  if (pTXT->iVisible!=iArg)
	  {
		pTXT->iVisible = iArg;
		if (pTXT->iVisible)
		  Affiche(pTXT);
		else
		  Efface(pTXT);
		DoScrollBars(pTXT);
	  }
	  break;

	case CUCP_ENABLED:
	  if (pTXT->iEnabled!=iArg)
	  {
		pTXT->iEnabled = iArg;
		if (pTXT->iVisible) Affiche(pTXT);
	  }
	  break;

	case CUCP_EOLCHAR:
	  if (pTXT->iEOL!=(UC)iArg)
	  { pTXT->iEOL = (UC)iArg;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);
	  }
	  break;

	case CUCP_EOFCHAR:
	  if (pTXT->iEOF!=(UC)iArg)
	  { pTXT->iEOF = (UC)iArg;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);
	  }
	  break;

	case CUCP_TABCHAR:
	  if (pTXT->iTab!=(UC)iArg)
	  { pTXT->iTab = (UC)iArg;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);
	  }
	  break;

	case CUCP_PARENT:
	  pTXT->Parent = (void *)iArg;
	  break;

	case CUCP_TABSTOP:
	  pTXT->iTabStop = iArg;
	  break;

	case CUCP_LINE:
	  if (iArg!=pTXT->iLigne)
	  {
		POSITION iOldPosition = pTXT->iPosition;

		if (iArg>=pTXT->iNbLignes) iArg = pTXT->iNbLignes-1;
		pTXT->iLigne = iArg;
		pTXT->iColonne = 0;
		pTXT->iPosition = XYenPosition(pTXT, pTXT->iLigne, pTXT->iColonne);

		pTXT->iModeExtension = 0;
		pTXT->iSelLength = 0;
		pTXT->iPositionAncrage = pTXT->iPosition;
		pTXT->iLigneAncrage = pTXT->iLigne;
		pTXT->iColonneAncrage = pTXT->iColonne;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);

		if (pTXT->iPosition!=iOldPosition)
		  if (pTXT->iRaiseEvent != NULL)
			pTXT->iRaiseEvent(pTXT->IdBack, CUCE_SELCHANGE, 0);
	  }
	  break;
	  
	case CUCP_STARTLINE:
	  if (iArg!=pTXT->iLigneStart)
	  {
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, pTXT->iNbLignes-1)<0)
		  return -1;
		pTXT->iLigneStart = iArg;
		// On r‚affiche sans scroll
		if (pTXT->iVisible) AfficheTexteAvecOuSansScroll(pTXT, 0, 1);
	  }
	  break;

	case CUCP_STARTCOLUMN:
	  if (iArg!=pTXT->iColonneStart)
	  {
		int iMax;
		if ((pTXT->iMultiligne && (pTXT->iScrollBars&HSCROLL)!=0) || pTXT->iMultiligne==0)
		  iMax = INFINI;
		else
		  iMax = 0;
		if (iCtrlBornes(szNomClasse, iProp, iArg, 0, iMax)<0)
		  return -1;
		pTXT->iColonneStart = iArg;
		// On r‚affiche sans scroll
		if (pTXT->iVisible) AfficheTexteAvecOuSansScroll(pTXT, 0, 1);
	  }
	  break;

	case CUCP_FOCUS:
	case CUCP_LENGTH:
	case CUCP_LINES:
	  ErrPropLectureSeule(szNomClasse, _f_, iProp);
	  return -1;

	default:
	  ErrPropNonGeree(szNomClasse, _f_, iProp);
	  return -1;
  }

  return 0; // Tout s'est bien pass‚
}


/*====================================================================*/
// Positionnement d'une propri‚t‚ "void *"

int CUC_TextEditSetPropPtr(struct CUC_TextEdit *pTXT, int iProp, void *pArg)
{
  if (iCtrlType(pTXT, "CUC_TextEditSetPropPtr", szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_PARENT: pTXT->Parent = pArg; break;
	case CUCP_IDBACK: pTXT->IdBack = pArg; break;
	case CUCP_WDISP:
	  pTXT->wDisp = pArg;
	  DoScrollBars(pTXT);
	  break;

	default:
	  ErrPropNonGeree(szNomClasse, "SetPropPtr", iProp);
	  return -1;
  }

  return 0; // Tout s'est bien pass‚
}
	  

/*====================================================================*/
// Positionnement d'une propri‚t‚ TextEdit

int CUC_TextEditSetPropStr(struct CUC_TextEdit *pTXT, int iProp, const char *szVal)
{
  size_t lMem;
  static char _f_[] = "CUC_TextEditSetPropStr";

  if (iCtrlType(pTXT, _f_, szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_TAG:
	  if (pTXT->szTag!=NULL) free(pTXT->szTag);
	  if (szVal==NULL)
		pTXT->szTag = NULL;
	  else
		pTXT->szTag = strdup(szVal);
	  break;

	case CUCP_TEXT:
	  {
		POSITION iOldPosition = pTXT->iPosition;

		// Optimisations pour ‚viter le bouclage des ‚v‚nements (PV)
		if(pTXT->szText==NULL && (szVal==NULL || szVal[0]==0))
		  return 0;
		if(pTXT->szText!=NULL && szVal!=NULL && strcmp(pTXT->szText, szVal)==0)
		  return 0;
		
		lMem = strlen(szVal);
		if (!bOkAlloc(pTXT, lMem+1)) return -1;
		strcpy(pTXT->szText, szVal);  
		pTXT->iLength = lMem;
		RAZ(pTXT);

		if (pTXT->iVisible) AfficheTexte(pTXT, 1);

		if (pTXT->iEnabled)
		  if (pTXT->iRaiseEvent != NULL)
		  { pTXT->iRaiseEvent(pTXT->IdBack, CUCE_CHANGE, 0);
			if (iOldPosition!=0)
			  pTXT->iRaiseEvent(pTXT->IdBack, CUCE_SELCHANGE, 0);
		  }
	  }
	  break;

	case CUCP_SELTEXT:
	  {
		POSITION iOldPosition = pTXT->iPosition;

		if(szVal==NULL || szVal[0]==0) return 0;
		pTXT->iModeExtension = 0;
		if (!bInsererTexte(pTXT, szVal)) return -1;
		if (pTXT->iVisible) AfficheTexte(pTXT, 1);

		if (pTXT->iPosition!=iOldPosition)
		  if (pTXT->iRaiseEvent != NULL)
			pTXT->iRaiseEvent(pTXT->IdBack, CUCE_SELCHANGE, 0);
	  }
	  break;

	case CUCP_TYPE:
	  ErrPropLectureSeule(szNomClasse, _f_, iProp);
	  return -1;

	default:
	  ErrPropNonGeree(szNomClasse, _f_, iProp);
	  return -1;
  }

  return 0; // Tout s'est bien pass‚
}


/*====================================================================*/
// Lecture d'une propri‚t‚ num‚rique

int CUC_TextEditGetPropNum(struct CUC_TextEdit *pTXT, int iProp)
{
  static char _f_[] = "CUC_TextEditGetPropNum";
  
  if (iCtrlType(pTXT, _f_, szNomType)<0)
	return -1;

  switch(iProp)
  {
	case CUCP_LEFT:         return pTXT->iLeft;
	case CUCP_TOP:          return pTXT->iTop;
	case CUCP_WIDTH:        return pTXT->iWidth;
	case CUCP_HEIGHT:       return pTXT->iHeight;
	case CUCP_VISIBLE:      return pTXT->iVisible;
	case CUCP_ENABLED:      return pTXT->iEnabled;
	case CUCP_ALIGNMENT:    return pTXT->iAlignment;
	case CUCP_AUTOSIZE:     return pTXT->iAutoSize;
	case CUCP_BORDERSTYLE:  return pTXT->iBorderStyle;
	case CUCP_MULTILINE:    return pTXT->iMultiligne;
	case CUCP_SELSTART:     return min(pTXT->iPosition, pTXT->iPositionAncrage);
	case CUCP_SELLENGTH:    return pTXT->iSelLength;
	case CUCP_INSMODE:      return pTXT->iModeInsertion;
	case CUCP_TABSIZE:      return pTXT->iTabSize;
	case CUCP_SCROLLBARS:   return pTXT->iScrollBars;
	case CUCP_MAXLENGTH:    return pTXT->iMaxLength;
	case CUCP_TABSTOP:      return pTXT->iTabStop;
	case CUCP_FOCUS:        return pTXT->iHasFocus;
	case CUCP_LENGTH:       return pTXT->iLength;
	case CUCP_LINES:        return pTXT->iNbLignes;
	case CUCP_LINE:         return pTXT->iLigne;
	case CUCP_COLUMN:       return pTXT->iColonne;
	case CUCP_STARTLINE:    return pTXT->iLigneStart;
	case CUCP_STARTCOLUMN:  return pTXT->iColonneStart;
	case CUCP_EOFCHAR:      return pTXT->iEOF;
	case CUCP_EOLCHAR:      return pTXT->iEOL;
	case CUCP_TABCHAR:      return pTXT->iTab;
	default:
	  ErrPropNonGeree(szNomClasse, _f_, iProp);
  }
  return 0;
}


/*====================================================================*/
// Lecture d'une propri‚t‚ void *

void *CUC_TextEditGetPropPtr(struct CUC_TextEdit *pTXT, int iProp)
{
  static char _f_[] = "CUC_TextEditGetPropPtr";
  
  if (iCtrlType(pTXT, _f_, szNomType)<0)
	return NULL;

  switch(iProp)
  {
	case CUCP_PARENT:   return pTXT->Parent;
	case CUCP_IDBACK:   return pTXT->IdBack;
	case CUCP_WDISP:    return pTXT->wDisp;
	default:
	  ErrPropNonGeree(szNomClasse, _f_, iProp);
  }
  return 0;
}


/*====================================================================*/
// Lecture d'une propri‚t‚ TextEdit
// On ne retourne pas un pointeur sur un champ de donn‚e priv‚,
// mais on copie la chaine … une adresse fournie par l'appellant.
// Routine s‚curis‚e: on gŠre la taille du buffer, et on garantit
// que le buffer se termine par 0.
// Une propri‚t‚ … NULL de fa‡on interne est rtourn‚e comme chaŒne nulle.

char *CUC_TextEditGetPropStr(struct CUC_TextEdit *pTXT, int iProp, char *szBuffer, size_t iLBuf)
{
  static char _f_[] = "CUC_TextEditGetPropStr";
  
  if (iCtrlType(pTXT, _f_, szNomType)<0)
	return NULL;

  switch(iProp)
  {
	case CUCP_TAG:
	  if (pTXT->szTag==NULL) szBuffer[0] = 0;
	  else
	  { strncpy(szBuffer, pTXT->szTag, iLBuf);
		szBuffer[iLBuf-1] = 0;
	  }
	  break;

	case CUCP_TYPE:
	  strncpy(szBuffer, pTXT->szType, iLBuf);
	  szBuffer[iLBuf-1] = 0;
	  break;

	case CUCP_TEXT:
	  if (pTXT->szText==NULL)
		szBuffer[0] = 0;
	  else
		strncpy2(szBuffer, pTXT->szText, iLBuf);
	  break;

	case CUCP_SELTEXT:
	  if (szSelText==NULL)
		szBuffer[0] = 0;
	  else
		strncpy2(szBuffer, pTXT->szText+iSelStart(pTXT), min(iLBuf, pTXT->iSelLength+1));
	  break;

	default:
	  ErrPropNonGeree(szNomClasse, _f_, iProp);
  }

  return szBuffer;
}

/*====================================================================*/

static POSITION PositionPrecedente(struct CUC_TextEdit *pTXT, POSITION p)
{
  if (p>0) p--;
  return p;
}

static POSITION PositionSuivante(struct CUC_TextEdit *pTXT, POSITION p)
{
  if (pTXT->szText[p]==0) return p;
  p++;
  return p;
}

static POSITION CalculePosition(struct CUC_TextEdit *pTXT, int iKey)
{
  switch(iKey)
  {
	case KEY_LEFT:
	  return PositionPrecedente(pTXT, pTXT->iPosition);
	case KEY_RIGHT:
	  return PositionSuivante(pTXT, pTXT->iPosition);
	case KEY_DOWN:
	  return XYenPosition(pTXT, pTXT->iLigne+1, pTXT->iColonne);
	case KEY_UP:
	  if (pTXT->iLigne>0)
		return XYenPosition(pTXT, pTXT->iLigne-1, pTXT->iColonne);
	  else
		return pTXT->iPosition;
	case KEY_PGUP:
	  if (pTXT->iLigne >= pTXT->iHauteurAffichage)
		return XYenPosition(pTXT, pTXT->iLigne-pTXT->iHauteurAffichage, pTXT->iColonne);
	  else
		return XYenPosition(pTXT, 0, pTXT->iColonne);
	case KEY_PGDN:
	  return XYenPosition(pTXT, pTXT->iLigne+pTXT->iHauteurAffichage, pTXT->iColonne);
	case KEY_HOME:
	  return XYenPosition(pTXT, pTXT->iLigne, 0);
	case KEY_END:
	  return XYenPosition(pTXT, pTXT->iLigne, 999);
	case ALT(KEY_HOME):
	  return 0;
	case ALT(KEY_END):
	  return strlen(pTXT->szText);
  }
}



static void EtendreSelection(struct CUC_TextEdit *pTXT, int iKey)
{
  pTXT->iPosition = CalculePosition(pTXT, iKey);
  CalculeLC(pTXT);

  if (pTXT->iPosition>=pTXT->iPositionAncrage)
	pTXT->iSelLength = pTXT->iPosition - pTXT->iPositionAncrage;
  else
	pTXT->iSelLength = pTXT->iPositionAncrage - pTXT->iPosition;
}


static void DeplacerCurseur(struct CUC_TextEdit *pTXT, int iKey)
{
  pTXT->iSelLength = 0;
  pTXT->iPosition = CalculePosition(pTXT, iKey);
  CalculeLC(pTXT);
  pTXT->iPositionAncrage = pTXT->iPosition;
  pTXT->iLigneAncrage = pTXT->iLigne;
  pTXT->iColonneAncrage = pTXT->iColonne;
}

static void MemoriseSelection(struct CUC_TextEdit *pTXT, char **ppTxt)
{
  *ppTxt = malloc(1+pTXT->iSelLength);
  strncpy2(*ppTxt, pTXT->szText+iSelStart(pTXT), pTXT->iSelLength+1);  
}



/*====================================================================*/
// DoEventKey: traite l'‚v‚nement CUCE_KEY

static void DoEventKey(struct CUC_TextEdit *pTXT, int iKey)
{
  POSITION iOldPosition = pTXT->iPosition;

  switch(iKey)
  {
	case KEY_BACK:
	  pTXT->iModeExtension = 0;
	  if (pTXT->iSelLength==0) EtendreSelection(pTXT, KEY_LEFT);
	  EffaceSelection(pTXT);
	  AfficheTexte(pTXT, 1);
	  break;
	
	case KEY_DELETE:
	case KEY_CTRL_X:
	case 330:  // Delete pour PC-Curses !
	  pTXT->iModeExtension = 0;
	  if (pTXT->iSelLength==0) EtendreSelection(pTXT, KEY_RIGHT);
	  EffaceSelection(pTXT);
	  AfficheTexte(pTXT, 1);
	  break;
	
	case KEY_ESCAPE:
	  if (pTXT->iModeExtension)
		pTXT->iModeExtension = 0;
	  else
	  {
		pTXT->iSelLength = 0;
		pTXT->iPositionAncrage = pTXT->iPosition;
		pTXT->iLigneAncrage = pTXT->iLigne;
		pTXT->iColonneAncrage = pTXT->iColonne;
		AfficheTexte(pTXT, 1);
	  }
	  break;

	case KEY_F(8):
	  pTXT->iModeExtension = !pTXT->iModeExtension;
	  if (pTXT->iModeExtension)
	  { 
		pTXT->iSelLength = 0;
		pTXT->iPositionAncrage = pTXT->iPosition;
		pTXT->iLigneAncrage = pTXT->iLigne;
		pTXT->iColonneAncrage = pTXT->iColonne;
		AfficheTexte(pTXT, 1);
	  }
	  break;
	
	case KEY_CTRL_C:
	case KEY_CTRL_E:    // Synonyme pour les tests sous Dos
	  pTXT->iModeExtension = 0;
	  if (szSelText) free(szSelText);
	  MemoriseSelection(pTXT, &szSelText);
	  break;
	
	case KEY_CTRL_V:
	  pTXT->iModeExtension = 0;
	  if (szSelText!=NULL)
	  { if (!bInsererTexte(pTXT, szSelText)) return;
		AfficheTexte(pTXT, 1);
	  }
	  break;
	
	case KEY_CTRL_A:
	  pTXT->iModeInsertion = !pTXT->iModeInsertion;
	  if (pTXT->iRaiseEvent != NULL)
		pTXT->iRaiseEvent(pTXT->IdBack, CUCE_INSMODECHANGE, pTXT->iModeInsertion);
	  break;
	
	default:
	  if ((iKey>=32 && iKey<=255) || (pTXT->iMultiligne && iKey=='\n') || iKey==KEY_TAB)
	  { 
		UC szBuffer[2];
		
		pTXT->iModeExtension = 0;
		if (pTXT->iSelLength==0 && !pTXT->iModeInsertion && cCarCourant(pTXT)!='\n' && cCarCourant(pTXT)!=0)
		  EtendreSelection(pTXT, KEY_RIGHT);
		szBuffer[0] = (UC)iKey;
		szBuffer[1] = 0;
		if (!bInsererTexte(pTXT, szBuffer)) return;
		AfficheTexte(pTXT, 1);
	  }
	  break;
	
	  // Les s‚quences suivantes sont ignor‚es si on n'est pas en multiligne
	case KEY_PGUP:
	case KEY_PGDN:
	case ALT(KEY_HOME):
	case ALT(KEY_END):
	case KEY_UP:
	case KEY_DOWN:
	  if (!pTXT->iMultiligne)
		break;

	case KEY_RIGHT:
	case KEY_LEFT:
	case KEY_HOME:
	case KEY_END:
	  {
		int bRedisplay = 0;

		if (pTXT->iModeExtension)
		{ EtendreSelection(pTXT, iKey);
		  bRedisplay = 1;
		}
		else
		{
		  if (pTXT->iSelLength)
		  { bRedisplay = 1;
			pTXT->iSelLength = 0;
		  }
		  DeplacerCurseur(pTXT, iKey);
		}
		AfficheTexte(pTXT, bRedisplay);
	  }
	  break;
	
	case KEY_CTRL_Z:		// Annulation
	  {
		UC *szUBuffer;

		pTXT->iPosition = pTXT->iUndoPos+pTXT->iUndoLength;
		CalculeLC(pTXT);
		pTXT->iPositionAncrage = pTXT->iPosition;
		pTXT->iLigneAncrage = pTXT->iLigne;
		pTXT->iColonneAncrage = pTXT->iColonne;
		pTXT->iSelLength = pTXT->iUndoLength;

		pTXT->iPosition = pTXT->iUndoPos;
		CalculeLC(pTXT);

		if (pTXT->szUndo!=NULL)
		{ 
		  int bInsertion;
		  
		  szUBuffer = strdup(pTXT->szUndo);
		  bInsertion = bInsererTexte(pTXT, szUBuffer);
		  free(szUBuffer);
		  if (!bInsertion) return;
		}
		else
		  EffaceSelection(pTXT);

		AfficheTexte(pTXT, 1);
	  }
	  break;

#if !defined(UNIX) && defined(_DEBUG)
	case KEY_CTRL_K:    // Appel de CodeView
	  _asm int 3;
	  break;
#endif
  }

  if (pTXT->iPosition!=iOldPosition)
	if (pTXT->iRaiseEvent != NULL)
	  pTXT->iRaiseEvent(pTXT->IdBack, CUCE_SELCHANGE, 0);
}

//====================================================================
// Fonction principale de traitement des ‚v‚nements par le contr“le

int CUC_TextEditDoEvent(struct CUC_TextEdit *pTXT, int iEvent, int iArg)
{

  if (iCtrlType(pTXT, "CUC_TextEditDoEvent", szNomType)<0)
	return -1;

  switch(iEvent)
  {
	case CUCE_KEY:
	  if (pTXT->iVisible && pTXT->iEnabled)
		DoEventKey(pTXT, iArg);
	  break;

	case CUCE_GOTFOCUS:
	  if (pTXT->iVisible && pTXT->iEnabled)
	  { pTXT->iHasFocus = 1;
		Affiche(pTXT);
	  }
	  break;

	case CUCE_LOSTFOCUS:
	  if (pTXT->iVisible && pTXT->iEnabled)
	  { pTXT->iHasFocus = 0;
		Affiche(pTXT);
	  }
	  break;

	case CUCE_DUMP:
	  Special(pTXT);
	  break;

	default:
	  aprintf("CUC: CUC_TextEditDoEvent", "Ev‚nement %d inconnu !", iEvent);
	  break;
  }

#ifdef _DEBUG
AfficheEtat(pTXT);
AfficheCurseur(pTXT);
#endif

  return 0;
}

/*====================================================================*/
// M‚thode Move: d‚placement combin‚ du contr“le sur X et Y

int CUC_TextEditMove(struct CUC_TextEdit *pTXT, int iTop, int iLeft)
{
  if (iCtrlType(pTXT, "CUC_TextEditMove", szNomType)<0)
	return -1;

  if (pTXT->iLeft!=iLeft || pTXT->iTop!=iTop)
  { 
	if (pTXT->iVisible) Efface(pTXT);
	pTXT->iLeft = iLeft;
	pTXT->iTop = iTop;
	if (pTXT->iVisible) Affiche(pTXT);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Resize: Changement de taille combin‚ largeur/hauteur

int CUC_TextEditResize(struct CUC_TextEdit *pTXT, int iHeight, int iWidth)
{
  if (iCtrlType(pTXT, "CUC_TextEditResize", szNomType)<0)
	return -1;

  if (pTXT->iWidth!=iWidth || pTXT->iHeight!=iHeight)
  { 
	if (pTXT->iVisible) Efface(pTXT);
	pTXT->iWidth = iWidth;
	pTXT->iHeight = iHeight;
	if (pTXT->iVisible) Affiche(pTXT);
  }
  return 0;
}

/*====================================================================*/
// M‚thode Refresh: le contr“le se redessine

int CUC_TextEditRefresh(struct CUC_TextEdit *pTXT)
{
  if (iCtrlType(pTXT, "CUC_TextEditResize", szNomType)<0)
	return -1;

  Efface(pTXT);
  Affiche(pTXT);
}



//====================================================================
// M‚thode DisplayCursor : R‚affiche le curseur dans le contr“le
int CUC_TextEditDisplayCursor(struct CUC_TextEdit *pTXT)
{
  if (iCtrlType(pTXT, "CUC_TextEditDisplayCursor", szNomType)<0)
	return -1;

  AfficheCurseur(pTXT);
  return 0;
}


//====================================================================
// M‚thode freeClipBoard
// LibŠre la m‚moire utilis‚e par le presse-papiers
// Permet de suivre en d‚tail la consommation de m‚moire
// PV 14/7

void CUC_TextEditFreeClipBoard()
{
  if (szSelText!=NULL)
  { 
	free(szSelText);
	szSelText = NULL;
  }
}
