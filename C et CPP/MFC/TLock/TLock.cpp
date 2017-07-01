// TLock.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "TLock.h"
#include "TLockdlg.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTLockApp

BEGIN_MESSAGE_MAP(CTLockApp, CWinApp)
	//{{AFX_MSG_MAP(CTLockApp)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTLockApp construction

CTLockApp::CTLockApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CTLockApp object

CTLockApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CTLockApp initialization

BOOL CTLockApp::InitInstance()
{
	// Standard initialization
	// If you are not using these features and wish to reduce the size
	//  of your final executable, you should remove from the following
	//  the specific initialization routines you do not need.

	Enable3dControls();
	SetDialogBkColor(GetSysColor(COLOR_BTNFACE));

	//LoadStdProfileSettings();  // Load standard INI file options (including MRU)

	CTLockDlg dlg;
	m_pMainWnd = &dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK)	// = Quitter
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with OK
	}

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}
