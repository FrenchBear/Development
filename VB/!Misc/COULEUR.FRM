VERSION 5.00
Begin VB.Form Feuille1 
   Appearance      =   0  'Flat
   BackColor       =   &H00000000&
   Caption         =   "Feuille1"
   ClientHeight    =   6090
   ClientLeft      =   930
   ClientTop       =   1575
   ClientWidth     =   6570
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
   LinkTopic       =   "Feuille1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6090
   ScaleWidth      =   6570
   Begin VB.HScrollBar Bleu 
      Height          =   252
      LargeChange     =   20
      Left            =   840
      Max             =   255
      TabIndex        =   6
      Top             =   2760
      Width           =   3132
   End
   Begin VB.HScrollBar Vert 
      Height          =   252
      LargeChange     =   20
      Left            =   840
      Max             =   255
      TabIndex        =   5
      Top             =   2400
      Width           =   3132
   End
   Begin VB.HScrollBar Rouge 
      Height          =   252
      LargeChange     =   20
      Left            =   840
      Max             =   255
      TabIndex        =   4
      Top             =   2040
      Width           =   3132
   End
   Begin VB.CommandButton Commande1 
      Appearance      =   0  'Flat
      BackColor       =   &H0000FFFF&
      Caption         =   "clic !"
      Height          =   852
      Left            =   720
      TabIndex        =   0
      Top             =   600
      Width           =   1452
   End
   Begin VB.Label Etiquette3 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Rouge"
      ForeColor       =   &H80000008&
      Height          =   192
      Left            =   240
      TabIndex        =   9
      Top             =   2040
      Width           =   564
   End
   Begin VB.Label Etiquette2 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Vert"
      ForeColor       =   &H80000008&
      Height          =   192
      Left            =   240
      TabIndex        =   8
      Top             =   2400
      Width           =   348
   End
   Begin VB.Label Etiquette1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      Caption         =   "Bleu"
      ForeColor       =   &H80000008&
      Height          =   192
      Left            =   240
      TabIndex        =   7
      Top             =   2760
      Width           =   384
   End
   Begin VB.Label EB 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "0"
      ForeColor       =   &H80000008&
      Height          =   252
      Left            =   4080
      TabIndex        =   1
      Top             =   2760
      Width           =   372
   End
   Begin VB.Label EV 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "0"
      ForeColor       =   &H80000008&
      Height          =   252
      Left            =   4080
      TabIndex        =   3
      Top             =   2400
      Width           =   372
   End
   Begin VB.Label ER 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "0"
      ForeColor       =   &H80000008&
      Height          =   252
      Left            =   4080
      TabIndex        =   2
      Top             =   2040
      Width           =   372
   End
End
Attribute VB_Name = "Feuille1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Bleu_Change()
  CCoul
  EB.Caption = Bleu.Value
End Sub

Private Sub Bleu_Scroll()
  Bleu_Change
End Sub

Private Sub CCoul()
  Feuille1.BackColor = RGB(Rouge.Value, Vert.Value, Bleu.Value)
End Sub

Private Sub Commande1_Click()
  Beep
  Commande1.Caption = " Bien !"
  Rouge.Value = 128
  Vert.Value = 128
  Bleu.Value = 0
End Sub

Private Sub Rouge_Change()
   CCoul
   ER.Caption = Rouge.Value
End Sub

Private Sub Rouge_Scroll()
   Rouge_Change
End Sub

Private Sub Vert_Change()
 CCoul
 EV.Caption = Vert.Value
End Sub

Private Sub Vert_Scroll()
  Vert_Change
End Sub
