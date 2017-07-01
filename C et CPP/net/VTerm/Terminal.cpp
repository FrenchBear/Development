// Terminal.cpp : implementation file
// Classe de gestion d'un terminal SCO ANSI
// 30/04/93 PV
// 01/07/96 PV	Gestion des séquences CSI 2 ccar cfond m; CSI 0 m -> police 0
//  1/11/96 PV	Codage 8 bits ANSI. Séquence ESC V qui retourne l'adresse IP de la machine qui exécute VTerm
// 15/10/97 PV	Élimination optionnelle des double Ç (b128128), bug de telnetd
// 29/11/98 PV	Protection contre le positionnement en ligne ou colonne 0 avec ESC [ H (coordoonnées en base 1)
//  7/12/98 PV	Sauvegarde/Restauraion des attributs courants
//  8/12/98 PV  Pas de m_iFont=0 pour ESC[0m (pb du coin haut droite Informix)
// 31/10/00 PV  Taille d'écran émulé paramétrée

#include "stdafx.h"
#include "VTerm.h"
#include "Terminal.h"
#include "VTermGlobal.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

// Pour avoir accès dynamiquement au type
IMPLEMENT_SERIAL( CHint, CObject, 1 )

/////////////////////////////////////////////////////////////////////////////
// Terminal

// Initialisation d'un nouveau terminal
Terminal::Terminal()
{
  m_iAttribut = 0;

  m_iNormalBack = 0;
  m_iNormalFore = 7;
  m_iReverseBack = 7;
  m_iReverseFore = 0;
  m_iGraphicBack = 0;
  m_iGraphicFore = 7;

  SaveExtendedAttributes();

  // Taille par défaut
  m_iNbLignes = iLignesDefautOptions;
  m_iNbColonnes = iColonnesDefautOptions;

  for (m_iLigne=0 ; m_iLigne<m_iNbLignes ; m_iLigne++)
	for (m_iColonne=0 ; m_iColonne<m_iNbColonnes ; m_iColonne++)
	  bPlaceCaractere(m_iLigne, m_iColonne, ' ');

  m_iLigne = m_iColonne = 0;
  m_iEtat = ET_NORMAL;
  m_bAutoWrap = TRUE;
  m_iFont = 0;
  m_bClavierBloque = FALSE;
}


Terminal::~Terminal()
{
}



/////////////////////////////////////////////////////////////////////////////
// Sauvegarde et restauration des attributs standards

void Terminal::SaveExtendedAttributes()
{
  m_iSaveAttribut = m_iAttribut;
  m_iSaveNormalBack = m_iNormalBack;
  m_iSaveNormalFore = m_iNormalFore;
  m_iSaveReverseBack = m_iReverseBack;
  m_iSaveReverseFore = m_iReverseFore;
  m_iSaveGraphicBack = m_iGraphicBack;
  m_iSaveGraphicFore = m_iGraphicFore;
}

void Terminal::RestoreExtendedAttributes()
{
  m_iAttribut = m_iSaveAttribut;
  m_iNormalBack = m_iSaveNormalBack;
  m_iNormalFore = m_iSaveNormalFore;
  m_iReverseBack = m_iSaveReverseBack;
  m_iReverseFore = m_iSaveReverseFore;
  m_iGraphicBack = m_iSaveGraphicBack;
  m_iGraphicFore = m_iSaveGraphicFore;
}


/////////////////////////////////////////////////////////////////////////////
// Terminal commands

void Terminal::DoCarEtatEchap(unsigned char c)
{
  switch(c)
  {
    case '[':
	  m_iEtat = ET_CROCHET;
	  return;

	case '7': // Saves current cursor position
	  m_iLigneSauvee = m_iLigne;
	  m_iColonneSauvee = m_iColonne;
	  break;

	case '8': // Restores saved cursor position
	  m_iLigne = m_iLigneSauvee;
	  m_iColonne = m_iColonneSauvee;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'V':	// Retourne l'adresse IP de la machine qui exécute VTerm, suivi d'un CR
	  if ((iOptions & OPT_NOESCV)==0)
	  {
		m_bATransmettre = TRUE;
		m_sTrans = szMonAdresseIP;
		m_sTrans += "\r";
	  }
	  break;
  }
  m_iEtat = ET_NORMAL;
}

void Terminal::DoCarEtatCrochet(unsigned char c)
{
  int i;
  int lig, col;

  switch(c)
  {
	// Les séquences en ESC [ = ont une fonction de décodage séparée
    case '=':
	  m_iEtat = ET_EGAL;
	  return;

	case '?':
	  m_iEtat = ET_INTERROGATION;
	  return;

	// Traitement des préfixes numériques
	case '0':	case '1':	case '2':	case '3':	case '4':
	case '5':	case '6':	case '7':	case '8':	case '9':
	case ';':
	  DoCarPrefixe(c);
	  return;

	// Traitement des commandes
	case 'A':	// Cursor up
	  if (m_iNbPar)
		m_iLigne -= m_tiPar[0];
	  else
		m_iLigne--;
	  if (m_iLigne<0) m_iLigne = 0;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'B':	// Cursor down
	  if (m_iNbPar)
		m_iLigne += m_tiPar[0];
	  else
		m_iLigne++;
	  if (m_iLigne>m_iNbLignes-1) m_iLigne = m_iNbLignes-1;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'C':	// Cursor forward (right)
	  if (m_iNbPar)
		m_iColonne += m_tiPar[0];
	  else
		m_iColonne++;
	  if (m_iColonne>m_iNbColonnes-1) m_iColonne = m_iNbColonnes-1;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'D':	// Cursor backward (left)
	  if (m_iNbPar)
		m_iColonne -= m_tiPar[0];
	  else
		m_iColonne--;
	  if (m_iColonne<0) m_iColonne = 0;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'Z':	// Cursor backward tabulation
	  if (m_iNbPar==0)
		m_tiPar[0] = 1;
	  for (i=0 ; i<m_tiPar[0] ; i++)
	  {
		do
		  m_iColonne--;
		while (m_iColonne%8);
	  }
	  if (m_iColonne<0) m_iColonne = 0;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'H':	// Cursor Position (base 1)
	case 'f':	// Horizontal & Vertical Position
	  if (m_iNbPar<1) m_tiPar[0] = 1;
	  if (m_iNbPar<2) m_tiPar[1] = 1;
	  m_iLigne = m_tiPar[0]-1;
	  m_iColonne = m_tiPar[1]-1;
	  if (m_iLigne<0) m_iLigne = 0;		  // 29/11/98 PV
	  if (m_iColonne<0) m_iColonne = 0;
	  if (m_iLigne>m_iNbLignes-1) m_iLigne = m_iNbLignes-1;
	  if (m_iColonne>m_iNbColonnes-1) m_iColonne = m_iNbColonnes-1;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'F':	// Cursor to previous line
	  if (m_iNbPar)
		m_iLigne -= m_tiPar[0];
	  else
		m_iLigne--;
	  if (m_iLigne<0) m_iLigne = 0;
	  m_iColonne = 0;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'E':	// Cursor next line
	  if (m_iNbPar)
		m_iLigne += m_tiPar[0];
	  else
		m_iLigne++;
	  if (m_iLigne>m_iNbLignes-1) m_iLigne = m_iNbLignes-1;
	  m_iColonne = 0;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'P':	// Delete Character
	  if (m_iNbPar<1) m_tiPar[0] = 1;
	  col = m_iColonne;
	  while (col+m_tiPar[0]<=m_iNbColonnes-1)
	  {
	    m_celEcran[m_iLigne][col] = m_celEcran[m_iLigne][col+m_tiPar[0]];
		col++;
	  }
	  while (col<m_iNbColonnes)
	  {
		bPlaceCaractere(m_iLigne, col, ' ');
		col++;
	  }
	  ZoneAReafficher(m_iLigne, m_iColonne, m_iLigne, m_iNbColonnes-1);
	  break;

	case 'M':	// Delete Line
	  if (m_iNbPar<1) m_tiPar[0] = 1;
	  lig = m_iLigne;
	  while (lig+m_tiPar[0]<=m_iNbLignes-1)
	  {
		for (col=0 ; col<=m_iNbColonnes-1 ; col++)
	      m_celEcran[lig][col] = m_celEcran[lig+m_tiPar[0]][col];
		lig++;
	  }
	  while (lig<=m_iNbLignes-1)
	  {
		for (col=0 ; col<=m_iNbColonnes-1 ; col++)
		  bPlaceCaractere(lig, col, ' ');
		lig++;
	  }
	  ZoneAReafficher(m_iLigne, 0, m_iNbLignes-1, m_iNbColonnes-1);
	  break;

	case 'X':	// Erase Character
	  if (m_iNbPar<1) m_tiPar[0] = 1;
	  col = m_iColonne;
	  while (col<=m_iNbColonnes-1 && m_tiPar[0]-->0)
	  {
		bPlaceCaractere(m_iLigne, col, ' ');
		col++;
	  }
	  ZoneAReafficher(m_iLigne, m_iColonne, m_iLigne, col-1);
	  break;

	case 'J':	// Erases all or part of a display
	  if (m_iNbPar<1) m_tiPar[0] = 0;
	  switch(m_tiPar[0])
	  {
		case 0: // erases from active position to end of display
		  for (lig=m_iLigne ; lig<=m_iNbLignes-1 ; lig++)
			for (col=(lig==m_iLigne ? m_iColonne : 0) ; col<=m_iNbColonnes-1 ; col++)
			  bPlaceCaractere(lig, col, ' ');
		  ZoneAReafficher(m_iLigne, 0, m_iNbLignes-1, m_iNbColonnes-1);
		  break;

		case 1: // erases from the beginning of display to active position
		  for (lig=0 ; lig<=m_iLigne ; lig++)
			for (col=0 ; col<=(lig==m_iLigne ? m_iColonne : m_iNbColonnes-1) ; col++)
			  bPlaceCaractere(lig, col, ' ');
		  ZoneAReafficher(0, 0, m_iLigne, m_iNbColonnes-1);
		  break;

		case 2: // erases entire display
		  for (lig=0 ; lig<m_iNbLignes ; lig++)
			for (col=0 ; col<m_iNbColonnes ; col++)
			  bPlaceCaractere(lig, col, ' ');
		  ZoneAReafficher(0, 0, m_iNbLignes-1, m_iNbColonnes-1);
		  break;
	  }
	  break;

	case 'K':	// Erases all or part of a line
	  if (m_iNbPar<1) m_tiPar[0] = 0;
	  switch(m_tiPar[0])
	  {
		case 0: // erases from active position to end of line
		  for (col=m_iColonne ; col<=m_iNbColonnes-1 ; col++)
			bPlaceCaractere(m_iLigne, col, ' ');
		  ZoneAReafficher(m_iLigne, m_iColonne, m_iLigne, m_iNbColonnes-1);
		  break;

		case 1: // erases from beginning of line to active position
		  for (col=0 ; col<=m_iColonne ; col++)
			bPlaceCaractere(m_iLigne, col, ' ');
		  ZoneAReafficher(m_iLigne, 0, m_iLigne, m_iColonne);
		  break;

		case 2: // erases entire line
		  for (col=0 ; col<m_iNbColonnes ; col++)
			bPlaceCaractere(m_iLigne, col, ' ');
		  ZoneAReafficher(m_iLigne, 0, m_iLigne, m_iNbColonnes-1);
		  break;
	  }
	  break;

	case '\'':  // Moves active position to column n
	  if (m_iNbPar<1) m_tiPar[0] = 0;
	  m_iColonne = m_tiPar[0];
	  if (m_iColonne>m_iNbColonnes-1) m_iColonne=m_iNbColonnes-1;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'a':	// Moves active position n characters to the right
	  if (m_iNbPar<1) m_tiPar[0] = 1;
	  m_iColonne += m_tiPar[0];
	  if (m_iColonne>m_iNbColonnes-1) m_iColonne=m_iNbColonnes-1;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'd':  // Moves active position to line given by n
	  if (m_iNbPar<1) m_tiPar[0] = 0;
	  m_iLigne = m_tiPar[0];
	  if (m_iLigne>m_iNbLignes-1) m_iLigne=m_iNbLignes-1;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'e':  // Moves active position down n number of lines
	  if (m_iNbPar<1) m_tiPar[0] = 0;
	  m_iLigne += m_tiPar[0];
	  if (m_iLigne>m_iNbLignes-1) m_iLigne=m_iNbLignes-1;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case '@':	// Inserts n blank places for n characters
	  if (m_iNbPar<1) m_tiPar[0] = 1;
	  col = m_iNbColonnes-1;
	  while (col-m_tiPar[0]>=m_iColonne)
	  {
		m_celEcran[m_iLigne][col] = m_celEcran[m_iLigne][col-m_tiPar[0]];
		col--;
	  }
	  while (col>=m_iColonne)
	  {
		bPlaceCaractere(m_iLigne, col, ' ');
		col--;
	  }
	  ZoneAReafficher(m_iLigne, m_iColonne, m_iLigne, m_iNbColonnes-1);
	  break;

	case 'L':	// Inserts n new, blank lines
	  if (m_iNbPar<1) m_tiPar[0] = 1;
	  lig = m_iNbLignes-1;
	  while (lig-m_tiPar[0]>=m_iLigne)
	  {
		for (col=0 ; col<m_iNbColonnes ; col++)
		  m_celEcran[lig][col] = m_celEcran[lig-m_tiPar[0]][col];
		lig--;
	  }
	  while (lig>=m_iLigne)
	  {
		for (col=0 ; col<m_iNbColonnes ; col++)
		  bPlaceCaractere(lig, col, ' ');
		lig--;
	  }
	  ZoneAReafficher(m_iLigne, 0, m_iNbLignes-1, m_iNbColonnes-1);
	  break;

	case 'T':	// Scrolls screen down n lines introducing new blank lines at top
	  if (m_iNbPar<1) m_tiPar[0] = 1;
	  lig = m_iNbLignes-1;
	  while (lig-m_tiPar[0]>=0)
	  {
		for (col=0 ; col<m_iNbColonnes ; col++)
		  m_celEcran[lig][col] = m_celEcran[lig-m_tiPar[0]][col];
		lig--;
	  }
	  while (lig>=0)
	  {
		for (col=0 ; col<m_iNbColonnes ; col++)
		  bPlaceCaractere(lig, col, ' ');
		lig--;
	  }
	  ZoneAReafficher(0, 0, m_iNbLignes-1, m_iNbColonnes-1);
	  break;

	case 'S':	// Scrolls screen up n lines introducing new blank lines at bottom
	  if (m_iNbPar<1) m_tiPar[0] = 1;
	  lig = 0;
	  while (lig+m_tiPar[0]<=m_iNbLignes-1)
	  {
		for (col=0 ; col<=m_iNbColonnes-1 ; col++)
	      m_celEcran[lig][col] = m_celEcran[lig+m_tiPar[0]][col];
		lig++;
	  }
	  while (lig<=m_iNbLignes-1)
	  {
		for (col=0 ; col<=m_iNbColonnes-1 ; col++)
		  bPlaceCaractere(lig, col, ' ');
		lig++;
	  }
	  ZoneAReafficher(0, 0, m_iNbLignes-1, m_iNbColonnes-1);
	  break;

	case 's':	// Saves current cursor position
	  m_iLigneSauvee = m_iLigne;
	  m_iColonneSauvee = m_iColonne;
	  break;

	case 'u':	// Restores saved cursor position
	  m_iLigne = m_iLigneSauvee;
	  m_iColonne = m_iColonneSauvee;
	  m_Hint.iCurseurDeplace = 1;
	  break;

	case 'i':
	  if (m_tiPar[0]==2)
	  {
		int lig, col;

		m_bATransmettre = TRUE;
		m_sTrans = CString(' ', m_iNbLignes*m_iNbColonnes);
		for (lig=0 ; lig<m_iNbLignes ; lig++)
		  for (col=0 ; col<m_iNbColonnes ; col++)
		    m_sTrans.SetAt(m_iNbColonnes*lig+col, m_celEcran[lig][col].caractere);
	  }
	  break;

	case 'h':	// Set mode
	  if (m_tiPar[0]==2)
		m_bClavierBloque = TRUE;
	  else if (m_tiPar[0]==3)		// 132 colonnes
	  {
		if (m_iNbLignes!=43 || m_iNbColonnes!=132)
		{ 
		  int l, c;
		  for (l=0 ; l<43 ; l++)
			for (c=0 ; c<132 ; c++)
			  if (l>=m_iNbLignes || c>=m_iNbColonnes)
		  		bPlaceCaractere(l, c, ' ');
		  m_iNbLignes=43;
		  m_iNbColonnes=132;
		  m_Hint.bResize = TRUE;	// Réaffiche tout
		}
	  }
	  else if (m_tiPar[0]==5)		// 102 colonnes
	  {
		if (m_iNbLignes!=32 || m_iNbColonnes!=102)
		{ 
		  int l, c;
		  for (l=0 ; l<32 ; l++)
			for (c=0 ; c<102 ; c++)
			  if (l>=m_iNbLignes || c>=m_iNbColonnes)
		  		bPlaceCaractere(l, c, ' ');
		  m_iNbLignes=32;
		  m_iNbColonnes=102;
		  m_Hint.bResize = TRUE;	// Réaffiche tout
		}
	  }
	  break;

	case 'l':	// Reset mode
	  if (m_tiPar[0]==2)
		m_bClavierBloque = FALSE;
	  else if (m_tiPar[0]==3 || m_tiPar[0]==5)		// 132 et 102 colonnes
	  {
		if (m_iNbLignes!=25 || m_iNbColonnes!=80)
		{ m_iNbLignes=25;
		  m_iNbColonnes=80;
		  m_Hint.bResize = TRUE;
		}
	  }
	  break;

	case 'm': // Character attributes
	  int iCoul;
	  if (m_iNbPar==0)	// RAZ des attributs
		m_iAttribut = 0;
	  else
		for (i=0 ; i<m_iNbPar ; i++)
		  switch(m_tiPar[i])
		  {
			case 0: m_iAttribut = 0; break;
			case 1: m_iAttribut |= AT_BRILLANT; break;
			case 2: m_iNormalFore = (i<=1)?(m_tiPar[i+1]%16):0;
					m_iNormalBack = (i==0)?(m_tiPar[2]%16):0;
					i = 99;	  // Sortie de la boucle
					break;
			case 4: m_iAttribut |= AT_SOULIGNE; break;
			case 5: m_iAttribut |= AT_CLIGNOTANT; break;
			case 7: m_iAttribut |= AT_INVERSE;  break;
			case 8: m_iAttribut |= AT_INVISIBLE;  break;
			case 10: m_iFont = 0; m_iAttribut &= ~AT_FONTOEM; break;
			case 11: m_iFont = 1; m_iAttribut |= AT_FONTOEM; break;
			case 12: m_iFont = 2; m_iAttribut |= AT_FONTOEM; break;
			case 30: iCoul = 0; goto SetColor;
			case 31: iCoul = 4; goto SetColor;
			case 32: iCoul = 2; goto SetColor;
			case 33: iCoul = 6; goto SetColor;
			case 34: iCoul = 1; goto SetColor;
			case 35: iCoul = 5; goto SetColor;
			case 36: iCoul = 3; goto SetColor;
			case 37: iCoul = 7;
			SetColor:
			  m_iNormalFore = iCoul;
			  m_iGraphicFore = iCoul;
			  m_iReverseBack = iCoul;
			  break;
			case 40: iCoul = 0; goto SetBack;
			case 41: iCoul = 4; goto SetBack;
			case 42: iCoul = 2; goto SetBack;
			case 43: iCoul = 6; goto SetBack;
			case 44: iCoul = 1; goto SetBack;
			case 45: iCoul = 5; goto SetBack;
			case 46: iCoul = 3; goto SetBack;
			case 47: iCoul = 7; goto SetBack;
			SetBack:
			  m_iNormalBack = iCoul;
			  m_iGraphicBack = iCoul;
			  m_iReverseFore = iCoul;
			  break;
		  }
	  break;
  }

  m_iEtat = ET_NORMAL;
}


void Terminal::DoCarEtatEgal(unsigned char c)
{
  switch(c)
  {
	// Traitement des préfixes numériques
	case '0':	case '1':	case '2':	case '3':	case '4':
	case '5':	case '6':	case '7':	case '8':	case '9':
	case ';':
	  DoCarPrefixe(c);
	  return;

	// Traitement des commandes
	case 'F':
	  m_iNormalFore = m_tiPar[0];
	  break;

	case 'G':
	  m_iNormalBack = m_tiPar[0];
	  break;

	case 'H':
	  m_iReverseFore = m_tiPar[0];
	  break;

	case 'I':
	  m_iReverseBack = m_tiPar[0];
	  break;

	case 'J':
	  m_iGraphicFore = m_tiPar[0];
	  break;

	case 'K':
	  m_iGraphicBack = m_tiPar[0];
	  break;

	case 'M':
	  char szBuffer[10];
	  szBuffer[0] = 0;
	  switch(m_tiPar[0])
	  {
		case 0:
		  sprintf(szBuffer, "%d %d\n", m_iNormalFore, m_iNormalBack);
		  break;

  		case 1:
		  sprintf(szBuffer, "%d %d\n", m_iReverseFore, m_iReverseBack);
		  break;

  		case 2:
		  sprintf(szBuffer, "%d %d\n", m_iGraphicFore, m_iGraphicBack);
		  break;
	  }
	  if (szBuffer[0])
	  {
		m_bATransmettre = TRUE;
		m_sTrans = CString(szBuffer);
	  }
	  break;

	case 'g':
	  if (bPlaceCaractere(m_iLigne, m_iColonne, m_tiPar[0]))
		ZoneAReafficher(m_iLigne, m_iColonne, m_iLigne, m_iColonne);
	  AvanceCurseur();
	  break;
  }
  m_iEtat = ET_NORMAL;
}


void Terminal::DoCarEtatInterrogation(unsigned char c)
{
  switch(c)
  {
	// Traitement des préfixes numériques
	case '0':	case '1':	case '2':	case '3':	case '4':
	case '5':	case '6':	case '7':	case '8':	case '9':
	case ';':
	  DoCarPrefixe(c);
	  return;

	// Traitement des commandes
	case 'l':
	  if (m_tiPar[0]==7)
		m_bAutoWrap = FALSE;
	  break;

	case 'h':
	  if (m_tiPar[0]==7)
		m_bAutoWrap = TRUE;
	  break;
  }
  m_iEtat = ET_NORMAL;
}


void Terminal::DoCarPrefixe(unsigned char c)
{
  if (c==';')
  {
    if (m_iEtat==ET_CROCHET || m_iEtat==ET_EGAL || m_iEtat==ET_INTERROGATION)
	  m_tiPar[m_iNbPar] = 0;
	else
	  m_iEtat--;
	return;
  }

  // Chiffre de 0 à 9
  if (m_iEtat==ET_CROCHET || m_iEtat==ET_EGAL || m_iEtat==ET_INTERROGATION)
  {	
	m_iEtat++;
	m_tiPar[m_iNbPar++] = 0;
  }
  if (m_iNbPar<=3)
	m_tiPar[m_iNbPar-1] = m_tiPar[m_iNbPar-1]*10 + c-'0';
  return;
}


// Affichge d'un caractère reçu, et décodage de séquences ESC

void Terminal::DoCaractere(unsigned char c)
{
  m_Hint.bResize = FALSE;			// Pas de changement de taille écran
  m_Hint.bZoneAReafficher = FALSE;	// Rien à réafficher à priori
  m_Hint.iCurseurDeplace = 0;		// Le curseur n'a pas bougé
  m_Hint.iScroll = 0;				// Pas de scroll vertical
  m_bATransmettre = FALSE;			// Rien à transmettre au host

  // Si on est en train de traiter une séquence ESC... on passe tout de suite
  // à la routine appropriée
  switch(m_iEtat)
  {
	case ET_ECHAP:
	  DoCarEtatEchap(c);
	  return;

	case ET_CROCHET:
	case ET_CROCHETPARAM:
	  DoCarEtatCrochet(c);
	  return;

	case ET_EGAL:
	case ET_EGALPARAM:
	  DoCarEtatEgal(c);
	  return;

  	case ET_INTERROGATION:
	case ET_INTERROGATIONPARAM:
	  DoCarEtatInterrogation(c);
	  return;
  }

  if (c=='\033')
  {
	m_iEtat = ET_ECHAP;
	m_iNbPar = 0;
	m_tiPar[0] = 0;
	return;
  }

  if (m_iFont==1) goto AffichageCaractereNormal;
  if (m_iFont==2) c += 128;

  if (c=='\r')	  // Retour en colonne 0
  {
	if (m_iColonne)
	{
	  m_iColonne = 0;
	  m_Hint.iCurseurDeplace = 1;
	}
	return;
  }

  if (c=='\10')	  // Backspace
  {
	if (m_iColonne)
	{
	  m_iColonne--;
	  m_Hint.iCurseurDeplace = 1;
	}
	return;
  }

  if (c=='\t')	  // Tabulation
  {
	int iColStart = m_iColonne;	// Zone couverte par la tab pour réaffichage
	int iColFin;
	int iLigStart = m_iLigne;
	BOOL bModif = FALSE;

	// Le tab est destructif dans l'émulation SCO ANSI
	do                  
	{                   
	  bModif |= bPlaceCaractere(m_iLigne, m_iColonne, ' ');
	  m_iColonne++;
	  if (m_iColonne==m_iNbColonnes)
	  {
		m_iColonne=0;
		m_iLigne++;
		if (m_iLigne==m_iNbLignes)
		{ m_iLigne = m_iNbLignes-1;
		  DoScroll(1);
		}
		goto fintab;
	  }
	  iColFin = m_iColonne;
	} while (m_iColonne%8);

fintab:
	if (bModif)
	  ZoneAReafficher(iLigStart, iColStart, iLigStart, iColFin);
	m_Hint.iCurseurDeplace = 1;
	return;
  }

  if (c=='\a')		  // Alert
  {
	Beep(0,0);
	return;
  }

  if (c=='\14')		  // ^L, effacement
  {
	int lig, col;

	for (lig=0 ; lig<m_iNbLignes ; lig++)
	  for (col=0 ; col<m_iNbColonnes ; col++)
		bPlaceCaractere(lig, col, ' ');
	ZoneAReafficher(0, 0, m_iNbLignes-1, m_iNbColonnes-1);
	if (m_iLigne || m_iColonne)
	{
	  m_iLigne = 0;
	  m_iColonne = 0;
	  m_Hint.iCurseurDeplace = 1;
	}
	return;
  }

  if (c=='\n')
  {
	m_iLigne++;
	if (m_iLigne==m_iNbLignes)
	{
	  m_iLigne = m_iNbLignes-1;
	  DoScroll(1);
	}
	m_Hint.iCurseurDeplace = 1;
	return;
  }

  // Les caractères <32 ne sont normalement pas affichés (sauf §)...
  if (c<32) return;

AffichageCaractereNormal:
  // Caractère normal

  // Elimination éventuelle des caractères 128 en double (bug telnetd)
  if (c==128 && (iOptions & OPT_128128)==0)
  {
	if (m_cLastChar==128)
	{ m_cLastChar=0;
	  return;
	}
  }
  m_cLastChar = c;

  if (bPlaceCaractere(m_iLigne, m_iColonne, c))
	ZoneAReafficher(m_iLigne, m_iColonne, m_iLigne, m_iColonne);
  AvanceCurseur();
}


// Place "physiquement" un caractère dans la mémoire écran du terminal
// Retour TRUE si cela a modifié l'écran
BOOL Terminal::bPlaceCaractere(int iLig, int iCol, int c)
{
  Cellule cel;
  
  ASSERT(iLig>=0 && iLig<m_iNbLignes && iCol>=0 && iCol<m_iNbColonnes);

  cel.caractere = c;
  cel.attribut = m_iAttribut;

  if (m_iAttribut&AT_INVERSE)
  {
	cel.cCar = m_iReverseFore;
	cel.cFond = m_iReverseBack;
  }
  else if (m_iFont==2) // || (c>=179 && c<=218))
  {
	cel.cCar = m_iGraphicFore;
	cel.cFond = m_iGraphicBack;
  }
  else
  {
	cel.cCar = m_iNormalFore;
	cel.cFond = m_iNormalBack;
  }
  /*
  if (m_iAttribut&AT_INVERSE)
  {
	int coulTemp = cel.cFond;
	cel.cFond = cel.cCar;
	cel.cCar = coulTemp;
  }
  */

  // L'optimisation qui suit évite de mettre à jour l'écran si on affiche un caractère déjà affiché.
  // En principe judicieux, mais diminue les performances l'algorithme d'optimisation TextOut !!!
  // Il vaut mieux faire un seul TextOut, quitte à afficher quelques caractères en trop
  // que faire plusieurs appels à TextOut !

  /*
  if (m_celEcran[iLig][iCol] == cel)
	return FALSE;
  */

  m_celEcran[iLig][iCol] = cel;
  return TRUE;
}


void Terminal::AvanceCurseur()
{
  m_Hint.iCurseurDeplace = 1;

  if (m_iColonne<m_iNbColonnes-1)
	++m_iColonne;
  else
  {
	if (m_bAutoWrap)
	{
	  m_iColonne = 0;
	  m_iLigne++;
	  if (m_iLigne==m_iNbLignes)
	  {
		m_iLigne = m_iNbLignes-1;
		DoScroll(1);
	  }
	}
  }
}



// Effectue un scroll vertical du terminal
void Terminal::DoScroll(int iNbLig)
{
  int lig = 0;
  int col;

  /*
  // On précise dans le Hint qu'il s'agit d'un scroll pour optimiser l'affichage
  m_Hint.iScroll = iNbLig;
  */

  while (lig<m_iNbLignes-iNbLig)
  {
	for (col=0 ; col<m_iNbColonnes ; col++)
	  m_celEcran[lig][col] = m_celEcran[lig+iNbLig][col];
	lig++;
  }
  while (lig<m_iNbLignes)
  {
	for (col=0 ; col<m_iNbColonnes ; col++)
	  bPlaceCaractere(lig, col, ' ');
	lig++;
  }


  ZoneAReafficher(0, 0, m_iNbLignes-1, m_iNbColonnes-1);

  /*
  // On translate la zone à réafficher
  if (m_Hint.bZoneAReafficher)
  {
	m_Hint.iReaffDLigne -= iNbLig;
	m_Hint.iReaffFLigne -= iNbLig;
	if (m_Hint.iReaffFLigne<0)
	  m_Hint.bZoneAReafficher = FALSE;
    else
	  if (m_Hint.iReaffDLigne<0) m_Hint.iReaffDLigne = 0;
  }
  */
}


/////////////////////////////////////////////////////////////////////////////////
// Fonctions de décodage clavier
// Retournent une chaîne à envoyer au host sur les codes
// transmis par WM_KEYDOWN (szDecodeClavierKeyDown) et WM_CHAR (szDecodeClavierChar)
// Retour NULL si il n'y a pas lieu de transmettre des infos au host.
// Prend en charge la conversion ANSI->OEM le cas échéant

char *Terminal::szDecodeClavierChar(UINT nChar)
{
  static char szBufferANSI[2] = "x";	// 2ème caractère à \0 c'est ce qui compte
  static char szBufferOEM[2] = "x";

  if (m_bClavierBloque) return NULL;

  // Les caractères backspace(8) et tab(9) sont traités par szDecodeClavierKeyDown
  if (nChar!=8 && nChar!=9 && nChar!=0x1b)
  {
	szBufferANSI[0] = nChar;
	if (iOptions & OPT_ANSI)
	  return szBufferANSI;
	else
	{
	  CharToOem(szBufferANSI, szBufferOEM);
	  return szBufferOEM;
	}
  }

  return NULL;
}

// Table de codage des touches clavier
static struct
{
  UINT	nKeyCode;
  UINT	nShift;		  // 1=Shift  2=Ctrl  4=Alt
  char	*szSequence;
} tKeyCode[] =
{
  VK_UP,	  0,	"\033[A",
  VK_DOWN,	  0,	"\033[B",
  VK_LEFT,	  0,	"\033[D",
  VK_RIGHT,	  0,	"\033[C",
  VK_NEXT,	  0,	"\033[G",
  VK_PRIOR,	  0,	"\033[I",
  VK_HOME,	  0,	"\033[H",
  VK_END,	  0,	"\033[F",
  VK_INSERT,  0,	"\033[L",
  VK_DELETE,  0,    "\x7f",
  // Tab et backspace qui génèrent des codes différents en combinaison avec Maj
  // et Ctrl sont traités ici
  VK_TAB,	  0,	"\011",
  VK_TAB,	  1,	"\033[Z",
  VK_BACK,	  0,	"\010",
  VK_BACK,	  2,	"\x7f",

  VK_ESCAPE,  0,	"\x1b",	  // Windows 95 envoie un WM_CHAP pour Echap uniquement si le clavier n'est pas en majuscules, donc on le traite par KeyDown

  VK_F1,	  0,    "\033[M",
  VK_F2,	  0,    "\033[N",
  VK_F3,	  0,    "\033[O",
  VK_F4,	  0,    "\033[P",
  VK_F5,	  0,    "\033[Q",
  VK_F6,	  0,    "\033[R",
  VK_F7,	  0,    "\033[S",
  VK_F8,	  0,    "\033[T",
  VK_F9,	  0,    "\033[U",
  VK_F10,	  0,    "\033[V",
  VK_F11,	  0,    "\033[W",
//  VK_F12,	  0,    "\033[X",	  // Réservé pour l'émulateur (fenêtre suivante)

  VK_F1,	  1,    "\033[Y",
  VK_F2,	  1,    "\033[Z",
  VK_F3,	  1,    "\033[a",
  VK_F4,	  1,    "\033[b",
  VK_F5,	  1,    "\033[c",
  VK_F6,	  1,    "\033[d",
  VK_F7,	  1,    "\033[e",
  VK_F8,	  1,    "\033[f",
  VK_F9,	  1,    "\033[g",
  VK_F10,	  1,    "\033[h",
  VK_F11,	  1,    "\033[i",
//  VK_F12,	  1,    "\033[j",	  // Réservé pour l'émulateur (nouvelle connexion)

  VK_F1,	  2,    "\033[k",
  VK_F2,	  2,    "\033[l",
  VK_F3,	  2,    "\033[m",
  VK_F4,	  2,    "\033[n",
  VK_F5,	  2,    "\033[o",
  VK_F6,	  2,    "\033[p",
  VK_F7,	  2,    "\033[q",
  VK_F8,	  2,    "\033[r",
  VK_F9,	  2,    "\033[s",
  VK_F10,	  2,    "\033[t",
  VK_F11,	  2,    "\033[u",
//  VK_F12,	  2,    "\033[v",

  0
};


char *Terminal::szDecodeClavierKeyDown(UINT nKeyCode, UINT nShift)
{
  int i;

  if (m_bClavierBloque) return NULL;

  for (i=0 ; tKeyCode[i].nKeyCode ; i++)
	if (tKeyCode[i].nKeyCode==nKeyCode && tKeyCode[i].nShift==nShift)
	  return tKeyCode[i].szSequence;
  // Pas besoin de prévoir des conversions ANSI-OEM puisqu'il n'y a que des
  // caractères 7 bits dans les séquences produites

  return NULL;
}


