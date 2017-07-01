// StatsWindow.cpp : implementation file
//

#include "stdafx.h"
#include "VTerm.h"
#include "VTermSock.h"
#include "VTermDoc.h"
#include "VTermView.h"
#include "StatsWindow.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CStatsWindow dialog


CStatsWindow::CStatsWindow(CWnd* pParent /*=NULL*/)
	: CDialog(CStatsWindow::IDD, pParent)
{
}

CStatsWindow::CStatsWindow(CVTermView *pView, CWnd* pParent /*=NULL*/)
	: CDialog(CStatsWindow::IDD, pParent)
{
	//{{AFX_DATA_INIT(CStatsWindow)
	m_iLongMoy = 0;
	m_iNbDessineCellule = 0;
	m_iNbOnDraw = 0;
	m_iNbInvalidateRect = 0;
	m_iNbOnUpdate = 0;
	m_iNbOnUpdateCellule = 0;
	m_iNbTextOut = 0;
	m_cx = 0;
	m_cy = 0;
	m_x = 0;
	m_y = 0;
	//}}AFX_DATA_INIT

	m_pView = pView;
}



void CStatsWindow::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CStatsWindow)
	DDX_Control(pDX, IDC_TEXTOUTLENLIST, m_TextOutLenList);
	DDX_Text(pDX, IDC_LONGMOY, m_iLongMoy);
	DDX_Text(pDX, IDC_NBDESSINECELLULE, m_iNbDessineCellule);
	DDX_Text(pDX, IDC_NBONDRAW, m_iNbOnDraw);
	DDX_Text(pDX, IDC_NBINVALIDATERECT, m_iNbInvalidateRect);
	DDX_Text(pDX, IDC_NBONUPDATE, m_iNbOnUpdate);
	DDX_Text(pDX, IDC_NBONUPDATECELLULE, m_iNbOnUpdateCellule);
	DDX_Text(pDX, IDC_NBTEXTOUT, m_iNbTextOut);
	DDX_Text(pDX, IDC_M_CX, m_cx);
	DDX_Text(pDX, IDC_M_CY, m_cy);
	DDX_Text(pDX, IDC_M_X, m_x);
	DDX_Text(pDX, IDC_M_Y, m_y);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CStatsWindow, CDialog)
	//{{AFX_MSG_MAP(CStatsWindow)
	ON_BN_CLICKED(IDC_RAZSTATS, OnRAZStats)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CStatsWindow message handlers


BOOL CStatsWindow::OnInitDialog() 
{
  CDialog::OnInitDialog();
	
  int i;
  int nTotal = 0, nAppels = 0;
  char szLigne[20];

  m_x = m_pView->m_x;
  m_y = m_pView->m_y;
  m_cx = m_pView->m_cx;
  m_cy = m_pView->m_cy;

  for (i=1 ; i<=80 ; i++)
  {
	nAppels += m_pView->m_iBufferStats[i];
	nTotal  += i*m_pView->m_iBufferStats[i];

	if (m_pView->m_iBufferStats[i])
	{
	  sprintf(szLigne, "%2d %5d", i, m_pView->m_iBufferStats[i]);
      m_TextOutLenList.AddString(szLigne);
	}
  }

  // La façon la plus sophistiquée qui soit d'éviter une division par zéro !!!
  try
  {
    m_iLongMoy = nTotal / nAppels;
  }
  catch(...)
  {
    m_iLongMoy = 0;
  }
  m_iNbOnUpdate = m_pView->m_iNbOnUpdate;
  m_iNbOnUpdateCellule = m_pView->m_iNbOnUpdateCellule;
  m_iNbInvalidateRect = m_pView->m_iNbInvalidateRect;
  m_iNbOnDraw = m_pView->m_iNbOnDraw;
  m_iNbDessineCellule = m_pView->m_iNbDessineCellule;
  m_iNbTextOut = m_pView->m_iNbTextOut;
  UpdateData(FALSE);
	
  return TRUE;  // return TRUE unless you set the focus to a control
}

void CStatsWindow::OnRAZStats() 
{
  int i;

  for (i=1 ; i<=80 ; i++)
	m_pView->m_iBufferStats[i] = 0;
  m_pView->m_iNbOnDraw = 0;
  m_pView->m_iNbDessineCellule = 0;
  m_pView->m_iNbOnUpdate = 0;
  m_pView->m_iNbOnUpdateCellule = 0;
  m_pView->m_iNbInvalidateRect = 0;
  m_pView->m_iNbTextOut = 0;

  m_TextOutLenList.ResetContent();
  m_iLongMoy = 0;
  m_iNbOnUpdate = 0;
  m_iNbOnUpdateCellule = 0;
  m_iNbInvalidateRect = 0;
  m_iNbOnDraw = 0;
  m_iNbDessineCellule = 0;
  m_iNbTextOut = 0;
  UpdateData(FALSE);
}
