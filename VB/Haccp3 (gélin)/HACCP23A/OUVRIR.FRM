VERSION 2.00
Begin Form frmOuvrir 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Double
   Caption         =   "Ouvrir..."
   ClientHeight    =   2775
   ClientLeft      =   1905
   ClientTop       =   2205
   ClientWidth     =   2985
   Height          =   3180
   KeyPreview      =   -1  'True
   Left            =   1845
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2775
   ScaleWidth      =   2985
   Top             =   1860
   Width           =   3105
   Begin CommandButton btnAide 
      Caption         =   "&Aide"
      Height          =   375
      Left            =   1800
      TabIndex        =   3
      Top             =   1080
      Width           =   1095
   End
   Begin CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   1800
      TabIndex        =   2
      Top             =   600
      Width           =   1095
   End
   Begin CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   1800
      TabIndex        =   1
      Top             =   120
      Width           =   1095
   End
   Begin ListBox lstProjets 
      Height          =   2565
      Left            =   120
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   1575
   End
   Begin Label mode 
      Caption         =   "Mode"
      Height          =   255
      Left            =   1800
      TabIndex        =   5
      Top             =   2040
      Visible         =   0   'False
      Width           =   1095
   End
   Begin Label lblProjet 
      Caption         =   "NomProj"
      Height          =   255
      Left            =   1800
      TabIndex        =   4
      Top             =   1680
      Visible         =   0   'False
      Width           =   1095
   End
End
Option Explicit

' Champ mode:
' 0: ouverture
' 1: suppression

Sub btnAide_Click ()
  ShowHelp 12 + Val(mode)
End Sub

Sub btnAnnuler_Click ()
  lblProjet = ""
  frmOuvrir.Hide
End Sub

Sub btnOk_click ()
  lblProjet = lstprojets.List(lstprojets.ListIndex)
  frmOuvrir.Hide
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 112 Then ShowHelp 12 + Val(mode)' F1
End Sub

Sub lstProjets_DblClick ()
  btnOk_click
End Sub

Sub mode_Click ()
  Select Case mode
    Case "0": caption = "Ouvrir un projet"
    Case "1": caption = "Supprimer un projet"
  End Select
End Sub

