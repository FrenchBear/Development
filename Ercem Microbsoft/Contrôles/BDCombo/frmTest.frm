VERSION 5.00
Begin VB.Form frmTest 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Test du contrôle BDCombo"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnPrintLI 
      Caption         =   "print ListIndex"
      Height          =   495
      Left            =   2460
      TabIndex        =   3
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton btnPerformances 
      Caption         =   "Performances"
      Height          =   495
      Left            =   840
      TabIndex        =   2
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton btnSet2 
      Caption         =   "Text=2"
      Height          =   495
      Left            =   2460
      TabIndex        =   1
      Top             =   1440
      Width           =   1215
   End
   Begin TestBDCombo.BDCombo BDC 
      Height          =   315
      Left            =   780
      TabIndex        =   0
      Top             =   780
      Width           =   2955
      _ExtentX        =   5212
      _ExtentY        =   556
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
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTest
' Test de BDCombo
' 23/01/98 PV

Option Explicit

Private Sub btnPerformances_Click()
  Dim i As Integer, t As Single
  t = Timer
  For i = 1 To 1000
    BDC.Text = (i Mod 20) + 1
    'BDC.Text = BDC.Text
    'BDC.Synchronise
  Next
  t = Timer - t
  Print Format(t, "0.00"); " s"
End Sub

Private Sub btnPrintLI_Click()
  Print BDC.ListIndex
End Sub

Private Sub btnSet2_Click()
  Print BDC.ListIndex
  BDC.Text = 2
End Sub

Private Sub Form_Load()
  BDC.AddItem 1, "Un"
  BDC.AddItem 2, "Deux"
  BDC.AddItem 3, "Trois"
  BDC.AddItem 4, "Quatre"
  BDC.AddItem 5, "Cinq"
  BDC.AddItem 6, "Six"
  BDC.AddItem 7, "Sept"
  BDC.AddItem 8, "Huit"
  BDC.AddItem 9, "Neuf"
  BDC.AddItem 10, "Dix"
  BDC.AddItem 11, "Onze"
  BDC.AddItem 12, "Douze"
  BDC.AddItem 13, "Treize"
  BDC.AddItem 14, "Quatorze"
  BDC.AddItem 15, "Quinze"
  BDC.AddItem 16, "Seize"
  BDC.AddItem 17, "Dix-sept"
  BDC.AddItem 18, "Dix-huit"
  BDC.AddItem 19, "Dix-neuf"
  BDC.AddItem 20, "Vingt"
End Sub

