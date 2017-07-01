VERSION 2.00
Begin Form Feuille1 
   Caption         =   "Feuille1"
   ClientHeight    =   5820
   ClientLeft      =   615
   ClientTop       =   2460
   ClientWidth     =   7455
   Height          =   6225
   Left            =   555
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   5820
   ScaleWidth      =   7455
   Top             =   2115
   Width           =   7575
End
Option Explicit

Sub Form_Click ()
  Dim l$
  Open "c:\win3\win.ini" For Input As #1
  While Not EOF(1)
    Line Input #1, l$
    caption = l$
  Wend
  Close #1
End Sub

Sub Form_MouseMove (Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim c, r, g, b
  c = Point(x, y)
  r = c Mod 256
  g = (c \ 256) Mod 256
  b = c \ 256 \ 256
  caption = "R" & r & " G" & g & " B" & b
End Sub

Sub Form_Resize ()
  repaint
End Sub

Sub repaint ()
  Const bv = 8
  Const niv = 16

  Dim h As Single, w As Single

  h = scaleheight / niv
  w = (scalewidth) / bv

  Cls
  Dim i As Integer, j As Integer

  For i = 0 To niv - 1
    Dim g As Integer
    g = 255 / (2 * niv - 1) * i
    For j = 0 To bv - 1 Step 2
      Line (j * w, h * i)-Step(w, h), RGB(g, g, g), BF
    Next
  
    g = 255 / (2 * niv - 1) * (i + niv)
    For j = 1 To bv Step 2
      Line (j * w, h * i)-Step(w, h), RGB(g, g, g), BF
    Next
  Next

End Sub

