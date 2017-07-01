// cstring.h
// Interface de la classe CString
// Implantation pour le C++ Unix
// Le support Windows et des NLS a été supprimé
// 21/06/94 PV	Extrait des MFC
// 29/04/04 PV  Delete, Insert, Replace, Remove
//  2/05/04 PV	Trace du nb d'appels aux constructeurs et destructeurs

#include <string.h>		// strlen
#include <assert.h>

#define BOOL int

class CString
{
public:

// Constructors
	CString();
	CString(const CString& stringSrc);
	CString(char ch, int nRepeat = 1);
	CString(const char* psz);
	CString(const char* pch, int nLength);
	~CString();

// Attributes & Operations

	// as an array of characters
	int GetLength() const;
	BOOL IsEmpty() const;
	void Empty();                       // free up the data

	char GetAt(int nIndex) const;       // 0 based
	char operator[](int nIndex) const;  // same as GetAt
	void SetAt(int nIndex, char ch);
	operator const char*() const;       // as a C string

	// overloaded assignment
	const CString& operator=(const CString& stringSrc);
	const CString& operator=(char ch);
	const CString& operator=(const char* psz);

	// string concatenation
	const CString& operator+=(const CString& string);
	const CString& operator+=(char ch);
	const CString& operator+=(const char* psz);

	friend CString operator+(const CString& string1,
			const CString& string2);
	friend CString operator+(const CString& string, char ch);
	friend CString operator+(char ch, const CString& string);
	friend CString operator+(const CString& string, const char* psz);
	friend CString operator+(const char* psz, const CString& string);

	// string comparison
	int Compare(const char* psz) const;         // straight character
/*
	int CompareNoCase(const char* psz) const;   // ignore case
	int Collate(const char* psz) const;         // NLS aware
*/

	// simple sub-string extraction
	CString Mid(int nFirst, int nCount) const;
	CString Mid(int nFirst) const;
	CString Left(int nCount) const;
	CString Right(int nCount) const;

	CString SpanIncluding(const char* pszCharSet) const;
	CString SpanExcluding(const char* pszCharSet) const;

/*
	// upper/lower/reverse conversion
	void MakeUpper();
	void MakeLower();
	void MakeReverse();
*/

	// Advanced string manipulation
	int Delete(int nIndex, int nCount);
	int Insert(int nIndex, char ch);
	int Insert(int nIndex, char* pstr);
	int Replace(char chOld, char chNew);
	int Replace(char* lpszOld, char* lpszNew);
	int Remove(char chRemove);


	// searching (return starting index, or -1 if not found)
	// look for a single character match
	int Find(char ch) const;                    // like "C" strchr
	int ReverseFind(char ch) const;
	int FindOneOf(const char* pszCharSet) const;

	// look for a specific sub-string
	int Find(const char* pszSub) const;         // like "C" strstr

	// Access to string implementation buffer as "C" character array
	char* GetBuffer(int nMinBufLength);
	void ReleaseBuffer(int nNewLength = -1);
	char* GetBufferSetLength(int nNewLength);

// Implementation
public:
	int GetAllocLength() const;
protected:
	// lengths/sizes in characters
	//  (note: an extra character is always allocated)
	char* m_pchData;            // actual string (zero terminated)
	int m_nDataLength;          // does not include terminating 0
	int m_nAllocLength;         // does not include terminating 0


	// implementation helpers
	void Init();
	void AllocCopy(CString& dest, int nCopyLen, int nCopyIndex, int nExtraLen) const;
	void AllocBuffer(int nLen);
	void AssignCopy(int nSrcLen, const char* pszSrcData);
	void ConcatCopy(int nSrc1Len, const char* pszSrc1Data, int nSrc2Len, const char* pszSrc2Data);
	void ConcatInPlace(int nSrcLen, const char* pszSrcData);
	static void SafeDelete(char* pch);
	static int SafeStrlen(const char* psz);

// Traces
protected:
	static int m_nConstr;		// Nb d'appels à un constructeur
	static int m_nDestr;		// Nb d'appels au destructeur
public:
	static int GetnConstr() { return m_nConstr; }
	static int GetnDestr() { return m_nDestr; }

};


// Compare helpers
BOOL operator==(const CString& s1, const CString& s2);
BOOL operator==(const CString& s1, const char* s2);
BOOL operator==(const char* s1, const CString& s2);
BOOL operator!=(const CString& s1, const CString& s2);
BOOL operator!=(const CString& s1, const char* s2);
BOOL operator!=(const char* s1, const CString& s2);
BOOL operator<(const CString& s1, const CString& s2);
BOOL operator<(const CString& s1, const char* s2);
BOOL operator<(const char* s1, const CString& s2);
BOOL operator>(const CString& s1, const CString& s2);
BOOL operator>(const CString& s1, const char* s2);
BOOL operator>(const char* s1, const CString& s2);
BOOL operator<=(const CString& s1, const CString& s2);
BOOL operator<=(const CString& s1, const char* s2);
BOOL operator<=(const char* s1, const CString& s2);
BOOL operator>=(const CString& s1, const CString& s2);
BOOL operator>=(const CString& s1, const char* s2);
BOOL operator>=(const char* s1, const CString& s2);



// Quelques fonctions inline

inline int CString::GetLength() const
	{ return m_nDataLength; }
inline int CString::GetAllocLength() const
	{ return m_nAllocLength; }
inline BOOL CString::IsEmpty() const
	{ return m_nDataLength == 0; }
inline CString::operator const char*() const
	{ return (const char*)m_pchData; }
inline int CString::SafeStrlen(const char* psz)
	{ return (psz == NULL) ? NULL : strlen(psz); }

inline int CString::Compare(const char* psz) const
	{ return strcmp(m_pchData, psz); }
/*
inline int CString::CompareNoCase(const char* psz) const
	{ return _stricmp(m_pchData, psz); }
inline int CString::Collate(const char* psz) const
	{ return strcoll(m_pchData, psz); }
inline void CString::MakeUpper()
	{ _strupr(m_pchData); }
inline void CString::MakeLower()
	{ _strlwr(m_pchData); }
*/

inline char CString::GetAt(int nIndex) const
	{
		assert(nIndex >= 0);
		assert(nIndex < m_nDataLength);

		return m_pchData[nIndex];
	}
inline char CString::operator[](int nIndex) const
	{
		// same as GetAt

		assert(nIndex >= 0);
		assert(nIndex < m_nDataLength);

		return m_pchData[nIndex];
	}
inline void CString::SetAt(int nIndex, char ch)
	{
		assert(nIndex >= 0);
		assert(nIndex < m_nDataLength);
		assert(ch != 0);

		m_pchData[nIndex] = ch;
	}
inline BOOL operator==(const CString& s1, const CString& s2)
	{ return s1.Compare(s2) == 0; }
inline BOOL operator==(const CString& s1, const char* s2)
	{ return s1.Compare(s2) == 0; }
inline BOOL operator==(const char* s1, const CString& s2)
	{ return s2.Compare(s1) == 0; }
inline BOOL operator!=(const CString& s1, const CString& s2)
	{ return s1.Compare(s2) != 0; }
inline BOOL operator!=(const CString& s1, const char* s2)
	{ return s1.Compare(s2) != 0; }
inline BOOL operator!=(const char* s1, const CString& s2)
	{ return s2.Compare(s1) != 0; }
inline BOOL operator<(const CString& s1, const CString& s2)
	{ return s1.Compare(s2) < 0; }
inline BOOL operator<(const CString& s1, const char* s2)
	{ return s1.Compare(s2) < 0; }
inline BOOL operator<(const char* s1, const CString& s2)
	{ return s2.Compare(s1) > 0; }
inline BOOL operator>(const CString& s1, const CString& s2)
	{ return s1.Compare(s2) > 0; }
inline BOOL operator>(const CString& s1, const char* s2)
	{ return s1.Compare(s2) > 0; }
inline BOOL operator>(const char* s1, const CString& s2)
	{ return s2.Compare(s1) < 0; }
inline BOOL operator<=(const CString& s1, const CString& s2)
	{ return s1.Compare(s2) <= 0; }
inline BOOL operator<=(const CString& s1, const char* s2)
	{ return s1.Compare(s2) <= 0; }
inline BOOL operator<=(const char* s1, const CString& s2)
	{ return s2.Compare(s1) >= 0; }
inline BOOL operator>=(const CString& s1, const CString& s2)
	{ return s1.Compare(s2) >= 0; }
inline BOOL operator>=(const CString& s1, const char* s2)
	{ return s1.Compare(s2) >= 0; }
inline BOOL operator>=(const char* s1, const CString& s2)
	{ return s2.Compare(s1) <= 0; }
