VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Progressions aléatoires"
   ClientHeight    =   4050
   ClientLeft      =   1800
   ClientTop       =   1530
   ClientWidth     =   4320
   Height          =   4440
   Left            =   1740
   LinkTopic       =   "Form1"
   ScaleHeight     =   4050
   ScaleWidth      =   4320
   Top             =   1200
   Width           =   4440
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   120
      Top             =   480
   End
   Begin ComctlLib.ProgressBar pb 
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4095
      _Version        =   65536
      _ExtentX        =   7223
      _ExtentY        =   450
      _StockProps     =   192
      Appearance      =   1
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Private Sub Form_Load()
  Dim i As Integer
  For i = 0 To 12
    If i > 0 Then Load pb(i)
    pb(i).Move 100, 300 * i
    pb(i).Visible = 1
  Next
End Sub


Private Sub Timer1_Timer()
  Dim i As Integer
  i = Int(13 * Rnd)
  v = pb(i).Value
  d = 50 * Rnd - 25
  If v + d < 0 Or v + d > 100 Then d = -d
  pb(i).Value = v + d
End Sub


