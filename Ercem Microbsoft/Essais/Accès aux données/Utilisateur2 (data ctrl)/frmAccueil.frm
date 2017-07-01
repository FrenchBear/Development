VERSION 5.00
Begin VB.Form frmAccueil 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnUtilisateur 
      Caption         =   "&Utilisateur"
      Height          =   495
      Left            =   3180
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
   Begin VB.Menu mnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
End
Attribute VB_Name = "frmAccueil"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmAccueil
' 4/12/97 PV

Option Explicit

Private Sub btnUtilisateur_Click()
  frmUtilisateur2.Show vbModal
End Sub

Private Sub cmdQuitter_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  InitBD
End Sub

Private Sub Form_Unload(Cancel As Integer)
  FinBD
End Sub





