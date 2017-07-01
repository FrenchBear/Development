// VTerm.cpp : Defines the class behaviors for the application.
// 30/06/96 PV
//  1/11/96 PV	Codage 8 bits ANSI
//  2/11/96 PV	Version 1.2.1: Troncature au point pour déterminer l'adresse de la machine qui exécute VTerm, sinon plantage dans Winsock32.dll...
//  9/11/96 PV	Version 1.2.2: Identification manuelle du client pour contourner un bug de WinSock
// 15/10/96 PV	Version 1.3.0: OPT_128128 pour compenser un bug de telnetd
// 29/09/98 PV	Version 1.3.1: Plus d'affichage de la qté de RAM disponible (aucun intérêt)
// 29/11/98 PV	Version 1.4.0: Affichage mode graphique toujours en OEM
//  7/12/98 PV	Version 1.4.1: Sauvegarde des attributs; sANSItoLocale
// 23/07/01 PV	Version 2.0.1: Décochage possible de l'option point du pavé numérique; 32x102 par défaut sur un écran 1024 colonnes ou +
//  8/03/02 PV	Version 2.0.3: Affichage des codes de page courants réels dans la boîte options


#include "stdafx.h"
#include <winreg.h>
#include "VTerm.h"

#include "mainfrm.h"
#include "VTermSock.h"
#include "VTermDoc.h"
#include "VTermView.h"
#include "AboutVTerm.h"
#include "Options.h"
#include "Couleurs.h"

#include "VTermGlobal.h"
#include <dos.h>
#include <direct.h>

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

WSADATA wsaData;


static void LitParametres();
static void SauveParametres();

/////////////////////////////////////////////////////////////////////////////
// CVTermApp

BEGIN_MESSAGE_MAP(CVTermApp, CWinApp)
	//{{AFX_MSG_MAP(CVTermApp)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	ON_COMMAND(ID_ABOUT_WINSOCK, OnAboutWinsock)
	ON_UPDATE_COMMAND_UI(ID_NEXT_WINDOW, OnUpdateNextWindow)
	ON_COMMAND(ID_OPTIONS, OnOptions)
	ON_COMMAND(ID_COULEURS, OnCouleurs)
	ON_UPDATE_COMMAND_UI(ID_EDIT_PASTE, OnUpdateEditPaste)
	ON_UPDATE_COMMAND_UI(ID_FILE_MRU_FILE1, OnUpdateFileMruFile1)
	ON_UPDATE_COMMAND_UI(ID_TESTPERFORMANCES, OnUpdateTestperformances)
	ON_UPDATE_COMMAND_UI(ID_STATS, OnUpdateStats)
	ON_UPDATE_COMMAND_UI(ID_TESTDEFILEMENT, OnUpdateTestdefilement)
	ON_UPDATE_COMMAND_UI(ID_TESTMIRE, OnUpdateTestmire)
	ON_COMMAND(ID_FILE_MRU_FILE1, OnFileMruFile1)
	ON_COMMAND(ID_FILE_MRU_FILE2, OnFileMruFile2)
	ON_COMMAND(ID_FILE_MRU_FILE3, OnFileMruFile3)
	ON_COMMAND(ID_FILE_MRU_FILE4, OnFileMruFile4)
	ON_COMMAND(ID_FILE_MRU_FILE5, OnFileMruFile5)
	ON_COMMAND(ID_FILE_MRU_FILE6, OnFileMruFile6)
	ON_COMMAND(ID_FILE_MRU_FILE7, OnFileMruFile7)
	ON_COMMAND(ID_FILE_MRU_FILE8, OnFileMruFile8)
	ON_COMMAND(ID_FILE_MRU_FILE9, OnFileMruFile9)
	//}}AFX_MSG_MAP
	// Standard file based document commands
	ON_COMMAND(ID_FILE_NEW, CWinApp::OnFileNew)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CVTermApp construction

CVTermApp::CVTermApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CVTermApp object

CVTermApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CVTermApp initialization

BOOL CVTermApp::InitInstance()
{
//  WORD wVersionRequested;
//  int err;
//  wVersionRequested = MAKEWORD( 2, 0 );
//  err = WSAStartup( wVersionRequested, &wsaData );

  if (!AfxSocketInit(&wsaData))
  {
    AfxMessageBox(IDP_SOCKETS_INIT_FAILED);
    return FALSE;
  }

  // Standard initialization
  Enable3dControls();

  //  LoadStdProfileSettings();  // Load standard INI file options (including MRU)
  LitParametres();

  // Détermine mon adresse IP automatiquement si l'option manuelle n'est pas cochée
  // Plante Winsock32 sur Athos !
  if (!(iOptions & OPT_IDMAN))
  {
	// On récupère l'adresse IP de la machine qui exécute VTerm
	char     szHostname[100];
	HOSTENT *pHostEnt;
	gethostname(szHostname, sizeof(szHostname));
    pHostEnt = gethostbyname(szHostname);
    strcpy(szMonAdresseIP, inet_ntoa(*(struct in_addr *)*pHostEnt->h_addr_list));
  }

  // Register the application's document templates.  Document templates
  //  serve as the connection between documents, frame windows and views.
  CMultiDocTemplate* pDocTemplate;
  pDocTemplate = new CMultiDocTemplate(
	  IDR_VTERMTYPE,
	  RUNTIME_CLASS(CVTermDoc),
	  RUNTIME_CLASS(CMDIChildWnd),          // standard MDI child frame
	  RUNTIME_CLASS(CVTermView));
  AddDocTemplate(pDocTemplate);

  // create main MDI Frame window
  CMainFrame* pMainFrame = new CMainFrame;
  if (!pMainFrame->LoadFrame(IDR_MAINFRAME))
	  return FALSE;
  m_pMainWnd = pMainFrame;

  CString sLogin, sPassword, sTerminal;

  int i;
  BOOL bDocumentOuvert = FALSE;
  for (i=1 ; i<__argc ; i++)
  {
	if (__argv[i][0]=='-' || __argv[i][0]=='/')
	{
	  if (stricmp(__argv[i]+1, "d")==0)
		bOptDebug = TRUE;
	  else if (strnicmp(__argv[i]+1, "l", 1)==0)
	  {
		if (strlen(__argv[i])>2)
		  sLogin = __argv[i]+2;
		else
		{
		  if (i==__argc-1)
		  {
			Usage();
		    return FALSE;
		  }
		  sLogin = __argv[++i];
		}
	  }
	  else if (strnicmp(__argv[i]+1, "p", 1)==0)
	  {
		if (strlen(__argv[i])>2)
		  sPassword = __argv[i]+2;
		else
		{
		  if (i==__argc-1)
		  {
			Usage();
		    return FALSE;
		  }
		  sPassword = __argv[++i];
		}
	  }
	  else if (strnicmp(__argv[i]+1, "t", 1)==0)
	  {
		if (strlen(__argv[i])>2)
		  sTerminal = __argv[i]+2;
		else
		{
		  if (i==__argc-1)
		  {
			Usage();
		    return FALSE;
		  }
		  sTerminal = __argv[++i];
		}
	  }
	  else
	  {
		Usage();
		return FALSE;
	  }
	}
	else
	{
	  // Fichier à ouvrir
	  CString sDoc(__argv[i]);
	  sDoc += "|" + sLogin + "|" + sPassword + "|" + sTerminal + "|";
	  OpenDocumentFile(sDoc);
	  bDocumentOuvert = TRUE;
	}
  }

  if(!bDocumentOuvert)     // create a new (empty) document
    OnFileNew();

  // La première fenêtre est aggrandie
  if (GetOpenDocumentCount()>0)
	pMainFrame->MDIMaximize(pMainFrame->MDIGetActive(NULL));

  return TRUE;
}

void CVTermApp::Usage() 
{
  ::MessageBox(NULL, "Arguments d'appel incorrects !\n\nUsage: vterm [[-l login] [-p password] [-t terminal] host]", "VTerm", MB_OK);
}

int CVTermApp::ExitInstance() 
{
  // On nettoie proprement avant de quitter
  if (bAvecPalette)
  {	delete pCPal;
	free(pLogPalette);
  }

  SauveParametres();
  return CWinApp::ExitInstance();
}

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	CString	m_Version;
	//}}AFX_DATA

// Implementation
protected:
	virtual BOOL OnInitDialog();
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//{{AFX_MSG(CAboutDlg)
		// No message handlers
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	m_Version.LoadString(IDS_VERSION);	// = _T("");
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	DDX_Text(pDX, IDC_VERSION, m_Version);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

// App command to run the dialog
void CVTermApp::OnAppAbout()
{
	CAboutDlg aboutDlg;
	aboutDlg.DoModal();
}

void CVTermApp::OnAboutWinsock() 
{
	CAboutWinsock aboutWinsockDlg;
	aboutWinsockDlg.DoModal();
}


BOOL CAboutDlg::OnInitDialog()
{
  CDialog::OnInitDialog();

#ifdef AVEC_AFFICHAGE_MEMOIRE
  CString strFreeMemory;
  CString strFmt;

  // Fill available memory
  MEMORYSTATUS MemStat;
  MemStat.dwLength = sizeof(MEMORYSTATUS);
  GlobalMemoryStatus(&MemStat);
  strFmt.LoadString(CG_IDS_PHYSICAL_MEM);
  strFreeMemory.Format(strFmt, MemStat.dwTotalPhys / 1024L);

  //TODO: Add a static control to your About Box to receive the memory
  //      information.  Initialize the control with code like this:
  SetDlgItemText(IDC_PHYSICAL_MEM, strFreeMemory);

#endif

  return TRUE;
}


//====================================================================================
// Maintien de l'interface

// Pour griser ou non le bouton "fenêtre suivante", on compte le nombre de
// fenêtres ouvertes. La technique employée ne me semble pas des plus
// directes, mais j'ai pas trouvé mieux...
// Ce qui est curieux c'est que la commande elle-même est traitée par la classe
// CMainFrame, mais que son activation/désactivation est traitée par CVTermApp
void CVTermApp::OnUpdateNextWindow(CCmdUI* pCmdUI) 
{
  int iNbWin = 0;

  POSITION p0 = GetFirstDocTemplatePosition();
  while (p0!=NULL)
  {
	CDocTemplate* pDocTemplate = GetNextDocTemplate(p0);
	POSITION p1 = pDocTemplate->GetFirstDocPosition();
	while (p1!=NULL)
	{
	  CDocument *pDoc = pDocTemplate->GetNextDoc(p1);
	  POSITION p2 = pDoc->GetFirstViewPosition();
	  while (p2!=NULL)
	  {
		CView* pView = pDoc->GetNextView(p2);
		iNbWin++;
	  }
	}
  }

  pCmdUI->Enable(iNbWin>1);
}


void CVTermApp::OnUpdateEditPaste(CCmdUI* pCmdUI) 
{
  pCmdUI->Enable((IsClipboardFormatAvailable(CF_OEMTEXT)||IsClipboardFormatAvailable(CF_TEXT)) && GetOpenDocumentCount()>0);
};

//====================================================================================

void CVTermApp::OnOptions() 
{
  COptions dlg;

  dlg.m_bRenduBrillant = iOptions & OPT_RENDUBRILLANT;
  dlg.m_bRenduGras = iOptions & OPT_RENDUGRAS;
  dlg.m_iCodage8 = (iOptions & OPT_ANSI) ? 1 : 0;
  dlg.m_bNoEscV = (iOptions & OPT_NOESCV) ? 1 : 0;
  dlg.m_bIdentificationManuelle = (iOptions & OPT_IDMAN) ? 1 : 0;
  dlg.m_sAdresseClient = szMonAdresseIP;
  dlg.m_b128128 = (iOptions & OPT_128128) ? 1 : 0;
  dlg.m_bPointPN = (iOptions & OPT_POINTPN) ? 1 : 0;

  if (iLignesDefautOptions==32 && iColonnesDefautOptions==102)
	dlg.m_iTailleDefaut = 1;
  else if (iLignesDefautOptions==43 && iColonnesDefautOptions==132)
	dlg.m_iTailleDefaut = 2;
  else
	dlg.m_iTailleDefaut = 0;


  if (dlg.DoModal()==IDOK)
  {
    int iOptionsOrigine = iOptions;
	int iLignesDefautOptionsOrigine = iLignesDefautOptions;
	int iColonnesDefautOptionsOrigine = iColonnesDefautOptions;

	iOptions &= ~(OPT_RENDUBRILLANT|OPT_RENDUGRAS|OPT_ANSI|OPT_NOESCV|OPT_IDMAN|OPT_128128|OPT_POINTPN);
	if (dlg.m_bRenduBrillant) iOptions |= OPT_RENDUBRILLANT;
	if (dlg.m_bRenduGras) iOptions |= OPT_RENDUGRAS;
	if (dlg.m_iCodage8==1) iOptions |= OPT_ANSI;
	if (dlg.m_bNoEscV) iOptions |= OPT_NOESCV;
	if (dlg.m_bIdentificationManuelle) iOptions |= OPT_IDMAN;
	if (dlg.m_bIdentificationManuelle)
	  strcpy(szMonAdresseIP, dlg.m_sAdresseClient);	// Limité à 15 caractères par les MFC
	if (dlg.m_b128128) iOptions |= OPT_128128;
	if (dlg.m_bPointPN) iOptions |= OPT_POINTPN;

	switch(dlg.m_iTailleDefaut)
	{
	  default:	iLignesDefautOptions=25; iColonnesDefautOptions=80;	  break;
	  case 1:	iLignesDefautOptions=32; iColonnesDefautOptions=102;  break;
	  case 2:	iLignesDefautOptions=43; iColonnesDefautOptions=132;  break;
	}

	ReaffichageComplet((iOptionsOrigine&OPT_ANSI)!=(iOptions & OPT_ANSI) || iLignesDefautOptionsOrigine!=iLignesDefautOptions || iColonnesDefautOptionsOrigine!=iColonnesDefautOptions);
  }
}


void CVTermApp::OnCouleurs() 
{
  CCouleurs dlg;
  
  if (dlg.DoModal()==IDOK)
	ReaffichageComplet();
}

//============================================================================

static void SauveParametres()
{
  char szCle[4];
  HKEY hKey;
  long lStatus;
  DWORD dwDisp;
  int i;

  // Ok l'application est en 1.1.x mais le profile 1.0 est compatible !
  lStatus = RegCreateKeyEx(HKEY_CURRENT_USER, "Software\\PViolent\\VTerm\\1.0", 
	0, "", 0, KEY_ALL_ACCESS, NULL,	&hKey, &dwDisp);
  ASSERT(lStatus==ERROR_SUCCESS);

  // On mémorise les couleurs
  if (bCouleursModifiees)
  {
	for (i=0 ; i<16 ; i++)
	{
	  sprintf(szCle, "C%d", i);
	  lStatus = RegSetValueEx(hKey, szCle,
		(DWORD)0, REG_DWORD,
		(const unsigned char *)&tcolCouleurs[i], sizeof(int));
	}
  }

  RegSetValueEx(hKey, "Options", (DWORD)0, REG_DWORD, (const unsigned char *)&iOptions, sizeof(int));
  RegSetValueEx(hKey, "Police", (DWORD)0, REG_SZ, (const unsigned char *)szFont, strlen(szFont)+1);
  RegSetValueEx(hKey, "MonAdresseIP", (DWORD)0, REG_SZ, (const unsigned char *)szMonAdresseIP, strlen(szMonAdresseIP)+1);

  RegSetValueEx(hKey, "Lignes", (DWORD)0, REG_DWORD, (const unsigned char *)&iLignesDefautOptions, sizeof(int));
  RegSetValueEx(hKey, "Colonnes", (DWORD)0, REG_DWORD, (const unsigned char *)&iColonnesDefautOptions, sizeof(int));

  // On sauve les connexions récentes
  for (i=0 ; i<CR.Count() ; i++)	  // Ok, réévalué à chaque fois mais pas lourd !
  {
	CString sRecent;

	sRecent = CR.sGetRecent(i);
	sprintf(szCle, "R%d", i);
	lStatus = RegSetValueEx(hKey, szCle,
	  (DWORD)0, REG_SZ,
	  (const unsigned char *)(const char *)sRecent, sRecent.GetLength()+1);
	// lStatus n'est pas testé
  }

  // On efface les clés complémentaires suite à un effacement de la liste des connexions récentes
  for ( ; i<MAXRECENT ; i++)
  {
	sprintf(szCle, "R%d", i);
	lStatus = RegDeleteValue(hKey, szCle);
	// lStatus n'est toujours pas pas testé... Et c'est un tort parce que ça m'aurait permis
	// de détecter ma confusion RegDeleteKey/RegDeleteValue plus rapidement !
  }

  RegCloseKey(hKey);
}


// Détermine si la résolution écran a au moins 1024 colonnes
int bEcran1024()
{
  int iCol = GetSystemMetrics(SM_CXFULLSCREEN);
  return iCol>=1024;
}


// Lecture des paramètres dans la registry
static void LitParametres()
{
  HKEY hKey;
  long lStatus;
  DWORD dwDisp, dwType, dwSize;
  int i;
  char szCle[4];

  lStatus = RegCreateKeyEx(HKEY_CURRENT_USER, "Software\\PViolent\\VTerm\\1.0", 
	0, "", 0, KEY_ALL_ACCESS, NULL,	&hKey, &dwDisp);
  ASSERT(lStatus==ERROR_SUCCESS);

  // On lit les couleurs
  for (i=0 ; i<16 ; i++)
  {
	dwType = REG_DWORD;
	dwSize = sizeof(int);

	sprintf(szCle, "C%d", i);
	lStatus = RegQueryValueEx(hKey, szCle, NULL, &dwType, (unsigned char *)&tcolCouleurs[i], &dwSize);
	if (lStatus!=ERROR_SUCCESS)
	  tcolCouleurs[i] = tcolCouleursDefaut[i];

	if (i==9 && tcolCouleurs[i]==RGB(0,0,255))
	  tcolCouleurs[i]=tcolCouleursDefaut[i];	  // violet clair
	else if (i==8 && tcolCouleurs[i]==RGB(160,160,164))
	  tcolCouleurs[i]=tcolCouleursDefaut[i];	  // "noir clair"
  }


  lStatus = RegQueryValueEx(hKey, "Options", NULL, &dwType, (unsigned char *)&iOptions, &dwSize);
  if (lStatus!=ERROR_SUCCESS)
    iOptions = OPT_RENDUGRAS|OPT_RENDUBRILLANT;


  lStatus = RegQueryValueEx(hKey, "Lignes", NULL, &dwType, (unsigned char *)&iLignesDefautOptions, &dwSize);
  if (lStatus!=ERROR_SUCCESS)
    iLignesDefautOptions = bEcran1024() ? 32 : 25;

  lStatus = RegQueryValueEx(hKey, "Colonnes", NULL, &dwType, (unsigned char *)&iColonnesDefautOptions, &dwSize);
  if (lStatus!=ERROR_SUCCESS)
    iColonnesDefautOptions = bEcran1024() ? 102 : 80;


  dwType = REG_SZ;
  dwSize = sizeof(szFont);
  lStatus = RegQueryValueEx(hKey, "Police", NULL, &dwType, (unsigned char *)szFont, &dwSize);
  if (lStatus!=ERROR_SUCCESS)
    strcpy(szFont, "Lucida Console");

  dwSize = sizeof(szMonAdresseIP);
  lStatus = RegQueryValueEx(hKey, "MonAdresseIP", NULL, &dwType, (unsigned char *)szMonAdresseIP, &dwSize);
  if (lStatus!=ERROR_SUCCESS)
    szMonAdresseIP[0] = 0;


  // On lit les connexions récentes
  for (i=MAXRECENT-1 ; i>=0 ; i--)
  {
	char szRecent[32];

	sprintf(szCle, "R%d", i);
	dwType = REG_SZ;
	dwSize = sizeof(szRecent);
	lStatus = RegQueryValueEx(hKey, szCle, NULL, &dwType, (unsigned char *)szRecent, &dwSize);
	if (lStatus==ERROR_SUCCESS)
	  CR.AddRecent(szRecent);
  }

  RegCloseKey(hKey);
  bCouleursModifiees = FALSE;
}

void CVTermApp::OnUpdateFileMruFile1(CCmdUI* pCmdUI) 
{
  CR.UpdateMenu(pCmdUI);
}

void CVTermApp::OnFileMruFile1() 
{
  OpenDocumentFile(CR.sGetRecent(0));
}

void CVTermApp::OnFileMruFile2() 
{
  OpenDocumentFile(CR.sGetRecent(1));
}

void CVTermApp::OnFileMruFile3() 
{
  OpenDocumentFile(CR.sGetRecent(2));
}

void CVTermApp::OnFileMruFile4() 
{
  OpenDocumentFile(CR.sGetRecent(3));
}

void CVTermApp::OnFileMruFile5() 
{
  OpenDocumentFile(CR.sGetRecent(4));
}

void CVTermApp::OnFileMruFile6() 
{
  OpenDocumentFile(CR.sGetRecent(5));
}

void CVTermApp::OnFileMruFile7() 
{
  OpenDocumentFile(CR.sGetRecent(6));
}

void CVTermApp::OnFileMruFile8() 
{
  OpenDocumentFile(CR.sGetRecent(7));
}

void CVTermApp::OnFileMruFile9() 
{
  OpenDocumentFile(CR.sGetRecent(8));
}

// On fait disparaitre les commandes de trace dans la version finale
// mais elles sont toujours présentes par le biais de l'option -d
// ou de leur accélérateur clavier
void CVTermApp::OnUpdateTestperformances(CCmdUI* pCmdUI) 
{
#ifndef _DEBUG
  if (!bOptDebug && pCmdUI->m_pMenu!=NULL)
  {
	pCmdUI->m_pMenu->DeleteMenu(pCmdUI->m_nID, MF_BYCOMMAND);
	pCmdUI->m_pMenu->DeleteMenu(4, MF_BYPOSITION);
  }
#endif
}

void CVTermApp::OnUpdateStats(CCmdUI* pCmdUI) 
{
#ifndef _DEBUG
  if (!bOptDebug && pCmdUI->m_pMenu!=NULL)
	pCmdUI->m_pMenu->DeleteMenu(pCmdUI->m_nID, MF_BYCOMMAND);
#endif
}

void CVTermApp::OnUpdateTestdefilement(CCmdUI* pCmdUI) 
{
#ifndef _DEBUG
  if (!bOptDebug && pCmdUI->m_pMenu!=NULL)
	pCmdUI->m_pMenu->DeleteMenu(pCmdUI->m_nID, MF_BYCOMMAND);
#endif
}

void CVTermApp::OnUpdateTestmire(CCmdUI* pCmdUI) 
{
#ifndef _DEBUG
  if (!bOptDebug && pCmdUI->m_pMenu!=NULL)
	pCmdUI->m_pMenu->DeleteMenu(pCmdUI->m_nID, MF_BYCOMMAND);
#endif
}



//============================================================================
// Convertit une chaîne ANSI dans la locale d'affichage courante

CString sANSItoLocale(const char *s)
{
  if (iOptions&OPT_ANSI)
	return s;
  else
  {
	char t[200];	// A priori suffisant

	CharToOem(s, t);
	return t;
  }
}
