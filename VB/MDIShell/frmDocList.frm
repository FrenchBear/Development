VERSION 5.00
Begin VB.Form frmDocList 
   Caption         =   "Nouveau document..."
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   495
      Left            =   3240
      TabIndex        =   2
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   495
      Left            =   3240
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox SelectedProgId 
      Height          =   315
      Left            =   180
      TabIndex        =   0
      Text            =   "ControleC1.C1"
      Top             =   300
      Width           =   2235
   End
End
Attribute VB_Name = "frmDocList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnAnnuler_Click()
  SelectedProgId = ""
  Me.Hide
End Sub

Private Sub btnOk_Click()
  Me.Hide
End Sub
