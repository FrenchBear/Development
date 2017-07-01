// VTermDoc.h : interface of the CVTermDoc class
// 30/04/96 PV
// 29/07/96 PV	m_iPort

/////////////////////////////////////////////////////////////////////////////
#include "terminal.h"

class CVTermDoc : public CDocument
{
protected: // create from serialization only
	CVTermDoc();
	DECLARE_DYNCREATE(CVTermDoc)

// Attributes
public:
	Terminal	m_Term;				// Terminal émulé
	CString		m_sHost;			// Nom du host avec qui on communique
	UINT		m_iPort;			// 23 pour telnet
	CString		m_sHostAddr;		// Adresse du host avec qui on communique
	int			m_iTelnetState;
	BOOL		m_bEchoLocal;

// Protocole TELNET
	BOOL		m_bModeEcho;		// Echo des caractères transmis par le host au host

private:
// Communication avec le host
	CVTermSocket* m_pSocket;		// NULL en mode déconnecté
	CBufferGlissant m_BufferGlissant;

// Connexion auto
	BOOL		m_bAutoLogin;
	CString		m_sLogin;
	CString		m_sPassword;
	CString		m_sTerminal;

// Interface publique -----------------------------------------------------
public:
// Operations d'affichage
	void DoCaractere(char c);
	void DoChaine(char *s, int iLg) { while (iLg--) 
		DoCaractere(*s++);
	}
	void DoSync();

// Opérations de communication avec le host
	void EnvoieCaractereHost(char c);
	void EnvoieChaineHost(const char *s, int iLg, BOOL bEchoTerminal=FALSE);
	void Deconnexion();
// -------------------------------------------------------------------------

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CVTermDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual BOOL OnOpenDocument(LPCTSTR lpszPathName);
	protected:
	virtual BOOL SaveModified();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CVTermDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CVTermDoc)
	afx_msg void OnFileClose();
	afx_msg void OnUpdateFileClose(CCmdUI* pCmdUI);
	afx_msg void OnTestMire();
	afx_msg void OnTestPerformances();
	afx_msg void OnTestDefilement();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
// Envoi de données au terminal
  void DoCaractereTerm(char c);
  void DoChaineTerm(const char *s) { while (*s) DoCaractereTerm(*s++); }
  void SynchroCurseurTerm();

  BOOL bDemandeDeConnexion();

  void TestFichier(char *szNomfic);

// Décodage du protocole Telnet
  void EnvoieNegociation(unsigned char cCmd, unsigned char cOpt);
  void DoCaractereNegociation(unsigned char cOpt);
  void DoCaractereIAC(char c);
  void DoCaractereSB(char c);
  void DoCaractereSBTType(char c);

};

/////////////////////////////////////////////////////////////////////////////
