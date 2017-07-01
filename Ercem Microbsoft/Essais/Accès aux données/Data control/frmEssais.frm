VERSION 5.00
Begin VB.Form frmEssais 
   Caption         =   "Essais ODBC"
   ClientHeight    =   5145
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6225
   LinkTopic       =   "Form1"
   ScaleHeight     =   5145
   ScaleWidth      =   6225
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnUnitéRD 
      Caption         =   "Unités + Utilisateurs RD"
      Height          =   495
      Left            =   2340
      TabIndex        =   5
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton btnTabRD 
      Caption         =   "Tableau Utilisateur2 RD"
      Height          =   495
      Left            =   2340
      TabIndex        =   4
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton btnUtilisateur2RD 
      Caption         =   "1 enreg Utilisateur2 RD"
      Height          =   495
      Left            =   2340
      TabIndex        =   3
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton btnUnité 
      Caption         =   "Unités + Utilisateurs"
      Height          =   495
      Left            =   360
      TabIndex        =   2
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton btnTab 
      Caption         =   "Tableau Utilisateur2"
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton btnUtilisateur2 
      Caption         =   "1 enreg Utilisateur2"
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "frmEssais"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmEssais
' Test de diverses grilles d'accès aux données
'  3/12/1997 PV

Option Explicit

Private Sub btnUtilisateur2_Click()
  frmUtilisateur2.Show vbModal
End Sub

Private Sub btnUtilisateur2RD_Click()
  frmUtilisateur2RD.Show vbModal
End Sub

Private Sub btnTab_Click()
  frmTabUtilisateur2.Show vbModal
End Sub

Private Sub btnTabRD_Click()
  frmTabUtilisateur2RD.Show vbModal
End Sub

Private Sub btnUnité_Click()
  frmUnité.Show vbModal
End Sub

Private Sub btnUnitéRD_Click()
  frmUnitéRD.Show vbModal
End Sub

