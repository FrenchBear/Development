// AboutVTerm.cpp : implementation file
//

#include "stdafx.h"
#include "VTerm.h"
#include "AboutVTerm.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutWinsock dialog


CAboutWinsock::CAboutWinsock(CWnd* pParent /*=NULL*/)
	: CDialog(CAboutWinsock::IDD, pParent)
{
    char szVersion[5];
    char szHighVersion[5];

	sprintf(szVersion, "%d.%d", LOBYTE(wsaData.wVersion), HIBYTE(wsaData.wVersion));
	sprintf(szHighVersion, "%d.%d", LOBYTE(wsaData.wHighVersion), HIBYTE(wsaData.wHighVersion));
	m_sVersion = szVersion;
	m_sHighVersion = szHighVersion;
	m_sDescription = wsaData.szDescription;
	m_sSystemStatus = wsaData.szSystemStatus;
	m_iMaxSockets = wsaData.iMaxSockets;
	m_iMaxUDPdg = wsaData.iMaxUdpDg;

	//{{AFX_DATA_INIT(CAboutWinsock)
	//}}AFX_DATA_INIT
}


void CAboutWinsock::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutWinsock)
	DDX_Text(pDX, IDC_TXT_SYSSTAT, m_sSystemStatus);
	DDX_Text(pDX, IDC_TXT_VERSION, m_sVersion);
	DDX_Text(pDX, IDC_TXT_MAXUDPDG, m_iMaxUDPdg);
	DDX_Text(pDX, IDC_TXT_MAXSOCKETS, m_iMaxSockets);
	DDX_Text(pDX, IDC_TXT_DESCRIPTION, m_sDescription);
	DDX_Text(pDX, IDC_TXT_HIGHVERSION, m_sHighVersion);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CAboutWinsock, CDialog)
	//{{AFX_MSG_MAP(CAboutWinsock)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// CAboutWinsock message handlers
