VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Dim t As Single, i As Long, s As String
    t = Timer
    For i = 1 To 100000
        's = sUnescapeString1("This is a string that does not contain any escape character")
        's = sUnescapeString2("This is a string\bthat contains three escape character\r\n")
        s = cleanNull("This is a string to clean")
    Next
    MsgBox "T=" & Timer - t
End Sub

Function cleanNull(ByVal myString As String) As String
    'cleanNull = Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(Replace(myString, "<NULL>", ""), CStr(CDbl(-3.40282204661662E+38)), ""), "1.1.1900 00:00:00", ""), "01.01.1900 00:00:00", ""), "1-1-1900 00:00:00", ""), "01-01-1900 00:00:00", ""), "01/01/1900 00:00:00", ""), "1/1/1900 00:00:00", ""), "1-1-1900", ""), "1.1.1900", ""), "01-01-1900", ""), "01.01.1900", ""), "01/01/1900", ""), "1/1/1900", ""), "-32767", ""), "-2147483648", "")
    'If InStr(1, "|<NULL>|-3.40282204661662E+38|-3,40282204661662E+38|1.1.1900 00:00:00|01.01.1900 00:00:00|1-1-1900 00:00:00|01-01-1900 00:00:00|01/01/1900 00:00:00|1/1/1900 00:00:00|1-1-1900|1.1.1900|01-01-1900|01.01.1900|01/01/1900|1/1/1900|-32767|-2147483648", "|" & myString & "|", vbBinaryCompare) > 0 Then
    '    cleanNull = vbNullString
    'Else
    '    cleanNull = myString
    'End If
    If myString = "<NULL>" Then
    ElseIf myString = "-3.40282204661662E+38" Then
    ElseIf myString = "-3,40282204661662E+38" Then
    ElseIf myString = "1.1.1900 00:00:00" Then
    ElseIf myString = "01.01.1900 00:00:00" Then
    ElseIf myString = "1-1-1900 00:00:00" Then
    ElseIf myString = "01-01-1900 00:00:00" Then
    ElseIf myString = "01/01/1900 00:00:00" Then
    ElseIf myString = "1/1/1900 00:00:00" Then
    ElseIf myString = "1-1-1900" Then
    ElseIf myString = "1.1.1900" Then
    ElseIf myString = "01-01-1900" Then
    ElseIf myString = "01.01.1900" Then
    ElseIf myString = "01/01/1900" Then
    ElseIf myString = "1/1/1900" Then
    ElseIf myString = "-32767" Then
    ElseIf myString = "-2147483648" Then
    Else
        cleanNull = myString
    End If
End Function


Function sUnescapeString1(ByVal s As String) As String
    sUnescapeString1 = Replace(Replace(Replace(Replace(Replace(Replace(s, "\t", vbTab), "\b", Chr(7)), "\r", vbCr), "\n", vbLf), "{tab}", vbTab), "{nul}", Chr(0))
End Function

Function sUnescapeString2(ByVal s As String) As String
    If InStr(s, "\t") <> 0 Then s = Replace(s, "\t", vbTab)
    If InStr(s, "\b") <> 0 Then s = Replace(s, "\b", Chr(7))
    If InStr(s, "\r") <> 0 Then s = Replace(s, "\r", vbCr)
    If InStr(s, "\n") <> 0 Then s = Replace(s, "\n", vbLf)
    If InStr(s, "{tab}") <> 0 Then s = Replace(s, "{tab}", vbTab)
    If InStr(s, "{nul}") <> 0 Then s = Replace(s, "{nul}", Chr(0))
    sUnescapeString2 = s
End Function

