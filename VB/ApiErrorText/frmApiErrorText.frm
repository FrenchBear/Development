VERSION 5.00
Begin VB.Form frmApiErrorText 
   Caption         =   "ApiErrorText"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtErrNo 
      Height          =   315
      Left            =   1020
      TabIndex        =   1
      Text            =   "87"
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label lblMsg 
      Height          =   915
      Left            =   120
      TabIndex        =   2
      Top             =   540
      Width           =   4455
   End
   Begin VB.Label Label1 
      Caption         =   "Erreur n°:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   795
   End
End
Attribute VB_Name = "frmApiErrorText"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Affiche le texte d'une erreur d'API
' 21/05/03 PV

Option Explicit

Private Sub Form_Load()
  AfficheErr
End Sub

Private Sub txtErrNo_Change()
  AfficheErr
End Sub

Sub AfficheErr()
  lblMsg.Caption = Val(txtErrNo) & ": " & ApiErrorText(Val(txtErrNo))
End Sub
