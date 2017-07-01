VERSION 2.00
Begin Form frmOptions 
   Caption         =   "Options du projet"
   ClientHeight    =   2025
   ClientLeft      =   1935
   ClientTop       =   3405
   ClientWidth     =   5280
   Height          =   2430
   Left            =   1875
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2025
   ScaleWidth      =   5280
   Top             =   3060
   Width           =   5400
   Begin TextBox txtRépertoire 
      Height          =   285
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   3615
   End
   Begin CommandButton cmdAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   4080
      TabIndex        =   1
      Top             =   720
      Width           =   1095
   End
   Begin CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   4080
      TabIndex        =   0
      Top             =   240
      Width           =   1095
   End
   Begin ListBox lstFormat 
      Height          =   810
      Left            =   120
      TabIndex        =   3
      Top             =   360
      Width           =   3615
   End
   Begin Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&Répertoire par défaut des fichiers du projet :"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   1320
      Width           =   3795
   End
   Begin Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Format du document externe :"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   2550
   End
End
Option Explicit

Sub cmdAnnuler_Click ()
  lstFormat.ListIndex = -1
  frmOptions.Hide
End Sub

Sub cmdOk_Click ()
  frmOptions.Hide
End Sub

Sub Form_Load ()
  lstFormat.AddItem "Word 2.0 (DDE)"
  lstFormat.AddItem "Word 6.0 (DDE)"
  lstFormat.AddItem "Texte brut"
  lstFormat.AddItem "Texte+styles"
End Sub

Sub lstFormat_DblClick ()
  cmdOk_Click
End Sub

Sub txtRépertoire_KeyPress (keyAscii As Integer)
  If InStr("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.-_:\", UCase(Chr(keyAscii))) = 0 And keyAscii <> 8 Then
    keyAscii = 0
    Beep
  End If
End Sub

