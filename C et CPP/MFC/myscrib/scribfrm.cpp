// scribfrm.cpp : implementation file
//

#include "stdafx.h"
#include "scribble.h"
#include "scribfrm.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CScribFrame

IMPLEMENT_DYNCREATE(CScribFrame, CMDIChildWnd)

CScribFrame::CScribFrame()
{
}

CScribFrame::~CScribFrame()
{
}

BOOL CScribFrame::OnCreateClient(LPCREATESTRUCT /*lpcs*/, CCreateContext* pContext)
{
	return m_wndSplitter.Create(this,
		2, 2,       // TODO: adjust the number of rows, columns
		CSize(10, 10),  // TODO: adjust the minimum pane size
		pContext);
}


BEGIN_MESSAGE_MAP(CScribFrame, CMDIChildWnd)
	//{{AFX_MSG_MAP(CScribFrame)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CScribFrame message handlers
