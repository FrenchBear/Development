VERSION 5.00
Begin VB.Form frmED 
   Caption         =   "Form1"
   ClientHeight    =   4875
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7245
   LinkTopic       =   "Form1"
   ScaleHeight     =   4875
   ScaleWidth      =   7245
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
End
Attribute VB_Name = "frmED"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmED
' Dessin d'équations différentielles
' Un vieux sujet qui refait surface.
' Nettement plus sympa sur un P300 !!!
' 14/12/97 PV

Option Explicit

Private Sub Form_Click()
  Cls
  Dim a As Single, b As Single, c As Single, d As Single
  Dim h As Single
  a = -12
  b = 12
  c = -9
  d = 9
  
  h = 0.1
  
  ScaleMode = 0
  ScaleLeft = a
  ScaleWidth = b - a
  ScaleTop = c
  ScaleHeight = d - c
  
  Dim i As Integer, j As Integer
  Dim x0 As Single, y0 As Single
  Dim x As Single, y As Single
  Dim u As Single, v As Single
  Dim np As Integer
  Dim r2 As Single, r As Single
  For i = 1 To 1000
    x0 = a + (b - a) * Rnd
    y0 = c + (d - c) * Rnd
    For j = -1 To 1 Step 2
      x = x0
      y = y0
      PSet (x0, y0)
      np = 1
      Do
        u = x * x * y * y - 1
        v = x * x + y * y - 4
        
        r2 = u * u + v * v
        r = Sqr(r2)
        x = x + j * h * u / r
        y = y + j * h * v / r
        If (x - CurrentX) * (x - CurrentX) + (y - CurrentY) * (y - CurrentY) > 1 Then Exit Do
        Dim x2 As Single, y2 As Single
        x2 = CurrentX
        y2 = CurrentY
        Line -(x, y)
        PSet (x2, y2), RGB(255, 255, 255)
        CurrentX = x
        CurrentY = y
        np = np + 1
      Loop Until np > 300 Or x < a Or x > b Or y < c Or y > d Or r2 < 0.0001
    Next
  Next
End Sub

