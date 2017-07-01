VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmChangeMdP 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Changement de mot de passe"
   ClientHeight    =   1695
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7485
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmChangeMdP.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   113
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   499
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtMdP2 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   2640
      PasswordChar    =   "*"
      TabIndex        =   5
      Tag             =   "Entrez le nouveau mot de passe, deuxième saisie."
      Top             =   960
      Width           =   3135
   End
   Begin VB.TextBox txtMdP1 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   2640
      PasswordChar    =   "*"
      TabIndex        =   3
      Tag             =   "Entrez le nouveau mot de passe, première saisie."
      Top             =   600
      Width           =   3135
   End
   Begin VB.TextBox txtNomUtilisateur 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2640
      Locked          =   -1  'True
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   120
      Width           =   3135
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   6060
      TabIndex        =   6
      Tag             =   "Cliquez sur ce bouton pour valider le changement de mot de passe."
      Top             =   120
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   6060
      TabIndex        =   7
      Tag             =   "Cliquez sur ce bouton pour fermet cette fenêtre sans changer le mot de passe."
      Top             =   525
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   6060
      TabIndex        =   8
      Top             =   960
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   9
      Top             =   1380
      Width           =   7485
      _ExtentX        =   13203
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblMdP2 
      AutoSize        =   -1  'True
      Caption         =   "&Confirmation :"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   1020
      Width           =   1335
   End
   Begin VB.Label lblMdP1 
      AutoSize        =   -1  'True
      Caption         =   "&Nouveau mot de passe :"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   660
      Width           =   2325
   End
   Begin VB.Label lblUtilisateur 
      AutoSize        =   -1  'True
      Caption         =   "&Utilisateur :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   1095
   End
End
Attribute VB_Name = "frmChangeMdP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Boîte de dialogue de saisie de nouveau mot de passe"
' frmChangeMdP
' Boîte de dialogue de saisie de nouveau mot de passe
' 17/11/1997 PV
' 18/11/1997 PV Annulation ou fermeture: retour ANNULÉ
' 21/07/1998 PV Fin du contrôle du MdP actuel, fait dans frmLogin
' 27/01/1999 NC Internationalisation


Option Explicit

Private sPasswd As String

Private Sub btnAide_Click()
  Aide "frmchangemdp"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnOk_Click()
  If txtMdP1 = "" Then
    MsgBox2i "CR276"
    'MsgBox "Le mot de passe ne peut pas être vide." & vbCrLf & vbCrLf & _
      "Saisissez une première fois votre mot de passe dans le champ Nouveau mot de passe, puis une deuxième fois dans le champ Confirmation.", vbExclamation, sNomApp
    txtMdP1.SetFocus
    Exit Sub
  End If
  
  If txtMdP2 = "" Then
    MsgBox2i "CR277"
    'MsgBox "Vous n'avez pas saisi la confirmation." & vbCrLf & vbCrLf & _
      "Saisissez une deuxième fois votre mot de passe.", vbExclamation, sNomApp
    txtMdP2.SetFocus
    Exit Sub
  End If
  
  If txtMdP1 <> txtMdP2 Then
    MsgBox2i "CR278"
    'MsgBox "Le mot de passe et la confirmation sont différents." & vbCrLf & vbCrLf & _
      "Saisissez une première fois votre mot de passe dans le champ Nouveau mot de passe, puis une deuxième fois dans le champ Confirmation.", vbExclamation, sNomApp
    txtMdP1 = ""
    txtMdP2 = ""
    txtMdP1.SetFocus
    Exit Sub
  End If
  
  sPasswd = txtMdP1
  Unload Me
End Sub

Public Function Change(sNom As String) As String
  txtNomUtilisateur = sNom
  sPasswd = "ANNULÉ"
  Show vbModal
  Change = sPasswd
End Function



Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub


Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Then AutoSelect ActiveControl
End Sub

Private Sub Form_Load()
  
  Internationalisation

End Sub

Private Sub txtNomUtilisateur_GotFocus(): GotFocus: End Sub
Private Sub txtMdP1_GotFocus(): GotFocus: End Sub
Private Sub txtMdP2_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "CMCaption"
  
  SetLib btnOk, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblUtilisateur, "Caption", "CMlblUtilisateur"
  SetLib lblMdP1, "Caption", "CMlblMdP1"
  SetLib txtMdP1, "Tag", "CMtxtMdP1.tag"
  SetLib lblMdP2, "Caption", "CMlblMdP2"
  SetLib txtMdP2, "Tag", "CMtxtMdP2.tag"
End Sub

