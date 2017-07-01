VERSION 5.00
Begin VB.Form frmDiscreteLogisticEqn 
   Caption         =   "Discrete Logistic Equation"
   ClientHeight    =   7485
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7035
   LinkTopic       =   "Form1"
   ScaleHeight     =   499
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   469
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Calc"
      Height          =   495
      Left            =   90
      TabIndex        =   1
      Top             =   90
      Width           =   1215
   End
   Begin VB.PictureBox pic1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   4935
      Left            =   90
      ScaleHeight     =   327
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   447
      TabIndex        =   0
      Top             =   660
      Width           =   6735
   End
End
Attribute VB_Name = "frmDiscreteLogisticEqn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Discrete Logistic Equation
' Test for bitmap drawing example in WPF
' 2013-01-09

Option Explicit

Private Sub Command1_Click()
    Dim x As Double, y As Double
    Dim i As Integer
    For x = 2 To 4 Step 1 / pic1.Width      ' each column drawn twice since x width is 2
        y = 0.5
        For i = 1 To 250
            y = x * y * (1 - y)
            ' Use first 150 iterations to reach stability
            If i > 150 Then pic1.PSet ((x - 2) / 2 * pic1.ScaleWidth, (1 - y) * pic1.ScaleHeight)
        Next
    Next
End Sub

Private Sub Form_Resize()
    pic1.Cls
    On Error Resume Next
    pic1.Width = Me.ScaleWidth - 12
    pic1.Top = Command1.Top + Command1.Height + 6
    pic1.Height = Me.ScaleHeight - (Command1.Height + 18)
End Sub

