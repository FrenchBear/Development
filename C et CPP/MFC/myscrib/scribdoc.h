// scribdoc.h : interface of the CScribDoc class
//
/////////////////////////////////////////////////////////////////////////////


// Forward declaration of data structure class
class CStroke;


class CScribDoc : public CDocument
{
protected: // create from serialization only
	CScribDoc();
	DECLARE_DYNCREATE(CScribDoc)

// Attributes
protected:
	// The document keeps track of the current pen width on 
	// behalf of all views. We'd like the user interface of 
	// Scribble to be such that if the user chooses the Draw  
	// Thick Line command, it will apply to all views, not just 
	// the view that currently has the focus.

	UINT    m_nPenWidth;		// current user-selected width
	BOOL    m_bThickPen;		// Thick currently selected or not
	UINT    m_nThinWidth;		// Current definition of thin
	UINT    m_nThickWidth;		// Current definition of thick
	CPen    m_penCur;			// pen created according to
								// user-selected pen style (width)
	DWORD	m_dwPenColor;		// Couleur du pinceau en RGB

public:
	CTypedPtrList<CObList, CStroke*> m_strokeList;
	CPen*   GetCurrentPen( ) { return &m_penCur; }

protected:
	CSize m_sizeDoc;
public:
	CSize GetDocSize() { return m_sizeDoc; }


// Operations
public:

CStroke* NewStroke( );


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CScribDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual BOOL OnOpenDocument(LPCTSTR lpszPathName);
	virtual void DeleteContents();
	//}}AFX_VIRTUAL

// Implementation
protected:
		void ReplacePen( );

public:
	virtual ~CScribDoc();
	virtual void Serialize(CArchive& ar);   // overridden for document i/o
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	void InitDocument( );


// Generated message map functions
protected:
	//{{AFX_MSG(CScribDoc)
	afx_msg void OnEditClearAll();
	afx_msg void OnPenThickOrThin();
	afx_msg void OnUpdateEditClearAll(CCmdUI* pCmdUI);
	afx_msg void OnUpdatePenThickOrThin(CCmdUI* pCmdUI);
	afx_msg void OnPenWidths();
	afx_msg void OnPenBlack();
	afx_msg void OnPenBlue();
	afx_msg void OnPenGreen();
	afx_msg void OnPenRed();
	afx_msg void OnUpdatePenBlack(CCmdUI* pCmdUI);
	afx_msg void OnUpdatePenBlue(CCmdUI* pCmdUI);
	afx_msg void OnUpdatePenGreen(CCmdUI* pCmdUI);
	afx_msg void OnUpdatePenRed(CCmdUI* pCmdUI);
	afx_msg void OnPenAutresCouleurs();
	afx_msg void OnUpdatePenAutresCouleurs(CCmdUI* pCmdUI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

class CStroke : public CObject
{
public:
	CStroke( UINT nPenWidth, DWORD dwPenColor );

protected:
	CStroke( );
	DECLARE_SERIAL( CStroke )

// Attributes
	UINT	m_nPenWidth;		// One width applies to entire stroke
	DWORD	m_dwPenColor;		// Couleur du pinceau en RGB
	CArray<CPoint, CPoint>   m_pointArray;  // Series of connected													// points
	CRect	m_rectBounding;		// smallest rect that surrounds all
								// of the points in the stroke
public:
	CRect& GetBoundingRect() { return m_rectBounding; }

// Operations
public:
	BOOL DrawStroke( CDC* pDC );
	void FinishStroke();


public:
	virtual void Serialize( CArchive& ar );
};

