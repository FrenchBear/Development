VERSION 2.00
Begin Form frmNomProj 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Nom de projet"
   ClientHeight    =   1530
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   4065
   Height          =   1935
   KeyPreview      =   -1  'True
   Left            =   1035
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1530
   ScaleWidth      =   4065
   Top             =   1140
   Width           =   4185
   Begin CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   2880
      TabIndex        =   2
      Top             =   120
      Width           =   1095
   End
   Begin CommandButton cmdAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   2880
      TabIndex        =   3
      Top             =   600
      Width           =   1095
   End
   Begin CommandButton btnAide 
      Caption         =   "&Aide"
      Height          =   375
      Left            =   2880
      TabIndex        =   4
      Top             =   1080
      Width           =   1095
   End
   Begin TextBox txtNom 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   2655
   End
   Begin Label lblLégende 
      BackStyle       =   0  'Transparent
      Caption         =   "Saisissez le nom du projet à créer:"
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2295
   End
End
Option Explicit

Sub btnAide_Click ()
  ShowHelp 11
End Sub

Sub cmdAnnuler_Click ()
  txtNom = ""
  frmNomProj.Hide
End Sub

Sub cmdOk_Click ()
  frmNomProj.Hide
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 112 Then ShowHelp (11)
End Sub

