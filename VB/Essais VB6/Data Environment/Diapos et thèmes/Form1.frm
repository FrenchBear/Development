VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton NB 
      Caption         =   "btnNb"
      Height          =   495
      Left            =   2520
      TabIndex        =   2
      Top             =   2220
      Width           =   1215
   End
   Begin VB.CommandButton btnThèmes 
      Caption         =   "Thèmes"
      Height          =   495
      Left            =   2520
      TabIndex        =   1
      Top             =   1260
      Width           =   1215
   End
   Begin VB.CommandButton btnDiapos 
      Caption         =   "Diapos"
      Height          =   495
      Left            =   2520
      TabIndex        =   0
      Top             =   420
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnDiapos_Click()
  frmDiapos.Show
End Sub

Private Sub btnThèmes_Click()
  frmThèmes.Show
End Sub

Private Sub NB_Click()
  Diapos.rsDiapos.Open
  Print "Nb diapos: "; Diapos.rsDiapos.RecordCount
  Diapos.rsDiapos.Close
End Sub
