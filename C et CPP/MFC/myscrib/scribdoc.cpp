// scribdoc.cpp : implementation of the CScribDoc class
//

#include "stdafx.h"
#include "scribble.h"
#include "scribdoc.h"
#include "pendlg.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CScribDoc

IMPLEMENT_DYNCREATE(CScribDoc, CDocument)

BEGIN_MESSAGE_MAP(CScribDoc, CDocument)
	//{{AFX_MSG_MAP(CScribDoc)
	ON_COMMAND(ID_EDIT_CLEAR_ALL, OnEditClearAll)
	ON_COMMAND(ID_PEN_THICK_OR_THIN, OnPenThickOrThin)
	ON_UPDATE_COMMAND_UI(ID_EDIT_CLEAR_ALL, OnUpdateEditClearAll)
	ON_UPDATE_COMMAND_UI(ID_PEN_THICK_OR_THIN, OnUpdatePenThickOrThin)
	ON_COMMAND(ID_PEN_WIDTHS, OnPenWidths)
	ON_COMMAND(ID_PEN_BLACK, OnPenBlack)
	ON_COMMAND(ID_PEN_BLUE, OnPenBlue)
	ON_COMMAND(ID_PEN_GREEN, OnPenGreen)
	ON_COMMAND(ID_PEN_RED, OnPenRed)
	ON_UPDATE_COMMAND_UI(ID_PEN_BLACK, OnUpdatePenBlack)
	ON_UPDATE_COMMAND_UI(ID_PEN_BLUE, OnUpdatePenBlue)
	ON_UPDATE_COMMAND_UI(ID_PEN_GREEN, OnUpdatePenGreen)
	ON_UPDATE_COMMAND_UI(ID_PEN_RED, OnUpdatePenRed)
	ON_COMMAND(ID_PEN_AUTRES_COULEURS, OnPenAutresCouleurs)
	ON_UPDATE_COMMAND_UI(ID_PEN_AUTRES_COULEURS, OnUpdatePenAutresCouleurs)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CScribDoc construction/destruction

CScribDoc::CScribDoc()
{
	// TODO: add one-time construction code here

}

CScribDoc::~CScribDoc()
{
}

BOOL CScribDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	InitDocument( );

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CScribDoc serialization

void CScribDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		ar << m_sizeDoc;
	}
	else
	{
		ar >> m_sizeDoc;
	}
	m_strokeList.Serialize( ar );
}


BOOL CStroke::DrawStroke( CDC* pDC )
{
	CPen penStroke;
	if( !penStroke.CreatePen(PS_SOLID, m_nPenWidth, m_dwPenColor)) 
		return FALSE;
	CPen* pOldPen = pDC->SelectObject( &penStroke );
	pDC->MoveTo( m_pointArray[0] );
	for( int i=1; i < m_pointArray.GetSize(); i++ )
	{
		pDC->LineTo( m_pointArray[i] );
	}
	pDC->SelectObject( pOldPen );

	return TRUE;
}


/////////////////////////////////////////////////////////////////////////////
// CScribDoc diagnostics

#ifdef _DEBUG
void CScribDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CScribDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CScribDoc commands

BOOL CScribDoc::OnOpenDocument(LPCTSTR lpszPathName) 
{
	if (!CDocument::OnOpenDocument(lpszPathName))
		return FALSE;
	
	InitDocument( );

	return TRUE;
}

void CScribDoc::DeleteContents() 
{
	while( !m_strokeList.IsEmpty( ) )
	{
		delete m_strokeList.RemoveHead( );
	}
	
	CDocument::DeleteContents();
}

void CScribDoc::InitDocument( )
{
	m_bThickPen = FALSE;
	m_nThinWidth = 2;     // Default thin pen is 2 pixels wide
	m_nThickWidth = 5;    // Default thick pen is 5 pixels wide
	m_dwPenColor = RGB(0,0,0);	// Noir
	ReplacePen();		  // Initialize pen according to current width

	// default document size is 800 x 900 screen pixels
	m_sizeDoc = CSize(800,900);
}

CStroke* CScribDoc::NewStroke( )
{
	CStroke* pStrokeItem = new CStroke(m_nPenWidth, m_dwPenColor);
	m_strokeList.AddTail( pStrokeItem );
	SetModifiedFlag( );	// Mark document as modified 
						// to confirm File Close.
	return pStrokeItem;
}


CStroke::CStroke()
{
	// This empty constructor should be used by serialization only
}

CStroke::CStroke(UINT nPenWidth, DWORD dwPenColor)
{
	m_nPenWidth = nPenWidth;
	m_dwPenColor = dwPenColor;
	m_rectBounding.SetRectEmpty();
}


void CStroke::Serialize( CArchive& ar )
{
	if( ar.IsStoring( ) )
	{
		ar << m_rectBounding;
		ar << (WORD)m_nPenWidth;
		ar << m_dwPenColor;
		m_pointArray.Serialize( ar );
	}
	else
	{
		ar >> m_rectBounding;
		WORD w;
		ar >> w;
		m_nPenWidth = w;
		ar >> m_dwPenColor;
		m_pointArray.Serialize( ar );
	}
}


IMPLEMENT_SERIAL( CStroke, CObject, 4 )


void CScribDoc::OnEditClearAll() 
{
	DeleteContents( );
	SetModifiedFlag();
	UpdateAllViews( NULL );
}

void CScribDoc::OnPenThickOrThin() 
{
	// Toggle the state of the pen between thin and thick.
	m_bThickPen = !m_bThickPen;

	// Change the current pen to reflect the new width.
	ReplacePen( );
}

void CScribDoc::ReplacePen( )
{
	m_nPenWidth = m_bThickPen ? m_nThickWidth : m_nThinWidth;
	// Change the current pen to reflect the new width.
	m_penCur.DeleteObject( );
	m_penCur.CreatePen( PS_SOLID, m_nPenWidth, m_dwPenColor );
}



void CScribDoc::OnUpdateEditClearAll(CCmdUI* pCmdUI) 
{
	// Enable the user-interface object (menu item or tool- 
	// bar button) if the document is non-empty, i.e., has 
	// at least one stroke.
	pCmdUI->Enable( !m_strokeList.IsEmpty( ) );
}

void CScribDoc::OnUpdatePenThickOrThin(CCmdUI* pCmdUI) 
{
	// Add check mark to Pen Thick Line menu item if the current
	// pen width is "thick."
	pCmdUI->SetCheck( m_bThickPen );
}

void CScribDoc::OnPenWidths() 
{
	CPenWidthsDlg dlg;

	// Initialize dialog data
	dlg.m_nThinWidth = m_nThinWidth;
	dlg.m_nThickWidth = m_nThickWidth;

	// Invoke the dialog box
	if (dlg.DoModal() == IDOK)
	{
		// retrieve the dialog data
		m_nThinWidth = dlg.m_nThinWidth;
		m_nThickWidth = dlg.m_nThickWidth;
	
		// Update the pen used by views when drawing new strokes
		// to reflect the new pen widths for "thick" and "thin".
		ReplacePen();
	}
}

void CScribDoc::OnPenBlack() 
{
	m_dwPenColor = RGB(0,0,0);

	// Change the current pen to reflect the new width.
	ReplacePen( );
}

void CScribDoc::OnPenBlue() 
{
	m_dwPenColor = RGB(0,0,255);

	// Change the current pen to reflect the new width.
	ReplacePen( );
}

void CScribDoc::OnPenGreen() 
{
	m_dwPenColor = RGB(0,255,0);

	// Change the current pen to reflect the new width.
	ReplacePen( );
}

void CScribDoc::OnPenRed() 
{
	m_dwPenColor = RGB(255,0,0);

	// Change the current pen to reflect the new width.
	ReplacePen( );
}


void CScribDoc::OnPenAutresCouleurs() 
{
	// TODO: Add your command handler code here
	CColorDialog dlg;

	if (dlg.DoModal() == IDOK)
	{
		m_dwPenColor = dlg.GetColor();
		ReplacePen( );
	}
}


void CScribDoc::OnUpdatePenBlack(CCmdUI* pCmdUI) 
{
	pCmdUI->SetCheck( m_dwPenColor == RGB(0,0,0) );
}

void CScribDoc::OnUpdatePenBlue(CCmdUI* pCmdUI) 
{
	pCmdUI->SetCheck( m_dwPenColor == RGB(0,0,255) );
}

void CScribDoc::OnUpdatePenGreen(CCmdUI* pCmdUI) 
{
	pCmdUI->SetCheck( m_dwPenColor == RGB(0,255,0) );
}

void CScribDoc::OnUpdatePenRed(CCmdUI* pCmdUI) 
{
	pCmdUI->SetCheck( m_dwPenColor == RGB(255,0,0) );
}

void CScribDoc::OnUpdatePenAutresCouleurs(CCmdUI* pCmdUI) 
{
	pCmdUI->Enable(1);
}

void CStroke::FinishStroke()
{
	// Calculate the bounding rectangle.  It's needed for smart
	// repainting.
	
	if( m_pointArray.GetSize() == 0 )
	{
		m_rectBounding.SetRectEmpty();
		return;
	}
	CPoint pt = m_pointArray[0];
	m_rectBounding = CRect( pt.x, pt.y, pt.x, pt.y );
	
	for (int i=1; i < m_pointArray.GetSize(); i++)
	{
		// If the point lies outside of the accumulated bounding
		// rectangle, then inflate the bounding rect to include it.
		pt = m_pointArray[i];
		m_rectBounding.left   = min(m_rectBounding.left, pt.x);
		m_rectBounding.right  = max(m_rectBounding.right, pt.x);
		// Mapping MM_LOENGLISH, 0 en bas sur Y !
		m_rectBounding.top		= max(m_rectBounding.top, pt.y);
		m_rectBounding.bottom	= min(m_rectBounding.bottom, pt.y);

	}
	
	// Add the pen width to the bounding rectangle.  This is needed
	// to account for the width of the stroke when invalidating
	// the screen.

	m_rectBounding.InflateRect(CSize(m_nPenWidth,-(int)m_nPenWidth));

	return;
}


