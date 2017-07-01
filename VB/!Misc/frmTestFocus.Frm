VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8415
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6645
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   8415
   ScaleWidth      =   6645
   Begin VB.CommandButton Command1 
      Caption         =   "&Command1"
      Height          =   495
      Left            =   3600
      TabIndex        =   2
      Top             =   3180
      Width           =   1215
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   3600
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   2220
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   3600
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   1500
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  Print "Command1_Click"
End Sub

Private Sub Text1_GotFocus()
  Print "Text1_GotFocus"
End Sub

Private Sub Text1_LostFocus()
  Print "Text1_LostFocus"
End Sub

Private Sub Text2_LostFocus()
  Print "Text2_LostFocus"
  GotFocus
End Sub

Private Sub Text2_GotFocus()
  Print "Text2_GotFocus"
  GotFocus
End Sub

Private Sub Text1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Print "Text1_MouseDown"
End Sub

Private Sub Text1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Print "Text1_MouseUp"
End Sub

Private Sub Text2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Print "Text2_MouseDown"
End Sub

Private Sub Text2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Print "Text2_MouseUp"
End Sub


Sub GotFocus()
  On Error GoTo FinGotFocus
  ActiveControl.SelStart = 0
  ActiveControl.SelLength = 99
FinGotFocus:
End Sub
