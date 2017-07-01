// sgbddoc.cpp : implementation of the CSgbdDoc class
//

#include "stdafx.h"
#include "sgbd.h"

#include "sgbdset.h"
#include "sgbddoc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSgbdDoc

IMPLEMENT_DYNCREATE(CSgbdDoc, CDocument)

BEGIN_MESSAGE_MAP(CSgbdDoc, CDocument)
	//{{AFX_MSG_MAP(CSgbdDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSgbdDoc construction/destruction

CSgbdDoc::CSgbdDoc()
{
	// TODO: add one-time construction code here
}

CSgbdDoc::~CSgbdDoc()
{
}

BOOL CSgbdDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CSgbdDoc diagnostics

#ifdef _DEBUG
void CSgbdDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CSgbdDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CSgbdDoc commands
