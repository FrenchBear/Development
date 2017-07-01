// VTermView.h : interface of the CVTermView class
// 30/04/96 PV
// 29/11/98 PV	Gestion de l'attribut AT_POLICEOEM

#ifdef FTRACE
#include <fstream.h>	  // Pour les traces
#endif

/////////////////////////////////////////////////////////////////////////////
class CVTermView : public CView
{
private:
	int m_iNumeroVue;	  // Numérotation interne des vues...

protected: // create from serialization only
	afx_msg void OnContextMenu(CWnd*, CPoint point);
	CVTermView();
	DECLARE_DYNCREATE(CVTermView)

// Attributes
public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	int		m_x, m_y;			  // Taille de la fenêtre
	int		m_cx, m_cy;			  // Taille d'une cellule
	CFont	*m_tpFont[16];		  // Bits: gras, souligné, italique(clignotant), OEM

// Caret
    BOOL	m_bCaretActif;		  // La vue a le focus
	CBitmap	*m_bmpCaret;

#ifdef FTRACE
	ofstream m_stTrace;
#endif

// OnUpdate Optimisation (OUO)
	BOOL    m_bOUO;
	int		m_iOUOLig;
	int		m_iOUOCol;
	int		m_iOUOLen;

// Statistiques
	int		m_iBufferStats[133];
	int		m_iNbOnUpdate;
	int		m_iNbOnUpdateCellule;
	int		m_iNbInvalidateRect;
	int		m_iNbOnDraw;
	int		m_iNbDessineCellule;
	int		m_iNbTextOut;

private:
// TextOut Optimisation (TOO)
	int		m_iTOOCurrentFont;
	UCHAR	m_cTOOCurrentCCar;
	UCHAR	m_cTOOCurrentCFond;

// Buffer d'optimisation des appels à TextOut
	BOOL	m_bBufferEnCours;
	char	m_cBufferCCar;
	char	m_cBufferCFond;
	int		m_iBufferFont;
	int		m_iBufferLig;
	int		m_iBufferCol;
	int		m_iBufferLen;
	int		m_iBufferLenDiff;
	char	m_sBuffer[80];
// Optimisation de DessineCellule
	Cellule	m_ActualScreen[43][132];	// Taille max

// Sélection
	BOOL	m_bSelectionDessinee;
	int		m_iSSLig, m_iSSCol;	  // Début de la sélection
	int		m_iSELig, m_iSECol;	  // Fin de la sélection

// Mécanisme de UpdateWindow périodique
	int		m_iLastLine;		  // Dernière ligne mise à jour
	int		m_iLastCol;
	int		m_iSuiviUpdate;

// ...
	char	*m_szFont[31];		  // Nom de la police utilisée

// Région pour le OnPaint
	HRGN	m_hRgn;

private:
	void OnDrawRect(CDC* pDC, RECT *pr, CVTermDoc* pDoc);
	void ChoisitPoliceDeBase();
	void GenereCaret(CDC *pDC);
	void DetruitPolices();
	void DessineCellule(CDC* pDC, Cellule cel, int l, int c);
	void inline OnUpdateCellule(int iLig, int iCol);
	void TOOFlush(CDC* pDC);
	void OUOFlush();
	void DessineSelection(CDC* pDC);
	void EditCopy(BOOLEAN bCopieRectangle);

// Operations
public:
	CVTermDoc* GetDocument();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CVTermView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	protected:
	virtual void OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CVTermView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CVTermView)
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnChar(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnSetFocus(CWnd* pOldWnd);
	afx_msg void OnKillFocus(CWnd* pNewWnd);
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnStats();
	afx_msg void OnPaint();
	afx_msg void OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnEditCopy();
	afx_msg void OnEditPaste();
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg void OnEditCopyRect();
	afx_msg void OnEditCopyPaste();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in mfcsovw.cpp
inline CVTermDoc* CVTermView::GetDocument()
   { return (CVTermDoc*)m_pDocument; }
#endif

