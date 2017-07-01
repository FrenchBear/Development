// takview.cpp : implementation of the CTakView class
//

#include "stdafx.h"
#include "tak.h"

#include "takdoc.h"
#include "takview.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTakView

IMPLEMENT_DYNCREATE(CTakView, CView)

BEGIN_MESSAGE_MAP(CTakView, CView)
	//{{AFX_MSG_MAP(CTakView)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTakView construction/destruction

CTakView::CTakView()
{
	// TODO: add construction code here

}

CTakView::~CTakView()
{
}

/////////////////////////////////////////////////////////////////////////////
// CTakView drawing

void CTakView::OnDraw(CDC* pDC)
{
	CTakDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CTakView printing

BOOL CTakView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CTakView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CTakView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CTakView diagnostics

#ifdef _DEBUG
void CTakView::AssertValid() const
{
	CView::AssertValid();
}

void CTakView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CTakDoc* CTakView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CTakDoc)));
	return (CTakDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CTakView message handlers
