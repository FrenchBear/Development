VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.2#0"; "COMCTL32.OCX"
Begin VB.Form frmTNGPad 
   BackColor       =   &H00000000&
   ClientHeight    =   4935
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7260
   FillColor       =   &H0000FFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   329
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   484
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Paramètres 
      Caption         =   "Paramètres"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2475
      Left            =   2760
      TabIndex        =   0
      Top             =   1920
      Width           =   3975
      Begin VB.TextBox txtr1 
         BackColor       =   &H8000000F&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Left            =   480
         TabIndex        =   13
         Top             =   1920
         Width           =   615
      End
      Begin VB.TextBox txtdh 
         BackColor       =   &H8000000F&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Left            =   480
         TabIndex        =   10
         Top             =   1500
         Width           =   615
      End
      Begin VB.TextBox txtws 
         BackColor       =   &H8000000F&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Left            =   480
         TabIndex        =   7
         Top             =   1080
         Width           =   615
      End
      Begin VB.TextBox txths 
         BackColor       =   &H8000000F&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Left            =   480
         TabIndex        =   4
         Top             =   660
         Width           =   615
      End
      Begin VB.TextBox txth1 
         BackColor       =   &H8000000F&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Left            =   480
         TabIndex        =   3
         Top             =   240
         Width           =   615
      End
      Begin ComctlLib.Slider h1 
         Height          =   435
         Left            =   1080
         TabIndex        =   1
         Top             =   180
         Width           =   2835
         _ExtentX        =   5001
         _ExtentY        =   767
         _Version        =   327682
         LargeChange     =   10
         SmallChange     =   10
         Max             =   200
         SelStart        =   60
         TickFrequency   =   10
         Value           =   60
      End
      Begin ComctlLib.Slider hs 
         Height          =   435
         Left            =   1080
         TabIndex        =   5
         Top             =   600
         Width           =   2835
         _ExtentX        =   5001
         _ExtentY        =   767
         _Version        =   327682
         LargeChange     =   10
         SmallChange     =   10
         Max             =   50
         SelStart        =   50
         TickFrequency   =   10
         Value           =   50
      End
      Begin ComctlLib.Slider ws 
         Height          =   435
         Left            =   1080
         TabIndex        =   8
         Top             =   1020
         Width           =   2835
         _ExtentX        =   5001
         _ExtentY        =   767
         _Version        =   327682
         LargeChange     =   10
         SmallChange     =   10
         Max             =   120
         SelStart        =   50
         TickFrequency   =   10
         Value           =   50
      End
      Begin ComctlLib.Slider dh 
         Height          =   435
         Left            =   1080
         TabIndex        =   11
         Top             =   1440
         Width           =   2835
         _ExtentX        =   5001
         _ExtentY        =   767
         _Version        =   327682
         LargeChange     =   10
         SmallChange     =   10
         Max             =   20
         SelStart        =   20
         Value           =   20
      End
      Begin ComctlLib.Slider r1 
         Height          =   435
         Left            =   1080
         TabIndex        =   14
         Top             =   1860
         Width           =   2835
         _ExtentX        =   5001
         _ExtentY        =   767
         _Version        =   327682
         LargeChange     =   10
         SmallChange     =   10
         Min             =   1
         Max             =   30
         SelStart        =   20
         Value           =   20
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "r1"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Index           =   4
         Left            =   120
         TabIndex        =   15
         Top             =   1920
         Width           =   375
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "dh"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Index           =   3
         Left            =   120
         TabIndex        =   12
         Top             =   1500
         Width           =   375
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "ws"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Index           =   2
         Left            =   120
         TabIndex        =   9
         Top             =   1080
         Width           =   375
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "hs"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Index           =   1
         Left            =   120
         TabIndex        =   6
         Top             =   660
         Width           =   375
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "h1"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Index           =   0
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Label lblCaption 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Caption"
      BeginProperty Font 
         Name            =   "TNG Monitors"
         Size            =   36
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080C0FF&
      Height          =   1005
      Left            =   1680
      TabIndex        =   16
      Top             =   180
      Width           =   1830
   End
End
Attribute VB_Name = "frmTNGPad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const vo_h1 = 65       ' Position de la barre horizontale
Const vo_hs = 15       ' Hauteur de la ligne séparatrice
Const vo_ws = 80       ' Largeur de la ligne séparatrice
Const vo_dh = 4        ' Hauteur du séparateur noir de séparateur
Const vo_r1 = 15
Const cs = &HE00080 ' Couleur
Const pi = 3.1416

Private Sub Form_Load()
  h1 = vo_h1
  hs = vo_hs
  ws = vo_ws
  dh = vo_dh
  r1 = vo_r1
  
  txth1 = h1
  txths = hs
  txtws = ws
  txtdh = dh
  txtr1 = r1
End Sub

Private Sub Form_Paint()
  Repaint
End Sub

Sub Repaint()
  Dim r2 As Integer
  r2 = hs + r1
  
  Cls
  lblCaption.Move ws, 0
  Line (0, 0)-(ws - r1, h1 - r1), cs, BF
  Line (0, h1 + hs + dh + hs + r1)-(ws - r1, ScaleHeight), cs, BF
  Line (ws, h1)-(ScaleWidth, h1 + hs), cs, BF
  Line (ws, h1 + hs + dh)-(ScaleWidth, h1 + hs + dh + hs), cs, BF
  FillStyle = 0
  FillColor = cs
  Circle (r2, h1 + hs - r2), r2, cs, -pi, -1.5 * pi
  Line (r2, h1 + hs - r2)-(ws, h1 + hs), cs, BF
  FillColor = 0
  Circle (ws, h1 - r1), r1 - 1, 0, -pi, -1.5 * pi
  
  FillColor = cs
  Circle (r2, h1 + hs + dh + r2), r2, cs, -0.5 * pi, -pi
  Line (r2, h1 + hs + dh + r2)-(ws, h1 + hs + dh), cs, BF
  FillColor = 0
  Circle (ws, h1 + hs + dh + hs + r1), r1 - 1, 0, -0.5 * pi, -pi
End Sub

Private Sub h1_Scroll()
  txth1 = h1
  Repaint
End Sub

Private Sub hs_Scroll()
  txths = hs
  Repaint
End Sub

Private Sub ws_Scroll()
  txtws = ws
  Repaint
End Sub

Private Sub dh_Scroll()
  txtdh = dh
  Repaint
End Sub

Private Sub r1_Scroll()
  txtr1 = r1
  Repaint
End Sub

