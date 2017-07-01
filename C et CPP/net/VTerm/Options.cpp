// Options.cpp : implementation file
//  1/11/96 PV	Codage 8 bits ANSI
//  9/11/96 PV	Identification manuelle
//  1/11/00 PV	6 -> 9 hosts


#include "stdafx.h"
#include "VTerm.h"
#include "Options.h"
#include "VTermGlobal.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// COptions dialog


COptions::COptions(CWnd* pParent /*=NULL*/)
	: CDialog(COptions::IDD, pParent)
{
	//{{AFX_DATA_INIT(COptions)
	m_iCodage8 = IDC_COD8OEM;
	m_bRenduBrillant = FALSE;
	m_bRenduGras = FALSE;
	m_bNoEscV = FALSE;
	m_bIdentificationManuelle = FALSE;
	m_sAdresseClient = _T("");
	m_b128128 = FALSE;
	m_bPointPN = FALSE;
	m_iTailleDefaut = IDC_TDANSI;
	//}}AFX_DATA_INIT
}


void COptions::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(COptions)
	DDX_Control(pDX, IDC_COD8OEM, m_lblOEM);
	DDX_Control(pDX, IDC_COD8ANSI, m_lblANSI);
	DDX_Control(pDX, IDC_ADRCLIENT, m_txtAdresseClient);
	DDX_Radio(pDX, IDC_COD8OEM, m_iCodage8);
	DDX_Check(pDX, IDC_RENDUBRILLANT, m_bRenduBrillant);
	DDX_Check(pDX, IDC_RENDUGRAS, m_bRenduGras);
	DDX_Check(pDX, IDC_NOESCV, m_bNoEscV);
	DDX_Check(pDX, IDC_IDENTMAN, m_bIdentificationManuelle);
	DDX_Text(pDX, IDC_ADRCLIENT, m_sAdresseClient);
	DDV_MaxChars(pDX, m_sAdresseClient, 15);
	DDX_Check(pDX, IDC_128128, m_b128128);
	DDX_Check(pDX, IDC_POINTPN, m_bPointPN);
	DDX_Radio(pDX, IDC_TDANSI, m_iTailleDefaut);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(COptions, CDialog)
	//{{AFX_MSG_MAP(COptions)
	ON_BN_CLICKED(IDC_IDENTMAN, OnIdentman)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// COptions message handlers

BOOL COptions::OnInitDialog() 
{
  CDialog::OnInitDialog();
  m_txtAdresseClient.EnableWindow(m_bIdentificationManuelle);

  char szBuffer[30];
  sprintf(szBuffer, "&OEM (CP %d)", GetOEMCP());
  m_lblOEM.SetWindowText(szBuffer);
  sprintf(szBuffer, "&ANSI (CP %d)", GetACP());
  m_lblANSI.SetWindowText(szBuffer);

  return TRUE; 
}

void COptions::OnIdentman() 
{
  UpdateData(TRUE);
  m_txtAdresseClient.EnableWindow(m_bIdentificationManuelle);
}
