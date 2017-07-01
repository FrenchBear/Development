VERSION 5.00
Begin VB.Form frmPlot 
   Caption         =   "Courbes Gn"
   ClientHeight    =   8325
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10995
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   8325
   ScaleWidth      =   10995
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtN 
      Height          =   315
      Left            =   4500
      TabIndex        =   12
      Top             =   420
      Width           =   1215
   End
   Begin VB.TextBox txtA 
      Height          =   315
      Left            =   4500
      TabIndex        =   10
      Top             =   60
      Width           =   1215
   End
   Begin VB.CommandButton btnDessiner 
      Caption         =   "&Dessiner"
      Default         =   -1  'True
      Height          =   375
      Left            =   6180
      TabIndex        =   0
      Top             =   60
      Width           =   1215
   End
   Begin VB.TextBox txtyMax 
      Height          =   315
      Left            =   2760
      TabIndex        =   9
      Top             =   420
      Width           =   1215
   End
   Begin VB.TextBox txtyMin 
      Height          =   315
      Left            =   2760
      TabIndex        =   7
      Top             =   60
      Width           =   1215
   End
   Begin VB.TextBox txtxMax 
      Height          =   315
      Left            =   720
      TabIndex        =   5
      Top             =   420
      Width           =   1215
   End
   Begin VB.TextBox txtxMin 
      Height          =   315
      Left            =   720
      TabIndex        =   3
      Top             =   60
      Width           =   1215
   End
   Begin VB.PictureBox pic 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   7335
      Left            =   60
      ScaleHeight     =   7305
      ScaleWidth      =   10845
      TabIndex        =   1
      Top             =   900
      Width           =   10875
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "N :"
      Height          =   210
      Left            =   4140
      TabIndex        =   13
      Top             =   480
      Width           =   270
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "a :"
      Height          =   210
      Left            =   4140
      TabIndex        =   11
      Top             =   120
      Width           =   255
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "yMax :"
      Height          =   210
      Left            =   2100
      TabIndex        =   8
      Top             =   480
      Width           =   615
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "yMin :"
      Height          =   210
      Left            =   2100
      TabIndex        =   6
      Top             =   120
      Width           =   555
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "xMax :"
      Height          =   210
      Left            =   60
      TabIndex        =   4
      Top             =   480
      Width           =   615
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "xMin :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   120
      Width           =   555
   End
End
Attribute VB_Name = "frmPlot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim xMin As Double, xMax As Double
Dim yMin As Double, yMax As Double
Dim x As Double, y As Double

Const N0 = 289
Const LONGUEUR = 1
Const Pi As Double = 3.14159265358979
Const A0 As Double = Pi

Private Sub Form_Load()
  txtA = A0
  txtN = N0
End Sub


Private Sub btnDessiner_Click()
  btnDessiner.Enabled = False
  
  xMin = -10
  xMax = 10
  yMin = -10
  yMax = 10
  
  Dim A As Double
  Dim NP As Long
  A = txtA
  NP = txtN
  
  Dim rpic As Double, rech As Double
  Dim rpic2 As Double, rech2 As Double
restart:
  ' Echelle orthonormée
  rpic = pic.Width / pic.Height         ' ratio de la zone physique de tracé
  rech = (xMax - xMin) / (yMax - yMin)  ' ratio de l'échelle logique actuelle
  ' Les deux ratios doivent être identiques
  If rech < rpic Then                   ' on dilate les x
    Dim d As Double
    d = rpic * (yMax - yMin) - (xMax - xMin)
    xMax = xMax + d / 2
    xMin = xMin - d / 2
  Else                                  ' on dilate les y
    d = (xMax - xMin) / rpic - (yMax - yMin)
    yMax = yMax + d / 2
    yMin = yMin - d / 2
  End If
  
  ' Contrôle de sécurité
  rpic2 = pic.Width / pic.Height
  rech2 = (xMax - xMin) / (yMax - yMin)
  If Abs(rech2 - rpic2) > 0.001 Then Stop
  
  pic.Refresh
  pic.Cls
  pic.Scale (xMin, yMax)-(xMax, yMin)
  pic.Line (xMin, 0)-(xMax, 0)
  pic.Line (0, yMin)-(0, yMax)
  
  
  txtxMin = xMin
  txtxMax = xMax
  txtyMin = yMin
  txtyMax = yMax
  
  ' Origine
  x = 0
  y = 0
  
  Dim n As Long
  Dim x1 As Double, y1 As Double
  Dim xn As Double
  For n = 1 To NP
    xn = A * n ^ 2
    x1 = x + LONGUEUR * Cos(2 * Pi * xn)
    y1 = y + LONGUEUR * Sin(2 * Pi * xn)
    
    If x1 > xMax Then
      xMax = xMax + (xMax - xMin) / 4
      GoTo restart
    End If
    If x1 < xMin Then
      xMin = xMin - (xMax - xMin) / 4
      GoTo restart
    End If
    If y1 > yMax Then
      yMax = yMax + (yMax - yMin) / 4
      GoTo restart
    End If
    If y1 < yMin Then
      yMin = yMin - (yMax - yMin) / 4
      GoTo restart
    End If
    
    pic.Line (x, y)-(x1, y1)
    x = x1
    y = y1
  Next
  
  btnDessiner.Enabled = True
End Sub

