// takdoc.cpp : implementation of the CTakDoc class
//

#include "stdafx.h"
#include "tak.h"

#include "takdoc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTakDoc

IMPLEMENT_DYNCREATE(CTakDoc, CDocument)

BEGIN_MESSAGE_MAP(CTakDoc, CDocument)
	//{{AFX_MSG_MAP(CTakDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTakDoc construction/destruction

CTakDoc::CTakDoc()
{
	// TODO: add one-time construction code here

}

CTakDoc::~CTakDoc()
{
}

BOOL CTakDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CTakDoc serialization

void CTakDoc::Serialize(CArchive& ar)
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
// CTakDoc diagnostics

#ifdef _DEBUG
void CTakDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CTakDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CTakDoc commands
