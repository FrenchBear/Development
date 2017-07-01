// VTerm.h : main header file for the MFCSOCK application
// 30/06/96 PV
//  7/12/98 PV	sANSItoLocale; fin de AVEC_SOCKETS

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols
#include "ConnexionRecente.h"
#include "BufferGlissant.h"

//#define FTRACE

// Fonction utilitaire générique, ici faute d'avoir su où la caser ailleurs...
CString sANSItoLocale(const char *s);


/////////////////////////////////////////////////////////////////////////////
// CVTermApp:
//

class CVTermApp : public CWinApp
{
public:
	CVTermApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CVTermApp)
	public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CVTermApp)
	afx_msg void OnAppAbout();
	afx_msg void OnAboutWinsock();
	afx_msg void OnUpdateNextWindow(CCmdUI* pCmdUI);
	afx_msg void OnOptions();
	afx_msg void OnCouleurs();
	afx_msg void OnUpdateEditPaste(CCmdUI* pCmdUI);
	afx_msg void OnUpdateFileMruFile1(CCmdUI* pCmdUI);
	afx_msg void OnFileMruFile1();
	afx_msg void OnFileMruFile2();
	afx_msg void OnUpdateTestperformances(CCmdUI* pCmdUI);
	afx_msg void OnUpdateStats(CCmdUI* pCmdUI);
	afx_msg void OnUpdateTestdefilement(CCmdUI* pCmdUI);
	afx_msg void OnUpdateTestmire(CCmdUI* pCmdUI);
	afx_msg void OnFileMruFile3();
	afx_msg void OnFileMruFile4();
	afx_msg void OnFileMruFile5();
	afx_msg void OnFileMruFile6();
	afx_msg void OnFileMruFile7();
	afx_msg void OnFileMruFile8();
	afx_msg void OnFileMruFile9();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
  void Usage();
};


/////////////////////////////////////////////////////////////////////////////

extern WSADATA wsaData;
