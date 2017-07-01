VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "SujetsDangers"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de étapes/dangers
Private colSujetsDangers As New Collection

Public Function Add(ByVal Sujet As String, ByVal Danger As String, ByVal Nom As String, ByVal Criticité As Integer) As SujetDanger

Dim dNew As New SujetDanger

    With dNew
        .Sujet = Sujet
        .Danger = Danger
        .Nom = Nom
        .Criticité = Criticité
    End With
    colSujetsDangers.Add dNew
    Set Add = dNew
    
End Function



Public Function Count() As Long
    Count = colSujetsDangers.Count
End Function

Public Function Item(ByVal i As Variant) As SujetDanger
    Set Item = colSujetsDangers.Item(i)
End Function

Public Sub Delete(ByVal i As Variant)
    colSujetsDangers.Remove i
End Sub



