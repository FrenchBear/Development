// myappdoc.cpp : implementation of the CMyappDoc class
//

#include "stdafx.h"
#include "myapp.h"

#include "myappdoc.h"
#include "enterdlg.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMyappDoc

IMPLEMENT_DYNCREATE(CMyappDoc, CDocument)

BEGIN_MESSAGE_MAP(CMyappDoc, CDocument)
	//{{AFX_MSG_MAP(CMyappDoc)
	ON_COMMAND(ID_EDIT_CHANGETEXT, OnEditChangeText)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMyappDoc construction/destruction

CMyappDoc::CMyappDoc()
{
	// TODO: add one-time construction code here

}

CMyappDoc::~CMyappDoc()
{
}

BOOL CMyappDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)
	m_strData = "Sample Data String";

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CMyappDoc serialization

void CMyappDoc::Serialize(CArchive& ar)
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
// CMyappDoc diagnostics

#ifdef _DEBUG
void CMyappDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CMyappDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMyappDoc commands

void CMyappDoc::OnEditChangeText() 
{
	CEnterDlg dlg;                 // create a CEnterDlg variable
	dlg.m_strInput = m_strData;    	// initialize the edit string
	if (dlg.DoModal() != IDOK)     	// open dialog box
		return;
	m_strData = dlg.m_strInput;    	// retrieve edit string
	UpdateAllViews(NULL);   	       // general update 
}
