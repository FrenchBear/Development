// AboutVTerm.h : header file
// Interface de la boîte de dialogue
// 30/04/96 PV

/////////////////////////////////////////////////////////////////////////////
// CAboutWinsock dialog

class CAboutWinsock : public CDialog
{
// Construction
public:
	CAboutWinsock(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CAboutWinsock)
	enum { IDD = IDD_ABOUT_WINSOCK };
	CString	m_sSystemStatus;
	CString	m_sVersion;
	int		m_iMaxUDPdg;
	int		m_iMaxSockets;
	CString	m_sDescription;
	CString	m_sHighVersion;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutWinsock)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CAboutWinsock)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
