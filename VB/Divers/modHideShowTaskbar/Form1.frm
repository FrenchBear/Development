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
   Begin VB.CommandButton btnShow 
      Caption         =   "Show"
      Height          =   495
      Left            =   1740
      TabIndex        =   1
      Top             =   1380
      Width           =   1215
   End
   Begin VB.CommandButton btnHide 
      Caption         =   "Hide"
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   720
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' http://www.eu.microsoft.com/intlkb/france/Articles/Q17/6/Q17694.HTM
' 12/12/1998 PV

Option Explicit

Private Sub btnHide_Click()
  HideTaskbar
End Sub

Private Sub btnShow_Click()
  UnhideTaskbar
End Sub
