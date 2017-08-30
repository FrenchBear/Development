Attribute VB_Name = "modDicratics"
Option Explicit

' Get CodePage used by VB6
Public Declare Function GetACP Lib "kernel32" () As Long

Function RemoveDicratics(ByVal s As String) As String
    ' Only support 1252 Latin 1 code page (US & Western Europe)
    ' Do not attempt any conversion otherwise (ex: CP 1250 Eastern Europe), since mapping s1/s2 is incorrect in this case
    If GetACP = 1252 Then
        Dim s1 As String, s2 As String, i As Integer
        s1 = "ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïñòóôõöùúûüýÿ"
        s2 = "AAAAAACEEEEIIIINOOOOOUUUUYaaaaaaceeeeiiiinooooouuuuyy"
        For i = 1 To Len(s1)
            If InStr(1, s, Mid(s1, i, 1), vbBinaryCompare) > 0 Then
                s = Replace(s, Mid(s1, i, 1), Mid(s2, i, 1), Compare:=vbBinaryCompare)
            End If
        Next
    End If
    RemoveDicratics = s
End Function

