VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Classe de test"
' Classe de test
' 17/02/98 PV

Option Explicit

Public a As Integer

Private Type MonType
  MaVariable As Integer
End Type

' Par défaut, enum publique
Enum MonEnum
  tstK1 = 1
End Enum

Sub Machin()
  Dim t As MonType
  t.MaVariable = 2
End Sub
