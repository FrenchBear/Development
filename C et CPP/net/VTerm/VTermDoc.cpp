// VTermDoc.cpp : implémentation de la classe CVTermDoc
// 30/06/96 PV
// 29/07/96 Port variable; Messages d'état sur l'avancement de la connexion
//  1/11/96 Port intégré au nom; connexion interruptible
// 29/11/98 Possibilité de recommencer sur un échec au send...
//  7/12/98 Sauvegarde des attributs courants lors de l'affichage de la mire
//  1/11/00 Retourne les types de terminaux ansi-m pour 32x80 et ansi-w pour 43x132


#include "stdafx.h"
#include "VTerm.h"
#include "VTermSock.h"
#include "VTermDoc.h"
#include "RemoteHost.h"
#include "mainfrm.h"
#include "VTermGlobal.h"

//#include <stdio.h>	  // Pour les tests

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif


#include "telnet.h"	  // Fichier unix <arpa/telnet.h> original

// Etats de l'automate de décodage protocole TELNET
enum
{
  TS_DATA, TS_IAC, TS_DO, TS_DONT, TS_WILL, TS_WONT, TS_SB, TS_SBTTYPE,
  TS_A1,	// Attente de IAC à la fin d'un SB
  TS_A2,	// Attente de SE à la fin d'un SB
};


/////////////////////////////////////////////////////////////////////////////
// CVTermDoc

IMPLEMENT_DYNCREATE(CVTermDoc, CDocument)

BEGIN_MESSAGE_MAP(CVTermDoc, CDocument)
	//{{AFX_MSG_MAP(CVTermDoc)
	ON_COMMAND(ID_FILE_CLOSE, OnFileClose)
	ON_UPDATE_COMMAND_UI(ID_FILE_CLOSE, OnUpdateFileClose)
	ON_COMMAND(ID_TESTMIRE, OnTestMire)
	ON_COMMAND(ID_TESTPERFORMANCES, OnTestPerformances)
	ON_COMMAND(ID_TESTDEFILEMENT, OnTestDefilement)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// Utilitaire...

static void SetStatus(CString sStatusMessage)
{
  ((CMainFrame*)(AfxGetApp()->m_pMainWnd))->SetStatus(sStatusMessage);
}

/////////////////////////////////////////////////////////////////////////////
// CVTermDoc construction/destruction

CVTermDoc::CVTermDoc()
{
  m_pSocket = NULL;
  m_iTelnetState = TS_DATA;

  m_bModeEcho = FALSE;
  m_bEchoLocal = FALSE;
}

CVTermDoc::~CVTermDoc()
{
}


/////////////////////////////////////////////////////////////////////////////
// CVTermDoc diagnostics

#ifdef _DEBUG
void CVTermDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CVTermDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// Envoi de caractère au terminal

void CVTermDoc::DoCaractereTerm(char c)
{
  m_Term.DoCaractere(c);
  if (m_Term.bVueAMettreAJour())
	UpdateAllViews(NULL, 0, &m_Term.m_Hint);

  if (m_Term.m_bATransmettre)
  {
//	MessageBox(NULL, "Transmission VTerm -> Host", "CVTermDoc::DoCaractereTerm", MB_OK);
	char *s = m_Term.m_sTrans.GetBuffer(m_Term.m_iNbLignes*m_Term.m_iNbColonnes+1);
	EnvoieChaineHost(s, strlen(s));
	m_Term.m_sTrans.ReleaseBuffer();
  }
}


void CVTermDoc::SynchroCurseurTerm()
{
  m_Term.m_Hint.iCurseurDeplace = 2;
  UpdateAllViews(NULL, 0, &m_Term.m_Hint);
}

// On empêche de sortir par fermeture de fenêtre et d'application directe
BOOL CVTermDoc::SaveModified() 
{
	// TODO: Add your specialized code here and/or call the base class
  if (m_pSocket!=NULL)
  {	MessageBox(NULL, "Déconnectez-vous avant de fermer la fenêtre ou de quitter VTerm!", "VTerm", MB_OK);
    return FALSE;
  }
	
  return CDocument::SaveModified();
}

//////////////////////////////////////////////////////////////////////////////////////
// Déconnexion

void CVTermDoc::OnFileClose() 
{
  if (m_pSocket!=NULL)
  {
	int iRep = MessageBox(NULL, "Attention !\n\nLa commande de déconnexion ne doit être utilisée que si l'ordinateur distant ne répond plus, ou que la déconnexion normale ne fonctionne pas.",
	  "VTerm", MB_ICONWARNING|MB_OKCANCEL|MB_DEFBUTTON2);
	if (iRep==IDOK)
      Deconnexion();
  }

  //CDocument::OnCloseDocument();
}

void CVTermDoc::Deconnexion()
{
  CString sTitre;
  sTitre = m_sHost + " [" + m_sHostAddr + "] (Déconnecté)";
  SetTitle(sTitre);

  if (m_pSocket!=NULL)
  {
	delete m_pSocket;
	m_pSocket = NULL;

    DoChaineTerm(sANSItoLocale("\r\r\n\n\033[1;37;44m[Déconnecté]"));
	DoSync();
	iNbConnexionsActives--;
	ASSERT(iNbConnexionsActives>=0);
  }
}

//////////////////////////////////////////////////////////////////////////////////////
// Communication avec le host

// CVTermDoc::EnvoieChaineHost n'est pas implanté comme une succession d'appels
// à CVTermDoc::EnvoieCaractereHost car outre les problèmes de charge réseau
// que cela génère, vi ne reconnaît plus les touches de fonction une fois sur 3...
void CVTermDoc::EnvoieChaineHost(const char *s, int iLg, BOOL bEchoTerminal)
{
  if (m_pSocket!=NULL)
  {
	if (m_pSocket->Send(s, iLg)==SOCKET_ERROR)
	{
	  int iErr = WSAGetLastError();

	  if (iErr==WSAECONNRESET && m_pSocket!=NULL)
	  {
		Deconnexion();	// Déconnexion non détectée
	  }
	  else
	  {
		char szMessage[200];
		sprintf(szMessage, "Échec à l'envoi de la chaîne '%s'\r\nErr = %d", s, iErr);
		MessageBox(NULL, szMessage, "CVTermDoc::EnvoieChaineHost", MB_OK);
	  }
	}

  }

  // Bouclage local pour les tests
  if (m_bEchoLocal || bEchoTerminal)
  {
    DoChaineTerm(s);
	SynchroCurseurTerm();
  }
}


void CVTermDoc::EnvoieCaractereHost(char c)
{
  char sBuffer[2];

  sBuffer[0] = c;
  sBuffer[1] = 0;
  EnvoieChaineHost(sBuffer, 1);
}

//////////////////////////////////////////////////////////////////////////////////////
// Tests

#ifdef _DEBUG

#include <sys/timeb.h>

void CVTermDoc::TestFichier(char *szNomfic)
{
  FILE *f;
  int c;
  struct _timeb td, tf;

  f = fopen(szNomfic, "r");
  if (f==NULL)
  {
	CString sMessage("Échec à l'ouverture du fichier '");
	sMessage += szNomfic;
	sMessage += "'\n";
	sMessage += sys_errlist[errno];
	MessageBox(NULL, sMessage, "CVTermDoc::TestFichier()", MB_OK);
	return;
  }

  _ftime(&td);
  int iNbCar = 0;
  while ((c=fgetc(f))!=EOF && iNbCar++<30000)
	DoCaractere(c);		  // On passe par le protocole telnet pour mesurer son influence
  SynchroCurseurTerm();	  // On termine proprement l'affichage !
  fclose(f);
  _ftime(&tf);

  //exit(0);			  // Pour le profilage du code, sortie immédiate après le test

  double duree = tf.time+tf.millitm/1000.0 - (td.time+td.millitm/1000.0);
  int vitesse = (int)(iNbCar/duree);
  char szMessage[200];
  sprintf(szMessage, "%5.2f s pour %d caractères de test\nVitesse : %d car/s",
	duree, iNbCar, vitesse);
  MessageBox(NULL, szMessage, "CVTermDoc::OnTest()", MB_OK);
}

void CVTermDoc::OnTestPerformances() 
{
  TestFichier("Test performances.txt");
}

void CVTermDoc::OnTestDefilement() 
{
  TestFichier("Test défilement.txt");
}

#else

void CVTermDoc::OnTestPerformances() {}
void CVTermDoc::OnTestDefilement() {}

#endif


// Affiche une petite mire de test
void CVTermDoc::OnTestMire() 
{
  int l,c;
  char szBuffer[60];

  // On mémorise les réglages actuels
  m_Term.SaveExtendedAttributes();

  DoChaineTerm("\033[0m\033[2J\033[H");
  DoChaineTerm(sANSItoLocale("Il \033[1métait\033[0m un \033[4mpetit\033[0m \033[7mnavire\033[0m\r\nQui n'avait \033[5mjamais\033[0m navigué \033[8mOhé\033[0m ohé matelot...\r\n\n"));

  // Tableau de caractères simples
  for (l=0 ; l<16 ; l++)
  {
	sprintf(szBuffer, "\033[%d;1H", l+5);
	DoChaineTerm(szBuffer);
	if (l==0) DoChaineTerm("\033[11m");
	if (l==2) DoChaineTerm("\033[10m");
	for (c=0 ; c<16 ; c++)
	{
	  DoCaractereTerm((l<<4)+c);
	  if (c!=15)
		DoCaractereTerm(' ');
	}
  }

  // Tableau de caractères semi-graphiques
  for (l=0 ; l<8 ; l++)
  {
	sprintf(szBuffer, "\033[%d;35H", l+5);
	DoChaineTerm(szBuffer);
	for (c=0 ; c<16 ; c++)
	{
	  unsigned char ch = (l<<4)+c;

	  if (ch!=27)
	  {
		DoChaineTerm("\033[12m");
		DoCaractereTerm(ch);
		DoChaineTerm("\033[10m");
	  }
	  else
	    DoCaractereTerm(' ');

	  if (c!=15)
	    DoCaractereTerm(' ');
	}
  }

  // Fenêtre simple
  DoChaineTerm("\033[5;72H\033[12mZDDBDD?\033[10m");
  DoChaineTerm("\033[6;72H\033[12m3\033[10m  \033[12m3\033[10m  \033[12m3\033[10m");
  DoChaineTerm("\033[7;72H\033[12mCDDEDD4\033[10m");
  DoChaineTerm("\033[8;72H\033[12m3\033[10m  \033[12m3\033[10m  \033[12m3\033[10m");
  DoChaineTerm("\033[9;72H\033[12m@DDADDY\033[10m");

  // Fenêtre double
  DoChaineTerm("\033[10;72H\033[12mIMMKMM;\033[10m");
  DoChaineTerm("\033[11;72H\033[12m:\033[10m  \033[12m:\033[10m  \033[12m:\033[10m");
  DoChaineTerm("\033[12;72H\033[12mLMMNMM9\033[10m");
  DoChaineTerm("\033[13;72H\033[12m:\033[10m  \033[12m:\033[10m  \033[12m:\033[10m");
  DoChaineTerm("\033[14;72H\033[12mHMMJMM<\033[10m");


  // Version du programme
  CString sVersion;
  sVersion.LoadString(IDS_VERSION);
  DoChaineTerm("\033[23;1H");
  DoChaineTerm(sANSItoLocale(sVersion));


  // Couleurs
  for (l=0 ; l<8 ; l++)
  {
	sprintf(szBuffer, "\033[%d;35H\033[4%dm\033[3%dm%d ", l+14, l, l==7?0:7, 40+l);
	DoChaineTerm(szBuffer);
	for (c=0 ; c<8 ; c++)
	{ sprintf(szBuffer, "\033[3%dmx ", c);
	  DoChaineTerm(szBuffer);
	}
	for (c=0 ; c<8 ; c++)
	{ sprintf(szBuffer, "\033[3%d;1mx \033[0m", c);
	  DoChaineTerm(szBuffer);
	}
  }

  // Légendes
  char szCP[10];
  if (iOptions&OPT_ANSI)
	sprintf(szCP, "ANSI %-4d", GetACP());
  else
	sprintf(szCP, "OEM %-5d", GetOEMCP());

  DoChaineTerm(sANSItoLocale("\033[4;1H\033[37;44mCaractères standard "));
  DoChaineTerm(szCP);
  DoChaineTerm("  ");
  DoChaineTerm(sANSItoLocale("\033[4;35H\033[37;44mCaractères semi-graphiques     "));
  DoChaineTerm(sANSItoLocale("\033[13;35H\033[37;44mCombinaisons couleurs et fonds     "));
  DoChaineTerm(sANSItoLocale("\033[4;72H\033[37;44mBoîtes "));

  DoChaineTerm("\033[24;1H");
  SynchroCurseurTerm();
  m_Term.RestoreExtendedAttributes();
}


//////////////////////////////////////////////////////////////////////////////////////
// Creéationn de connexion

BOOL CVTermDoc::OnNewDocument()
{
  CRemoteHost remoteHostDlg;
  CString sTitre;

  remoteHostDlg.m_sHost = "";

// A commenter pour éviter de demander le nom d'un host
  int iBouton = remoteHostDlg.DoModal();
  if (iBouton==IDCANCEL)
	return FALSE;

  m_sHost = remoteHostDlg.m_sHost;
  m_bAutoLogin = remoteHostDlg.m_bAutoLogin;
  m_sLogin = remoteHostDlg.m_sLogin;
  m_sPassword = remoteHostDlg.m_sPassword;
  m_sTerminal = remoteHostDlg.m_sTerminal;

  if (m_sHost.IsEmpty())
  {
	sTitre = "Bouclage local pour tests";
	m_sHostAddr = "";
	m_pSocket = NULL;
	m_bEchoLocal = TRUE;
  }
  else
  {
    char szPort[10];
	int iPos = m_sHost.Find(':');
	if (iPos<0)
	  m_iPort = 23;
	else
	{
	  m_iPort = atoi(m_sHost.Right(m_sHost.GetLength()-iPos-1));
	  m_sHost = m_sHost.Left(iPos);
	}
	sprintf(szPort, "%d", m_iPort);

	if (!bDemandeDeConnexion())
	  return FALSE;

	sTitre = m_sHost;
	if (m_iPort!=23)
	{ sTitre += ":";
	  sTitre += szPort;
	}
	sTitre += " [" + m_sHostAddr + "]";
  }

// On crée la fenêtre
  if (!CDocument::OnNewDocument())
	  return FALSE;
  SetTitle(sTitre);

// En mode bouclage local, on prévient l'utilisateur...
  if (m_sHost.IsEmpty())
  {
	DoChaineTerm(sANSItoLocale("Fenêtre de test\r\nVTerm fonctionne dans un mode spécial non connecté.\r\nCtrl+F4 ferme cette fenêtre.\r\n\n"));
  }

  return TRUE;
}


BOOL CVTermDoc::OnOpenDocument(LPCTSTR lpszPathName) 
{
  int l = strlen(lpszPathName);
  char *p, *q, *r, *s;

  m_bAutoLogin = FALSE;
  while (l>0 && lpszPathName[l-1]!='\\') l--;
  if (p = strchr(lpszPathName+l, '|'))
  {
	*p = 0;
	if (q = strchr(p+1, '|'))
	{
	  *q = 0;
	  if (r = strchr(q+1, '|'))
	  {
		*r = 0;
		if (s = strchr(r+1, '|'))
		{
		  *s = 0;
		}
		m_sTerminal = r+1;
	  }
	  m_sPassword = q+1;
	}
	m_sLogin = p+1;
	m_bAutoLogin = TRUE;
  }
  m_sHost = lpszPathName+l;

  // On décode le port éventuel
  int iPos = m_sHost.Find(':');
  if (iPos<0)
	m_iPort = 23;
  else
  {
	m_iPort = atoi(m_sHost.Right(m_sHost.GetLength()-iPos-1));
	m_sHost = m_sHost.Left(iPos);
  }

  return bDemandeDeConnexion();
}


BOOL CVTermDoc::bDemandeDeConnexion()
{
  char szMessage[300], szPort[10];
  CString sNomHostMsg;
  CString sAMemoriser;
  int adr1, adr2, adr3, adr4;
  int iErr;
  BOOL bRetour = FALSE;

#define bzero(p, l) memset(p, 0, l)
#define bcopy(s, d, l) memcpy(d, s, l)

  struct hostent *hp, host;

  // On convertit le n° de port en texte pour faciliter son affichage
  sprintf(szPort, "%d", m_iPort);

  // On récupère différement un pointeur de host selon qu'on dispose de son
  // adresse ou de son nom
  if (4==sscanf((const char *)m_sHost, "%d.%d.%d.%d", &adr1, &adr2, &adr3, &adr4))
  {
	char PackedAddr[4];
    SetStatus("Recherche du nom du host " + m_sHost);

	PackedAddr[0] = (char)adr1;
	PackedAddr[1] = (char)adr2;
	PackedAddr[2] = (char)adr3;
	PackedAddr[3] = (char)adr4;
	hp = gethostbyaddr(PackedAddr, 4, PF_INET);
  }
  else
  {
    SetStatus("Recherche de l'adresse du host '" + m_sHost + "'");
	hp = gethostbyname(m_sHost);
  }
  iErr=WSAGetLastError();

  if (hp==NULL && iErr!=WSANO_DATA)
  {
    sprintf(szMessage, "Impossible de trouver l'adresse du système '%s'.\nVérifiez que vous avez correctement entré le nom du système.\n\nÉchec au gethostbyname\r\nErr = %d", (const char *)m_sHost, iErr);
    switch(iErr)
	{
	  case WSANOTINITIALISED: strcat(szMessage, ": A successful WSAStartup must occur before using this function."); break;
	  case WSAENETDOWN:		  strcat(szMessage, ": The Windows Sockets implementation has detected that the network subsystem has failed."); break;
	  case WSAHOST_NOT_FOUND: strcat(szMessage, ": Authoritative Answer Host not found."); break;
	  case WSATRY_AGAIN:	  strcat(szMessage, ": Non-Authoritative Host not found, or SERVERFAIL."); break;
	  case WSANO_RECOVERY:	  strcat(szMessage, ": Nonrecoverable errors: FORMERR, REFUSED, NOTIMP."); break;
	  //case WSANO_DATA:		  strcat(szMessage, ": Valid name, no data record of requested type."); break;
	  case WSAEINPROGRESS:	  strcat(szMessage, ": A blocking Windows Sockets operation is in progress."); break;
	  case WSAEINTR:		  strcat(szMessage, ": The (blocking) call was canceled using WSACancelBlockingCall"); break;
	}
	MessageBox(NULL, szMessage, "VTerm", MB_OK);
	goto fin;
  }

  if (hp!=NULL)
  {
	bcopy(hp, &host, sizeof(host));

	// On récupère le nom, qu'on ait entré une adresse ou un synonyme
	int i;
	for (i=strlen(host.h_name) ; i-- ; )
	  if (host.h_name[i]=='.') host.h_name[i] = 0;
	m_sHost = host.h_name;
	// Et l'adresse
	m_sHostAddr = inet_ntoa(*(struct in_addr *)*host.h_addr_list);

	sNomHostMsg = "'" + m_sHost + "' (" + m_sHostAddr + ")";
  }
  else
  {
	m_sHostAddr = m_sHost;
	m_sHost.Empty();

	sNomHostMsg = m_sHostAddr;
  }
  sNomHostMsg += " port ";
  sNomHostMsg += szPort;

  SetStatus("Initialisation de la connexion");
  m_pSocket = new CVTermSocket(this);
  if (!m_pSocket->Create())
  {
	delete m_pSocket;
	m_pSocket = NULL;
	sprintf(szMessage, "Échec à la création du socket vers le host %s\n\nÉchec au Create()\rErr = %d", (const char *)sNomHostMsg, WSAGetLastError());
	MessageBox(NULL, szMessage, "VTerm", MB_OK);
	goto fin;
  }

  SetStatus("Connexion au host " + sNomHostMsg);
  for(;;)
  {
	m_pSocket->bConnectDone = FALSE;
	if (m_pSocket->Connect(m_sHostAddr, m_iPort))
	  break;
  	iErr = WSAGetLastError();

    sprintf(szMessage, "Échec à la connexion au host %s\n\nÉchec au Connect()\nErr = %d", (const char *)sNomHostMsg, iErr);
	switch(iErr)
	{
	  case WSANOTINITIALISED: strcat(szMessage, ": A successful AfxSocketInit must occur before using this API."); break;
	  case WSAENETDOWN:		  strcat(szMessage, ": The Windows Sockets implementation detected that the network subsystem failed."); break;
	  case WSAEADDRINUSE:	  strcat(szMessage, ": The specified address is already in use."); break;
	  case WSAEINPROGRESS:	  strcat(szMessage, ": A blocking Windows Sockets call is in progress."); break;
	  case WSAEADDRNOTAVAIL:  strcat(szMessage, ": The specified address is not available from the local machine."); break;
	  case WSAEAFNOSUPPORT:	  strcat(szMessage, ": Addresses in the specified family cannot be used with this socket."); break;
	  case WSAECONNREFUSED:	  strcat(szMessage, ": The attempt to connect was rejected."); break;
	  case WSAEDESTADDRREQ:	  strcat(szMessage, ": A destination address is required."); break;
	  case WSAEFAULT:		  strcat(szMessage, ": The nSockAddrLen argument is incorrect."); break;
	  case WSAEINVAL:		  strcat(szMessage, ": The socket is not already bound to an address."); break;
	  case WSAEISCONN:		  strcat(szMessage, ": The socket is already connected."); break;
	  case WSAEMFILE:		  strcat(szMessage, ": No more file descriptors are available."); break;
	  case WSAENETUNREACH:	  strcat(szMessage, ": The network cannot be reached from this host at this time."); break;
	  case WSAENOBUFS:		  strcat(szMessage, ": No buffer space is available. The socket cannot be connected."); break;
	  case WSAENOTSOCK:		  strcat(szMessage, ": The descriptor is a file, not a socket."); break;
	  case WSAETIMEDOUT:	  strcat(szMessage, ": Attempt to connect timed out without establishing a connection.\n[Le host est peut-être éteint, ou injoignable]"); break;
	  case WSAEWOULDBLOCK:	  strcat(szMessage, ": The socket is marked as nonblocking and the connection cannot be completed immediately."); break;
	}

	strcat(szMessage, "\n\nVoulez-vous recommencer ?");

	if (AfxMessageBox(szMessage, MB_YESNO) == IDNO)
	{
	  delete m_pSocket;
	  m_pSocket = NULL;
	  goto fin;
	}
  }

  // On mémorise la connexion dans l'historique
  if (m_sHost.IsEmpty())
	sAMemoriser = m_sHostAddr;
  else
	sAMemoriser = m_sHost;
  if (m_iPort!=23)
  {
	sAMemoriser += ":";
	sAMemoriser += szPort;
  }
  CR.AddRecent(sAMemoriser);

  iNbConnexionsActives++;
  bRetour = TRUE;

fin:
  SetStatus("Prêt");
  return bRetour;
}


/////////////////////////////////////////////////////////////////////////////
// Décodage Telnet

void CVTermDoc::EnvoieNegociation(unsigned char cCmd, unsigned char cOpt)
{
  char szCmd[3];

  szCmd[0] = (char)IAC;
  szCmd[1] = cCmd;
  szCmd[2] = cOpt;

  EnvoieChaineHost(szCmd, 3);
}


void CVTermDoc::DoCaractereNegociation(unsigned char cOpt)
{
  switch(cOpt)
  {
	case TELOPT_ECHO:
	case TELOPT_TTYPE:
	case TELOPT_SGA:
	  switch(m_iTelnetState)
	  {
		case TS_DO:	  
		  m_bModeEcho = TRUE;
		  EnvoieNegociation(WILL, cOpt);
		  break;
		case TS_WILL:
		  m_bModeEcho = TRUE;
		  EnvoieNegociation(DO, cOpt);
		  break;
		case TS_DONT:
		  m_bModeEcho = FALSE;
		  EnvoieNegociation(WONT, cOpt);
		  break;
		case TS_WONT:
		  m_bModeEcho = FALSE;
		  EnvoieNegociation(DONT, cOpt);
		  break;
	  }
	  break;

	default:
	  switch(m_iTelnetState)
	  {
		case TS_DO:		EnvoieNegociation(WONT, cOpt);	  break;
		case TS_WILL:	EnvoieNegociation(DONT, cOpt);	  break;
		case TS_DONT:	EnvoieNegociation(WONT, cOpt);	  break;
		case TS_WONT:	EnvoieNegociation(DONT, cOpt);	  break;
	  }
	  break;
  }

  m_iTelnetState = TS_DATA;
}


void CVTermDoc::DoCaractereIAC(char c)
{
  switch((unsigned char)c)
  {
	// IAC IAC: correspond à un simple IAC pour le terminal
	case IAC:
	  DoCaractereTerm(c);
	  break;

	case DO:	m_iTelnetState = TS_DO;	   return;
	case DONT:  m_iTelnetState = TS_DONT;  return;
	case WILL:  m_iTelnetState = TS_WILL;  return;
	case WONT:  m_iTelnetState = TS_WONT;  return;

	case SB:	m_iTelnetState = TS_SB;  return;

	// Normalement un DM se traite en NOP, mais si on a raté
	// une transmission en OOB de SYNC DM, on flushe...
  	case DM:	DoSync(); break;

	default:		  // Cas du protocole non géré
	  //ASSERT(FALSE);		// Apres un Del on reçoit un IAC simple ???????
	  DoCaractereTerm(c);
	  break;
  }
  m_iTelnetState = TS_DATA;
}


void CVTermDoc::DoCaractereSB(char c)
{

  switch(c)
  {
	case TELOPT_TTYPE:
	  m_iTelnetState = TS_SBTTYPE;
	  return;

	// Subnegociation non reconnue
	default:
	  ASSERT(0);
  }
}


void CVTermDoc::DoCaractereSBTType(char c)
{
  switch(c)
  {
	case TELQUAL_SEND:
	  char szReponse[10];
	  szReponse[0] = (char)IAC;
	  szReponse[1] = (char)SB;
	  szReponse[2] = TELOPT_TTYPE;
	  szReponse[3] = TELQUAL_IS;
	  szReponse[4] = 'a';
	  szReponse[5] = 'n';
	  szReponse[6] = 's';
	  szReponse[7] = 'i';

	  // On retourne un type de terminal fonction de la taille émulée
	  // ansi par défaut
	  // ansi-m pour l'émulation 32x102
	  // ansi-w pour l'émulation 43x132
	  int iLength;
	  if (iLignesDefautOptions==32 && iColonnesDefautOptions==102)
	  {
  		szReponse[8] = '-';
  		szReponse[9] = 'm';
  		szReponse[10] = (char)IAC;
		szReponse[11] = (char)SE;
		iLength=12;
	  }
	  else if (iLignesDefautOptions==43 && iColonnesDefautOptions==132)
	  {
  		szReponse[8] = '-';
  		szReponse[9] = 'w';
  		szReponse[10] = (char)IAC;
		szReponse[11] = (char)SE;
		iLength=12;
	  }
	  else
	  {
		szReponse[8] = (char)IAC;
		szReponse[9] = (char)SE;
		iLength=10;
	  }

	  EnvoieChaineHost(szReponse, iLength);
	  m_iTelnetState = TS_A1;
	  break;

	default:
	  ASSERT(0);
  }
}


// Point d'entrée de traitement des caractères reçus de la couche de communication
// Assure le décodage du protocole TELNET
void CVTermDoc::DoCaractere(char c)
{
  m_BufferGlissant.AjouteCaractere(c);

  switch(m_iTelnetState)
  {
	case TS_IAC:
	  DoCaractereIAC(c);
	  return;

	case TS_DO:
	case TS_DONT:
	case TS_WILL:
	case TS_WONT:
	  DoCaractereNegociation((unsigned char)c);
	  return;

	case TS_SB:
	  DoCaractereSB(c);
	  return;

	case TS_SBTTYPE:
	  DoCaractereSBTType(c);
	  return;

	case TS_A1:
	  if (IAC==(unsigned char)c) m_iTelnetState = TS_A2;
	  break;

	case TS_A2:
	  ASSERT(SE==(unsigned char)c);
	  m_iTelnetState = TS_DATA;
	  break;

	case TS_DATA:
	  if (IAC==(unsigned char)c)
		m_iTelnetState = TS_IAC;
	  else
		DoCaractereTerm(c);
  }
}

//==============================================================================

// Point d'entrée de synchronisation pour vider les buffers et tampons
// intermédiaires.
// Point de contrôle des chaînes recherchées dans le buffer glissant.

void CVTermDoc::DoSync()
{
  SynchroCurseurTerm();

  if (m_bAutoLogin)
  {
	if (m_BufferGlissant.bChaineDeFin("login: "))
	{
	  EnvoieChaineHost(m_sLogin, m_sLogin.GetLength());
	  EnvoieChaineHost("\r", 1);
	}
	else if (m_BufferGlissant.bChaineDeFin("ssword:"))
	{
	  EnvoieChaineHost(m_sPassword, m_sPassword.GetLength());
	  EnvoieChaineHost("\r", 1);
	}
	else if (m_BufferGlissant.bChaineDeFin("= (ansi) ") || m_BufferGlissant.bChaineDeFin("= (ansi-m) ") || m_BufferGlissant.bChaineDeFin("= (ansi-w) "))
	{
	  EnvoieChaineHost(m_sTerminal, m_sTerminal.GetLength());
	  EnvoieChaineHost("\r", 1);
	  m_bAutoLogin = FALSE;
	}
  }
}

//==============================================================================
// Etat du bouton déconnexion lié à m_pSocket
void CVTermDoc::OnUpdateFileClose(CCmdUI* pCmdUI) 
{
  pCmdUI->Enable(m_pSocket!=NULL);
}

