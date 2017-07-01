// enterdlg.cpp : implementation file
//

#include "stdafx.h"
#include "myapp.h"
#include "enterdlg.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CEnterDlg dialog


CEnterDlg::CEnterDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CEnterDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CEnterDlg)
	m_strInput = _T("");
	//}}AFX_DATA_INIT
}


void CEnterDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CEnterDlg)
	DDX_Text(pDX, IDC_EDIT1, m_strInput);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CEnterDlg, CDialog)
	//{{AFX_MSG_MAP(CEnterDlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CEnterDlg message handlers
