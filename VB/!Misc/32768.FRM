VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Toutes les nuances"
   ClientHeight    =   2760
   ClientLeft      =   1170
   ClientTop       =   1545
   ClientWidth     =   6120
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
   ScaleHeight     =   184
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   408
   Begin VB.CommandButton btnGo 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Go !"
      Height          =   372
      Left            =   5040
      TabIndex        =   33
      Top             =   240
      Width           =   852
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   31
      Left            =   4440
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   32
      Top             =   2040
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   30
      Left            =   3840
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   31
      Top             =   2040
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   29
      Left            =   3240
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   30
      Top             =   2040
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   28
      Left            =   2640
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   29
      Top             =   2040
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   27
      Left            =   2040
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   28
      Top             =   2040
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   26
      Left            =   1440
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   27
      Top             =   2040
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   25
      Left            =   840
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   26
      Top             =   2040
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   24
      Left            =   240
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   25
      Top             =   2040
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   23
      Left            =   4440
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   24
      Top             =   1440
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   22
      Left            =   3840
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   23
      Top             =   1440
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   21
      Left            =   3240
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   22
      Top             =   1440
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   20
      Left            =   2640
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   21
      Top             =   1440
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   19
      Left            =   2040
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   20
      Top             =   1440
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   18
      Left            =   1440
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   19
      Top             =   1440
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   17
      Left            =   840
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   18
      Top             =   1440
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   16
      Left            =   240
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   17
      Top             =   1440
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   15
      Left            =   4440
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   16
      Top             =   840
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   14
      Left            =   3840
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   15
      Top             =   840
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   13
      Left            =   3240
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   14
      Top             =   840
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   12
      Left            =   2640
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   13
      Top             =   840
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   11
      Left            =   2040
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   12
      Top             =   840
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   10
      Left            =   1440
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   11
      Top             =   840
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   9
      Left            =   840
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   10
      Top             =   840
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   8
      Left            =   240
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   9
      Top             =   840
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   7
      Left            =   4440
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   8
      Top             =   240
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   6
      Left            =   3840
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   7
      Top             =   240
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   5
      Left            =   3240
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   6
      Top             =   240
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   4
      Left            =   2640
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   5
      Top             =   240
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   3
      Left            =   2040
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   4
      Top             =   240
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   2
      Left            =   1440
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   3
      Top             =   240
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   1
      Left            =   840
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   2
      Top             =   240
      Width           =   510
   End
   Begin VB.PictureBox Image1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   510
      Index           =   0
      Left            =   240
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   1
      Top             =   240
      Width           =   510
   End
   Begin VB.CommandButton btnQuitter 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Cancel          =   -1  'True
      Caption         =   "&Quitter"
      Height          =   372
      Left            =   5040
      TabIndex        =   0
      Top             =   720
      Width           =   852
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
DefInt A-Z

Private Sub btnGo_Click()
  btnGo.Enabled = False
  For r = 0 To 31
    ir = 8 * r
    For v = 0 To 31
      iv = 8 * v
      For b = 0 To 31
        Image1(r).PSet (v, b), RGB(ir, iv, 8 * b)
      Next
    Next
    Image1(r).Refresh
    DoEvents
  Next
  btnGo.Enabled = True
End Sub

Private Sub btnQuitter_Click()
  End
End Sub

