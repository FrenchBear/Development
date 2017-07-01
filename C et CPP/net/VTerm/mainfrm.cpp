// mainfrm.cpp : implementation of the CMainFrame class
// 30/04/96 PV
// 29/07/96	PV	SelStatus; Coordonnées curseur
//  1/11/96 PV	Codage 8 bits ANSI. Fin du bouton "A propos..."

#include "stdafx.h"
#include "mainfrm.h"
#include "VTerm.h"
#include "VTermSock.h"
#include "VTermDoc.h"
#include "VTermGlobal.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMainFrame

IMPLEMENT_DYNAMIC(CMainFrame, CMDIFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CMDIFrameWnd)
	//{{AFX_MSG_MAP(CMainFrame)
	ON_WM_CREATE()
	ON_COMMAND(ID_NEXT_WINDOW, OnNextWindow)
	ON_COMMAND(ID_POLICE, OnPolice)
    ON_UPDATE_COMMAND_UI(ID_STATUS_CONNEXION, OnUpdateStatusConnexion)
    ON_UPDATE_COMMAND_UI(ID_COORDONNEES_CURSEUR, OnUpdateCoordonneesCurseur)
    ON_UPDATE_COMMAND_UI(ID_CODAGE_8BITS, OnUpdateCodage8Bits)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// arrays of IDs used to initialize control bars
	
// toolbar buttons - IDs are command buttons
static UINT BASED_CODE buttons[] =
{
	// same order as in the bitmap 'toolbar.bmp'
	ID_FILE_NEW,
	ID_FILE_CLOSE,
		ID_SEPARATOR,
	ID_EDIT_COPY,
	ID_EDIT_PASTE,
		ID_SEPARATOR,
	ID_NEXT_WINDOW,
};

static UINT BASED_CODE indicators[] =
{
	ID_SEPARATOR,           // status line indicator
	ID_STATUS_CONNEXION,
	ID_COORDONNEES_CURSEUR,
	ID_CODAGE_8BITS,
	ID_INDICATOR_CAPS,
	ID_INDICATOR_NUM,
	ID_INDICATOR_SCRL,
};

/////////////////////////////////////////////////////////////////////////////
// CMainFrame construction/destruction

CMainFrame::CMainFrame()
{
  // TODO: add member initialization code here
	
}

CMainFrame::~CMainFrame()
{
}

int CMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
  if (CMDIFrameWnd::OnCreate(lpCreateStruct) == -1)
	  return -1;
  
  if (!m_wndToolBar.Create(this) ||
	  !m_wndToolBar.LoadBitmap(IDR_MAINFRAME) ||
	  !m_wndToolBar.SetButtons(buttons,
		sizeof(buttons)/sizeof(UINT)))
  {
	  TRACE0("Failed to create toolbar\n");
	  return -1;      // fail to create
  }
  m_wndToolBar.SetWindowText("VTerm - Barre d'outils standard");

  if (!m_wndStatusBar.Create(this) ||
	  !m_wndStatusBar.SetIndicators(indicators,
		sizeof(indicators)/sizeof(UINT)))
  {
	  TRACE0("Failed to create status bar\n");
	  return -1;      // fail to create
  }

  // TODO: Delete these three lines if you don't want the toolbar to
  //  be dockable
  m_wndToolBar.EnableDocking(CBRS_ALIGN_ANY);
  EnableDocking(CBRS_ALIGN_ANY);
  DockControlBar(&m_wndToolBar);

  // TODO: Remove this if you don't want tool tips
  m_wndToolBar.SetBarStyle(m_wndToolBar.GetBarStyle() |
	  CBRS_TOOLTIPS | CBRS_FLYBY);

  // On affiche tout de suite la fenêtre, de façon à ce que la boîte de
  // dialogue de connexion apparaîsse dessus et non pas sur le bureau
  ShowWindow(SW_SHOW);
  UpdateWindow();

  return 0;
}

/////////////////////////////////////////////////////////////////////////////
// CMainFrame diagnostics

#ifdef _DEBUG
void CMainFrame::AssertValid() const
{
  CMDIFrameWnd::AssertValid();
}

void CMainFrame::Dump(CDumpContext& dc) const
{
  CMDIFrameWnd::Dump(dc);
}

#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMainFrame message handlers

void CMainFrame::OnNextWindow() 
{
  MDINext();
}


void CMainFrame::OnPolice() 
{
  LOGFONT lf;
  CFontDialog dlg(&lf);

  memset(&lf, 0, sizeof(lf));
  strcpy(lf.lfFaceName, szFont);
  lf.lfCharSet = (iOptions&OPT_ANSI) ? ANSI_CHARSET : OEM_CHARSET;
  lf.lfHeight = 10;

  dlg.m_cf.Flags |= CF_NOSCRIPTSEL|/*CF_SELECTSCRIPT|*/CF_FIXEDPITCHONLY;
  dlg.m_cf.Flags &= ~CF_EFFECTS;

  if (dlg.DoModal()==IDOK)
  {
	strcpy(szFont, dlg.GetFaceName());
	ReaffichageComplet();
  }
}

afx_msg void CMainFrame::OnUpdateStatusConnexion(CCmdUI *pCmdUI)
{
  static int iLastNbConnexionsActives;
  pCmdUI->Enable(); 

  if (iNbConnexionsActives!=iLastNbConnexionsActives)
  {
	iLastNbConnexionsActives = iNbConnexionsActives;
	char szMessage[40];
	if (iNbConnexionsActives==0)
	  strcpy(szMessage, "Aucune connexion active");
	else if (iNbConnexionsActives==1)
	  strcpy(szMessage, "1 connexion active");
	else
	  sprintf(szMessage, "%d connexions actives", iNbConnexionsActives);

    pCmdUI->SetText(szMessage);
  }
}

afx_msg void CMainFrame::OnUpdateCodage8Bits(CCmdUI *pCmdUI)
{
  pCmdUI->SetText((iOptions & OPT_ANSI) ? "ANSI" : "OEM");
}

afx_msg void CMainFrame::OnUpdateCoordonneesCurseur(CCmdUI *pCmdUI)
{
  if (AfxGetApp()->GetOpenDocumentCount()==0)
  {
	pCmdUI->SetText("");
  }
  else
  {
	CDocument* d = MDIGetActive()->GetActiveView()->GetDocument();

	if (d==NULL)
	  pCmdUI->SetText("?");
	else
	{
	  Terminal *t = &((CVTermDoc *)d)->m_Term;

	  char szMessage[32];
	  sprintf(szMessage, "l:%d c:%d", t->m_iLigne+1, t->m_iColonne+1);
	  pCmdUI->SetText(szMessage);
	}
  }
}


void  CMainFrame::SetStatus(CString sMessage)
{
  m_wndStatusBar.SetWindowText(sMessage);
}
