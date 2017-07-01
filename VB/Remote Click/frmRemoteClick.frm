VERSION 5.00
Begin VB.Form frmRemoteClick 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Remote Click"
   ClientHeight    =   3090
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtInterval 
      Height          =   315
      Left            =   1800
      TabIndex        =   3
      Text            =   "60"
      Top             =   480
      Width           =   795
   End
   Begin VB.CommandButton btnStop 
      Caption         =   "Stop"
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton btnStart 
      Caption         =   "Start"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Interval (s)"
      Height          =   195
      Left            =   1800
      TabIndex        =   2
      Top             =   240
      Width           =   855
   End
End
Attribute VB_Name = "frmRemoteClick"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' RemoteClick
' 2006-12-02    FPVI

Option Explicit

'Public Declare Function SetCursorPos Lib "User32.dll" (ByVal X As Integer, ByVal Y As Integer) As Long
'Public Declare Function GetCursorPos Lib "User32.dll" (ByRef lpPoint As Point) As Long
Private Declare Sub mouse_event Lib "user32" (ByVal dwFlags As Long, ByVal dx As Long, ByVal dy As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Const MOUSEEVENTF_LEFTDOWN = &H2 ' left button down
Const MOUSEEVENTF_LEFTUP = &H4 ' left button up
Const MOUSEEVENTF_MIDDLEDOWN = &H20 ' middle button down
Const MOUSEEVENTF_MIDDLEUP = &H40 ' middle button up
Const MOUSEEVENTF_RIGHTDOWN = &H8 ' right button down
Const MOUSEEVENTF_RIGHTUP = &H10 ' right button up


Private Sub btnStart_Click()
    btnStart.Enabled = False
    btnStop.Enabled = True
    Me.WindowState = 1          ' Minimized
    
    Dim t As Single
    Do
        t = Timer
        Do
            DoEvents
            If btnStop.Enabled = False Then GoTo Sortie
            Sleep 1
        Loop Until Timer - t > Val(txtInterval)
        
        If Rnd > 0.5 Then
            SendKeys "{F5}"
        Else
            Call mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
            Call mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
        End If
    Loop
    
Sortie:
    btnStart.Enabled = True
End Sub

Private Sub btnStop_Click()
    btnStop.Enabled = False
End Sub
