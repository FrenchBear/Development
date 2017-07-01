// sgbdview.h : interface of the CSgbdView class
//
/////////////////////////////////////////////////////////////////////////////

class CSgbdSet;

class CSgbdView : public CRecordView
{
protected: // create from serialization only
	CSgbdView();
	DECLARE_DYNCREATE(CSgbdView)

public:
	//{{AFX_DATA(CSgbdView)
	enum { IDD = IDD_SGBD_FORM };
	CButton	m_Ok;
	CSgbdSet* m_pSet;
	//}}AFX_DATA

// Attributes
public:
	CSgbdDoc* GetDocument();

// Operations
public:
	virtual CRecordset* OnGetRecordset();

// Implementation
public:
	virtual ~CSgbdView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual void OnInitialUpdate(); // called first time after construct

// Generated message map functions
protected:
	//{{AFX_MSG(CSgbdView)
	afx_msg void OnButton1();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in sgbdview.cpp
inline CSgbdDoc* CSgbdView::GetDocument()
   { return (CSgbdDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////
