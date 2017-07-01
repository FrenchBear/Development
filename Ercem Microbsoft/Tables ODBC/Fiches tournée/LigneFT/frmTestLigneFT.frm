VERSION 5.00
Object = "*\ALigneFT.vbp"
Begin VB.Form frmTestLigneFT 
   Caption         =   "Test contrôle LigneFT"
   ClientHeight    =   2040
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7485
   LinkTopic       =   "Form1"
   ScaleHeight     =   2040
   ScaleWidth      =   7485
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Height          =   555
      Left            =   1680
      Picture         =   "frmTestLigneFT.frx":0000
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   3
      Top             =   1380
      Width           =   555
   End
   Begin VB.TextBox txtAprès 
      Height          =   315
      Left            =   120
      TabIndex        =   2
      Text            =   "Après"
      Top             =   1560
      Width           =   1215
   End
   Begin prjLigneFT.LigneFT LigneFT1 
      Height          =   735
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   7035
      _ExtentX        =   12409
      _ExtentY        =   1296
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.TextBox txtAvant 
      Height          =   315
      Left            =   120
      OLEDropMode     =   2  'Automatic
      TabIndex        =   0
      Text            =   "Avant"
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmTestLigneFT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub LigneFT1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Beep
  LigneFT1.OLEDrag
End Sub

Private Sub LigneFT1_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
  AllowedEffects = 3
  Data.Clear
  Data.SetData "PING", vbCFText
End Sub


Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Beep
  Picture1.OLEDrag
End Sub

Private Sub Picture1_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
  AllowedEffects = 3
  Data.Clear
  Data.SetData "ZAP", vbCFText
End Sub

