// sgbddoc.h : interface of the CSgbdDoc class
//
/////////////////////////////////////////////////////////////////////////////

class CSgbdDoc : public CDocument
{
protected: // create from serialization only
	CSgbdDoc();
	DECLARE_DYNCREATE(CSgbdDoc)

// Attributes
public:
	CSgbdSet m_sgbdSet;

// Operations
public:

// Implementation
public:
	virtual ~CSgbdDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	virtual BOOL OnNewDocument();

// Generated message map functions
protected:
	//{{AFX_MSG(CSgbdDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
