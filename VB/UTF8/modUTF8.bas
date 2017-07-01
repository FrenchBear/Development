Attribute VB_Name = "modUTF8"
' modUTF8 - Unicode <--> UTF8 Conversions
' 2012-09-25    PV  Manual rewrite

Option Explicit


' Complete manual rewrite, since MultiByteToWideChar is sometimes highly creative
' for UTF-8 conversion and returns unicode characters such as chrw(8221) instead of byte chrw(148)
' for Ô conversion for instance
Public Function StringToUtf8ByteArray(ByVal sText As String) As Byte()
    Dim i As Integer, c As Long, l As Integer, p As Integer
    ' 1st pass: calculate length
    For i = 1 To Len(sText)
        c = AscW(Mid(sText, i, 1))
        If c < 0 Then c = c + &H10000
        If c <= &H7F Then
            l = l + 1
        ElseIf c <= &H7FF Then
            l = l + 2
        Else
            l = l + 3
        End If
    Next
    ' 2nd pass, do the conversion
    Dim b() As Byte
    ReDim b(l - 1)
    l = 0
    For i = 1 To Len(sText)
        c = AscW(Mid(sText, i, 1))
        If c < 0 Then c = c + &H10000
        If c <= &H7F Then
            b(l) = CByte(c)
            l = l + 1
        ElseIf c <= &H7FF Then
            b(l) = CByte(&HC0 + c \ &H40)
            b(l + 1) = CByte(&H80 + c Mod &H40)
            l = l + 2
        Else
            b(l) = CByte(&HE0 + (c \ &H40) \ &H40)
            b(l + 1) = CByte(&H80 + (c \ &H40) Mod &H40)
            b(l + 2) = CByte(&H80 + c Mod &H40)
            l = l + 3
        End If
    Next
    
    StringToUtf8ByteArray = b
End Function

' Reverse from StringToUtf8ByteArray, convert a byte array of UTF8 codes into a normal Unicode string
Public Function Utf8ByteArrayToString(BuffIn() As Byte) As String
    Dim s As String
    Dim i As Integer
        
    While i <= UBound(BuffIn)
        If BuffIn(i) < 128 Then
            s = s + ChrW(BuffIn(i))
            i = i + 1
        ElseIf (BuffIn(i) And &HE0) = &HC0 Then
            s = s + ChrW((BuffIn(i) And &H1F) * &H40 + (BuffIn(i + 1) And &H3F))
            i = i + 2
        Else
            s = s + ChrW((BuffIn(i) And &HF) * &H40& * &H40& + (BuffIn(i + 1) And &H3F) * &H40& + (BuffIn(i + 2) And &H3F))
            i = i + 3
        End If
    Wend
    Utf8ByteArrayToString = s
End Function


