// totoview.h : interface of the CTotoView class
//
/////////////////////////////////////////////////////////////////////////////

class CTotoView : public CView
{
protected: // create from serialization only
	CTotoView();
	DECLARE_DYNCREATE(CTotoView)

// Attributes
public:
	CTotoDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTotoView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CTotoView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CTotoView)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in totoview.cpp
inline CTotoDoc* CTotoView::GetDocument()
   { return (CTotoDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////
