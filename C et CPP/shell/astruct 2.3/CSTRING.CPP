// Classe CString des MFC
// Immplantation pour le C++ Unix
// Le support Windows et des NLS a ‚t‚ supprim‚
// PV 21/06/94

////////////////////////////////////////////////////////////////////////
// This is a part of the Microsoft Foundation Classes C++ library.
// Copyright (C) 1992-1993 Microsoft Corporation
// All rights reserved.
//
// This source code is only intended as a supplement to the
// Microsoft Foundation Classes Reference and Microsoft
// QuickHelp and/or WinHelp documentation provided with the library.
// See these sources for detailed information regarding the
// Microsoft Foundation Classes product.

#include <stdio.h>
#include <assert.h>
#include <limits.h>		// INT_MAX
#include <string.h>

#include "cstring.h"



//////////////////////////////////////////////////////////////////////
// static class data, special inlines

static char _afxChNil = '\0';


void CString::Init()
{
	m_nDataLength = m_nAllocLength = 0;
	m_pchData = (char*)&_afxChNil;
}

// declared static
void CString::SafeDelete(char* pch)
{
	if (pch != (char*)&_afxChNil)
		delete [] pch;
}

///////////////////////////////////////////////////////////////////////
// Construction/Destruction

CString::CString()
{
	Init();
}

CString::CString(const CString& stringSrc)
{
	// if constructing a CString from another CString, we make a copy of the
	// original string data to enforce value semantics (i.e. each string
	// gets a copy of its own

	stringSrc.AllocCopy(*this, stringSrc.m_nDataLength, 0, 0);
}

void CString::AllocBuffer(int nLen)
 // always allocate one extra character for '\0' termination
 // assumes [optimistically] that data length will equal allocation length
{
	assert(nLen >= 0);
	assert(nLen <= INT_MAX - 1);    // max size (enough room for 1 extra)

	if (nLen == 0)
	{
		Init();
	}
	else
	{
		m_pchData = new char[nLen+1];       // may throw an exception
		m_pchData[nLen] = '\0';
		m_nDataLength = nLen;
		m_nAllocLength = nLen;
	}
}

void CString::Empty()
{
	SafeDelete(m_pchData);
	Init();
	assert(m_nDataLength == 0);
	assert(m_nAllocLength == 0);
}

CString::~CString()
 //  free any attached data
{
	SafeDelete(m_pchData);
}

///////////////////////////////////////////////////////////////////////
// Helpers for the rest of the implementation

void CString::AllocCopy(CString& dest, int nCopyLen, int nCopyIndex,
	 int nExtraLen) const
{
	// will clone the data attached to this string
	// allocating 'nExtraLen' characters
	// Places results in uninitialized string 'dest'
	// Will copy the part or all of original data to start of new string

	int nNewLen = nCopyLen + nExtraLen;

	if (nNewLen == 0)
	{
		dest.Init();
	}
	else
	{
		dest.AllocBuffer(nNewLen);
		memcpy(dest.m_pchData, &m_pchData[nCopyIndex], nCopyLen);
	}
}

///////////////////////////////////////////////////////////////////////
// More sophisticated construction

CString::CString(const char* psz)
{
	int nLen;
	if ((nLen = SafeStrlen(psz)) == 0)
		Init();
	else
	{
		AllocBuffer(nLen);
		memcpy(m_pchData, psz, nLen);
	}
}


///////////////////////////////////////////////////////////////////////
// Assignment operators
//  All assign a new value to the string
//      (a) first see if the buffer is big enough
//      (b) if enough room, copy on top of old buffer, set size and type
//      (c) otherwise free old string data, and create a new one
//
//  All routines return the new string (but as a 'const CString&' so that
//      assigning it again will cause a copy, eg: s1 = s2 = "hi there".
//

void CString::AssignCopy(int nSrcLen, const char* pszSrcData)
{
	// check if it will fit
	if (nSrcLen > m_nAllocLength)
	{
		// it won't fit, allocate another one
		Empty();
		AllocBuffer(nSrcLen);
	}
	if (nSrcLen != 0)
		memcpy(m_pchData, pszSrcData, nSrcLen);
	m_nDataLength = nSrcLen;
	m_pchData[nSrcLen] = '\0';
}

const CString& CString::operator =(const CString& stringSrc)
{
	AssignCopy(stringSrc.m_nDataLength, stringSrc.m_pchData);
	return *this;
}

const CString& CString::operator =(const char* psz)
{
	AssignCopy(SafeStrlen(psz), psz);
	return *this;
}


///////////////////////////////////////////////////////////////////////
// concatenation

// NOTE: "operator +" is done as friend functions for simplicity
//      There are three variants:
//          CString + CString
// and for ? = char, const char*
//          CString + ?
//          ? + CString

void CString::ConcatCopy(int nSrc1Len, const char* pszSrc1Data,
		int nSrc2Len, const char* pszSrc2Data)
{
  // -- master concatenation routine
  // Concatenate two sources
  // -- assume that 'this' is a new CString object

	int nNewLen = nSrc1Len + nSrc2Len;
	AllocBuffer(nNewLen);
	memcpy(m_pchData, pszSrc1Data, nSrc1Len);
	memcpy(&m_pchData[nSrc1Len], pszSrc2Data, nSrc2Len);
}

CString operator +(const CString& string1, const CString& string2)
{
	CString s;
	s.ConcatCopy(string1.m_nDataLength, string1.m_pchData,
		string2.m_nDataLength, string2.m_pchData);
	return s;
}

CString operator +(const CString& string, const char* psz)
{
	CString s;
	s.ConcatCopy(string.m_nDataLength, string.m_pchData, CString::SafeStrlen(psz), psz);
	return s;
}


CString operator +(const char* psz, const CString& string)
{
	CString s;
	s.ConcatCopy(CString::SafeStrlen(psz), psz, string.m_nDataLength, string.m_pchData);
	return s;
}

////////////////////////////////////////////////////////////////////////
// Advanced direct buffer access

char* CString::GetBuffer(int nMinBufLength)
{
	assert(nMinBufLength >= 0);

	if (nMinBufLength > m_nAllocLength)
	{
		// we have to grow the buffer
		char* pszOldData = m_pchData;
		int nOldLen = m_nDataLength;        // AllocBuffer will tromp it

		AllocBuffer(nMinBufLength);
		memcpy(m_pchData, pszOldData, nOldLen);
		m_nDataLength = nOldLen;
		m_pchData[m_nDataLength] = '\0';

		SafeDelete(pszOldData);
	}

	// return a pointer to the character storage for this string
	assert(m_pchData != NULL);
	return m_pchData;
}

void CString::ReleaseBuffer(int nNewLength)
{
	if (nNewLength == -1)
		nNewLength = strlen(m_pchData); // zero terminated

	assert(nNewLength <= m_nAllocLength);
	m_nDataLength = nNewLength;
	m_pchData[m_nDataLength] = '\0';
}

char* CString::GetBufferSetLength(int nNewLength)
{
	assert(nNewLength >= 0);

	GetBuffer(nNewLength);
	m_nDataLength = nNewLength;
	m_pchData[m_nDataLength] = '\0';
	return m_pchData;
}

////////////////////////////////////////////////////////////////////////
// Commonly used routines (rarely used routines in STREX.CPP)

int CString::Find(char ch) const
{
	// find first single character
	char* psz;
		psz = strchr(m_pchData, ch);

	// return -1 if not found and index otherwise
	return (psz == NULL) ? -1 : (int)(psz - m_pchData);
}

int CString::FindOneOf(const char* pszCharSet) const
{
	assert(pszCharSet != NULL);
	{
		char* psz = (char*) strpbrk(m_pchData, pszCharSet);
		return (psz == NULL) ? -1 : (int)(psz - m_pchData);
	}
}


////////////////////////////////////////////////////////////////////////
// concatenate in place

void CString::ConcatInPlace(int nSrcLen, const char* pszSrcData)
{
	//  -- the main routine for += operators

	// if the buffer is too small, or we have a width mis-match, just
	//   allocate a new buffer (slow but sure)
	if (m_nDataLength + nSrcLen > m_nAllocLength)
	{
		// we have to grow the buffer, use the Concat in place routine
		char* pszOldData = m_pchData;
		ConcatCopy(m_nDataLength, pszOldData, nSrcLen, pszSrcData);
		assert(pszOldData != NULL);
		SafeDelete(pszOldData);
	}
	else
	{
		// fast concatenation when buffer big enough
		memcpy(&m_pchData[m_nDataLength], pszSrcData, nSrcLen);
		m_nDataLength += nSrcLen;
	}
	assert(m_nDataLength <= m_nAllocLength);
	m_pchData[m_nDataLength] = '\0';
}

const CString& CString::operator +=(const char* psz)
{
	ConcatInPlace(SafeStrlen(psz), psz);
	return *this;
}

const CString& CString::operator +=(char ch)
{
	ConcatInPlace(1, &ch);
	return *this;
}

const CString& CString::operator +=(const CString& string)
{
	ConcatInPlace(string.m_nDataLength, string.m_pchData);
	return *this;
}

///////////////////////////////////////////////////////////////////////
// More sophisticated construction

CString::CString(char ch, int nLength)
{
	if (nLength < 1)
		// return empty string if invalid repeat count
		Init();
	else
	{
		AllocBuffer(nLength);
		memset(m_pchData, ch, nLength);
	}
}


CString::CString(const char* pch, int nLength)
{
	if (nLength == 0)
		Init();
	else
	{
		assert(pch != NULL);
		AllocBuffer(nLength);
		memcpy(m_pchData, pch, nLength);
	}
}

///////////////////////////////////////////////////////////////////////
// Assignment operators

const CString& CString::operator =(char ch)
{
	AssignCopy(1, &ch);
	return *this;
}

///////////////////////////////////////////////////////////////////////
// less common string expressions

CString operator +(const CString& string1, char ch)
{
	CString s;
	s.ConcatCopy(string1.m_nDataLength, string1.m_pchData, 1, &ch);
	return s;
}


CString operator +(char ch, const CString& string)
{
	CString s;
	s.ConcatCopy(1, &ch, string.m_nDataLength, string.m_pchData);
	return s;
}

///////////////////////////////////////////////////////////////////////
// Very simple sub-string extraction

CString CString::Mid(int nFirst) const
{
	return Mid(nFirst, m_nDataLength - nFirst);
}

CString CString::Mid(int nFirst, int nCount) const
{
	assert(nFirst >= 0);
	assert(nCount >= 0);

	// out-of-bounds requests return sensible things
	if (nFirst + nCount > m_nDataLength)
		nCount = m_nDataLength - nFirst;
	if (nFirst > m_nDataLength)
		nCount = 0;

	CString dest;
	AllocCopy(dest, nCount, nFirst, 0);
	return dest;
}

CString CString::Right(int nCount) const
{
	assert(nCount >= 0);

	if (nCount > m_nDataLength)
		nCount = m_nDataLength;

	CString dest;
	AllocCopy(dest, nCount, m_nDataLength-nCount, 0);
	return dest;
}

CString CString::Left(int nCount) const
{
	assert(nCount >= 0);

	if (nCount > m_nDataLength)
		nCount = m_nDataLength;

	CString dest;
	AllocCopy(dest, nCount, 0, 0);
	return dest;
}

// strspn equivalent
CString CString::SpanIncluding(const char* pszCharSet) const
{
	assert(pszCharSet != NULL);
	return Left(strspn(m_pchData, pszCharSet));
}

// strcspn equivalent
CString CString::SpanExcluding(const char* pszCharSet) const
{
	assert(pszCharSet != NULL);
	return Left(strcspn(m_pchData, pszCharSet));
}

///////////////////////////////////////////////////////////////////////
// Finding

int CString::ReverseFind(char ch) const
{
	char* psz;
		psz = (char*)strrchr(m_pchData, ch);

	return (psz == NULL) ? -1 : (int)(psz - m_pchData);
}

// find a sub-string (like strstr)
int CString::Find(const char* pszSub) const
{
	assert(pszSub != NULL);
	char* psz;

		psz = (char*)strstr(m_pchData, pszSub);

	// return -1 for not found, distance from beginning otherwise
	return (psz == NULL) ? -1 : (int)(psz - m_pchData);
}

////////////////////////////////////////////////////////////////////////
