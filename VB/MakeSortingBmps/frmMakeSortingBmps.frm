VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3060
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   204
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   304
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox P1 
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      Height          =   210
      Left            =   720
      ScaleHeight     =   14
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   14
      TabIndex        =   0
      Top             =   720
      Width           =   210
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    P1.Width = 17
    Dim i As Integer, s As Integer, sFile As String
    For i = 0 To 4
        For s = -1 To 1 Step 2
            Z i, s
            sFile = "c:\" & IIf(s < 0, "D", "U") & Format(i) & ".bmp"
            SavePicture P1.Image, sFile
        Next
    Next
End Sub

Sub Z(n As Integer, s As Integer)
    P1.BackColor = vbYellow
    P1.Cls
    
    If n > 0 Then
        P1.Font = "Tahoma"
        P1.FontBold = True
        P1.FontSize = 8
        P1.CurrentX = -2
        P1.CurrentY = 0
        P1.Print n;
    End If
    
    If s = 1 Then
        P1.Font = "Wingdings"
        P1.FontBold = True
        P1.FontSize = 7
        P1.CurrentY = 1
        P1.CurrentX = 7
        P1.Print Chr(&HE1);
        P1.PSet (11, 10)
        P1.PSet (12, 10)
    End If
    If s = -1 Then
        P1.Font = "Wingdings"
        P1.FontBold = True
        P1.FontSize = 7
        P1.CurrentY = 3
        P1.CurrentX = 8
        P1.Print Chr(&HE2);
        P1.PSet (11, 3)
        P1.PSet (12, 3)
    End If
End Sub
