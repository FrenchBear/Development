#include <windows.h>
#include <stdio.h>

int opt_v = 0;			// verbose

/* Insäre n caractäres Ö l'adresse pointÇe par p, retourne cette
** adresse.
*/

char *strinsnc(char *p, int n)
{
  int l = strlen(p)+1;
  p += l+n-1;
  while (l--)
  { *p = *(p-n);
    p--;
  }
  return p;
}


void AfficheValeur(char *szValeur, char *szData, DWORD dwType, DWORD dwDataSize)
{
  int j;
  char	*p;

  printf("  %-30.30s", szValeur);

  switch(dwType)
  {
	case REG_DWORD:
	  printf("REG_DWORD:            %d\n", *(DWORD *)szData);
	  break;

	case REG_BINARY:
	  printf("REG_BINARY:           ");
	  goto dumpbinaire;

	case REG_DWORD_BIG_ENDIAN:
	  printf("REG_DWORD_BIG_ENDIAN: ");
	  goto dumpbinaire;

	case REG_EXPAND_SZ:
	  printf("REG_EXPAND_SZ:        %s\n", szData);
	  break;

	case REG_LINK:
	  printf("REG_LINK:             %s\n", szData);
	  break;

	case REG_MULTI_SZ:
	  printf("REG_MULTI_SZ\n");
	  j = 0;
	  p = szData;
	  for(;;)
	  {
	    if (*p) break;
	    printf("[%d]: %s\n", j, p);
		j++;
		p = p+strlen(p)+1;
	  }
	  break;

	case REG_NONE:
	  printf("REG_NONE:             ");
	  goto dumpbinaire;

	case REG_RESOURCE_LIST:
	  printf("REG_RESOURCE_LIST:    ");
	  goto dumpbinaire;

	case REG_SZ:
	  printf("REG_SZ:               %s\n", szData);
	  break;
	  
	default:
	  printf("Type ? %5d:         ", dwType);
	dumpbinaire:
	  for (j=0 ; j<dwDataSize ; j++)
		printf("%02x ", (unsigned char)(szData[j]));
	  printf("\n");
	  break;
  }

}

void Analyse1Cle(char *szBase, HKEY hCle)
{
  long	l;
  char	szNom[256], szClasse[256], szValeur[256], szData[10000];
  DWORD	dwNomSize, dwClasseSize, dwValeurSize, dwDataSize;
  DWORD dwType;
  FILETIME ft;
  int	i;
  HKEY	h;
  char	szBaseComplete[256];

  if (opt_v)
    printf("%s\\\n", szBase);

  // 1er temps: ÈnumÈration des valeurs
  for(i=0 ; ; i++)
  {
	szValeur[0] = 0;
	szData[0] = 0;
	dwValeurSize = sizeof(szValeur);
	dwDataSize = sizeof(szData);

    l = RegEnumValue(
      hCle,					// HKEY  hkey,				// handle of key to query 
      i,					// DWORD  iValue,			// index of value to query 
      szValeur,				// LPTSTR  lpszValue,		// address of buffer for value string 
      &dwValeurSize,		// LPDWORD  lpcchValue,		// address for size of value buffer 
      (LPDWORD)0,			// LPDWORD  lpdwReserved,	// reserved 
      &dwType,				// LPDWORD  lpdwType,		// address of buffer for type code 
      szData,				// LPBYTE  lpbData,			// address of buffer for value data 
      &dwDataSize			// LPDWORD  lpcbData 		// address for size of data buffer 
    );

	if (l) break;

	if (opt_v)
	  AfficheValeur(szValeur, szData, dwType, dwDataSize);
	else
	{
      if (dwType==REG_SZ)
	  {
	    char *p;

	    if ((p=strstr(szData, "WIN4"))!=NULL || (p=strstr(szData, "win4"))!=NULL)
	    {
          printf("%s\\\n", szBase);
	      AfficheValeur(szValeur, szData, dwType, dwDataSize);

		  while (p!=NULL)
		  {
		    strinsnc(p, 1);
		    strncpy(p, "WIN95", 5);
		    dwDataSize++;
			p = strstr(szData, "WIN4");
			if (p==NULL) p = strstr(szData, "win4");
		  }

		  l = RegSetValueEx(
		    hCle,			// HKEY  hkey,	// handle of key to set value for  
    		szValeur,		// LPCTSTR  lpszValueName,	// address of value to set 
    		(DWORD)0,		// DWORD  dwReserved,	// reserved 
    		dwType,			// DWORD  fdwType,	// flag for value type 
    		szData,			// CONST BYTE *  lpbData,	// address of value data 
    		dwDataSize		// DWORD  cbData 	// size of value data 
   		  );
		  if (l)
		  {
		    printf("Echec au RegSetValueEx, retour: %d\n", l);
		  }


	    }
	  }
	}

  }


  // 2Ëme temps: ÈnumÈration des sous-clÈs
  for(i=0 ; ; i++)
  {
	szNom[0] = 0;
    szClasse[0] = 0;
	dwNomSize = sizeof(szNom);
	dwClasseSize = sizeof(szClasse);

    l = RegEnumKeyEx(
	  hCle,					// HKEY  hkey,				// handle of key to enumerate HKEY_CLASSES_ROOT HKEY_CURRENT_USER HKEY_LOCAL_MACHINE HKEY_USERS
      i,					// DWORD  iSubkey,			// index of subkey to enumerate 
      szNom,				// LPTSTR  lpszName,		// address of buffer for subkey name 
      &dwNomSize,			// LPDWORD  lpcchName,		// address for size of subkey buffer 
      (LPDWORD)0,			// LPDWORD  lpdwReserved,	// reserved 
      szClasse,				// LPTSTR  lpszClass,		// address of buffer for class string 
      &dwClasseSize,		// LPDWORD  lpcchClass,		// address for size of class buffer 
      &ft					// PFILETIME  lpftLastWrite // address for time key last written to 
    );

    if (l) break;

	sprintf(szBaseComplete, "%s\\%s", szBase, szNom);
    //printf("%s\n", szBaseComplete);

	l = RegOpenKeyEx(
      hCle,					// HKEY  hkey,				// handle of open key 
      szNom,				// LPCTSTR  lpszSubKey,		// address of name of subkey to open 
      (DWORD)0,				// DWORD  dwReserved,		// reserved 
      KEY_ALL_ACCESS,		// REGSAM  samDesired,		// security access mask 
      &h					// PHKEY  phkResult 		// address of handle of open key 
    );
	if (l<0) break;
    Analyse1Cle(szBaseComplete, h);
    RegCloseKey(h);
  }
}


int main()
{
  printf("majreg\n");

  Analyse1Cle("HKEY_CLASSES_ROOT", HKEY_CLASSES_ROOT);
  Analyse1Cle("HKEY_CURRENT_USER", HKEY_CURRENT_USER);
  Analyse1Cle("HKEY_LOCAL_MACHINE", HKEY_LOCAL_MACHINE);
  Analyse1Cle("HKEY_USERS", HKEY_USERS);

  return 0;
}
