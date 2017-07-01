/*************************************************************************
 Windows Sockets Application Support Module
 Written by John A. Junod, 267 Hillwood St., Martinez, GA, 30907 93.10.01
 <junodj@css583.gordon.army.mil>     <zj8549@trotter.usma.edu> 

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

*************************************************************************/

#define IS_GLOBAL_C   /* prevent externs from being read in ws_glob.h */
#include "ws_glob.h"
#include "ws_ping.h"

#ifndef MAXPACKET
#define MAXPACKET 4096
#endif

BOOL bAutoStart=TRUE;                  // automatically prompt for connect
BOOL bAborted=FALSE;                   // set by timeout routine

char szMsgBuf[MAXPACKET];              // main i/o buffer
u_char szSendPkt[MAXPACKET];           // output transfer buffer
char szString[512];                    // temp string area
char szDlgPrompt[80]="input:";         // used by input dialog as prompt
char szDlgEdit[80]="";                 // used by input dialog for output
char szRemoteHost[80]="";              // remote host name/addr to connect to
char szAppName[20];                    // this programs name "ws_ftp"
char szIniFile[]="WINSOCK.INI";        // INI file name

GLOBALHANDLE hGMem[100];               // memory for debug window display

HCURSOR hStdCursor,hWaitCursor;        // cursors

HWND hInst;                            // handle of instance
HWND hWndMain;                         // handle of main window

int bConnected=0;          // connected flag
int bCmdInProgress=0;      // command in progress flag

int  nWndx;                // the x axis multiplier
int  nWndy;                // the y axis multiplier

// options
int bVerbose=0;            // maximum verbosity (turns extra debug msgs on)

int iCode;                 // return code from last command(..)

int ptrhGMem=0;

SOCKET ping_socket=INVALID_SOCKET;

WORD sVPos;                            // scroll pos for debug window

WSADATA WSAData;                       // windows sockets dll information


