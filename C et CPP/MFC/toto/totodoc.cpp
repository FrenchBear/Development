// totodoc.cpp : implementation of the CTotoDoc class
//

#include "stdafx.h"
#include "toto.h"

#include "totodoc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTotoDoc

IMPLEMENT_DYNCREATE(CTotoDoc, CDocument)

BEGIN_MESSAGE_MAP(CTotoDoc, CDocument)
	//{{AFX_MSG_MAP(CTotoDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTotoDoc construction/destruction

CTotoDoc::CTotoDoc()
{
	// TODO: add one-time construction code here

}

CTotoDoc::~CTotoDoc()
{
}

BOOL CTotoDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CTotoDoc serialization

void CTotoDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CTotoDoc diagnostics

#ifdef _DEBUG
void CTotoDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CTotoDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CTotoDoc commands
