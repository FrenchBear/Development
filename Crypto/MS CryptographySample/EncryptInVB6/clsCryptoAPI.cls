VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsCryptoAPI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
' ---------------------------------------------------------------------------
' Module level variables
' ---------------------------------------------------------------------------
    Private g_lngCryptoContext       As Long
    Private g_strInData          As String
    Private g_abytOutData()      As Byte
    Private g_abytPassword()           As Byte
    '
    Private Const ALG_CLASS_ANY     As Long = 0
    Private Const ALG_TYPE_ANY      As Long = 0
    Private Const ALG_CLASS_HASH    As Long = 32768
    Private Const ALG_TYPE_BLOCK    As Long = 1536
    Private Const ALG_CLASS_DATA_ENCRYPT  As Long = 24576
    Private Const ALG_SID_RC2       As Long = 2
    Private Const ALG_SID_SHA1      As Long = 4
    ' Hash algorithms
    Private Const CALG_SHA1         As Long = ALG_CLASS_HASH Or ALG_TYPE_ANY Or ALG_SID_SHA1
    ' Block ciphers
    Private Const CALG_RC2          As Long = ALG_CLASS_DATA_ENCRYPT Or ALG_TYPE_BLOCK Or ALG_SID_RC2
    ' CryptSetProvParam
    Private Const PROV_RSA_FULL        As Long = 1
    ' used when aquiring the provider
    Private Const CRYPT_VERIFYCONTEXT  As Long = &HF0000000
    ' Microsoft provider data
    Private Const MS_DEFAULT_PROVIDER  As String = _
                  "Microsoft Base Cryptographic Provider v1.0"
    ' used to specify not to use any salt value while deriving the key
    Private Const CRYPT_NO_SALT As Long = &H10
' ---------------------------------------------------------------------------
' Declares
' ---------------------------------------------------------------------------
    '
      Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" _
              (dest As Any, source As Any, ByVal bytes As Long)
    '
      Private Declare Function GetLastError Lib "kernel32" () As Long
    '
      Private Declare Function CryptHashData Lib "advapi32.dll" _
              (ByVal hhash As Long, ByVal pbData As String, _
              ByVal dwDataLen As Long, ByVal dwFlags As Long) As Long
    '
      Private Declare Function CryptCreateHash Lib "advapi32.dll" _
              (ByVal hProv As Long, ByVal algid As Long, _
              ByVal hkey As Long, ByVal dwFlags As Long, _
              ByRef phHash As Long) As Long
    '
      Private Declare Function CryptDestroyHash Lib "advapi32.dll" _
              (ByVal hhash As Long) As Long
    '
      Private Declare Function CryptAcquireContext Lib "advapi32.dll" _
              Alias "CryptAcquireContextA" (ByRef phProv As Long, _
              ByVal pszContainer As String, ByVal pszProvider As String, _
              ByVal dwProvType As Long, ByVal dwFlags As Long) As Long
    '
      Private Declare Function CryptReleaseContext Lib "advapi32.dll" _
              (ByVal hProv As Long, ByVal dwFlags As Long) As Long
    '
      Private Declare Function CryptDeriveKey Lib "advapi32.dll" _
              (ByVal hProv As Long, ByVal algid As Long, _
              ByVal hBaseData As Long, ByVal dwFlags As Long, _
              ByRef phKey As Long) As Long
    '
      Private Declare Function CryptDestroyKey Lib "advapi32.dll" _
              (ByVal hkey As Long) As Long
    '
      Private Declare Function CryptEncrypt Lib "advapi32.dll" _
              (ByVal hkey As Long, ByVal hhash As Long, ByVal Final As Long, _
              ByVal dwFlags As Long, ByVal pbData As String, _
              ByRef pdwDataLen As Long, ByVal dwBufLen As Long) As Long
    '
    '---------------------------Properties-------------------------
    '
    Public Property Let InputData(arInData() As Byte)
Attribute InputData.VB_Description = "Input only.  Data to be Encrypted/Decrypted."
    '
      g_strInData = ByteArrayToString(arInData())
    '
    End Property
    '
    Public Property Get OutputData() As Byte()
Attribute OutputData.VB_Description = "Read only.  Return encrypted/decrypted data in byte array format."
    '
      OutputData = g_abytOutData
    '
    End Property
    '
    Public Property Let Password(arPWord() As Byte)
Attribute Password.VB_Description = "Receives user supplied password in byte array format."
    '
      Erase g_abytPassword()                  ' Empty module level password array
      ReDim g_abytPassword(0)                 ' resize to smallest size
      '
      If UBound(arPWord) > 0 Then
          g_abytPassword = arPWord            ' transfer pass array to module array
          Erase arPWord()                  ' erase passed array
      End If
    '
    End Property
    '
    Public Property Get Password() As Byte()
Attribute Password.VB_Description = "Returns password in byte array format."
    '
      Password = g_abytPassword()
    '
    End Property

'
'----------------------Functions and Procedures-------------------------
'
    Public Function ByteArrayToString(arByte() As Byte) As String
Attribute ByteArrayToString.VB_Description = "Convert a byte array to string format"
    '
    ' ------------------Define variables---------------------------------
    '
      Dim lngCounter          As Long
      Dim lngMax           As Long
      Dim lngLen        As Long
      Dim lngPadLen    As Long
      Dim lngIdx  As Long
      Dim strTemp          As String
      Dim strOut        As String
      
      Const ADD_SPACES     As Long = 10000
      
    '
    ' -----------------Determine amount of data in the byte array.--------------------
    '
      strTemp = ""
      lngIdx = 1                 ' index pointer for output string
      lngMax = UBound(arByte)    ' determine number of elements in array
      lngPadLen = (ADD_SPACES * 9)    ' 90000 blank spaces
      strOut = Space$(lngPadLen)   ' preload output string
      
    '
    ' ------------Unload the byte array and convert each character back to its ASCII-------------
    ' ----------------------------------------character value------------------------------------
    '
      For lngCounter = 0 To lngMax - 1
          
          strTemp = Chr$(arByte(lngCounter))  ' Convert each byte to an ASCII character
          lngLen = Len(strTemp)         ' save the length of the converted data
          
          ' see if some more padding has to be added to the output string
          If (lngIdx + lngLen) >= lngPadLen Then
              lngPadLen = lngPadLen + ADD_SPACES ' boost blank space counter
              strOut = strOut & Space$(ADD_SPACES) ' append some blank spaces
          End If
          
          ' insert data into output string
          Mid$(strOut, lngIdx, lngLen) = strTemp
          
          ' increment output string pointer
          lngIdx = lngIdx + lngLen
                 
      Next
      
    '
    '---------------------------- Return the string data----------------------------------
    '
      strOut = RTrim$(strOut)  ' remove trailing blanks
      ByteArrayToString = strOut  ' return data string
      
    '
    '------------------------ Empty variables-----------------------------
    '
      strOut = String$(250, 0)
      
    End Function
    Public Function Encrypt(Optional intHashType As Integer = 1, _
                            Optional intCipherType As Integer = 1) As Boolean
      Encrypt = CryptoEncrypt(intHashType, intCipherType)
    End Function
    
    Private Function CryptoEncrypt(intHashType As Integer, _
                                   intCipherType As Integer) As Boolean
        
    '
    '---------------------- Define local variables-----------------------------
    '
    Dim lngHashHnd      As Long     ' Hash handle
    Dim lngkey         As Long
    Dim lngRetCode      As Long     ' return value from an API call
    Dim lngHashType     As Long
    Dim lngLen       As Long
    Dim lngAlgoType   As Long
    Dim lngHExchgKey    As Long
    Dim lngEncDataLength  As Long
    Dim lngEnctBuffLen  As Long
    Dim strEncBuffer  As String
    Dim strOutData   As String
    Dim strPassword     As String
      
    '
    '--------------------------- Initialize variables-------------------------------
    '
    CryptoEncrypt = False        ' preset to FALSE
    Erase g_abytOutData()
    strOutData = ""
    strEncBuffer = ""
    strPassword = ""
    lngHashType = CALG_SHA1
    lngAlgoType = CALG_RC2
    '
    '----------------------- Aquire the provider handle---------------------------
    '
    If g_lngCryptoContext = 0 Then
        If Not GetProvider Then
            Call Class_Terminate       ' Failed.  Time to leave.
            Exit Function
        End If
    End If
    
    On Error GoTo CryptoEncrypt_Error
    '
    '---------------------- convert password to string-----------------------------
    '
    If UBound(g_abytPassword) > 0 Then
        strPassword = ByteArrayToString(g_abytPassword())
    End If
    '
    '----------------------- Create a hash object----------------------------------
    '
    If Not CBool(CryptCreateHash(g_lngCryptoContext, lngHashType, ByVal 0&, _
                 ByVal 0&, lngHashHnd)) Then
                 
        MsgBox "Error: " & CStr(GetLastError) & " during CryptCreateHash!", _
               vbExclamation Or vbOKOnly, "Encryption Errors"
        GoTo CleanUp
    End If
    '
    '------------------------- Hash in the password text----------------------------
    '
    If Not CBool(CryptHashData(lngHashHnd, strPassword, Len(strPassword), ByVal 0&)) Then
        MsgBox "Error: " & CStr(GetLastError) & " during CryptHashData!", _
               vbExclamation Or vbOKOnly, "Encryption Errors"
        GoTo CleanUp
    End If
    '
    '-------------- Create a session key from the hash object--------------------
    '
    If Not CBool(CryptDeriveKey(g_lngCryptoContext, lngAlgoType, _
                 lngHashHnd, ByVal CRYPT_NO_SALT, lngkey)) Then
                 
        MsgBox "Error: " & CStr(GetLastError) & " during CryptDeriveKey!", _
               vbExclamation Or vbOKOnly, "Encryption Errors"
        GoTo CleanUp
    End If
    '
    '----------------------- Destroy hash object--------------------------------
    '
    If lngHashHnd <> 0 Then
        lngRetCode = CryptDestroyHash(lngHashHnd)
    End If
    lngHashHnd = 0
    
    '
    '------------------------- Prepare data for encryption.-----------------------
    '
    lngEncDataLength = Len(g_strInData)
    lngEnctBuffLen = lngEncDataLength * 2
    strEncBuffer = String$(lngEnctBuffLen, vbNullChar)
    LSet strEncBuffer = g_strInData
    
    '
    '--------------------- Encrypt the text data---------------------------------
    '
    If Not CBool(CryptEncrypt(lngkey, ByVal 0&, ByVal 1&, ByVal 0&, _
                              strEncBuffer, lngEncDataLength, lngEnctBuffLen)) Then
        
        MsgBox "Bytes required:" & CStr(lngEnctBuffLen) & vbCrLf & vbCrLf & _
               "Error: " & CStr(GetLastError) & " during CryptEncrypt!", _
               vbExclamation Or vbOKOnly, "Encryption Errors"
        GoTo CleanUp
    End If
    
    '
    '--------------- Return the encrypted data string in a byte array-------------
    '
    strOutData = Mid$(strEncBuffer, 1, lngEncDataLength)
    g_abytOutData = StringToByteArray(strOutData)
    CryptoEncrypt = True     ' Successful finish
      
CleanUp:
    '
    ' -------------------------Destroy session key.-----------------------------
    '
    
    If lngkey <> 0 Then
        lngRetCode = CryptDestroyKey(lngkey)
    End If
      
    '
    '-------------------------- Destroy key exchange key handle---------------------
    '
    If lngHExchgKey <> 0 Then
        lngRetCode = CryptDestroyKey(lngHExchgKey)
    End If
      
    '
    '---------------------------- Destroy hash object--------------------------------
    '
    If lngHashHnd <> 0 Then
        lngRetCode = CryptDestroyHash(lngHashHnd)
    End If
      
    '
    '----------------------------- Empty variables-----------------------------------
    '
    lngHashHnd = 0
    strPassword = String$(250, 0)
    Exit Function
    
CryptoEncrypt_Error:
    '
    '----------------------- An error ocurred during the encryption process---------------------
    '
    MsgBox "Error: " & CStr(Err.Number) & "  " & Err.Description & vbCrLf & _
         vbCrLf & "A critical error ocurred during the encryption process.", _
         vbCritical Or vbOKOnly, "Encryption Error"

    Resume CleanUp
    '
    End Function
    '
    Public Function StringToByteArray(varInput As Variant) As Byte()
Attribute StringToByteArray.VB_Description = "Converts a string of data into a byte array [Range 0, 255]."
    '
    '--------------------------- Define local variables----------------------------
    '
    Dim lngIdx     As Long
    Dim lngLen    As Long
    Dim bytBuffer()  As Byte
    Dim bytData()    As Byte
        
    '
    '----Store length of data string in a variable.  Speeds up the process by not----
    '----having to constantly evaluate the data length.  Works great with loops------
    '--------------and long strings of data.  Good habit to get into.---------------
    '
    lngLen = Len(varInput)
    If lngLen < 1 Then
        ReDim bytData(0)
        StringToByteArray = bytData
        Exit Function
    End If
      
    '
    '------------- Resize the array based on length on input string--------------
    '
    ReDim bytBuffer(lngLen)
    ReDim bytData(lngLen)
        
    '
    '----Convert each character in the data string to its ASCII numeric equivalent.------------
    '----I use the VB function CByte() because sometimes the ASC() function returns------------
    '------------data that does not convert to a value of 0 to 255 cleanly.--------------------
    '
    For lngIdx = 0 To lngLen - 1
        bytBuffer(lngIdx) = CByte(Asc(Mid$(varInput, lngIdx + 1, 1)))
    Next
        
    '
    '--------------- Copy data from memory to variable----------------------
    '
    CopyMemory bytData(0), bytBuffer(0), lngLen
      
    '
    '--------------- Return the byte array------------------------------------
    '
    StringToByteArray = bytData()
      
    '
    '---------------- Resize arrays to smallest size---------------------------
    '
    ReDim bytData(0)
    ReDim bytBuffer(0)
    '
    End Function
    '
    Private Function GetProvider() As Boolean
Attribute GetProvider.VB_Description = "Obtains the provider handle.  To use 128-bit cipher strength then set the property EnhancedProvider = TRUE."
    '
    '------------------------ Define local variables-----------------------------
    '
    Dim strTemp       As String
    Dim strProvider  As String
    Dim strErrorMsg   As String
      
    On Error Resume Next
    '
    '------------------------ Prepare string buffers-----------------------------
    '
    strTemp = vbNullChar
    strProvider = MS_DEFAULT_PROVIDER & vbNullChar
    '
    '------------------------ Gain Access To CryptoAPI.---------------------------
    '
    If CBool(CryptAcquireContext(g_lngCryptoContext, ByVal strTemp, _
             ByVal strProvider, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT)) Then
        GetProvider = True
        Exit Function
    End If
    '
    End Function
    '
    Private Sub Class_Initialize()
    '
       ReDim g_abytPassword(0)
    '
    End Sub
    '
    Private Sub Class_Terminate()
    '
      Dim lngRetValue As Long
    '
    '----------------------- If we managed to load a Microsoft Provider ID, then release it.--------------------
    '
      If g_lngCryptoContext <> 0 Then
          lngRetValue = CryptReleaseContext(g_lngCryptoContext, ByVal 0&)
      End If
    '
    End Sub


