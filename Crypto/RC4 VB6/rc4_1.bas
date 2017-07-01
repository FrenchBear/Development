Attribute VB_Name = "rc4_1"
' Example #1 of RC4 algorithm encryption
' 2012-09-24    PV
' From http://www.vbforums.com/showthread.php?508368-RESOLVED-Encrypting-Password-VB6


Option Explicit

Public Function RC4(ByVal Expression As String, ByVal Password As String) As String
    On Error Resume Next
    Dim RB(0 To 255) As Integer, X As Long, Y As Long, Z As Long, Key() As Byte, ByteArray() As Byte, Temp As Byte
    If Len(Password) = 0 Then
        Exit Function
    End If
    If Len(Expression) = 0 Then
        Exit Function
    End If
    If Len(Password) > 256 Then
        Key() = StrConv(Left$(Password, 256), vbFromUnicode)
    Else
        Key() = StrConv(Password, vbFromUnicode)
    End If
    For X = 0 To 255
        RB(X) = X
    Next X
    X = 0
    Y = 0
    Z = 0
    For X = 0 To 255
        Y = (Y + RB(X) + Key(X Mod Len(Password))) Mod 256
        Temp = RB(X)
        RB(X) = RB(Y)
        RB(Y) = Temp
    Next X
    X = 0
    Y = 0
    Z = 0
    ByteArray() = StrConv(Expression, vbFromUnicode)
    For X = 0 To Len(Expression)
        Y = (Y + 1) Mod 256
        Z = (Z + RB(Y)) Mod 256
        Temp = RB(Y)
        RB(Y) = RB(Z)
        RB(Z) = Temp
        ByteArray(X) = ByteArray(X) Xor (RB((RB(Y) + RB(Z)) Mod 256))
    Next X
    RC4 = StrConv(ByteArray, vbUnicode)
End Function


Public Function Base64Encoding(StrToEncode As String) As String
    Static EncodeTable(0 To 63) As Byte
    
    Dim K As Long, OutStr() As Byte, StrIn() As Byte, Lng As Long
    
    If EncodeTable(0) = 0 Then
        For K = 0 To 25
            EncodeTable(K) = Asc("A") + K
        Next K
        
        For K = 0 To 25
            EncodeTable(K + 26) = Asc("a") + K
        Next K
        
        For K = 0 To 9
            EncodeTable(K + 52) = Asc("0") + K
        Next K
        
        EncodeTable(62) = Asc("+")
        EncodeTable(63) = Asc("/")
    End If
    
    If StrToEncode = "" Then Exit Function
    
    StrIn = StrConv(StrToEncode, vbFromUnicode)
    If (Len(StrToEncode) Mod 3) = 0 Then
        ReDim OutStr((Len(StrToEncode) \ 3) * 4 - 1)
    Else
        ReDim OutStr(((Len(StrToEncode) \ 3) + 1) * 4 - 1)
    End If
    
    For K = 0 To Len(StrToEncode) \ 3 - 1
        Lng = StrIn(K * 3 + 2) Or (StrIn(K * 3 + 1) * &H100&) Or (StrIn(K * 3) * &H10000)
        
        OutStr(K * 4 + 0) = EncodeTable((Lng And &HFC0000) \ &H40000)
        OutStr(K * 4 + 1) = EncodeTable((Lng And &H3F000) \ &H1000&)
        OutStr(K * 4 + 2) = EncodeTable((Lng And &HFC0&) \ &H40&)
        OutStr(K * 4 + 3) = EncodeTable(Lng And &H3F&)
    Next K
    
    If (Len(StrToEncode) Mod 3) = 1 Then
        Lng = StrIn(UBound(StrIn)) * &H10000
        
        OutStr(UBound(OutStr) - 3) = EncodeTable((Lng And &HFC0000) \ &H40000)
        OutStr(UBound(OutStr) - 2) = EncodeTable((Lng And &H3F000) \ &H1000&)
        OutStr(UBound(OutStr) - 1) = Asc("=")
        OutStr(UBound(OutStr) - 0) = Asc("=")
    ElseIf (Len(StrToEncode) Mod 3) = 2 Then
        Lng = (StrIn(UBound(StrIn)) * &H100&) Or (StrIn(UBound(StrIn) - 1) * &H10000)
        
        OutStr(UBound(OutStr) - 3) = EncodeTable((Lng And &HFC0000) \ &H40000)
        OutStr(UBound(OutStr) - 2) = EncodeTable((Lng And &H3F000) \ &H1000&)
        OutStr(UBound(OutStr) - 1) = EncodeTable((Lng And &HFC0&) \ &H40&)
        OutStr(UBound(OutStr) - 0) = Asc("=")
    End If
    
    Base64Encoding = StrConv(OutStr, vbUnicode)
End Function

Public Function Base64Decoding(StrToDecode As String, Optional CheckInvalidChars As Boolean = True) As String
    Static DecodeTable(0 To 255) As Byte
    
    Dim OutStr() As Byte, StrIn() As Byte
    Dim K As Long, Lng As Long
    
    If DecodeTable(0) = 0 Then
        For K = 0 To 255
            DecodeTable(K) = 255
        Next K
        
        For K = 0 To 25
            DecodeTable(K + 65) = K
        Next K
        
        For K = 26 To 51
            DecodeTable(K + 71) = K
        Next K
        
        For K = 52 To 61
            DecodeTable(K - 4) = K
        Next K
        
        DecodeTable(43) = 62
        DecodeTable(47) = 63
    End If
    
    If StrToDecode = "" Then Exit Function
    
    StrToDecode = Trim(StrToDecode)
    
    If CheckInvalidChars Then
        For K = 0 To 255
            If Not (Chr(K) Like "[A-Za-z0-9+/=]") Then
                StrToDecode = Replace(StrToDecode, Chr(K), "")
            End If
        Next K
    End If
    
    StrIn() = StrConv(StrToDecode, vbFromUnicode)
    ReDim OutStr(0 To ((Len(StrToDecode) \ 4) * 3 - 1))
    
    For K = 0 To Len(StrToDecode) \ 4 - 2
        Lng = DecodeTable(StrIn(K * 4 + 3))
        Lng = Lng Or (DecodeTable(StrIn(K * 4 + 2)) * &H40&)
        Lng = Lng Or (DecodeTable(StrIn(K * 4 + 1)) * &H1000&)
        Lng = Lng Or (DecodeTable(StrIn(K * 4 + 0)) * &H40000)
        
        OutStr(K * 3 + 0) = (Lng And &HFF0000) \ &H10000
        OutStr(K * 3 + 1) = (Lng And &HFF00&) \ &H100&
        OutStr(K * 3 + 2) = Lng And &HFF&
    Next K
    
    Lng = 0
    If DecodeTable(StrIn(K * 4 + 3)) <> 255 Then Lng = DecodeTable(StrIn(K * 4 + 3))
    If DecodeTable(StrIn(K * 4 + 2)) <> 255 Then Lng = Lng Or (DecodeTable(StrIn(K * 4 + 2)) * &H40&)
    If DecodeTable(StrIn(K * 4 + 1)) <> 255 Then Lng = Lng Or (DecodeTable(StrIn(K * 4 + 1)) * &H1000&)
    If DecodeTable(StrIn(K * 4 + 0)) <> 255 Then Lng = Lng Or (DecodeTable(StrIn(K * 4 + 0)) * &H40000)
    
    OutStr(K * 3 + 0) = (Lng And &HFF0000) \ &H10000
    OutStr(K * 3 + 1) = (Lng And &HFF00&) \ &H100&
    OutStr(K * 3 + 2) = Lng And &HFF&
    
    If StrIn(UBound(StrIn) - 1) = 61 Then
        Base64Decoding = Left(StrConv(OutStr, vbUnicode), UBound(OutStr) - 1)
    ElseIf StrIn(UBound(StrIn)) = 61 Then
        Base64Decoding = Left(StrConv(OutStr, vbUnicode), UBound(OutStr) - 0)
    Else
        Base64Decoding = StrConv(OutStr, vbUnicode)
    End If
End Function
