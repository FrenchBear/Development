VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ClasseARéveiller"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private WithEvents mFeuilleTest As FeuilleTest

Public Property Get FeuilleTest() As FeuilleTest
  Set FeuilleTest = mFeuilleTest
End Property

Public Property Set FeuilleTest(ByVal NewFeuilleTest As FeuilleTest)
  Set mFeuilleTest = NewFeuilleTest
End Property

Private Sub mFeuilleTest_Gong()
  MsgBox "Gong dans ClasseARéveiller !"
End Sub
