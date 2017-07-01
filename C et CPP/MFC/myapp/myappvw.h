// myappvw.h : interface of the CMyappView class
//
/////////////////////////////////////////////////////////////////////////////

class CMyappView : public CView
{
protected: // create from serialization only
	CMyappView();
	DECLARE_DYNCREATE(CMyappView)

// Attributes
public:
	CMyappDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMyappView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CMyappView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CMyappView)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in myappvw.cpp
inline CMyappDoc* CMyappView::GetDocument()
   { return (CMyappDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////
