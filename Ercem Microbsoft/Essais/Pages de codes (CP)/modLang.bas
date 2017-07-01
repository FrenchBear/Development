Attribute VB_Name = "modLang"
Option Explicit

'  Language IDs.
'
'  The following two combinations of primary language ID and
'  sublanguage ID have special semantics:
'
'    Primary Language ID   Sublanguage ID      Result
'    -------------------   ---------------     ------------------------
'    LANG_NEUTRAL          SUBLANG_NEUTRAL     Language neutral
'    LANG_NEUTRAL          SUBLANG_DEFAULT     User default language
'    LANG_NEUTRAL          SUBLANG_SYS_DEFAULT System default language

'
'  Primary language IDs.
'

Public Const LANG_NEUTRAL = &H0

Public Const LANG_AFRIKAANS = &H36
Public Const LANG_ALBANIAN = &H1C
Public Const LANG_ARABIC = &H1
Public Const LANG_ARMENIAN = &H2B
Public Const LANG_ASSAMESE = &H4D
Public Const LANG_AZERI = &H2C
Public Const LANG_BASQUE = &H2D
Public Const LANG_BELARUSIAN = &H23
Public Const LANG_BENGALI = &H45
Public Const LANG_BULGARIAN = &H2
Public Const LANG_CATALAN = &H3
Public Const LANG_CHINESE = &H4
Public Const LANG_CROATIAN = &H1A
Public Const LANG_CZECH = &H5
Public Const LANG_DANISH = &H6
Public Const LANG_DUTCH = &H13
Public Const LANG_ENGLISH = &H9
Public Const LANG_ESTONIAN = &H25
Public Const LANG_FAEROESE = &H38
Public Const LANG_FARSI = &H29
Public Const LANG_FINNISH = &HB
Public Const LANG_FRENCH = &HC
Public Const LANG_GEORGIAN = &H37
Public Const LANG_GERMAN = &H7
Public Const LANG_GREEK = &H8
Public Const LANG_GUJARATI = &H47
Public Const LANG_HEBREW = &HD
Public Const LANG_HINDI = &H39
Public Const LANG_HUNGARIAN = &HE
Public Const LANG_ICELANDIC = &HF
Public Const LANG_INDONESIAN = &H21
Public Const LANG_ITALIAN = &H10
Public Const LANG_JAPANESE = &H11
Public Const LANG_KANNADA = &H4B
Public Const LANG_KASHMIRI = &H60
Public Const LANG_KAZAK = &H3F
Public Const LANG_KONKANI = &H57
Public Const LANG_KOREAN = &H12
Public Const LANG_LATVIAN = &H26
Public Const LANG_LITHUANIAN = &H27
Public Const LANG_MACEDONIAN = &H2F
Public Const LANG_MALAY = &H3E
Public Const LANG_MALAYALAM = &H4C
Public Const LANG_MANIPURI = &H58
Public Const LANG_MARATHI = &H4E
Public Const LANG_NEPALI = &H61
Public Const LANG_NORWEGIAN = &H14
Public Const LANG_ORIYA = &H48
Public Const LANG_POLISH = &H15
Public Const LANG_PORTUGUESE = &H16
Public Const LANG_PUNJABI = &H46
Public Const LANG_ROMANIAN = &H18
Public Const LANG_RUSSIAN = &H19
Public Const LANG_SANSKRIT = &H4F
Public Const LANG_SERBIAN = &H1A
Public Const LANG_SINDHI = &H59
Public Const LANG_SLOVAK = &H1B
Public Const LANG_SLOVENIAN = &H24
Public Const LANG_SPANISH = &HA
Public Const LANG_SWAHILI = &H41
Public Const LANG_SWEDISH = &H1D
Public Const LANG_TAMIL = &H49
Public Const LANG_TATAR = &H44
Public Const LANG_TELUGU = &H4A
Public Const LANG_THAI = &H1E
Public Const LANG_TURKISH = &H1F
Public Const LANG_UKRAINIAN = &H22
Public Const LANG_URDU = &H20
Public Const LANG_UZBEK = &H43
Public Const LANG_VIETNAMESE = &H2A

'
'  Sublanguage IDs.
'
'  The name immediately following SUBLANG_ dictates which primary
'  language ID that sublanguage ID can be combined with to form a
'  valid language ID.
'

Public Const SUBLANG_NEUTRAL = &H0                      ' language neutral
Public Const SUBLANG_DEFAULT = &H1                      ' user default
Public Const SUBLANG_SYS_DEFAULT = &H2                  ' system default

Public Const SUBLANG_ARABIC_SAUDI_ARABIA = &H1          ' Arabic (Saudi Arabia)
Public Const SUBLANG_ARABIC_IRAQ = &H2                  ' Arabic (Iraq)
Public Const SUBLANG_ARABIC_EGYPT = &H3                 ' Arabic (Egypt)
Public Const SUBLANG_ARABIC_LIBYA = &H4                 ' Arabic (Libya)
Public Const SUBLANG_ARABIC_ALGERIA = &H5               ' Arabic (Algeria)
Public Const SUBLANG_ARABIC_MOROCCO = &H6               ' Arabic (Morocco)
Public Const SUBLANG_ARABIC_TUNISIA = &H7               ' Arabic (Tunisia)
Public Const SUBLANG_ARABIC_OMAN = &H8                  ' Arabic (Oman)
Public Const SUBLANG_ARABIC_YEMEN = &H9                 ' Arabic (Yemen)
Public Const SUBLANG_ARABIC_SYRIA = &HA                 ' Arabic (Syria)
Public Const SUBLANG_ARABIC_JORDAN = &HB                ' Arabic (Jordan)
Public Const SUBLANG_ARABIC_LEBANON = &HC               ' Arabic (Lebanon)
Public Const SUBLANG_ARABIC_KUWAIT = &HD                ' Arabic (Kuwait)
Public Const SUBLANG_ARABIC_UAE = &HE                   ' Arabic (U.A.E)
Public Const SUBLANG_ARABIC_BAHRAIN = &HF               ' Arabic (Bahrain)
Public Const SUBLANG_ARABIC_QATAR = &H10                ' Arabic (Qatar)
Public Const SUBLANG_AZERI_LATIN = &H1                  ' Azeri (Latin)
Public Const SUBLANG_AZERI_CYRILLIC = &H2               ' Azeri (Cyrillic)
Public Const SUBLANG_CHINESE_TRADITIONAL = &H1          ' Chinese (Taiwan Region)
Public Const SUBLANG_CHINESE_SIMPLIFIED = &H2           ' Chinese (PR China)
Public Const SUBLANG_CHINESE_HONGKONG = &H3             ' Chinese (Hong Kong)
Public Const SUBLANG_CHINESE_SINGAPORE = &H4            ' Chinese (Singapore)
Public Const SUBLANG_CHINESE_MACAU = &H5                ' Chinese (Macau)
Public Const SUBLANG_DUTCH = &H1                        ' Dutch
Public Const SUBLANG_DUTCH_BELGIAN = &H2                ' Dutch (Belgian)
Public Const SUBLANG_ENGLISH_US = &H1                   ' English (USA)
Public Const SUBLANG_ENGLISH_UK = &H2                   ' English (UK)
Public Const SUBLANG_ENGLISH_AUS = &H3                  ' English (Australian)
Public Const SUBLANG_ENGLISH_CAN = &H4                  ' English (Canadian)
Public Const SUBLANG_ENGLISH_NZ = &H5                   ' English (New Zealand)
Public Const SUBLANG_ENGLISH_EIRE = &H6                 ' English (Irish)
Public Const SUBLANG_ENGLISH_SOUTH_AFRICA = &H7         ' English (South Africa)
Public Const SUBLANG_ENGLISH_JAMAICA = &H8              ' English (Jamaica)
Public Const SUBLANG_ENGLISH_CARIBBEAN = &H9            ' English (Caribbean)
Public Const SUBLANG_ENGLISH_BELIZE = &HA               ' English (Belize)
Public Const SUBLANG_ENGLISH_TRINIDAD = &HB             ' English (Trinidad)
Public Const SUBLANG_ENGLISH_ZIMBABWE = &HC             ' English (Zimbabwe)
Public Const SUBLANG_ENGLISH_PHILIPPINES = &HD          ' English (Philippines)
Public Const SUBLANG_FRENCH = &H1                       ' French
Public Const SUBLANG_FRENCH_BELGIAN = &H2               ' French (Belgian)
Public Const SUBLANG_FRENCH_CANADIAN = &H3              ' French (Canadian)
Public Const SUBLANG_FRENCH_SWISS = &H4                 ' French (Swiss)
Public Const SUBLANG_FRENCH_LUXEMBOURG = &H5            ' French (Luxembourg)
Public Const SUBLANG_FRENCH_MONACO = &H6                ' French (Monaco)
Public Const SUBLANG_GERMAN = &H1                       ' German
Public Const SUBLANG_GERMAN_SWISS = &H2                 ' German (Swiss)
Public Const SUBLANG_GERMAN_AUSTRIAN = &H3              ' German (Austrian)
Public Const SUBLANG_GERMAN_LUXEMBOURG = &H4            ' German (Luxembourg)
Public Const SUBLANG_GERMAN_LIECHTENSTEIN = &H5         ' German (Liechtenstein)
Public Const SUBLANG_ITALIAN = &H1                      ' Italian
Public Const SUBLANG_ITALIAN_SWISS = &H2                ' Italian (Swiss)
Public Const SUBLANG_KASHMIRI_INDIA = &H2               ' Kashmiri (India)
Public Const SUBLANG_KOREAN = &H1                       ' Korean (Extended Wansung)
Public Const SUBLANG_LITHUANIAN = &H1                   ' Lithuanian
Public Const SUBLANG_LITHUANIAN_CLASSIC = &H2           ' Lithuanian (Classic)
Public Const SUBLANG_MALAY_MALAYSIA = &H1               ' Malay (Malaysia)
Public Const SUBLANG_MALAY_BRUNEI_DARUSSALAM = &H2      ' Malay (Brunei Darussalam)
Public Const SUBLANG_NEPALI_INDIA = &H2                 ' Nepali (India)
Public Const SUBLANG_NORWEGIAN_BOKMAL = &H1             ' Norwegian (Bokmal)
Public Const SUBLANG_NORWEGIAN_NYNORSK = &H2            ' Norwegian (Nynorsk)
Public Const SUBLANG_PORTUGUESE = &H2                   ' Portuguese
Public Const SUBLANG_PORTUGUESE_BRAZILIAN = &H1         ' Portuguese (Brazilian)
Public Const SUBLANG_SERBIAN_LATIN = &H2                ' Serbian (Latin)
Public Const SUBLANG_SERBIAN_CYRILLIC = &H3             ' Serbian (Cyrillic)
Public Const SUBLANG_SPANISH = &H1                      ' Spanish (Castilian)
Public Const SUBLANG_SPANISH_MEXICAN = &H2              ' Spanish (Mexican)
Public Const SUBLANG_SPANISH_MODERN = &H3               ' Spanish (Modern)
Public Const SUBLANG_SPANISH_GUATEMALA = &H4            ' Spanish (Guatemala)
Public Const SUBLANG_SPANISH_COSTA_RICA = &H5           ' Spanish (Costa Rica)
Public Const SUBLANG_SPANISH_PANAMA = &H6               ' Spanish (Panama)
Public Const SUBLANG_SPANISH_DOMINICAN_REPUBLIC = &H7   ' Spanish (Dominican Republic)
Public Const SUBLANG_SPANISH_VENEZUELA = &H8            ' Spanish (Venezuela)
Public Const SUBLANG_SPANISH_COLOMBIA = &H9             ' Spanish (Colombia)
Public Const SUBLANG_SPANISH_PERU = &HA                 ' Spanish (Peru)
Public Const SUBLANG_SPANISH_ARGENTINA = &HB            ' Spanish (Argentina)
Public Const SUBLANG_SPANISH_ECUADOR = &HC              ' Spanish (Ecuador)
Public Const SUBLANG_SPANISH_CHILE = &HD                ' Spanish (Chile)
Public Const SUBLANG_SPANISH_URUGUAY = &HE              ' Spanish (Uruguay)
Public Const SUBLANG_SPANISH_PARAGUAY = &HF             ' Spanish (Paraguay)
Public Const SUBLANG_SPANISH_BOLIVIA = &H10             ' Spanish (Bolivia)
Public Const SUBLANG_SPANISH_EL_SALVADOR = &H11         ' Spanish (El Salvador)
Public Const SUBLANG_SPANISH_HONDURAS = &H12            ' Spanish (Honduras)
Public Const SUBLANG_SPANISH_NICARAGUA = &H13           ' Spanish (Nicaragua)
Public Const SUBLANG_SPANISH_PUERTO_RICO = &H14         ' Spanish (Puerto Rico)
Public Const SUBLANG_SWEDISH = &H1                      ' Swedish
Public Const SUBLANG_SWEDISH_FINLAND = &H2              ' Swedish (Finland)
Public Const SUBLANG_URDU_PAKISTAN = &H1                ' Urdu (Pakistan)
Public Const SUBLANG_URDU_INDIA = &H2                   ' Urdu (India)
Public Const SUBLANG_UZBEK_LATIN = &H1                  ' Uzbek (Latin)
Public Const SUBLANG_UZBEK_CYRILLIC = &H2               ' Uzbek (Cyrillic)

'
'  Sorting IDs.
'

Public Const SORT_DEFAULT = &H0                         ' sorting default

Public Const SORT_JAPANESE_XJIS = &H0                   ' Japanese XJIS order
Public Const SORT_JAPANESE_UNICODE = &H1                ' Japanese Unicode order

Public Const SORT_CHINESE_BIG5 = &H0                    ' Chinese BIG5 order
Public Const SORT_CHINESE_PRCP = &H0                    ' PRC Chinese Phonetic order
Public Const SORT_CHINESE_UNICODE = &H1                 ' Chinese Unicode order
Public Const SORT_CHINESE_PRC = &H2                     ' PRC Chinese Stroke Count order
Public Const SORT_CHINESE_BOPOMOFO = &H3                ' Traditional Chinese Bopomofo order

Public Const SORT_KOREAN_KSC = &H0                      ' Korean KSC order
Public Const SORT_KOREAN_UNICODE = &H1                  ' Korean Unicode order

Public Const SORT_GERMAN_PHONE_BOOK = &H1               ' German Phone Book order

Public Const SORT_HUNGARIAN_DEFAULT = &H0               ' Hungarian Default order
Public Const SORT_HUNGARIAN_TECHNICAL = &H1             ' Hungarian Technical order

Public Const SORT_GEORGIAN_TRADITIONAL = &H0            ' Georgian Traditional order
Public Const SORT_GEORGIAN_MODERN = &H1                 ' Georgian Modern order



'  A language ID is a 16 bit value which is the combination of a
'  primary language ID and a secondary language ID.  The bits are
'  allocated as follows:
'
'       +-----------------------+-------------------------+
'       |     Sublanguage ID    |   Primary Language ID   |
'       +-----------------------+-------------------------+
'        15                   10 9                       0   bit
'
'
'  Language ID creation/extraction macros:
'
'    MAKELANGID    - construct language id from a primary language id and
'                    a sublanguage id.
'    PRIMARYLANGID - extract primary language id from a language id.
'    SUBLANGID     - extract sublanguage id from a language id.
'
'#define MAKELANGID(p, s)       ((((WORD  )(s)) << 10) | (WORD  )(p))
'#define PRIMARYLANGID(lgid)    ((WORD  )(lgid) & 0x3ff)
'#define SUBLANGID(lgid)        ((WORD  )(lgid) >> 10)

Public Function MAKELANGID(p As Integer, s As Integer) As Integer
  MAKELANGID = (s * 2 ^ 10) Or p
End Function

Public Function PRIMARYLANGID(lgid As Integer) As Integer
  PRIMARYLANGID = lgid And &H3FF
End Function

Public Function SUBLANGID(lgid As Integer) As Integer
  SUBLANGID = lgid \ (2 ^ 10)
End Function



'  A locale ID is a 32 bit value which is the combination of a
'  language ID, a sort ID, and a reserved area.  The bits are
'  allocated as follows:
'
'       +-------------+---------+-------------------------+
'       |   Reserved  | Sort ID |      Language ID        |
'       +-------------+---------+-------------------------+
'        31         20 19     16 15                      0   bit
'
'
'  Locale ID creation/extraction macros:
'
'    MAKELCID            - construct the locale id from a language id and a sort id.
'    MAKESORTLCID        - construct the locale id from a language id, sort id, and sort version.
'    LANGIDFROMLCID      - extract the language id from a locale id.
'    SORTIDFROMLCID      - extract the sort id from a locale id.
'    SORTVERSIONFROMLCID - extract the sort version from a locale id.
'
'
'#define NLS_VALID_LOCALE_MASK  0x000fffff
'
'#define MAKELCID(lgid, srtid)  ((DWORD)((((DWORD)((WORD  )(srtid))) << 16) |  \
'                                         ((DWORD)((WORD  )(lgid)))))
'#define MAKESORTLCID(lgid, srtid, ver)                                            \
'                               ((DWORD)((MAKELCID(lgid, srtid)) |             \
'                                    (((DWORD)((WORD  )(ver))) << 20)))
'#define LANGIDFROMLCID(lcid)   ((WORD  )(lcid))
'#define SORTIDFROMLCID(lcid)   ((WORD  )((((DWORD)(lcid)) >> 16) & 0xf))
'#define SORTVERSIONFROMLCID(lcid)  ((WORD  )((((DWORD)(lcid)) >> 20) & 0xf))

Public Function MAKELCID(lgid As Integer, srtid As Integer) As Long
  MAKELCID = (srtid * 2 ^ 16) Or lgid
End Function

Public Function MAKESORTLCID(lgid As Integer, srtid As Integer, ver As Integer) As Long
  MAKESORTLCID = MAKELCID(lgid, srtid) Or (ver * 2 ^ 20)
End Function

Public Function LANGIDFROMLCID(lcid As Long) As Integer
  LANGIDFROMLCID = lcid And &HFFFF
End Function

Public Function SORTIDFROMLCID(lcid As Long) As Integer
  SORTIDFROMLCID = (lcid \ (2 ^ 16)) And &HF
End Function

Public Function SORTVERSIONFROMLCID(lcid As Long) As Integer
  SORTVERSIONFROMLCID = (lcid \ (2 ^ 20)) And &HF
End Function


'  Default System and User IDs for language and locale.
'
'#define LANG_SYSTEM_DEFAULT    (MAKELANGID(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT))
'#define LANG_USER_DEFAULT      (MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT))
'
'#define LOCALE_SYSTEM_DEFAULT  (MAKELCID(LANG_SYSTEM_DEFAULT, SORT_DEFAULT))
'#define LOCALE_USER_DEFAULT    (MAKELCID(LANG_USER_DEFAULT, SORT_DEFAULT))
'
'#define LOCALE_NEUTRAL                                                        \
'          (MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL), SORT_DEFAULT))

Public Function LANG_SYSTEM_DEFAULT() As Integer
  LANG_SYSTEM_DEFAULT = MAKELANGID(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT)
End Function

Public Function LANG_USER_DEFAULT() As Integer
  LANG_USER_DEFAULT = MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT)
End Function

Public Function LOCALE_SYSTEM_DEFAULT() As Long
  LOCALE_SYSTEM_DEFAULT = MAKELCID(LANG_SYSTEM_DEFAULT, SORT_DEFAULT)
End Function

Public Function LOCALE_USER_DEFAULT() As Long
  LOCALE_USER_DEFAULT = MAKELCID(LANG_USER_DEFAULT, SORT_DEFAULT)
End Function

Public Function LOCALE_NEUTRAL() As Long
  LOCALE_NEUTRAL = MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL), SORT_DEFAULT)
End Function


