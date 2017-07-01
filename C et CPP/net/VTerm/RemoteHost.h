// RemoteHost.h : header file
// 30/04/96 PV
//  1/11/00 PV	6 -> 9 hosts


/////////////////////////////////////////////////////////////////////////////
// CRemoteHost dialog

class CRemoteHost : public CDialog
{
private:
  int m_iHauteurOriginale;

// Construction
public:
	CRemoteHost(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CRemoteHost)
	enum { IDD = IDD_REMOTE_HOST };
	CButton	m_Host9;
	CButton	m_Host8;
	CButton	m_Host7;
	CStatic	m_NoRecent;
	CButton	m_chkAutoLogin;
	CButton	m_Avance;
	CEdit	m_txtTerminal;
	CEdit	m_txtPassword;
	CEdit	m_txtLogin;
	CButton	m_Host6;
	CButton	m_Host5;
	CButton	m_Host4;
	CButton	m_Host3;
	CButton	m_Host2;
	CButton	m_Host1;
	CString	m_sHost;
	CString	m_sLogin;
	CString	m_sPassword;
	CString	m_sTerminal;
	BOOL	m_bAutoLogin;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRemoteHost)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CRemoteHost)
	virtual BOOL OnInitDialog();
	afx_msg void OnHost1();
	afx_msg void OnHost2();
	afx_msg void OnHost3();
	afx_msg void OnHost4();
	afx_msg void OnHost5();
	afx_msg void OnHost6();
	afx_msg void OnAutologin();
	afx_msg void OnAvance();
	afx_msg void OnClearRecent();
	afx_msg void OnHost7();
	afx_msg void OnHost8();
	afx_msg void OnHost9();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
  void DoHost(int iHost);
};
