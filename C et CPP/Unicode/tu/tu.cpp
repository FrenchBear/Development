// tu.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"




static void EnumANSI(const char *szPath)
{
  WIN32_FIND_DATA wfd;
  HANDLE          hFile;
  DWORD           err;

  cout << "Enum ANSI\n";
  if ((hFile = FindFirstFile(szPath, &wfd)) == INVALID_HANDLE_VALUE)
  {
	cout << "Echec au FindFirstFile: err=" << GetLastError() << endl;
	return;
  }
  for(;;)
  {
	char szBuffer[MAX_PATH];
    CharToOemBuff(wfd.cFileName, szBuffer, 1+strlen(wfd.cFileName));
	cout << "  " << szBuffer << endl;

	if (!FindNextFile((HANDLE)hFile, &wfd))
	{
      err = GetLastError();
      if (err==ERROR_NO_MORE_FILES)
	    break;
	  cout << "Echec au FindNextFile: err=" << err << endl;
	  return;
	}
  }
  if (!FindClose((HANDLE)hFile))
  {
	cout << "Echec au FindClose: err=" << GetLastError() << endl;
	return;
  }

}


// Sort une chaîne Unicode sur un ostream en la convertissant en OEM
ostream &operator <<(ostream &o, const wchar_t *wszStr)
{
  int l = wcslen(wszStr)+1;
  char *ps = (char *)alloca(l);
  WideCharToMultiByte(CP_OEMCP, 0, wszStr, l, ps, l+1, NULL, NULL);
  o << ps;
  return o;
}

static void AfficheErrSysteme()
{
  char *lpMsgBuf;
  DWORD iErr = GetLastError();
  char *p;
  size_t l;

  FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
	NULL, iErr, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
	(LPTSTR) &lpMsgBuf, 0, NULL);

  // On élimine les retours à la ligne dans le message
  while (p=strchr(lpMsgBuf, '\n'))
	*p = ' ';
  while (p=strchr(lpMsgBuf, '\r'))
	*p = ' ';
  while ((l=strlen(lpMsgBuf)) && lpMsgBuf[l-1]==' ')
	lpMsgBuf[l-1] = 0;

  // Affichage OEM dans la fenêtre de commandes  
  char *ps = (char *)alloca(l+1);
  CharToOemBuff(lpMsgBuf, ps, l+1);

  cout << ": Erreur " << iErr << ": " << ps << endl;

  LocalFree(lpMsgBuf);
}


static void EnumUnicode(const wchar_t *wszPath)
{
  WIN32_FIND_DATAW wfd;
  HANDLE          hFile;
  DWORD           err;

  cout << "\nEnum Unicode\n";
  if ((hFile = FindFirstFileW(wszPath, &wfd)) == INVALID_HANDLE_VALUE)
  {
	cout << "Echec au FindFirstFile";
	AfficheErrSysteme();
	return;
  }
  for(;;)
  {
	cout << "  " << wfd.cFileName << endl;
	if (!FindNextFileW((HANDLE)hFile, &wfd))
	{
      err = GetLastError();
      if (err==ERROR_NO_MORE_FILES)
	    break;
	  cout << "Echec au FindNextFile: err=" << err << endl;
	  return;
	}
  }
  if (!FindClose((HANDLE)hFile))
  {
	cout << "Echec au FindClose: err=" << GetLastError() << endl;
	return;
  }

}



int main(int argc, char* argv[])
{
	EnumANSI("\\\\kafi\\c\\tmp\\pl\\*");
	EnumUnicode(L"\\\\kafi\\c\\tmp\\pl\\*");

	return 0;
}

