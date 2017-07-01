VERSION 5.00
Begin VB.Form FMatrix 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Wake up Neo!"
   ClientHeight    =   11265
   ClientLeft      =   2940
   ClientTop       =   180
   ClientWidth     =   11430
   BeginProperty Font 
      Name            =   "Courier New"
      Size            =   15.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00000000&
   Icon            =   "Matrix.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   751
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   762
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture5 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   120
      Picture         =   "Matrix.frx":2982
      ScaleHeight     =   495
      ScaleWidth      =   14115
      TabIndex        =   4
      Top             =   3000
      Width           =   14175
   End
   Begin VB.PictureBox Picture4 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   120
      Picture         =   "Matrix.frx":195CC
      ScaleHeight     =   495
      ScaleWidth      =   14115
      TabIndex        =   3
      Top             =   2400
      Width           =   14175
   End
   Begin VB.PictureBox Picture3 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   120
      Picture         =   "Matrix.frx":30216
      ScaleHeight     =   495
      ScaleWidth      =   14115
      TabIndex        =   2
      Top             =   1800
      Width           =   14175
   End
   Begin VB.PictureBox Picture2 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   120
      Picture         =   "Matrix.frx":46E60
      ScaleHeight     =   495
      ScaleWidth      =   14115
      TabIndex        =   1
      Top             =   1200
      Width           =   14175
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   120
      Picture         =   "Matrix.frx":5DAAA
      ScaleHeight     =   495
      ScaleWidth      =   14115
      TabIndex        =   0
      Top             =   600
      Width           =   14175
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   187
      Left            =   1080
      Top             =   120
   End
   Begin VB.Timer Timer2 
      Interval        =   1000
      Left            =   600
      Top             =   120
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   51
      Left            =   120
      Top             =   120
   End
End
Attribute VB_Name = "FMatrix"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim matrix1() As Boolean
Dim matrix2() As Byte
Dim PosMess As Integer
Dim RestartMess As Integer
Dim FirstCursPos As POINTAPI
Const ChanceResteNoir = 30
Const ChanceResteVert = 20
Const Mess = "Wake up, Neo...@The Matrix has you...@Follow the white rabbit.@$Knock, knock, Neo."
Const PasX = 15
Const PasY = 24
Const PasXBmp = 17
Const DimX = 15
Const DimY = 24
Const DecX = 4
Const DecY = 5

' Les caractères correspondants dans la police TTF
' 0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdef

Private Sub Form_Click()
    
    PlaySound vbNullString, 0, SND_PURGE Or SND_NODEFAULT
    ShowCursor True
    End
    
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    
    Form_Click
    
End Sub

Private Sub Form_Load()
    
    Dim x As Integer
    Dim y As Integer
    Dim dm As DEVMODE
    
    If InStr(1, LCase(Command$), "/p") Then End
    If InStr(1, LCase(Command$), "/c") Xor InStr(1, LCase(Command$), "/s") = 0 Then
        Timer2.Enabled = False
        FMatrix.Visible = False
        FOptions.Show
        Exit Sub
    End If

    EnumDisplaySettings vbNullString, ENUM_CURRENT_SETTINGS, dm
    Picture1.Left = dm.dmPelsWidth
    Picture2.Left = dm.dmPelsWidth
    Picture3.Left = dm.dmPelsWidth
    Picture4.Left = dm.dmPelsWidth
    Picture5.Left = dm.dmPelsWidth
    
    ReDim matrix1(Int(dm.dmPelsWidth / PasX), Int(dm.dmPelsHeight / PasY)) As Boolean
    ReDim matrix2(UBound(matrix1, 1), UBound(matrix1, 2)) As Byte
    
    Randomize Timer
    For x = 0 To UBound(matrix1, 1)
        For y = 0 To UBound(matrix1, 2)
            matrix2(x, y) = Int(55 * Rnd)
        Next y
    Next x
    ShowCursor False
    FMatrix.WindowState = 2
    SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE
    FMatrix.ForeColor = &H5BB52F
    Timer1.Interval = GetPrivateProfileInt("Options", "Vitesse", 50, App.Path & "\Matrix.ini")
    If GetPrivateProfileInt("Options", "Intro", 1, App.Path & "\Matrix.ini") = 0 Then
        Timer1.Enabled = True
        Timer2.Enabled = False
        If GetPrivateProfileInt("Options", "Son", 1, App.Path & "\Matrix.ini") = 1 Then Timer3.Enabled = True
    End If
    GetCursorPos FirstCursPos
    
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    
    Dim CursPos As POINTAPI
    
    GetCursorPos CursPos
    If FirstCursPos.x + 15 < CursPos.x Or FirstCursPos.x - 15 > CursPos.x Or FirstCursPos.y + 15 < CursPos.y Or FirstCursPos.y - 15 > CursPos.y Then Form_Click
    
End Sub

Private Sub Timer1_Timer()
    
    Dim x As Integer
    Dim y As Integer
    Dim PicHdc As Long
    
    For x = 0 To UBound(matrix1, 1)
        For y = UBound(matrix1, 2) To 1 Step -1
            matrix1(x, y) = matrix1(x, y - 1)
            If Int(30 * Rnd) = 0 Then matrix2(x, y) = Int(55 * Rnd)
        Next y
        matrix1(x, 0) = IIf(matrix1(x, 1), Int(ChanceResteVert * Rnd) <> 0, Int(ChanceResteNoir * Rnd) = 0)
        If Int(20 * Rnd) = 0 Then matrix2(x, 0) = Int(55 * Rnd)
    Next x
    For x = 0 To UBound(matrix1, 1)
        For y = 0 To UBound(matrix1, 2)
            If matrix1(x, y) Then
                PicHdc = Picture1.hdc
                If y > 3 Then
                    If Not matrix1(x, y - 4) Then PicHdc = Picture3.hdc
                End If
                If y > 2 Then
                    If Not matrix1(x, y - 3) Then PicHdc = Picture4.hdc
                End If
                If y > 1 Then
                    If Not matrix1(x, y - 2) Then PicHdc = Picture5.hdc
                End If
                If y < UBound(matrix1, 2) Then
                    If Not matrix1(x, y + 1) Then PicHdc = Picture2.hdc
                End If
                BitBlt FMatrix.hdc, PasX * x, PasY * y, DimX, DimY, PicHdc, PasXBmp * matrix2(x, y) + DecX, DecY, SRCCOPY
            Else
                BitBlt FMatrix.hdc, PasX * x, PasY * y, DimX, DimY, FMatrix.hdc, 0, 0, BLACKNESS
            End If
        Next y
    Next x
    
End Sub

Private Sub Timer2_Timer()
    
    If PosMess = Len(Mess) Then
        BitBlt FMatrix.hdc, 60, 70, 310, 21, FMatrix.hdc, 0, 0, BLACKNESS
        PosMess = PosMess + 1
        Timer2.Interval = 5000
        Exit Sub
    End If
    If PosMess > Len(Mess) Then
        Timer2.Enabled = False
        Timer1.Enabled = True
        If GetPrivateProfileInt("Options", "Son", 1, App.Path & "\Matrix.ini") = 1 Then Timer3.Enabled = True
        Exit Sub
    End If
    If Mid(Mess, PosMess + 1, 1) = "@" Then
        Timer2.Interval = 7000
        PosMess = PosMess + 1
        RestartMess = PosMess
        Exit Sub
    End If
    If PosMess <> 0 Then
        If Mid(Mess, PosMess, 1) = "@" Then
            Timer2.Interval = 250
            BitBlt FMatrix.hdc, 60, 70, 310, 21, FMatrix.hdc, 0, 0, BLACKNESS
        End If
    End If
    If Mid(Mess, PosMess + 1, 1) = "$" Then
        PlaySound App.Path & "\Touch.wav", 0, SND_ASYNC
        TextOut FMatrix.hdc, 60, 70, Mid(Mess, PosMess + 2), Len(Mess) - PosMess - 1
        PosMess = Len(Mess)
        Timer2.Interval = 2000
        Exit Sub
    End If
    Timer2.Interval = 100 + Int(150 * Rnd)
    TextOut FMatrix.hdc, 13 * (PosMess - RestartMess) + 60, 70, Mid(Mess, PosMess + 1, 1), 1
    PosMess = PosMess + 1
    PlaySound App.Path & "\Touch.wav", 0, SND_ASYNC Or SND_NODEFAULT
    
End Sub

Private Sub Timer3_Timer()

    Select Case Int(30 * Rnd)
    Case 0
        PlaySound App.Path & "\Left.wav", 0, SND_ASYNC Or SND_NODEFAULT
        Timer3.Interval = 16
    Case 1
        PlaySound App.Path & "\Right.wav", 0, SND_ASYNC Or SND_NODEFAULT
        Timer3.Interval = 16
    Case Else
        PlaySound App.Path & "\Loop.wav", 0, SND_ASYNC Or SND_NODEFAULT
        Timer3.Interval = 187
    End Select
    
End Sub

