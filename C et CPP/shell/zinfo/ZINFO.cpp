// ZINFO.cpp 
// Récupère l'adresse IP d'un micro, et autres infos de netinfo.ini
// 11/05/2000 PV
//
// A modifier, exporter toutes les lignes de la section correspondante du .ini...
// + une section commune
//

#include "stdafx.h"

static char szNetwork[32];		// Trois premiers octets de l'adresse IP (ex: 200.200.200)
static char szNomficIni[256];	// Chem d'accès à NetInfo.ini (dans %WINDIR%)


static void ExporteVariable(const char *szNomEnv, const char *szNomIni)
{
  char szBuffer[256];

  if (GetPrivateProfileString(szNetwork, szNomIni, "", szBuffer, sizeof(szBuffer), szNomficIni)>0)
    cout << "set ZI_" << szNomEnv << "=" << szBuffer << endl;
}


int main(int argc, char* argv[])
{
  WORD wVersionRequested;
  WSADATA wsaData;
  int err; 

  wVersionRequested = MAKEWORD( 1, 1 ); 
  err = WSAStartup( wVersionRequested, &wsaData );

  if ( err != 0 ) {
	cout << "Impossible d'accéder à la version 1.1 de winsock.dll !\n";
	return 1;
  } 
 
  char    szHostname[100];
  char	szMonAdresseIP[32];
  HOSTENT *pHostEnt;
  gethostname(szHostname, sizeof(szHostname));
  pHostEnt = gethostbyname(szHostname);
  strcpy(szMonAdresseIP, inet_ntoa(*(struct in_addr *)*pHostEnt->h_addr_list));

  cout << "set ZI_HOST=" << szHostname << endl;
  cout << "set ZI_IP=" << szMonAdresseIP << endl;

  char	szWindowsDirectory[256];
  GetWindowsDirectory(szWindowsDirectory, sizeof(szWindowsDirectory));
  if (szWindowsDirectory[strlen(szWindowsDirectory)-1]=='\\')
	szWindowsDirectory[strlen(szWindowsDirectory)-1]=0;

  strcat(strcpy(szNomficIni, szWindowsDirectory), "\\netinfo.ini");
  // Sous 98, il faut lancer majsoft une fois à la main pour que netinfo.ini soit dispo.
  // Sous 2000/NT on peut automatiser (ensuite majsoft est lancé par le script de connexion):
  if (access(szNomficIni, 0)<0 && getenv("OS")!=NULL)
	strcpy(szNomficIni, "\\\\sillikernt\\netlogon\\netinfo.ini");

  if (access(szNomficIni, 0)<0)
  {
	cout << "REM Impossible d'accéder au fichier netinfo.ini" << endl;
	return 1;
  }

  // On s'arrête au troisième point pour l'adresse réseau
  strcpy(szNetwork, szMonAdresseIP);
  int i, nbp;
  for (i=nbp=0 ; i<32 ; i++)
	if (szNetwork[i]=='.')
	  if (++nbp==3)
	  { szNetwork[i] = 0;
		break;
	  }

  // Enumération des variables
  char szListeCles[1000];
  char *p;

  if (GetPrivateProfileString(szNetwork, NULL, "", szListeCles, sizeof(szListeCles), szNomficIni)>0)
	for (p=szListeCles ; *p ; p+=strlen(p)+1)
	  ExporteVariable(p, p);

  return 0;
}

