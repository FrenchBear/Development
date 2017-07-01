VERSION 5.00
Begin VB.Form frmTestVB6 
   Caption         =   "Test installation VB6"
   ClientHeight    =   4920
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6450
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   Picture         =   "frmTestVB6.frx":0000
   ScaleHeight     =   4920
   ScaleWidth      =   6450
   StartUpPosition =   3  'Windows Default
   Begin VB.Label lblStatus 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Le Visual Basic 6 SP5 est bien installé."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   240
      Left            =   1740
      TabIndex        =   0
      Top             =   4380
      Width           =   4575
   End
End
Attribute VB_Name = "frmTestVB6"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Const sNomApp As String = "Test VB6"

Dim sWinDir As String
Dim sSysDir As String

Private Sub Form_Load()
  Dim sWinDir100 As String * 100, iLen As Integer
  iLen = GetWindowsDirectory(sWinDir100, 100)
  sWinDir = Left(sWinDir100, iLen)
  iLen = GetSystemDirectory(sWinDir100, 100)
  sSysDir = Left(sWinDir100, iLen)

  Show
  
  Dim VerInfo As VS_FIXEDFILEINFO
  If GetVersion(sSysDir & "\msvbvm60.dll", VerInfo) Then
    If VerInfo.dwFileVersionMSh = 6 And VerInfo.dwFileVersionMSl = 0 Then
      If VerInfo.dwFileVersionLSh < 96 Or (VerInfo.dwFileVersionLSh = 96 And VerInfo.dwFileVersionLSl < 90) Then
        lblStatus.Caption = "Version des fichiers système périmée (" & VerInfo.dwFileVersionMSh & "." & VerInfo.dwFileVersionMSl & "." & VerInfo.dwFileVersionLSh & "." & VerInfo.dwFileVersionLSl & ")."
        MsgBox lblStatus.Caption & vbCrLf & "Installez la dernière version des composants VB6.", vbCritical, sNomApp
      End If
    End If
  End If

End Sub
