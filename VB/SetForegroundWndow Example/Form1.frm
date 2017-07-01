VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Left            =   1680
      Top             =   1260
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' Start a new project and add the following code to it
' Make sure you add a Timer (Timer1) to the main form
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function SetProp Lib "user32" Alias "SetPropA" (ByVal hwnd As Long, ByVal lpString As String, ByVal hData As Long) As Long
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long

Private Sub Form_Load()
    'KPD-Team 2001
    'URL: http://www.allapi.net/
    'E-Mail: KPDTeam@Allapi.net
    Me.Caption = "AllowSetForegroundWindow Example"
    '
    SetProp Me.hwnd, "ProcessID", GetCurrentProcessId
    Timer1.Interval = 10000
    Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
    SetForegroundWindow Me.hwnd
End Sub
