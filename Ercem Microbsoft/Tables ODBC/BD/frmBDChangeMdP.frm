VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmBDChangeMdP 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Changement de mot de passe"
   ClientHeight    =   1935
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
   Icon            =   "frmBDChangeMdP.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1935
   ScaleWidth      =   7485
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtMdP2 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   2520
      PasswordChar    =   "*"
      TabIndex        =   5
      Tag             =   "Entrez le nouveau mot de passe, deuxième saisie."
      Top             =   960
      Width           =   3135
   End
   Begin VB.TextBox txtMdP1 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   2520
      PasswordChar    =   "*"
      TabIndex        =   3
      Tag             =   "Entrez le nouveau mot de passe, première saisie."
      Top             =   600
      Width           =   3135
   End
   Begin VB.TextBox txtNomUtilisateur 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2520
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
      Left            =   6180
      TabIndex        =   6
      Tag             =   "Cliquez sur ce bouton pour valider le changement de mot de passe."
      Top             =   120
      Width           =   1200
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   6180
      TabIndex        =   7
      Tag             =   "Cliquez sur ce bouton pour fermet cette fenêtre sans changer le mot de passe."
      Top             =   525
      Width           =   1200
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   8
      Top             =   1620
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
   Begin VB.Label Label2 
      Caption         =   "Saisissez votre nouveau mot de passe dans les deux champs ci-dessus."
      Height          =   210
      Left            =   60
      TabIndex        =   9
      Top             =   1380
      Width           =   7380
   End
   Begin VB.Label lblMdP2 
      AutoSize        =   -1  'True
      Caption         =   "&Confirmation :"
      Height          =   210
      Left            =   60
      TabIndex        =   4
      Top             =   960
      Width           =   1335
   End
   Begin VB.Label lblMdP1 
      AutoSize        =   -1  'True
      Caption         =   "&Nouveau mot de passe :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   600
      Width           =   2325
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Utilisateur :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "frmBDChangeMdP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Boîte de dialogue de saisie de nouveau mot de passe"
' frmBDChangeMdP
' Boîte de dialogue de saisie de nouveau mot de passe
' 16/07/1998 PV
' 24/07/1998 PV Simplification, le contrôle du mot de passe actuel est fait dans frmLogin

Option Explicit

Private sPasswd As String   ' Nouveau mot de passe

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnOk_Click()
  If txtMdP1 = "" Then
    MsgBox "Le mot de passe ne peut pas être vide." & vbCrLf & vbCrLf & _
      "Saisissez une première fois votre mot de passe dans le champ Nouveau mot de passe, puis une deuxième fois dans le champ Confirmation.", vbExclamation, App.Title
    txtMdP1.SetFocus
    Exit Sub
  End If
  
  If txtMdP2 = "" Then
    MsgBox "Vous n'avez pas saisi la confirmation." & vbCrLf & vbCrLf & _
      "Saisissez une deuxième fois votre mot de passe.", vbExclamation, App.Title
    txtMdP2.SetFocus
    Exit Sub
  End If
  
  If txtMdP1 <> txtMdP2 Then
    MsgBox "Le mot de passe et la confirmation sont différents." & vbCrLf & vbCrLf & _
      "Saisissez une première fois votre mot de passe dans le champ Nouveau mot de passe, puis une deuxième fois dans le champ Confirmation.", vbExclamation, App.Title
    txtMdP1 = ""
    txtMdP2 = ""
    txtMdP1.SetFocus
    Exit Sub
  End If
  
  sPasswd = txtMdP1
  Unload Me
End Sub

Public Function Change(ByVal sNom As String) As String
  txtNomUtilisateur = sNom
  sPasswd = "ANNULÉ"
  Show vbModal
  Change = sPasswd
End Function


Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Then AutoSelect ActiveControl
End Sub

Private Sub Form_Load()
  Caption = "Changement de mot de passe [" & cSystèmeCA & "]"
End Sub

Private Sub txtNomUtilisateur_GotFocus(): GotFocus: End Sub
Private Sub txtMdP1_GotFocus(): GotFocus: End Sub
Private Sub txtMdP2_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub

