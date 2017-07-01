// totoview.cpp : implementation of the CTotoView class
//

#include "stdafx.h"
#include "toto.h"

#include "totodoc.h"
#include "totoview.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTotoView

IMPLEMENT_DYNCREATE(CTotoView, CView)

BEGIN_MESSAGE_MAP(CTotoView, CView)
	//{{AFX_MSG_MAP(CTotoView)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTotoView construction/destruction

CTotoView::CTotoView()
{
	// TODO: add construction code here

}

CTotoView::~CTotoView()
{
}

/////////////////////////////////////////////////////////////////////////////
// CTotoView drawing

void CTotoView::OnDraw(CDC* pDC)
{
	CTotoDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CTotoView printing

BOOL CTotoView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CTotoView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CTotoView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CTotoView diagnostics

#ifdef _DEBUG
void CTotoView::AssertValid() const
{
	CView::AssertValid();
}

void CTotoView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CTotoDoc* CTotoView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CTotoDoc)));
	return (CTotoDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CTotoView message handlers
