// Couleurs.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Bouton en couleur00

class CColorButton : public CButton
{
protected:
	COLORREF m_Color;

public:
	CColorButton();
	void SetColor(COLORREF color);
	virtual void DrawItem(LPDRAWITEMSTRUCT lpDIS);
};



/////////////////////////////////////////////////////////////////////////////
// CCouleurs dialog

class CCouleurs : public CDialog
{
public:
  CColorButton m_bcNoir,	m_bcNoirBrillant;
  CColorButton m_bcBleu,	m_bcBleuBrillant;
  CColorButton m_bcVert,	m_bcVertBrillant;
  CColorButton m_bcCyan,	m_bcCyanBrillant;
  CColorButton m_bcRouge,	m_bcRougeBrillant;
  CColorButton m_bcMagenta, m_bcMagentaBrillant;
  CColorButton m_bcJaune,	m_bcJauneBrillant;
  CColorButton m_bcBlanc,	m_bcBlancBrillant;

// Construction
public:
	CCouleurs(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CCouleurs)
	enum { IDD = IDD_COULEURS };
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCouleurs)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CCouleurs)
	virtual BOOL OnInitDialog();
	virtual void OnOK();
	afx_msg void OnRestaurer();
	afx_msg void OnBCBlanc();
	afx_msg void OnBCBlancBrillant();
	afx_msg void OnBCBleu();
	afx_msg void OnBCBleuBrillant();
	afx_msg void OnBCCyan();
	afx_msg void OnBCCyanBrillant();
	afx_msg void OnBCJaune();
	afx_msg void OnBCJauneBrillant();
	afx_msg void OnBCMagenta();
	afx_msg void OnBCMagentaBrillant();
	afx_msg void OnBCNoir();
	afx_msg void OnBCNoirBrillant();
	afx_msg void OnBCRouge();
	afx_msg void OnBCRougeBrillant();
	afx_msg void OnBCVert();
	afx_msg void OnBCVertBrillant();
	virtual void OnCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
