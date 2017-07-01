/*************************************************************************
 Windows Sockets PING Application Support Module

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

 Note that MOST Windows Sockets DLL's do not support RAW_SOCKETS.  This
 does work with Trumpet's Windows Sockets DLL Alpha 18.
*************************************************************************/
#include "ws_glob.h"
#include "ws_ping.h"
#include "ip_icmp.h"

int nTransmitted=0;
int nReceived=0;
int nMaxWait=5000;  // milliseconds

u_long lTotalTime,lMinTime,lMaxTime;

SOCKET DoClose(SOCKET sockfd)
{
  if(WSAIsBlocking()) {
    bAborted=TRUE;
    WSACancelBlockingCall();
  }

  if(closesocket(sockfd)==SOCKET_ERROR) {
    DoPrintf("[%u] close error: %s",sockfd,
       ReturnWSError(WSAGetLastError(),NULL));
  } else {
    DoPrintf("[%u] socket closed.",sockfd);
    sockfd=INVALID_SOCKET;
  }
  return(sockfd);
}

PrintHeader(struct sockaddr_in FAR *saDestAddr,int nDataSize)
{
  DoAddLine(" ");
  DoPrintf("PING %s (%s): %u data bytes",
      szRemoteHost,inet_ntoa(saDestAddr->sin_addr),nDataSize+SIZE_ICMP_HDR);
  lMaxTime=lTotalTime=0l; lMinTime=99999999l;
  return(0);
}

PrintStats() {
  DoAddLine(" ");
  DoPrintf("PING Statistics for %s",szRemoteHost);
  if(nTransmitted && nReceived)
    DoPrintf("%d packets transmitted, %d packets received, %d%% packet loss",
      nTransmitted,nReceived,
      (int)(((nTransmitted-nReceived)*100)/nTransmitted));
  else if(nTransmitted)
    DoPrintf("%d packets transmitted, %d packets received, 100%% packet loss",
      nTransmitted,nReceived);
  if(nReceived)
    DoPrintf("round-trip (ms) min/avg/max = %ld/%ld/%ld",
      lMinTime,lTotalTime/nReceived,lMaxTime);
  return 0;
}

int send_ping(SOCKET sockfd, struct sockaddr_in FAR *saDestAddr,
          LPSTR pPacket,int nLength)
{
  int nRC;
  struct icmp *icmp;
  u_long *timeloc;

  nLength+=SIZE_ICMP_HDR;
  icmp=(struct icmp *)pPacket;
  // set the send time
  timeloc=&pPacket[SIZE_ICMP_HDR];
  *timeloc=GetTickCount();
  // complete the ICMP packet header
  icmp->icmp_type=ICMP_ECHO;
  icmp->icmp_code=0;
  icmp->icmp_cksum=0;
  icmp->icmp_id=(int)hWndMain;
  icmp->icmp_seq=nTransmitted;
  // compute the checksum
  icmp->icmp_cksum=in_cksum(icmp,nLength);
  // send the packet
  if((nRC=sendto(sockfd,pPacket,nLength,0,
                 (struct sockaddr *) saDestAddr,
                 sizeof(struct sockaddr)))==SOCKET_ERROR) {
    DoPrintf("[sendto] %s",ReturnWSError(WSAGetLastError(),NULL));
    if(WSAGetLastError()!=WSAEWOULDBLOCK &&
       WSAGetLastError()!=WSAEINPROGRESS)
      nTransmitted++;
  } else {
    nTransmitted++;
    if(nRC!=nLength)
      DoPrintf("[sendto] wrote %d bytes, return=%d",nLength,nRC);
  }

  return(nRC==nLength);
}

recv_ping(SOCKET sockfd,LPSTR szRecvPkt,BOOL bPrintFlag)
{
  int  nBytesRecv;
  int  saFromAddrLen;
  struct sockaddr_in  saFromAddr;
  int  nRC;

// NOTE: this is for the blocking version..... this means we won't exit
// until we get the packet(s) we are looking for.  This means we have to
// use a timer function to make us exit.

  nRC=FALSE;
  saFromAddrLen=sizeof(saFromAddr);
  SetTimer(hWndMain,10,nMaxWait,NULL);
  nBytesRecv=recvfrom(sockfd,szRecvPkt,MAXPACKET,0,
                 (struct sockaddr *)&saFromAddr,
                 &saFromAddrLen);
  KillTimer(hWndMain,10);
  if(nBytesRecv!=SOCKET_ERROR || WSAGetLastError()!=WSAEINTR) {
    if(nBytesRecv==SOCKET_ERROR) {
      DoPrintf("[recvfrom] %s",ReturnWSError(WSAGetLastError(),NULL));
      return FALSE;
    } else
      nRC=PrintPkt(szRecvPkt,nBytesRecv,&saFromAddr,bPrintFlag);
  }
  return nRC;
}

// compute packet checksum
int in_cksum(u_short FAR *pPacket,int nBytes)
{
  long sum;
  u_short oddbyte;
  u_short answer;

  sum=0l;
  while(nBytes>1) { sum += *pPacket++; nBytes -= 2; }
  if(nBytes==1) {
    oddbyte=0;
    *((u_char FAR *) &oddbyte) = *(u_char FAR *)pPacket;
    sum += oddbyte;
  }
  sum = (sum >> 16) + (sum & 0xffff);
  sum += (sum >> 16);
  answer= ~sum;
  return (answer);
}

int PrintPkt(LPSTR pPacket,int nLength,struct sockaddr_in FAR *saFromAddr,
             BOOL bVerbose)
{
  int iphdrlen;
  static struct ip *ip;
  static struct icmp *icmp;
  static struct in_addr *iptr;
  u_long ulrc;
  static u_long lEndTime,*lpStartTime,lTripTime;

  lEndTime=GetTickCount();
  saFromAddr->sin_addr.s_addr=ntohl(saFromAddr->sin_addr.s_addr);
  ip=(struct ip *) pPacket;
  iphdrlen=ip->ip_hl << 2;
  if(nLength < iphdrlen + ICMP_MINLEN) {
    if(bVerbose) {
      ulrc=ntohl(saFromAddr->sin_addr.s_addr);
      iptr = (struct in_addr *) &ulrc;
      DoPrintf("[received] too short (%d bytes) from %s\n",nLength,
         inet_ntoa(*iptr));
    }
    return FALSE;
  }
  nLength -= iphdrlen;
  icmp=(struct icmp *)(pPacket + iphdrlen);
  if(icmp->icmp_type != ICMP_ECHOREPLY) {
    if(bVerbose) {
      ulrc=ntohl(saFromAddr->sin_addr.s_addr);
      iptr = (struct in_addr *) &ulrc;
      DoPrintf("[received] %d bytes from %s: icmp_type=%d (%s) icmp_code=%d",
        nLength,
        inet_ntoa(*iptr),
        icmp->icmp_type,
        ReturnICMPType(icmp->icmp_type),
        icmp->icmp_code);
    }
    return FALSE;
  }

  ulrc=ntohl(saFromAddr->sin_addr.s_addr);
  iptr = (struct in_addr *) &ulrc;

  if(icmp->icmp_id!=hWndMain) {
    DoPrintf("[received] %d bytes from %s. not for us",
        nLength,inet_ntoa(*iptr));
    return FALSE;
  }
  lpStartTime = &pPacket[SIZE_ICMP_HDR];
  lTripTime = lEndTime - *lpStartTime;
  lTotalTime += lTripTime;
  if(lTripTime < lMinTime) lMinTime=lTripTime;
  if(lTripTime > lMaxTime) lMaxTime=lTripTime;

  DoPrintf("%d bytes from %s: icmp_seq=%d time=%ld ms",
       nLength,inet_ntoa(*iptr),icmp->icmp_seq,lTripTime);

  nReceived++;

  return TRUE;
}

LPSTR ReturnICMPType(int nType)
{
  static char *ICMPTypeTable[]={
    "Echo Reply", "ICMP 1", "ICMP 2", "DestUnrchbl",
    "SrcQnch", "Redirect", "6", "7","Echo","9","10",
    "Time Exceed", "ParamPrblm", "Timestamp", "Timestamp reply",
    "InfoRqst", "InfoRply"
  };

  if(nType<0 || nType>16)
    return("Out-of-range");
  return(ICMPTypeTable[nType]);
}

