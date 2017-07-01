// Options.h : header file
//  1/11/96 PV	Codage8
// 15/10/97 PV	b128128

/////////////////////////////////////////////////////////////////////////////
// COptions dialog

class COptions : public CDialog
{
// Construction
public:
	COptions(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(COptions)
	enum { IDD = IDD_OPTIONS };
	CButton	m_lblOEM;
	CButton	m_lblANSI;
	CEdit	m_txtAdresseClient;
	int		m_iCodage8;
	BOOL	m_bRenduBrillant;
	BOOL	m_bRenduGras;
	BOOL	m_bNoEscV;
	BOOL	m_bIdentificationManuelle;
	CString	m_sAdresseClient;
	BOOL	m_b128128;
	BOOL	m_bPointPN;
	int		m_iTailleDefaut;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(COptions)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(COptions)
	virtual BOOL OnInitDialog();
	afx_msg void OnIdentman();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
