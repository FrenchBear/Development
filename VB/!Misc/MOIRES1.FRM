VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "Moires1: 1 ligne blanche, 1 ligne noire, ..."
   ClientHeight    =   5520
   ClientLeft      =   1245
   ClientTop       =   1605
   ClientWidth     =   7485
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
Private Sub Form_Click()
  x = ScaleWidth Or 3
  y = ScaleHeight Or 3
  x2 = x \ 2
  y2 = y \ 2
  For i = 0 To x2 Step 2
    Lyne x - i, y, i, 0, ForeColor
    Lyne x - i - 1, y, i + 1, 0, BackColor
    Lyne i, y, x - i, 0, BackColor
    Lyne i + 1, y, x - i - 1, 0, ForeColor
  Next
  For i = 0 To y2 Step 2
    Lyne 0, i, x, y - i, ForeColor
    Lyne 0, i + 1, x, y - i - 1, BackColor
    Lyne 0, y - i, x, i, BackColor
    Lyne 0, y - i - 1, x, i + 1, ForeColor
  Next
End Sub

Private Sub LineDemo()
    ScaleMode = 3   ' Set ScaleMode to pixels.
    CX = ScaleWidth / 2 ' Get horizontal center.
    CY = ScaleHeight / 2    ' Get vertical center.
    DrawWidth = 8   ' Set DrawWidth.
    For i% = 50 To 0 Step -2
        F = i% / 50 ' Perform interim
        F1 = 1 - F: F2 = 1 + F  ' calculations.
        ForeColor = QBColor(i% Mod 15)  ' Set foreground color.
        Line (CX * F1, CY * F1)-(CX * F2, CY * F2), , BF
    Next i%
    Z% = DoEvents()     ' Yield for other processing.
    If CY > CX Then ' Set DrawWidth.
        DrawWidth = ScaleWidth / 25
    Else
        DrawWidth = ScaleHeight / 25
    End If
    For i% = 0 To 50 Step 2 ' Set up loop.
        F = i% / 50 ' Perform interim
        F1 = 1 - F: F2 = 1 + F  ' calculations.
        Line (CX * F1, CY)-(CX, CY * F1)    ' Draw Upper-left.
        Line -(CX * F2, CY) ' Draw upper-right.
        Line -(CX, CY * F2) ' Draw lower-right.
        Line -(CX * F1, CY) ' Draw lower-left.
        ForeColor = QBColor(i% Mod 15)  ' Change color each time.
    Next i%
    Z% = DoEvents()     ' Yield for other processing.
End Sub

Private Sub Lyne(x1, y1, x2, y2, ByVal c&)
  Line (x1, y1)-(x2, y2), c&
End Sub

