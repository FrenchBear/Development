// xx.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

int main(int argc, char* argv[])
{
/*

  FILE *f = fopen("c:\\f2:toto", "r");

  char szBuffer[100];
  while (fgets(szBuffer, sizeof(szBuffer), f)!=NULL)
	fputs(szBuffer, stdout);
  fclose(f);


//  const char szP[] = "\\\\?\\C:\\tmp\\mp3pack\\MP3 Creation Pack for XP.msi";
  const char szP[] = "\\\\EMERAUDE\\C$\\tmp\\mp3pack\\MP3 Creation Pack for.XP.msi:toto";
  char drive[100], dir[100], fname[100], ext[100];
  _splitpath(szP, drive, dir ,fname, ext );

  cout << "szP:   " << szP << endl
	   << "drive: " << drive << endl
	   << "dir:   " << dir << endl
	   << "fname: " << fname << endl
	   << "ext:   " << ext << endl;
*/


  WINBASEAPI
BOOL
WINAPI
BackupRead(
    HANDLE hFile,
    LPBYTE lpBuffer,
    DWORD nNumberOfBytesToRead,
    LPDWORD lpNumberOfBytesRead,
    BOOL bAbort,
    BOOL bProcessSecurity,
    LPVOID *lpContext
    );


typedef struct _WIN32_STREAM_ID { 
    DWORD         dwStreamId; 
    DWORD         dwStreamAttributes; 
    LARGE_INTEGER Size; 
    DWORD         dwStreamNameSize; 
    WCHAR         cStreamName[ANYSIZE_ARRAY]; 
} WIN32_STREAM_ID, *LPWIN32_STREAM_ID;



  WIN32_STREAM_ID sid;
  ZeroMemory(&sid, sizeof(WIN32_STREAM_ID));
  DWORD dwStreamHeaderSize = (LPBYTE)&sid.cStreamName - (LPBYTE)&sid+ sid.dwStreamNameSize;

  char *szFic = argv[1];
  printf("fic: %s\n", szFic);

  HANDLE hfile;
  hfile = CreateFile(szFic, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL);
  if (hfile==INVALID_HANDLE_VALUE)
  {
	cerr << "Echec au CreateFile\n";
	exit(0);
  }
  printf("Flots de %s\n", szFic);

  DWORD dwRead, dw1, dw2;
  VOID *lpContext = NULL;
	
  for(;;)
  {
	BOOL b;
	
    b = BackupRead(hfile, (LPBYTE) &sid, 
      dwStreamHeaderSize, &dwRead, FALSE, FALSE, 
      &lpContext);
    if (!b) break;

    WCHAR wszStreamName[MAX_PATH]; 
    b = BackupRead(hfile, (LPBYTE) wszStreamName, sid.dwStreamNameSize, 
      &dwRead, FALSE, FALSE, &lpContext);
	wszStreamName[dwRead/2] = 0;
    if (!b) break;

    printf("  <%S>  Id=%d  At=%d\n", wszStreamName, sid.dwStreamId, sid.dwStreamAttributes);
    
    b = BackupSeek(hfile, sid.Size.LowPart, sid.Size.HighPart, 
      &dw1, &dw2, &lpContext);
	if (!b) break;
  }

  // On libère
  BackupRead(hfile, (LPBYTE) &sid, dwStreamHeaderSize, &dwRead, TRUE, FALSE, &lpContext);
  CloseHandle(hfile);
  
  return 0;
}

