// scribvw.h : interface of the CScribView class
//
/////////////////////////////////////////////////////////////////////////////

class CScribView : public CScrollView
{
protected: // create from serialization only
	CScribView();
	DECLARE_DYNCREATE(CScribView)

// Attributes
public:
	CScribDoc* GetDocument();

protected:
	CStroke*   m_pStrokeCur;	// The stroke in progress
	CPoint     m_ptPrev;		// The last mouse pt in the stroke 
								// in progress
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CScribView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual void OnInitialUpdate();
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint);
	virtual void OnPrint(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	void PrintTitlePage(CDC* pDC, CPrintInfo* pInfo);
	void PrintPageHeader(CDC* pDC, CPrintInfo* pInfo, CString& strHeader);

	virtual ~CScribView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CScribView)
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in scribvw.cpp
inline CScribDoc* CScribView::GetDocument()
   { return (CScribDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////
