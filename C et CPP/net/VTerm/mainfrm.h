// mainfrm.h : interface of the CMainFrame class
// 30/04/96 PV
// 29/07/96 PV	Implantation de SetStatus; Coordonnées curseur


class CMainFrame : public CMDIFrameWnd
{
	DECLARE_DYNAMIC(CMainFrame)
public:
	CMainFrame();

// Operations
public:
	void SetStatus(CString sMessage);

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMainFrame)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CMainFrame();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:  // control bar embedded members
	CStatusBar  m_wndStatusBar;
	CToolBar    m_wndToolBar;

// Generated message map functions
protected:
	//{{AFX_MSG(CMainFrame)
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnNextWindow();
	afx_msg void OnPolice();
	//}}AFX_MSG
	afx_msg void OnUpdateStatusConnexion(CCmdUI *pCmdUI);
	afx_msg void OnUpdateCoordonneesCurseur(CCmdUI *pCmdUI);
	afx_msg void OnUpdateCodage8Bits(CCmdUI *pCmdUI);
 
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
