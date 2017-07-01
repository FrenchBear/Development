VERSION 5.00
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Align           =   1  'Align Top
      Height          =   510
      Left            =   0
      ScaleHeight     =   450
      ScaleWidth      =   4620
      TabIndex        =   0
      Top             =   0
      Width           =   4680
      Begin VB.CommandButton btnNew 
         Caption         =   "New"
         Height          =   375
         Left            =   50
         TabIndex        =   1
         Top             =   50
         Width           =   615
      End
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdNouveau 
         Caption         =   "&Nouveau"
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuFenêtres 
      Caption         =   "Fe&nêtres"
      WindowList      =   -1  'True
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnNew_Click()
  cmdNouveau_Click
End Sub

Private Sub cmdNouveau_Click()
  Dim f As Form1
  Set f = New Form1
  f.Visible = True
End Sub

Private Sub cmdQuitter_Click()
  Unload Me
End Sub
