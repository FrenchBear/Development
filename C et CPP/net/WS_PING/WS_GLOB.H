/***************************************************************************
  Windows Sockets Client Application Suport Module

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
  MODULE: WS_GLOB.H  (global header file)
*/

#include "winsock.h"

#ifndef WS_GLOBHEADER

#define WS_GLOBHEADER

#ifndef INADDR_NONE
#define INADDR_NONE 0xffffffff
#endif

#ifndef MAXHOSTNAMELEN
#define MAXHOSTNAMELEN 64
#endif

#ifndef MAXPACKET
#define MAXPACKET 4096
#endif

// some miscellaneous definitions that we use

#define FTP_PRELIM   1
#define FTP_COMPLETE 2
#define FTP_CONTINUE 3
#define FTP_RETRY    4
#define FTP_ERROR    5

#ifndef IS_GLOBAL_C

extern BOOL bAutoStart;
extern BOOL bAborted;
 
extern char szMsgBuf[MAXPACKET];     // main i/o buffer
extern u_char szSendPkt[MAXPACKET];  // output transfer buffer
extern char szString[512];           // temp string area
extern char szDlgPrompt[80];         // used by input dialog as prompt
extern char szDlgEdit[80];           // used by input dialog for output
extern char szRemoteHost[80];        // remote host name/addr to connect to
extern char szAppName[20];           // this programs name "ws_ftp"
extern char szIniFile[];             // INI file name
 
extern GLOBALHANDLE hGMem[100];      // memory for debug window display
 
extern HCURSOR hStdCursor;           // cursors
extern HCURSOR hWaitCursor;          // cursors
 
extern HWND hInst;                   // handle of instance
extern HWND hWndMain;                // handle of main window
 
extern int bConnected;               // connected flag
extern int bCmdInProgress;           // command in progress flag
 
extern int nWndx;                    // the x axis multiplier
extern int nWndy;                    // the y axis multiplier
 
// options
extern int bVerbose;       // maximum verbosity (turns extra debug msgs on)
 
extern int iCode;          // return code from last command(..)
 
extern int ptrhGMem;
 
extern SOCKET ping_socket;           // control channel socket
 
extern WORD sVPos;                   // scroll pos for debug window
 
extern WSADATA WSAData;              // windows sockets dll information
 
#endif /* if IS_GLOBAL_C */
 
#endif /* if WS_GLOBHEADER */

