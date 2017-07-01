VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1380
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Efface un fichier et le place dans la corbeille
' 11/11/97 PV
' D'après la KB VB Internet

Option Explicit

Private Type SHFILEOPSTRUCT
    hwnd As Long
    wFunc As Long
    pFrom As String
    pTo As String
    fFlags As Integer
    fAnyOperationsAborted As Boolean
    hNameMappings As Long
    lpszProgressTitle As String
End Type

Private Declare Function SHFileOperation Lib "shell32.dll" Alias "SHFileOperationA" (lpFileOp As SHFILEOPSTRUCT) As Long
Private Declare Function GetTempFileName Lib "kernel32" Alias "GetTempFileNameA" (ByVal lpszPath As String, ByVal lpPrefixString As String, ByVal wUnique As Long, ByVal lpTempFileName As String) As Long

Private Const FO_DELETE = &H3
Private Const FOF_ALLOWUNDO = &H40

Sub Command1_Click()
  Dim FileOperation As SHFILEOPSTRUCT
  Dim lReturn As Long
  Dim sTempFilename As String * 100
  Dim sSendMeToTheBin As String
  lReturn = GetTempFileName("c:\", "VB_", 0, sTempFilename)
  sSendMeToTheBin = Left(sTempFilename, InStr(sTempFilename, Chr$(0)))
  With FileOperation
     .wFunc = FO_DELETE
     .pFrom = sSendMeToTheBin
     .fFlags = FOF_ALLOWUNDO
  End With
  lReturn = SHFileOperation(FileOperation)
  MsgBox "View your Recycle Bin for files beginning with VB_"
End Sub

