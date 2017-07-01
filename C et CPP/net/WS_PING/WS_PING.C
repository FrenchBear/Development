/*************************************************************************
 Windows Sockets PING Client Application

 Written by John A. Junod, 267 Hillwood St., Martinez, GA, 30907 93.10.01
 <junodj@css583.gordon.army.mil> <zj8549@trotter.usma.edu>   C$:72321,366

 Released into the public domain with no restrictions other than to give
 me some of the credit if you use this code in other applications.  Some
 code concepts based on code published in UNIX Network Programming by
 W. Richard Stevens or on BSD networking source code.

  THE INFORMATION AND CODE PROVIDED IS PROVIDED AS IS WITHOUT WARRANTY 
  OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO 
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
  PURPOSE. IN NO EVENT SHALL JOHN A. JUNOD BE LIABLE FOR ANY DAMAGES 
  WHATSOEVER INCLUDING DIRECT, INDIRECT, INCIDENTAL, CONSEQUENTIAL, LOSS 
  OF BUSINESS PROFITS OR SPECIAL DAMAGES, EVEN IF JOHN A. JUNOD HAS BEEN 
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

 Note that MOST Windows Sockets DLL's do not support RAW_SOCKETS.  This
 does work with Trumpet's Windows Sockets DLL Alpha 18.

 Purpose of this program was to see how a PING program could be implemented
 under Windows Sockets.  This program uses either blocking or async
 socket calls to perform its magic.  
*************************************************************************/

//----------------------
#include "ws_glob.h"
#include "WS_ping.H"
#include "ip_icmp.h"
//----------------------

BOOL bSpecified=FALSE;

int nPktLength=50;
int nNumPkts=10;
int nTimeOut=10;
extern int nTransmitted,nReceived;

int PASCAL WinMain(HANDLE hInstance, HANDLE hPrevInstance,
                   LPSTR lpszCmdLine, int nCmdShow)
{
  MSG        msg;           // MSG structure to store your messages
  int        nRc;           // return value from Register Classes
  long       nWndunits;     // window units for size and location
  int        nX;            // the resulting starting point (x, y)
  int        nY;
  int        nWidth;        // the resulting width and height for this
  int        nHeight;       // window
  int        err;

  strcpy(szAppName, "WS_PING");
  hInst = hInstance;
  if(!hPrevInstance)
  {
    if ((nRc = nCwRegisterClasses()) == -1)
    {
      MessageBox(NULL, "Window creation failed", NULL, MB_ICONEXCLAMATION);
      return nRc;    
    }
  }

  // Create a device independant size and location
  nWndunits = GetDialogBaseUnits();
  nWndx = LOWORD(nWndunits);
  nWndy = HIWORD(nWndunits);
  nX = ((18 * nWndx) / 4);
  nY = ((18 * nWndy) / 8);
  nWidth = ((247 * nWndx) / 4);
  nHeight = ((218 * nWndy) / 8);

  // create application's Main window
  hWndMain = CreateWindow(
    szAppName, "WinSock_PING",
    WS_CAPTION     | WS_SYSMENU    | WS_MINIMIZEBOX  |
    WS_MAXIMIZEBOX | WS_THICKFRAME | WS_CLIPCHILDREN | WS_OVERLAPPED,
    nX,nY, nWidth, nHeight,
    NULL, NULL, hInst,  NULL);

  if(hWndMain == NULL)
  {
    MessageBox(NULL, "Error registering class", NULL, MB_ICONEXCLAMATION);
    return 2;
  }

  if(lstrlen((LPSTR)lpszCmdLine)>0) {
    bSpecified=TRUE;
    strcpy(szRemoteHost,lpszCmdLine);
  }

  if (err = WSAStartup( 0x0101, &WSAData))  // register task with
  {                                         // winsock tcp/ip API
    ReportWSError(err);            
  } else {
    GetLocalInfo();
    ShowWindow(hWndMain, nCmdShow);         // display main window
    while(GetMessage(&msg, NULL, 0, 0))     // Until WM_QUIT message
    {
      TranslateMessage(&msg);
      DispatchMessage(&msg);
    }
    WSACleanup();
    ReleaseDisplayMem();
  }
  // Do clean up before exiting from the application
  CwUnRegisterClasses();
  return msg.wParam;
}

#define WM_RESETCURSOR WM_USER+10

// Main window message processing
LONG FAR PASCAL WndProc(HWND hWnd,WORD Message,WORD wParam,LONG lParam)
{
  int nIndex,nRC,nBytesRecv;
  static int saFromAddrLen;
  static struct sockaddr_in saDestAddr;
  static struct sockaddr_in saFromAddr;
  static struct hostent  HostEntry , *pHostEntry;
  static struct protoent ProtoEntry, *pProtoEntry;
  static HANDLE hATHhost;
  static HANDLE hATHprot;

  switch (Message)
  {
    case WM_CREATE:
      hStdCursor=LoadCursor(NULL,IDC_ARROW);
      hWaitCursor=LoadCursor(NULL,IDC_WAIT);
      if(!bSpecified)
        GetPrivateProfileString("WS_PING", "HOSTNAME",
          "129.29.64.246",szRemoteHost,79,szIniFile);
      else
        PostMessage(hWnd,WM_COMMAND,IDM_ASYNC_CONNECT,0L);
      break;

    case WM_TIMER:
      switch(wParam) {
        case 10:
          DoPrintf("[Timer-TIMEOUT] ");
          KillTimer(hWnd,10);
          if(WSAIsBlocking()) {
            bAborted=TRUE;
            WSACancelBlockingCall();
          }
          break;

        case 20:
          DoPrintf("[Timer-ASYNC_SEND] ");
          if(nTransmitted<nNumPkts) {
            send_ping(ping_socket,&saDestAddr,szMsgBuf,
                      nPktLength+SIZE_ICMP_HDR);
            PostMessage(hWnd,WM_PING_RECEIVE,0,0l);
          } else {
            KillTimer(hWnd,20);
            if(nReceived!=nTransmitted)
              SendMessage(hWnd,WM_PING_RECEIVE,0,0l);
            PostMessage(hWnd,WM_PING_FINISH,0,0l);
          }
          break;

        case 30:
          DoPrintf("[Timer-BLOCK_SEND] ");
          if(nTransmitted<nNumPkts)
          {
            if(send_ping(ping_socket,&saDestAddr,szMsgBuf,
                      nPktLength+SIZE_ICMP_HDR))
              recv_ping(ping_socket,szString,TRUE);
          }
          else {
            KillTimer(hWnd,30);
            if(nReceived!=nTransmitted)
              recv_ping(ping_socket,szString,TRUE);
            PostMessage(hWnd,WM_PING_FINISH,0,0l);
          }
          break;

        default:
          KillTimer(hWnd,wParam);
          break;
      }
      break;
    case WM_COMMAND:
      if(wParam==IDM_CLOSE || wParam==IDM_EXIT) {
        if(ping_socket!=INVALID_SOCKET) {
          ping_socket=DoClose(ping_socket);
          SendMessage(hWnd,WM_RESETCURSOR,0,0l);
        }
        if(wParam==IDM_EXIT)
          SendMessage(hWnd,WM_CLOSE,0,0L);
        break;
      } else if(bCmdInProgress) return(FALSE);
      switch (wParam)
      {
        case IDM_ASYNC_CONNECT:
          bCmdInProgress=1;
          if(!bSpecified)
            { FARPROC lpfnMsgProc;
              lpfnMsgProc=MakeProcInstance((FARPROC)WS_HostMsgProc,hInst);
              DialogBox(hInst,(LPSTR)"DLG_HOST",hWnd,lpfnMsgProc);
              FreeProcInstance(lpfnMsgProc);
            }
          bSpecified=FALSE;
          memset(&saDestAddr,0,sizeof(struct sockaddr_in));
          memset(&HostEntry,0,sizeof(struct hostent));
          memset(&ProtoEntry,0,sizeof(struct protoent));
          saDestAddr.sin_family=AF_INET;
          if((saDestAddr.sin_addr.s_addr=inet_addr(szRemoteHost))==INADDR_NONE)
            hATHhost=WSAAsyncGetHostByName(hWnd,WM_PING_HOST,szRemoteHost,
                        szMsgBuf,MAXGETHOSTSTRUCT);
          else hATHhost=0;
          hATHprot=WSAAsyncGetProtoByName(hWnd,WM_PING_PROTO,"icmp",
                        &szMsgBuf[MAXGETHOSTSTRUCT],MAXGETHOSTSTRUCT);
          break;

        case IDM_LOOKUP:
          bCmdInProgress=1;
          if(!bSpecified)
            { FARPROC lpfnMsgProc;
              lpfnMsgProc=MakeProcInstance((FARPROC)WS_HostMsgProc,hInst);
              DialogBox(hInst,(LPSTR)"DLG_HOST",hWnd,lpfnMsgProc);
              FreeProcInstance(lpfnMsgProc);
            }
          bSpecified=FALSE;
          memset(&saDestAddr,0,sizeof(struct sockaddr));
          saDestAddr.sin_family=AF_INET;
          DoPrintf(" ");
          
          if((saDestAddr.sin_addr.s_addr=inet_addr(szRemoteHost))==INADDR_NONE) {
            if(!(pHostEntry=gethostbyname(szRemoteHost))) {
              DoPrintf("can't get \"%s\" host entry.",szRemoteHost);
              SendMessage(hWnd,WM_RESETCURSOR,0,0l);
              bCmdInProgress=0;
              break;
            }
          } else {
            if(!(pHostEntry=gethostbyaddr((LPSTR)&saDestAddr.sin_addr.s_addr,
                4,PF_INET))) {
              DoPrintf("can't get \"%s\" ip entry.",szRemoteHost);
              goto skipit;
            }
          }
          {
            struct in_addr *iptr;
            LPSTR lptr;
            int nCount=0;
              memcpy(&saDestAddr.sin_addr,pHostEntry->h_addr,
                     pHostEntry->h_length);
              DoPrintf("Official Name: %s",pHostEntry->h_name);
              while((iptr=(struct in_addr *)*(pHostEntry->h_addr_list))!=NULL) {
                DoPrintf("IP Address: %s",inet_ntoa(*iptr));
                pHostEntry->h_addr_list++;
              }
              while((lptr=(LPSTR)*(pHostEntry->h_aliases))!=NULL) {
                if(nCount++<1) DoPrintf("Aliases:");
                DoPrintf("         %s",lptr);
                pHostEntry->h_aliases++;
              }
          }
skipit:
          bCmdInProgress=0;
          SendMessage(hWnd,WM_RESETCURSOR,0,0l);
          break;

       case IDM_CONNECT:
          bCmdInProgress=1;
          if(!bSpecified)
            { FARPROC lpfnMsgProc;
              lpfnMsgProc=MakeProcInstance((FARPROC)WS_HostMsgProc,hInst);
              DialogBox(hInst,(LPSTR)"DLG_HOST",hWnd,lpfnMsgProc);
              FreeProcInstance(lpfnMsgProc);
            }
          bSpecified=FALSE;
          memset(&saDestAddr,0,sizeof(struct sockaddr));
          saDestAddr.sin_family=AF_INET;
          
          if((saDestAddr.sin_addr.s_addr=inet_addr(szRemoteHost))==INADDR_NONE) {
            if(!(pHostEntry=gethostbyname(szRemoteHost))) {
              DoPrintf("can't get \"%s\" host entry.",szRemoteHost);
              SendMessage(hWnd,WM_RESETCURSOR,0,0l);
              bCmdInProgress=0;
              break;
            } else {
              memcpy((char *)&saDestAddr.sin_addr,pHostEntry->h_addr,
                  pHostEntry->h_length);
            }
          }
/*
          if((pProtoEntry=getprotobyname("icmp"))==NULL) {
            bCmdInProgress=0;
            DoPrintf("unknown protocol: icmp");
            SendMessage(hWnd,WM_RESETCURSOR,0,0l);
            break; 
          }
          justing using a 1 in here now
*/
          if((ping_socket=socket(saDestAddr.sin_family,SOCK_RAW,1))
             ==INVALID_SOCKET)
          {
            DoPrintf("can't create raw socket %s",
                      ReturnWSError(WSAGetLastError(),NULL));
            SendMessage(hWnd,WM_RESETCURSOR,0,0l);
            break;
          }
          nTransmitted=0; nReceived=0;
          DoPrintf("[%u] raw socket created",ping_socket);
          PrintHeader(&saDestAddr,nPktLength);
          SetTimer(hWnd,30,1000,NULL);
          break;

        case IDM_ABOUT:
          { FARPROC lpfnMsgProc;
            lpfnMsgProc = MakeProcInstance((FARPROC)WS_AboutMsgProc, hInst); 
            DialogBox(hInst, (LPSTR)"DLG_ABOUT", hWnd, lpfnMsgProc);
            FreeProcInstance(lpfnMsgProc);
          }
          break;

        default:
          return DefWindowProc(hWnd, Message, wParam, lParam);
      }
      break;

    case WM_PING_HOST:
      DoPrintf("[WM_PING_HOST] ");
      if(WSAGETASYNCERROR(lParam)!=0) {
        ReportWSError(WSAGETASYNCERROR(lParam));
        SendMessage(hWnd,WM_RESETCURSOR,0,0l);
      } else {
        memcpy(&HostEntry,szMsgBuf,sizeof(struct hostent));
        memcpy(&saDestAddr.sin_addr,HostEntry.h_addr,HostEntry.h_length);
        hATHhost=0;
        if(hATHprot==0) SendMessage(hWnd,WM_PING_CAS,0,0l);
      }
      break;

    case WM_PING_PROTO:
      DoPrintf("[WM_PING_PROTO] ");
      if(WSAGETASYNCERROR(lParam)!=0) {
        ReportWSError(WSAGETASYNCERROR(lParam));
        SendMessage(hWnd,WM_RESETCURSOR,0,0l);
      } else {
        memcpy(&ProtoEntry,&szMsgBuf[MAXGETHOSTSTRUCT],
                     sizeof(struct protoent));
        hATHprot=0;
        if(hATHhost==0) SendMessage(hWnd,WM_PING_CAS,0,0l);
      }
      break;

    case WM_PING_CAS:
      PrintHeader(&saDestAddr,nPktLength+SIZE_ICMP_HDR);
      ping_socket=socket(saDestAddr.sin_family,SOCK_RAW,
                    ProtoEntry.p_proto);
      if(ping_socket==INVALID_SOCKET) {
        DoPrintf("can't create raw socket: %s",
                    ReturnWSError(WSAGetLastError(),NULL));
        SendMessage(hWnd,WM_RESETCURSOR,0,0l);
      } else {
        if(WSAAsyncSelect(ping_socket,hWnd,WM_PING_RECEIVE,FD_READ)
            ==SOCKET_ERROR)
        {
          DoPrintf("asyncselect: %s",ReturnWSError(WSAGetLastError(),NULL));
          ping_socket=DoClose(ping_socket);
          SendMessage(hWnd,WM_RESETCURSOR,0,0l);
        } else {
          nTransmitted=nReceived=0;
          SetTimer(hWndMain,20,1000,NULL);
        }
      }
      break;

    case WM_PING_RECEIVE:
      DoPrintf("[WM_PING_RECEIVE] ");
      saFromAddrLen=sizeof(struct sockaddr);
      nBytesRecv=recvfrom(ping_socket,szString,MAXPACKET,0,
                (struct sockaddr *)&saFromAddr,
                &saFromAddrLen);
      if(nBytesRecv!=SOCKET_ERROR || WSAGetLastError()!=WSAEINTR) {
        if(nBytesRecv==SOCKET_ERROR) {
          DoPrintf("[recvfrom] %s",ReturnWSError(WSAGetLastError(),NULL));
        } else PrintPkt(szString,nBytesRecv,&saFromAddr,TRUE);
      }
      break;

    case WM_PING_FINISH:
      ping_socket=DoClose(ping_socket);
      PrintStats();

    case WM_RESETCURSOR:
      bCmdInProgress=0;
      SetCursor(hStdCursor);
      break;

    case WM_SETCURSOR:
      if(bCmdInProgress)
        SetCursor(hWaitCursor);
      else
        return DefWindowProc(hWnd, Message, wParam, lParam);
      break;

    case WM_PAINT:  // code for the window's client area
      DoPaint(hWnd);
      break;

    case WM_VSCROLL:
      switch(wParam)
      {
        case SB_LINEDOWN:
          if(sVPos<(ptrhGMem-1)) sVPos++;
          break;
        case SB_LINEUP:
          if(sVPos>0) --sVPos;
          break;
        case SB_THUMBPOSITION:
          sVPos = min(ptrhGMem, LOWORD(lParam));
          break;
        case SB_PAGEUP:
          if(sVPos>10) sVPos-=10; else sVPos=0;
          break;
        case SB_PAGEDOWN:
          if(sVPos<(ptrhGMem-10)) sVPos+=10; else sVPos=ptrhGMem;
          break;
        default:
          return FALSE;
      }
      SetScrollPos(hWnd,SB_VERT,sVPos,TRUE);
      InvalidateRect(hWnd,NULL,TRUE);
      break;

    case WM_CLOSE:  // close the window
      // Destroy child windows, modeless dialogs, then, this window
      if (hWnd == hWndMain) {
        if(ping_socket!=INVALID_SOCKET)
          ping_socket=DoClose(ping_socket);
        DestroyWindow(hWnd);
        WritePrivateProfileString("WS_PING", "HOSTNAME",szRemoteHost,
                     szIniFile);
        PostQuitMessage(0);  // Quit the application
      } else
        DestroyWindow(hWnd);
      break;

    default:
      return DefWindowProc(hWnd, Message, wParam, lParam);
  }
  return 0L;
} // End of WndProc

/************************************************************************/
/* Misc Dialog Window Procedures                                        */
/************************************************************************/
BOOL FAR PASCAL WS_AboutMsgProc(HWND hWndDlg, WORD Message, 
                                WORD wParam, LONG lParam)
{ 
 switch(Message)
 {
   case WM_INITDIALOG:
     cwCenter(hWndDlg, 0);
     break;
   case WM_CLOSE:
     PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
     break;
   case WM_COMMAND:
     switch(wParam)
     {
       case IDOK:
         EndDialog(hWndDlg, TRUE);
         break;
       case IDCANCEL:
         EndDialog(hWndDlg, FALSE);
         break;
     }
     break;
    default:
        return FALSE;
  }
  return TRUE;
}

BOOL FAR PASCAL WS_HostMsgProc(HWND hWndDlg, WORD Message,
                                WORD wParam, LONG lParam)
{
  BOOL lpfTranslated;
   
  switch(Message)
  {
    case WM_INITDIALOG:
      SetDlgItemText(hWndDlg,DLG_HOST_NAME,szRemoteHost);
      SetDlgItemInt(hWndDlg,DLG_HOST_NUMPKTS,nNumPkts,FALSE);
      SetDlgItemInt(hWndDlg,DLG_HOST_PKTLENGTH,nPktLength,FALSE);
      SetDlgItemInt(hWndDlg,DLG_HOST_TIMEOUT,nTimeOut,FALSE);
      CheckDlgButton(hWndDlg,DLG_HOST_VERBOSE,bVerbose);
      cwCenter(hWndDlg, 0);
      break;
    case WM_CLOSE:
      PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
      break;
    case WM_COMMAND:
      switch(wParam)
      {
        case IDOK:
          GetDlgItemText(hWndDlg,DLG_HOST_NAME,szRemoteHost,70);
          nNumPkts=GetDlgItemInt(hWndDlg,DLG_HOST_NUMPKTS,
                             &lpfTranslated,FALSE);
          nPktLength=GetDlgItemInt(hWndDlg,DLG_HOST_PKTLENGTH,
                             &lpfTranslated,FALSE);
          nTimeOut=GetDlgItemInt(hWndDlg,DLG_HOST_TIMEOUT,
                             &lpfTranslated,FALSE);
          bVerbose=IsDlgButtonChecked(hWndDlg,DLG_HOST_VERBOSE);
          if((nPktLength+SIZE_ICMP_HDR)>512) nPktLength=512-SIZE_ICMP_HDR;
          EndDialog(hWndDlg, TRUE);
          break;
        case IDCANCEL:
          EndDialog(hWndDlg, FALSE);
          break;
      }
      break;
    default:
      return FALSE;
  }
  return TRUE;
}

BOOL FAR PASCAL WS_InputMsgProc(HWND hWndDlg, WORD Message,
                                WORD wParam, LONG lParam)
{ 
  switch(Message)
  {
    case WM_INITDIALOG:
      SetDlgItemText(hWndDlg,DLG_PROMPT,szDlgPrompt);
      SetDlgItemText(hWndDlg,DLG_EDIT,szDlgEdit);
      cwCenter(hWndDlg, 0);
      break;
    case WM_CLOSE:
      PostMessage(hWndDlg, WM_COMMAND, IDCANCEL, 0L);
      break;
    case WM_COMMAND:
      switch(wParam)
      {
        case IDOK:
          GetDlgItemText(hWndDlg,DLG_EDIT,szDlgEdit,70);
          EndDialog(hWndDlg, TRUE);
          break;
        case IDCANCEL:
          EndDialog(hWndDlg, FALSE);
          break;
      }
      break;
    default:
      return FALSE;
  }
  return TRUE;
}

int nCwRegisterClasses(void)
{
  WNDCLASS   wndclass;    // struct to define a window class
  memset(&wndclass, 0x00, sizeof(WNDCLASS));

  wndclass.style = CS_HREDRAW | CS_VREDRAW | CS_BYTEALIGNWINDOW;
  wndclass.lpfnWndProc = WndProc;
  wndclass.cbClsExtra = 0;
  wndclass.cbWndExtra = 0;
  wndclass.hInstance = hInst;
  wndclass.hIcon = LoadIcon(hInst, "WS_PING");
  wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);
  wndclass.hbrBackground = (HBRUSH) CreateSolidBrush(RGB(192, 192, 192));
  wndclass.lpszMenuName = szAppName;
  wndclass.lpszClassName = szAppName;
  if(!RegisterClass(&wndclass))
    return -1;
  return(0);
}

void cwCenter(hWnd, top)
HWND hWnd;
int top;
{
  POINT      pt;
  RECT       swp;
  RECT       rParent;
  int        iwidth;
  int        iheight;

  GetWindowRect(hWnd, &swp);
  GetClientRect(hWndMain, &rParent);
  iwidth = swp.right - swp.left;
  iheight = swp.bottom - swp.top;
  pt.x = (rParent.right - rParent.left) / 2;
  pt.y = (rParent.bottom - rParent.top) / 2;
  ClientToScreen(hWndMain, &pt);
  pt.x = pt.x - (iwidth / 2);
  pt.y = pt.y - (iheight / 2);
  if(top)
    pt.y = pt.y + top;
  MoveWindow(hWnd, pt.x, pt.y, iwidth, iheight, FALSE);
}

void CwUnRegisterClasses(void)
{
  WNDCLASS   wndclass;
  memset(&wndclass, 0x00, sizeof(WNDCLASS));
  GetClassInfo(hInst, szAppName, &wndclass);
  DeleteObject(wndclass.hbrBackground);
  UnregisterClass(szAppName, hInst);
}

