// nslookup.cpp
// commande simplifiée de résulution de noms réseau
// 3/12/97 PV


//#define WINSOCK2


#include <afx.h>
#include <iostream.h>
#include <stdio.h>

#ifdef WINSOCK2
#include <windows.h>
#else
#include <winsock.h>
#endif

static void Decode(char *szHostCherche)
{

	char szMessage[300];
	CString sNomHostMsg;
	CString sAMemoriser;
	int adr1, adr2, adr3, adr4;
	int iErr;

#define bzero(p, l) memset(p, 0, l)
#define bcopy(s, d, l) memcpy(d, s, l)

	struct hostent *hp, host;

	// On récupère différement un pointeur de host selon qu'on dispose de son
	// adresse ou de son nom
	if (4==sscanf((const char *)szHostCherche, "%d.%d.%d.%d", &adr1, &adr2, &adr3, &adr4))
	{
		char PackedAddr[4];
		cout << "Recherche du nom du host " << szHostCherche << endl;

		PackedAddr[0] = (char)adr1;
		PackedAddr[1] = (char)adr2;
		PackedAddr[2] = (char)adr3;
		PackedAddr[3] = (char)adr4;
		hp = gethostbyaddr(PackedAddr, 4, PF_INET);
	}
	else
	{
		cout << "Recherche de l'adresse du host '" << szHostCherche << "'" << endl;
		hp = gethostbyname(szHostCherche);
	}

	iErr = WSAGetLastError();
	if (hp==NULL && iErr!=WSANO_DATA)
	{
		sprintf(szMessage, "Impossible de trouver l'adresse du système '%s'.\nVérifiez que vous avez correctement entré le nom du système.\n\nÉchec au gethostbyname\r\nErr = %d", (const char *)szHostCherche, iErr);
		switch(iErr)
		{
		  case WSANOTINITIALISED: strcat(szMessage, ": A successful WSAStartup must occur before using this function."); break;
		  case WSAENETDOWN:		  strcat(szMessage, ": The Windows Sockets implementation has detected that the network subsystem has failed."); break;
		  case WSAHOST_NOT_FOUND: strcat(szMessage, ": Authoritative Answer Host not found."); break;
		  case WSATRY_AGAIN:	  strcat(szMessage, ": Non-Authoritative Host not found, or SERVERFAIL."); break;
		  case WSANO_RECOVERY:	  strcat(szMessage, ": Nonrecoverable errors: FORMERR, REFUSED, NOTIMP."); break;
		  case WSANO_DATA:		  strcat(szMessage, ": Valid name, no data record of requested type."); break;
		  case WSAEINPROGRESS:	  strcat(szMessage, ": A blocking Windows Sockets operation is in progress."); break;
		  case WSAEINTR:		  strcat(szMessage, ": The (blocking) call was canceled using WSACancelBlockingCall"); break;
		}
		cout << szMessage << endl;
		return;
	}

	if (hp!=NULL)
	{
		char **p;
		int i;

		bcopy(hp, &host, sizeof(host));

		cout << "Nom trouvé: " << host.h_name << endl;
		for (p=host.h_aliases ; *p!=NULL ; p++)
			cout << "Alias: " << *p << endl;
		for (i=0 ; *(i+host.h_addr_list)!=NULL ; i++ )
			cout << "Adresse trouvée: " << inet_ntoa(*(struct in_addr *)*(i+host.h_addr_list)) << endl;
	}
	else
		cout << "Rien trouvé pour '" << szHostCherche << "'.\n";

	cout << endl;
}


int main(int argc, char **argv)
{
	int i;
	
	WORD wVersionRequested;
	WSADATA wsaData;
	int err; 
	wVersionRequested = MAKEWORD( 2, 0 ); 
	err = WSAStartup( wVersionRequested, &wsaData );
	
	if ( err != 0 ) {
		cout << "Impossible d'accéder à la version 1.1 de winsock.dll !\n";
		return 1;
	} 

	cout << "Initialisation windock.dll v" << char('0'+HIBYTE( wsaData.wVersion )) << '.' << char('0'+LOBYTE( wsaData.wVersion )) << " Ok\n";
	cout << "\tHighVersion: " << wsaData.wHighVersion << endl;
	cout << "\tDescription: " << wsaData.szDescription << endl;
	cout << "\tSystemStatus: " << wsaData.szSystemStatus << endl;
	cout << "\tMaxSockets: " << wsaData.iMaxSockets << endl;
	cout << "\tMaxUdpDg: " << wsaData.iMaxUdpDg << endl;
	cout << "\tVendorInfo: " << wsaData.lpVendorInfo << endl;

	if (argc==1)
	{
		cout << "Usage: nslookup host|adresse...\n";
		return 1;
	}


	// On récupère des infos sur soi-même
	// D'après la doc, le retour de gethostbyname fonctionne toujours en paramètre à gethostbyname
	char    szHostname[100];
	char	szMonAdresseIP[32];
	HOSTENT *pHostEnt;
	gethostname(szHostname, sizeof(szHostname));
    pHostEnt = gethostbyname(szHostname);
    strcpy(szMonAdresseIP, inet_ntoa(*(struct in_addr *)*pHostEnt->h_addr_list));

	cout << "Hostname: " << szHostname << endl;
	cout << "Host IP:  " << szMonAdresseIP << endl << endl;


#ifdef WINSOCK2
	// On récupère des infos sur les services de résolution de noms
	// Uniquement dans winsock2...
	DWORD dwBufferLength;
	WSANAMESPACE_INFO tNSI[5];

	dwBufferLength = sizeof(tNSI)
	err = WSAEnumNameSpaceProviders(&dwBufferLength, tNSI);
	if (err==SOCKET_ERROR) then
	{
		int iErr = WSAGetLastError();
		cout << "Echec au WSAEnumNameSpaceProviders, err=" << iErr << endl;
	}
	else
	{
		for (i=0 ; i<err ; i++)
		{
			cout << "NameSpaceInfo[" << i << "].NSNameSpaceInfoId = " << tNSI[i].NSNameSpaceInfoId << endl;
			cout << "NameSpaceInfo[" << i << "].dwNameSpace = " << tNSI[i].dwNameSpace << endl;
			cout << "NameSpaceInfo[" << i << "].fActive = " << tNSI[i].fActive << endl;
			cout << "NameSpaceInfo[" << i << "].dwVersion = " << tNSI[i].dwVersion << endl;
			cout << "NameSpaceInfo[" << i << "].lpszIdentifier = " << tNSI[i].lpszIdentifier << endl;
		}
	}
	cout << end;
#endif


	// Finalement on décode les paramètres
	for (i=1 ; i<argc ; i++)
		Decode(argv[i]);

	return 0;
}

