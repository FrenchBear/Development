VERSION 5.00
Begin VB.Form FeuilleTest 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtGong 
      Height          =   285
      Left            =   2880
      TabIndex        =   2
      Top             =   1800
      Width           =   1215
   End
   Begin Projet1.Ovale Ovale1 
      Height          =   1335
      Left            =   600
      TabIndex        =   1
      Top             =   720
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   2355
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Test individu"
      Height          =   495
      Left            =   2880
      TabIndex        =   0
      Top             =   840
      Width           =   1215
   End
End
Attribute VB_Name = "FeuilleTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public WithEvents Ind As Individu
Attribute Ind.VB_VarHelpID = -1

Event Gong()
Private mc1 As ClasseARéveiller

Private Sub Command1_Click()
  Set Ind = New Individu
  
  Ind.Identification "Pierre", "VIOLENT"
  Ind.SetDémoParts 32, 80000, "Novembre"
  MsgBox "Défaut: " & Ind
  Ind.ShowDémo
  Set Ind = Nothing
End Sub

Private Sub Form_Load()
  Set mc1 = New ClasseARéveiller
  Set mc1.FeuilleTest = Me
End Sub

Private Sub Ind_ChangeDeNom(ByVal sNouveauPrénom As String, ByVal sNouveauNom As String)
  Print "Ind_ChangeDeNom "; sNouveauPrénom; " "; sNouveauNom
End Sub

Private Sub Ind_Initialize()
  Print "Initialize"
End Sub

Private Sub Ind_Terminate()
  Print "Terminate"
End Sub

Private Sub txtGong_Change()
  RaiseEvent Gong
End Sub
