Attribute VB_Name = "Module1"
Option Explicit

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)

Public Function StringToByteArray(ByVal strInput As String) As Byte()
    Dim bytBuffer() As Byte
    Dim lLenB As Long
    lLenB = LenB(strInput)
    ReDim bytBuffer(lLenB - 1)
    'Copy characters from string to byte array
    CopyMemory bytBuffer(0), ByVal StrPtr(strInput), lLenB
    StringToByteArray = bytBuffer
End Function

Public Function ByteArrayToString(b() As Byte) As String
    Dim iUnicode As Long, i As Long, j As Long
    i = UBound(b)
    If i < 0 Then Exit Function
    
    'Set up a buffer to recieve the string
    ByteArrayToString = String$((i + 1) / 2, 0)
    'Copy to string
    CopyMemory ByVal StrPtr(ByteArrayToString), b(0), i
End Function




