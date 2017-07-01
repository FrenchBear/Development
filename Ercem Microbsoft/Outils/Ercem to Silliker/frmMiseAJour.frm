VERSION 5.00
Begin VB.Form frmMiseAJour 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Mise à jour Ercem --> Silliker"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnAction 
      Caption         =   "Mise à jour"
      Height          =   495
      Left            =   2880
      TabIndex        =   0
      Top             =   1020
      Width           =   1215
   End
End
Attribute VB_Name = "frmMiseAJour"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnAction_Click()
  MiseAJourErcemToSilliker
End Sub
