/***************************************************************************
  Windows Sockets Client Application Support Module

  Written by:
      John A. Junod             Internet: <junodj@css583.gordon.army.mil>
      267 Hillwood Street                 <zj8549@trotter.usma.edu>
      Martinez, GA 30907      Compuserve: 72321,366 

  This program executable and all source code is released into the public
  domain.  If you use this code in your program, the following statement
  must be included in your source code and in the documentation:

  *****  This program uses source code written by John A. Junod.  ******

  THE INFORMATION AND CODE PROVIDED IS PROVIDED AS IS WITHOUT WARRANTY 
  OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO 
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
  PURPOSE. IN NO EVENT SHALL JOHN A. JUNOD BE LIABLE FOR ANY DAMAGES 
  WHATSOEVER INCLUDING DIRECT, INDIRECT, INCIDENTAL, CONSEQUENTIAL, LOSS 
  OF BUSINESS PROFITS OR SPECIAL DAMAGES, EVEN IF JOHN A. JUNOD HAS BEEN 
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

*****************************************************************************/

#include "ws_glob.h"
#include "ws_ping.h"

LPSTR ReturnWSError(UINT nErr,LPSTR lpszBuf)
{
  static char szErrMsg[128];
  LPSTR lpszRetStr;

  switch(nErr)
  {
    case WSAVERNOTSUPPORTED:
      lpszRetStr="version of WinSock not supported";
      break;
    case WSASYSNOTREADY:
      lpszRetStr="WinSock not present or not responding";
      break;
    case WSAEINVAL:
      lpszRetStr="app version not supported by DLL";
      break;
    case WSAHOST_NOT_FOUND:
      lpszRetStr="Authoritive: Host not found";
      break;
    case WSATRY_AGAIN:
      lpszRetStr="Non-authoritive: host not found or server failure";
      break;
    case WSANO_RECOVERY:
      lpszRetStr="Non-recoverable: refused or not implemented";
      break;
    case WSANO_DATA:
      lpszRetStr="Valid name, no data record for type";
      break;
/*
    case WSANO_ADDRESS:
      lpszRetStr="Valid name, no MX record";
      break;
*/
    case WSANOTINITIALISED:
      lpszRetStr="WSA Startup not initialized";
      break;
    case WSAENETDOWN:
      lpszRetStr="Network subsystem failed";
      break;
    case WSAEINPROGRESS:
      lpszRetStr="Blocking operation in progress";
      break;
    case WSAEINTR:
      lpszRetStr="Blocking call cancelled";
      break;
    case WSAEAFNOSUPPORT:
      lpszRetStr="address family not supported";
      break;
    case WSAEMFILE:
      lpszRetStr="no file descriptors available";
      break;
    case WSAENOBUFS:
      lpszRetStr="no buffer space available";
      break;
    case WSAEPROTONOSUPPORT:
      lpszRetStr="specified protocol not supported";
      break;
    case WSAEPROTOTYPE:
      lpszRetStr="protocol wrong type for this socket";
      break;
    case WSAESOCKTNOSUPPORT:
      lpszRetStr="socket type not supported for address family";
      break;
    case WSAENOTSOCK:
      lpszRetStr="descriptor is not a socket";
      break;
    case WSAEWOULDBLOCK:
      lpszRetStr="socket marked as non-blocking and SO_LINGER set not 0";
      break;
    case WSAEADDRINUSE:
      lpszRetStr="address already in use";
      break;
    case WSAECONNABORTED:
      lpszRetStr="connection aborted";
      break;
    case WSAECONNRESET:
      lpszRetStr="connection reset";
      break;
    case WSAENOTCONN:
      lpszRetStr="not connected";
      break;
    case WSAETIMEDOUT:
      lpszRetStr="connection timed out";
      break;
    case WSAECONNREFUSED:
      lpszRetStr="connection refused";
      break;
    case WSAEHOSTDOWN:
      lpszRetStr="host down";
      break;
    case WSAENETUNREACH:
      lpszRetStr="network unreachable";
      break;
    case WSAEHOSTUNREACH:
      lpszRetStr="host unreachable";
      break;
    case WSAEADDRNOTAVAIL:
      lpszRetStr="address not available";
      break;
    default:
      if(lpszBuf==NULL) lpszBuf=szErrMsg;
      wsprintf((LPSTR)lpszBuf, (LPSTR)"error %u", nErr);
      return(lpszBuf);
  }
  if(lpszBuf!=NULL) {
    lstrcpy(lpszBuf,lpszRetStr);
    return(lpszBuf);
  }
  return(lpszRetStr);
}

VOID ReportWSError(UINT nErr)
{
  DoAddLine(ReturnWSError(nErr,NULL));
}

