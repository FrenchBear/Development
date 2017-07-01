// scribvw.cpp : implementation of the CScribView class
//

#include "stdafx.h"
#include "scribble.h"

#include "scribdoc.h"
#include "scribvw.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CScribView

IMPLEMENT_DYNCREATE(CScribView, CScrollView)

BEGIN_MESSAGE_MAP(CScribView, CScrollView)
	//{{AFX_MSG_MAP(CScribView)
	ON_WM_LBUTTONDOWN()
	ON_WM_LBUTTONUP()
	ON_WM_MOUSEMOVE()
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CScribView construction/destruction

CScribView::CScribView()
{
	// TODO: add construction code here

}

CScribView::~CScribView()
{
}

/////////////////////////////////////////////////////////////////////////////
// CScribView drawing

void CScribView::OnDraw(CDC* pDC)
{
	CScribDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	// Get the invalidated rectangle of the view, or in the case
	// of printing, the clipping region of the printer dc.
	CRect rectClip;
	CRect rectStroke;
	pDC->GetClipBox(&rectClip);
	pDC->LPtoDP(&rectClip);
	
	//Note: CScrollView::OnPaint() will have already adjusted the
	//viewpoint origin before calling OnDraw(), to reflect the
	//currently scrolled position.

	// The view delegates the drawing of individual strokes to
	// CStroke::DrawStroke( ).
	CTypedPtrList<CObList, CStroke*>& strokeList = pDoc->m_strokeList;
	POSITION pos = strokeList.GetHeadPosition( );
	while (pos != NULL)
	{
		CStroke* pStroke = strokeList.GetNext(pos);
		rectStroke = pStroke->GetBoundingRect();
		pDC->LPtoDP(&rectStroke);
		if (!rectStroke.IntersectRect(&rectStroke, &rectClip))
			continue;
		pStroke->DrawStroke( pDC );
	}
}

/////////////////////////////////////////////////////////////////////////////
// CScribView printing

BOOL CScribView::OnPreparePrinting(CPrintInfo* pInfo)
{
	pInfo->SetMaxPage(2);	// the document is two pages long:
							// the first page is the title page
							// the second page is the drawing 

	BOOL bRet = DoPreparePrinting (pInfo);	// default preparation
	pInfo->m_nNumPreviewPages = 2;			//Preview 2 pages at a time
	// Set this value after calling DoPreparePrinting to override
	// value read from .INI file
	return bRet;
}

void CScribView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CScribView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CScribView diagnostics

#ifdef _DEBUG
void CScribView::AssertValid() const
{
	CScrollView::AssertValid();
}

void CScribView::Dump(CDumpContext& dc) const
{
	CScrollView::Dump(dc);
}

CScribDoc* CScribView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CScribDoc)));
	return (CScribDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CScribView message handlers

void CScribView::OnLButtonDown(UINT /* nFlags */, CPoint point) 
{
	// When the user presses the mouse button, she may be
	// starting a new stroke, or selecting or de-selecting a 
	// stroke.

	// CScrollView changes the viewport origin and mapping mode.
	// It's necessary to convert the point from device coordinates
	// to logical coordinates, such as are stored in the document.
	CClientDC dc(this);
	OnPrepareDC(&dc);
	dc.DPtoLP(&point);

	m_pStrokeCur = GetDocument( )->NewStroke( );
	// Add first point to the new stroke
	m_pStrokeCur->m_pointArray.Add(point); 
	
	SetCapture( );  	// Capture the mouse until button up
	m_ptPrev = point;	// Serves as the MoveTo( ) anchor point 
						// for the LineTo() the next point, as 
						// the user drags the mouse
}

void CScribView::OnLButtonUp(UINT /* nFlags */, CPoint point) 
{
	// Mouse button up is interesting in the Scribble 
	// application only if the user is currently drawing a new 
	// stroke by dragging the captured mouse.
	
	if( GetCapture( ) != this )
		return;	// If this window (view) didn't capture the 
				// mouse, the user isn't drawing in this window.
	
	CScribDoc* pDoc = GetDocument( );
	
	CClientDC dc( this );

	// CScrollView changes the viewport origin and mapping mode.
	// It's necessary to convert the point from device coordinates
	// to logical coordinates, such as are stored in the document.
	OnPrepareDC(&dc);  // set up mapping mode and viewport origin
	dc.DPtoLP(&point);
	
	CPen* pOldPen = dc.SelectObject( pDoc->GetCurrentPen( ) );
	dc.MoveTo( m_ptPrev );

	dc.LineTo( point );
	dc.SelectObject( pOldPen );
	m_pStrokeCur->m_pointArray.Add(point);

	// Tell the stroke item that we're done adding points to it.
	// This is so it can finish computing its bounding rectangle.
	m_pStrokeCur->FinishStroke();  
	
	// Tell the other views that this stroke has been added
	// so that they can invalidate this stroke's area in their
	// client area.
	pDoc->UpdateAllViews(this, 0L, m_pStrokeCur);
	
	ReleaseCapture( );	// Release the mouse capture established 
						// at the beginning of the mouse drag.
}

void CScribView::OnMouseMove(UINT /* nFlags */, CPoint point) 
{
	// Mouse movement is interesting in the Scribble application
	// only if the user is currently drawing a new stroke by 
	// dragging the captured mouse.
	
	if( GetCapture( ) != this )
		return;		// If this window (view) didn't capture the 
					// mouse, the user isn't drawing in this window.
	
	CClientDC dc( this );

	// CScrollView changes the viewport origin and mapping mode.
	// It's necessary to convert the point from device coordinates
	// to logical coordinates, such as are stored in the document.
	OnPrepareDC(&dc);
	dc.DPtoLP(&point);
	
	m_pStrokeCur->m_pointArray.Add(point);
	
	// Draw a line from the previous detected point in the mouse
	// drag to the current point.
	CPen* pOldPen = dc.SelectObject( GetDocument( )->GetCurrentPen( ) );
	dc.MoveTo( m_ptPrev );
	dc.LineTo( point );
	dc.SelectObject( pOldPen );
	m_ptPrev = point;
}

void CScribView::OnUpdate(CView* pSender, LPARAM lHint, CObject* pHint) 
{
	// The document has informed this view that some data has changed.
	
	if (pHint != NULL)
	{
		if (pHint->IsKindOf(RUNTIME_CLASS(CStroke)))
		{
			// The hint is that a stroke has been added (or changed).
			// So, invalidate its rectangle.
			CStroke* pStroke = (CStroke*)pHint;

			CClientDC dc(this);
			OnPrepareDC(&dc);

			CRect rectInvalid = pStroke->GetBoundingRect();

			dc.LPtoDP(&rectInvalid);
			
			InvalidateRect(&rectInvalid);
			return;
		}

	}

	// We can't interpret the hint, so assume that anything might
	// have been updated.
	Invalidate();
}

void CScribView::OnInitialUpdate() 
{
	SetScrollSizes( MM_LOENGLISH, GetDocument()->GetDocSize() );
	CView::OnInitialUpdate();
}

void CScribView::OnPrint(CDC* pDC, CPrintInfo* pInfo) 
{
	if (pInfo->m_nCurPage == 1)	 // page no. 1 is the title page
	{
		PrintTitlePage(pDC, pInfo);
		return; // nothing else to print on page 1 but the page title
	}
	
	CString strHeader = GetDocument()->GetTitle();
	
	PrintPageHeader(pDC, pInfo, strHeader);
	// PrintPageHeader() subtracts out from the pInfo->m_rectDraw the
	// amount of the page used for the header.
	
	pDC->SetWindowOrg(pInfo->m_rectDraw.left,-pInfo->m_rectDraw.top);

	// Now print the rest of the page
	OnDraw(pDC);
}

void CScribView::PrintTitlePage(CDC* pDC, CPrintInfo* pInfo)
{
	// Prepare a font size for displaying the file name
	LOGFONT logFont;
	memset(&logFont, 0, sizeof(LOGFONT));
	logFont.lfHeight = 75;	//  3/4th inch high in MM_LOENGLISH 
							//  (1/100th inch)
	CFont font;
	CFont* pOldFont = NULL;
	if (font.CreateFontIndirect(&logFont))
		pOldFont = pDC->SelectObject(&font);

	// Get the file name, to be displayed on title page
	CString strPageTitle = GetDocument()->GetTitle();
	
	// Display the file name 1 inch below top of the page,
	// centered horizontally
	pDC->SetTextAlign(TA_CENTER);
	pDC->TextOut(pInfo->m_rectDraw.right/2, -100, strPageTitle);
	
	if (pOldFont != NULL)
		pDC->SelectObject(pOldFont);
}


void CScribView::PrintPageHeader(CDC* pDC, CPrintInfo* pInfo, CString& strHeader)
{
	// Print a page header consisting of the name of
	// the document and a horizontal line
	pDC->TextOut(0,-25, strHeader);  // 1/4 inch down
	
	// Draw a line across the page, below the header
	TEXTMETRIC textMetric;
	pDC->GetTextMetrics(&textMetric);
	int y = -35 - textMetric.tmHeight;		// line 1/10th in. 

// below text
	pDC->MoveTo(0, y);						// from left margin
	pDC->LineTo(pInfo->m_rectDraw.right, y); //  to right margin
	
	// Subtract from the drawing rectangle the space used by header.
	y -= 25; 	// space 1/4 inch below (top of) line
	pInfo->m_rectDraw.top += y;
}

