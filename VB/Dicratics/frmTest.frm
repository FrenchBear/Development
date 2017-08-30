VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2340
   ClientLeft      =   108
   ClientTop       =   432
   ClientWidth     =   3624
   LinkTopic       =   "Form1"
   ScaleHeight     =   2340
   ScaleWidth      =   3624
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   288
      Left            =   1080
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   960
      Width           =   1092
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   432
      Left            =   1020
      TabIndex        =   0
      Top             =   120
      Width           =   972
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Dim l As String, i As Integer
    Dim tb(0 To 255) As Boolean
    Open "C:\Dev J3ZG\Dicratics\ParamTr ANSI.txt" For Input As #1
    While Not EOF(1)
        Line Input #1, l
        For i = 1 To Len(l)
            tb(Asc(Mid(l, i, 1))) = True
        Next
    Wend
    Close #1
    For i = 32 To 255
        If tb(i) Then Debug.Print Chr(i);
    Next
    Debug.Print
End Sub


Private Sub Text1_Change()
    Debug.Print Text1
End Sub
