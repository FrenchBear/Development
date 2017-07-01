// sgbdview.cpp : implementation of the CSgbdView class
//

#include "stdafx.h"
#include "sgbd.h"

#include "sgbdset.h"
#include "sgbddoc.h"
#include "sgbdview.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSgbdView

IMPLEMENT_DYNCREATE(CSgbdView, CRecordView)

BEGIN_MESSAGE_MAP(CSgbdView, CRecordView)
    //{{AFX_MSG_MAP(CSgbdView)
    ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
    //}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSgbdView construction/destruction

CSgbdView::CSgbdView()
    : CRecordView(CSgbdView::IDD)
{
    //{{AFX_DATA_INIT(CSgbdView)
    m_pSet = NULL;
    //}}AFX_DATA_INIT
    // TODO: add construction code here
}

CSgbdView::~CSgbdView()
{
}

void CSgbdView::DoDataExchange(CDataExchange* pDX)
{
    CRecordView::DoDataExchange(pDX);
    //{{AFX_DATA_MAP(CSgbdView)
	DDX_Control(pDX, IDC_BUTTON1, m_Ok);
    DDX_FieldText(pDX, IDC_EDIT1, m_pSet->m_Code_Pays, m_pSet);
    DDX_FieldText(pDX, IDC_EDIT2, m_pSet->m_Nom, m_pSet);
	//}}AFX_DATA_MAP
}

void CSgbdView::OnInitialUpdate()
{
    m_pSet = &GetDocument()->m_sgbdSet;
    CRecordView::OnInitialUpdate();

}

/////////////////////////////////////////////////////////////////////////////
// CSgbdView diagnostics

#ifdef _DEBUG
void CSgbdView::AssertValid() const
{
    CRecordView::AssertValid();
}

void CSgbdView::Dump(CDumpContext& dc) const
{
    CRecordView::Dump(dc);
}

CSgbdDoc* CSgbdView::GetDocument() // non-debug version is inline
{
    ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CSgbdDoc)));
	return (CSgbdDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CSgbdView database support

CRecordset* CSgbdView::OnGetRecordset()
{
    return m_pSet;
}


/////////////////////////////////////////////////////////////////////////////
// CSgbdView message handlers

void CSgbdView::OnButton1()
{
    // TODO: Add your control notification handler code here

    MessageBox("Cliqué sur Ok!");
}
