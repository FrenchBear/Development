VERSION 5.00
Begin VB.Form frmCalculCl�Privil�gi�e 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Calcul de cl� privil�gi�e"
   ClientHeight    =   1830
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6150
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmCalculCl�Privil�gi�e.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1830
   ScaleWidth      =   6150
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Fermer"
      Height          =   330
      Left            =   4740
      TabIndex        =   6
      Top             =   465
      Width           =   1350
   End
   Begin VB.TextBox txtCl� 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1260
      Locked          =   -1  'True
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   1440
      Width           =   1335
   End
   Begin VB.TextBox txtR�f�rence 
      Height          =   315
      Left            =   1260
      TabIndex        =   2
      Top             =   1080
      Width           =   1335
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   4740
      TabIndex        =   5
      Top             =   60
      Width           =   1350
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Cl� :"
      Height          =   210
      Left            =   120
      TabIndex        =   3
      Top             =   1500
      Width           =   435
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "R�f�rence :"
      Height          =   210
      Left            =   120
      TabIndex        =   1
      Top             =   1140
      Width           =   1080
   End
   Begin VB.Label Label1 
      Caption         =   $"frmCalculCl�Privil�gi�e.frx":0442
      Height          =   915
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   4455
   End
End
Attribute VB_Name = "frmCalculCl�Privil�gi�e"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCalculCl�Privil�gi�e
' Calcul de cl� d'op�ration privil�gi�e
' 15/02/01 PV
' 16/05/05 PV   Calcul de la cl� d�port� dans iCalculCl�OpPrivil�gi�e

Option Explicit


Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnOK_Click()
  txtCl� = iCalculCl�OpPrivil�gi�e(txtR�f�rence.Text)
End Sub

