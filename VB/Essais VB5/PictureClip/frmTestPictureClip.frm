VERSION 5.00
Object = "{27395F88-0C0C-101B-A3C9-08002B2F49FB}#1.1#0"; "PICCLP32.OCX"
Begin VB.Form frmTestPictureClip 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Essai du PictureClip"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5925
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   213
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   395
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "PaintPicture (Timer)"
      Height          =   495
      Left            =   4080
      TabIndex        =   5
      Top             =   2520
      Width           =   1215
   End
   Begin VB.PictureBox Picture2 
      Height          =   1935
      Left            =   4080
      ScaleHeight     =   125
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   96
      TabIndex        =   4
      Top             =   240
      Width           =   1500
   End
   Begin VB.PictureBox P2 
      Height          =   375
      Left            =   2160
      ScaleHeight     =   315
      ScaleWidth      =   555
      TabIndex        =   3
      Top             =   2160
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.PictureBox Picture1 
      Height          =   1935
      Left            =   2160
      ScaleHeight     =   125
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   96
      TabIndex        =   2
      Top             =   240
      Width           =   1500
   End
   Begin VB.CommandButton cmdPaintPicture 
      Caption         =   "PaintPicture (DoEvents)"
      Height          =   495
      Left            =   2160
      TabIndex        =   1
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "PictureClip"
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   2520
      Width           =   1215
   End
   Begin PicClip.PictureClip PC 
      Left            =   360
      Top             =   720
      _ExtentX        =   2646
      _ExtentY        =   3334
      _Version        =   327680
      Picture         =   "frmTestPictureClip.frx":0000
   End
   Begin VB.Image Img 
      Height          =   1935
      Left            =   360
      Top             =   240
      Width           =   1500
   End
End
Attribute VB_Name = "frmTestPictureClip"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdPaintPicture_Click()
  Dim i As Integer
  Dim t As Single
  
  Picture1.Cls
  For i = 100 To 0 Step -1
    Picture1.PaintPicture P2, i, 0
    DoEvents
  Next
End Sub

Private Sub Command1_Click()
  Dim i As Integer
  
  PC.ClipX = 0
  PC.ClipY = 0
  PC.ClipWidth = 100
  For i = 1 To 126
    PC.ClipHeight = i
    Img = PC.Clip
    DoEvents
    DoEvents
  Next
End Sub

Private Sub Command2_Click()
  Dim i As Integer
  Dim t As Single
  
  On Error GoTo fin   ' Si on ferme la fenêtre pendant le DoEvents...
  Picture2.Cls
  t = Timer
  Do
    i = Int((Timer - t) * 75)
    If i > 100 Then i = 100
    Picture2.PaintPicture P2, 100 - i, 0
    DoEvents
  Loop Until i = 100
fin:
End Sub

Private Sub Form_Load()
  P2.Picture = PC.Picture
End Sub
