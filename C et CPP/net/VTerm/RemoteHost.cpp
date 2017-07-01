// RemoteHost.cpp : implementation file
// Boîte de dialogue de sélection d'un host
// 30/04/96 PV
//  1/11/00 PV	6 -> 9 hosts


#include "stdafx.h"
#include "VTerm.h"
#include "RemoteHost.h"
#include "VTermGlobal.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

static CButton *tbtn[MAXRECENT];

/////////////////////////////////////////////////////////////////////////////
// CRemoteHost dialog


CRemoteHost::CRemoteHost(CWnd* pParent /*=NULL*/)
	: CDialog(CRemoteHost::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRemoteHost)
	m_sHost = _T("");
	m_sLogin = _T("");
	m_sPassword = _T("");
	m_sTerminal = _T("");
	m_bAutoLogin = FALSE;
	//}}AFX_DATA_INIT
}


void CRemoteHost::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRemoteHost)
	DDX_Control(pDX, IDC_HOST9, m_Host9);
	DDX_Control(pDX, IDC_HOST8, m_Host8);
	DDX_Control(pDX, IDC_HOST7, m_Host7);
	DDX_Control(pDX, IDC_NORECENT, m_NoRecent);
	DDX_Control(pDX, IDC_AUTOLOGIN, m_chkAutoLogin);
	DDX_Control(pDX, IDC_AVANCE, m_Avance);
	DDX_Control(pDX, IDC_TXT_TERMINAL, m_txtTerminal);
	DDX_Control(pDX, IDC_TXT_PASSWORD, m_txtPassword);
	DDX_Control(pDX, IDC_TXT_LOGIN, m_txtLogin);
	DDX_Control(pDX, IDC_HOST6, m_Host6);
	DDX_Control(pDX, IDC_HOST5, m_Host5);
	DDX_Control(pDX, IDC_HOST4, m_Host4);
	DDX_Control(pDX, IDC_HOST3, m_Host3);
	DDX_Control(pDX, IDC_HOST2, m_Host2);
	DDX_Control(pDX, IDC_HOST1, m_Host1);
	DDX_Text(pDX, IDC_TXT_HOST, m_sHost);
	DDV_MaxChars(pDX, m_sHost, 30);
	DDX_Text(pDX, IDC_TXT_LOGIN, m_sLogin);
	DDV_MaxChars(pDX, m_sLogin, 20);
	DDX_Text(pDX, IDC_TXT_PASSWORD, m_sPassword);
	DDV_MaxChars(pDX, m_sPassword, 30);
	DDX_Text(pDX, IDC_TXT_TERMINAL, m_sTerminal);
	DDV_MaxChars(pDX, m_sTerminal, 100);
	DDX_Check(pDX, IDC_AUTOLOGIN, m_bAutoLogin);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CRemoteHost, CDialog)
	//{{AFX_MSG_MAP(CRemoteHost)
	ON_BN_CLICKED(IDC_HOST1, OnHost1)
	ON_BN_CLICKED(IDC_HOST2, OnHost2)
	ON_BN_CLICKED(IDC_HOST3, OnHost3)
	ON_BN_CLICKED(IDC_HOST4, OnHost4)
	ON_BN_CLICKED(IDC_HOST5, OnHost5)
	ON_BN_CLICKED(IDC_HOST6, OnHost6)
	ON_BN_CLICKED(IDC_AUTOLOGIN, OnAutologin)
	ON_BN_CLICKED(IDC_AVANCE, OnAvance)
	ON_BN_CLICKED(IDC_CLEAR_RECENT, OnClearRecent)
	ON_BN_CLICKED(IDC_HOST7, OnHost7)
	ON_BN_CLICKED(IDC_HOST8, OnHost8)
	ON_BN_CLICKED(IDC_HOST9, OnHost9)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRemoteHost message handlers

BOOL CRemoteHost::OnInitDialog() 
{
  int i;

  CDialog::OnInitDialog();

  // Petite icône pour le menu système
  SetIcon(AfxGetApp()->LoadIcon(IDR_MINICONNEXION) , FALSE);

  // Mécanisme de retaille plutôt minable mais j'ai pas trouvé mieux...
  CRect Rect;
  GetWindowRect(&Rect);
  m_iHauteurOriginale = Rect.Height();
  MoveWindow(Rect.left, Rect.top, Rect.Width(), (m_iHauteurOriginale*70)/100, FALSE);

  tbtn[0] = &m_Host1;
  tbtn[1] = &m_Host2;
  tbtn[2] = &m_Host3;
  tbtn[3] = &m_Host4;
  tbtn[4] = &m_Host5;
  tbtn[5] = &m_Host6;
  tbtn[6] = &m_Host7;
  tbtn[7] = &m_Host8;
  tbtn[8] = &m_Host9;

  for (i=0 ; i<MAXRECENT ; i++)
	if (CR.Count()>i)
	{ tbtn[i]->SetWindowText(CR.sGetRecent(i));
  	  tbtn[i]->ShowWindow(TRUE);
	}
  else
	tbtn[i]->ShowWindow(FALSE);


  // On aide les utilisateurs perdus quand il n'y a aucun bouton de connexion
  // récente affiché...
  m_NoRecent.ShowWindow(CR.Count()==0);


  // Par défaut on propose le dernier host auquel on s'est connecté
  if (CR.Count()>0)
  {
	m_sHost = CR.sGetRecent(0);
    UpdateData(FALSE);
  }

  return TRUE;  // return TRUE unless you set the focus to a control
	            // EXCEPTION: OCX Property Pages should return FALSE
}


void CRemoteHost::DoHost(int iHost)
{
  m_sHost = CR.sGetRecent(iHost);
  UpdateData(FALSE);
  CDialog::OnOK();
}

void CRemoteHost::OnHost1() { DoHost(0); }
void CRemoteHost::OnHost2() { DoHost(1); }
void CRemoteHost::OnHost3() { DoHost(2); }
void CRemoteHost::OnHost4() { DoHost(3); }
void CRemoteHost::OnHost5() { DoHost(4); }
void CRemoteHost::OnHost6() { DoHost(5); }
void CRemoteHost::OnHost7() { DoHost(6); }
void CRemoteHost::OnHost8() { DoHost(7); }
void CRemoteHost::OnHost9() { DoHost(8); }

void CRemoteHost::OnAutologin() 
{
  UpdateData(TRUE);
  m_txtLogin.EnableWindow(m_bAutoLogin);
  m_txtPassword.EnableWindow(m_bAutoLogin);
  m_txtTerminal.EnableWindow(m_bAutoLogin);
}

void CRemoteHost::OnAvance()
{
  CRect Rect;
  GetWindowRect(&Rect);
  MoveWindow(Rect.left, Rect.top, Rect.Width(), m_iHauteurOriginale, TRUE);
  m_Avance.EnableWindow(FALSE);
  m_chkAutoLogin.SetFocus();
}

void CRemoteHost::OnClearRecent() 
{
  int i;

  CR.Clear();
  for (i=0 ; i<MAXRECENT ; i++)
	tbtn[i]->ShowWindow(FALSE);
}

