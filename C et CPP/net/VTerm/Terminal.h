// Terminal.h : header file
// Interface de la classe Terminal
// 30/04/96 PV
// 15/10/97 PV	Membre m_cLastChar pour traiter l'option b128128
//  7/12/98 PV	Attributs courants

// Une cellule de l'�cran: caract�re et attributs
struct Cellule
{
  unsigned char caractere;
  unsigned char attribut;
  unsigned char cCar;
  unsigned char cFond;

  BOOL operator ==(Cellule &c2)
  {
	return this->caractere==c2.caractere && this->attribut==c2.attribut &&
	  this->cCar==c2.cCar && this->cFond==c2.cFond;
  }
};

// R�capitule les changements effectu�s par le traitement du caract�re
class CHint : public CObject
{
protected:
  DECLARE_SERIAL(CHint)

public:
  BOOL	bResize;			// Vrai: reg�n�rer les polices, apr�s un changement du nb de colonnes par exemple
  BOOL	iCurseurDeplace;	// 1:Le curseur a boug�  2:Synchro position curseur demand�e
  BOOL	bZoneAReafficher;	// Vrai s'il y a une zone � r�afficher
  int	iScroll;			// Nb de lignes de scroll apr�s mise � jour de la zone � r�afficher

// Zone � r�afficher
  int	iReaffDLigne;
  int	iReaffDColonne;
  int	iReaffFLigne;
  int	iReaffFColonne;
};

// Flags du champ attribut
enum
{
  AT_NORMAL=0, AT_SOULIGNE=1, AT_BRILLANT=2, AT_CLIGNOTANT=4, AT_FONTOEM=8, AT_INVERSE=16, AT_INVISIBLE=32
};

// Etats de l'automage de d�codage des s�quences ANSI
enum
{
  ET_NORMAL, ET_ECHAP, ET_CROCHET, ET_CROCHETPARAM, ET_EGAL, ET_EGALPARAM, ET_INTERROGATION, ET_INTERROGATIONPARAM
};


class Terminal : public CDocument
{
private:
  BOOL		m_bClavierBloque;					  // On ignore les frappes clavier
  int		m_iLigneSauvee, m_iColonneSauvee;	  // Sauvegarde de la position du curseur
  int		m_tiPar[3];							  // Param�tres num�riques des s�quences ESC
  int		m_iNbPar;							  // Nb de param�tres de la s�quence ESC
  int		m_iEtat;							  // valeurs de l'enum plus haute. Pour le d�codage des s�quences ANSI
  BOOL		m_bAutoWrap;						  // Vrai si AutoWrap en cours
  int		m_iFont;							  // 0:Normal, 1:Car <32 visibles, 2:Affichage car+128
  unsigned char m_cLastChar;					  // Dernier caract�re affich�, pour l'option b128128

// Attributes
public:	  // Pour la mise au point
  Cellule	m_celEcran[43][132];				  // Image de l'�cran maximum
  int		m_iLigne, m_iColonne;				  // Position courante du curseur

  int		m_iNbLignes, m_iNbColonnes;			  // Taille de l'�cran

  int		m_iAttribut;						  // Attributs courants;
  int		m_iNormalFore;
  int		m_iNormalBack;
  int		m_iReverseFore;
  int		m_iReverseBack;
  int		m_iGraphicFore;
  int		m_iGraphicBack;

// Apres d�codage d'un caract�re
  CHint		m_Hint;								  // D�crit la zone � r�afficher
  CString	m_sTrans;							  // Vrai si r�sultat � transmettre au host
  BOOL		m_bATransmettre;					  // R�sultat � transmettre apres d�codage

private:
  int		m_iSaveAttribut;					  // Sauvegarde des attributs courants;
  int		m_iSaveNormalFore;
  int		m_iSaveNormalBack;
  int		m_iSaveReverseFore;
  int		m_iSaveReverseBack;
  int		m_iSaveGraphicFore;
  int		m_iSaveGraphicBack;

// M�thodes
public:
  Terminal();
  ~Terminal();

  // Sauvegarde des attributs courants
  void SaveExtendedAttributes();
  void RestoreExtendedAttributes();

  // Une seule fonction d'affichage
  void DoCaractere(unsigned char c);
  //void DoChaine(char *s) { while (*s) DoCaractere(*s++); }

  // bVueAMettreAJour() est vrai si le traitement du dernier cacart�re a entrain�
  // une modification d'affichage
  BOOL bVueAMettreAJour() { return m_Hint.bResize || m_Hint.iCurseurDeplace || m_Hint.bZoneAReafficher || m_Hint.iScroll; }

  // Fonctions de d�codage clavier 
  char *szDecodeClavierChar(UINT nChar);
  char *szDecodeClavierKeyDown(UINT nKeyCode, UINT nShift);

private:
  // Fonctions de d�codage des s�quences ANSI
  void DoCarPrefixe(unsigned char c);
  void DoCarEtatEchap(unsigned char c);
  void DoCarEtatCrochet(unsigned char c);
  void DoCarEtatEgal(unsigned char c);
  void DoCarEtatInterrogation(unsigned char c);

  // Acc�s � l'�cran
  BOOL bPlaceCaractere(int iLig, int iCol, int c);
  void AvanceCurseur();

  // Helpers
  void DoScroll(int iNbLig);
  void ZoneAReafficher(int iReaffDLigne, int iReaffDColonne, int iReaffFLigne, int iReaffFColonne)
	{ m_Hint.iReaffDLigne = iReaffDLigne; m_Hint.iReaffDColonne = iReaffDColonne; m_Hint.iReaffFLigne = iReaffFLigne; m_Hint.iReaffFColonne = iReaffFColonne;
	  m_Hint.bZoneAReafficher = TRUE;
    }
};
