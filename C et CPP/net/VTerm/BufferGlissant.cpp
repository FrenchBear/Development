// BurrerGlissant.cpp
// Implantation d'une file de caractères
// 25/6/96 PV

#include "stdafx.h"
#include "VTerm.h"

CBufferGlissant::CBufferGlissant()
{
  m_szBuffer[0] = 0;
  m_iLength = 0;
}

void CBufferGlissant::AjouteCaractere(char c)
{
  if (m_iLength<BUFFERGLISSANT_LENGTH)
  {
	m_szBuffer[m_iLength++] = c;
	m_szBuffer[m_iLength] = 0;
  }
  else
  {
	for (int i=0 ; i<BUFFERGLISSANT_LENGTH-1 ; i++)
	  m_szBuffer[i] = m_szBuffer[i+1];
	m_szBuffer[i] = c;
  }
}

int CBufferGlissant::bChaineDeFin(char *szFin)
{
  int l = strlen(szFin);

  if (l>BUFFERGLISSANT_LENGTH)
  {
	szFin += l-BUFFERGLISSANT_LENGTH;
	l = BUFFERGLISSANT_LENGTH;
  }

  return !strcmp(m_szBuffer+BUFFERGLISSANT_LENGTH-l, szFin);
}
