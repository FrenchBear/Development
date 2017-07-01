// myappvw.cpp : implementation of the CMyappView class
//

#include "stdafx.h"
#include "myapp.h"

#include "myappdoc.h"
#include "myappvw.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMyappView

IMPLEMENT_DYNCREATE(CMyappView, CView)

BEGIN_MESSAGE_MAP(CMyappView, CView)
	//{{AFX_MSG_MAP(CMyappView)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMyappView construction/destruction

CMyappView::CMyappView()
{
	// TODO: add construction code here

}

CMyappView::~CMyappView()
{
}

/////////////////////////////////////////////////////////////////////////////
// CMyappView drawing

void CMyappView::OnDraw(CDC* pDC)
{
	CMyappDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	// TODO: add draw code for native data here
	CRect rect; 
	GetClientRect(rect);
	pDC->SetTextAlign(TA_BASELINE | TA_CENTER);
	pDC->SetBkMode(TRANSPARENT);
	pDC->TextOut(rect.Width() / 2, rect.Height() / 2,	
		pDoc->m_strData, pDoc->m_strData.GetLength());


}

/////////////////////////////////////////////////////////////////////////////
// CMyappView printing

BOOL CMyappView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CMyappView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CMyappView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CMyappView diagnostics

#ifdef _DEBUG
void CMyappView::AssertValid() const
{
	CView::AssertValid();
}

void CMyappView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CMyappDoc* CMyappView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CMyappDoc)));
	return (CMyappDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMyappView message handlers
