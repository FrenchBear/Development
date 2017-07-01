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
   Begin VB.CheckBox chkLocked 
      Caption         =   "Locked"
      Height          =   195
      Left            =   2820
      TabIndex        =   1
      Top             =   360
      Width           =   1215
   End
   Begin Projet1.BDCheck BDCheck1 
      Height          =   255
      Left            =   1380
      TabIndex        =   0
      Top             =   600
      Width           =   195
      _ExtentX        =   344
      _ExtentY        =   423
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub BDCheck1_Click()
  Print "clic "; BDCheck1.Text
End Sub

Private Sub chkLocked_Click()
  BDCheck1.Locked = (chkLocked = vbChecked)
End Sub
