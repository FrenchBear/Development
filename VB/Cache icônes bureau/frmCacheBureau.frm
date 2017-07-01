VERSION 5.00
Begin VB.Form frmCacheBureau 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cache les icônes du bureau"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdAfficheBureau 
      Caption         =   "Affiche"
      Height          =   495
      Left            =   1740
      TabIndex        =   1
      Top             =   1740
      Width           =   1215
   End
   Begin VB.CommandButton cmdCacheBureau 
      Caption         =   "Cache"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   1020
      Width           =   1215
   End
End
Attribute VB_Name = "frmCacheBureau"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const SW_HIDE = 0
Const SW_RESTORE = 9
Private Declare Function FindWindow Lib "User32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function ShowWindow Lib "User32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Private Declare Function GetLastError Lib "kernel32" () As Long

Private Sub CmdCacheBureau_Click()
  Dim hwnd As Long, RetVal As Long
  ' Recherche de la fen&ecirc;tre correspondant au "Program Manager"
  hwnd = FindWindow(vbNullString, "Program Manager")
  If hwnd > 0 Then
    ' On masque la fen&ecirc;tre
    RetVal = ShowWindow(hwnd, SW_HIDE)
  Else
    Debug.Print "Fen&ecirc;tre non trouv&eacute;e. Derni&egrave;re erreur survenue : " & GetLastError()
  End If
End Sub

Private Sub CmdAfficheBureau_Click()
  Dim hwnd As Long, RetVal As Long
  ' On recherche la fen&ecirc;tre du Program Manager
  hwnd = FindWindow(vbNullString, "Program Manager")
  If hwnd <> 0 Then
    ' On affiche la fen&ecirc;tre du Program Manager
    RetVal = ShowWindow(hwnd, SW_RESTORE)
  Else
    Debug.Print "Fen&ecirc;tre non trouv&eacute;e. Derni&egrave;re erreur survenue : " & GetLastError()
  End If
End Sub


