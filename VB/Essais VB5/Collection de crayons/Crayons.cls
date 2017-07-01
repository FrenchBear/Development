VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Crayons"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Collection de Cryon"
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"UserDefinedCollection"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private mcolCrayons As New Collection
'Pour déclencher cet événement, utilisez RaiseEvent avec la syntaxe suivante:
'RaiseEvent CountChanged[(arg1, arg2, ... , argn)]
Public Event CountChanged(Count As Long)
Attribute CountChanged.VB_Description = "Evénement déclenché quand le nombre d'éléments de la collection change"


Public Function Add(ByVal Couleur As String) As Crayon
  Dim craNew As New Crayon
  Static intCraNum As Integer
  
  With craNew
    .Couleur = Couleur
    .ID = "C" & Format(intCraNum, "00000")
    intCraNum = intCraNum + 1
    mcolCrayons.Add craNew, .ID
  End With
  RaiseEvent CountChanged(mcolCrayons.Count)
End Function

Public Function Count() As Long
  Count = mcolCrayons.Count
End Function

Public Sub Remove(ByVal Index As Variant)
  mcolCrayons.Remove Index
  RaiseEvent CountChanged(mcolCrayons.Count)
End Sub

Public Function Item(ByVal Index As Variant) As Crayon
Attribute Item.VB_UserMemId = 0
  Set Item = mcolCrayons(Index)
End Function

Public Function NewEnum() As IUnknown
Attribute NewEnum.VB_Description = "Enumérateur pour for each..."
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
  Set NewEnum = mcolCrayons.[_NewEnum]
End Function

Public Sub Clear()
Attribute Clear.VB_Description = "Efface la collection complète"
  If mcolCrayons.Count > 0 Then
    While mcolCrayons.Count > 0
      mcolCrayons.Remove 1
    Wend
    RaiseEvent CountChanged(0)
  End If
End Sub

Private Sub Class_Initialize()
  Debug.Print "Crayons.Class_Initialize"
End Sub

Private Sub Class_Terminate()
  Debug.Print "Crayons.Class_Terminate"
End Sub
