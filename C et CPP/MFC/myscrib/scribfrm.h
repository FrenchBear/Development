// scribfrm.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CScribFrame frame with splitter

#ifndef __AFXEXT_H__
#include <afxext.h>
#endif

class CScribFrame : public CMDIChildWnd
{
	DECLARE_DYNCREATE(CScribFrame)
protected:
	CScribFrame();           // protected constructor used by dynamic creation

// Attributes
protected:
	CSplitterWnd    m_wndSplitter;
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CScribFrame)
	protected:
	virtual BOOL OnCreateClient(LPCREATESTRUCT lpcs, CCreateContext* pContext);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CScribFrame();

	// Generated message map functions
	//{{AFX_MSG(CScribFrame)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////
