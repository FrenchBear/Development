/***************************************************************************
  Windows Sockets PING Client Application Header File

  Written by:
      John A. Junod             Internet: <junodj@css583.gordon.army.mil>
      267 Hillwood Street                 <zj8549@trotter.usma.edu>
      Martinez, GA 30907      Compuserve: 72321,366 

  This program executable and all source code is released into the public
  domain.  It would be nice to give me a little credit for any use of this 
  code.  The primary purpose of this application was to learn what it takes
  to write a Windows Sockets Application.

  THE INFORMATION AND CODE PROVIDED IS PROVIDED AS IS WITHOUT WARRANTY 
  OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO 
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
  PURPOSE. IN NO EVENT SHALL JOHN A. JUNOD BE LIABLE FOR ANY DAMAGES 
  WHATSOEVER INCLUDING DIRECT, INDIRECT, INCIDENTAL, CONSEQUENTIAL, LOSS 
  OF BUSINESS PROFITS OR SPECIAL DAMAGES, EVEN IF JOHN A. JUNOD HAS BEEN 
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

*****************************************************************************/
/*
  MODULE: WS_PING.H   (main program header file)
*/

//#include <stdio.h>
#include <windows.h>
#include <string.h>
//#include <dir.h>

// **** Dialog box names
// #define DLG_ABOUT                 510
// #define DLG_HOST                  520
// #define DLG_INPUT                 530
// #define DLG_STATUS                540

// **** menu definitions
// may be used by other functions!

#define IDM_CONNECT                 1010
#define IDM_CLOSE                   1020
#define IDM_ASYNC_CONNECT           1030
#define IDM_ABOUT                   1500
#define IDM_EXIT                    1600
#define IDM_LOOKUP                  1601

#define WM_PING_HOST           WM_USER+1
#define WM_PING_PROTO          WM_USER+2
#define WM_PING_CAS            WM_USER+3
#define WM_PING_RECEIVE        WM_USER+4
#define WM_PING_FINISH         WM_USER+5

// **** main window child window identifiers
// TXT = static text windows
// LST = list boxes
// BTN = push buttons
// RB  = radio buttons

// input dialog controls
#define DLG_PROMPT                  3010
#define DLG_EDIT                    3020

// **** connect dialog box controls
#define DLG_HOST_NAME               4010
#define DLG_HOST_NUMPKTS            4020
#define DLG_HOST_PKTLENGTH          4030
#define DLG_HOST_TIMEOUT            4040
#define DLG_HOST_VERBOSE            4050

// **** function prototypes

// in ws_error.c
LPSTR ReturnWSError(UINT Err,LPSTR szBuf);
void ReportWSError(UINT Err);

// in ws_ping.c
LONG FAR PASCAL WndProc(HWND, WORD, WORD, LONG);
BOOL FAR PASCAL WS_AboutMsgProc(HWND, WORD, WORD, LONG);
BOOL FAR PASCAL WS_InputMsgProc(HWND, WORD, WORD, LONG);
BOOL FAR PASCAL WS_HostMsgProc(HWND, WORD, WORD, LONG);
int nCwRegisterClasses(void);
void cwCenter(HWND, int);
void CwUnRegisterClasses(void);

// in ws_paint.c
void ReleaseDisplayMem(VOID);
void DoAddLine(LPSTR);
void DoPrintf(char *fmt,...);
void DoPaint(HWND);
int GetLocalInfo(void);

// ws_pingr.c
LPSTR ReturnICMPType(int );
int   PrintPkt(LPSTR ,int ,struct sockaddr_in FAR *,BOOL);
int   in_cksum(u_short FAR *,int );
SOCKET create_socket(struct sockaddr_in FAR *,LPSTR s);
int   send_ping(SOCKET , struct sockaddr_in FAR *, LPSTR ,int );
int   recv_ping(SOCKET ,LPSTR ,BOOL );
int   PingHost(LPSTR ,int, int, int, BOOL);
SOCKET DoClose(SOCKET);

