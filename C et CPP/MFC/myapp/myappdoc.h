// myappdoc.h : interface of the CMyappDoc class
//
/////////////////////////////////////////////////////////////////////////////

class CMyappDoc : public CDocument
{
protected: // create from serialization only
	CMyappDoc();
	DECLARE_DYNCREATE(CMyappDoc)

// Attributes
public:
	CString m_strData;		// Add for tutorial

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMyappDoc)
	public:
	virtual BOOL OnNewDocument();
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CMyappDoc();
	virtual void Serialize(CArchive& ar);   // overridden for document i/o
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CMyappDoc)
	afx_msg void OnEditChangeText();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
