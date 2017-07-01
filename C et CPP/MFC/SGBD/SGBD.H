// sgbd.h : main header file for the SGBD application
//

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CSgbdApp:
// See sgbd.cpp for the implementation of this class
//

class CSgbdApp : public CWinApp
{
public:
	CSgbdApp();

// Overrides
	virtual BOOL InitInstance();

// Implementation

	//{{AFX_MSG(CSgbdApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////
