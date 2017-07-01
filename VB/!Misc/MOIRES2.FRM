VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "Moires2: Dessin en XOR"
   ClientHeight    =   5520
   ClientLeft      =   1245
   ClientTop       =   1605
   ClientWidth     =   7485
   DrawMode        =   6  'Mask Pen Not
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   368
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   499
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
DefInt A-Z

Private Sub Form_Click()
  x = ScaleWidth Or 1
  y = ScaleHeight Or 1
  Form1.DrawMode = 6
debut:
  For i = 0 To x - 1
    Line (i, 0)-(x - i, y)
  Next
  For i = 1 To y - 2
    Line (0, i)-(x, y - i)
  Next

  x = x + 2
  j = j + 1
'  If j = 1 Then GoTo debut
End Sub

