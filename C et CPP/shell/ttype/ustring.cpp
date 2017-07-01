// Classe UString
// Adaptation de la classe CString des MFC en Unicode
// 24/12/01 PV
// 29/04/04 PV  Delete, Insert, Replace, Remove
//  2/05/04 PV	Trace du nb d'appels aux constructeurs et destructeurs

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

#include "ustring.h"


#include <iostream.h>	// debug only

//////////////////////////////////////////////////////////////////////
// static class data, special inlines

static wchar_t _afxChNil = L'\0';

int UString::m_nConstr;
int UString::m_nDestr;

void UString::Init()
{
	m_nDataLength = m_nAllocLength = 0;
	m_pchData = (wchar_t*)&_afxChNil;
}

// declared static
void UString::SafeDelete(wchar_t* pch)
{
	if (pch != (wchar_t*)&_afxChNil)
		delete [] pch;
}

///////////////////////////////////////////////////////////////////////
// Construction/Destruction

UString::UString()
{
  m_nConstr++;
  Init();
}

UString::UString(const UString& stringSrc)
{
  // if constructing a UString from another UString, we make a copy of the
  // original string data to enforce value semantics (i.e. each string
  // gets a copy of its own

  m_nConstr++;
  stringSrc.AllocCopy(*this, stringSrc.m_nDataLength, 0, 0);
}

void UString::AllocBuffer(int nLen)
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
	  m_pchData = new wchar_t[nLen+1];       // may throw an exception
	  m_pchData[nLen] = '\0';
	  m_nDataLength = nLen;
	  m_nAllocLength = nLen;
  }
}

void UString::Empty()
{
  SafeDelete(m_pchData);
  Init();
  assert(m_nDataLength == 0);
  assert(m_nAllocLength == 0);
}

UString::~UString()
 //  free any attached data
{
  m_nDestr++;
  SafeDelete(m_pchData);
}

///////////////////////////////////////////////////////////////////////
// Helpers for the rest of the implementation

void UString::AllocCopy(UString& dest, int nCopyLen, int nCopyIndex,
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
		memcpy(dest.m_pchData, &m_pchData[nCopyIndex], nCopyLen*2);
	}
}

///////////////////////////////////////////////////////////////////////
// More sophisticated construction

UString::UString(const wchar_t* psz)
{
  m_nConstr++;

  int nLen;
  if ((nLen = SafeStrlen(psz)) == 0)
	  Init();
  else
  {
	  AllocBuffer(nLen);
	  memcpy(m_pchData, psz, nLen*2);
  }
}


///////////////////////////////////////////////////////////////////////
// Assignment operators
//  All assign a new value to the string
//      (a) first see if the buffer is big enough
//      (b) if enough room, copy on top of old buffer, set size and type
//      (c) otherwise free old string data, and create a new one
//
//  All routines return the new string (but as a 'const UString&' so that
//      assigning it again will cause a copy, eg: s1 = s2 = "hi there".
//

void UString::AssignCopy(int nSrcLen, const wchar_t* pszSrcData)
{
	// check if it will fit
	if (nSrcLen > m_nAllocLength)
	{
		// it won't fit, allocate another one
		Empty();
		AllocBuffer(nSrcLen);
	}
	if (nSrcLen != 0)
		memcpy(m_pchData, pszSrcData, nSrcLen*2);
	m_nDataLength = nSrcLen;
	m_pchData[nSrcLen] = '\0';
}

const UString& UString::operator =(const UString& stringSrc)
{
	AssignCopy(stringSrc.m_nDataLength, stringSrc.m_pchData);
	return *this;
}

const UString& UString::operator =(const wchar_t* psz)
{
	AssignCopy(SafeStrlen(psz), psz);
	return *this;
}


///////////////////////////////////////////////////////////////////////
// concatenation

// NOTE: "operator +" is done as friend functions for simplicity
//      There are three variants:
//          UString + UString
// and for ? = wchar_t, const wchar_t*
//          UString + ?
//          ? + UString

void UString::ConcatCopy(int nSrc1Len, const wchar_t* pszSrc1Data,
		int nSrc2Len, const wchar_t* pszSrc2Data)
{
  // -- master concatenation routine
  // Concatenate two sources
  // -- assume that 'this' is a new UString object

	int nNewLen = nSrc1Len + nSrc2Len;
	AllocBuffer(nNewLen);
	memcpy(m_pchData, pszSrc1Data, nSrc1Len*2);
	memcpy(&m_pchData[nSrc1Len], pszSrc2Data, nSrc2Len*2);
}

UString operator +(const UString& string1, const UString& string2)
{
	UString s;
	s.ConcatCopy(string1.m_nDataLength, string1.m_pchData,
		string2.m_nDataLength, string2.m_pchData);
	return s;
}

UString operator +(const UString& string, const wchar_t* psz)
{
	UString s;
	s.ConcatCopy(string.m_nDataLength, string.m_pchData, UString::SafeStrlen(psz), psz);
	return s;
}


UString operator +(const wchar_t* psz, const UString& string)
{
	UString s;
	s.ConcatCopy(UString::SafeStrlen(psz), psz, string.m_nDataLength, string.m_pchData);
	return s;
}

////////////////////////////////////////////////////////////////////////
// Advanced direct buffer access

wchar_t* UString::GetBuffer(int nMinBufLength)
{
	assert(nMinBufLength >= 0);

	if (nMinBufLength > m_nAllocLength)
	{
		// we have to grow the buffer
		wchar_t* pszOldData = m_pchData;
		int nOldLen = m_nDataLength;        // AllocBuffer will tromp it

		AllocBuffer(nMinBufLength);
		memcpy(m_pchData, pszOldData, nOldLen*2);
		m_nDataLength = nOldLen;
		m_pchData[m_nDataLength] = '\0';

		SafeDelete(pszOldData);
	}

	// return a pointer to the character storage for this string
	assert(m_pchData != NULL);
	return m_pchData;
}

void UString::ReleaseBuffer(int nNewLength)
{
	if (nNewLength == -1)
		nNewLength = wcslen(m_pchData); // zero terminated

	assert(nNewLength <= m_nAllocLength);
	m_nDataLength = nNewLength;
	m_pchData[m_nDataLength] = '\0';
}

wchar_t* UString::GetBufferSetLength(int nNewLength)
{
	assert(nNewLength >= 0);

	GetBuffer(nNewLength);
	m_nDataLength = nNewLength;
	m_pchData[m_nDataLength] = '\0';
	return m_pchData;
}

////////////////////////////////////////////////////////////////////////
// Commonly used routines (rarely used routines in STREX.CPP)

int UString::Find(wchar_t ch) const
{
	// find first single character
	wchar_t* psz;
		psz = wcschr(m_pchData, ch);

	// return -1 if not found and index otherwise
	return (psz == NULL) ? -1 : (int)(psz - m_pchData);
}

int UString::FindLast(wchar_t ch) const
{
	// find last single character
	wchar_t* psz;
		psz = wcsrchr(m_pchData, ch);

	// return -1 if not found and index otherwise
	return (psz == NULL) ? -1 : (int)(psz - m_pchData);
}

int UString::FindOneOf(const wchar_t* pszCharSet) const
{
	assert(pszCharSet != NULL);
	{
		wchar_t* psz = (wchar_t*) wcspbrk(m_pchData, pszCharSet);
		return (psz == NULL) ? -1 : (int)(psz - m_pchData);
	}
}


////////////////////////////////////////////////////////////////////////
// concatenate in place

void UString::ConcatInPlace(int nSrcLen, const wchar_t* pszSrcData)
{
	//  -- the main routine for += operators

	// if the buffer is too small, or we have a width mis-match, just
	//   allocate a new buffer (slow but sure)
	if (m_nDataLength + nSrcLen > m_nAllocLength)
	{
		// we have to grow the buffer, use the Concat in place routine
		wchar_t* pszOldData = m_pchData;
		ConcatCopy(m_nDataLength, pszOldData, nSrcLen, pszSrcData);
		assert(pszOldData != NULL);
		SafeDelete(pszOldData);
	}
	else
	{
		// fast concatenation when buffer big enough
		memcpy(&m_pchData[m_nDataLength], pszSrcData, nSrcLen*2);
		m_nDataLength += nSrcLen;
	}
	assert(m_nDataLength <= m_nAllocLength);
	m_pchData[m_nDataLength] = '\0';
}

const UString& UString::operator +=(const wchar_t* psz)
{
	ConcatInPlace(SafeStrlen(psz), psz);
	return *this;
}

const UString& UString::operator +=(wchar_t ch)
{
	ConcatInPlace(1, &ch);
	return *this;
}

const UString& UString::operator +=(const UString& string)
{
	ConcatInPlace(string.m_nDataLength, string.m_pchData);
	return *this;
}

///////////////////////////////////////////////////////////////////////
// More sophisticated construction

UString::UString(wchar_t ch, int nLength)
{
  m_nConstr++;

  if (nLength < 1)
	  // return empty string if invalid repeat count
	  Init();
  else
  {
	  AllocBuffer(nLength);
	  // Pas de memset avec wchar_t
	  for (int i=0 ; i<nLength ; i++)
		m_pchData[i] = ch;
  }
}


UString::UString(const wchar_t* pch, int nLength)
{
  m_nConstr++;

  if (nLength == 0)
	  Init();
  else
  {
	  assert(pch != NULL);
	  AllocBuffer(nLength);
	  memcpy(m_pchData, pch, nLength*2);
  }
}

///////////////////////////////////////////////////////////////////////
// Assignment operators

const UString& UString::operator =(wchar_t ch)
{
	AssignCopy(1, &ch);
	return *this;
}

///////////////////////////////////////////////////////////////////////
// less common string expressions

UString operator +(const UString& string1, wchar_t ch)
{
	UString s;
	s.ConcatCopy(string1.m_nDataLength, string1.m_pchData, 1, &ch);
	return s;
}


UString operator +(wchar_t ch, const UString& string)
{
	UString s;
	s.ConcatCopy(1, &ch, string.m_nDataLength, string.m_pchData);
	return s;
}

///////////////////////////////////////////////////////////////////////
// Very simple sub-string extraction

UString UString::Mid(int nFirst) const
{
	return Mid(nFirst, m_nDataLength - nFirst);
}

UString UString::Mid(int nFirst, int nCount) const
{
	assert(nFirst >= 0);
	assert(nCount >= 0);

	// out-of-bounds requests return sensible things
	if (nFirst + nCount > m_nDataLength)
		nCount = m_nDataLength - nFirst;
	if (nFirst > m_nDataLength)
		nCount = 0;

	UString dest;
	AllocCopy(dest, nCount, nFirst, 0);
	return dest;
}

UString UString::Right(int nCount) const
{
	assert(nCount >= 0);

	if (nCount > m_nDataLength)
		nCount = m_nDataLength;

	UString dest;
	AllocCopy(dest, nCount, m_nDataLength-nCount, 0);
	return dest;
}

UString UString::Left(int nCount) const
{
	assert(nCount >= 0);

	if (nCount > m_nDataLength)
		nCount = m_nDataLength;

	UString dest;
	AllocCopy(dest, nCount, 0, 0);
	return dest;
}

// strspn equivalent
UString UString::SpanIncluding(const wchar_t* pszCharSet) const
{
	assert(pszCharSet != NULL);
	return Left(wcsspn(m_pchData, pszCharSet));
}

// strcspn equivalent
UString UString::SpanExcluding(const wchar_t* pszCharSet) const
{
	assert(pszCharSet != NULL);
	return Left(wcscspn(m_pchData, pszCharSet));
}


///////////////////////////////////////////////////////////////////////
// Case

void UString::MakeUpper()
{
  wcsupr(m_pchData);
}

void UString::MakeLower()
{
  wcslwr(m_pchData);
}


///////////////////////////////////////////////////////////////////////
// Finding

int UString::ReverseFind(wchar_t ch) const
{
	wchar_t* psz;
		psz = (wchar_t*)wcsrchr(m_pchData, ch);

	return (psz == NULL) ? -1 : (int)(psz - m_pchData);
}

// find a sub-string (like strstr)
int UString::Find(const wchar_t* pszSub) const
{
	assert(pszSub != NULL);
	wchar_t* psz;

		psz = (wchar_t*)wcsstr(m_pchData, pszSub);

	// return -1 for not found, distance from beginning otherwise
	return (psz == NULL) ? -1 : (int)(psz - m_pchData);
}


//////////////////////////////////////////////////////////////////////////////
// Advanced manipulation

int UString::Delete(int nIndex, int nCount /* = 1 */)
{
	if (nIndex < 0)
		nIndex = 0;
	int nNewLength = m_nDataLength;
	if (nCount > 0 && nIndex < nNewLength)
	{
		int nCharsToCopy = nNewLength - (nIndex + nCount) + 1;
		memmove(m_pchData + nIndex, m_pchData + nIndex + nCount, nCharsToCopy * sizeof(wchar_t));
		m_nDataLength = nNewLength - nCount;
	}

	return nNewLength;
}

int UString::Insert(int nIndex, wchar_t ch)
{
	if (nIndex < 0)
		nIndex = 0;

	int nNewLength = m_nDataLength;
	if (nIndex > nNewLength)
		nIndex = nNewLength;
	nNewLength++;

	if (m_nAllocLength < nNewLength)
	{
		wchar_t* pstrold = m_pchData;
		int nOldDataLength = m_nDataLength;
		AllocBuffer(nNewLength);
		memcpy(m_pchData, pstrold, (nOldDataLength+1)*sizeof(wchar_t));
		SafeDelete(pstrold);
	}

	// move existing bytes down
	memmove(m_pchData + nIndex + 1,
		m_pchData + nIndex, (nNewLength-nIndex)*sizeof(wchar_t));
	m_pchData[nIndex] = ch;
	m_nDataLength = nNewLength;

	return nNewLength;
}

int UString::Insert(int nIndex, wchar_t* pstr)
{
	if (nIndex < 0)
		nIndex = 0;

	int nInsertLength = SafeStrlen(pstr);
	int nNewLength = m_nDataLength;
	if (nInsertLength > 0)
	{
		if (nIndex > nNewLength)
			nIndex = nNewLength;
		nNewLength += nInsertLength;

		if (m_nAllocLength < nNewLength)
		{
			wchar_t* pstrold = m_pchData;
			int nOldDataLength = m_nDataLength;
			AllocBuffer(nNewLength);
			memcpy(m_pchData, pstrold, (nOldDataLength+1)*sizeof(wchar_t));
			SafeDelete(pstrold);
		}

		// move existing bytes down
		memmove(m_pchData + nIndex + nInsertLength,
			m_pchData + nIndex,
			(nNewLength-nIndex-nInsertLength+1)*sizeof(wchar_t));
		memcpy(m_pchData + nIndex,
			pstr, nInsertLength*sizeof(wchar_t));
		m_nDataLength = nNewLength;
	}

	return nNewLength;
}

int UString::Replace(wchar_t chOld, wchar_t chNew)
{
	int nCount = 0;

	// short-circuit the nop case
	if (chOld != chNew)
	{
		// otherwise modify each wchar_tacter that matches in the string
		wchar_t* psz = m_pchData;
		wchar_t* pszEnd = psz + m_nDataLength;
		while (psz < pszEnd)
		{
			// replace instances of the specified wchar_tacter only
			if (*psz == chOld)
			{
				*psz = chNew;
				nCount++;
			}
			psz += 1;
		}
	}
	return nCount;
}

int UString::Replace(wchar_t* lpszOld, wchar_t* lpszNew)
{
	// can't have empty or NULL lpszOld

	int nSourceLen = SafeStrlen(lpszOld);
	if (nSourceLen == 0)
		return 0;
	int nReplacementLen = SafeStrlen(lpszNew);

	// loop once to figure out the size of the result string
	int nCount = 0;
	wchar_t* lpszStart = m_pchData;
	wchar_t* lpszEnd = m_pchData + m_nDataLength;
	wchar_t* lpszTarget;
	while (lpszStart < lpszEnd)
	{
		while ((lpszTarget = wcsstr(lpszStart, lpszOld)) != NULL)
		{
			nCount++;
			lpszStart = lpszTarget + nSourceLen;
		}
		lpszStart += wcslen(lpszStart) + 1;
	}

	// if any changes were made, make them
	if (nCount > 0)
	{
		// if the buffer is too small, just
		//   allocate a new buffer (slow but sure)
		int nOldLength = m_nDataLength;
		int nNewLength =  nOldLength + (nReplacementLen-nSourceLen)*nCount;
		if (m_nAllocLength < nNewLength)
		{
			wchar_t* pstr = m_pchData;
			int nOldDataLength = m_nDataLength;
			AllocBuffer(nNewLength);
			memcpy(m_pchData, pstr, nOldDataLength*sizeof(wchar_t));
			SafeDelete(pstr);
		}
		// else, we just do it in-place
		lpszStart = m_pchData;
		lpszEnd = m_pchData + m_nDataLength;

		// loop again to actually do the work
		while (lpszStart < lpszEnd)
		{
			while ( (lpszTarget = wcsstr(lpszStart, lpszOld)) != NULL)
			{
				int nBalance = nOldLength - (lpszTarget - m_pchData + nSourceLen);
				memmove(lpszTarget + nReplacementLen, lpszTarget + nSourceLen,
					nBalance * sizeof(wchar_t));
				memcpy(lpszTarget, lpszNew, nReplacementLen*sizeof(wchar_t));
				lpszStart = lpszTarget + nReplacementLen;
				lpszStart[nBalance] = '\0';
				nOldLength += (nReplacementLen - nSourceLen);
			}
			lpszStart += wcslen(lpszStart) + sizeof(wchar_t);
		}
		m_nDataLength = nNewLength;
	}

	return nCount;
}

int UString::Remove(wchar_t chRemove)
{
	wchar_t* pstrSource = m_pchData;
	wchar_t* pstrDest = m_pchData;
	wchar_t* pstrEnd = m_pchData + m_nDataLength;

	while (pstrSource < pstrEnd)
	{
		if (*pstrSource != chRemove)
		{
			*pstrDest = *pstrSource;
			pstrDest += sizeof(wchar_t);
		}
		pstrSource += sizeof(wchar_t);
	}
	*pstrDest = '\0';
	int nCount = pstrSource - pstrDest;
	m_nDataLength -= nCount;

	return nCount;
}
