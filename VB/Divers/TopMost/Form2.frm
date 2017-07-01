VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form2"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function SetWindowWord Lib "user32" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal wNewWord As Long) As Long
Const GWW_HWNDPARENT = (-8)

Dim OriginalParenthWnd As Long

Sub Form_Load()
  ' Set parent for the toolbar to display on top of:
  OriginalParenthWnd = SetWindowWord(Me.hwnd, GWW_HWNDPARENT, Form1.hwnd)

  Me.Width = Form1.Width \ 3      ' Scale child form
  Me.Height = Form1.Height \ 3
End Sub


Private Sub Form_Unload(Cancel As Integer)
  Dim ret As Long

  ' Return the original parent handle to avoid a GP Fault
  ret = SetWindowWord(Me.hwnd, GWW_HWNDPARENT, OriginalParenthWnd)
End Sub
