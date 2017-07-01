VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5325
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9405
   LinkTopic       =   "Form1"
   ScaleHeight     =   355
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   627
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnRemplissage 
      Caption         =   "Remplissage"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   4740
      Width           =   1215
   End
   Begin VB.PictureBox p2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   4500
      Left            =   4740
      ScaleHeight     =   298
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   298
      TabIndex        =   1
      Top             =   180
      Width           =   4500
   End
   Begin VB.PictureBox p1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   4500
      Left            =   120
      ScaleHeight     =   298
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   298
      TabIndex        =   0
      Top             =   180
      Width           =   4500
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const pi = 3.1415926

Private Sub btnRemplissage_Click()
  Dim i As Long
  Dim x As Integer, y As Integer
  Dim r As Single, t As Single
  
  For i = 1 To 300000
    x = 298 * a
    y = 298 * a
    p1.PSet (x, y), RGB(x / 298 * 255, y / 298 * 255, 128)
    
    Do
      r = 421 * Sqr(a)
      t = pi / 2 * a
      x = r * Cos(t)
      y = r * Sin(t)
    Loop While x > 298 Or y > 298
    p2.PSet (x, y), RGB(r / 421 * 255, t * 2 / pi * 255, 128)
  Next
End Sub

Private Function a() As Single
  a = Rnd
End Function
