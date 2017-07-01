VERSION 5.00
Begin VB.Form frmIdentification 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Identification"
   ClientHeight    =   1905
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3045
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1905
   ScaleWidth      =   3045
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "&Connexion"
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   1320
      Width           =   1215
   End
   Begin VB.TextBox txtPrénom 
      Height          =   285
      Left            =   960
      TabIndex        =   3
      Top             =   600
      Width           =   1215
   End
   Begin VB.TextBox txtNom 
      Height          =   285
      Left            =   960
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Prénom :"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   600
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Nom :"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   615
   End
End
Attribute VB_Name = "frmIdentification"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  Unload Me
  frmApplication.Show
End Sub

