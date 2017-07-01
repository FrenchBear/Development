VERSION 2.00
Begin Form Form1 
   Caption         =   "Analyseur de largeurs de caractères"
   ClientHeight    =   6330
   ClientLeft      =   15
   ClientTop       =   1965
   ClientWidth     =   10530
   FontBold        =   0   'False
   FontItalic      =   0   'False
   FontName        =   "MS Sans Serif"
   FontSize        =   8.25
   FontStrikethru  =   0   'False
   FontUnderline   =   0   'False
   Height          =   6735
   Icon            =   FWGRAPHE.FRX:0000
   Left            =   -45
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6330
   ScaleWidth      =   10530
   Top             =   1620
   Width           =   10650
   Begin PictureBox picExemple 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   600
      Index           =   4
      Left            =   2520
      ScaleHeight     =   570
      ScaleWidth      =   465
      TabIndex        =   11
      Top             =   5520
      Width           =   495
   End
   Begin PictureBox picExemple 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   600
      Index           =   3
      Left            =   1920
      ScaleHeight     =   570
      ScaleWidth      =   465
      TabIndex        =   10
      Top             =   5520
      Width           =   495
   End
   Begin PictureBox picExemple 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   600
      Index           =   2
      Left            =   1320
      ScaleHeight     =   570
      ScaleWidth      =   465
      TabIndex        =   9
      Top             =   5520
      Width           =   495
   End
   Begin PictureBox picExemple 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   600
      Index           =   1
      Left            =   720
      ScaleHeight     =   570
      ScaleWidth      =   465
      TabIndex        =   8
      Top             =   5520
      Width           =   495
   End
   Begin PictureBox picExemple 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   600
      Index           =   0
      Left            =   120
      ScaleHeight     =   570
      ScaleWidth      =   465
      TabIndex        =   7
      Top             =   5520
      Width           =   495
   End
   Begin ListBox List1 
      Height          =   6075
      Left            =   7680
      TabIndex        =   5
      Top             =   120
      Width           =   2775
   End
   Begin ComboBox Combo1 
      Height          =   300
      Left            =   2640
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   120
      Width           =   2415
   End
   Begin CommandButton btnQuitter 
      Cancel          =   -1  'True
      Caption         =   "Quitter"
      Height          =   375
      Left            =   6600
      TabIndex        =   4
      Top             =   120
      Width           =   975
   End
   Begin TextBox txtChar 
      Height          =   285
      Left            =   1200
      MaxLength       =   1
      TabIndex        =   1
      Top             =   120
      Width           =   375
   End
   Begin PictureBox pic 
      Height          =   4815
      Left            =   120
      ScaleHeight     =   4785
      ScaleWidth      =   7425
      TabIndex        =   6
      Top             =   600
      Width           =   7455
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      Caption         =   "t4"
      Height          =   255
      Index           =   4
      Left            =   2520
      TabIndex        =   16
      Top             =   6120
      Width           =   495
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      Caption         =   "t3"
      Height          =   255
      Index           =   3
      Left            =   1920
      TabIndex        =   15
      Top             =   6120
      Width           =   495
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      Caption         =   "t2"
      Height          =   255
      Index           =   2
      Left            =   1320
      TabIndex        =   14
      Top             =   6120
      Width           =   495
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      Caption         =   "t1"
      Height          =   255
      Index           =   1
      Left            =   720
      TabIndex        =   13
      Top             =   6120
      Width           =   495
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      Caption         =   "t0"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   12
      Top             =   6120
      Width           =   495
   End
   Begin Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&Police:"
      Height          =   195
      Left            =   1920
      TabIndex        =   2
      Top             =   180
      Width           =   600
   End
   Begin Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Caractère :"
      Height          =   195
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   960
   End
End
' fwgraphe
' Analyse les largeurs de caractères, en fonction de
' leur taille
' 7/3/94 PV

Option Explicit

Sub btnQuitter_Click ()
  End
End Sub

Sub Combo1_Click ()
  DoAnalyse
End Sub

Sub DoAnalyse ()
  Dim t As Single, u As Single, w As Single
  Dim i As Integer

  If txtChar = "" Then Exit Sub
  
  caption = "Analyseur de largeurs de caractères: " & combo1.Text
  
  list1.Clear
  pic.Cls

  exemple 22, combo1.Text

  pic.Line (0, 0)-(40, 0)
  pic.Line (0, 0)-(0, 50)
  For i = 0 To 40 Step 5
    pic.CurrentX = i - .5 * pic.TextWidth(Format(i))
    pic.CurrentY = -1
    pic.Print Format(i)
    pic.Line (i, -.1)-Step(0, 1)
  Next
  For i = 1 To 39
    pic.Line (i, -.1)-Step(0, .2)
  Next
  For i = 0 To 50 Step 5
    pic.CurrentX = -2
    pic.CurrentY = i + .5 * pic.TextHeight(Format(i))
    pic.Print Format(i)
    pic.Line (-.1, i)-Step(.3, 0)
  Next
  For i = 1 To 49
    pic.Line (-.1, i)-Step(.1, 0)
  Next

  printer.FontName = combo1.Text
  printer.FontBold = False
  printer.FontItalic = False

  For t = 4 To 40
    printer.FontSize = t
    u = printer.FontSize
    w = printer.TextWidth(txtChar) / 20
    If t > 4 Then pic.Line -(u, w) Else pic.PSet (u, w)
    pic.Circle (u, w), .1
    list1.AddItem Format(t) & Chr(9) & Format(u) & Chr(9) & Format(w)
  Next

End Sub

Sub exemple (iTaille As Single, ByVal FontName As String)
  Dim i As Integer

  On Error Resume Next

  For i = 0 To 4
    picExemple(i).Cls
    picExemple(i).FontName = FontName
    picExemple(i).FontBold = False
    picExemple(i).FontItalic = False
    picExemple(i).FontSize = iTaille + i - 2
    picExemple(i).Print txtChar
    label3(i) = Format(iTaille + i - 2)
  Next

End Sub

Sub Form_Load ()
  pic.ScaleLeft = -2.5
  pic.ScaleWidth = 45
  pic.ScaleTop = 55
  pic.ScaleHeight = -60

  Dim i As Integer
  For i = 0 To printer.FontCount - 1
    combo1.AddItem printer.Fonts(i)
  Next
  combo1.ListIndex = 0
End Sub

Sub txtChar_Change ()
  DoAnalyse
  txtChar.SelStart = 0
  txtChar.SelLength = 1
End Sub

