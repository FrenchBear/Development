Attribute VB_Name = "modProtectData"
' modProtectData
' From http://www.codyx.org/snippet_chiffrer-dechiffrer-donnees-pour-session-windows-cours_286.aspx
' 2012-09-24    PV  Repackaging to expose a string-based interface, and UTF8 to/from conversions
'
' Example with buffIn() As Byte input to encrypt, and no salt, output returned in buffOut() As Byte:
' ProtectDataCore VarPtr(buffIn(0)),Ubound(buffIn)+1,0&,0&,buffOut

Option Explicit

' Description of a large binary object
Private Type DATA_BLOB
    cbData As Long
    pbData As Long
End Type

Private Declare Function CryptProtectData Lib "crypt32.dll" (ByRef pDataIn As DATA_BLOB, ByVal szDataDescr As String, ByVal pOptionalEntropy As Long, ByVal pvReserved As Long, ByVal pPromptStruct As Long, ByVal dwFlags As Long, ByRef pDataOut As DATA_BLOB) As Long
Private Declare Function CryptUnprotectData Lib "crypt32.dll" (ByRef pDataIn As DATA_BLOB, ByVal ppszDataDescr As Long, ByVal pOptionalEntropy As Long, ByRef pvReserved As Any, ByVal pPromptStruct As Long, ByVal dwFlags As Long, ByRef pDataOut As DATA_BLOB) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function LocalFree Lib "kernel32.dll" (ByVal hMem As Long) As Long


' Encrypt data for current session
' ptrData : pointer to data to encrypt
' dwDataSize : size of data to encrypt in bytes
' ptrEntropy : pointer to salt data (to make deciphering attempts outside session more complex)
' dwEntropySize : size of salt data
' outBuff : protected data
' returns an error code or ERROR_SUCCESS
Public Function ProtectDataCore(ByVal ptrData As Long, ByVal dwDataSize As Long, ByVal ptrEntropy As Long, ByVal dwEntropySize As Long, outBuff() As Byte) As Long
    Dim DataIn As DATA_BLOB, DataOut As DATA_BLOB, entropy As DATA_BLOB
    Dim pEntr As Long
    
    DataIn.cbData = dwDataSize
    DataIn.pbData = ptrData
    entropy.cbData = dwEntropySize
    entropy.pbData = ptrEntropy
    If ptrEntropy Then
        pEntr = VarPtr(entropy)
    Else
        pEntr = 0
    End If
    
    If CryptProtectData(DataIn, "", pEntr, 0&, 0&, 0&, DataOut) = 0 Then
        ProtectDataCore = Err.LastDllError
    Else
        ReDim outBuff(DataOut.cbData - 1)
        CopyMemory outBuff(0), ByVal DataOut.pbData, DataOut.cbData
        LocalFree DataOut.pbData
        ProtectDataCore = 0
    End If
End Function


' Decrypt data for current session
' ptrData : pointer to data to decrypt
' dwDataSize : size of data to decrype in bytes
' ptrEntropy : pointer to salt data
' dwEntropySize : size of salt data
' outBuff : unprotected data as output
' returns an error code or ERROR_SUCCESS
Public Function UnprotectDataCore(ByVal ptrData As Long, ByVal dwDataSize As Long, ByVal ptrEntropy As Long, ByVal dwEntropySize As Long, outBuff() As Byte) As Long
    Dim DataIn As DATA_BLOB, DataOut As DATA_BLOB, entropy As DATA_BLOB
    Dim pEntr As Long
    
    DataIn.cbData = dwDataSize
    DataIn.pbData = ptrData
    entropy.cbData = dwEntropySize
    entropy.pbData = ptrEntropy
    If ptrEntropy Then
        pEntr = VarPtr(entropy)
    Else
        pEntr = 0
    End If
    
    If CryptUnprotectData(DataIn, 0&, pEntr, 0&, 0&, 0&, DataOut) = 0 Then
        UnprotectDataCore = Err.LastDllError
    Else
        ReDim outBuff(DataOut.cbData - 1)
        CopyMemory outBuff(0), ByVal DataOut.pbData, DataOut.cbData
        LocalFree DataOut.pbData
        UnprotectDataCore = 0
    End If
End Function




Public Function ProtectString(ByVal sClearText As String, ByVal sSalt As String) As Byte()
    Dim Secret() As Byte
    Dim Salt() As Byte
    Dim Protected() As Byte
    
    Secret = StringToByteArray(sClearText)
    If sSalt = "" Then
        ProtectDataCore VarPtr(Secret(0)), UBound(Secret) + 1, 0&, 0&, Protected
    Else
        Salt = StringToByteArray(sSalt)
        ProtectDataCore VarPtr(Secret(0)), UBound(Secret) + 1, VarPtr(Salt(0)), UBound(Salt) + 1, Protected
    End If
    ProtectString = Protected
End Function


Public Function UnprotectString(Protected() As Byte, ByVal sSalt As String) As String
    Dim Salt() As Byte
    Dim Unprotected() As Byte

    If sSalt = "" Then
        UnprotectDataCore VarPtr(Protected(0)), UBound(Protected) + 1, 0&, 0&, Unprotected
    Else
        Salt = StringToByteArray(sSalt)
        UnprotectDataCore VarPtr(Protected(0)), UBound(Protected) + 1, VarPtr(Salt(0)), UBound(Salt) + 1, Unprotected
    End If
    UnprotectString = ByteArrayToString(Unprotected)
End Function


' Simple, direct conversion
Public Function StringToByteArray(ByVal sText As String) As Byte()
    Dim b() As Byte
    b = sText
    StringToByteArray = b
End Function

Public Function ByteArrayToString(BuffIn() As Byte) As String
    Dim s As String
    s = BuffIn
    ByteArrayToString = s
End Function




