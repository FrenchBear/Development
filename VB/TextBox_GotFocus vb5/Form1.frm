VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4395
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6465
   LinkTopic       =   "Form1"
   ScaleHeight     =   4395
   ScaleWidth      =   6465
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   2280
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   2280
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   540
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub RécupFocus(c As TextBox)
  If GetKeyState(VK_TAB) < 0 Then
    c.SelStart = 0
    c.SelLength = Len(c.Text)
  Else
    c.SelLength = 0
  End If
End Sub

Private Sub Text1_GotFocus()
  RécupFocus Text1
End Sub

Private Sub Text2_GotFocus()
  RécupFocus Text2
End Sub
