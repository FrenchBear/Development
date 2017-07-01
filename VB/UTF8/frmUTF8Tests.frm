VERSION 5.00
Begin VB.Form frmUTF8Tests 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmUTF8Tests"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    StringUTF8ArrayTests
    StringToUtf8Tests

    ' If Units Tests run successfully, app should terminate silently
    ' otherwise it'll break on error or on stop statement
    End
End Sub


Sub StringUTF8ArrayTests()
    Dim sText As String
    Dim BuffOut() As Byte
    
    sText = ChrW(45) & ChrW(431) & ChrW(51966)
    BuffOut = StringToUtf8ByteArray(sText)
    
    If UBound(BuffOut) <> 5 Then Stop
    If BuffOut(0) <> 45 Then Stop       ' 1st char 45 --> 1 byte
    If BuffOut(1) <> 198 Then Stop      ' 2nd char 431 --> 1st byte
    If BuffOut(2) <> 175 Then Stop      ' 2nd char 431 --> 2nd byte
    If BuffOut(3) <> 236 Then Stop      ' 3rd char 51966 --> 1st byte
    If BuffOut(4) <> 171 Then Stop      ' 3rd char 51966 --> 2nd byte
    If BuffOut(5) <> 190 Then Stop      ' 3rd char 51966 --> 3rd byte
    
    Dim s2 As String
    s2 = Utf8ByteArrayToString(BuffOut)
    If s2 <> sText Then Stop
End Sub



Sub StringToUtf8Tests()
    Dim i As Long, b() As Byte
    For i = 0 To &H7F
        b = StringToUtf8ByteArray(ChrW(i))
        If UBound(b) <> 0 Then Stop
        If b(0) <> i Then Stop
        If Utf8ByteArrayToString(b) <> ChrW(i) Then Stop
    Next
    For i = &H80 To &H7FF
        b = StringToUtf8ByteArray(ChrW(i))
        If UBound(b) <> 1 Then Stop
        If b(0) <> 192 + i \ 64 Then Stop
        If b(1) <> 128 + i Mod 64 Then Stop
        If Utf8ByteArrayToString(b) <> ChrW(i) Then Stop
    Next
    For i = &H800 To &HFFFF&
        b = StringToUtf8ByteArray(ChrW(i))
        If UBound(b) <> 2 Then Stop
        If b(0) <> 224 + (i \ 64) \ 64 Then Stop
        If b(1) <> 128 + (i \ 64) Mod 64 Then Stop
        If b(2) <> 128 + i Mod 64 Then Stop
        If Utf8ByteArrayToString(b) <> ChrW(i) Then Stop
    Next
End Sub

