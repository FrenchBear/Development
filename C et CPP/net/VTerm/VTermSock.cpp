// VTermSock.cpp : implementation file
// 5/5/95 PV

#include "stdafx.h"
#include "VTerm.h"
#include "VTermSock.h"
#include "VTermDoc.h"

//#include <stddef.h>

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

IMPLEMENT_DYNAMIC(CVTermSocket, CSocket)

CVTermSocket::CVTermSocket(CVTermDoc* pDoc)
{
  m_pDoc = pDoc;
}

void CVTermSocket::OnReceive(int nErrorCode)
{
  CAsyncSocket::OnReceive(nErrorCode);

  unsigned char szBuffer[500];
  int iNbLu;

  iNbLu=Receive(szBuffer, sizeof(szBuffer));
  m_pDoc->DoChaine((char *)szBuffer, iNbLu);
  m_pDoc->DoSync();
}


void CVTermSocket::OnClose(int nErrorCode)
{
//  ::MessageBox(NULL, "OnClose", "CVTermSocket::OnClose", MB_OK);
  m_pDoc->Deconnexion();
}

/*
void CVTermSocket::OnConnect(int nErrorCode)
{
  ::MessageBox(NULL, "OnConnect", "CVTermSocket::OnConnect", MB_OK);
  bConnectDone = TRUE;
  iConnectStatus = nErrorCode;
}
*/