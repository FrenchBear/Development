// TLockdlg.cpp : implementation file
//

#include "stdafx.h"
#include "TLock.h"
#include "TLockdlg.h"

#include <io.h>    // _open.
#include <fcntl.h>
#include <sys/locking.h>

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//{{AFX_MSG(CAboutDlg)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg message handlers

BOOL CAboutDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	CenterWindow();
	
	// TODO: Add extra about dlg initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

/////////////////////////////////////////////////////////////////////////////
// CTLockDlg dialog

CTLockDlg::CTLockDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CTLockDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTLockDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CTLockDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTLockDlg)
	DDX_Control(pDX, IDC_OPEN_WO, m_btnOpenWO);
	DDX_Control(pDX, IDC_OPEN_RO, m_btnOpenRO);
	DDX_Control(pDX, IDC_WRITE, m_btnWrite);
	DDX_Control(pDX, IDC_READ, m_btnRead);
	DDX_Control(pDX, IDC_UNLOCK, m_btnUnlock);
	DDX_Control(pDX, IDC_LOCK, m_btnLock);
	DDX_Control(pDX, IDC_CLOSE, m_btnClose);
	DDX_Control(pDX, IDC_OPEN, m_btnOpen);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTLockDlg, CDialog)
	//{{AFX_MSG_MAP(CTLockDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_OPEN, OnOpen)
	ON_BN_CLICKED(IDC_CLOSE, OnClose)
	ON_BN_CLICKED(IDC_LOCK, OnLock)
	ON_BN_CLICKED(IDC_READ, OnRead)
	ON_BN_CLICKED(IDC_UNLOCK, OnUnlock)
	ON_BN_CLICKED(IDC_WRITE, OnWrite)
	ON_BN_CLICKED(IDC_OPEN_RO, OnOpenRO)
	ON_BN_CLICKED(IDC_OPEN_WO, OnOpenWO)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTLockDlg message handlers

BOOL CTLockDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	CenterWindow();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	GetSystemMenu(TRUE);
	CMenu* pSysMenu = GetSystemMenu(FALSE);
	CString strAboutMenu;
	strAboutMenu.LoadString(IDS_ABOUTBOX);
	if (!strAboutMenu.IsEmpty())
	{
		pSysMenu->AppendMenu(MF_SEPARATOR);
		pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
	}
	
	// TODO: Add extra initialization here
	m_btnClose.EnableWindow(FALSE);
	m_btnRead.EnableWindow(FALSE);
	m_btnWrite.EnableWindow(FALSE);
	m_btnLock.EnableWindow(FALSE);
	m_btnUnlock.EnableWindow(FALSE);
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CTLockDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CTLockDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CTLockDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

static int h = 0;
static char szNomfic[] = "c:/ercem/conf/Fichier à verrouiller";

void MessageErreur(HWND hWnd, char *szMsg)
{
  CString sMessageComplet(szMsg);
  char szErreur[128];

  sprintf(szErreur, "\nErreur %d: %s", errno, sys_errlist[errno]);
  sMessageComplet += szErreur;

  MessageBox(hWnd, sMessageComplet, NULL, MB_ICONEXCLAMATION|MB_OK);
}

static int bRewind(HWND hWnd)
{
	int i;

	i = lseek(h, 0, SEEK_SET);
	if (i<0)
	{
	  MessageErreur(hWnd, "Echec à l'appel de lseek");
	  return 0;
	}

	return 1;
}

void CTLockDlg::OnOpen() 
{
	h = open(szNomfic, O_RDWR);
	if (h<0)
	  MessageErreur(m_hWnd, "Echec à l'appel de open(O_RDWR)");
	else
	{
	  m_btnOpen.EnableWindow(FALSE);
	  m_btnOpenRO.EnableWindow(FALSE);
	  m_btnOpenWO.EnableWindow(FALSE);
	  m_btnClose.EnableWindow(TRUE);
	  m_btnLock.EnableWindow(TRUE);
	  m_btnRead.EnableWindow(TRUE);
	  m_btnWrite.EnableWindow(TRUE);
	}
}

void CTLockDlg::OnOpenRO() 
{
	h = open(szNomfic, O_RDONLY);
	if (h<0)
	  MessageErreur(m_hWnd, "Echec à l'appel de open(O_RDONLY)");
	else
	{
	  m_btnOpen.EnableWindow(FALSE);
	  m_btnOpenRO.EnableWindow(FALSE);
	  m_btnOpenWO.EnableWindow(FALSE);
	  m_btnClose.EnableWindow(TRUE);
	  m_btnLock.EnableWindow(TRUE);
	  m_btnRead.EnableWindow(TRUE);
	}
}

void CTLockDlg::OnOpenWO() 
{
	h = open(szNomfic, O_RDWR);
	if (h<0)
	  MessageErreur(m_hWnd, "Echec à l'appel de open(O_RDWR");
	else
	{
	  m_btnOpen.EnableWindow(FALSE);
	  m_btnOpenRO.EnableWindow(FALSE);
	  m_btnOpenWO.EnableWindow(FALSE);
	  m_btnClose.EnableWindow(TRUE);
	  m_btnLock.EnableWindow(TRUE);
	  m_btnWrite.EnableWindow(TRUE);
	}
}

void CTLockDlg::OnClose() 
{
	// TODO: Add your control notification handler code here
	int i;
	i = close(h);
	if (i<0)
	  MessageErreur(m_hWnd, "Echec à l'appel de close");
	h = 0;
	m_btnOpen.EnableWindow(TRUE);
	m_btnOpenRO.EnableWindow(TRUE);
	m_btnOpenWO.EnableWindow(TRUE);
	m_btnClose.EnableWindow(FALSE);
	m_btnLock.EnableWindow(FALSE);
	m_btnUnlock.EnableWindow(FALSE);
	m_btnRead.EnableWindow(FALSE);
	m_btnWrite.EnableWindow(FALSE);
}

void CTLockDlg::OnLock()
{
	int i;

	if (!bRewind(m_hWnd)) return;

	i = locking(h, _LK_LOCK, 1);
	if (i<0)
	{
	  MessageErreur(m_hWnd, "Echec à l'appel de locking(h, _LK_LOCK, 0)");
	  return;
	}
	m_btnLock.EnableWindow(FALSE);
	m_btnUnlock.EnableWindow(TRUE);
	m_btnClose.EnableWindow(FALSE);

    ::MessageBox(m_hWnd, "lock: Ok !", "", MB_OK);
}

void CTLockDlg::OnUnlock() 
{
	int i;

	if (!bRewind(m_hWnd)) return;

	i = locking(h, _LK_UNLCK, 1);
	if (i<0)
	{
	  MessageErreur(m_hWnd, "Echec à l'appel de locking(h, _LK_UNLCK, 0)");
	  return;
	}
	m_btnLock.EnableWindow(TRUE);
	m_btnUnlock.EnableWindow(FALSE);
	m_btnClose.EnableWindow(TRUE);

    ::MessageBox(m_hWnd, "unlock: Ok !", "", MB_OK);
}

void CTLockDlg::OnRead() 
{
	int i;
	char szBuffer[100];

	if (!bRewind(m_hWnd)) return;

	i = read(h, szBuffer, 100);
	if (i<=0)
	{
	  MessageErreur(m_hWnd, "Echec à l'appel de read");
	  return;
	}

    ::MessageBox(m_hWnd, "read: Ok !", "", MB_OK);
}

void CTLockDlg::OnWrite() 
{
	int i;
	char szBuffer[100];

	if (!bRewind(m_hWnd)) return;

	for (i=0 ; i<100 ; i++)
	  szBuffer[i] = 'z';
	i = write(h, szBuffer, 100);
	if (i<=0)
	{
	  MessageErreur(m_hWnd, "Echec à l'appel de write");
	  return;
	}

    ::MessageBox(m_hWnd, "write: Ok !", "", MB_OK);
}


void CTLockDlg::OnOK() 
{
	// TODO: Add extra validation here
	
	CDialog::OnOK();
}
