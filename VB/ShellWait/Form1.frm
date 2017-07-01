VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   3180
      TabIndex        =   2
      Top             =   1860
      Width           =   1215
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   4020
      Top             =   1020
   End
   Begin VB.ListBox lstStatus 
      Height          =   2010
      Left            =   120
      TabIndex        =   1
      Top             =   180
      Width           =   2895
   End
   Begin VB.CommandButton btnRun 
      Caption         =   "Run"
      Height          =   495
      Left            =   3240
      TabIndex        =   0
      Top             =   180
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim colTasks As New Collection

Private Sub btnRun_Click()
    Dim x
    x = Shell("calc")
    colTasks.Add x
End Sub

Private Sub Command1_Click()
ShellWait "calc"
MsgBox "ok"
End Sub

Private Sub Timer1_Timer()
    lstStatus.Clear
    Dim x
    For Each x In colTasks
        lstStatus.AddItem x & ": " & IsProcessActive(x)
    Next
End Sub
