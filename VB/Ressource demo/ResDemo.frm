VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Resource Usage Demo"
   ClientHeight    =   3060
   ClientLeft      =   840
   ClientTop       =   2925
   ClientWidth     =   3975
   DrawMode        =   12  'Nop
   Icon            =   "ResDemo.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3060
   ScaleWidth      =   3975
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   240
      Style           =   2  'Dropdown List
      TabIndex        =   8
      Top             =   360
      Width           =   3495
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   2100
      Top             =   2040
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   180
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   2220
      Width           =   1215
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Timer Interval:"
      ForeColor       =   &H00000080&
      Height          =   195
      Left            =   180
      TabIndex        =   9
      Top             =   1980
      Width           =   1005
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Wave Resource:"
      ForeColor       =   &H00000080&
      Height          =   195
      Left            =   240
      TabIndex        =   7
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label lblCheck 
      Caption         =   "lblCheck(2)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Index           =   2
      Left            =   180
      TabIndex        =   6
      Top             =   3600
      Width           =   2775
   End
   Begin VB.Label lblCheck 
      Caption         =   "lblCheck(1)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Index           =   1
      Left            =   180
      TabIndex        =   5
      Top             =   3240
      Width           =   2775
   End
   Begin VB.Label lblCheck 
      Caption         =   "lblCheck(0)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Index           =   0
      Left            =   180
      TabIndex        =   4
      Top             =   2640
      Width           =   2775
   End
   Begin VB.Label lblOption 
      Caption         =   "lblOption(2)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Index           =   2
      Left            =   240
      TabIndex        =   2
      Top             =   1500
      Width           =   2775
   End
   Begin VB.Label lblOption 
      Caption         =   "lblOption(1)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Index           =   1
      Left            =   240
      TabIndex        =   1
      Top             =   1140
      Width           =   2775
   End
   Begin VB.Label lblOption 
      Caption         =   "lblOption(0)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   780
      Width           =   2775
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private m_Background As Picture
Private m_Options As Picture
Private m_MoonIco As Picture

Private m_Option As Integer
Private m_Check(0 To 2) As Boolean

Private Declare Function DrawIcon Lib "user32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal hIcon As Long) As Long

Private Sub Combo1_Click()
   DoEvents
   PlaySoundResource Combo1.ItemData(Combo1.ListIndex)
End Sub

Private Sub Form_Load()
   Set m_Options = LoadResPicture(bmpOptions, vbResBitmap)
   Set m_Background = LoadResPicture(bmpBackground, vbResBitmap)
   
   lblOption(0).Caption = ""
   lblOption(1).Caption = ""
   lblOption(2).Caption = ""
   lblOption(0).Tag = "Sounds disabled"
   lblOption(1).Tag = "Wave plays once upon selection"
   lblOption(2).Tag = "Wave plays continuously"
   lblOption(0).BackStyle = vbTransparent
   lblOption(1).BackStyle = vbTransparent
   lblOption(2).BackStyle = vbTransparent
   m_Option = 0
   
   lblCheck(0).Caption = ""
   lblCheck(1).Caption = ""
   lblCheck(2).Caption = ""
   lblCheck(0).Tag = "Animate Moon Icon"
   lblCheck(1).Tag = "This is Check 2"
   lblCheck(2).Tag = "This is Check 3"
   lblCheck(0).BackStyle = vbTransparent
   lblCheck(1).BackStyle = vbTransparent
   lblCheck(2).BackStyle = vbTransparent
   m_Check(0) = True
   
   Combo1.AddItem "Birds"
   Combo1.AddItem "Intro Riff"
   Combo1.AddItem "Pinball"
   Combo1.ItemData(0) = sndBirds
   Combo1.ItemData(1) = sndIntro
   Combo1.ItemData(2) = sndPin560
   
   Text1.Text = Timer1.Interval
End Sub

Private Sub Form_Paint()
   TileBlt Me.hWnd, m_Background.Handle
   UpdateOptions
   UpdateChecks
End Sub

Private Sub lblCheck_Click(Index As Integer)
   m_Check(Index) = Not m_Check(Index)
   UpdateChecks
   
   If Index = 0 Then
      Timer1.Enabled = m_Check(0)
      Me.Refresh 'to clear icon if disabled
   End If
End Sub

Private Sub lblOption_Click(Index As Integer)
   m_Option = Index
   UpdateOptions
End Sub

Private Sub UpdateOptions()
   Dim i As Long
   Dim x As Long
   Dim y As Long
   Dim pic As New CPictureDC
   Dim trans As Long
   Dim fnt As Font
   Dim clr As Long
   
   pic.hBitmap = m_Options.Handle
   trans = &HC0C0C0
   For i = 0 To 2
      x = lblOption(i).Left \ Screen.TwipsPerPixelY
      y = (lblOption(i).Top + (lblOption(i).Height \ 2)) \ Screen.TwipsPerPixelY - 8
      If m_Option = i Then
         Call TransBlt(Me.hdc, x, y, 16, 16, pic.hdc, 16, 0, trans)
      Else
         Call TransBlt(Me.hdc, x, y, 16, 16, pic.hdc, 0, 0, trans)
      End If
      Me.CurrentX = lblOption(i).Left + 18 * Screen.TwipsPerPixelX
      Me.CurrentY = (lblOption(i).Top + (lblOption(i).Height \ 2)) - Me.TextHeight(lblOption(i).Tag) \ 2
      Set fnt = Me.Font
      clr = Me.ForeColor
      Set Me.Font = lblCheck(i).Font
      Me.ForeColor = lblCheck(i).ForeColor
      Me.Print lblOption(i).Tag
      Set Me.Font = fnt
      Me.ForeColor = clr
   Next i
End Sub

Private Sub UpdateChecks()
   Dim i As Long
   Dim x As Long
   Dim y As Long
   Dim pic As New CPictureDC
   Dim trans As Long
   Dim fnt As Font
   Dim clr As Long
   
   pic.hBitmap = m_Options.Handle
   trans = &HC0C0C0
   For i = 0 To 2
      x = lblCheck(i).Left \ Screen.TwipsPerPixelY
      y = (lblCheck(i).Top + (lblCheck(i).Height \ 2)) \ Screen.TwipsPerPixelY - 8
      If m_Check(i) Then
         Call TransBlt(Me.hdc, x, y, 16, 16, pic.hdc, 16, 16, trans)
      Else
         Call TransBlt(Me.hdc, x, y, 16, 16, pic.hdc, 0, 16, trans)
      End If
      Me.CurrentX = lblCheck(i).Left + 18 * Screen.TwipsPerPixelX
      Me.CurrentY = (lblCheck(i).Top + (lblCheck(i).Height \ 2)) - Me.TextHeight(lblCheck(i).Tag) \ 2
      Set fnt = Me.Font
      clr = Me.ForeColor
      Set Me.Font = lblCheck(i).Font
      Me.ForeColor = lblCheck(i).ForeColor
      Me.Print lblCheck(i).Tag
      Set Me.Font = fnt
      Me.ForeColor = clr
   Next i
End Sub

Private Sub Text1_Change()
   Timer1.Interval = Val(Text1.Text)
End Sub

Private Sub Timer1_Timer()
   Static Which As Integer
   Static x As Long, y As Long
   
   Which = ((Which + 1) Mod 8)
   Set m_MoonIco = LoadResPicture(Which + 101, vbResIcon)
   x = (Me.ScaleWidth \ Screen.TwipsPerPixelX) - 40
   y = (Me.ScaleHeight \ Screen.TwipsPerPixelY) - 40
   Call DrawIcon(Me.hdc, x, y, m_MoonIco.Handle)
End Sub
