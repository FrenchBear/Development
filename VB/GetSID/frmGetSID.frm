VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3060
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3060
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1680
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
Private Declare Function ConvertSidToStringSid Lib "ADVAPI32.dll" Alias "ConvertSidToStringSidA" (ByVal Sid As String, ByRef lpStringSid As Long) As Long
Private Declare Function IsValidSid Lib "ADVAPI32.dll" (ByRef pSid As Any) As Long
Private Declare Function LookupAccountName Lib "ADVAPI32.dll" Alias "LookupAccountNameA" (ByVal lpSystemName As String, ByVal lpAccountName As String, ByVal Sid As String, ByRef cbSid As Long, ByVal ReferencedDomainName As String, ByRef cbReferencedDomainName As Long, ByRef peUse As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function GlobalFree Lib "kernel32.dll" (ByVal hMem As Long) As Long
Private Declare Function LocalAlloc Lib "kernel32.dll" (ByVal wFlags As Long, ByVal wBytes As Long) As Long
Private Declare Function LocalFree Lib "kernel32.dll" (ByVal hMem As Long) As Long

Private Sub Command1_Click()
    MsgBox GetSid(Environ("USERDOMAIN") & "\" & Environ("USERNAME"))
End Sub

Private Function GetSid(accountName As String) As String
    Dim userName As String
    Dim UserNameSize As Long
    Dim Sid As String
    Dim SidSize As Long
    Dim Domain As String
    Dim DomainSize As Long
    Dim snu As Long
    Dim sReturn As String
    userName = String$(255, 0&)
    Sid = String$(255, 0&)
    Domain = String$(255, 0&)
    sReturn = String$(255, 0&)
    UserNameSize = 255
    SidSize = 255
    DomainSize = 255
    Call LookupAccountName(vbNullString, accountName, Sid, SidSize, Domain, DomainSize, snu)
    If IsValidSid(ByVal Sid) = 0& Then Exit Function
    Call ConvertSidToStringSid(Sid, snu)
    Call CopyMemory(ByVal sReturn, ByVal snu, 255)
    sReturn = Left$(sReturn, InStr(1, sReturn, vbNullChar, vbBinaryCompare) - 1)
    Call GlobalFree(snu)
    GetSid = sReturn
End Function

