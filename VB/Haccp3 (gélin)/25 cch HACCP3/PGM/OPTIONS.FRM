VERSION 2.00
Begin Form frmOptions 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Options du projet"
   ClientHeight    =   2265
   ClientLeft      =   1935
   ClientTop       =   3405
   ClientWidth     =   5280
   Height          =   2670
   KeyPreview      =   -1  'True
   Left            =   1875
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2265
   ScaleWidth      =   5280
   Top             =   3060
   Width           =   5400
   Begin CheckBox chkConfirme 
      BackColor       =   &H00C0C0C0&
      Caption         =   "&Confirmation de l'exécution des extensions"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   1920
      Width           =   3975
   End
   Begin CommandButton btnAide 
      Caption         =   "&Aide"
      Height          =   375
      Left            =   4080
      TabIndex        =   6
      Top             =   1080
      Width           =   1095
   End
   Begin TextBox txtRépertoire 
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Top             =   1560
      Width           =   3615
   End
   Begin CommandButton cmdAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   4080
      TabIndex        =   5
      Top             =   600
      Width           =   1095
   End
   Begin CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   4080
      TabIndex        =   4
      Top             =   120
      Width           =   1095
   End
   Begin ListBox lstFormat 
      Height          =   1005
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   3615
   End
   Begin Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "&Répertoire par défaut des fichiers du projet :"
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1320
      Width           =   3795
   End
   Begin Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "&Format du document externe :"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   2550
   End
End
Option Explicit

Sub btnAide_Click ()
  ShowHelp 21
End Sub

Sub cmdAnnuler_Click ()
  lstFormat.ListIndex = -1
  frmOptions.Hide
End Sub

Sub cmdOk_Click ()
  frmOptions.Hide
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 112 Then ShowHelp 21  ' F1
End Sub

Sub Form_Load ()
  lstFormat.AddItem "Word 2.0 (DDE)"
  lstFormat.AddItem "Word 6.0 (DDE)"
  lstFormat.AddItem "Texte brut"
  lstFormat.AddItem "Texte+styles"
  lstFormat.AddItem "Word 6.0 (Ole Automation)"
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

