/*************************************************************************
 Windows Sockets Application Support Module
 Written by John A. Junod, 267 Hillwood St., Martinez, GA, 30907 93.10.01
 <junodj@css583.gordon.army.mil>     <zj8549@trotter.usma.edu> 

 Released into the public domain with no restrictions other than to give
 me some of the credit if you use this code in other applications. 

  THE INFORMATION AND CODE PROVIDED IS PROVIDED AS IS WITHOUT WARRANTY 
  OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO 
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
  PURPOSE. IN NO EVENT SHALL JOHN A. JUNOD BE LIABLE FOR ANY DAMAGES 
  WHATSOEVER INCLUDING DIRECT, INDIRECT, INCIDENTAL, CONSEQUENTIAL, LOSS 
  OF BUSINESS PROFITS OR SPECIAL DAMAGES, EVEN IF JOHN A. JUNOD HAS BEEN 
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

*************************************************************************/
/*
  MODULE: WS_PAINT.C  (main window (debug) display routines)
*/

#include "ws_glob.h"
#include "ws_ping.h"

#include <stdio.h>		// EOF
#include <stdarg.h>

int nLineHeight=5;
int nScreenRows=10;

// extern HWND hWndDbg;

void ReleaseDisplayMem()
{
  int nIndex;
  for(nIndex=0;nIndex<ptrhGMem;nIndex++)
    GlobalFree(hGMem[nIndex]);
  ptrhGMem=0;
}

void DoAddLine(LPSTR szString)
{
  GLOBALHANDLE hGlobalMemory;
  LPSTR lpGlobalMemory;
  int nIndex;
  RECT rect;

  if(!(bVerbose) && szString[0]=='[')
    return;

  // added in some error checking to try to eliminate GPFs
  if(szString) {
    nIndex=_fstrlen(szString);
    if(nIndex>0 && (hGlobalMemory=GlobalAlloc(GMEM_MOVEABLE,nIndex))!=NULL) {
      if((lpGlobalMemory=GlobalLock(hGlobalMemory))!=NULL) {
        lstrcpy(lpGlobalMemory,szString);
        GlobalUnlock(hGlobalMemory);
        if(ptrhGMem<90) {
          hGMem[ptrhGMem++]=hGlobalMemory;
        } else {
          if(GlobalFree(hGMem[0])==NULL) {
            for(nIndex=0;nIndex<90;nIndex++)
              hGMem[nIndex]=hGMem[nIndex+1];
            hGMem[ptrhGMem-1]=hGlobalMemory;
          }
        }
      }
    }
  }
  GetClientRect(hWndMain,&rect);
  rect.top=min(0,(ptrhGMem-sVPos-1))*nLineHeight;

  if(ptrhGMem > (sVPos+nScreenRows))
    PostMessage(hWndMain,WM_VSCROLL,SB_LINEDOWN,0L);
  else
    InvalidateRect(hWndMain,&rect,TRUE);

  UpdateWindow(hWndMain);
}

void DoPrintf(char *szFormat,...)
{
   va_list vaArgs;
   static char szBuf[256];

   va_start(vaArgs,szFormat);
   if(vsprintf(szBuf,szFormat,vaArgs)!=EOF)
     DoAddLine(szBuf);
   va_end(vaArgs);
}

void DoPaint(HWND hWnd)
{
  HDC         hDC;   // handle for the display device
  PAINTSTRUCT ps;    // holds PAINT information
  int         nRc;
  int         nIndex;
  LPSTR       lpMem;

  RECT rRect;
  TEXTMETRIC tm;

  memset(&ps, 0x00, sizeof(PAINTSTRUCT));
  hDC = BeginPaint(hWnd, &ps);
  // Included as the background is not a pure color
  SetBkMode(hDC, TRANSPARENT);
  GetTextMetrics(hDC,&tm);
  nLineHeight=tm.tmHeight+tm.tmExternalLeading;
  GetClientRect(hWnd,&rRect);
  nScreenRows=rRect.bottom/nLineHeight;
  if(nScreenRows >= ptrhGMem)
      ShowScrollBar(hWnd,SB_VERT,FALSE);
  else
      ShowScrollBar(hWnd,SB_VERT,TRUE);
  for(nIndex=0;(nIndex+sVPos)<ptrhGMem;nIndex++) {
    lpMem=GlobalLock(hGMem[nIndex+sVPos]);
    if(lpMem!=NULL) {
      TextOut(hDC,20,nIndex*nLineHeight,lpMem,lstrlen(lpMem));
      GlobalUnlock(hGMem[nIndex+sVPos]);
    }
  }
  // Inform Windows painting is complete
  EndPaint(hWnd, &ps);
}

int GetLocalInfo()
{
  int nRc;
  struct hostent *hostptr;
  char *ptr;
  struct in_addr *iptr;

  DoPrintf("Description: %s",(LPSTR)WSAData.szDescription);
  DoPrintf("System Status: %s", (LPSTR)WSAData.szSystemStatus);
/*
  DoPrintf("Version: %04x %04x %d %d",
        (WORD)WSAData.wVersion,(WORD)WSAData.wHighVersion,
        (int)WSAData.iMaxSockets,(int)WSAData.iMaxUdpDg);
*/
  if((nRc=gethostname((LPSTR)szString,
             MAXHOSTNAMELEN))==SOCKET_ERROR)
    ReturnWSError(WSAGetLastError(),&szMsgBuf[strlen(szMsgBuf)]);
  else
    DoPrintf("Local Hostname: %s",szString);

  if(!nRc)
  {
    if((hostptr=gethostbyname(szString))==NULL) {
      DoPrintf("gethostbyname failure.");
      ReportWSError(WSAGetLastError());
    } else {
/*
      DoPrintf("Official Name: %s",hostptr->h_name);
*/
      while ( (iptr = (struct in_addr *) *(hostptr->h_addr_list)) != NULL) {
        DoPrintf("Local Address: %s",inet_ntoa(*iptr));
        hostptr->h_addr_list++;
      }
    }
  }
  return(TRUE);
}

