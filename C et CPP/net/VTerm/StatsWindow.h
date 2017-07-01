// StatsWindow.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CStatsWindow dialog

class CStatsWindow : public CDialog
{
// Construction
public:
	CStatsWindow(CWnd* pParent = NULL);   // standard constructor
	CStatsWindow(CVTermView *pView, CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CStatsWindow)
	enum { IDD = IDD_STATS };
	CListBox	m_TextOutLenList;
	int		m_iLongMoy;
	int		m_iNbDessineCellule;
	int		m_iNbOnDraw;
	int		m_iNbInvalidateRect;
	int		m_iNbOnUpdate;
	int		m_iNbOnUpdateCellule;
	int		m_iNbTextOut;
	int		m_cx;
	int		m_cy;
	int		m_x;
	int		m_y;
	//}}AFX_DATA

private:
	CVTermView *m_pView;


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CStatsWindow)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CStatsWindow)
	virtual BOOL OnInitDialog();
	afx_msg void OnRAZStats();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};
