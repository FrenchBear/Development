// ustring.h
// Interface de la classe UString
// Gestion de chaînes unicode
// PV 21/06/94	Extrait des MFC

#include <string.h>		// strlen
#include <assert.h>

#define BOOL int

class UString
{
public:

// Constructors
	UString();
	UString(const UString& stringSrc);
	UString(wchar_t ch, int nRepeat = 1);
	UString(const wchar_t* psz);
	UString(const wchar_t* pch, int nLength);
	~UString();

// Attributes & Operations

	// as an array of characters
	int GetLength() const;
	BOOL IsEmpty() const;
	void Empty();                       // free up the data

	wchar_t GetAt(int nIndex) const;       // 0 based
	wchar_t operator[](int nIndex) const;  // same as GetAt
	void SetAt(int nIndex, wchar_t ch);
	operator const wchar_t*() const;       // as a C string

	// overloaded assignment
	const UString& operator=(const UString& stringSrc);
	const UString& operator=(wchar_t ch);
	const UString& operator=(const wchar_t* psz);

	// string concatenation
	const UString& operator+=(const UString& string);
	const UString& operator+=(wchar_t ch);
	const UString& operator+=(const wchar_t* psz);

	friend UString operator+(const UString& string1,
			const UString& string2);
	friend UString operator+(const UString& string, wchar_t ch);
	friend UString operator+(wchar_t ch, const UString& string);
	friend UString operator+(const UString& string, const wchar_t* psz);
	friend UString operator+(const wchar_t* psz, const UString& string);

	// string comparison
	int Compare(const wchar_t* psz) const;         // straight character
/*
	int CompareNoCase(const wchar_t* psz) const;   // ignore case
	int Collate(const wchar_t* psz) const;         // NLS aware
*/

	// simple sub-string extraction
	UString Mid(int nFirst, int nCount) const;
	UString Mid(int nFirst) const;
	UString Left(int nCount) const;
	UString Right(int nCount) const;

	UString SpanIncluding(const wchar_t* pszCharSet) const;
	UString SpanExcluding(const wchar_t* pszCharSet) const;

/*
	// upper/lower/reverse conversion
	void MakeUpper();
	void MakeLower();
	void MakeReverse();
*/

	// searching (return starting index, or -1 if not found)
	// look for a single character match
	int Find(wchar_t ch) const;                    // like "C" strchr
	int ReverseFind(wchar_t ch) const;
	int FindOneOf(const wchar_t* pszCharSet) const;

	// look for a specific sub-string
	int Find(const wchar_t* pszSub) const;         // like "C" strstr

	// Access to string implementation buffer as "C" character array
	wchar_t* GetBuffer(int nMinBufLength);
	void ReleaseBuffer(int nNewLength = -1);
	wchar_t* GetBufferSetLength(int nNewLength);

// Implementation
public:
	int GetAllocLength() const;
protected:
	// lengths/sizes in characters
	//  (note: an extra character is always allocated)
	wchar_t* m_pchData;         // actual string (zero terminated)
	int m_nDataLength;          // does not include terminating 0
	int m_nAllocLength;         // does not include terminating 0

	// implementation helpers
	void Init();
	void AllocCopy(UString& dest, int nCopyLen, int nCopyIndex, int nExtraLen) const;
	void AllocBuffer(int nLen);
	void AssignCopy(int nSrcLen, const wchar_t* pszSrcData);
	void ConcatCopy(int nSrc1Len, const wchar_t* pszSrc1Data, int nSrc2Len, const wchar_t* pszSrc2Data);
	void ConcatInPlace(int nSrcLen, const wchar_t* pszSrcData);
	static void SafeDelete(wchar_t* pch);
	static int SafeStrlen(const wchar_t* psz);
};


// Compare helpers
BOOL operator==(const UString& s1, const UString& s2);
BOOL operator==(const UString& s1, const wchar_t* s2);
BOOL operator==(const wchar_t* s1, const UString& s2);
BOOL operator!=(const UString& s1, const UString& s2);
BOOL operator!=(const UString& s1, const wchar_t* s2);
BOOL operator!=(const wchar_t* s1, const UString& s2);
BOOL operator<(const UString& s1, const UString& s2);
BOOL operator<(const UString& s1, const wchar_t* s2);
BOOL operator<(const wchar_t* s1, const UString& s2);
BOOL operator>(const UString& s1, const UString& s2);
BOOL operator>(const UString& s1, const wchar_t* s2);
BOOL operator>(const wchar_t* s1, const UString& s2);
BOOL operator<=(const UString& s1, const UString& s2);
BOOL operator<=(const UString& s1, const wchar_t* s2);
BOOL operator<=(const wchar_t* s1, const UString& s2);
BOOL operator>=(const UString& s1, const UString& s2);
BOOL operator>=(const UString& s1, const wchar_t* s2);
BOOL operator>=(const wchar_t* s1, const UString& s2);



// Quelques fonctions inline

inline int UString::GetLength() const
	{ return m_nDataLength; }
inline int UString::GetAllocLength() const
	{ return m_nAllocLength; }
inline BOOL UString::IsEmpty() const
	{ return m_nDataLength == 0; }
inline UString::operator const wchar_t*() const
	{ return (const wchar_t*)m_pchData; }
inline int UString::SafeStrlen(const wchar_t* psz)
	{ return (psz == NULL) ? NULL : wcslen(psz); }

inline int UString::Compare(const wchar_t* psz) const
	{ return wcscmp(m_pchData, psz); }
/*
inline int UString::CompareNoCase(const wchar_t* psz) const
	{ return _stricmp(m_pchData, psz); }
inline int UString::Collate(const wchar_t* psz) const
	{ return strcoll(m_pchData, psz); }
inline void UString::MakeUpper()
	{ _strupr(m_pchData); }
inline void UString::MakeLower()
	{ _strlwr(m_pchData); }
*/

inline wchar_t UString::GetAt(int nIndex) const
	{
		assert(nIndex >= 0);
		assert(nIndex < m_nDataLength);

		return m_pchData[nIndex];
	}
inline wchar_t UString::operator[](int nIndex) const
	{
		// same as GetAt

		assert(nIndex >= 0);
		assert(nIndex < m_nDataLength);

		return m_pchData[nIndex];
	}
inline void UString::SetAt(int nIndex, wchar_t ch)
	{
		assert(nIndex >= 0);
		assert(nIndex < m_nDataLength);
		assert(ch != 0);

		m_pchData[nIndex] = ch;
	}
inline BOOL operator==(const UString& s1, const UString& s2)
	{ return s1.Compare(s2) == 0; }
inline BOOL operator==(const UString& s1, const wchar_t* s2)
	{ return s1.Compare(s2) == 0; }
inline BOOL operator==(const wchar_t* s1, const UString& s2)
	{ return s2.Compare(s1) == 0; }
inline BOOL operator!=(const UString& s1, const UString& s2)
	{ return s1.Compare(s2) != 0; }
inline BOOL operator!=(const UString& s1, const wchar_t* s2)
	{ return s1.Compare(s2) != 0; }
inline BOOL operator!=(const wchar_t* s1, const UString& s2)
	{ return s2.Compare(s1) != 0; }
inline BOOL operator<(const UString& s1, const UString& s2)
	{ return s1.Compare(s2) < 0; }
inline BOOL operator<(const UString& s1, const wchar_t* s2)
	{ return s1.Compare(s2) < 0; }
inline BOOL operator<(const wchar_t* s1, const UString& s2)
	{ return s2.Compare(s1) > 0; }
inline BOOL operator>(const UString& s1, const UString& s2)
	{ return s1.Compare(s2) > 0; }
inline BOOL operator>(const UString& s1, const wchar_t* s2)
	{ return s1.Compare(s2) > 0; }
inline BOOL operator>(const wchar_t* s1, const UString& s2)
	{ return s2.Compare(s1) < 0; }
inline BOOL operator<=(const UString& s1, const UString& s2)
	{ return s1.Compare(s2) <= 0; }
inline BOOL operator<=(const UString& s1, const wchar_t* s2)
	{ return s1.Compare(s2) <= 0; }
inline BOOL operator<=(const wchar_t* s1, const UString& s2)
	{ return s2.Compare(s1) >= 0; }
inline BOOL operator>=(const UString& s1, const UString& s2)
	{ return s1.Compare(s2) >= 0; }
inline BOOL operator>=(const UString& s1, const wchar_t* s2)
	{ return s1.Compare(s2) >= 0; }
inline BOOL operator>=(const wchar_t* s1, const UString& s2)
	{ return s2.Compare(s1) <= 0; }
