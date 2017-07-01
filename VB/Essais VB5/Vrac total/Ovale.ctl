VERSION 5.00
Begin VB.UserControl Ovale 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   PropertyPages   =   "Ovale.ctx":0000
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Shape Shape1 
      Height          =   495
      Left            =   1800
      Shape           =   2  'Oval
      Top             =   1560
      Width           =   1215
   End
End
Attribute VB_Name = "Ovale"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "PropPageWizardRun" ,"Yes"
Option Explicit

Public Tag2 As String
Attribute Tag2.VB_VarProcData = "PropriétésOvale"
Attribute Tag2.VB_VarDescription = "Tag géré directement par l'objet, mais pas exploité"

Sub APropos()
Attribute APropos.VB_Description = "Splendide fonction d'information sur le contrôle Ovale"
Attribute APropos.VB_UserMemId = -552
  MsgBox "Fonction APropos du contrôle Ovale"
End Sub

Private Sub UserControl_Resize()
  Shape1.Move 0, 0, Width, Height
End Sub
