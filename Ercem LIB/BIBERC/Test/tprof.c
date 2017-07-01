// tprof.c
// Essai des fonctions de profile de biberc
// 23/05/95 PV

#include <stdio.h>
#include <string.h>

#include <biberc.h>

char szNomIni[] = "tprof.ini";

int main()
{
  char	filename [256];
  char	szRemoteHost[80];
  char	szBuffer[5000];
  char	szValeur[500];
  char	*p;
  
  strcpy(szRemoteHost, "serveur.ercem.com");
  strcpy(filename, "/ercem/include/t_etablissement.h");
  
  WritePrivateProfileString("wine", "SystemResources", filename, szNomIni);
  WritePrivateProfileString("WS_PING", "HOSTNAME", szRemoteHost, szNomIni);
  
  szRemoteHost[0] = 0;
  filename[0] = 0;

  GetPrivateProfileString("wine", "SystemResources", "sysres.dll", filename, sizeof(filename), szNomIni);
  GetPrivateProfileString("WS_PING", "HOSTNAME", "200.200.220.2",szRemoteHost,79,szNomIni);
  
  printf("szRemoteHost: %s\n", szRemoteHost);
  printf("filename: %s\n", filename);
  
  // Enumération de l'ensemble des sections
  printf("\nEnsemble des sections de %s:\n", szNomIni);
  GetPrivateProfileString(NULL, NULL, NULL, szBuffer, sizeof(szBuffer), szNomIni);
  p = szBuffer;
  while (*p)
  { printf("[%s]\n", p);
    p += strlen(p)+1;
  }
  
  // Enumération des clés de la section windows
  printf("\nClés de la section Windows:\n");
  GetPrivateProfileString("windows", NULL, NULL, szBuffer, sizeof(szBuffer), szNomIni);
  p = szBuffer;
  while (*p)
  {
    GetPrivateProfileString("windows", p, NULL, szValeur, sizeof(szValeur), szNomIni);
    printf("%s: %s\n", p, szValeur);
    p += strlen(p)+1;
  }

  return 0;
}