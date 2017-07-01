// hostadr.c
// Affiche l'adresse d'un host dont le nom est passé en paramètre
// 24/11/95 PV

#include <stdio.h>
#include <winsock.h>

void GetAdr(char *szHost)
{
  struct hostent *phe;

  phe = gethostbyname(szHost);

  if (phe==NULL)
  {
    int iErr;

	iErr = WSAGetLastError();
    printf("%s: non trouv‚. err=%d\n", szHost, iErr);
  }
  else
    printf("%s: %s\n", phe->h_name, inet_ntoa(*(struct in_addr *)*(phe->h_addr_list)));
}


int iInitWinsock()
{
  WORD wVersionRequested;
  WSADATA wsaData;
  int err;

  wVersionRequested = MAKEWORD(1, 1);

  err = WSAStartup(wVersionRequested, &wsaData);

  if (err != 0)
  { printf("hostadr: Echec de l'accès à winsock.dll err=%d\n", err);
    return -1;
  }

  /* Confirm that the Windows Sockets DLL supports 1.1.*/
  /* Note that if the DLL supports versions greater */
  /* than 1.1 in addition to 1.1, it will still return */
  /* 1.1 in wVersion since that is the version we requested. */

  if ( LOBYTE( wsaData.wVersion ) != 1 ||
       HIBYTE( wsaData.wVersion ) != 1 )
  { printf("hostadr: winsock.dll version %d.%d non supportée\n", LOBYTE(wsaData.wVersion), HIBYTE(wsaData.wVersion));
    WSACleanup();
    return -1; 
  }


  /* The Windows Sockets DLL is acceptable. Proceed. */
  printf("winsock.dll %d.%d\n", LOBYTE(wsaData.wVersion), HIBYTE(wsaData.wVersion));
  printf("%s\n", wsaData.szDescription);
  printf("%s\n", wsaData.szSystemStatus);
  printf("iMaxSockets: %hu\n", wsaData.iMaxSockets);
  printf("iMaxUdpDg: %hu\n", wsaData.iMaxUdpDg);

  return 0;
}


int main(int argc, char **argv)
{
  int i;

  if (iInitWinsock()<0)
    return 1;

  for (i=1 ; i<argc ; i++)
    GetAdr(argv[i]);

  WSACleanup();
}
