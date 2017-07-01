VERSION 5.00
Begin VB.UserControl ctlTest 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   PropertyPages   =   "ctlTest.ctx":0000
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Shape Shape1 
      Height          =   495
      Left            =   1380
      Shape           =   2  'Oval
      Top             =   840
      Width           =   1215
   End
End
Attribute VB_Name = "ctlTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' ctlTest
' Contrôle utilisateur de test
' 17/02/98 PV

Option Explicit

Public Enum UserCtlEnum
  ctlK1 = 1
End Enum
'Valeurs de propriétés par défaut:
Const m_def_BackColor = 0
'Variables de propriétés:
Dim m_BackColor As Long



Private Sub UserControl_Resize()
  Shape1.Move 0, 0, ScaleWidth, ScaleHeight
End Sub

Property Get Machin()
Attribute Machin.VB_Description = "Description de la propriété Machin"
Attribute Machin.VB_MemberFlags = "200"
  Machin = 2
End Property


