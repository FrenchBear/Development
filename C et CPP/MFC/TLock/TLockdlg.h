// TLockdlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTLockDlg dialog

class CTLockDlg : public CDialog
{
// Construction
public:
	CTLockDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CTLockDlg)
	enum { IDD = IDD_TLOCK_DIALOG };
	CButton	m_btnOpenWO;
	CButton	m_btnOpenRO;
	CButton	m_btnWrite;
	CButton	m_btnRead;
	CButton	m_btnUnlock;
	CButton	m_btnLock;
	CButton	m_btnClose;
	CButton	m_btnOpen;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTLockDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation

protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CTLockDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnOpen();
	afx_msg void OnClose();
	afx_msg void OnLock();
	afx_msg void OnRead();
	afx_msg void OnUnlock();
	afx_msg void OnWrite();
	virtual void OnOK();
	afx_msg void OnOpenRO();
	afx_msg void OnOpenWO();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
